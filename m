Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12DE0C9CD1
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 13:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729662AbfJCLFt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 07:05:49 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45202 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729586AbfJCLFt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 07:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=H1gJNA57yAF6fIbwjtVPDARwkV3Jxw7YXyVggV4BvS0=; b=THjp6WPZ+RX2qJA2PYVvfiQYh
        gVl/HdKxVlMfEPoGsMPF3xI5uoi5XUFwvqmSkRwBRpuz4DJgmkdqBD3N4Eh5b/iujHX4W93lo51uG
        FCNvbV5R5XLSO0QoZyzrSULvzrUl8zODhSqmc/RWvYRVYaWoxEATzUEYjMViEiykkOxqFktgpjyVd
        GjTApfoZKUXRPxQr1808m3Ah2Gh6ONNZgS84YhgT0vX813tn2utsSJpBm30YpyuHjL0TTy2MqyQ/6
        pAEIYZBWQ592vEAv2fXRStMMAjTAQ9Bx57safFHuhE/N/nYWrX3WkH8+h29m0OGT5zd/PuYHZS3Vt
        dFKGvWSYg==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFyvX-0004dO-T6; Thu, 03 Oct 2019 11:05:44 +0000
Date:   Thu, 3 Oct 2019 08:05:39 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gonsolo <gonsolo@gmail.com>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003080539.2b13c03b@coco.lan>
In-Reply-To: <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
References: <20191001205203.4b1a5fb6@coco.lan>
        <20191002141359.30166-1-gonsolo@gmail.com>
        <20191002141359.30166-2-gonsolo@gmail.com>
        <20191002142744.GA3475@gofer.mess.org>
        <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
        <20191002150650.GA4227@gofer.mess.org>
        <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
        <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
        <20191002154922.7f1cfc76@coco.lan>
        <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 3 Oct 2019 12:13:33 +0200
Gonsolo <gonsolo@gmail.com> escreveu:

> Hi!
> 
> > Could you please test the enclosing patch and see if, with that, you
> > can remove the hacks you added for the tuner probe to work?  
> 
> I tested again on a vanilla media_tree with Mauro's patch attached.
> Doesn't work. Dmesg output:
> 
> [    0.788387] kernel: usb 1-1: new high-speed USB device number 2
> using ehci-pci
> [    0.792384] kernel: usb 2-1: new high-speed USB device number 2
> using xhci_hcd
> [    0.944937] kernel: usb 2-1: New USB device found, idVendor=1d19,
> idProduct=0100, bcdDevice= 1.00
> [    0.944939] kernel: usb 2-1: New USB device strings: Mfr=1,
> Product=2, SerialNumber=3
> [    0.944940] kernel: usb 2-1: Product: TS Aggregator
> [    0.944941] kernel: usb 2-1: Manufacturer: ITE Tech., Inc.
> [    0.944942] kernel: usb 2-1: SerialNumber: AF0102020700001
> 
> I then also used the following (additional) patch:
> 
> @@ -2119,6 +2122,8 @@ static const struct usb_device_id af9035_id_table[] = {
>         /* IT930x devices */
>         { DVB_USB_DEVICE(USB_VID_ITETECH, USB_PID_ITETECH_IT9303,
>                 &it930x_props, "ITE 9303 Generic", NULL) },
> +       { DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
> +               &it930x_props, "Logilink VG0022A", NULL) },
>         { DVB_USB_DEVICE(USB_VID_AVERMEDIA, USB_PID_AVERMEDIA_TD310,
>                 &it930x_props, "AVerMedia TD310 DVB-T2", NULL) },
>         { }
> 
> Which gives the following output:
> 
> [    5.380989] si2168 1-0067: Silicon Labs Si2168-B40 successfully identified
> [    5.380991] si2168 1-0067: firmware version: B 4.0.2
> [    5.381013] usb 2-1: DVB: registering adapter 0 frontend 0 (Silicon
> Labs Si2168)...
> [    5.381018] dvbdev: dvb_create_media_entity: media entity 'Silicon
> Labs Si2168' registered.
> [    5.390058] checking generic (e0000000 410000) vs hw (e0000000 10000000)
> [    5.390062] fb0: switching to inteldrmfb from EFI VGA
> [    5.390268] Console: switching to colour dummy device 80x25
> [    5.390281] i915 0000:00:02.0: vgaarb: deactivate vga console
> [    5.393438] si2157 2-0063: Silicon Labs Si2147/2148/2157/2158
> successfully attached

Ok. It sounds that the issues you're facing are indeed related to timing
conditions.

> 
> But when I try to use VLC I get the following:
> 
> [  457.677363] si2168 1-0067: downloading firmware from file
> 'dvb-demod-si2168-b40-01.fw'
> [  458.631034] si2168 1-0067: firmware version: B 4.0.11
> [  458.650309] si2157 2-0063: unknown chip version Si21255-\xff\xff\xff
> 
> Now I'm trying other timings.

Returning 0xff, 0xff, 0xff, ... usually means that the tuner chip didn't
respond in time.

This could indicate:

1) The device requires more time to go to sane state after firmware
   load and/or device reset/power up;

2) Tuner may be using I2C clock stretching, but the bridge doesn't
   support it.

3) The clock used at the I2C bus is still too high;

4) The tuner is hidden by an I2C gate. 


I think that using the standard I2C bus clock of 100kbps should be
enough.

I2C clock stretching seems to be unlikely for a command that it is
just getting the device's version.

What seems more likely is that this device may need some time after
firmware load to start working.

So, I would add a msleep() somewhere after the firmware update.

Thanks,
Mauro
