Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609BE327627
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 03:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbhCACrQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Feb 2021 21:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbhCACrO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Feb 2021 21:47:14 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302B9C06174A
        for <linux-media@vger.kernel.org>; Sun, 28 Feb 2021 18:46:34 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id w1so25502517ejf.11
        for <linux-media@vger.kernel.org>; Sun, 28 Feb 2021 18:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0Y0q3tNQIVawDb3N0pHwEqMNGutvFg34+IHIxiELPrs=;
        b=KmuxzOle1+kJS1h26XW7isS/IwCLjH7vhr/lrm4pvQ9k7Yi4HxgMb4gdesxSm0/jW2
         sAjGpMk9fD/Oa3/vUXwa/l6zW5irpNNXb0SPiVpYqBZBbrtkhLkqGjnBdU67gVgcIpop
         g3+MN/02Ed7kDesMGsBcDH5IuUeX/1qNfOADDi1ogM6Mirr++OCG0GG0pVm8dKXi1Am1
         TCjfMMsIA3eix1iQg0E68DOdHy+4vC2D9T7fNegrbIQv09thBUg3JeyQrFWMf+bviuMf
         RdIToFkD7IC3fM8RfZCkB+YUMExM6+FXTzKGqTOlkGF7nfW4fH+L7uoijhyDo2Xyww/0
         ZM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0Y0q3tNQIVawDb3N0pHwEqMNGutvFg34+IHIxiELPrs=;
        b=DYV7LY6TjiVJulFBMdouvI2ylRcWOyek+KUn3nGzbAMitqYpxK3dfju3CRSpmD2EhE
         3KkcFJSQiLGx4SXXiuucJ04lbpkQyf9GLY9g3AY3GSRf46xQ6A+k+Ca/MTO81a+BEGWF
         aKKlvS54h38jeycSeTdNRr/0NsqcuandfSkc+uqqbvguY0m+S0IzAwzcTBQLPppydRWE
         NVUiNrIe+0aeLJmeu3dH2twNqvQ+okPSAU/fSFB/VzaOjCzhdAP/cpLNn2DpjAY+gxGi
         6sEfi21qRRhH6e3txaCq9H9vwV9Uya5yCUYqgs6nEV2xHLzBV6rBiulzNf+2Kx5VR4Dm
         xFrw==
X-Gm-Message-State: AOAM532DO3isVbYb4qaJBmY0Hf88Ae1oulc3DuAsGXZbzo76IPPGmdBL
        lWeUrpuJaQa5w6Fo2f4Ygqby0U36/yiAW0IHvKk7H8gvxt9AXg==
X-Google-Smtp-Source: ABdhPJxzxxcekbNPe0f4QEzTodmJq7NVYw4HQThVCWeb9Wq73osnWcZ1i0kof+wjXV8a9ltrMtywm1i71CsuirjAU8c=
X-Received: by 2002:a17:906:296a:: with SMTP id x10mr13687806ejd.240.1614566792845;
 Sun, 28 Feb 2021 18:46:32 -0800 (PST)
MIME-Version: 1.0
References: <CAK80=wMNP=1DPi=4G3ONxjLUm+5Kqv7YULcr85QHd85P_5aktA@mail.gmail.com>
 <CAHp75VftsNoroK3-fKaR5VGsbh-2dahPEM650+Sw880jPFD9dQ@mail.gmail.com>
 <20210228120630.75d98739@coco.lan> <YDuZ5T1vKjutGPgK@pendragon.ideasonboard.com>
In-Reply-To: <YDuZ5T1vKjutGPgK@pendragon.ideasonboard.com>
From:   Zhengyang Feng <zyfeng97@gmail.com>
Date:   Mon, 1 Mar 2021 10:46:21 +0800
Message-ID: <CAK80=wOY8oUv+ctgksWFwjKe8kUo-_AwAhOewf5hEq9Wei9n=g@mail.gmail.com>
Subject: Re: An unsupported UVC device
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart <laurent.pinchart@ideasonboard.com> =E4=BA=8E2021=E5=B9=B4=
2=E6=9C=8828=E6=97=A5=E5=91=A8=E6=97=A5 =E4=B8=8B=E5=8D=889:26=E5=86=99=E9=
=81=93=EF=BC=9A
>
> Hello,
>
> On Sun, Feb 28, 2021 at 12:06:30PM +0100, Mauro Carvalho Chehab wrote:
> > Em Sun, 28 Feb 2021 11:38:32 +0200 Andy Shevchenko escreveu:
> > > On Sat, Feb 27, 2021 at 12:04 PM Zhengyang Feng <zyfeng97@gmail.com> =
wrote:
> > > >
> > > > Dear maintainers,
> > > >
> > > > I'm resending this because the previous email was not clear and sho=
uld
> > > > be ignored. Sorry for the inconvenience caused.
> > > >
> > > > I was using HIK DS-U14 2K camera on Ubuntu 20.04 with built-in MIC
> > > > (but it has only one USB cable) but it seems unsupported. It
> > > > does not need a driver to be used on Windows (usable by just pluggi=
ng
> > > > in).
> > > > I see no HIK devices on the support list
> > > > (http://www.ideasonboard.org/uvc/), but when I run lsusb -d 2bdf:02=
81
> > > > -v | grep "14 Video" it does output several lines like these:
> > > >
> > > > bFunctionClass         14 Video
> > > > bInterfaceClass        14 Video
> > > > bInterfaceClass        14 Video
> > > > bInterfaceClass        14 Video
> > > > bInterfaceClass        14 Video
> > > >
> > > > It also says "Couldn't open device, some information will be missin=
g".
> > > > But it does not require a driver to work on Windows, so it should b=
e a
> > > > normal UVC device right?
> > > >
> > > > I observed that it is not supported as a camera, because although I
> > > > see /dev/video0 and /dev/video1 (quite odd since it is only 1 camer=
a),
> > > > it fails by either OpenCV (cv2.VideoCapture(id)) or `cheese`, where=
 it
> > > > says "cannot open by index" (I tried both video0 and video1).
> > > > Then I got the logs with `cheese`, in the zip file attached. I thin=
k since the
> > > > device is quite new on the market, maybe you guys haven't tested it=
.
> > > >
> > > > BTW, I installed the latest from
> > > > https://git.linuxtv.org/media_build.git before I generated the logs=
.
> > > > The camera shows same behavior before and after I installed the lat=
est
> > > > version. And the USB connection works fine (I can use other cameras=
 on
> > > > this machine), also the camera itself is fine (tested on Windows ma=
chines).
> > > >
> > > > Feel free to tell me this is unrelated to the project/this mailing
> > > > list, in that case I'll just
> > > > get another camera.
> >
> > It sounds to me that there's something broken on this camera's
> > descriptors, with the USB cable or with the USB stack.
> >
> > It sounds very weird to my eyes to see errors when getting
> > the device descriptors like those:
> >
> >       Bus 001 Device 007: ID 2bdf:0281 SN0002 HIK 2K USB CAMERA
> >       Device Descriptor:
> >         bLength                18
> >         bDescriptorType         1
> >         bcdUSB               2.00
> >         bDeviceClass          239 Miscellaneous Device
> >         bDeviceSubClass         2
> >         bDeviceProtocol         1 Interface Association
> >         bMaxPacketSize0        64
> >         idVendor           0x2bdf
> >         idProduct          0x0281
> >         bcdDevice           11.00
> >         iManufacturer           1 (error)
> >         iProduct                2 (error)
> >         iSerial                 3 (error)
>
> Note that the descriptors can be read by the kernel:
>
> [ 1013.137790] usb 1-1: new high-speed USB device number 7 using xhci_hcd
> [ 1013.287536] usb 1-1: New USB device found, idVendor=3D2bdf, idProduct=
=3D0281, bcdDevice=3D11.00
> [ 1013.287542] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [ 1013.287545] usb 1-1: Product: HIK 2K USB CAMERA
> [ 1013.287548] usb 1-1: Manufacturer: SN0002
> [ 1013.287550] usb 1-1: SerialNumber: SN0002
> [ 1013.289504] usb 1-1: Found UVC 1.00 device HIK 2K USB CAMERA (2bdf:028=
1)
> [ 1013.291886] input: HIK 2K USB CAMERA: HIK 2K USB C as /devices/pci0000=
:00/0000:00:14.0/usb1/1-1/1-1:1.0/input/input21
>
> This is immediately followed by
>
> [ 1013.300287] usb 1-1: 3:1: cannot get freq at ep 0x89
> [ 1028.831102] usb 1-1: 3:1: usb_set_interface failed (-110)
> [ 1033.951429] usb 1-1: 3:1: usb_set_interface failed (-110)
> [ 1039.071697] usb 1-1: 3:1: usb_set_interface failed (-110)
> [ 1044.191786] usb 1-1: 3:1: usb_set_interface failed (-110)
> [ 1049.311948] usb 1-1: 3:1: usb_set_interface failed (-110)
> [ 1054.432472] usb 1-1: 3:1: usb_set_interface failed (-110)
> [ 1059.552484] usb 1-1: 3:1: usb_set_interface failed (-110)
> [ 1064.672763] usb 1-1: 3:1: usb_set_interface failed (-110)
> [ 1069.792953] usb 1-1: 3:1: usb_set_interface failed (-110)
> [ 1074.912868] usb 1-1: 3:1: usb_set_interface failed (-110)
> [ 1078.496721] uvcvideo 1-1:1.1: Failed to set UVC probe control : -110 (=
exp. 26).
> [ 1080.033398] usb 1-1: 3:1: usb_set_interface failed (-110)
> [ 1083.616960] uvcvideo 1-1:1.1: Failed to set UVC probe control : -110 (=
exp. 26).
> [ 1085.157405] usb 1-1: 3:1: usb_set_interface failed (-110)
> [...]
>
> The "cannot get freq" message comes from the snd_usb_audio driver, and
> after that, the video device starts failing ("Failed to set UVC probe
> control...").
>
> I suspect that the device firmware has crashed, possibly as a
> consequence of requests related to the audio interface.
>
> Zhengyang, could you try to blacklist the snd_usb_audio driver to avoid
> it being automatically loaded, and see if the camera then works (after
> unplugging and replugging it) ? If it doesn't, please provide the
> contents of the kernel log.
>
> > The Kernel probe also has similar troubles:
> >
> >       [   31.553926] usb 1-1: Found UVC 1.00 device HIK 2K USB CAMERA (=
2bdf:0281)
> >       [   32.065510] usb 1-1: Failed to query (GET_INFO) UVC control 11=
 on unit 1: -110 (exp. 1).
> >       [   32.577665] usb 1-1: Failed to query (GET_INFO) UVC control 12=
 on unit 1: -110 (exp. 1).
> >       [   33.089610] usb 1-1: Failed to query (GET_INFO) UVC control 2 =
on unit 2: -110 (exp. 1).
> >       [   33.601620] usb 1-1: Failed to query (GET_INFO) UVC control 3 =
on unit 2: -110 (exp. 1).
> >       [   34.113672] usb 1-1: Failed to query (GET_INFO) UVC control 7 =
on unit 2: -110 (exp. 1).
> >       [   34.625635] usb 1-1: Failed to query (GET_INFO) UVC control 8 =
on unit 2: -110 (exp. 1).
> >       [   35.137673] usb 1-1: Failed to query (GET_INFO) UVC control 10=
 on unit 2: -110 (exp. 1).
> >       [   35.649581] usb 1-1: Failed to query (GET_INFO) UVC control 5 =
on unit 2: -110 (exp. 1).
> >       [   36.161693] usb 1-1: Failed to query (GET_INFO) UVC control 11=
 on unit 2: -110 (exp. 1).
> >       [   46.401833] usb 1-1: UVC non compliance - GET_DEF(PROBE) not s=
upported. Enabling workaround.
> >       [   51.460664] uvcvideo 1-1:1.1: Failed to query (129) UVC probe =
control : -110 (exp. 26).
> >       [   51.460672] uvcvideo 1-1:1.1: Failed to initialize the device =
(-5).
> >       [   61.656435] usb 1-1: 3:1: usb_set_interface failed (-110)
> >       [   71.885237] usb 1-1: 3:1: usb_set_interface failed (-110)
> >       [   77.003565] usb 1-1: 3:1: usb_set_interface failed (-110)
> > ...
> >       [ 2022.115559] usb 1-1: 3:1: usb_set_interface failed (-110)
> >
> >
> > Are you using any proprietary driver or had applied any patch/driver
> > to the Kernel?
> >
> > Can you try testing it with vanilla Kernel 5.10?
>
> --
> Regards,
>
> Laurent Pinchart


Thanks for your through inspections about the log, me too suspect the
problem is related to the audio input, since the audio and video
stream share the same usb cable.
I blacklisted the snd_usb_audio driver, and the camera works fine now.
(I dont really need the audio in the first place so I guess this
solves it)
Thanks very much!

p.s. As for the kernel version, it was 5.8.0-44-generic and I just
installed the ubuntu system a weak ago without adding any customized
patch/driver except for the nvidia GPU.

--
Yours sincerely,
Zhengyang
