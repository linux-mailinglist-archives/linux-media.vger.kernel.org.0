Return-Path: <linux-media+bounces-43406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9185BBABB50
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 08:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 417373B6EA8
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 06:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95812BD022;
	Tue, 30 Sep 2025 06:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rm04bDac"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133B21CF5C6
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 06:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759215209; cv=none; b=iQkTfQGXKQgCg1SqCwa05MJu7tagTDgAu4EZZGPQc9xLISwua95ValXSJG6HLsrVOYSYfQAH96A+8ot2fM7GH3nORenra3K9nZfITIX5h7Yhl6CVpRRmS7DzBxZ2hj//mEEUgMwpXZmgr/B29UvzM7xg8jwcV+6KpDjhiqSps80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759215209; c=relaxed/simple;
	bh=rLHibozUC84bG+v8xmm80Il3aytLJKWivF8lgjkF2Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCq4XXqnu5oHrCkp7YZX9HZuqRoF8cL4TWM92j8yyD4H8mHjTiyGm+kpvD7DegwOkwFusX30sJ46BcakJN/pJd6qrJu4T3k08006SO8f9iGRODIbE04XW0oo9vCy76YBfXokTsfy0jT8dkpi690Qmwrt6s8eCglprV7127ccAz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rm04bDac; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57bd7f0e5baso5359461e87.3
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 23:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759215205; x=1759820005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQnZNwZxYmqipQz4ZH7LUxXQOLRIIzTZFNrqBYFzFoI=;
        b=Rm04bDacEshQzvGv+li+lC4fQE1jtECc0TI279X0MlS8pRn6akNaYlfMhoNNH6jgV+
         Fjp5RfC0P5TdLSl40bQbxgj9OMTH0xoVcYHgw/Uccvzjo3wdJi+Z7G1JFGy/YUoJOtLb
         hCi7KcAHyIM1Ms1XuEhyuwKTmQcGXhojpltTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759215205; x=1759820005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQnZNwZxYmqipQz4ZH7LUxXQOLRIIzTZFNrqBYFzFoI=;
        b=Mntu3/3JPQ/QHdq2Zpw23OdoACHw2oueH3A/YhoK6TVe3zCgO9J7yz+DDiKLV8krIG
         eLY1h2i0e2nyB0FmdVuYQ/nUeCwJrLzBMr6yqpz28SraFI4BLGAfunaSorRTMtQ4MQ8A
         AHTuTLKRrSPE7ELRuKPnS+WTYkZLolrBDemDxQszkoWHN06uXi4dBRdpx4/3bIeTB0dA
         Y7Hi1Usd+KLjeUGr6b8pRHp8Hj4KPsFbjLKE4GehDZ0y1hwZwovb31V6xOTyCnj1smuC
         T0xvYtTo2HWHk9dsqTBYrWh3nL8iFlR0JDlLvn7NGjpf+VSYCFgfLUpGtjO+8W7OpTVt
         KwJw==
X-Forwarded-Encrypted: i=1; AJvYcCXNs9Z2M+aXyv1H3fpwto6+oj7P6ZBiW0vTfzltLpCNlTS4S5/wibw1UYJiOnQMSOQY8zCb0QqVCs5yoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYqJtJIP9wKVwzdMqja3Qev2EfTbgz3O/zE6TBXq6+466P7H5/
	esidi15zg9g9cwocXFZmBYizmlCNDiAC6K4IsqcbNgw7jqlOW/6p+uV/VHGAtSnhn9Mz0HZx0/B
	1ffUDyw==
X-Gm-Gg: ASbGncs2bjJfGChwkLXgKC06Hho3+XlhRF6O2OPC35GQ744PvBtsxvdpsmAwogopuRS
	8lXsAvC6M+y+SQ5UwROBslTR6AJr/B4UBPmccZxcM7svW9Z2A04K6aglaUWNuqCT6qJiwrpCSkv
	t0tWO2+OPAy4iv18DoGFzLtTMPCDIY3ak2pOFgKkuZwSH/18usXO8dlg8G8hXQY2P9Lv0Ib5HGH
	Yx1J5ankN0Vryvfs6bLngartikatdWFWTmM/GAMjUj6iBBGxVKFGzHTL1RT2H3vipw1p7XS6xJh
	0SU7+yFGs/XvC6w4FSIfrUa14IrXgDJMq21i2MxkZ8YC8tnv0gp5dR2qx0vbgC01gc0myGAP/2J
	DKJF8seVDBAKqxcx5ENuzzMBgnjhupU55EDwKJK82VfSUZSvRw6gOoq1fB9RgR5kC4L2D/+mBwd
	vd9iStTso+
X-Google-Smtp-Source: AGHT+IEdsYkudUvT+lzopFEqiQFMPjKME5v7yOjPAJSuYNBGz7OSo8NzC0vTCuhXfK54F2ObdBuLmA==
X-Received: by 2002:a05:6512:b12:b0:55f:7328:f6ae with SMTP id 2adb3069b0e04-582d3ba0ae0mr6824761e87.51.1759215204668;
        Mon, 29 Sep 2025 23:53:24 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58619e6c530sm2483739e87.93.2025.09.29.23.53.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 23:53:23 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57a960fe78fso6525013e87.2
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 23:53:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6Bj8855PEgD1tdhqjTYT1jIAE9jZDTxLmaWYgI47YSXjD1+omXuWjgTF2T0IaWhXOuP/1T2Ula6sGWg==@vger.kernel.org
X-Received: by 2002:a05:6512:3ca5:b0:57a:1c1b:c3c1 with SMTP id
 2adb3069b0e04-582d3114e88mr6783948e87.43.1759215202761; Mon, 29 Sep 2025
 23:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE9VLgX06Evz+VmGs=EwQmVjmu-sU5_1ZzNdO5PWijO--TONpw@mail.gmail.com>
 <c0abe9b8-42a3-45a7-9100-f0c8e7d6abd9@kernel.org> <CANiDSCu0TyjgYnpP+wuk1TdxT=MDCQ0y3_-bgJMVWm-pvoaS9w@mail.gmail.com>
 <e304dc47-9c3b-42f2-8e19-8122208d7e1c@gmail.com>
In-Reply-To: <e304dc47-9c3b-42f2-8e19-8122208d7e1c@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 30 Sep 2025 08:53:10 +0200
X-Gmail-Original-Message-ID: <CANiDSCtxYFQ=8fP6FB0hdbk6K15vzR9m70L76eS=dLQQsscG5w@mail.gmail.com>
X-Gm-Features: AS18NWCfHQQssL_9Jm6wFjt8dNLimZDXhFsQW_63kAa58fEdTLKDLUQwc_J2ycs
Message-ID: <CANiDSCtxYFQ=8fP6FB0hdbk6K15vzR9m70L76eS=dLQQsscG5w@mail.gmail.com>
Subject: Re: uvcvideo driver not properly closing stream, using Webcam Elgato
 Facecam 4K, USB 3.0, UVC 1.5
To: Philippe <philippe.coding73@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe

e like a

On Fri, 26 Sept 2025 at 17:58, Philippe <philippe.coding73@gmail.com> wrote=
:
>
> Hi Ricardo,
>
> Ok, you can find below the kernel logs. I ran following command twice:
>
> v4l2-ctl --device=3D/dev/video0 --stream-mmap --stream-count=3D50
>
> v4l2-ctl --device=3D/dev/video0 --stream-mmap --stream-count=3D50

Thanks for the logs.

As Hans initially said it is very likely a firmware bug.
There are other Elgato devices with stall issues:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/media/usb/uvc?id=3D16045708a3ff0266b1b8cca6198ea50eb80fff6a

Unfortunately I have no access to the hardware, so I cannot try to
hack a solution for it.  Maybe you can try if some of the quirk for
the device works for you:

rmmod uvcvideo; modprobe uvcvideo quirks=3D0x1
try

rmmod uvcvideo; modprobe uvcvideo quirks=3D0x2
try

rmmod uvcvideo; modprobe uvcvideo quirks=3D0x4
try


If that fails and you you have the chance to run the device in windows
and get a couple of usbmon frames, I would be very curious to see how
they turn off/on the device. Maybe we could replicate it in Linux.

Also it would not hurt if you contact ElGato support and share their respon=
se.

Regards!




>
> The behaviour is that it keeps waiting for the first frame when opening
> the second stream. Other webcam (older one) seems to work fine here also
> so I think it is probably related to the brand Elgato doing some quirk
> with UVC 1.5 for the new 4k webcams.
> The audit at the end I'm not sure if that is part of the uvcvideo
> output, I copied everything to be sure.
>
> ````
> [  396.718291] usbcore: deregistering interface driver uvcvideo
> [  418.588069] usb 4-1.2: Probing generic UVC device 1.2
> [  418.588190] usb 4-1.2: Found format MJPG little-endian (0x47504a4d)
> [  418.588202] usb 4-1.2: - 3840x2160 (30.0 fps)
> [  418.588212] usb 4-1.2: - 2560x1440 (30.0 fps)
> [  418.588220] usb 4-1.2: - 1920x1080 (30.0 fps)
> [  418.588227] usb 4-1.2: - 1280x720 (30.0 fps)
> [  418.588234] usb 4-1.2: - 960x540 (30.0 fps)
> [  418.588241] usb 4-1.2: - 640x360 (30.0 fps)
> [  418.588248] usb 4-1.2: - 640x480 (30.0 fps)
> [  418.588256] usb 4-1.2: Found format YUYV little-endian (0x56595559)
> [  418.588264] usb 4-1.2: - 2560x1440 (30.0 fps)
> [  418.588271] usb 4-1.2: - 1920x1080 (30.0 fps)
> [  418.588278] usb 4-1.2: - 1280x720 (30.0 fps)
> [  418.588285] usb 4-1.2: - 960x540 (30.0 fps)
> [  418.588292] usb 4-1.2: - 640x360 (30.0 fps)
> [  418.588299] usb 4-1.2: - 640x480 (30.0 fps)
> [  418.588306] usb 4-1.2: Found format NV12 little-endian (0x3231564e)
> [  418.588313] usb 4-1.2: - 3840x2160 (30.0 fps)
> [  418.588320] usb 4-1.2: - 2560x1440 (30.0 fps)
> [  418.588327] usb 4-1.2: - 1920x1080 (30.0 fps)
> [  418.588334] usb 4-1.2: - 1280x720 (30.0 fps)
> [  418.588341] usb 4-1.2: - 960x540 (30.0 fps)
> [  418.588348] usb 4-1.2: - 640x360 (30.0 fps)
> [  418.588355] usb 4-1.2: - 640x480 (30.0 fps)
> [  418.588383] usb 4-1.2: Found a Status endpoint (addr 85)
> [  418.588393] usb 4-1.2: Found UVC 1.00 device Elgato Facecam 4K
> (0fd9:0092)
> [  418.588405] usb 4-1.2: Scanning UVC chain:
> [  418.588411]  OT 2 <- PU 4 (-> XU 6 XU 7 XU 8) <- SU 3 <- IT 1
> [  418.588445] usb 4-1.2: Found a valid video chain (1 -> 2)
> [  418.588455] usb 4-1.2: Added control
> 00000000-0000-0000-0000-000000000101/2 to device 1.2 entity 4
> [  418.589045] usb 4-1.2: Adding mapping 'Brightness' to control
> 00000000-0000-0000-0000-000000000101/2
> [  418.589064] usb 4-1.2: Added control
> 00000000-0000-0000-0000-000000000101/3 to device 1.2 entity 4
> [  418.589551] usb 4-1.2: Adding mapping 'Contrast' to control
> 00000000-0000-0000-0000-000000000101/3
> [  418.589569] usb 4-1.2: Added control
> 00000000-0000-0000-0000-000000000101/7 to device 1.2 entity 4
> [  418.590048] usb 4-1.2: Adding mapping 'Saturation' to control
> 00000000-0000-0000-0000-000000000101/7
> [  418.590066] usb 4-1.2: Added control
> 00000000-0000-0000-0000-000000000101/8 to device 1.2 entity 4
> [  418.590545] usb 4-1.2: Adding mapping 'Sharpness' to control
> 00000000-0000-0000-0000-000000000101/8
> [  418.590563] usb 4-1.2: Added control
> 00000000-0000-0000-0000-000000000101/10 to device 1.2 entity 4
> [  418.591042] usb 4-1.2: Adding mapping 'White Balance Temperature' to
> control 00000000-0000-0000-0000-000000000101/10
> [  418.591060] usb 4-1.2: Added control
> 00000000-0000-0000-0000-000000000101/1 to device 1.2 entity 4
> [  418.591558] usb 4-1.2: Adding mapping 'Backlight Compensation' to
> control 00000000-0000-0000-0000-000000000101/1
> [  418.591575] usb 4-1.2: Added control
> 00000000-0000-0000-0000-000000000101/4 to device 1.2 entity 4
> [  418.592042] usb 4-1.2: Adding mapping 'Gain' to control
> 00000000-0000-0000-0000-000000000101/4
> [  418.592060] usb 4-1.2: Added control
> 00000000-0000-0000-0000-000000000101/5 to device 1.2 entity 4
> [  418.594497] usb 4-1.2: Adding mapping 'Power Line Frequency' to
> control 00000000-0000-0000-0000-000000000101/5
> [  418.594501] usb 4-1.2: Added control
> 00000000-0000-0000-0000-000000000101/11 to device 1.2 entity 4
> [  418.594994] usb 4-1.2: Adding mapping 'White Balance, Automatic' to
> control 00000000-0000-0000-0000-000000000101/11
> [  418.594998] usb 4-1.2: Added control
> 00000000-0000-0000-0000-000000000001/2 to device 1.2 entity 1
> [  418.595467] usb 4-1.2: Adding mapping 'Auto Exposure' to control
> 00000000-0000-0000-0000-000000000001/2
> [  418.595470] usb 4-1.2: Added control
> 00000000-0000-0000-0000-000000000001/4 to device 1.2 entity 1
> [  418.595988] usb 4-1.2: Adding mapping 'Exposure Time, Absolute' to
> control 00000000-0000-0000-0000-000000000001/4
> [  418.595992] usb 4-1.2: Added control
> 00000000-0000-0000-0000-000000000001/11 to device 1.2 entity 1
> [  418.596463] usb 4-1.2: Adding mapping 'Zoom, Absolute' to control
> 00000000-0000-0000-0000-000000000001/11
> [  418.596467] usb 4-1.2: Added control
> 00000000-0000-0000-0000-000000000001/13 to device 1.2 entity 1
> [  418.596970] usb 4-1.2: Adding mapping 'Pan, Absolute' to control
> 00000000-0000-0000-0000-000000000001/13
> [  418.596973] usb 4-1.2: Adding mapping 'Tilt, Absolute' to control
> 00000000-0000-0000-0000-000000000001/13
> [  418.604755] usb 4-1.2: UVC device initialized
> [  418.604786] usbcore: registered new interface driver uvcvideo
> [  418.608448] usb 4-1.2: uvc_v4l2_open
> [  418.608467] usb 4-1.2: uvc_v4l2_release
> [  418.617182] usb 4-1.2: uvc_v4l2_open
> [  418.617183] usb 4-1.2: uvc_v4l2_open
> [  418.617188] usb 4-1.2: uvc_v4l2_release
> [  418.617189] usb 4-1.2: uvc_v4l2_release
> [  418.617238] usb 4-1.2: uvc_v4l2_open
> [  418.617243] usb 4-1.2: uvc_v4l2_open
> [  418.643303] usb 4-1.2: uvc_v4l2_release
> [  418.644575] usb 4-1.2: uvc_v4l2_release
> [  418.646134] usb 4-1.2: uvc_v4l2_open
> [  418.646152] usb 4-1.2: uvc_v4l2_release
> [  418.646314] usb 4-1.2: uvc_v4l2_open
> [  418.646498] usb 4-1.2: uvc_v4l2_release
> [  418.675134] usb 4-1.2: uvc_v4l2_open
> [  418.676759] usb 4-1.2: uvc_v4l2_release
> [  418.677291] usb 4-1.2: uvc_v4l2_open
> [  418.678621] usb 4-1.2: uvc_v4l2_release
> [  419.648730] usb 4-1.2: uvc_v4l2_open
> [  419.648746] usb 4-1.2: uvc_v4l2_release
> [  419.649206] usb 4-1.2: uvc_v4l2_open
> [  419.661526] usb 4-1.2: uvc_v4l2_release
> [  419.661548] usb 4-1.2: uvc_v4l2_open
> [  419.673458] usb 4-1.2: uvc_v4l2_release
> [  419.673502] usb 4-1.2: uvc_v4l2_open
> [  419.680402] usb 4-1.2: uvc_v4l2_release
> [  419.680411] usb 4-1.2: uvc_v4l2_open
> [  419.680496] usb 4-1.2: uvc_v4l2_release
> [  419.680707] usb 4-1.2: uvc_v4l2_open
> [  419.690671] usb 4-1.2: uvc_v4l2_release
> [  419.690683] usb 4-1.2: uvc_v4l2_open
> [  419.690767] usb 4-1.2: uvc_v4l2_release
> [  422.189951] usb 4-1.2: Suspending interface 1
> [  422.189967] usb 4-1.2: Suspending interface 0
> [  429.141894] usb 4-1.2: uvc_v4l2_open
> [  429.301071] usb 4-1.2: Resuming interface 0
> [  429.301086] usb 4-1.2: Resuming interface 1
> [  429.311060] usb 4-1.2: Control 0x00980927 not found
> [  429.311527] usb 4-1.2: Control 0x00980928 not found
> [  429.339134] usb 4-1.2: Allocated 5 URB buffers of 32x1024 bytes each
> [  430.754374] usb 4-1.2: Frame complete (EOF found)
> [  430.754645] usb 4-1.2: frame 1 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2484148180/2484163180/16
> [  430.755323] usb 4-1.2: Frame complete (EOF found)
> [  430.755614] usb 4-1.2: frame 2 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2484177670/2484192670/16
> [  430.756229] usb 4-1.2: Frame complete (EOF found)
> [  430.756491] usb 4-1.2: frame 3 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2484207160/2484222160/16
> [  430.757108] usb 4-1.2: Frame complete (EOF found)
> [  430.758593] usb 4-1.2: frame 4 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2484233710/2484248710/16
> [  430.759229] usb 4-1.2: Frame complete (EOF found)
> [  430.792008] usb 4-1.2: frame 5 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2484296650/2484311650/16
> [  430.792669] usb 4-1.2: Frame complete (EOF found)
> [  430.825249] usb 4-1.2: frame 6 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2485297990/2485312990/16
> [  430.825948] usb 4-1.2: Frame complete (EOF found)
> [  430.858581] usb 4-1.2: frame 7 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2486294950/2486309950/48
> [  430.859266] usb 4-1.2: Frame complete (EOF found)
> [  430.891899] usb 4-1.2: frame 8 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2487294820/2487309820/16
> [  430.892569] usb 4-1.2: Frame complete (EOF found)
> [  430.925242] usb 4-1.2: frame 9 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2488294420/2488309420/16
> [  430.925878] usb 4-1.2: Frame complete (EOF found)
> [  430.958587] usb 4-1.2: frame 10 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2489294770/2489309770/16
> [  430.959196] usb 4-1.2: Frame complete (EOF found)
> [  430.991890] usb 4-1.2: frame 11 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2490294730/2490309730/48
> [  430.992424] usb 4-1.2: Frame complete (EOF found)
> [  431.025243] usb 4-1.2: frame 12 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2491294180/2491305430/16
> [  431.025743] usb 4-1.2: Frame complete (EOF found)
> [  431.058571] usb 4-1.2: frame 13 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2492294740/2492305990/48
> [  431.059070] usb 4-1.2: Frame complete (EOF found)
> [  431.091879] usb 4-1.2: frame 14 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2493294460/2493305710/16
> [  431.092371] usb 4-1.2: Frame complete (EOF found)
> [  431.125243] usb 4-1.2: frame 15 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2494293790/2494305040/16
> [  431.125751] usb 4-1.2: Frame complete (EOF found)
> [  431.158565] usb 4-1.2: frame 16 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2495294770/2495306020/16
> [  431.159081] usb 4-1.2: Frame complete (EOF found)
> [  431.191877] usb 4-1.2: frame 17 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2496294370/2496305620/16
> [  431.192380] usb 4-1.2: Frame complete (EOF found)
> [  431.225234] usb 4-1.2: frame 18 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2497293820/2497305070/16
> [  431.225744] usb 4-1.2: Frame complete (EOF found)
> [  431.258577] usb 4-1.2: frame 19 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2498294470/2498305720/16
> [  431.259098] usb 4-1.2: Frame complete (EOF found)
> [  431.291876] usb 4-1.2: frame 20 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2499294850/2499306100/16
> [  431.292406] usb 4-1.2: Frame complete (EOF found)
> [  431.325239] usb 4-1.2: frame 21 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2500293790/2500305040/16
> [  431.325747] usb 4-1.2: Frame complete (EOF found)
> [  431.358568] usb 4-1.2: frame 22 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2501294530/2501305780/16
> [  431.359133] usb 4-1.2: Frame complete (EOF found)
> [  431.391880] usb 4-1.2: frame 23 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2502294280/2502309280/16
> [  431.392411] usb 4-1.2: Frame complete (EOF found)
> [  431.425231] usb 4-1.2: frame 24 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2503294060/2503305310/16
> [  431.425820] usb 4-1.2: Frame complete (EOF found)
> [  431.458561] usb 4-1.2: frame 25 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2504294470/2504309470/16
> [  431.459107] usb 4-1.2: Frame complete (EOF found)
> [  431.491881] usb 4-1.2: frame 26 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2505294370/2505305620/16
> [  431.492473] usb 4-1.2: Frame complete (EOF found)
> [  431.525235] usb 4-1.2: frame 27 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2506294030/2506309030/16
> [  431.525796] usb 4-1.2: Frame complete (EOF found)
> [  431.558573] usb 4-1.2: frame 28 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2507294680/2507309680/16
> [  431.559191] usb 4-1.2: Frame complete (EOF found)
> [  431.591879] usb 4-1.2: frame 29 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2508294700/2508309700/16
> [  431.592482] usb 4-1.2: Frame complete (EOF found)
> [  431.625244] usb 4-1.2: frame 30 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2509293910/2509308910/16
> [  431.625844] usb 4-1.2: Frame complete (EOF found)
> [  431.658568] usb 4-1.2: frame 31 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2510294770/2510309770/16
> [  431.659177] usb 4-1.2: Frame complete (EOF found)
> [  431.691881] usb 4-1.2: frame 32 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2511294520/2511309520/16
> [  431.692486] usb 4-1.2: Frame complete (EOF found)
> [  431.725248] usb 4-1.2: frame 33 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2512293940/2512308940/16
> [  431.725804] usb 4-1.2: Frame complete (EOF found)
> [  431.758571] usb 4-1.2: frame 34 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2513295100/2513310100/16
> [  431.759092] usb 4-1.2: Frame complete (EOF found)
> [  431.791892] usb 4-1.2: frame 35 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2514294760/2514306010/16
> [  431.792488] usb 4-1.2: Frame complete (EOF found)
> [  431.825240] usb 4-1.2: frame 36 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2515294150/2515309150/16
> [  431.825818] usb 4-1.2: Frame complete (EOF found)
> [  431.858576] usb 4-1.2: frame 37 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2516294830/2516309830/16
> [  431.859107] usb 4-1.2: Frame complete (EOF found)
> [  431.891886] usb 4-1.2: frame 38 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2517294790/2517306040/16
> [  431.892452] usb 4-1.2: Frame complete (EOF found)
> [  431.925254] usb 4-1.2: frame 39 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2518294150/2518309150/16
> [  431.925820] usb 4-1.2: Frame complete (EOF found)
> [  431.958577] usb 4-1.2: frame 40 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2519295100/2519310100/16
> [  431.959146] usb 4-1.2: Frame complete (EOF found)
> [  431.991886] usb 4-1.2: frame 41 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2520294700/2520309700/16
> [  431.992409] usb 4-1.2: Frame complete (EOF found)
> [  432.025281] usb 4-1.2: frame 42 stats: 0/4/4 packets, 0/0/4 pts
> (!early initial), 3/4 scr, last pts/stc/sof 2521293790/2521305040/16
> [  432.025801] usb 4-1.2: Frame complete (EOF found)
> [  432.058565] usb 4-1.2: frame 43 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2522294500/2522309500/16
> [  432.059130] usb 4-1.2: Frame complete (EOF found)
> [  432.091879] usb 4-1.2: frame 44 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2523294250/2523309250/16
> [  432.092463] usb 4-1.2: Frame complete (EOF found)
> [  432.125228] usb 4-1.2: frame 45 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2524294120/2524309120/16
> [  432.125820] usb 4-1.2: Frame complete (EOF found)
> [  432.158570] usb 4-1.2: frame 46 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2525294410/2525309410/16
> [  432.159146] usb 4-1.2: Frame complete (EOF found)
> [  432.191874] usb 4-1.2: frame 47 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2526294520/2526309520/16
> [  432.192466] usb 4-1.2: Frame complete (EOF found)
> [  432.225227] usb 4-1.2: frame 48 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2527293790/2527308790/16
> [  432.225834] usb 4-1.2: Frame complete (EOF found)
> [  432.258563] usb 4-1.2: frame 49 stats: 0/5/5 packets, 0/0/5 pts
> (!early initial), 4/5 scr, last pts/stc/sof 2528294560/2528309560/16
> [  432.259169] usb 4-1.2: Frame complete (EOF found)
> [  432.329703] usb 4-1.2: uvc_v4l2_release
> [  434.327725] usb 4-1.2: Suspending interface 1
> [  434.327741] usb 4-1.2: Suspending interface 0
> [  439.437330] usb 4-1.2: uvc_v4l2_open
> [  439.594147] usb 4-1.2: Resuming interface 0
> [  439.594162] usb 4-1.2: Resuming interface 1
> [  439.605598] usb 4-1.2: Control 0x00980927 not found
> [  439.606100] usb 4-1.2: Control 0x00980928 not found
> [  439.617707] usb 4-1.2: Allocated 5 URB buffers of 32x1024 bytes each
> [  486.875469] audit: type=3D1400 audit(1758901598.795:285):
> apparmor=3D"AUDIT" operation=3D"userns_create" class=3D"namespace"
> info=3D"Userns create - transitioning profile" profile=3D"unconfined"
> pid=3D5928 comm=3D"(insights)" requested=3D"userns_create"
> target=3D"unprivileged_userns" execpath=3D"/usr/lib/systemd/systemd-execu=
tor"
> [  486.875919] audit: type=3D1400 audit(1758901598.796:286):
> apparmor=3D"DENIED" operation=3D"capable" class=3D"cap"
> profile=3D"unprivileged_userns" pid=3D5928 comm=3D"(insights)" capability=
=3D21
> capname=3D"sys_admin"````
>
>
> Kr,
>
> Philippe
>
>
> On 9/26/25 15:28, Ricardo Ribalda wrote:
> > Hi Philippe,
> >
> > On Sat, 20 Sept 2025 at 13:17, Hans de Goede <hansg@kernel.org> wrote:
> >> Hi Philippe,
> >>
> >> On 20-Sep-25 1:07 PM, Philippe Rivi=C3=A8re wrote:
> >>> Dear,
> >>>
> >>> I have trouble with the uvcvideo driver for a new UVC 1.5 webcam
> >>> (Elgato Facecam 4K). I was wondering if I can ask here for some help
> >>> about it. Below my observations:
> >>>
> >>> First to start, plugging in the webcam I get in the kernel log:
> >>> [  784.408362] usb 4-1.2: Found UVC 1.00 device Elgato Facecam 4K (0f=
d9:0092)
> >>>
> >>>
> >>> set 4k resolution of the webcam to a lower setting to avoid
> >>> potentially it is a bandwidth issue:
> >>>
> >>> v4l2-ctl --device=3D/dev/video0
> >>> --set-fmt-video=3Dwidth=3D1920,height=3D1080,pixelformat=3DMJPG
> >>>
> >>> then I test running twice following command:
> >>> v4l2-ctl --device=3D/dev/video0 --stream-mmap --stream-count=3D1
> >>> --stream-to=3Dframe1.jpg
> >>> v4l2-ctl --device=3D/dev/video0 --stream-mmap --stream-count=3D1
> >>> --stream-to=3Dframe2.jpg
> >> Capturing only 1 frame is a bit of an unusual use-case. It could
> >> be that this is triggering a bug in the firmware of the camera.
> >>
> >> What happens if you just use a normal camera viewing app
> >> and let the camera stream for a couple of seconds and
> >> try that 2 times in a row ?
> >>
> > Could you also try to run something like:
> >
> > ````
> > rmmod uvcvideo
> > modprobe uvcvideo trace=3D0xffffffff
> > ``
> >
> > before you run your tests?
> >
> > That will give us some insight of what is going on in the driver.
> >
> > I have tried to reproduce your error, and everything works fine in my e=
nd.
> >
> > Thanks!
> >
> >
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>> -> first time it works, a frame1 is generated and stored
> >>> -> the command fails the second time, the webcam lights up but no
> >>> frame gets processed, the command keeps waiting for a frame
> >>>     this happens because the v4l2 doesn't properly closes the stream
> >>> the first time
> >>> -> no logs in the kernel log (running "sudo dmesg -w")
> >>>     this means the driver silently fails to reset the stream:
> >>>
> >>> * After VIDIOC_STREAMOFF, the driver doesn=E2=80=99t fully reset the =
internal buffers.
> >>> * Any new VIDIOC_STREAMON request just turns on the LED but never
> >>> produces frames.
> >>>
> >>>
> >>> also trying with gstreamer because it uses pipelines to start / stop =
the stream:
> >>>
> >>> gst-launch-1.0 v4l2src device=3D/dev/video0 num-buffers=3D1 ! jpegdec=
 !
> >>> videoconvert ! pngenc ! filesink location=3Dframe.png
> >>>
> >>> Setting pipeline to PAUSED ...
> >>> Pipeline is live and does not need PREROLL ...
> >>> Pipeline is PREROLLED ...
> >>> Setting pipeline to PLAYING ...
> >>> New clock: GstSystemClock
> >>> Redistribute latency...
> >>> Got EOS from element "pipeline0".
> >>> Execution ended after 0:00:02.392029227
> >>> Setting pipeline to NULL ...
> >>> Freeing pipeline ...
> >>>
> >>> -> first time works
> >>>
> >>> gst-launch-1.0 v4l2src device=3D/dev/video0 num-buffers=3D1 ! jpegdec=
 !
> >>> videoconvert ! pngenc ! filesink location=3Dframe.png
> >>> Setting pipeline to PAUSED ...
> >>> Pipeline is live and does not need PREROLL ...
> >>> Pipeline is PREROLLED ...
> >>> Setting pipeline to PLAYING ...
> >>> New clock: GstSystemClock
> >>>
> >>> -> second time it keeps hanging here , waiting for a frame to process
> >>>
> >>> so for both "v4l2-ctl" and "gst-launch-1.0" the webcam stream does no=
t
> >>> process frames anymore the second time.
> >>>
> >>> I kept the kernel log open all the time but no logs or errors shown..
> >>>
> >>> running following commands resets the webcam and then it works also a=
gain:
> >>>
> >>> sudo modprobe -r uvcvideo
> >>> sudo modprobe uvcvideo
> >>>
> >>> note that "sudo modprobe -r uvcvideo" works in ubuntu 25.10 beta, whe=
n
> >>> I was using ubuntu 24.04 it couldn't reset the uvcvideo driver (it go=
t
> >>> stock telling it was still used by a process, a process hidden so I
> >>> couldn't kill the dependent process)
> >>>
> >>>
> >>> I have tested and got the same behaviour for ubuntu 24.04, 25.04 and
> >>> 25.10 (beta)
> >>> I also tried it in several apps, VLC, OBS, Google meet, Teams but all
> >>> gives the same behaviour which I concludes it is a driver kernel
> >>> issue.
> >>>
> >>> Can you help me to get the uvcvideo driver fixed in the kernel so it
> >>> properly closes webcam streams ?
> >>>
> >>> Kr,
> >>> Philippe
> >>>
> >>> PS: Some info about the webcam:
> >>>
> >>> v4l2-ctl --all --device=3D/dev/video0
> >>> Driver Info:
> >>> Driver name      : uvcvideo
> >>> Card type        : Elgato Facecam 4K
> >>> Bus info         : usb-0000:06:00.0-1.2
> >>> Driver version   : 6.17.0
> >>> Capabilities     : 0x84a00001
> >>> Video Capture
> >>> Metadata Capture
> >>> Streaming
> >>> Extended Pix Format
> >>> Device Capabilities
> >>> Device Caps      : 0x04200001
> >>> Video Capture
> >>> Streaming
> >>> Extended Pix Format
> >>> Media Driver Info:
> >>> Driver name      : uvcvideo
> >>> Model            : Elgato Facecam 4K
> >>> Serial           : xxxx(hidden)
> >>> Bus info         : usb-0000:06:00.0-1.2
> >>> Media version    : 6.17.0
> >>> Hardware revision: 0x00000226 (550)
> >>> Driver version   : 6.17.0
> >>> Interface Info:
> >>> ID               : 0x03000002
> >>> Type             : V4L Video
> >>> Entity Info:
> >>> ID               : 0x00000001 (1)
> >>> Name             : Elgato Facecam 4K
> >>> Function         : V4L2 I/O
> >>> Flags            : default
> >>> Pad 0x01000007   : 0: Sink
> >>>    Link 0x02000019: from remote pad 0x100000a of entity 'Processing 4=
'
> >>> (Video Pixel Formatter): Data, Enabled, Immutable
> >>> Priority: 2
> >>> Video input : 0 (Camera 1: ok)
> >>> Format Video Capture:
> >>> Width/Height      : 3840/2160
> >>> Pixel Format      : 'MJPG' (Motion-JPEG)
> >>> Field             : None
> >>> Bytes per Line    : 0
> >>> Size Image        : 16588800
> >>> Colorspace        : sRGB
> >>> Transfer Function : Default (maps to sRGB)
> >>> YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> >>> Quantization      : Default (maps to Full Range)
> >>> Flags             :
> >>> Crop Capability Video Capture:
> >>> Bounds      : Left 0, Top 0, Width 3840, Height 2160
> >>> Default     : Left 0, Top 0, Width 3840, Height 2160
> >>> Pixel Aspect: 1/1
> >>> Selection Video Capture: crop_default, Left 0, Top 0, Width 3840,
> >>> Height 2160, Flags:
> >>> Selection Video Capture: crop_bounds, Left 0, Top 0, Width 3840,
> >>> Height 2160, Flags:
> >>> Streaming Parameters Video Capture:
> >>> Capabilities     : timeperframe
> >>> Frames per second: 60.000 (60/1)
> >>> Read buffers     : 0
> >>>
> >>> User Controls
> >>>
> >>>                       brightness 0x00980900 (int)    : min=3D-9 max=
=3D9
> >>> step=3D1 default=3D2 value=3D2 flags=3Dhas-min-max
> >>>                         contrast 0x00980901 (int)    : min=3D0 max=3D=
200
> >>> step=3D1 default=3D110 value=3D110 flags=3Dhas-min-max
> >>>                       saturation 0x00980902 (int)    : min=3D0 max=3D=
200
> >>> step=3D1 default=3D140 value=3D140 flags=3Dhas-min-max
> >>>          white_balance_automatic 0x0098090c (bool)   : default=3D1 va=
lue=3D1
> >>>                             gain 0x00980913 (int)    : min=3D0 max=3D=
160
> >>> step=3D1 default=3D0 value=3D0 flags=3Dhas-min-max
> >>>             power_line_frequency 0x00980918 (menu)   : min=3D0 max=3D=
2
> >>> default=3D2 value=3D2 (60 Hz)
> >>> 0: Disabled
> >>> 1: 50 Hz
> >>> 2: 60 Hz
> >>>        white_balance_temperature 0x0098091a (int)    : min=3D2400
> >>> max=3D10000 step=3D100 default=3D4500 value=3D4500 flags=3Dinactive, =
has-min-max
> >>>                        sharpness 0x0098091b (int)    : min=3D0 max=3D=
200
> >>> step=3D1 default=3D100 value=3D100 flags=3Dhas-min-max
> >>>           backlight_compensation 0x0098091c (int)    : min=3D0 max=3D=
1
> >>> step=3D1 default=3D0 value=3D0 flags=3Dhas-min-max
> >>>
> >>> Camera Controls
> >>>
> >>>                    auto_exposure 0x009a0901 (menu)   : min=3D0 max=3D=
3
> >>> default=3D3 value=3D3 (Aperture Priority Mode)
> >>> 1: Manual Mode
> >>> 3: Aperture Priority Mode
> >>>           exposure_time_absolute 0x009a0902 (int)    : min=3D1 max=3D=
1000
> >>> step=3D1 default=3D156 value=3D156 flags=3Dinactive, has-min-max
> >>>                     pan_absolute 0x009a0908 (int)    : min=3D-5184000
> >>> max=3D5184000 step=3D3600 default=3D0 value=3D0 flags=3Dhas-min-max
> >>>                    tilt_absolute 0x009a0909 (int)    : min=3D-2916000
> >>> max=3D2916000 step=3D3600 default=3D0 value=3D0 flags=3Dhas-min-max
> >>>                    zoom_absolute 0x009a090d (int)    : min=3D100 max=
=3D400
> >>> step=3D1 default=3D100 value=3D100 flags=3Dhas-min-max
> >>>
> >>
> >



--=20
Ricardo Ribalda

