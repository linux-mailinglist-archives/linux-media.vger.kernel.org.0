Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7277D2C8A7D
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 18:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbgK3RKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 12:10:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:37924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727365AbgK3RKV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 12:10:21 -0500
Received: from coco.lan (ip5f5ad5b3.dynamic.kabel-deutschland.de [95.90.213.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 53F052073C;
        Mon, 30 Nov 2020 17:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606756180;
        bh=sSxR2SP3SfkSQUPn7A1FGo6IcOVu1Zbgt/XRu+SHAvk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UVMmXzNq/UQzUR2IrOJBELy+9W/y0uTThhOQhlmrPkwVMrtMCnWkGYw9fwl2kctzH
         3FyAGw4zibhpWMIDQpBCS3WpXnVs3VxOhSeumA4TQG8Q02zEqW5yMvt7ecGycpecNj
         hCgHDtjPvooSOH+PoP/UW7MDTXYgIc8xw1nR4j3E=
Date:   Mon, 30 Nov 2020 18:09:35 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     VDRU VDRU <user.vdr@gmail.com>
Cc:     Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        syzbot <syzkaller@googlegroups.com>
Subject: Re: [PATCH] media: gp8psk: initialize stats at power control logic
Message-ID: <20201130180834.07a3116f@coco.lan>
In-Reply-To: <CAA7C2qiOAZR+QwY5Bs-UHQzBEfA15gMG-GjriqNo3Q5biY4+ZQ@mail.gmail.com>
References: <d0ac1a26ed5943127cb0156148735f5f52a07075.1606459576.git.mchehab+huawei@kernel.org>
        <CA+FuTSenOoVxM6W9viwXQmPHo_MEoQzQ=GPxJi72fYGHHmqmwA@mail.gmail.com>
        <20201130104420.321531ec@coco.lan>
        <CAA7C2qiOAZR+QwY5Bs-UHQzBEfA15gMG-GjriqNo3Q5biY4+ZQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Derek,

Em Mon, 30 Nov 2020 08:04:31 -0800
VDRU VDRU <user.vdr@gmail.com> escreveu:

> I have hardware that uses this driver and can conduct a test if it
> will help resolve any confusion/assumption. I'd also like to suggest
> that making changes to drivers with no means of testing those changes
> is bad. This has happened in the past and resulted in unnecessarily
> breaking drivers for those who use it. No patch should be merged
> without testing!

It helps a lot if you could test it.

The current situation is that, if the I2C read fails, the
driver will randomly power up only partially, which could
cause issues.

The original proposed approach:

	https://lore.kernel.org/linux-media/20190627222020.45909-1-willemdebruijn.kernel@gmail.com/

Will just give up trying to powering it up, while the
patch I'm proposing will force the device to power up
all parts of it. So, it seems safer than the original
one.

Please test with the enclosed patch. It is basically
the same as the one I proposed, although this one will
print a message at dlog, due to this:

	pr_info("ret returned %d\n", ret);

This could happen when the device got plugged and/or if
you put the machine into suspend mode, when resuming it
while streaming[1]

Regards,
Mauro

[1] not sure if dvb-usb supports it. One of the rationales
behind dvb-usb-v2 were to be able of properly do
suspend/resumes.



diff --git a/drivers/media/usb/dvb-usb/gp8psk.c b/drivers/media/usb/dvb-usb/gp8psk.c
index c07f46f5176e..be55496cc717 100644
--- a/drivers/media/usb/dvb-usb/gp8psk.c
+++ b/drivers/media/usb/dvb-usb/gp8psk.c
@@ -182,11 +182,16 @@ static int gp8psk_load_bcm4500fw(struct dvb_usb_device *d)
 
 static int gp8psk_power_ctrl(struct dvb_usb_device *d, int onoff)
 {
-	u8 status, buf;
+	u8 status = 0, buf;
+	int ret;
 	int gp_product_id = le16_to_cpu(d->udev->descriptor.idProduct);
 
 	if (onoff) {
-		gp8psk_usb_in_op(d, GET_8PSK_CONFIG,0,0,&status,1);
+		ret = gp8psk_usb_in_op(d, GET_8PSK_CONFIG,0,0,&status,1);
+		// Just to check if the condition happens in practice
+		if (ret < 0)
+			pr_info("ret returned %d\n", ret);
+
 		if (! (status & bm8pskStarted)) {  /* started */
 			if(gp_product_id == USB_PID_GENPIX_SKYWALKER_CW3K)
 				gp8psk_usb_out_op(d, CW3K_INIT, 1, 0, NULL, 0);

