Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8112A68F3
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 17:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730819AbgKDQCm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 11:02:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:50740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725889AbgKDQCl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 11:02:41 -0500
Received: from coco.lan (ip5f5ad5bc.dynamic.kabel-deutschland.de [95.90.213.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FBCE20786;
        Wed,  4 Nov 2020 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604505760;
        bh=IIvdr5gIi8Awn5IRizlmQqB4QFCFHmm5gxRgEOKqQf0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cf8ucAQZZYgh92rfoKyMzrI9lnAPnrZVmjVq1E+11sU7hwCAuxVSojGJsTmFDknTJ
         lLVicUk72fuCyH8OkmKU9wl/1PiDr/LZmaW5T3mZJGQaI2qFmL/o2zjKx7nXCWQ93x
         iR4E88RWOCVoQfsRQKbVTQfWDhOdUx+Ul7BEWRQI=
Date:   Wed, 4 Nov 2020 17:02:33 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Gregor Hlawacek <g.hlawacek@hzdr.de>
Cc:     linux-media@vger.kernel.org
Subject: Re: Philips Monitor with webcam
Message-ID: <20201104170233.0d405dff@coco.lan>
In-Reply-To: <51207fd712e3c1001b80c6642021b1a5d5763ade.camel@hzdr.de>
References: <51207fd712e3c1001b80c6642021b1a5d5763ade.camel@hzdr.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 04 Nov 2020 14:24:34 +0100
Gregor Hlawacek <g.hlawacek@hzdr.de> escreveu:

> Hi all
>=20
> I own a Philips Brilliance 241B which has a webcam attached. The device
> is listed as 0412:612b Chicony Electronics Co., Ltd, bubt doesn't work
> with the latest UVC stock kernel driver. Is there any hope to get this
> supported?
>=20
> uname -a:
> Linux it72 5.9.3-arch1-1 #1 SMP PREEMPT Sun, 01 Nov 2020 12:58:59 +0000
> x86_64 GNU/Linux
>=20
> running Arch Linux on a Lenovo Thinkpad =C2=A0T490s
>=20
> dmesg:
>=20
> [76850.137838] usb 3-1.1.1.2: New USB device found, idVendor=3D04f2,
> idProduct=3Db612, bcdDevice=3D 2.10
> [76850.137841] usb 3-1.1.1.2: New USB device strings: Mfr=3D1, Product=3D=
2,
> SerialNumber=3D3
> [76850.137843] usb 3-1.1.1.2: Product: USB2.0 FHD UVC WebCam
> [76850.137845] usb 3-1.1.1.2: Manufacturer: SunplusIT Inc
> [76850.137846] usb 3-1.1.1.2: SerialNumber: 01.00.00
> [76850.152761] uvcvideo: Found UVC 1.50 device USB2.0 FHD UVC WebCam
> (04f2:b612)
> [76850.215683] input: USB2.0 FHD UVC WebCam: USB2.0 F as
> /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:00.0
> /usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-1.1.1.2:1.0/input/input66
> [76850.223642] uvcvideo: Found UVC 1.50 device USB2.0 FHD UVC WebCam
> (04f2:b612)
> [76850.232499] usb 4-1.1.2: new SuperSpeed Gen 1 USB device number 5
> using xhci_hcd
> [76850.241004] input: USB2.0 FHD UVC WebCam: IR Camer as
> /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:00.0
> /usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-1.1.1.2:1.2/input/input67

Hmm... it sounds that the camera was properly detected here.=20

Could you please enclose the contents of the following command?

	$ v4l2-ctl --all

Thanks,
Mauro
