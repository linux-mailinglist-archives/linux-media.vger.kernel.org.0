Return-Path: <linux-media+bounces-30961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 232DAA9B5AC
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 19:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AA7B176CC5
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 17:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E783D28A1F2;
	Thu, 24 Apr 2025 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="YJiEOp3z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806142820D5
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 17:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745516932; cv=none; b=iPi3Zj3uWQF6+N1CB2AKY7Nr7EQNUjUpQaEKsHQCtwWZQFAOTB1YjqomuoqPULJ8skAGXt3hE+F3qvf1HJo8LaO7Hvow8U2deLlHFA6yguaizW+wh+3hH+0qsJdv6P9+dnOLrYLOzFr/ijypBVvGsxEYdT+N4X7mSqbZAsRuTxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745516932; c=relaxed/simple;
	bh=APfxosrQqX1Vkn0dp3vBuafdQv73bwwXKz0KJ6HoY3E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RoShzai9eAEzsbNUUVH+6W9X7XKLkPdiMKykgC2qZ6eCKQQQttoCoL3O7mcMOwcrJVM4R8GTgxDpcl2ds4wQWBLkGaWMsBqvLzk0ZaLcvBkQIOSxUngPhilGKuFlZM3EIWDD19HsRckRjlY4k/zXO+lS2poz/q3iwTGHxHqLHQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=YJiEOp3z; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c55500cf80so115400085a.1
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 10:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745516929; x=1746121729; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=APfxosrQqX1Vkn0dp3vBuafdQv73bwwXKz0KJ6HoY3E=;
        b=YJiEOp3z0n3XabtO9hT/d3teO7OAY5zTZhypmThKEiStuabGGp22YoQcy7+33F8aMh
         +CpDWyHVYRzh0P1ZXuq0FkMVIjXS4R0XlzI7YuxwRFfzgghR/Xykk5AJVTz83QPIJUTr
         nn1p0amgEG91HxI/YQT9MHwNnVjyYy7i6YchRONCiMPqlEd8TUn6+LPYiSWBUBzTDSjI
         E7MHwtL6MqPfA1TP9Nx/0eFQLQUd0YT8JF9XDpKm1+5e9MHIDnVXJyyWbUtp/cDdOU7f
         pA2CeVfb4TFbLWOi5XlmKk+CUKx5sJjTsjN0BR1Jpo8Myjj9YedZeLJHj/doQwBJcxYn
         0jsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516929; x=1746121729;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=APfxosrQqX1Vkn0dp3vBuafdQv73bwwXKz0KJ6HoY3E=;
        b=pegtsJSOFwRsP+RETnkmdC/9Had5rjluXK7GrMxumsKhUwVSUGsK2bgs6LcCMuLeHq
         VcSGjXReHLkA3FLllJILpSlLkC+KZ3LN+HOTK5LSRa2khhM1q9RQMYrHptq1Eux0Rz0f
         B56Hc5Q+ognPkwdMrCWE+VTwSyCEsdcWb7HNwU9Uok8m9d/51emBzTjLozlzZ7pF0y9J
         tW0Xfo7A/r0PmSm6X7ynU/FaBuTpNLE16sAi/lvjVDzSD4Bex/Nzig4J3O+2pcEdHaKP
         hG5XaLl8ZW9vAd/C/H4a+grvIVYk/7yTVpW3jIfTkSBFNrQC0/hw4LhuwId8tPf4Xz+T
         wcYA==
X-Forwarded-Encrypted: i=1; AJvYcCX1ovkwxb1TUn8t78kyWXVBXOrk/ClmSf8IOkDpNiL76CnVdY3MCxvQK2ZXoss18IWsf7hhrph/X2Tpiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHKxvQQSgOD521/adE7oLzVjBJApjxrDV3c/OAPAw+EWPlvVAr
	CgxBDJa4DXjsucBwIAdKa+z8/+v1OcZ4Vv06nJD+W+KCRzBhCcRvST0+DVRKkBIjrscnVfnNVSy
	8
X-Gm-Gg: ASbGncu0RXx8C/GAF0PKHEf2hXQEmmdgWlNNhabJX7zeJwotj0YkJjrhDmKtOF/4XF0
	wVdQHktVMf7m1iJ2X/gXhbZCVPv92Vd+Aq/tEaZzZ3Ig+zCtfpMk1KhNeDgCGh8ZdMPcozmbcsz
	/rYUQCfBQUDReAKs4rauXy69SHn7aGEivs8214IhT5qfJfJkEkJlzZ1pHvO2ivwggCQWACWrFzV
	VQOHAt0pVicCdnnkPNIrYtBjE4oWM4PDnzVXiQgiP0jrCfxSBbrj4w/Fl15e+NZPFcxfc3eOSS/
	jK/xxLuQif4i0W1M+JunpxhudKCNDISwKRQWpe4b0FaNVw==
X-Google-Smtp-Source: AGHT+IGVbekwpDZ56HV4ly5W2SuID+/mZmtJ90eI5ap1fV9LBwQGsta90PQ6VJHFwAmLSN2tHcwMuQ==
X-Received: by 2002:a05:620a:2442:b0:7c7:5b32:1af9 with SMTP id af79cd13be357-7c95ef16dd7mr52869885a.25.1745516929302;
        Thu, 24 Apr 2025 10:48:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e7c001sm112120485a.82.2025.04.24.10.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:48:48 -0700 (PDT)
Message-ID: <36f103950ec597b5c807220028a9b46f1668db30.camel@ndufresne.ca>
Subject: Re: upstream unicam not returning any buffer
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Maxime Ripard
	 <mripard@redhat.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	linux-media@vger.kernel.org
Date: Thu, 24 Apr 2025 13:48:48 -0400
In-Reply-To: <CAPY8ntCzNckv8j0-yw-KmhS-CzXuMus6Q37XR-JS_xJD8=Qxeg@mail.gmail.com>
References: <20250424-exuberant-carp-from-pluto-cce66c@houat>
	 <CAPY8ntCzNckv8j0-yw-KmhS-CzXuMus6Q37XR-JS_xJD8=Qxeg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 24 avril 2025 =C3=A0 18:12 +0100, Dave Stevenson a =C3=A9crit=C2=
=A0:
> Hi Maxime
>=20
> On Thu, 24 Apr 2025 at 15:58, 'Maxime Ripard' via kernel-list
> <kernel-list@raspberrypi.com> wrote:
> >=20
> > Hi,
> >=20
> > I've been trying to port a v4l2 application from the downstream unicam
> > driver (with the 6.6 kernel) to upstream (6.13.11) kernel.
> >=20
> > While the application seemed to work ok with the downstream driver, the
> > same code will never get any buffer from the upstream unicode driver.
> > Either dqbuf will block forever (if it's blocking), or never return a
> > buffer (if it's non-blocking).
> >=20
> > The media-controller topology after the application configured it is:
> >=20
> > Media controller API version 6.13.11
> >=20
> > Media device information
> > ------------------------
> > driver=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unicam
> > model=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unica=
m
> > serial
> > bus info=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 platform:fe801000.cs=
i
> > hw revision=C2=A0=C2=A0=C2=A0=C2=A0 0x0
> > driver version=C2=A0 6.13.11
> >=20
> > Device topology
> > - entity 1: unicam (3 pads, 3 links, 0 routes)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type=
 V4L2 subdev subtype Unknown flags 0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devi=
ce node name /dev/v4l-subdev0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pad0: SINK
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorsp=
ace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <- "tc358743 5-000f":0 [ENABLED,IMMUTABLE]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pad1: SOURCE
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorsp=
ace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -> "unicam-image":0 [ENABLED,IMMUTABLE]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pad2: SOURCE
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -> "unicam-embedded":0 [ENABLED,IMMUTABLE]
> >=20
> > - entity 5: tc358743 5-000f (1 pad, 1 link, 0 routes)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type=
 V4L2 subdev subtype Unknown flags 0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devi=
ce node name /dev/v4l-subdev1
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pad0: SOURCE
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorsp=
ace:srgb]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [dv.caps:BT.656/1120 min:640x350@13000000 max:1920x12=
00@165000000 stds:CEA-861,DMT,CVT,GTF caps:progressive,reduced-blanking,cus=
tom]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [dv.detect:BT.656/1120 1280x720p60 (1650x750) stds: f=
lags:]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [dv.current:BT.656/1120 1280x720p60 (1650x750) stds: =
flags:]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -> "unicam":0 [ENABLED,IMMUTABLE]
> >=20
> > - entity 9: unicam-image (1 pad, 1 link)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type=
 Node subtype V4L flags 1
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devi=
ce node name /dev/video0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pad0: SINK
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <- "unicam":1 [ENABLED,IMMUTABLE]
> >=20
> > - entity 15: unicam-embedded (1 pad, 1 link)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 type Node subtype V4L flags 0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 device node name /dev/video1
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pad0: SINK
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <- "unicam":2 [ENABLED,IMMUTABLE]
> >=20
> > The interrupt count in /proc/interrupts increases with a somewhat
> > reasonable rate, so it looks like I'm getting interrupts.
> >=20
> > Enabling the debug output of the unicam driver gives the following logs=
:
> >=20
> > [ 2522.686656] unicam fe801000.csi: Starting stream on image device
> > [ 2522.687230] unicam fe801000.csi: Running with 2 data lanes, nodes 1
> > [ 2522.847079] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequen=
ce 0, lines done 0
> > [ 2522.847105] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2522.914545] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequen=
ce 0, lines done 819
> > [ 2522.914569] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2522.947477] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequen=
ce 0, lines done 1638
> > [ 2522.947499] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2522.964145] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequen=
ce 0, lines done 2457
> > [ 2522.964167] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2522.997077] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequen=
ce 0, lines done 3276
> > [ 2522.997100] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2523.013744] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequen=
ce 0, lines done 1059226
> > [ 2523.013764] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2523.064544] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequen=
ce 0, lines done 1059226
> > [ 2523.064566] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2523.081210] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequen=
ce 0, lines done 1059226
> > [ 2523.081230] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2523.130810] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequen=
ce 0, lines done 1059226
> > [ 2523.130833] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > [ 2523.247880] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequen=
ce 0, lines done 1059226
> > [ 2523.247902] unicam fe801000.csi: Scheduling dummy buffer for node 0
> >=20
> > Do you know what could be going on? I tried to compare the upstream and
> > downstream unicam drivers, and the interrupt handler seems to be
> > slightly different, but I'm afraid I'm a bit out of my depth there.
>=20
> I must admit to not having run the upstream driver in anger.
>=20
> Your interrupt traces are odd for at least two reasons.
>=20
> ISTA always being 0x1 means only frame start events. No frame end
> (0x2) or line count interrupts (0x4).
> You should be getting 4 line count interrupts every frame or every 128
> lines if greater, and frame end at the end of each frame. Your
> interrupts are every 16.6ms (ish), which would follow with being FS
> only.
>=20
> "lines done" is incrementing by more than the 720 lines expected for
> the configured resolution. I suspect that it has updated the write
> address to the new buffer, and they just happen to be contiguous (at
> least to start with).
> Downstream has code that (incorrectly) returns the buffer to the
> internal queue if we get repeated FS events, but it probably wants to
> return them to userspace with VB2_BUF_STATE_ERROR.
>=20
> I'll try to find a few minutes to battle the upstream driver with
> tc358743 and see what I get.
>=20
> I have just noticed that 6.13 didn't get a backport of
> https://github.com/torvalds/linux/commit/697a252bb2ea414cc1c0b4cf4e3d94a8=
79eaf162.
> I don't know if that would affect you (gut feel is not).

It didn't have a Fixes tag, so unless someone send it with CC stable,
this won't happen.

cheers,
Nicolas

>=20
> > Also, and while it seems unrelated (it happens when exiting the
> > application), I'm getting:
> >=20
> > [=C2=A0 452.053788] ------------[ cut here ]------------
> > [=C2=A0 452.058502] WARNING: CPU: 3 PID: 734 at drivers/media/common/vi=
deobuf2/videobuf2-core.c:2222 __vb2_queue_cancel+0x260/0x2f0 [videobuf2_com=
mon]
> > [=C2=A0 452.071517] Modules linked in: vc4 hci_uart snd_soc_hdmi_codec =
btqca bcm2835_v4l2(C) snd_soc_core btrtl btbcm btsdio btintel brcmfmac_wcc =
bluetooth bcm2835_mmal_vchiq(C) ac97_bus snd_pcm_dmaengine videobuf2_vmallo=
c bcm2835_unicam snd_compress brcmfmac drm_dma_helper tc358743 v4l2_dv_timi=
ngs videobuf2_v4l2 v4l2_fwnode videobuf2_dma_contig cpufreq_dt v4l2_async v=
ideodev brcmutil snd_bcm2835(C) drm_display_helper videobuf2_memops raspber=
rypi_cpufreq v3d snd_pcm videobuf2_common snd_timer pwrseq_core vfat fat sn=
d soundcore mc cfg80211 bcm2711_thermal cec vchiq(C) broadcom bcm_phy_ptp b=
cm_phy_lib ledtrig_default_on gpu_sched i2c_mux_pinctrl leds_gpio genet pwm=
_bcm2835 iproc_rng200 i2c_mux mdio_bcm_unimac rfkill loop fuse nfnetlink re=
set_gpio gpio_raspberrypi_exp pwrseq_simple dwc2 crct10dif_ce raspberrypi_h=
wmon i2c_brcmstb clk_bcm2711_dvp udc_core sdhci_iproc bcm2835_wdt i2c_bcm28=
35 sdhci_pltfm bcm2835_dma sdhci phy_generic nvmem_rmem mmc_block rpmb_core=
 mmc_core
> > [=C2=A0 452.157993] CPU: 3 UID: 0 PID: 734 Comm: dradis.bin Tainted: G=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 C=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 6.13.11 #252
> > [=C2=A0 452.166655] Tainted: [C]=3DCRAP
> > [=C2=A0 452.169663] Hardware name: raspberrypi Raspberry Pi 4 Model B R=
ev 1.1/Raspberry Pi 4 Model B Rev 1.1, BIOS 2024.10 10/01/2024
> > [=C2=A0 452.181140] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SS=
BS BTYPE=3D--)
> > [=C2=A0 452.188207] pc : __vb2_queue_cancel+0x260/0x2f0 [videobuf2_comm=
on]
> > [=C2=A0 452.194503] lr : __vb2_queue_cancel+0x48/0x2f0 [videobuf2_commo=
n]
> > [=C2=A0 452.200707] sp : ffff800080e4bb30
> > [=C2=A0 452.204068] x29: ffff800080e4bb40 x28: 0000000000000009 x27: 00=
00000000000000
> > [=C2=A0 452.211321] x26: ffff40e6cda48b98 x25: 00000000400004d8 x24: 00=
000000000e001b
> > [=C2=A0 452.218573] x23: ffff40e6d064b280 x22: 0000000000000000 x21: ff=
ff40e6d278c8b8
> > [=C2=A0 452.225824] x20: ffff40e6d278c630 x19: ffff40e6d278c738 x18: 00=
000000dbfbb796
> > [=C2=A0 452.233076] x17: 0000000000000000 x16: ffffc258986100e0 x15: 00=
000002d9a24a9e
> > [=C2=A0 452.240328] x14: 0000000000000000 x13: 00000002d9c4d651 x12: ff=
ff40e6c08fa640
> > [=C2=A0 452.247578] x11: 0000000000000000 x10: 0000000000000000 x9 : 00=
00000100000000
> > [=C2=A0 452.254829] x8 : 0000000000000002 x7 : 0000000000008080 x6 : 00=
000000a6000004
> > [=C2=A0 452.262079] x5 : ffff800080e4b87a x4 : ffff40e6ff99a780 x3 : 00=
00000000000000
> > [=C2=A0 452.269329] x2 : 0000000000000001 x1 : 0000000000000000 x0 : 00=
00000000000000
> > [=C2=A0 452.276581] Call trace:
> > [=C2=A0 452.279061]=C2=A0 __vb2_queue_cancel+0x260/0x2f0 [videobuf2_com=
mon] (P)
> > [=C2=A0 452.285357]=C2=A0 vb2_core_queue_release+0x2c/0x88 [videobuf2_c=
ommon]
> > [=C2=A0 452.291472]=C2=A0 vb2_fop_release+0x80/0xc0 [videobuf2_v4l2]
> > [=C2=A0 452.296791]=C2=A0 v4l2_release+0xa8/0x128 [videodev]
> > [=C2=A0 452.301474]=C2=A0 __fput+0xa0/0x318
> > [=C2=A0 452.304583]=C2=A0 ____fput+0x20/0x38
> > [=C2=A0 452.307775]=C2=A0 task_work_run+0xb8/0xe8
> > [=C2=A0 452.311410]=C2=A0 do_exit+0x220/0x9c0
> > [=C2=A0 452.314688]=C2=A0 do_group_exit+0x7c/0xb0
> > [=C2=A0 452.318317]=C2=A0 get_signal+0x76c/0x878
> > [=C2=A0 452.321860]=C2=A0 do_signal+0xa4/0x1d8
> > [=C2=A0 452.325227]=C2=A0 do_notify_resume+0x70/0x160
> > [=C2=A0 452.329209]=C2=A0 el0_svc+0x70/0xe0
> > [=C2=A0 452.332313]=C2=A0 el0t_64_sync_handler+0x78/0x108
> > [=C2=A0 452.336650]=C2=A0 el0t_64_sync+0x19c/0x1a0
> > [=C2=A0 452.340368] ---[ end trace 0000000000000000 ]---
> > [=C2=A0 452.345101] videobuf2_common: driver bug: stop_streaming operat=
ion is leaving buffer 1 in active state
> > [=C2=A0 452.354584] videobuf2_common: driver bug: stop_streaming operat=
ion is leaving buffer 2 in active state
>=20
> I'm guessing this is exit without closing file handles cleanly, ie ctrl-c=
.
> Somewhere along the line a couple of buffers haven't been cancelled with =
vb2.
>=20
> Downstream I'd originally copied atmel-isi (IIRC) and the handling it
> had. The upstream driver is just using vb2_fop_release, and I can't
> immediately see the path that would call streamoff in those
> situations.
> Setting CONFIG_VIDEO_ADV_DEBUG appears to dump a load of stats for
> unbalanced things in vb2_queue_free, so it'd be interesting to know
> what that reported.
> (https://elixir.bootlin.com/linux/v6.14.3/source/drivers/media/common/vid=
eobuf2/videobuf2-core.c#L606)
>=20
> =C2=A0 Dave

