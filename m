Return-Path: <linux-media+bounces-33290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B75F8AC2918
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 19:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 746FB4E2164
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 17:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA00298C0D;
	Fri, 23 May 2025 17:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBnUK4U2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1BD81749
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 17:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748022699; cv=none; b=pXVFw62uMYJyr3YE/NSr6bm59fttBapZpyIqiTf0MszsP8Noba83NGOK70AENmUG780wlwb/W7hiQXu0pzTRTYz/jLY57sCX/VqN0Jo7rVzts+1UK/uH5YB4ZGgHihW8xjvIY48jFSO6jauCRAvalpLAwvikHAySfUOwDpf4C1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748022699; c=relaxed/simple;
	bh=hFeVermnfd/mB7zdsBvCXCTvOTwkw7ItyBPyCfBoaqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mh30rnUOJLqoWcNa/Q0dqfr0vc83mbQw9//+vLNZreES/PIfEmiOCWFG8VM/wsgxsww7D2nUb9/Bbqew9vsiC0eavpAWqtccfkAZ+BQOVr0RlMbge+HWmm8dKSi8UgAWrwk61DV1Ptls3wo4N/f3kCeyk5QrXC7jq+pVpibX8F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBnUK4U2; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6016d401501so254893a12.2
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748022696; x=1748627496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoJgngfQ2iytbHzIuZFbBKpoUpvqFdzyULSEHE1jJRM=;
        b=DBnUK4U2o3+hfM2sjMyrdJ3sh6wlCO6c+IaoTjqAgqXCI67f/bd+Azp8di3ZUfduYy
         NGOLUesoyv3/B8Uwk6o1+0218T7dHJq90MiNBWHPQSnNglMBjOFGqrpbKJmqOaYKL6xv
         0FDGZwWmMh99nVZOt6tgnTQ+PfFsNWxooSYyhTXoeV6WRB2Y1kmcjHhOo90+22EsQvjF
         +9UVOGUWSlEULVTp2UVMnf6NFS3opnsFkATecw8RjO9Zj6LBQge94xN4P/jNHMHXw/Ku
         QBhmQCvxi9QDx0fxkDLR/CgltkjA1+FNcSMkzZFvkHPBdvLGaxzOKbY5Fw8D11UZhudT
         0O7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748022696; x=1748627496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoJgngfQ2iytbHzIuZFbBKpoUpvqFdzyULSEHE1jJRM=;
        b=D02fFEaPV5daP4mp9i7uC6uGMGAE2umhesUBk/NoNl5fIJD23bf4iXb8U4Pa/e2cnC
         we6quw+gRSw61/aFjv/cu+Z0W0ArrVx8e8rqaMESAWUXyWzZye2Q0T3DMKSOcSY4037y
         ZfMblWqTtPrCvqqfo4i935/9I9eoonBiK+PkNcNJDJtK/k2Ct/ost0VgHYc9/8ZYp78w
         yK0z7tMe7rdJDBuBk8b1aEBtxJY/1eILS+H5KKIlzs/oUDC0wlfQsiEF9qqX7VLNXkBo
         XAaBcaokMlL8rVsy/h3Tt1tlzjv1OO9mEoVq4AD/jxb0/b5pnsTnwUaFXDJg/Ic+amwQ
         bTBw==
X-Gm-Message-State: AOJu0Yx1eCVWOrCFj+ZCWwucHF8jWl3jJbHlQcbsSr+mlS1gfauNtem/
	MrwS/xP15MPgmeS8WoQ3K8uxLtkD1GYHmR+mXC3TjiM1DdrnXS+tnmoAvr47aL5p/d5s9GAhuWQ
	1ELei0r+57hnId2gDifCp3Vu8W6FgpgzmdQ==
X-Gm-Gg: ASbGnctKdrIfnWEhJOaUwuPATd19wo91R71Md34RMtzg/4BAYvLdM+8dwPSACmCdr1l
	SdLqfSbjicdZTZrMq5iiEvtUDaEJlhd8s9xE2c5P2yqQAqOS9ABRFJasNFbqMW2HR7wQeiT0Njk
	2kY1NH7Ptfk8uxw1UwTbE4Ym+wJMRK790dzg==
X-Google-Smtp-Source: AGHT+IE/cf9V0x+TL6q2PG3ferB6uN7/uHSrlqPvIJRHQjNKePYMpqMN8z2o/TrZqjqpijJ7S+prkn/ezCfAIS4fdnc=
X-Received: by 2002:a17:906:6a1b:b0:ad2:5408:bf1a with SMTP id
 a640c23a62f3a-ad85b2da4edmr5507166b.61.1748022695414; Fri, 23 May 2025
 10:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOzCab90jOw9Euh84T301WOxh1R_TJse+AbNupYHR_1MF9vYLg@mail.gmail.com>
 <CANiDSCuKHWCQbKZcFCWZ8hP2ZLNEYQYTL0w3S6sZFHp428A5PA@mail.gmail.com>
In-Reply-To: <CANiDSCuKHWCQbKZcFCWZ8hP2ZLNEYQYTL0w3S6sZFHp428A5PA@mail.gmail.com>
From: Jerry Quinn <quinnj@gmail.com>
Date: Fri, 23 May 2025 13:51:24 -0400
X-Gm-Features: AX0GCFs7uuP0o5E8ySGE2Frr17STm9npYos-k3bsBlra72MgtcYjHKhf7Nl2LqI
Message-ID: <CAOzCab-v7ON4eUwmYYqwF-MAUd58PzgABgtTOkxz-yF-gQn4Qw@mail.gmail.com>
Subject: Re: USB UVC webcam cannot capture
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixed! Apparently the camera isn't getting enough power.  Plugging it
directly into the machine instead of a USB port on the monitor enabled
the video.
Thank you for the suggestion.  It didn't occur to me that lower power
might create a partially usable device vs completely dead one.

I'll update and close the bug as well.

Thanks
Jerry Quinn


On Fri, May 23, 2025 at 1:21=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Hi Jerry
>
> In your dmesg I am seeing some
> usb 3-11.3: USB disconnect, device number 17
>
> I am not sure if that is you removing the camera or the camera
> deciding to leave the party on its own.
> Have you tried connecting the camera to a different port? And using a
> powered usb hub?
>
> If that doesn't work:
>
> Could you try to increase the trace level to the max?:
> rmmod uvcvideo; modprobe uvcvideo trace=3D0xffffffff
>
> And enabling v4l2 debugging:
> echo 255 > /sys/class/video4linux/video0/dev_debug
>
> Then capture a frame with v4l2-ctl or cheese.
>
> and then share the dmesg output.
>
> Thanks!
>
>
> On Fri, 23 May 2025 at 01:57, Jerry Quinn <quinnj@gmail.com> wrote:
> >
> > Hi folks,
> > I have a USB Sonix Technology L01 HD webcam that fails to capture
> > video.  I get a protocol error when trying to capture frames with the
> > current mainline kernel.
> >
> > I'm running the following to try to debug it:
> >
> > jlquinn@cerberus:~$ v4l2-ctl --device /dev/video0 --stream-mmap
> > --stream-to=3Dframe.raw --stream-count=3D1
> > VIDIOC_STREAMON returned -1 (Protocol error)
> >
> > I've created a bugzilla report for this issue:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D220148
> >
> > This is the kernel build I used:
> > https://kernel.ubuntu.com/mainline/v6.15-rc7/amd64/
> >
> > jlquinn@cerberus:~/sw/src/cod/mainline/v6.15-rc7$ cat /proc/version
> > Linux version 6.15.0-061500rc7-generic (kernel@balboa)
> > (x86_64-linux-gnu-gcc-14 (Ubuntu 14.2.0-23ubuntu1) 14.2.0, GNU ld (GNU
> > Binutils for Ubuntu) 2.44) #202505182143 SMP PREEMPT_DYNAMIC Sun May
> > 18 22:13:39 UTC 2025
> >
> > jlquinn@cerberus:~/sw/src/cod/mainline/v6.15-rc7$ hostnamectl | grep
> > "Operating System"
> > Operating System: Ubuntu 24.04.2 LTS
> >
> >
> > My device is:
> > [ 2047.142578] usb 3-11.3: New USB device found, idVendor=3D26e0,
> > idProduct=3D6230, bcdDevice=3D 1.00
> > [ 2047.142594] usb 3-11.3: New USB device strings: Mfr=3D2, Product=3D1=
,
> > SerialNumber=3D3
> > [ 2047.142600] usb 3-11.3: Product: L01 HD Webcam
> > [ 2047.142604] usb 3-11.3: Manufacturer: Sonix Technology Co., Ltd.
> > [ 2047.142608] usb 3-11.3: SerialNumber: SN0001
> > [ 2047.144927] usb 3-11.3: Found UVC 1.00 device L01 HD Webcam   (26e0:=
6230)
> >
> > dmesg, lsusb, and v4lc-compliance output and kernel config are
> > attached to the bug report.
> >
> > Please let me know if I can provide anything else to help with looking
> > at this issue.
> >
> > Thanks
> > Jerry Quinn
> >
>
>
> --
> Ricardo Ribalda

