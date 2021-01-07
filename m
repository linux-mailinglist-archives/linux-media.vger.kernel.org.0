Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F032ED332
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 16:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbhAGPFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 10:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbhAGPFd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 10:05:33 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA28C0612F4
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 07:04:53 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 96B18C6378; Thu,  7 Jan 2021 15:04:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1610031889; bh=qzhj+WHJBAQUUVGfftvBVYLo2ZV+Gb02Ou0iytKdJe4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kpg0aYmXdklf46xKq85X2PohjdzkWGuJP45t64qqLw5fo93goAdF3beL5uUV9Nko4
         +fb58MHINQLdS+VZP1KuZ9JQLhGHHVcXkmT4nciIbG6zi0iJoARswF0ytTmj6klNta
         MM/v9WS13+H/zq+UEX/lQAueMzraGf+xSHzBS2FVdSR4lCgtvcIvvDsrIoUuvyKQQx
         VAuPN1pw6cW0eWvaEfHrLaQCHLaa162FvS6lKrIyUBhBwhuXdnsiTyC3kAzmlzGCIN
         HpZwWqKWkLU/w/b+jE3cenbFYFct77HpCmkmcKDXxrsRhYMFTtH9PASMX9C9Vt7des
         RRsFW65IBXnBQ==
Date:   Thu, 7 Jan 2021 15:04:49 +0000
From:   Sean Young <sean@mess.org>
To:     tom@tomdaley.org
Cc:     linux-media@vger.kernel.org
Subject: Re: lirc serial_ir homebrew breakage
Message-ID: <20210107150449.GA19336@gofer.mess.org>
References: <4d2b514731852e392be29048ff2e2cf3@tomdaley.org>
 <20210107102557.GA16279@gofer.mess.org>
 <3449ade8bbd996a34b2b73f57cd2757b@tomdaley.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3449ade8bbd996a34b2b73f57cd2757b@tomdaley.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 07, 2021 at 07:47:02AM -0700, tom@tomdaley.org wrote:
> On 2021-01-07 03:25, Sean Young wrote:
> > One issue has already been found in this change, which hasn't been
> > upstreamed
> > yet:
> > 
> > https://patchwork.linuxtv.org/project/linux-media/patch/20210105093023.5212-1-hias@horus.com/
> > 
> > Would you mind testing this patch out please?
> > 
> > Admittedly I'm not convinced that this is the problem though. I'm not
> > sure
> > what is; the function frbwrite() contains two if statements to filter
> > out
> > noise, maybe something is wrong there. You could try by commenting those
> > two if statements out and see if there is a problem there.
> > 
> > Your help is appreciated!
> > 
> > Thanks,
> > 
> > Sean
> 
> Hi Sean,
> 
> The patch fixes the problem I was seeing.  I have tested both receive and
> transmit on my homebrew IR, both are working.

Perfect, thank you very much. The patch should make its way into the stable
tree (at some point).


Sean
