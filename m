Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF322A6A2E
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 17:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731201AbgKDQp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 11:45:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:43648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730154AbgKDQp7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 11:45:59 -0500
Received: from coco.lan (ip5f5ad5bc.dynamic.kabel-deutschland.de [95.90.213.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66CCF206CA;
        Wed,  4 Nov 2020 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604508358;
        bh=fxaNe/ej4fajTLgXICfQIB9YWUByug5FVwORvoI7kjs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kuG45+uJIStMZzDiyWyZ0ODZPLyEawHXJXScFKghKV1B3wUQE/jwL5j99RE+c7w2z
         nrCNZNpWyCE2Bc6sno0rpHggbGfAhG0w6C89P+FCexVaRvafh/GtU8mhshgSlJTFkz
         mDLYQ7wvqU16EyB90H7bQrNVA5REZJMsYsAv7Dj0=
Date:   Wed, 4 Nov 2020 17:45:54 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Gregor Hlawacek <g.hlawacek@hzdr.de>
Cc:     linux-media@vger.kernel.org
Subject: Re: Philips Monitor with webcam
Message-ID: <20201104174554.4bbec36a@coco.lan>
In-Reply-To: <59f848e83354ad72c11dacaf571f20a8084baf58.camel@hzdr.de>
References: <51207fd712e3c1001b80c6642021b1a5d5763ade.camel@hzdr.de>
        <20201104170233.0d405dff@coco.lan>
        <59f848e83354ad72c11dacaf571f20a8084baf58.camel@hzdr.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 04 Nov 2020 17:25:48 +0100
Gregor Hlawacek <g.hlawacek@hzdr.de> escreveu:

> On Wed, 2020-11-04 at 17:02 +0100, Mauro Carvalho Chehab wrote:
> > Em Wed, 04 Nov 2020 14:24:34 +0100
> > Gregor Hlawacek <g.hlawacek@hzdr.de> escreveu:
> >  =20
> > > Hi all
> > >=20
> > > I own a Philips Brilliance 241B which has a webcam attached. The
> > > device
> > > is listed as 0412:612b Chicony Electronics Co., Ltd, bubt doesn't
> > > work
> > > with the latest UVC stock kernel driver. Is there any hope to get
> > > this
> > > supported?
> > >=20
> > > uname -a:
> > > Linux it72 5.9.3-arch1-1 #1 SMP PREEMPT Sun, 01 Nov 2020 12:58:59
> > > +0000
> > > x86_64 GNU/Linux
> > >=20
> > > running Arch Linux on a Lenovo Thinkpad =C2=A0T490s
> > >=20
> > > dmesg:
> > >=20
> > > [76850.137838] usb 3-1.1.1.2: New USB device found, idVendor=3D04f2,
> > > idProduct=3Db612, bcdDevice=3D 2.10
> > > [76850.137841] usb 3-1.1.1.2: New USB device strings: Mfr=3D1,
> > > Product=3D2,
> > > SerialNumber=3D3
> > > [76850.137843] usb 3-1.1.1.2: Product: USB2.0 FHD UVC WebCam
> > > [76850.137845] usb 3-1.1.1.2: Manufacturer: SunplusIT Inc
> > > [76850.137846] usb 3-1.1.1.2: SerialNumber: 01.00.00
> > > [76850.152761] uvcvideo: Found UVC 1.50 device USB2.0 FHD UVC
> > > WebCam
> > > (04f2:b612)
> > > [76850.215683] input: USB2.0 FHD UVC WebCam: USB2.0 F as
> > > /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:
> > > 00.0
> > > /usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-1.1.1.2:1.0/input/input66
> > > [76850.223642] uvcvideo: Found UVC 1.50 device USB2.0 FHD UVC
> > > WebCam
> > > (04f2:b612)
> > > [76850.232499] usb 4-1.1.2: new SuperSpeed Gen 1 USB device number
> > > 5
> > > using xhci_hcd
> > > [76850.241004] input: USB2.0 FHD UVC WebCam: IR Camer as
> > > /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:
> > > 00.0
> > > /usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-1.1.1.2:1.2/input/input67 =20
> >=20
> > Hmm... it sounds that the camera was properly detected here.=20
> >=20
> > Could you please enclose the contents of the following command?
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$ v4l2-ctl --all
> >=20
> > Thanks,
> > Mauro =20
>=20
> Hi Mauro=C2=A0
>=20
> thanks for the quick answer. Here is the output but I am pretty sure
> that this come from the integrated laptop camera and not the one in the
> external monitor

Well, you can use "-d" parameter to identify the device, like:

	$ v4l2-ctl -d /dev/v4l/by-path/pci-0000\:00\:14.0-usb-0\:3.2\:1.0-video-in=
dex0 --all

The real path depends on your camera - you can take a look at:

	$ tree /dev/v4l/
	/dev/v4l/
	=E2=94=9C=E2=94=80=E2=94=80 by-id
	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 usb-046d_HD_Pro_Webcam_C=
920_55DA1CCF-video-index0 -> ../../video0
	=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 usb-046d_HD_Pro_Webcam_C=
920_55DA1CCF-video-index1 -> ../../video1
	=E2=94=94=E2=94=80=E2=94=80 by-path
	    =E2=94=9C=E2=94=80=E2=94=80 pci-0000:00:14.0-usb-0:3.2:1.0-video-index=
0 -> ../../video0
	    =E2=94=94=E2=94=80=E2=94=80 pci-0000:00:14.0-usb-0:3.2:1.0-video-index=
1 -> ../../video1

=09
In order to check the ones that were detected.

Regards,
Mauro
