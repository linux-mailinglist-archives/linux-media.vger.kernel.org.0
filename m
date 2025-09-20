Return-Path: <linux-media+bounces-42816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBF8B8C68E
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 13:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2097B1BC72D8
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 11:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E3F2FB98A;
	Sat, 20 Sep 2025 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjQq7lpM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12702FB96F
	for <linux-media@vger.kernel.org>; Sat, 20 Sep 2025 11:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758366477; cv=none; b=nHsUmjnWzgkmE9D035pePc8LL3/J6cmlTyzcgfcjoukQb0Vt+rmLzpYEmiQs9MJlPXhCsq5fH4t4ZKoAyUVyHet8HaslYclXy+Uf7ADaejos0OPXmU8ZOK5ODNxSWRzsZhWQsKLLLghJxaiP6Lj567ccZ3zhSyROqQBLcAox1uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758366477; c=relaxed/simple;
	bh=hWv6bVTgKMhxEo8LZTKq3Q7/Bpcyn80XgaMK6mUkoyA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UgDtE5vNFFN2kGGOMb/uEXkj6S8w9HjTN/AB93N8JxfwjQFTwIl7uzPSTNtGKXBUBI6Yi4Fbhb+hRbVTkpsciJze84RgqZXegvrF0zNUCqoRQJEZhm4ueFnK17NdCCnxaZ560rTiUK2Mm6OOHdWx6eGAIg+HmfYyYLCik7T+Xlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjQq7lpM; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-36295d53a10so21911741fa.0
        for <linux-media@vger.kernel.org>; Sat, 20 Sep 2025 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758366474; x=1758971274; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W6wMp831H69zIszeO/KrZbHtyQWip6fyYtcMMABdWlQ=;
        b=XjQq7lpMzdWVtgrFll7kRHMW9KA0B73ZkAOrjKPe5DmOQIEDsMEuDNaOI7Gv7BZQed
         GLfk9XPjmcUoWQRl242geKmLVrZ/mVcg+Pbwi2tXLmWmEy3YYCIrrcSqE/sB2yh51+wD
         ONvdjrv/CuhnT+3tomL/81aIsfdqKQCU3etpfzaHC7SrD+PpDSUCI9gb+GO/dFOO3HSK
         W5pm1YI6m+ObLTlvuMmtQeiPBPGrBGD/eIxhEKqxT48UCWF9ERq7f1iNY+SOn/3IOy1T
         uvQQ0J264r6vVRJnxUj1+/YrAlJ0oRAKK/lJ2iXgFE12KUzdC5g33zqMQKTcT4igtYHI
         l0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758366474; x=1758971274;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6wMp831H69zIszeO/KrZbHtyQWip6fyYtcMMABdWlQ=;
        b=VgyMR3I1SasVQJtjyhhRmrqMz5UAH5zHut5uhh8qUo0DbRkMMyjGfWEpF9pitT6wSN
         J3nUuPWwuvqv7CAu9taGjgdPlAfgOFi4f8WTgxE8KUv9kRMdD0EWsMjFsGqh97coZ8PY
         MivcDT0SBRfSMbsl7NTELZ3ftskUephCrYGzLf3XkQ7JWQY1M0wbbIzw0tU5PXjBUkrc
         ilNqJ3enJ0mYNbmbMyAIuq1D7aa9823RdO71F+x88yx3HzZTJbshGkNuOzIV9Fo9ONB3
         jLxMElJr5VZAIRvx/Vuo/IFM8j/k4kl5dS0prP+bhmMHfJRaju+LBB2Iq4mPOGaBQ1Vp
         U8Ug==
X-Gm-Message-State: AOJu0YyDB1qgpeBAtaRiJk5uVo7lUZraD5Po6PwtIinsDrFOrMYOnVVB
	uOPwXtuwnCiT45i5kreIOC5eg1crovDOqPwyQYSN04LZVE2TvGCVgoowjn4nHxhXqu+EibOpBWZ
	nDgnV6rdW8lwULiwK8Sldk7A5iKq3rzkHB8rrI7A=
X-Gm-Gg: ASbGncsTxoCYLyxC5/vHLMULraH8XTlZRX0zJGr8HR3lEcnrtRka80IKxoYBqbGTjpR
	lYVlraiJvojmMW25xJkEQ7TP6Jdng90Q/o8QyPKTGdI/oROCMTOTbAYsC9vOytTlcjH8TuIDAuq
	5o3RsvEZ5zg3h1Pb0I2fg/JLedpD2TOCDPh+LvQzXylhYcTZqhlim2PgSM1eXoap1VJFAkQMplf
	Weaa2AQuRfJYVOlebGIE6m41+2i44CoisaseNuWN3NXAaj5xlDYWLkbDUgwMx/+5vDS0bknBg==
X-Google-Smtp-Source: AGHT+IHzOQUTJObzm46z3JBM5NkWTCpEyHgYzirFESFkWCf3MnGQHn1lZcXuYds1PxTgzN39Lh8XV2hLOvtalW2w6J0=
X-Received: by 2002:a2e:be09:0:b0:336:853d:27fe with SMTP id
 38308e7fff4ca-36413f12866mr16763231fa.6.1758366473549; Sat, 20 Sep 2025
 04:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Philippe_Rivi=C3=A8re?= <phirivie@gmail.com>
Date: Sat, 20 Sep 2025 13:07:42 +0200
X-Gm-Features: AS18NWA0zU8gqCuyCxx5M8Yn76wQ39yIKQEDfe84KkJVFAkRnKmol6piTfhjAWo
Message-ID: <CAE9VLgX06Evz+VmGs=EwQmVjmu-sU5_1ZzNdO5PWijO--TONpw@mail.gmail.com>
Subject: uvcvideo driver not properly closing stream, using Webcam Elgato
 Facecam 4K, USB 3.0, UVC 1.5
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear,

I have trouble with the uvcvideo driver for a new UVC 1.5 webcam
(Elgato Facecam 4K). I was wondering if I can ask here for some help
about it. Below my observations:

First to start, plugging in the webcam I get in the kernel log:
[  784.408362] usb 4-1.2: Found UVC 1.00 device Elgato Facecam 4K (0fd9:009=
2)


set 4k resolution of the webcam to a lower setting to avoid
potentially it is a bandwidth issue:

v4l2-ctl --device=3D/dev/video0
--set-fmt-video=3Dwidth=3D1920,height=3D1080,pixelformat=3DMJPG

then I test running twice following command:
v4l2-ctl --device=3D/dev/video0 --stream-mmap --stream-count=3D1
--stream-to=3Dframe1.jpg
v4l2-ctl --device=3D/dev/video0 --stream-mmap --stream-count=3D1
--stream-to=3Dframe2.jpg

-> first time it works, a frame1 is generated and stored
-> the command fails the second time, the webcam lights up but no
frame gets processed, the command keeps waiting for a frame
   this happens because the v4l2 doesn't properly closes the stream
the first time
-> no logs in the kernel log (running "sudo dmesg -w")
   this means the driver silently fails to reset the stream:

* After VIDIOC_STREAMOFF, the driver doesn=E2=80=99t fully reset the intern=
al buffers.
* Any new VIDIOC_STREAMON request just turns on the LED but never
produces frames.


also trying with gstreamer because it uses pipelines to start / stop the st=
ream:

gst-launch-1.0 v4l2src device=3D/dev/video0 num-buffers=3D1 ! jpegdec !
videoconvert ! pngenc ! filesink location=3Dframe.png

Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
Redistribute latency...
Got EOS from element "pipeline0".
Execution ended after 0:00:02.392029227
Setting pipeline to NULL ...
Freeing pipeline ...

-> first time works

gst-launch-1.0 v4l2src device=3D/dev/video0 num-buffers=3D1 ! jpegdec !
videoconvert ! pngenc ! filesink location=3Dframe.png
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock

-> second time it keeps hanging here , waiting for a frame to process

so for both "v4l2-ctl" and "gst-launch-1.0" the webcam stream does not
process frames anymore the second time.

I kept the kernel log open all the time but no logs or errors shown..

running following commands resets the webcam and then it works also again:

sudo modprobe -r uvcvideo
sudo modprobe uvcvideo

note that "sudo modprobe -r uvcvideo" works in ubuntu 25.10 beta, when
I was using ubuntu 24.04 it couldn't reset the uvcvideo driver (it got
stock telling it was still used by a process, a process hidden so I
couldn't kill the dependent process)


I have tested and got the same behaviour for ubuntu 24.04, 25.04 and
25.10 (beta)
I also tried it in several apps, VLC, OBS, Google meet, Teams but all
gives the same behaviour which I concludes it is a driver kernel
issue.

Can you help me to get the uvcvideo driver fixed in the kernel so it
properly closes webcam streams ?

Kr,
Philippe

PS: Some info about the webcam:

v4l2-ctl --all --device=3D/dev/video0
Driver Info:
Driver name      : uvcvideo
Card type        : Elgato Facecam 4K
Bus info         : usb-0000:06:00.0-1.2
Driver version   : 6.17.0
Capabilities     : 0x84a00001
Video Capture
Metadata Capture
Streaming
Extended Pix Format
Device Capabilities
Device Caps      : 0x04200001
Video Capture
Streaming
Extended Pix Format
Media Driver Info:
Driver name      : uvcvideo
Model            : Elgato Facecam 4K
Serial           : xxxx(hidden)
Bus info         : usb-0000:06:00.0-1.2
Media version    : 6.17.0
Hardware revision: 0x00000226 (550)
Driver version   : 6.17.0
Interface Info:
ID               : 0x03000002
Type             : V4L Video
Entity Info:
ID               : 0x00000001 (1)
Name             : Elgato Facecam 4K
Function         : V4L2 I/O
Flags            : default
Pad 0x01000007   : 0: Sink
  Link 0x02000019: from remote pad 0x100000a of entity 'Processing 4'
(Video Pixel Formatter): Data, Enabled, Immutable
Priority: 2
Video input : 0 (Camera 1: ok)
Format Video Capture:
Width/Height      : 3840/2160
Pixel Format      : 'MJPG' (Motion-JPEG)
Field             : None
Bytes per Line    : 0
Size Image        : 16588800
Colorspace        : sRGB
Transfer Function : Default (maps to sRGB)
YCbCr/HSV Encoding: Default (maps to ITU-R 601)
Quantization      : Default (maps to Full Range)
Flags             :
Crop Capability Video Capture:
Bounds      : Left 0, Top 0, Width 3840, Height 2160
Default     : Left 0, Top 0, Width 3840, Height 2160
Pixel Aspect: 1/1
Selection Video Capture: crop_default, Left 0, Top 0, Width 3840,
Height 2160, Flags:
Selection Video Capture: crop_bounds, Left 0, Top 0, Width 3840,
Height 2160, Flags:
Streaming Parameters Video Capture:
Capabilities     : timeperframe
Frames per second: 60.000 (60/1)
Read buffers     : 0

User Controls

                     brightness 0x00980900 (int)    : min=3D-9 max=3D9
step=3D1 default=3D2 value=3D2 flags=3Dhas-min-max
                       contrast 0x00980901 (int)    : min=3D0 max=3D200
step=3D1 default=3D110 value=3D110 flags=3Dhas-min-max
                     saturation 0x00980902 (int)    : min=3D0 max=3D200
step=3D1 default=3D140 value=3D140 flags=3Dhas-min-max
        white_balance_automatic 0x0098090c (bool)   : default=3D1 value=3D1
                           gain 0x00980913 (int)    : min=3D0 max=3D160
step=3D1 default=3D0 value=3D0 flags=3Dhas-min-max
           power_line_frequency 0x00980918 (menu)   : min=3D0 max=3D2
default=3D2 value=3D2 (60 Hz)
0: Disabled
1: 50 Hz
2: 60 Hz
      white_balance_temperature 0x0098091a (int)    : min=3D2400
max=3D10000 step=3D100 default=3D4500 value=3D4500 flags=3Dinactive, has-mi=
n-max
                      sharpness 0x0098091b (int)    : min=3D0 max=3D200
step=3D1 default=3D100 value=3D100 flags=3Dhas-min-max
         backlight_compensation 0x0098091c (int)    : min=3D0 max=3D1
step=3D1 default=3D0 value=3D0 flags=3Dhas-min-max

Camera Controls

                  auto_exposure 0x009a0901 (menu)   : min=3D0 max=3D3
default=3D3 value=3D3 (Aperture Priority Mode)
1: Manual Mode
3: Aperture Priority Mode
         exposure_time_absolute 0x009a0902 (int)    : min=3D1 max=3D1000
step=3D1 default=3D156 value=3D156 flags=3Dinactive, has-min-max
                   pan_absolute 0x009a0908 (int)    : min=3D-5184000
max=3D5184000 step=3D3600 default=3D0 value=3D0 flags=3Dhas-min-max
                  tilt_absolute 0x009a0909 (int)    : min=3D-2916000
max=3D2916000 step=3D3600 default=3D0 value=3D0 flags=3Dhas-min-max
                  zoom_absolute 0x009a090d (int)    : min=3D100 max=3D400
step=3D1 default=3D100 value=3D100 flags=3Dhas-min-max

