Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC032E7D9F
	for <lists+linux-media@lfdr.de>; Thu, 31 Dec 2020 02:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgLaByg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 20:54:36 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:39405 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgLaByf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 20:54:35 -0500
Received: by mail-io1-f72.google.com with SMTP id n9so7781494iog.6
        for <linux-media@vger.kernel.org>; Wed, 30 Dec 2020 17:54:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=FdZTn6oLt2h1f5MhJVFstju7o/Z0EftaGAcqBWG7ncY=;
        b=GujM0+sPqH+nSr/GCymxdIS6rdjoluHlN+oG+UCvnZvSxIFddaPU7PMgZ0JvOjLOTR
         W5vclE9cT886tMFRN/geNLac0qgTjYuzlcY6X2uf5UK0D1l/84kK9ZW0oEicTBwAEhbZ
         NFJImlXbqD2oAn+kXurw1h0bGcE8noIUaoOBDUk4N3shY+zSryM8wMbCiT3W4tRXt+xE
         vss4frSTq6h9sStLUl8AcD+kWjKXOFcP48z66KYtmlrx5nLAPqaUPW9MCvhjn221BkzA
         x0kIGs9Qg9X8HNMA+SOFeMwlbXFh398TvBSYtbbL58x5/kEB5E5CWXKvtuzPSJuowBbF
         qPzg==
X-Gm-Message-State: AOAM532bKYMaWRdw4cv2p9xNMTMlzTaY93ovdCqiBw8T9bjsxmdMZ3JN
        zKjMtDZXs4bgmpv2cB/8Po9NidtEJJppUCYR5LAg0qTjz+Rs
X-Google-Smtp-Source: ABdhPJy/+c5PxXndhI52KzY/wHMyn6U0qATIbhO7SwFEiBz9oJu3s57OASzyLH4AS5ZUKKQmR2T508uqUp4ZAhFV60iXvdn/Y0c4
MIME-Version: 1.0
X-Received: by 2002:a92:bb84:: with SMTP id x4mr54012722ilk.298.1609379634982;
 Wed, 30 Dec 2020 17:53:54 -0800 (PST)
Date:   Wed, 30 Dec 2020 17:53:54 -0800
In-Reply-To: <CAAEAJfCiUx+NepjxBvoupShks9MTpN9ihzBywqt0at4ekkFASQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000073b51105b7b8e52d@google.com>
Subject: Re: Re: [RFT][PATCH v1] media: zr364xx: Fix memory leak in ->probe()
From:   syzbot <syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     andriy.shevchenko@linux.intel.com, ezequiel@vanguardiasur.com.ar,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, royale@zerezo.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Hey Andy,
>
> Thank you for the patch.
>
> On Wed, 30 Dec 2020 at 18:22, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>>
>> When ->probe() fails in some cases it may not free resources.
>> Replace few separated calls by v4l2_device_put() to clean up
>> everything.
>>
>> Reported-by: syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>> I have no hardware and hadn't done any test of this.
>>
>
> For bugs with reproducers such as this one, syzbot will test your
> patches really quickly.
> Just push the patch somewhere and then reply to syzbot bug report mail with
>
> #syz test: git://repo/address.git commit-hash

"git://repo/address.git" does not look like a valid git repo address.

>
> You can experiment with syzbot by replying only to syzbot's mail address.
>
> See https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testing-patches
> for more details.
>
> Cheers,
> Ezequiel
>
>
>>  drivers/media/usb/zr364xx/zr364xx.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
>> index 1e1c6b4d1874..5b9e31af57cf 100644
>> --- a/drivers/media/usb/zr364xx/zr364xx.c
>> +++ b/drivers/media/usb/zr364xx/zr364xx.c
>> @@ -1533,9 +1533,7 @@ static int zr364xx_probe(struct usb_interface *intf,
>>         return 0;
>>
>>  fail:
>> -       v4l2_ctrl_handler_free(hdl);
>> -       v4l2_device_unregister(&cam->v4l2_dev);
>> -       kfree(cam);
>> +       v4l2_device_put(&cam->v4l2_dev);
>>         return err;
>>  }
>>
>> --
>> 2.29.2
>>
