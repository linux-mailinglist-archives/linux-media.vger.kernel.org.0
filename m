Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38E42ECDBD
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 11:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbhAGK0k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 05:26:40 -0500
Received: from gofer.mess.org ([88.97.38.141]:57009 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbhAGK0k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Jan 2021 05:26:40 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 17BF5C63F3; Thu,  7 Jan 2021 10:25:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1610015158; bh=9CuBVOebRbozLQRzsJ5exwVzxMUkU6hrREEoNSmOaFY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BHrSqGMRtdhsljV6GuYYDsFckFzDdwtv0hp7tV/y6pYldChILD9hJqwghrv2fFGZv
         kSn6jEtpGztC5+5+yaOCeXBp5eQuGVrFhbAR9C1i/UYZMU0fvgEMHiWzUGlVby1kxW
         idqVNQyqDqpzdiRiYKcmhRnJi5qCu+mTU3E7Z8khaNkBfp8H0jhXhiSdtz8GpholUM
         8S+Cy4+gbQUfF/Mq5vYChhu7Tfaz7S5SjaMcKqqmZWw9Y4AbeRiyL0MgC89KxHSPcL
         Zz5Rq6bsVW9ogITUljrPmbXkl0G/EE0z8LpQMJ871uQ22NwBmxu/zg9wBquyKIGxTf
         fY3dRkLEvnoiA==
Date:   Thu, 7 Jan 2021 10:25:57 +0000
From:   Sean Young <sean@mess.org>
To:     tom@tomdaley.org
Cc:     linux-media@vger.kernel.org
Subject: Re: lirc serial_ir homebrew breakage
Message-ID: <20210107102557.GA16279@gofer.mess.org>
References: <4d2b514731852e392be29048ff2e2cf3@tomdaley.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d2b514731852e392be29048ff2e2cf3@tomdaley.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tom,

On Wed, Jan 06, 2021 at 09:16:31AM -0700, tom@tomdaley.org wrote:
> Hi,
> 
> An upgrade from linux-5.9.16 to linux-5.10.4 results in lirc not working
> with my homebrew IR receiver.  Running mode2 and pressing the same button on
> the IR remote shows timing differences:
> 
> 5.9.16 works, first few lines of output:
> 
> pulse 2676
> space 371
> pulse 1429
> space 371
> pulse 827
> space 372
> pulse 1426
> space 372
> pulse 1425
> space 376
> pulse 1424
> space 374
> 
> 5.10.4 fail
> pulse 2670
> space 380
> pulse 1428
> space 372
> pulse 827
> pulse 125391  <---
> space 127128  <---
> pulse 1406
> space 394
> pulse 1407
> pulse 125394  <---
> space 126726  <---
> pulse 1400
> space 398
> pulse 1406
> space 394
> pulse 801
> 
> The reporting of two pulses in a row as well as the large time reported make
> it so the button presses are not recognized.
> 
> Is this a known issue?

No, this is not known issue.

> I am a software developer and would be happy to help in any way.  I can
> gather more data or attempt to fix it myself.

Thanks for your bug report. In 5.10, there was a change which converted
the processing from nanoseconds to microsecondes, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=528222d853f9283110f0118dd71d9f0ad686d586

One issue has already been found in this change, which hasn't been upstreamed
yet:

https://patchwork.linuxtv.org/project/linux-media/patch/20210105093023.5212-1-hias@horus.com/

Would you mind testing this patch out please?

Admittedly I'm not convinced that this is the problem though. I'm not sure
what is; the function frbwrite() contains two if statements to filter out
noise, maybe something is wrong there. You could try by commenting those
two if statements out and see if there is a problem there.

Your help is appreciated!

Thanks,

Sean
