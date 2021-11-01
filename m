Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0009E441463
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 08:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhKAHwo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 03:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhKAHwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 03:52:44 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119C6C061714;
        Mon,  1 Nov 2021 00:50:11 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c28so34622824lfv.13;
        Mon, 01 Nov 2021 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=IRCKDSoPPRLsc7H2Z6nQPWP4iVyUPXubmxyvNEA5rI0=;
        b=dsqZN4PBWJyxFEaXn7FXgekAJ1DOQNyxupzkaah3dt8huwovccjrdycge6QLYpmAAq
         fsYtWxmEsQclncmM7MC/geFbQXlYqTs1cRpSnF/EaukNypAI32n207ePuKc+t1kOxeYZ
         e5Xh52V2FwYkc4gyy/nruHf1CTOGYEjUjtny6As1xPr+AKvKvcsQNukSQc7sFA22MTvO
         VuH4ZWbb+omBHwN4fIzL1Pfbrgo6SAYrV+WhcZa4aZXWuXKDvs402nKwCcExSiJDHXUl
         NnC97rSdL4HCQ+9CptNQE5J07xfB3ICRMBP+hnBIWQU8kT2sGlVzQU4oGLPQsJoBWxdJ
         Vc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=IRCKDSoPPRLsc7H2Z6nQPWP4iVyUPXubmxyvNEA5rI0=;
        b=37nZXzb7FtgQjJ1WCjHkIa+2mdOyjgx42SnFyq7RY5ROmJNdKJik7ELtoUW0daLCuY
         GPP64Cj/TO9XKIGeZh8k6T+ASjMCMC0WKpwFaoc9pB3zPLibrE9nTLuthhMs2ZUcKfkj
         vP6uD9r1BQoBJot+mzLANh4RVFdtFcVxhObX5zgtkuR7xuniPBVEvLxDC96p26UUaRwD
         iy1uP6KtzFpnz/1AF/hAOXAjIO2U585wvNhGXUstVDVi5trIL/7yQQmvrbylOhw8wCli
         3sX2V8hLsjIhinoJHepbKKlaoOI/yfGudUFXILPxQck9WAH4vsTCyu45ODYc1xlbcmDE
         b4dg==
X-Gm-Message-State: AOAM532tp3xW/1LAcG7a2gfjGkZphc8ZHENcJMa/g5empwsHW4p4Zehk
        btzJronnIWDsnbjjUxulzpM=
X-Google-Smtp-Source: ABdhPJyvV/fV5urnhVITHAZ6sJYe9H0BUB5MKg0fKDsWD8zDEH8bdaAix3RULXiznhFNXCW8sURQMQ==
X-Received: by 2002:a05:6512:3e14:: with SMTP id i20mr15810620lfv.374.1635753009385;
        Mon, 01 Nov 2021 00:50:09 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.235.8])
        by smtp.gmail.com with ESMTPSA id z9sm1332856lfb.252.2021.11.01.00.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 00:50:08 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------3qYvw9nx8IfEJ0aqiIMk0026"
Message-ID: <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com>
Date:   Mon, 1 Nov 2021 10:50:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Need help in debugging "memory leak in em28xx_init_dev"
Content-Language: en-US
To:     Dongliang Mu <mudongliangabcd@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------3qYvw9nx8IfEJ0aqiIMk0026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/21 06:02, Dongliang Mu wrote:
> Hi all,
> 
> My local syzkaller instance found one bug named "memory leak in
> em28xx_init_dev" in 5.14-rc5. Kernel configuration and PoC file are
> attached(I don't check if the latest kernel is vulnerable, but it
> should be). The trace from memleak is as follows:
> 
> backtrace:
>      [<ffffffff842cc66d>] kmalloc include/linux/slab.h:591 [inline]
>      [<ffffffff842cc66d>] kzalloc include/linux/slab.h:721 [inline]
>      [<ffffffff842cc66d>] em28xx_media_device_init
> drivers/media/usb/em28xx/em28xx-cards.c:3444 [inline]
>      [<ffffffff842cc66d>] em28xx_init_dev.isra.0+0x366/0x9bf
> drivers/media/usb/em28xx/em28xx-cards.c:3624
>      [<ffffffff842cd1bd>] em28xx_usb_probe.cold+0x4f7/0xf95
> drivers/media/usb/em28xx/em28xx-cards.c:3979
>      [<ffffffff82bf0815>] usb_probe_interface+0x185/0x350
> drivers/usb/core/driver.c:396
> 


Looks like missing clean up on error handling path.

->probe()
     em28xx_init_dev()
       em28xx_media_device_init() <- dev->media_dev allocated
       *error somewhere in em28xx_init_dev()*


And then nothing unwinds em28xx_media_device_init() call, since 
disconnect won't be called in case of failure in ->probe()


Just build tested, but, I guess, something like this should work.



With regards,
Pavel Skripkin




--------------3qYvw9nx8IfEJ0aqiIMk0026
Content-Type: text/plain; charset=UTF-8; name="ph"
Content-Disposition: attachment; filename="ph"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdXNiL2VtMjh4eC9lbTI4eHgtY2FyZHMuYyBi
L2RyaXZlcnMvbWVkaWEvdXNiL2VtMjh4eC9lbTI4eHgtY2FyZHMuYwppbmRleCBjMWUwZGNj
Yjc0MDguLmYyMmU1Y2EyZDFiMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS91c2IvZW0y
OHh4L2VtMjh4eC1jYXJkcy5jCisrKyBiL2RyaXZlcnMvbWVkaWEvdXNiL2VtMjh4eC9lbTI4
eHgtY2FyZHMuYwpAQCAtMzYyNiw3ICszNjI2LDcgQEAgc3RhdGljIGludCBlbTI4eHhfaW5p
dF9kZXYoc3RydWN0IGVtMjh4eCAqZGV2LCBzdHJ1Y3QgdXNiX2RldmljZSAqdWRldiwKIAlp
ZiAoZGV2LT5pc19hdWRpb19vbmx5KSB7CiAJCXJldHZhbCA9IGVtMjh4eF9hdWRpb19zZXR1
cChkZXYpOwogCQlpZiAocmV0dmFsKQotCQkJcmV0dXJuIC1FTk9ERVY7CisJCQlnb3RvIGRl
aW5pdF9tZWRpYTsKIAkJZW0yOHh4X2luaXRfZXh0ZW5zaW9uKGRldik7CiAKIAkJcmV0dXJu
IDA7CkBAIC0zNjQ1LDcgKzM2NDUsNyBAQCBzdGF0aWMgaW50IGVtMjh4eF9pbml0X2Rldihz
dHJ1Y3QgZW0yOHh4ICpkZXYsIHN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2LAogCQlkZXZfZXJy
KCZkZXYtPmludGYtPmRldiwKIAkJCSIlczogZW0yOHh4X2kyY19yZWdpc3RlciBidXMgMCAt
IGVycm9yIFslZF0hXG4iLAogCQkgICAgICAgX19mdW5jX18sIHJldHZhbCk7Ci0JCXJldHVy
biByZXR2YWw7CisJCWdvdG8gZGVpbml0X21lZGlhOwogCX0KIAogCS8qIHJlZ2lzdGVyIGky
YyBidXMgMSAqLwpAQCAtMzY2Myw3ICszNjYzLDcgQEAgc3RhdGljIGludCBlbTI4eHhfaW5p
dF9kZXYoc3RydWN0IGVtMjh4eCAqZGV2LCBzdHJ1Y3QgdXNiX2RldmljZSAqdWRldiwKIAog
CQkJZW0yOHh4X2kyY191bnJlZ2lzdGVyKGRldiwgMCk7CiAKLQkJCXJldHVybiByZXR2YWw7
CisJCQlnb3RvIGRlaW5pdF9tZWRpYTsKIAkJfQogCX0KIApAQCAtMzY3MSw2ICszNjcxLDEw
IEBAIHN0YXRpYyBpbnQgZW0yOHh4X2luaXRfZGV2KHN0cnVjdCBlbTI4eHggKmRldiwgc3Ry
dWN0IHVzYl9kZXZpY2UgKnVkZXYsCiAJZW0yOHh4X2NhcmRfc2V0dXAoZGV2KTsKIAogCXJl
dHVybiAwOworCitkZWluaXRfbWVkaWE6CisJZW0yOHh4X3VucmVnaXN0ZXJfbWVkaWFfZGV2
aWNlKGRldik7CisJcmV0dXJuIHJldHZhbDsKIH0KIAogc3RhdGljIGludCBlbTI4eHhfZHVw
bGljYXRlX2RldihzdHJ1Y3QgZW0yOHh4ICpkZXYpCg==
--------------3qYvw9nx8IfEJ0aqiIMk0026--

