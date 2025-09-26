Return-Path: <linux-media+bounces-43268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5909BA484C
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 17:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDE8F1C067BC
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 15:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D325A22424C;
	Fri, 26 Sep 2025 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b80KCbLV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0461D6195
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758902303; cv=none; b=f1i5MSFhTSsAK5nN1mc+VJrmDgzNtbLiqudJmO1kixqcp1OuJsaZtozdXflZCtCCJn4UFH+cW7vh2aC7Ci8yQY/MgeHyGPTvq8Br7Zmr6Dq/BUg31BphnfCD7GrIhsddtqOk3F3KUXxsOotEsWDpkjC3vXGoxhe8qDVFQytdWec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758902303; c=relaxed/simple;
	bh=qDfU7tqzxG3ExRAwYy2Kix36tyvZYKJ3F/qNiePCUBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDfGnBb+IkkQBsLGAUWLOpX6jUHDopmDeo6iwYkZRiQm4QB4MrRhMsi1Ogo6MGDmZJqIPimtWk+IyO/z2D7TUzEl2+FDimmBExSsCHyeVfBCuvPAY19edHjBDisLFJKoYxPutvsYfAgcL6nIn8BT5+ZWViGj+ROgEBtJf2oEWjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b80KCbLV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso14717425e9.3
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 08:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758902298; x=1759507098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aykn/MIft16UukFNougyksPdxPxjinmw4e/ZUCf35Ds=;
        b=b80KCbLV6dPvd7gG1lmh1jmZIEV7Fy5OLJ2HNVue34gRgka7bT7a6enhDx+H4ZVzql
         nR1K09jLDsKhQriclhobnfXa/QsMjQBYCfdfhSp/qRBD1pkUbaG6XrcTKT4jjPECFgkC
         wpm5n30Nqb0XyFIoVuBUk10eLj6eU6MoBzm2Iz1CLvMEvG2B5rTTJ0cg70PUb//+FS8y
         WirZXy49w0CJ3xb+F7XPj3jjV3EqbkUkSMjg6/p/HfIL5GFbP4HDY8H0VCHMzd8oDkmm
         E9F4eBaz+oVdn1NpgvaooEtM83+D749zEjoIkCfC219Kodo+p9Pk/yl7z3ekgLGPz5bR
         6uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758902298; x=1759507098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aykn/MIft16UukFNougyksPdxPxjinmw4e/ZUCf35Ds=;
        b=OGqFYcSa0Q0YSsg7UhshH9ClaL8T0FJYcs3Zr9OU73OQvcEcTYhaOlcqtlgtXAN3Jc
         DU2Gt0Y8jonBoeX6njbTGzHQ3WNTuFs3ZfHrOH267A19U1JlaHSVn9ajopG4yHl4C+P/
         A3PkBuE0I4thAL9QOL2A4WL4yiqUuiWEl5dRtkFjyZNprEl7OCW7OJeZRqRSbVQeHR8U
         zLTAsMEPqznfSsh93xK3Sb1s6tlwMVIDehASXUC1ltyyntCJwFDK0u3QpzBQSG+JNNIl
         EcPTad+FgFnJmULG0S+cQgqL76hKtR0uBeVSo6FdXOOAV+2DnTfJdOxrO81CTrygOfd9
         v2tA==
X-Gm-Message-State: AOJu0Yy34gbneY4g6L7wBLRsKyP0s/xdlxGGT2T0ibCCiAB3Ay0Hs7LS
	z0smQkGfJhh6sfDiGUJTppK31PAInWl0CGX+RgE6lGqD+2TMDZwqnjmsHQlAQexSwUI=
X-Gm-Gg: ASbGncscD0y2V1L9coMf3McvTmZMbkF23UFLsA1/qiK6j/GjpfbycnJ2Zqp0a6LVg96
	rNUVViWJxZMp0VaQNoRJ7Z5f+XO+NqdZBo0uKTExeXHYR+OgAVS2cBJLflxBZ/wMY+xiJXFW6or
	swMJ/0diNbV0fdoMPwAlK57R3WwwMZCKS/xCOe44neSgzLOnIoF+7zjPIGTlUXCxsQU3zh0wZHy
	4HEzKDKsD0DUm7jAPVO36h5IxoJE16tmjcMu5WPqwWPRP8dHmumCyCTbkKo3Cb1SZvUPXaCu2k1
	hh5RvJJ6It1TLlruA4wlFJODRIhk7sBHgccyBkf9s3JIpM+Y/s97QVgJ2RNLl98cHwshdosrXHp
	9/yrmE2EbPsUh+99Dca/exJAZbxI6bYRo0YnIxVD5VQjCArDxLqwoMdFUUgIQte8WORRkrTsC8a
	tgg+VB7zwCskmfU4xr/gT2aMMIE1sSXtwtyQ31HOPsYLqQ1Y/muyyncvrHmXxyf2SFITY=
X-Google-Smtp-Source: AGHT+IGAjPTy8yCGNkgfqCqdKTiuwNXJ59wrf2ciEGhB1WGBUosuDpBAl7vMis2z3hrxaylw0jvtEg==
X-Received: by 2002:a05:600c:4683:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-46e32a16bafmr86451595e9.31.1758902297573;
        Fri, 26 Sep 2025 08:58:17 -0700 (PDT)
Received: from ?IPV6:2a02:1810:1d20:4b00:db91:7fbd:4f8:15c4? (2a02-1810-1d20-4b00-db91-7fbd-4f8-15c4.ip6.access.telenet.be. [2a02:1810:1d20:4b00:db91:7fbd:4f8:15c4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab31ea3sm120316865e9.12.2025.09.26.08.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 08:58:17 -0700 (PDT)
Message-ID: <e304dc47-9c3b-42f2-8e19-8122208d7e1c@gmail.com>
Date: Fri, 26 Sep 2025 17:58:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: uvcvideo driver not properly closing stream, using Webcam Elgato
 Facecam 4K, USB 3.0, UVC 1.5
To: Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org
References: <CAE9VLgX06Evz+VmGs=EwQmVjmu-sU5_1ZzNdO5PWijO--TONpw@mail.gmail.com>
 <c0abe9b8-42a3-45a7-9100-f0c8e7d6abd9@kernel.org>
 <CANiDSCu0TyjgYnpP+wuk1TdxT=MDCQ0y3_-bgJMVWm-pvoaS9w@mail.gmail.com>
Content-Language: en-US, nl
From: Philippe <philippe.coding73@gmail.com>
In-Reply-To: <CANiDSCu0TyjgYnpP+wuk1TdxT=MDCQ0y3_-bgJMVWm-pvoaS9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ricardo,

Ok, you can find below the kernel logs. I ran following command twice:

v4l2-ctl --device=/dev/video0 --stream-mmap --stream-count=50

v4l2-ctl --device=/dev/video0 --stream-mmap --stream-count=50

The behaviour is that it keeps waiting for the first frame when opening 
the second stream. Other webcam (older one) seems to work fine here also 
so I think it is probably related to the brand Elgato doing some quirk 
with UVC 1.5 for the new 4k webcams.
The audit at the end I'm not sure if that is part of the uvcvideo 
output, I copied everything to be sure.

````
[  396.718291] usbcore: deregistering interface driver uvcvideo
[  418.588069] usb 4-1.2: Probing generic UVC device 1.2
[  418.588190] usb 4-1.2: Found format MJPG little-endian (0x47504a4d)
[  418.588202] usb 4-1.2: - 3840x2160 (30.0 fps)
[  418.588212] usb 4-1.2: - 2560x1440 (30.0 fps)
[  418.588220] usb 4-1.2: - 1920x1080 (30.0 fps)
[  418.588227] usb 4-1.2: - 1280x720 (30.0 fps)
[  418.588234] usb 4-1.2: - 960x540 (30.0 fps)
[  418.588241] usb 4-1.2: - 640x360 (30.0 fps)
[  418.588248] usb 4-1.2: - 640x480 (30.0 fps)
[  418.588256] usb 4-1.2: Found format YUYV little-endian (0x56595559)
[  418.588264] usb 4-1.2: - 2560x1440 (30.0 fps)
[  418.588271] usb 4-1.2: - 1920x1080 (30.0 fps)
[  418.588278] usb 4-1.2: - 1280x720 (30.0 fps)
[  418.588285] usb 4-1.2: - 960x540 (30.0 fps)
[  418.588292] usb 4-1.2: - 640x360 (30.0 fps)
[  418.588299] usb 4-1.2: - 640x480 (30.0 fps)
[  418.588306] usb 4-1.2: Found format NV12 little-endian (0x3231564e)
[  418.588313] usb 4-1.2: - 3840x2160 (30.0 fps)
[  418.588320] usb 4-1.2: - 2560x1440 (30.0 fps)
[  418.588327] usb 4-1.2: - 1920x1080 (30.0 fps)
[  418.588334] usb 4-1.2: - 1280x720 (30.0 fps)
[  418.588341] usb 4-1.2: - 960x540 (30.0 fps)
[  418.588348] usb 4-1.2: - 640x360 (30.0 fps)
[  418.588355] usb 4-1.2: - 640x480 (30.0 fps)
[  418.588383] usb 4-1.2: Found a Status endpoint (addr 85)
[  418.588393] usb 4-1.2: Found UVC 1.00 device Elgato Facecam 4K 
(0fd9:0092)
[  418.588405] usb 4-1.2: Scanning UVC chain:
[  418.588411]  OT 2 <- PU 4 (-> XU 6 XU 7 XU 8) <- SU 3 <- IT 1
[  418.588445] usb 4-1.2: Found a valid video chain (1 -> 2)
[  418.588455] usb 4-1.2: Added control 
00000000-0000-0000-0000-000000000101/2 to device 1.2 entity 4
[  418.589045] usb 4-1.2: Adding mapping 'Brightness' to control 
00000000-0000-0000-0000-000000000101/2
[  418.589064] usb 4-1.2: Added control 
00000000-0000-0000-0000-000000000101/3 to device 1.2 entity 4
[  418.589551] usb 4-1.2: Adding mapping 'Contrast' to control 
00000000-0000-0000-0000-000000000101/3
[  418.589569] usb 4-1.2: Added control 
00000000-0000-0000-0000-000000000101/7 to device 1.2 entity 4
[  418.590048] usb 4-1.2: Adding mapping 'Saturation' to control 
00000000-0000-0000-0000-000000000101/7
[  418.590066] usb 4-1.2: Added control 
00000000-0000-0000-0000-000000000101/8 to device 1.2 entity 4
[  418.590545] usb 4-1.2: Adding mapping 'Sharpness' to control 
00000000-0000-0000-0000-000000000101/8
[  418.590563] usb 4-1.2: Added control 
00000000-0000-0000-0000-000000000101/10 to device 1.2 entity 4
[  418.591042] usb 4-1.2: Adding mapping 'White Balance Temperature' to 
control 00000000-0000-0000-0000-000000000101/10
[  418.591060] usb 4-1.2: Added control 
00000000-0000-0000-0000-000000000101/1 to device 1.2 entity 4
[  418.591558] usb 4-1.2: Adding mapping 'Backlight Compensation' to 
control 00000000-0000-0000-0000-000000000101/1
[  418.591575] usb 4-1.2: Added control 
00000000-0000-0000-0000-000000000101/4 to device 1.2 entity 4
[  418.592042] usb 4-1.2: Adding mapping 'Gain' to control 
00000000-0000-0000-0000-000000000101/4
[  418.592060] usb 4-1.2: Added control 
00000000-0000-0000-0000-000000000101/5 to device 1.2 entity 4
[  418.594497] usb 4-1.2: Adding mapping 'Power Line Frequency' to 
control 00000000-0000-0000-0000-000000000101/5
[  418.594501] usb 4-1.2: Added control 
00000000-0000-0000-0000-000000000101/11 to device 1.2 entity 4
[  418.594994] usb 4-1.2: Adding mapping 'White Balance, Automatic' to 
control 00000000-0000-0000-0000-000000000101/11
[  418.594998] usb 4-1.2: Added control 
00000000-0000-0000-0000-000000000001/2 to device 1.2 entity 1
[  418.595467] usb 4-1.2: Adding mapping 'Auto Exposure' to control 
00000000-0000-0000-0000-000000000001/2
[  418.595470] usb 4-1.2: Added control 
00000000-0000-0000-0000-000000000001/4 to device 1.2 entity 1
[  418.595988] usb 4-1.2: Adding mapping 'Exposure Time, Absolute' to 
control 00000000-0000-0000-0000-000000000001/4
[  418.595992] usb 4-1.2: Added control 
00000000-0000-0000-0000-000000000001/11 to device 1.2 entity 1
[  418.596463] usb 4-1.2: Adding mapping 'Zoom, Absolute' to control 
00000000-0000-0000-0000-000000000001/11
[  418.596467] usb 4-1.2: Added control 
00000000-0000-0000-0000-000000000001/13 to device 1.2 entity 1
[  418.596970] usb 4-1.2: Adding mapping 'Pan, Absolute' to control 
00000000-0000-0000-0000-000000000001/13
[  418.596973] usb 4-1.2: Adding mapping 'Tilt, Absolute' to control 
00000000-0000-0000-0000-000000000001/13
[  418.604755] usb 4-1.2: UVC device initialized
[  418.604786] usbcore: registered new interface driver uvcvideo
[  418.608448] usb 4-1.2: uvc_v4l2_open
[  418.608467] usb 4-1.2: uvc_v4l2_release
[  418.617182] usb 4-1.2: uvc_v4l2_open
[  418.617183] usb 4-1.2: uvc_v4l2_open
[  418.617188] usb 4-1.2: uvc_v4l2_release
[  418.617189] usb 4-1.2: uvc_v4l2_release
[  418.617238] usb 4-1.2: uvc_v4l2_open
[  418.617243] usb 4-1.2: uvc_v4l2_open
[  418.643303] usb 4-1.2: uvc_v4l2_release
[  418.644575] usb 4-1.2: uvc_v4l2_release
[  418.646134] usb 4-1.2: uvc_v4l2_open
[  418.646152] usb 4-1.2: uvc_v4l2_release
[  418.646314] usb 4-1.2: uvc_v4l2_open
[  418.646498] usb 4-1.2: uvc_v4l2_release
[  418.675134] usb 4-1.2: uvc_v4l2_open
[  418.676759] usb 4-1.2: uvc_v4l2_release
[  418.677291] usb 4-1.2: uvc_v4l2_open
[  418.678621] usb 4-1.2: uvc_v4l2_release
[  419.648730] usb 4-1.2: uvc_v4l2_open
[  419.648746] usb 4-1.2: uvc_v4l2_release
[  419.649206] usb 4-1.2: uvc_v4l2_open
[  419.661526] usb 4-1.2: uvc_v4l2_release
[  419.661548] usb 4-1.2: uvc_v4l2_open
[  419.673458] usb 4-1.2: uvc_v4l2_release
[  419.673502] usb 4-1.2: uvc_v4l2_open
[  419.680402] usb 4-1.2: uvc_v4l2_release
[  419.680411] usb 4-1.2: uvc_v4l2_open
[  419.680496] usb 4-1.2: uvc_v4l2_release
[  419.680707] usb 4-1.2: uvc_v4l2_open
[  419.690671] usb 4-1.2: uvc_v4l2_release
[  419.690683] usb 4-1.2: uvc_v4l2_open
[  419.690767] usb 4-1.2: uvc_v4l2_release
[  422.189951] usb 4-1.2: Suspending interface 1
[  422.189967] usb 4-1.2: Suspending interface 0
[  429.141894] usb 4-1.2: uvc_v4l2_open
[  429.301071] usb 4-1.2: Resuming interface 0
[  429.301086] usb 4-1.2: Resuming interface 1
[  429.311060] usb 4-1.2: Control 0x00980927 not found
[  429.311527] usb 4-1.2: Control 0x00980928 not found
[  429.339134] usb 4-1.2: Allocated 5 URB buffers of 32x1024 bytes each
[  430.754374] usb 4-1.2: Frame complete (EOF found)
[  430.754645] usb 4-1.2: frame 1 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2484148180/2484163180/16
[  430.755323] usb 4-1.2: Frame complete (EOF found)
[  430.755614] usb 4-1.2: frame 2 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2484177670/2484192670/16
[  430.756229] usb 4-1.2: Frame complete (EOF found)
[  430.756491] usb 4-1.2: frame 3 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2484207160/2484222160/16
[  430.757108] usb 4-1.2: Frame complete (EOF found)
[  430.758593] usb 4-1.2: frame 4 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2484233710/2484248710/16
[  430.759229] usb 4-1.2: Frame complete (EOF found)
[  430.792008] usb 4-1.2: frame 5 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2484296650/2484311650/16
[  430.792669] usb 4-1.2: Frame complete (EOF found)
[  430.825249] usb 4-1.2: frame 6 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2485297990/2485312990/16
[  430.825948] usb 4-1.2: Frame complete (EOF found)
[  430.858581] usb 4-1.2: frame 7 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2486294950/2486309950/48
[  430.859266] usb 4-1.2: Frame complete (EOF found)
[  430.891899] usb 4-1.2: frame 8 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2487294820/2487309820/16
[  430.892569] usb 4-1.2: Frame complete (EOF found)
[  430.925242] usb 4-1.2: frame 9 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2488294420/2488309420/16
[  430.925878] usb 4-1.2: Frame complete (EOF found)
[  430.958587] usb 4-1.2: frame 10 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2489294770/2489309770/16
[  430.959196] usb 4-1.2: Frame complete (EOF found)
[  430.991890] usb 4-1.2: frame 11 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2490294730/2490309730/48
[  430.992424] usb 4-1.2: Frame complete (EOF found)
[  431.025243] usb 4-1.2: frame 12 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2491294180/2491305430/16
[  431.025743] usb 4-1.2: Frame complete (EOF found)
[  431.058571] usb 4-1.2: frame 13 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2492294740/2492305990/48
[  431.059070] usb 4-1.2: Frame complete (EOF found)
[  431.091879] usb 4-1.2: frame 14 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2493294460/2493305710/16
[  431.092371] usb 4-1.2: Frame complete (EOF found)
[  431.125243] usb 4-1.2: frame 15 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2494293790/2494305040/16
[  431.125751] usb 4-1.2: Frame complete (EOF found)
[  431.158565] usb 4-1.2: frame 16 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2495294770/2495306020/16
[  431.159081] usb 4-1.2: Frame complete (EOF found)
[  431.191877] usb 4-1.2: frame 17 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2496294370/2496305620/16
[  431.192380] usb 4-1.2: Frame complete (EOF found)
[  431.225234] usb 4-1.2: frame 18 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2497293820/2497305070/16
[  431.225744] usb 4-1.2: Frame complete (EOF found)
[  431.258577] usb 4-1.2: frame 19 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2498294470/2498305720/16
[  431.259098] usb 4-1.2: Frame complete (EOF found)
[  431.291876] usb 4-1.2: frame 20 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2499294850/2499306100/16
[  431.292406] usb 4-1.2: Frame complete (EOF found)
[  431.325239] usb 4-1.2: frame 21 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2500293790/2500305040/16
[  431.325747] usb 4-1.2: Frame complete (EOF found)
[  431.358568] usb 4-1.2: frame 22 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2501294530/2501305780/16
[  431.359133] usb 4-1.2: Frame complete (EOF found)
[  431.391880] usb 4-1.2: frame 23 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2502294280/2502309280/16
[  431.392411] usb 4-1.2: Frame complete (EOF found)
[  431.425231] usb 4-1.2: frame 24 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2503294060/2503305310/16
[  431.425820] usb 4-1.2: Frame complete (EOF found)
[  431.458561] usb 4-1.2: frame 25 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2504294470/2504309470/16
[  431.459107] usb 4-1.2: Frame complete (EOF found)
[  431.491881] usb 4-1.2: frame 26 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2505294370/2505305620/16
[  431.492473] usb 4-1.2: Frame complete (EOF found)
[  431.525235] usb 4-1.2: frame 27 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2506294030/2506309030/16
[  431.525796] usb 4-1.2: Frame complete (EOF found)
[  431.558573] usb 4-1.2: frame 28 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2507294680/2507309680/16
[  431.559191] usb 4-1.2: Frame complete (EOF found)
[  431.591879] usb 4-1.2: frame 29 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2508294700/2508309700/16
[  431.592482] usb 4-1.2: Frame complete (EOF found)
[  431.625244] usb 4-1.2: frame 30 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2509293910/2509308910/16
[  431.625844] usb 4-1.2: Frame complete (EOF found)
[  431.658568] usb 4-1.2: frame 31 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2510294770/2510309770/16
[  431.659177] usb 4-1.2: Frame complete (EOF found)
[  431.691881] usb 4-1.2: frame 32 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2511294520/2511309520/16
[  431.692486] usb 4-1.2: Frame complete (EOF found)
[  431.725248] usb 4-1.2: frame 33 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2512293940/2512308940/16
[  431.725804] usb 4-1.2: Frame complete (EOF found)
[  431.758571] usb 4-1.2: frame 34 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2513295100/2513310100/16
[  431.759092] usb 4-1.2: Frame complete (EOF found)
[  431.791892] usb 4-1.2: frame 35 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2514294760/2514306010/16
[  431.792488] usb 4-1.2: Frame complete (EOF found)
[  431.825240] usb 4-1.2: frame 36 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2515294150/2515309150/16
[  431.825818] usb 4-1.2: Frame complete (EOF found)
[  431.858576] usb 4-1.2: frame 37 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2516294830/2516309830/16
[  431.859107] usb 4-1.2: Frame complete (EOF found)
[  431.891886] usb 4-1.2: frame 38 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2517294790/2517306040/16
[  431.892452] usb 4-1.2: Frame complete (EOF found)
[  431.925254] usb 4-1.2: frame 39 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2518294150/2518309150/16
[  431.925820] usb 4-1.2: Frame complete (EOF found)
[  431.958577] usb 4-1.2: frame 40 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2519295100/2519310100/16
[  431.959146] usb 4-1.2: Frame complete (EOF found)
[  431.991886] usb 4-1.2: frame 41 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2520294700/2520309700/16
[  431.992409] usb 4-1.2: Frame complete (EOF found)
[  432.025281] usb 4-1.2: frame 42 stats: 0/4/4 packets, 0/0/4 pts 
(!early initial), 3/4 scr, last pts/stc/sof 2521293790/2521305040/16
[  432.025801] usb 4-1.2: Frame complete (EOF found)
[  432.058565] usb 4-1.2: frame 43 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2522294500/2522309500/16
[  432.059130] usb 4-1.2: Frame complete (EOF found)
[  432.091879] usb 4-1.2: frame 44 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2523294250/2523309250/16
[  432.092463] usb 4-1.2: Frame complete (EOF found)
[  432.125228] usb 4-1.2: frame 45 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2524294120/2524309120/16
[  432.125820] usb 4-1.2: Frame complete (EOF found)
[  432.158570] usb 4-1.2: frame 46 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2525294410/2525309410/16
[  432.159146] usb 4-1.2: Frame complete (EOF found)
[  432.191874] usb 4-1.2: frame 47 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2526294520/2526309520/16
[  432.192466] usb 4-1.2: Frame complete (EOF found)
[  432.225227] usb 4-1.2: frame 48 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2527293790/2527308790/16
[  432.225834] usb 4-1.2: Frame complete (EOF found)
[  432.258563] usb 4-1.2: frame 49 stats: 0/5/5 packets, 0/0/5 pts 
(!early initial), 4/5 scr, last pts/stc/sof 2528294560/2528309560/16
[  432.259169] usb 4-1.2: Frame complete (EOF found)
[  432.329703] usb 4-1.2: uvc_v4l2_release
[  434.327725] usb 4-1.2: Suspending interface 1
[  434.327741] usb 4-1.2: Suspending interface 0
[  439.437330] usb 4-1.2: uvc_v4l2_open
[  439.594147] usb 4-1.2: Resuming interface 0
[  439.594162] usb 4-1.2: Resuming interface 1
[  439.605598] usb 4-1.2: Control 0x00980927 not found
[  439.606100] usb 4-1.2: Control 0x00980928 not found
[  439.617707] usb 4-1.2: Allocated 5 URB buffers of 32x1024 bytes each
[  486.875469] audit: type=1400 audit(1758901598.795:285): 
apparmor="AUDIT" operation="userns_create" class="namespace" 
info="Userns create - transitioning profile" profile="unconfined" 
pid=5928 comm="(insights)" requested="userns_create" 
target="unprivileged_userns" execpath="/usr/lib/systemd/systemd-executor"
[  486.875919] audit: type=1400 audit(1758901598.796:286): 
apparmor="DENIED" operation="capable" class="cap" 
profile="unprivileged_userns" pid=5928 comm="(insights)" capability=21  
capname="sys_admin"````


Kr,

Philippe


On 9/26/25 15:28, Ricardo Ribalda wrote:
> Hi Philippe,
>
> On Sat, 20 Sept 2025 at 13:17, Hans de Goede <hansg@kernel.org> wrote:
>> Hi Philippe,
>>
>> On 20-Sep-25 1:07 PM, Philippe Rivière wrote:
>>> Dear,
>>>
>>> I have trouble with the uvcvideo driver for a new UVC 1.5 webcam
>>> (Elgato Facecam 4K). I was wondering if I can ask here for some help
>>> about it. Below my observations:
>>>
>>> First to start, plugging in the webcam I get in the kernel log:
>>> [  784.408362] usb 4-1.2: Found UVC 1.00 device Elgato Facecam 4K (0fd9:0092)
>>>
>>>
>>> set 4k resolution of the webcam to a lower setting to avoid
>>> potentially it is a bandwidth issue:
>>>
>>> v4l2-ctl --device=/dev/video0
>>> --set-fmt-video=width=1920,height=1080,pixelformat=MJPG
>>>
>>> then I test running twice following command:
>>> v4l2-ctl --device=/dev/video0 --stream-mmap --stream-count=1
>>> --stream-to=frame1.jpg
>>> v4l2-ctl --device=/dev/video0 --stream-mmap --stream-count=1
>>> --stream-to=frame2.jpg
>> Capturing only 1 frame is a bit of an unusual use-case. It could
>> be that this is triggering a bug in the firmware of the camera.
>>
>> What happens if you just use a normal camera viewing app
>> and let the camera stream for a couple of seconds and
>> try that 2 times in a row ?
>>
> Could you also try to run something like:
>
> ````
> rmmod uvcvideo
> modprobe uvcvideo trace=0xffffffff
> ``
>
> before you run your tests?
>
> That will give us some insight of what is going on in the driver.
>
> I have tried to reproduce your error, and everything works fine in my end.
>
> Thanks!
>
>
>> Regards,
>>
>> Hans
>>
>>
>>> -> first time it works, a frame1 is generated and stored
>>> -> the command fails the second time, the webcam lights up but no
>>> frame gets processed, the command keeps waiting for a frame
>>>     this happens because the v4l2 doesn't properly closes the stream
>>> the first time
>>> -> no logs in the kernel log (running "sudo dmesg -w")
>>>     this means the driver silently fails to reset the stream:
>>>
>>> * After VIDIOC_STREAMOFF, the driver doesn’t fully reset the internal buffers.
>>> * Any new VIDIOC_STREAMON request just turns on the LED but never
>>> produces frames.
>>>
>>>
>>> also trying with gstreamer because it uses pipelines to start / stop the stream:
>>>
>>> gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=1 ! jpegdec !
>>> videoconvert ! pngenc ! filesink location=frame.png
>>>
>>> Setting pipeline to PAUSED ...
>>> Pipeline is live and does not need PREROLL ...
>>> Pipeline is PREROLLED ...
>>> Setting pipeline to PLAYING ...
>>> New clock: GstSystemClock
>>> Redistribute latency...
>>> Got EOS from element "pipeline0".
>>> Execution ended after 0:00:02.392029227
>>> Setting pipeline to NULL ...
>>> Freeing pipeline ...
>>>
>>> -> first time works
>>>
>>> gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=1 ! jpegdec !
>>> videoconvert ! pngenc ! filesink location=frame.png
>>> Setting pipeline to PAUSED ...
>>> Pipeline is live and does not need PREROLL ...
>>> Pipeline is PREROLLED ...
>>> Setting pipeline to PLAYING ...
>>> New clock: GstSystemClock
>>>
>>> -> second time it keeps hanging here , waiting for a frame to process
>>>
>>> so for both "v4l2-ctl" and "gst-launch-1.0" the webcam stream does not
>>> process frames anymore the second time.
>>>
>>> I kept the kernel log open all the time but no logs or errors shown..
>>>
>>> running following commands resets the webcam and then it works also again:
>>>
>>> sudo modprobe -r uvcvideo
>>> sudo modprobe uvcvideo
>>>
>>> note that "sudo modprobe -r uvcvideo" works in ubuntu 25.10 beta, when
>>> I was using ubuntu 24.04 it couldn't reset the uvcvideo driver (it got
>>> stock telling it was still used by a process, a process hidden so I
>>> couldn't kill the dependent process)
>>>
>>>
>>> I have tested and got the same behaviour for ubuntu 24.04, 25.04 and
>>> 25.10 (beta)
>>> I also tried it in several apps, VLC, OBS, Google meet, Teams but all
>>> gives the same behaviour which I concludes it is a driver kernel
>>> issue.
>>>
>>> Can you help me to get the uvcvideo driver fixed in the kernel so it
>>> properly closes webcam streams ?
>>>
>>> Kr,
>>> Philippe
>>>
>>> PS: Some info about the webcam:
>>>
>>> v4l2-ctl --all --device=/dev/video0
>>> Driver Info:
>>> Driver name      : uvcvideo
>>> Card type        : Elgato Facecam 4K
>>> Bus info         : usb-0000:06:00.0-1.2
>>> Driver version   : 6.17.0
>>> Capabilities     : 0x84a00001
>>> Video Capture
>>> Metadata Capture
>>> Streaming
>>> Extended Pix Format
>>> Device Capabilities
>>> Device Caps      : 0x04200001
>>> Video Capture
>>> Streaming
>>> Extended Pix Format
>>> Media Driver Info:
>>> Driver name      : uvcvideo
>>> Model            : Elgato Facecam 4K
>>> Serial           : xxxx(hidden)
>>> Bus info         : usb-0000:06:00.0-1.2
>>> Media version    : 6.17.0
>>> Hardware revision: 0x00000226 (550)
>>> Driver version   : 6.17.0
>>> Interface Info:
>>> ID               : 0x03000002
>>> Type             : V4L Video
>>> Entity Info:
>>> ID               : 0x00000001 (1)
>>> Name             : Elgato Facecam 4K
>>> Function         : V4L2 I/O
>>> Flags            : default
>>> Pad 0x01000007   : 0: Sink
>>>    Link 0x02000019: from remote pad 0x100000a of entity 'Processing 4'
>>> (Video Pixel Formatter): Data, Enabled, Immutable
>>> Priority: 2
>>> Video input : 0 (Camera 1: ok)
>>> Format Video Capture:
>>> Width/Height      : 3840/2160
>>> Pixel Format      : 'MJPG' (Motion-JPEG)
>>> Field             : None
>>> Bytes per Line    : 0
>>> Size Image        : 16588800
>>> Colorspace        : sRGB
>>> Transfer Function : Default (maps to sRGB)
>>> YCbCr/HSV Encoding: Default (maps to ITU-R 601)
>>> Quantization      : Default (maps to Full Range)
>>> Flags             :
>>> Crop Capability Video Capture:
>>> Bounds      : Left 0, Top 0, Width 3840, Height 2160
>>> Default     : Left 0, Top 0, Width 3840, Height 2160
>>> Pixel Aspect: 1/1
>>> Selection Video Capture: crop_default, Left 0, Top 0, Width 3840,
>>> Height 2160, Flags:
>>> Selection Video Capture: crop_bounds, Left 0, Top 0, Width 3840,
>>> Height 2160, Flags:
>>> Streaming Parameters Video Capture:
>>> Capabilities     : timeperframe
>>> Frames per second: 60.000 (60/1)
>>> Read buffers     : 0
>>>
>>> User Controls
>>>
>>>                       brightness 0x00980900 (int)    : min=-9 max=9
>>> step=1 default=2 value=2 flags=has-min-max
>>>                         contrast 0x00980901 (int)    : min=0 max=200
>>> step=1 default=110 value=110 flags=has-min-max
>>>                       saturation 0x00980902 (int)    : min=0 max=200
>>> step=1 default=140 value=140 flags=has-min-max
>>>          white_balance_automatic 0x0098090c (bool)   : default=1 value=1
>>>                             gain 0x00980913 (int)    : min=0 max=160
>>> step=1 default=0 value=0 flags=has-min-max
>>>             power_line_frequency 0x00980918 (menu)   : min=0 max=2
>>> default=2 value=2 (60 Hz)
>>> 0: Disabled
>>> 1: 50 Hz
>>> 2: 60 Hz
>>>        white_balance_temperature 0x0098091a (int)    : min=2400
>>> max=10000 step=100 default=4500 value=4500 flags=inactive, has-min-max
>>>                        sharpness 0x0098091b (int)    : min=0 max=200
>>> step=1 default=100 value=100 flags=has-min-max
>>>           backlight_compensation 0x0098091c (int)    : min=0 max=1
>>> step=1 default=0 value=0 flags=has-min-max
>>>
>>> Camera Controls
>>>
>>>                    auto_exposure 0x009a0901 (menu)   : min=0 max=3
>>> default=3 value=3 (Aperture Priority Mode)
>>> 1: Manual Mode
>>> 3: Aperture Priority Mode
>>>           exposure_time_absolute 0x009a0902 (int)    : min=1 max=1000
>>> step=1 default=156 value=156 flags=inactive, has-min-max
>>>                     pan_absolute 0x009a0908 (int)    : min=-5184000
>>> max=5184000 step=3600 default=0 value=0 flags=has-min-max
>>>                    tilt_absolute 0x009a0909 (int)    : min=-2916000
>>> max=2916000 step=3600 default=0 value=0 flags=has-min-max
>>>                    zoom_absolute 0x009a090d (int)    : min=100 max=400
>>> step=1 default=100 value=100 flags=has-min-max
>>>
>>
>

