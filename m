Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93162479B4A
	for <lists+linux-media@lfdr.de>; Sat, 18 Dec 2021 15:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbhLROX6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Dec 2021 09:23:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233378AbhLROX5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Dec 2021 09:23:57 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53775C061574
        for <linux-media@vger.kernel.org>; Sat, 18 Dec 2021 06:23:57 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id v15so8037316ljc.0
        for <linux-media@vger.kernel.org>; Sat, 18 Dec 2021 06:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CvTtauU5QJKhtbliQVkJhZB2YO0CtHSQ/ppnMrZZj9s=;
        b=cBapg+0NJhs9rVH+r5pgSfW38BzWcHCELIN1GtxQGbLuNJA3WKGearxT+qmn11u0xj
         X3SzreFLppiAzQuffsv9/uWBoomUuCq9xqR/cvTAoecN51VOfagxI8/MZJkmfAkKPZNL
         w88CdgU3MmNk6KtWIrm7apd213mFE2DvwbQ3M1UosSpt443gNkguf5E7v9tFNcCThw/I
         m/029om1lZZ6VLAg5Aw+LzgWLTfwcfoSoLHn2P5Ey32j4qiKElMWXWEKu9k5cI4pEcJz
         /zzSoDBSXeiSavw8VTpyql0I5Hqbs7d+52XLgdfQAVbXJyb4UvriEIHorx6HtYgGJFyw
         dgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CvTtauU5QJKhtbliQVkJhZB2YO0CtHSQ/ppnMrZZj9s=;
        b=3SugKdiJ+NFYVCGjNwMI1+amgsm2YEPoNHRjQqKszoovHMJKMUotJlhaxA7fDFsiD1
         89DpT6hvxJ2oGA9BEuxP3zTKqr9tjLIVCkO3/HTbun7rUjaCwMiA8pLspv22Ui/2sJ52
         A1XHnJeuox5p9nNu95aLsfM7Es/NZDzEbkEQoCbv52YiXBsG56aSmCPPzHoKEwWQoQQI
         PDeRtXtgCkZQjARld3airW0e+qJWye0ft5SzAU8QGNm1ERmc+nCT0AMT8UhFHs7N/PlA
         wh0Aq3pt6Ktkyzto9i9EiEpWT+f+M2uSS5P9Mzg+Smlbsj1XIiM3GyWzFyzLW6QvsHDN
         m27g==
X-Gm-Message-State: AOAM532kifb62c5Dewdu9pqf6PpYmBMEWHp5QMu7q6XK8ORcFWaZi/tR
        ZxGjs6mamG6reSRb/38Jbg4SkX2eYJFIrg==
X-Google-Smtp-Source: ABdhPJzk0gW3ldl6gCR8lJ9HORNOxPk+Vf07TnNmjC1PWlpTxyeQRzd05r6S9zDDDTyDGu0fg4NCfw==
X-Received: by 2002:a2e:7a06:: with SMTP id v6mr6894200ljc.198.1639837435391;
        Sat, 18 Dec 2021 06:23:55 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.239])
        by smtp.gmail.com with ESMTPSA id y11sm2000785ljd.117.2021.12.18.06.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Dec 2021 06:23:54 -0800 (PST)
Message-ID: <45306193-deec-d1a3-d74d-41dc361b36d9@gmail.com>
Date:   Sat, 18 Dec 2021 17:23:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge WinTV
 dualHD
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?Q?Maximilian_B=c3=b6hm?= <maximilian.boehm@elbmurf.de>
Cc:     hverkuil-cisco@xs4all.nl, sashal@kernel.org,
        linux-media@vger.kernel.org, Brad Love <brad@nextdimension.cc>
References: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
 <20211218101519.756c027d@coco.lan>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211218101519.756c027d@coco.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/18/21 12:15, Mauro Carvalho Chehab wrote:
> Em Sat, 18 Dec 2021 02:09:46 +0100
> Maximilian Böhm <maximilian.boehm@elbmurf.de> escreveu:
> 
>> Hello Paul and the other people involved,
>> 
>> I’m a user of a Hauppauge WinTV dualHD DVB-T2 USB card and experiencing a bug since Linux 5.15.3 of which kernel bisecting brought me to a commit by you from Juli 29: "media: em28xx: add missing em28xx_close_extension".
> 
> 
> So, basically this changeset: 2c98b8a3458d ("media: em28xx: add missing em28xx_close_extension")
> 
>> My problem: This TV stick doesn’t work for me after a wake up from a system standby, so I have to use the little helper tool usbreset to reset its USB connection.
> 
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

First of all I want to apologize for introducing this bug. I don't have 
any em28xx devices and I've only tested with syzbot reproducer.

I can't say much about task hung bug, because I am not an expert in 
em28xx driver, but I have an idea about NULL deref (which is in attached 
dmesg on bugzilla page)

> [  108.755526] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [  108.755529] #PF: supervisor read access in kernel mode
> [  108.755530] #PF: error_code(0x0000) - not-present page
> [  108.755532] PGD 0 P4D 0  
> [  108.755534] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [  108.755535] CPU: 12 PID: 28104 Comm: usbreset Not tainted 5.16.0-rc3-1-mainline #1 5300773575872a1d8fb5e17c51f4b15320e5794c
> [  108.755538] Hardware name: System manufacturer System Product Name/ROG STRIX X570-E GAMING, BIOS 1407 02/24/2020
> [  108.755539] RIP: 0010:__list_del_entry_valid+0x25/0xc0
> [  108.755545] RSP: 0018:ffffb26a8b67bc70 EFLAGS: 00010217
> [  108.755547] RAX: dead000000000122 RBX: ffffffffc11ea000 RCX: 0000000000000000
> [  108.755548] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff92c9d82081e8
> [  108.755549] RBP: ffff92c9d8208000 R08: 0000000000000000 R09: 0000000000000000
> [  108.755550] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffffc11ea0d0
> [  108.755551] R13: ffff92c9d50ea400 R14: ffff92c9d50ea430 R15: ffff92c9d50ea400
> [  108.755552] FS:  00007f9ce9bd4580(0000) GS:ffff92d0bed00000(0000) knlGS:0000000000000000
> [  108.755553] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  108.755555] CR2: 0000000000000000 CR3: 00000003cc740000 CR4: 0000000000350ee0
> [  108.755556] Call Trace:
> [  108.755558]  <TASK>
> [  108.755561]  em28xx_close_extension+0x64/0xb0 [em28xx e547aa2f945c8b78712225f6e5e1ca6a1015473f]
> [  108.755569]  em28xx_usb_disconnect.cold+0x82/0xbb [em28xx e547aa2f945c8b78712225f6e5e1ca6a1015473f]
> [  108.755574]  usb_unbind_interface+0x87/0x280


Looks like missing INIT_LIST_HEAD() somewhere, because all devices are 
kzalloced.

Something like this may work

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c 
b/drivers/media/usb/em28xx/em28xx-cards.c
index b207f34af5c6..c303a95e845a 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3936,6 +3936,7 @@ static int em28xx_usb_probe(struct usb_interface 
*intf,
  	dev->is_audio_only = has_vendor_audio && !(has_video || has_dvb);
  	dev->has_video = has_video;
  	dev->ifnum = ifnum;
+	INIT_LIST_HEAD(&dev->devlist);

  	dev->ts = PRIMARY_TS;
  	snprintf(dev->name, 28, "em28xx");




With regards,
Pavel Skripkin
