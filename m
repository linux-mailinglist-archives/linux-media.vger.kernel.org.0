Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88FA2E8CFB
	for <lists+linux-media@lfdr.de>; Sun,  3 Jan 2021 16:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbhACPvh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Jan 2021 10:51:37 -0500
Received: from mail.schramp.com ([188.166.64.204]:56436 "EHLO mail.schramp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbhACPvg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 Jan 2021 10:51:36 -0500
Received: by mail.schramp.com (Postfix, from userid 114)
        id 7715C43AC1; Sun,  3 Jan 2021 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=schramp.com; s=mail;
        t=1609689054; bh=9KhVk9IwBIRzWRUyoac1IK/+jSwU9d0qh6pPNbiKi2c=;
        h=From:To:Subject:Date:In-Reply-To:References:Reply-To:From;
        b=HZPIODcOQF8uTKG7XTTFIkPrMz9AkuQrsBX9JzFvUSlzyohV+SkjQEgoMsRtLXJZJ
         yez0o+FpYv52uBO5FD4YylW5qxuCxdrKpVG36EBO8Ayx+ICNV6E496Ke1SFcRXshGt
         YR2hTWPVoOxFqaURx6POtEoqKhDBwjj+MDAOtG5cyqltRT0bwpZNzRKJVUdFEfxU3t
         +dS00/+H50zUA+A5LS7oX+sSXwd1W+589/4vDv61dNtzUaM/gk4GNZmam72P6ENxM3
         LRDhWsbM4P6TeNrPsMFcN2i0C1gRlfiqRGT3o1/3IWo9oJD0kC7DJhOtknZf5afZLy
         mqlnGwuiFVoBA==
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.schramp.com
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.2
Received: from [192.168.178.42] (94-209-128-102.cable.dynamic.v4.ziggo.nl [94.209.128.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ruud)
        by mail.schramp.com (Postfix) with ESMTPSA id 1853D3F152
        for <linux-media@vger.kernel.org>; Sun,  3 Jan 2021 15:50:53 +0000 (UTC)
From:   "Ruud Schramp" <ruud@schramp.com>
To:     linux-media@vger.kernel.org
Subject: Re: USB Microscope, Manufacturer: Winmax Corp. (ION Slides Forever)
Date:   Sun, 03 Jan 2021 15:50:51 +0000
Message-Id: <ema5af2fc1-8db3-4b0c-808a-fe48b5b3dc8e@thor>
In-Reply-To: <em1c6e7844-98f5-422e-b73c-588532718690@thor>
References: <em1c6e7844-98f5-422e-b73c-588532718690@thor>
Reply-To: "Ruud Schramp" <ruud@schramp.com>
User-Agent: eM_Client/7.2.37929.0
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>Hello All,
>
>This email is just to document my in-vane efforts to add support for my=20
>ION Slider Forever film scanner.
>
>Its USB Id:  0c45:6353
>
>The weirdness of the UVC device is that is publishes 2 modes. Both in=20
>YUYV, however closer inspection of the data shows that the=20
>high-resolution frame is a Bayer BGGR patern, and the low-resolution is=20
>YUVY. At the USB level (inspected with wireshark) this is what the=20
>device tells the driver  so its a bug in the device itself. The low-res=20
>is actually working fine.
>
>I made a QUIRK setting that would hopefully reverse the high-res and=20
>low-res behaviour making the high-res work and the low-res broken.
>
>Its published on:=20
>https://github.com/Schramp/linux-writeblock/commit/34f8efd8db41aa90baf944b=
0371c9c015bc4d34f
>
>Unfortunately it works only a bit: the decoding and formatting is fine,=20
>but the white balance in the camera is moving away from the correct=20
>colours in a matter of a few seconds. I haven't found a way to correct=20
>that behaviour.
>
>For all your reference:
>
>The dmesg on a standard kernel:
>[  416.066239] usb 3-2: new high-speed USB device number 7 using=20
>xhci_hcd
>[  416.433911] usb 3-2: New USB device found, idVendor=3D0c45,=20
>idProduct=3D6353, bcdDevice=3D 1.50
>[  416.433913] usb 3-2: New USB device strings: Mfr=3D2, Product=3D1,=20
>SerialNumber=3D0
>[  416.433914] usb 3-2: Product: USB Microscope
>[  416.433914] usb 3-2: Manufacturer: Winmax Corp.
>[  416.439710] uvcvideo: Probing generic UVC device 2
>[  416.441702] uvcvideo: Found format YUV 4:2:2 (YUYV).
>[  416.441703] uvcvideo: - 592x392 (30.0 fps)
>[  416.441703] uvcvideo: - 1184x1576 (5.0 fps)
>
>After the patch:
>[ 7608.448727] usb 3-2: new high-speed USB device number 15 using=20
>xhci_hcd
>[ 7608.815179] usb 3-2: New USB device found, idVendor=3D0c45,=20
>idProduct=3D6353, bcdDevice=3D 1.50
>[ 7608.815184] usb 3-2: New USB device strings: Mfr=3D2, Product=3D1,=20
>SerialNumber=3D0
>[ 7608.815185] usb 3-2: Product: USB Microscope
>[ 7608.815186] usb 3-2: Manufacturer: Winmax Corp.
>[ 7608.823248] uvcvideo: Probing known UVC device 2 (0c45:6353)
>[ 7608.825550] uvcvideo: Forcing UVC_QUIRK_FORCE_BA81
>[ 7608.825552] uvcvideo: Found format BGGR Bayer (BA81).
>[ 7608.825552] uvcvideo: - 1184x392 (30.0 fps)
>[ 7608.825554] uvcvideo: - 2368x1576 (5.0 fps)
>
>
>I hope the information helps the community (or at least saves them from=20
>re-inventing this broken wheel).
>
>Best regards,
>
>Ruud Schramp
>

