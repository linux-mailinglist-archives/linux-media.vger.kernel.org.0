Return-Path: <linux-media+bounces-42817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15221B8C69C
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 13:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D69617AEC04
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 11:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E03D2F5A23;
	Sat, 20 Sep 2025 11:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTeY8zmK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBAA21CC4B
	for <linux-media@vger.kernel.org>; Sat, 20 Sep 2025 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758367020; cv=none; b=dUruPxK43CbsaMqIOCTNkdvYrxxv8+stte5DJo3LKphCxl6rWNSFMLlsGiB7vFUxB7n7lvmhHUn1k0FpmzaGyHFedhIE262mz2Jqx/gVwJGHtBMY/s015EwThYcUTq8KESRqZXj2rCUVsVunJFd4dQV+3T5SO4L29lnBPLOSYJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758367020; c=relaxed/simple;
	bh=RkpDGJu7djjMUHVcNnH5zGKyMYwwyW2G6XPYttnrgcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GtaVpHFQEPTLJkE7A42AmtpheiU7jSjXoIluzkeRIpGUDh/XOVti/NcFBioF2N26+MQgDzH3vnc0ittz4sjfHgmN/lb8g/xrjxHCWXmimDkzygPGjKC8kGfwioJvwGoqxy7nfOeMr3d+47ACZcS4lO7fi2gGgrAjMJC9fFzPzeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTeY8zmK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2583C4CEEB;
	Sat, 20 Sep 2025 11:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758367019;
	bh=RkpDGJu7djjMUHVcNnH5zGKyMYwwyW2G6XPYttnrgcI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=oTeY8zmKdJs/fdcexpaoD7po/HJ3L4woDFP0WKs6dMwmEAk3YnvDJSGD4n/30XyYf
	 WIjBVeSzCXSsI4KOcAxsLbhudYPNb/TfbmybQK8vuHrcIy17gOkewjwBpCk0fO9l1g
	 DpuMBDK9VhhKKb6TE/zL/3JvO9GKlhg6oWpeq3gEd31DSaDBco8vTVrii3k5snSoL6
	 UKfTubXW4W9k7kEeHXODn8y1jpOQrKoRYDKoWRFUgZJ5RFPkkssYgDK4nXeNav4ngk
	 TEP1OUMqysTal2l2SbDiCqkE4YgTvbua5Swj/pN+IfnxRTcn/+W3M2sI/z0h/dOevC
	 Dz1ZVi4hv0DWA==
Message-ID: <c0abe9b8-42a3-45a7-9100-f0c8e7d6abd9@kernel.org>
Date: Sat, 20 Sep 2025 13:16:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: uvcvideo driver not properly closing stream, using Webcam Elgato
 Facecam 4K, USB 3.0, UVC 1.5
To: =?UTF-8?Q?Philippe_Rivi=C3=A8re?= <phirivie@gmail.com>,
 linux-media@vger.kernel.org
References: <CAE9VLgX06Evz+VmGs=EwQmVjmu-sU5_1ZzNdO5PWijO--TONpw@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAE9VLgX06Evz+VmGs=EwQmVjmu-sU5_1ZzNdO5PWijO--TONpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Philippe,

On 20-Sep-25 1:07 PM, Philippe Rivière wrote:
> Dear,
> 
> I have trouble with the uvcvideo driver for a new UVC 1.5 webcam
> (Elgato Facecam 4K). I was wondering if I can ask here for some help
> about it. Below my observations:
> 
> First to start, plugging in the webcam I get in the kernel log:
> [  784.408362] usb 4-1.2: Found UVC 1.00 device Elgato Facecam 4K (0fd9:0092)
> 
> 
> set 4k resolution of the webcam to a lower setting to avoid
> potentially it is a bandwidth issue:
> 
> v4l2-ctl --device=/dev/video0
> --set-fmt-video=width=1920,height=1080,pixelformat=MJPG
> 
> then I test running twice following command:
> v4l2-ctl --device=/dev/video0 --stream-mmap --stream-count=1
> --stream-to=frame1.jpg
> v4l2-ctl --device=/dev/video0 --stream-mmap --stream-count=1
> --stream-to=frame2.jpg

Capturing only 1 frame is a bit of an unusual use-case. It could
be that this is triggering a bug in the firmware of the camera.

What happens if you just use a normal camera viewing app
and let the camera stream for a couple of seconds and
try that 2 times in a row ?

Regards,

Hans


> 
> -> first time it works, a frame1 is generated and stored
> -> the command fails the second time, the webcam lights up but no
> frame gets processed, the command keeps waiting for a frame
>    this happens because the v4l2 doesn't properly closes the stream
> the first time
> -> no logs in the kernel log (running "sudo dmesg -w")
>    this means the driver silently fails to reset the stream:
> 
> * After VIDIOC_STREAMOFF, the driver doesn’t fully reset the internal buffers.
> * Any new VIDIOC_STREAMON request just turns on the LED but never
> produces frames.
> 
> 
> also trying with gstreamer because it uses pipelines to start / stop the stream:
> 
> gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=1 ! jpegdec !
> videoconvert ! pngenc ! filesink location=frame.png
> 
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> Redistribute latency...
> Got EOS from element "pipeline0".
> Execution ended after 0:00:02.392029227
> Setting pipeline to NULL ...
> Freeing pipeline ...
> 
> -> first time works
> 
> gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=1 ! jpegdec !
> videoconvert ! pngenc ! filesink location=frame.png
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> 
> -> second time it keeps hanging here , waiting for a frame to process
> 
> so for both "v4l2-ctl" and "gst-launch-1.0" the webcam stream does not
> process frames anymore the second time.
> 
> I kept the kernel log open all the time but no logs or errors shown..
> 
> running following commands resets the webcam and then it works also again:
> 
> sudo modprobe -r uvcvideo
> sudo modprobe uvcvideo
> 
> note that "sudo modprobe -r uvcvideo" works in ubuntu 25.10 beta, when
> I was using ubuntu 24.04 it couldn't reset the uvcvideo driver (it got
> stock telling it was still used by a process, a process hidden so I
> couldn't kill the dependent process)
> 
> 
> I have tested and got the same behaviour for ubuntu 24.04, 25.04 and
> 25.10 (beta)
> I also tried it in several apps, VLC, OBS, Google meet, Teams but all
> gives the same behaviour which I concludes it is a driver kernel
> issue.
> 
> Can you help me to get the uvcvideo driver fixed in the kernel so it
> properly closes webcam streams ?
> 
> Kr,
> Philippe
> 
> PS: Some info about the webcam:
> 
> v4l2-ctl --all --device=/dev/video0
> Driver Info:
> Driver name      : uvcvideo
> Card type        : Elgato Facecam 4K
> Bus info         : usb-0000:06:00.0-1.2
> Driver version   : 6.17.0
> Capabilities     : 0x84a00001
> Video Capture
> Metadata Capture
> Streaming
> Extended Pix Format
> Device Capabilities
> Device Caps      : 0x04200001
> Video Capture
> Streaming
> Extended Pix Format
> Media Driver Info:
> Driver name      : uvcvideo
> Model            : Elgato Facecam 4K
> Serial           : xxxx(hidden)
> Bus info         : usb-0000:06:00.0-1.2
> Media version    : 6.17.0
> Hardware revision: 0x00000226 (550)
> Driver version   : 6.17.0
> Interface Info:
> ID               : 0x03000002
> Type             : V4L Video
> Entity Info:
> ID               : 0x00000001 (1)
> Name             : Elgato Facecam 4K
> Function         : V4L2 I/O
> Flags            : default
> Pad 0x01000007   : 0: Sink
>   Link 0x02000019: from remote pad 0x100000a of entity 'Processing 4'
> (Video Pixel Formatter): Data, Enabled, Immutable
> Priority: 2
> Video input : 0 (Camera 1: ok)
> Format Video Capture:
> Width/Height      : 3840/2160
> Pixel Format      : 'MJPG' (Motion-JPEG)
> Field             : None
> Bytes per Line    : 0
> Size Image        : 16588800
> Colorspace        : sRGB
> Transfer Function : Default (maps to sRGB)
> YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> Quantization      : Default (maps to Full Range)
> Flags             :
> Crop Capability Video Capture:
> Bounds      : Left 0, Top 0, Width 3840, Height 2160
> Default     : Left 0, Top 0, Width 3840, Height 2160
> Pixel Aspect: 1/1
> Selection Video Capture: crop_default, Left 0, Top 0, Width 3840,
> Height 2160, Flags:
> Selection Video Capture: crop_bounds, Left 0, Top 0, Width 3840,
> Height 2160, Flags:
> Streaming Parameters Video Capture:
> Capabilities     : timeperframe
> Frames per second: 60.000 (60/1)
> Read buffers     : 0
> 
> User Controls
> 
>                      brightness 0x00980900 (int)    : min=-9 max=9
> step=1 default=2 value=2 flags=has-min-max
>                        contrast 0x00980901 (int)    : min=0 max=200
> step=1 default=110 value=110 flags=has-min-max
>                      saturation 0x00980902 (int)    : min=0 max=200
> step=1 default=140 value=140 flags=has-min-max
>         white_balance_automatic 0x0098090c (bool)   : default=1 value=1
>                            gain 0x00980913 (int)    : min=0 max=160
> step=1 default=0 value=0 flags=has-min-max
>            power_line_frequency 0x00980918 (menu)   : min=0 max=2
> default=2 value=2 (60 Hz)
> 0: Disabled
> 1: 50 Hz
> 2: 60 Hz
>       white_balance_temperature 0x0098091a (int)    : min=2400
> max=10000 step=100 default=4500 value=4500 flags=inactive, has-min-max
>                       sharpness 0x0098091b (int)    : min=0 max=200
> step=1 default=100 value=100 flags=has-min-max
>          backlight_compensation 0x0098091c (int)    : min=0 max=1
> step=1 default=0 value=0 flags=has-min-max
> 
> Camera Controls
> 
>                   auto_exposure 0x009a0901 (menu)   : min=0 max=3
> default=3 value=3 (Aperture Priority Mode)
> 1: Manual Mode
> 3: Aperture Priority Mode
>          exposure_time_absolute 0x009a0902 (int)    : min=1 max=1000
> step=1 default=156 value=156 flags=inactive, has-min-max
>                    pan_absolute 0x009a0908 (int)    : min=-5184000
> max=5184000 step=3600 default=0 value=0 flags=has-min-max
>                   tilt_absolute 0x009a0909 (int)    : min=-2916000
> max=2916000 step=3600 default=0 value=0 flags=has-min-max
>                   zoom_absolute 0x009a090d (int)    : min=100 max=400
> step=1 default=100 value=100 flags=has-min-max
> 


