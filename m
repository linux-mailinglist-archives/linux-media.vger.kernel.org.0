Return-Path: <linux-media+bounces-43265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D8BA3E4B
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 15:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AC697A959B
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 13:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86542ED14B;
	Fri, 26 Sep 2025 13:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RYVtswwp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D8F1D7E5C
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 13:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758893351; cv=none; b=tCjAQi7JNlYk89HsuJorPBxMUG3Qp/ftKdt+ZX15qMk3B2y0g54xtZHIzGf96eGE4y1GT8301Z0BZRlM3fhjBdYJIo7wDq36xdOkkEiVOiSunNsNks8sRKZyxOMSqiMMdFphHJHeq8mrYMYXVeCOkA1h6NwxZuAIsZUpcLqby6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758893351; c=relaxed/simple;
	bh=mB7djdlS4B9tlQ6s4iIWkc14hhe/KqP1XJ/2FMLCp8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUOP54ojPXJWiTf9yjKzmm6RarboZvD3iVfO5IAzCqotYo6AMtijtA6kdnIlzcIxFKTaqOMdufemT/Pnla+Lhd22Ui15U9agCFtiqx+svEOB7+HI5+qTQzhnAf5cFx20e0YfVfczbJmgtsV5AIKIYwb+ZD5VpiAhV0u1qEHokoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RYVtswwp; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-271067d66fbso23143965ad.3
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 06:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758893349; x=1759498149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kZjx/6Nhe3+i+UmBiM1iG+mhXykOX8TeYs2tmLxhLk=;
        b=RYVtswwpHac5d+pM1U1pWfAfsFYdM2FnxDXT24/oB4O0FG7nEXykNZdd+uB9eZeKdP
         owxJH6Zd4Hdfwz9BTblhtITHIZbdrNXm8SONz5zleXxSSeGOC93DhIk5nzl3anOdNfs9
         JME1j1TGOc5uWWDwYc60HXkBE+bOcJHgOJus4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758893349; x=1759498149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kZjx/6Nhe3+i+UmBiM1iG+mhXykOX8TeYs2tmLxhLk=;
        b=gmlZ37/9m1tmAGBg9nohxyz0JSfswkvI/7QTgnT2ggoePyaC9UBuSRj3UmlAVfiJcG
         I4Xz1Z4JSonbyd+rrAFHx0Mu7lwslliAWlySkumNAuH3kAqn3YJtB7iQcKs4aXXUktAu
         NKgb739H4uGJ0Y2CHhNrq30fR+DqVs3tsRy1X9VvsHvsIDOhcZ6LWptMao8MMo3i1deb
         SvnDJU7PFZoET3Hy2WG7Wj/IwCb7yWEUA24Su8xSy4kJc90w6L+4JE2tLSXT0UGT3QAN
         CU1rur95SiUlG8xggaYZgWj4TlNP2/LOdlwT0zUFvjkz+dQ/pLZx+Rhvmr6i9mMixirg
         /olw==
X-Forwarded-Encrypted: i=1; AJvYcCURUk1hVpEY7xFfa/yIJOHKLZlk2GYAF6VBSMigHCDc4Ikm5Y+gOHmJCnLElP8e4d6aXCFvv+Xa706zkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoeMpkOeTKxuDWhLSXP20d0u1eIqqU8dn18oTTIxtdTLZUul3z
	2AYaRoa842zOZg+vdmeBXXcZqYhvpVmAT7xQk2w2vFgxxie0vQGM05XcBnKZrjqdZ5V4/NddDmw
	T4lk=
X-Gm-Gg: ASbGnct/zuk5eQw7wYPQUusRwWPHOXJnA+QpNEi9GjhKzXgUCR0D9iHg1nhfDyxCPJH
	zGX4GyQTQ/0bad2nNVWylx46C2YaksDP29sR7DfS+9WKI1U/lmAsgwbI9fWm7fiRB6E6OxiibF3
	ra9jLtLxMsSDhiC5wrcMmsp+kKxfo6YLSIzU00AmPQJO3qtPE76XZr12pN0/J4k7KOpyZdCmUAJ
	PVSf134T11uU+VeLR8gTFj+3OY/ni2Bsx7NhSVHF4WFGn1Y+Wx0XF5OUXK8ZBzVVQuSLK9gH6Dn
	qqsGbrePewpvgbrhdOkzm2yRiJjJnk6F5h4aToCQ5C6TGFeY3gCTigMbHU+O2ppa9yK2KGI4O+j
	l6K4VOLUcMRPqdls9nZWTtEFj8yygQXcJCTNjnAmbnoGHBg4KVRJkb7c3sCxb/nkBx1edoM9U7w
	g=
X-Google-Smtp-Source: AGHT+IEwytBTObrNzxyp+bT32CTi/Ze1e18SatNYWIqTpD80tpdBXkED/BOhwKcc2ewP7M8Q4i5IxQ==
X-Received: by 2002:a17:903:1b0b:b0:27e:e1f3:f853 with SMTP id d9443c01a7336-27ee1f3fb74mr53622225ad.8.1758893348581;
        Fri, 26 Sep 2025 06:29:08 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com. [209.85.214.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671738esm55101845ad.46.2025.09.26.06.29.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 06:29:08 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-271067d66fbso23143755ad.3
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 06:29:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvFyJW7lqN3vfvV2fFhtLFh2fXf2OQuw31Ogo2smP3WJnvmSWZa/A2MVd3+pWXHn8esw8nDDXPHC2mHg==@vger.kernel.org
X-Received: by 2002:a17:903:4b24:b0:24b:24dc:91a7 with SMTP id
 d9443c01a7336-27ed4a6e85emr80913355ad.45.1758893346248; Fri, 26 Sep 2025
 06:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE9VLgX06Evz+VmGs=EwQmVjmu-sU5_1ZzNdO5PWijO--TONpw@mail.gmail.com>
 <c0abe9b8-42a3-45a7-9100-f0c8e7d6abd9@kernel.org>
In-Reply-To: <c0abe9b8-42a3-45a7-9100-f0c8e7d6abd9@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 15:28:50 +0200
X-Gmail-Original-Message-ID: <CANiDSCu0TyjgYnpP+wuk1TdxT=MDCQ0y3_-bgJMVWm-pvoaS9w@mail.gmail.com>
X-Gm-Features: AS18NWB5xGmJUbOz1MqFxmFwyKof_dHVYYod5BMg0yW7cSlqhIPaIKQCcejmsQQ
Message-ID: <CANiDSCu0TyjgYnpP+wuk1TdxT=MDCQ0y3_-bgJMVWm-pvoaS9w@mail.gmail.com>
Subject: Re: uvcvideo driver not properly closing stream, using Webcam Elgato
 Facecam 4K, USB 3.0, UVC 1.5
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Philippe_Rivi=C3=A8re?= <phirivie@gmail.com>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Sat, 20 Sept 2025 at 13:17, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Philippe,
>
> On 20-Sep-25 1:07 PM, Philippe Rivi=C3=A8re wrote:
> > Dear,
> >
> > I have trouble with the uvcvideo driver for a new UVC 1.5 webcam
> > (Elgato Facecam 4K). I was wondering if I can ask here for some help
> > about it. Below my observations:
> >
> > First to start, plugging in the webcam I get in the kernel log:
> > [  784.408362] usb 4-1.2: Found UVC 1.00 device Elgato Facecam 4K (0fd9=
:0092)
> >
> >
> > set 4k resolution of the webcam to a lower setting to avoid
> > potentially it is a bandwidth issue:
> >
> > v4l2-ctl --device=3D/dev/video0
> > --set-fmt-video=3Dwidth=3D1920,height=3D1080,pixelformat=3DMJPG
> >
> > then I test running twice following command:
> > v4l2-ctl --device=3D/dev/video0 --stream-mmap --stream-count=3D1
> > --stream-to=3Dframe1.jpg
> > v4l2-ctl --device=3D/dev/video0 --stream-mmap --stream-count=3D1
> > --stream-to=3Dframe2.jpg
>
> Capturing only 1 frame is a bit of an unusual use-case. It could
> be that this is triggering a bug in the firmware of the camera.
>
> What happens if you just use a normal camera viewing app
> and let the camera stream for a couple of seconds and
> try that 2 times in a row ?
>

Could you also try to run something like:

````
rmmod uvcvideo
modprobe uvcvideo trace=3D0xffffffff
``

before you run your tests?

That will give us some insight of what is going on in the driver.

I have tried to reproduce your error, and everything works fine in my end.

Thanks!


> Regards,
>
> Hans
>
>
> >
> > -> first time it works, a frame1 is generated and stored
> > -> the command fails the second time, the webcam lights up but no
> > frame gets processed, the command keeps waiting for a frame
> >    this happens because the v4l2 doesn't properly closes the stream
> > the first time
> > -> no logs in the kernel log (running "sudo dmesg -w")
> >    this means the driver silently fails to reset the stream:
> >
> > * After VIDIOC_STREAMOFF, the driver doesn=E2=80=99t fully reset the in=
ternal buffers.
> > * Any new VIDIOC_STREAMON request just turns on the LED but never
> > produces frames.
> >
> >
> > also trying with gstreamer because it uses pipelines to start / stop th=
e stream:
> >
> > gst-launch-1.0 v4l2src device=3D/dev/video0 num-buffers=3D1 ! jpegdec !
> > videoconvert ! pngenc ! filesink location=3Dframe.png
> >
> > Setting pipeline to PAUSED ...
> > Pipeline is live and does not need PREROLL ...
> > Pipeline is PREROLLED ...
> > Setting pipeline to PLAYING ...
> > New clock: GstSystemClock
> > Redistribute latency...
> > Got EOS from element "pipeline0".
> > Execution ended after 0:00:02.392029227
> > Setting pipeline to NULL ...
> > Freeing pipeline ...
> >
> > -> first time works
> >
> > gst-launch-1.0 v4l2src device=3D/dev/video0 num-buffers=3D1 ! jpegdec !
> > videoconvert ! pngenc ! filesink location=3Dframe.png
> > Setting pipeline to PAUSED ...
> > Pipeline is live and does not need PREROLL ...
> > Pipeline is PREROLLED ...
> > Setting pipeline to PLAYING ...
> > New clock: GstSystemClock
> >
> > -> second time it keeps hanging here , waiting for a frame to process
> >
> > so for both "v4l2-ctl" and "gst-launch-1.0" the webcam stream does not
> > process frames anymore the second time.
> >
> > I kept the kernel log open all the time but no logs or errors shown..
> >
> > running following commands resets the webcam and then it works also aga=
in:
> >
> > sudo modprobe -r uvcvideo
> > sudo modprobe uvcvideo
> >
> > note that "sudo modprobe -r uvcvideo" works in ubuntu 25.10 beta, when
> > I was using ubuntu 24.04 it couldn't reset the uvcvideo driver (it got
> > stock telling it was still used by a process, a process hidden so I
> > couldn't kill the dependent process)
> >
> >
> > I have tested and got the same behaviour for ubuntu 24.04, 25.04 and
> > 25.10 (beta)
> > I also tried it in several apps, VLC, OBS, Google meet, Teams but all
> > gives the same behaviour which I concludes it is a driver kernel
> > issue.
> >
> > Can you help me to get the uvcvideo driver fixed in the kernel so it
> > properly closes webcam streams ?
> >
> > Kr,
> > Philippe
> >
> > PS: Some info about the webcam:
> >
> > v4l2-ctl --all --device=3D/dev/video0
> > Driver Info:
> > Driver name      : uvcvideo
> > Card type        : Elgato Facecam 4K
> > Bus info         : usb-0000:06:00.0-1.2
> > Driver version   : 6.17.0
> > Capabilities     : 0x84a00001
> > Video Capture
> > Metadata Capture
> > Streaming
> > Extended Pix Format
> > Device Capabilities
> > Device Caps      : 0x04200001
> > Video Capture
> > Streaming
> > Extended Pix Format
> > Media Driver Info:
> > Driver name      : uvcvideo
> > Model            : Elgato Facecam 4K
> > Serial           : xxxx(hidden)
> > Bus info         : usb-0000:06:00.0-1.2
> > Media version    : 6.17.0
> > Hardware revision: 0x00000226 (550)
> > Driver version   : 6.17.0
> > Interface Info:
> > ID               : 0x03000002
> > Type             : V4L Video
> > Entity Info:
> > ID               : 0x00000001 (1)
> > Name             : Elgato Facecam 4K
> > Function         : V4L2 I/O
> > Flags            : default
> > Pad 0x01000007   : 0: Sink
> >   Link 0x02000019: from remote pad 0x100000a of entity 'Processing 4'
> > (Video Pixel Formatter): Data, Enabled, Immutable
> > Priority: 2
> > Video input : 0 (Camera 1: ok)
> > Format Video Capture:
> > Width/Height      : 3840/2160
> > Pixel Format      : 'MJPG' (Motion-JPEG)
> > Field             : None
> > Bytes per Line    : 0
> > Size Image        : 16588800
> > Colorspace        : sRGB
> > Transfer Function : Default (maps to sRGB)
> > YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> > Quantization      : Default (maps to Full Range)
> > Flags             :
> > Crop Capability Video Capture:
> > Bounds      : Left 0, Top 0, Width 3840, Height 2160
> > Default     : Left 0, Top 0, Width 3840, Height 2160
> > Pixel Aspect: 1/1
> > Selection Video Capture: crop_default, Left 0, Top 0, Width 3840,
> > Height 2160, Flags:
> > Selection Video Capture: crop_bounds, Left 0, Top 0, Width 3840,
> > Height 2160, Flags:
> > Streaming Parameters Video Capture:
> > Capabilities     : timeperframe
> > Frames per second: 60.000 (60/1)
> > Read buffers     : 0
> >
> > User Controls
> >
> >                      brightness 0x00980900 (int)    : min=3D-9 max=3D9
> > step=3D1 default=3D2 value=3D2 flags=3Dhas-min-max
> >                        contrast 0x00980901 (int)    : min=3D0 max=3D200
> > step=3D1 default=3D110 value=3D110 flags=3Dhas-min-max
> >                      saturation 0x00980902 (int)    : min=3D0 max=3D200
> > step=3D1 default=3D140 value=3D140 flags=3Dhas-min-max
> >         white_balance_automatic 0x0098090c (bool)   : default=3D1 value=
=3D1
> >                            gain 0x00980913 (int)    : min=3D0 max=3D160
> > step=3D1 default=3D0 value=3D0 flags=3Dhas-min-max
> >            power_line_frequency 0x00980918 (menu)   : min=3D0 max=3D2
> > default=3D2 value=3D2 (60 Hz)
> > 0: Disabled
> > 1: 50 Hz
> > 2: 60 Hz
> >       white_balance_temperature 0x0098091a (int)    : min=3D2400
> > max=3D10000 step=3D100 default=3D4500 value=3D4500 flags=3Dinactive, ha=
s-min-max
> >                       sharpness 0x0098091b (int)    : min=3D0 max=3D200
> > step=3D1 default=3D100 value=3D100 flags=3Dhas-min-max
> >          backlight_compensation 0x0098091c (int)    : min=3D0 max=3D1
> > step=3D1 default=3D0 value=3D0 flags=3Dhas-min-max
> >
> > Camera Controls
> >
> >                   auto_exposure 0x009a0901 (menu)   : min=3D0 max=3D3
> > default=3D3 value=3D3 (Aperture Priority Mode)
> > 1: Manual Mode
> > 3: Aperture Priority Mode
> >          exposure_time_absolute 0x009a0902 (int)    : min=3D1 max=3D100=
0
> > step=3D1 default=3D156 value=3D156 flags=3Dinactive, has-min-max
> >                    pan_absolute 0x009a0908 (int)    : min=3D-5184000
> > max=3D5184000 step=3D3600 default=3D0 value=3D0 flags=3Dhas-min-max
> >                   tilt_absolute 0x009a0909 (int)    : min=3D-2916000
> > max=3D2916000 step=3D3600 default=3D0 value=3D0 flags=3Dhas-min-max
> >                   zoom_absolute 0x009a090d (int)    : min=3D100 max=3D4=
00
> > step=3D1 default=3D100 value=3D100 flags=3Dhas-min-max
> >
>
>


--=20
Ricardo Ribalda

