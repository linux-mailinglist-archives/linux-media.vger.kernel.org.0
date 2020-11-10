Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD622AD34E
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 11:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgKJKRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 05:17:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgKJKR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 05:17:29 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 673A3C0613CF
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 02:17:29 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 61F22C6398; Tue, 10 Nov 2020 10:17:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1605003447; bh=dLSf2iC5vmH/166R59kNeYN3030PMwIKUuK87+FRvIY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XtubxTJNjouMCPqptQ6uJm1P463ZRBQdaV+MsrtBIOjkj+bPrjKvZk5Hb0u87H9Eq
         lHAvw5Zq202sUZDyojG/nkDYZqEfYRStwOa8JqFeVI4DsWuGDyhqqdxyKnZZcME051
         BqXe3nvCUv+ng4Y6yyr5GMtK5r5FYMfla3OCaWJAFvfC2yyAoeCCg7hmWAIeDNHy2Q
         GIFwD6H3XscN8VeyGOdJO/6g9qgz2Kw3M0LfrjzEj7ClWD3oVDJw5Ea2sJExwQAQ+7
         0+VXasYSEsHre68EH17T+d8m12l0Rqgnmpq/XfDSoOvAv4IOJ434qw6LFo5uZ0dVOK
         G9OSCmH06+isg==
Date:   Tue, 10 Nov 2020 10:17:27 +0000
From:   Sean Young <sean@mess.org>
To:     Michael Klein <michael@fossekall.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH RESEND v2 0/2] media: rc: gpio-ir-recv: add timeout
 property
Message-ID: <20201110101727.GA26198@gofer.mess.org>
References: <cover.1604589023.git.michael@fossekall.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1604589023.git.michael@fossekall.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 09, 2020 at 04:23:09PM +0100, Michael Klein wrote:
> The default recorder timeout of 125ms is too high for some BPF protocol 
> decoders when a remote sends repeat codes at high rates. This makes the 
> timeout configurable via the devicetree.

To be honest, 125ms is too much by any measurement. The longest space
in any protocol I'm aware of is 40ms in the sharp ir protocol. I think
changing IR_DEFAUL_TIMEOUT to something like 50ms would make sense.

Also, when an BPF protocol is loaded, user-space can set the timeout
with the LIRC_SET_REC_TIMEOUT ioctl which can depend on the protocol
(set to longest space + 10ms error margin). This would mean that the
bare minimum timeout can be set, which means decoding is as responsive
as can be.

I'm not sure that device tree is really the place for this.

Thanks,

Sean


> 
> Changes in v2:
>   fix checkpatch.pl warnings
> 
> Michael Klein (2):
>   media: rc: gpio-ir-recv: add recorder timeout property
>   media: bindings: media: gpio-ir-receiver: add linux,timeout-us
>     property
> 
>  .../devicetree/bindings/media/gpio-ir-receiver.txt          | 3 +++
>  Documentation/devicetree/bindings/media/rc.yaml             | 6 ++++++
>  drivers/media/rc/gpio-ir-recv.c                             | 3 ++-
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> -- 
> 2.28.0
