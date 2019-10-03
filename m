Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 441EBC9BDF
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 12:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbfJCKNq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 06:13:46 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38715 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfJCKNp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 06:13:45 -0400
Received: by mail-qt1-f194.google.com with SMTP id j31so2770945qta.5;
        Thu, 03 Oct 2019 03:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zRmRJN8gbGe7JsDiP8BYKFBP5BEQqwbz/PHKZujLW60=;
        b=epPG/membyZKgagNXMf0uJWB8XjF81/2Dwq/im/BdTqSFTPsQBLQfrNivaoTa9NmOF
         dsg6R0r4b1+vf8DQZ0n/0ZjUYSkR9aVR1wUIliI3cQ5ggBIzQdJtixMwpMispp0X0+qa
         tKMN2ehB5fEi1rAf2abpSDiq+0Nbwp6kM03xVFrVOPV86UqoaRNHRM/D8bVcPbHfJBrK
         0kGnC8k2qTAwpCbsnkkEXz7bTc8OPm9UPqUjsdKaRsTWvDsd7b5t4u6oUiq0ZxSWADf6
         F6Bis1quh2lth1GiFc5eE12C7aOb2h3foKMok3ldmOKYgToc94REhv43Z7tEbi2J8hfL
         AndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zRmRJN8gbGe7JsDiP8BYKFBP5BEQqwbz/PHKZujLW60=;
        b=hfW3tw9Ap3gBh+Bdg2Nt/W1cu01hP8UksW/9uVSbL64krH7HiNHq6yQiHQirTO2282
         FOs+69wyj95GSxPx1zAy3Uokm06ssoxxvIp7neZGko5ipML07k35MQrIlaCXct0u0cj4
         JyjGEn66qRhcN8U2weBzLZ34o6CzSIZtNxeRvg9imEJLgpgqpYmcIFYxpFKn0sm/bQWl
         lZNd1Taf4H7IG5E7+boLGhg+1MIUDm20Ht7zgH+k6Yt2PsK5SGg36Z9uNlx8E4lcVPHE
         F9E5O0racxnYvLj3hbDsxzwg1rMwWFXU7Agw5aDU3DCd5wY4T3UsaAsdYHurZvNlLR/C
         JoYA==
X-Gm-Message-State: APjAAAUP/SK6/T0TYRlt+60O/d7PebBXWr1Ycfbb9pBXWL86gWtetjWv
        ZsNKLlRt6ivf/L1CsZkN1irqlfH8ogO58dPsIx+Vg/Mi80A=
X-Google-Smtp-Source: APXvYqxEDszLeMOiHKaxeg7RngcGH1UbDQJtfPWW0sPv1p/4D6xV6yi5BiqqFYluYKMDrd3Mq1kWhlWK5wXO9jPSljI=
X-Received: by 2002:ac8:4712:: with SMTP id f18mr4241086qtp.313.1570097624646;
 Thu, 03 Oct 2019 03:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191001205203.4b1a5fb6@coco.lan> <20191002141359.30166-1-gonsolo@gmail.com>
 <20191002141359.30166-2-gonsolo@gmail.com> <20191002142744.GA3475@gofer.mess.org>
 <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
 <20191002150650.GA4227@gofer.mess.org> <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
 <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
In-Reply-To: <20191002154922.7f1cfc76@coco.lan>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 12:13:33 +0200
Message-ID: <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

> Could you please test the enclosing patch and see if, with that, you
> can remove the hacks you added for the tuner probe to work?

I tested again on a vanilla media_tree with Mauro's patch attached.
Doesn't work. Dmesg output:

[    0.788387] kernel: usb 1-1: new high-speed USB device number 2
using ehci-pci
[    0.792384] kernel: usb 2-1: new high-speed USB device number 2
using xhci_hcd
[    0.944937] kernel: usb 2-1: New USB device found, idVendor=1d19,
idProduct=0100, bcdDevice= 1.00
[    0.944939] kernel: usb 2-1: New USB device strings: Mfr=1,
Product=2, SerialNumber=3
[    0.944940] kernel: usb 2-1: Product: TS Aggregator
[    0.944941] kernel: usb 2-1: Manufacturer: ITE Tech., Inc.
[    0.944942] kernel: usb 2-1: SerialNumber: AF0102020700001

I then also used the following (additional) patch:

@@ -2119,6 +2122,8 @@ static const struct usb_device_id af9035_id_table[] = {
        /* IT930x devices */
        { DVB_USB_DEVICE(USB_VID_ITETECH, USB_PID_ITETECH_IT9303,
                &it930x_props, "ITE 9303 Generic", NULL) },
+       { DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
+               &it930x_props, "Logilink VG0022A", NULL) },
        { DVB_USB_DEVICE(USB_VID_AVERMEDIA, USB_PID_AVERMEDIA_TD310,
                &it930x_props, "AVerMedia TD310 DVB-T2", NULL) },
        { }

Which gives the following output:

[    5.380989] si2168 1-0067: Silicon Labs Si2168-B40 successfully identified
[    5.380991] si2168 1-0067: firmware version: B 4.0.2
[    5.381013] usb 2-1: DVB: registering adapter 0 frontend 0 (Silicon
Labs Si2168)...
[    5.381018] dvbdev: dvb_create_media_entity: media entity 'Silicon
Labs Si2168' registered.
[    5.390058] checking generic (e0000000 410000) vs hw (e0000000 10000000)
[    5.390062] fb0: switching to inteldrmfb from EFI VGA
[    5.390268] Console: switching to colour dummy device 80x25
[    5.390281] i915 0000:00:02.0: vgaarb: deactivate vga console
[    5.393438] si2157 2-0063: Silicon Labs Si2147/2148/2157/2158
successfully attached

But when I try to use VLC I get the following:

[  457.677363] si2168 1-0067: downloading firmware from file
'dvb-demod-si2168-b40-01.fw'
[  458.631034] si2168 1-0067: firmware version: B 4.0.11
[  458.650309] si2157 2-0063: unknown chip version Si21255-\xff\xff\xff

Now I'm trying other timings.

Thanks,
g
