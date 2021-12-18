Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5D2479E1F
	for <lists+linux-media@lfdr.de>; Sun, 19 Dec 2021 00:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbhLRXTm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Dec 2021 18:19:42 -0500
Received: from mout-p-102.mailbox.org ([80.241.56.152]:15446 "EHLO
        mout-p-102.mailbox.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbhLRXTl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Dec 2021 18:19:41 -0500
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:105:465:1:4:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4JGhdS0bR7zQkkP;
        Sun, 19 Dec 2021 00:19:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elbmurf.de; s=MBO0001;
        t=1639869577;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9SgjhS7axJwDjchYi5ZR3b7G60JJhLd1ec9fmd69YB4=;
        b=zgWUVgGk1Q2zkKpSYaZuqE9lBKdGwEqk0/hpxRWFLBQz45knSG38hQYJefS7+kfsCTxyjX
        X9PqzyTRV1dLLH7PQ7f5CtRJwxx1TwRaJZU0aZh5qclCCXeUb8fFUS3kK5HPxq4lm/IDzB
        IMIcRPZ2wBuw+5feaMSVrFCfqH/YdMxaqVfaqyPTdcvtXS9kx2HJrIASEWVnQ3zYo3Q3ba
        jH7ba1zZfB625hxtS2n3aDSXvl2To9yP2ywKyOU0bp4Z9QPy1Zm5xx0aH+LuPaNKuvet+E
        GvHdR5pc2LZQDkrZSlPiuIng9hnK3gmpbVz04UJojKL6jcIXxOUUngraf+QVIg==
Message-ID: <7f93fd6a-7caf-6def-b197-57b7e8da1270@elbmurf.de>
Date:   Sun, 19 Dec 2021 00:19:34 +0100
MIME-Version: 1.0
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge WinTV
 dualHD
Content-Language: de-DE
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     paskripkin@gmail.com, hverkuil-cisco@xs4all.nl, sashal@kernel.org,
        linux-media@vger.kernel.org, Brad Love <brad@nextdimension.cc>
References: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
 <20211218101519.756c027d@coco.lan>
From:   =?UTF-8?Q?Maximilian_B=c3=b6hm?= <maximilian.boehm@elbmurf.de>
In-Reply-To: <20211218101519.756c027d@coco.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

I’m sorry but I cannot get this patch to compile up to the end.

Best regards
Maximilian

Am 18.12.21 um 10:15 schrieb Mauro Carvalho Chehab:
> Em Sat, 18 Dec 2021 02:09:46 +0100
> Maximilian Böhm <maximilian.boehm@elbmurf.de> escreveu:
>
>> Hello Paul and the other people involved,
>>
>> I’m a user of a Hauppauge WinTV dualHD DVB-T2 USB card and experiencing a bug since Linux 5.15.3 of which kernel bisecting brought me to a commit by you from Juli 29: "media: em28xx: add missing em28xx_close_extension".
>
> So, basically this changeset: 2c98b8a3458d ("media: em28xx: add missing em28xx_close_extension")
>
>> My problem: This TV stick doesn’t work for me after a wake up from a system standby, so I have to use the little helper tool usbreset to reset its USB connection.
> What such patch should be doing is to ensure that the drivers will
> do the right thing when the device is removed (or unbound).
>
> It shouldn't have been called during suspend/resume. While this bug
> should be fixed, the issue with suspend/resume callbacks also seem
> to require additional work.
>
> Now, I dunno what a "usbreset" tool would be doing, but I'm assuming
> that it will be doing a unbind/bind sequence.
>
>> But if I try this after Linux 5.15.3, I get a severe kernel error in dmesg, system hangs and I’m unable to proper reboot or shutdown. I have reported this on the kernel Bugzilla, including a dmesg log: https://bugzilla.kernel.org/show_bug.cgi?id=215241
> Such patch should actually be fixing a use-after-free on disconnect.
>
> Anyway, could you please try the enclosed patch?
>
>> I hope you have an idea about how to stop this problem from occurring and I‘m willing to help testing a fix.
>> Another thinkable fix would be to directly fix this TV stick’s standby-wake-up problem but I’m not savvy enough to determine if this would be the better option than to fix this hanging issue.
> Yeah, that would be the best. Unfortunately, right now, I don't have
> any dual DVB-T em28xx-based board to test.
>
> Thanks,
> Mauro
>
> [PATCH] media: em28xx: close exension first at dev_next
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
> index b451ce3cb169..08f34a8aab5e 100644
> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> @@ -4148,13 +4148,12 @@ static void em28xx_usb_disconnect(struct usb_interface *intf)
>   
>          flush_request_modules(dev);
>   
> -       em28xx_close_extension(dev);
> -
>          if (dev->dev_next) {
>                  em28xx_close_extension(dev->dev_next);
>                  em28xx_release_resources(dev->dev_next);
>          }
>   
> +       em28xx_close_extension(dev);
>          em28xx_release_resources(dev);
>   
>          if (dev->dev_next) {
>
