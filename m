Return-Path: <linux-media+bounces-12737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C770C9004EB
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37AD8B27054
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967C9194A5A;
	Fri,  7 Jun 2024 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fo/lXz0F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724C515B567
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 13:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717766959; cv=none; b=lGBl9BqkIpmkWq2m8LLPwwC+KV+g+QBUeKU+fOtQ/9oBtaK6V8+JWv104hwyc6WaTOgmvuuGhPOLD2iFQONQiEy1x9TUmrCahyv6oYxbCg6FATYfZd1eFMOg8EGb8bN2jttZVH6gXI0dlaMW6+UCrWe+fKXqidK5mofX3pvv9zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717766959; c=relaxed/simple;
	bh=qW0myzPoAVk0tVTgQMdD8BK/XlDpMHROCpilJCngetA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=PHGQNH33L2usScqIi7jHn5o6m7cdzLW82GZ5v4a2xF06Ye7Cmbq5dm3SjEbI8Z5ZmKWbeqgVvDrzNY2aTzGdz7dXn3VFCWDWF5aZ4KT8hNyOwSUjeE1kWb4kAv1a0axGoVog9euHOcNpu4W9ey7LxKiXJNsf37ZlrmTPOLlejtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fo/lXz0F; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c9c41cdc4cso697581b6e.2
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2024 06:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717766956; x=1718371756; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdDYQkP2ytNtpw0wruf+bz50cXG6xxExDHZziiKfyuU=;
        b=fo/lXz0F6cw1+BubeZLM3FHnw2XTfMjyjvW6ZAEHHjS0/tQawwSMTJd0baL0ieVtdV
         82FUg0V/3incJUPSTae8QtKv93ra2KdLi2qha3bJs0L9rHz4ZVKfd51MmXeS/YbM8UrN
         vqYYnLLYlOAn9yBmQ2uDtmDzk6MU5UcdV4xSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717766956; x=1718371756;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdDYQkP2ytNtpw0wruf+bz50cXG6xxExDHZziiKfyuU=;
        b=vrxkDO2RKF8XtaeECOG08Pel0UNq6DWn+VKMRFvQ+6KsWrzvI0AeE3AxcsXuaQlZQP
         ZRoMlYcsYq6faiZ0gs6VsmRmLg3fmMxdd3ESzHh8bwqk48FTGK41QBQRbci6Y9ARcZ4e
         NIy58SD3oUQgi+pjmE909u/j+Dk5s+N9Y3fDNZuXXAoNV+8yKCOiAd5wMd/lGOKkc/Xm
         SIt3ZTVFTck+4NHDENYVoCRBMINFu/QGA0tsmvEz/QHA1Y6p2RTqcNgAGdCfI0vhpAT2
         hr/eCSmpo/1kEff6uZHxgPKpWQMWg6eTCicnKITu/ADyH/M3Dds3331QeHTHudrJ9FYa
         6Fig==
X-Forwarded-Encrypted: i=1; AJvYcCVX0ZRuGx1JHOJTQ0yKNRJD9rhGv71dL/9gZI1Y3e0cuIVXoZcnEd9PHL+RCalEDV+FfeHuhleIwBnPo8F1KkrdBegE7vlDJkJo8g8=
X-Gm-Message-State: AOJu0YwxH5RNxFsf6BXWOYOhwN8Oafs/ZR6zMBZa/SFizhhwyJv+V83O
	E9Dre5+09uH6fNnY6iqiYMzZX8SXujE5FvyW3cd619cUwuEeziA6ThQpmu0iHdirKAbkd2lvJuI
	XvA==
X-Google-Smtp-Source: AGHT+IEBBnLuWqCUus5o4enX/q7jE34i+WQy5pStPa5O0apqbg73HIplOB7d/0gBYHMKE9ZkXai9BA==
X-Received: by 2002:aca:2107:0:b0:3c5:eed2:e244 with SMTP id 5614622812f47-3d210d8019dmr2671389b6e.30.1717766956172;
        Fri, 07 Jun 2024 06:29:16 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d20b66ca2csm637904b6e.3.2024.06.07.06.29.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 06:29:15 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d218ea7750so107758b6e.3
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2024 06:29:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAk15dfu5zJliaBuD2WSBv07E+s5DCi+G6g0UqTFOEXUtzNNJ6gVQtD/nJ0Vbbz0LY+uQT++wXBqSo1sgV6go1WKfY92RglASQz44=
X-Received: by 2002:a05:6808:253:b0:3c9:c5e8:453d with SMTP id
 5614622812f47-3d210d1cd5cmr2621476b6e.8.1717766954833; Fri, 07 Jun 2024
 06:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ-JD0YbaZaB-iB_HkqjA5EZmzcj4MZ1FBqwLFv5PGQDpy6hhQ@mail.gmail.com>
 <CANiDSCtkjcvMqL5wN_CkFHbs_0f=f8c80zYjSpuCj9NNHyUAhA@mail.gmail.com>
 <CAJ-JD0ZhaOy_H=zP76=GA9Tf+cnJxfAQOcDZdB7BEumf2jB8zQ@mail.gmail.com>
 <CANiDSCuaFG9Rm8hXdD2QKF6sj3gOgsiqQ8iWFyNQQxvN6M_dfg@mail.gmail.com>
 <CAJ-JD0aPfFvqmT_Z_EKwK9agPCK3WBht3pARiCHT-RUdRppWhA@mail.gmail.com> <CAJ-JD0bMiaHY9htFOVx10CAe_bCtyVHF=+Xt2TnLFyQsfWMOeg@mail.gmail.com>
In-Reply-To: <CAJ-JD0bMiaHY9htFOVx10CAe_bCtyVHF=+Xt2TnLFyQsfWMOeg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 7 Jun 2024 15:29:02 +0200
X-Gmail-Original-Message-ID: <CANiDSCusrLkm=NG3dzg743U9HgRgMvGaKBxMhymCW9sHRyxPVw@mail.gmail.com>
Message-ID: <CANiDSCusrLkm=NG3dzg743U9HgRgMvGaKBxMhymCW9sHRyxPVw@mail.gmail.com>
Subject: Re: UVC device not listed in Supported devices list and is not working.
To: vdm736@gmail.com, Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vadim

On Fri, 7 Jun 2024 at 15:26, <vdm736@gmail.com> wrote:
>
> Hi Ricardo,
>
> I tried the following commands:
>
> sudo modprobe -r snd_usb_audio
> sudo modprobe -r uvcvideo
> sudo modprobe uvcvideo
> sudo modprobe snd_usb_audio
>
> and the camera starts to work. However I think this is only until the
> next kernel update.

I think it is time to update your ubuntu:

https://www.reddit.com/r/archlinux/comments/r9l32r/live_cam_sync_hd_usb_web=
cam_not_working/




>
> Thanks,
> Vadim
>
> On Fri, Jun 7, 2024 at 9:05=E2=80=AFAM <vdm736@gmail.com> wrote:
> >
> > Hi Ricardo,
> >
> > I filed the bug to Ubuntu: https://bugs.launchpad.net/ubuntu
> > Please find output of dmesg and uname -a commands in the attached file.
> >
> > Thanks,
> > Vadim.
> >
> >
> > On Thu, Jun 6, 2024 at 5:43=E2=80=AFPM Ricardo Ribalda <ribalda@chromiu=
m.org> wrote:
> > >
> > > Hi
> > >
> > > On Thu, 6 Jun 2024 at 22:12, <vdm736@gmail.com> wrote:
> > > >
> > > > Hi Ricardo,
> > > > Thanks for prompt response.
> > > >
> > > > I used Cheese and guvcview applications. Both of them show the mess=
age
> > > > "No device found".
> > > > lsusb command shows:
> > > > Bus 003 Device 003: ID 041e:4095 Creative Technology, Ltd Live! Cam
> > > > Sync HD [VF0770]
> > > >
> > > > Below is output of dmesg command regarding my web camera:
> > > > [25837.672097] usb 3-2: USB disconnect, device number 3
> > > > [25886.880046] usb 3-2: new high-speed USB device number 5 using xh=
ci_hcd
> > > > [25887.125008] usb 3-2: New USB device found, idVendor=3D041e,
> > > > idProduct=3D4095, bcdDevice=3D10.20
> > > > [25887.125014] usb 3-2: New USB device strings: Mfr=3D3, Product=3D=
1, SerialNumber=3D2
> > > > [25887.125017] usb 3-2: Product: Live! Cam Sync HD VF0770
> > > > [25887.125020] usb 3-2: Manufacturer: Creative Technology Ltd.
> > > > [25887.125023] usb 3-2: SerialNumber: 2015022758232
> > > > [25887.135812] usb 3-2: 3:0: cannot get min/max values for control =
2 (id 3)
> > > > [25887.767654] usb 3-2: 3:0: cannot get min/max values for control =
2 (id 3)
> > > > [25887.769434] usb 3-2: 3:0: cannot get min/max values for control =
2 (id 3)
> > > > [25887.771620] usb 3-2: 3:0: cannot get min/max values for control =
2 (id 3)
> > > > [25887.772591] usb 3-2: 3:0: cannot get min/max values for control =
2 (id 3)
> > > >
> > > > If it is not enough I can send you the whole dmesg output.
> > > > I filed the bug for that problem (bug number 2064882) which has a m=
ore
> > > > detailed description. They refer me to support.
> > > Where did you file the bug?
> > >
> > >
> > > Can you try this:
> > >
> > > dmesg -c
> > > rmmod uvcvideo
> > > modprobe uvcvideo trace=3D0xffffffff
> > >
> > > and after that share the output of dmesg and uname -a
> > >
> > >
> > > Thanks!
> > >
> > >
> > >
> > > > This is actually a known problem. If you make a Google search with =
the
> > > > line: "ID 041e:4095 Creative Technology, Ltd Live! Cam Sync HD
> > > > [VF0770]", you will find some information about this kernel bug.
> > > >
> > > > Thanks,
> > > > Vadim
> > > >
> > > >
> > > > On Thu, Jun 6, 2024 at 11:08=E2=80=AFAM Ricardo Ribalda <ribalda@ch=
romium.org> wrote:
> > > > >
> > > > > Hi Vadim
> > > > >
> > > > > What have you done to test it?
> > > > >
> > > > > Can you share the output of dmesg when you connect the device?
> > > > >
> > > > > Thanks!
> > > > >
> > > > > On Thu, 6 Jun 2024 at 16:40, <vdm736@gmail.com> wrote:
> > > > > >
> > > > > > Device ID:  041e:4095
> > > > > > Name:  Creative Technology, Ltd Live! Cam Sync HD [VF0770]
> > > > > > Manufacturer: Creative Labs
> > > > > >
> > > > > >
> > > > > > Vadim
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Ricardo Ribalda
> > >
> > >
> > >
> > > --
> > > Ricardo Ribalda



--=20
Ricardo Ribalda

