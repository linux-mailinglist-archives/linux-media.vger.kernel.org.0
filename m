Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06C7358D3F
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 21:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232969AbhDHTGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 15:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232804AbhDHTGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 15:06:30 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB28C061760
        for <linux-media@vger.kernel.org>; Thu,  8 Apr 2021 12:06:18 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id w7-20020a1cdf070000b0290125f388fb34so982860wmg.0
        for <linux-media@vger.kernel.org>; Thu, 08 Apr 2021 12:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=avZZf+CRAZuJ9scymQ3KqjL7gG+/KVD6TaEPV6oIwa0=;
        b=kftFeE1xrrnxy2bCwSt2kaWU1jMT//++swrm3Yw3DKJ7IvFm9MR8yw0t7tYVaEpJcB
         CfNUcEJSLX2+o1u2CslOHEeZAiwj/+KNGAd48CO+8xTpRemiyZQGD3IOu8Oc2gs0VIzY
         6M2BNxrUczeE9LM+K4xwsNx+t3rbnUCDseOnK1rnHHpNTbSbKx55mYoljvFOmt+k2sEY
         34dZMlcJ6jnNlSVS/h6Tqimbmm5pCo7MPIiqwN1pjXLkpSN29sVMeljF6aGhkngIWCTi
         M4fBDZ6CIsQTBWKX5765lkHFBqB58BRFVnXii94+qU1YeIwmLqymFLsE5EoUbS2mIF55
         Bq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=avZZf+CRAZuJ9scymQ3KqjL7gG+/KVD6TaEPV6oIwa0=;
        b=Ze2nL/SD1w8dzdJBlIw/Q64qxOxqvBUzx+5LresZuZw5RN5lSK+N48fxwJhXXHduKV
         YVCO8NgJpuEgZ0/h75R1B5lvZGRVyAGFYCQA/VpfRBMY9Q2xU7J3RSRebWOH4M9FWPf7
         El+vLKUbL3RC0NkSLc0mxECEbaWvVBtSlvVJK2xaWrO6UPwFq0hoOa49kdTXkVWfUDJm
         oHhLepjke9mJ9ecoD4snVyWE96wKE/v2Hg79Xd4XwKk2Hrtevywn/1B9hYkG0FLCeSVY
         Yx2TKx1gm3RL13VhKG9XKkTd7y1hLNf2jEFRPjlHsS3TBOg2mbG7RffFpm6LEguxEV14
         UxeQ==
X-Gm-Message-State: AOAM530ozVN4k3DEzFDrMyGccGFI/ma+uloyBCrgvABmcQr6oJ5W9ACX
        DEJPYPXAtQ7wY6uQd44/YQ==
X-Google-Smtp-Source: ABdhPJwO9/Voml2OC7RgaBJswluJ9LzJvDDY+U6YHdqWUoxaCkX/ynydjasDGHrx/3ohwn6mPXxkcw==
X-Received: by 2002:a1c:1b4d:: with SMTP id b74mr10439140wmb.106.1617908776961;
        Thu, 08 Apr 2021 12:06:16 -0700 (PDT)
Received: from [192.168.1.3] ([77.100.226.17])
        by smtp.googlemail.com with ESMTPSA id j6sm174021wmq.16.2021.04.08.12.06.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 12:06:16 -0700 (PDT)
From:   test9876543 <wulf.rajek@googlemail.com>
X-Google-Original-From: test9876543 <test9876543@googlemail.com>
To:     linux-media@vger.kernel.org
Subject: UVC compliant device 0c45:6366 Microdia - Victure SC30
Message-ID: <6c331a90-8f85-5c9e-c480-40b1f634267c@googlemail.com>
Date:   Thu, 8 Apr 2021 20:06:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As per http://www.ideasonboard.org/uvc/#devices, I'm reporting a working 
device not listed in the table. Please see details of lsusb, dmesg, 
ffmpeg and gst-device-monitor-1.0 below.

The product is advertised as "Victure Webcam SC30"
https://www.amazon.co.uk/gp/product/B086QF84DK/



lsusb:
Bus 001 Device 016: ID 0c45:6366 Microdia


dmesg:
[200407.743816] usb 1-2.4: new high-speed USB device number 19 using 
xhci_hcd
[200408.361398] usb 1-2.4: New USB device found, idVendor=0c45, 
idProduct=6366, bcdDevice= 1.00
[200408.361406] usb 1-2.4: New USB device strings: Mfr=2, Product=1, 
SerialNumber=3
[200408.361411] usb 1-2.4: Product: USB  Camera
[200408.361414] usb 1-2.4: Manufacturer: USB  Camera
[200408.361417] usb 1-2.4: SerialNumber: USB  Camera
[200408.364677] uvcvideo: Found UVC 1.00 device USB  Camera (0c45:6366)
[200408.406090] input: USB  Camera: USB  Camera as 
/devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2.4/1-2.4:1.0/input/input22



ffmpeg -hide_banner -f v4l2 -list_formats all -i /dev/video2
[video4linux2,v4l2 @ 0x564561b2a6c0] Compressed:       mjpeg : 
Motion-JPEG : 1920x1080 1280x720 960x540 800x600 640x480 320x240 320x180 
176x144 160x120 1920x1080
[video4linux2,v4l2 @ 0x564561b2a6c0] Raw       :     yuyv422 : 
YUYV 4:2:2 : 1920x1080 1280x720 640x480 320x240 1920x1080

ffmpeg -hide_banner -f v4l2 -list_formats all -i /dev/video4
[video4linux2,v4l2 @ 0x55a5550af6c0] Compressed:        h264 : 
      H.264 : 1920x1080 1280x720 640x480 320x240 176x144 160x120 1920x1080


gst-device-monitor-1.0:

Device found:

	name  : USB  Camera: USB  Camera
	class : Video/Source
	caps  : video/x-raw, format=(string)YUY2, width=(int)1920, 
height=(int)1080, pixel-aspect-ratio=(fraction)1/1, 
framerate=(fraction){ 5/1, 5/1 };
	        video/x-raw, format=(string)YUY2, width=(int)1920, 
height=(int)1080, pixel-aspect-ratio=(fraction)1/1, 
framerate=(fraction){ 5/1, 5/1 };
	        video/x-raw, format=(string)YUY2, width=(int)1280, 
height=(int)720, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)5/1;
	        video/x-raw, format=(string)YUY2, width=(int)640, 
height=(int)480, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 
30/1, 20/1, 15/1, 10/1, 5/1 };
	        video/x-raw, format=(string)YUY2, width=(int)320, 
height=(int)240, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 
30/1, 20/1, 15/1, 10/1, 5/1 };
	        image/jpeg, width=(int)1920, height=(int)1080, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1, 30/1, 20/1, 15/1, 10/1, 5/1 };
	        image/jpeg, width=(int)1920, height=(int)1080, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1, 30/1, 20/1, 15/1, 10/1, 5/1 };
	        image/jpeg, width=(int)1280, height=(int)720, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1 };
	        image/jpeg, width=(int)960, height=(int)540, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1 };
	        image/jpeg, width=(int)800, height=(int)600, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1 };
	        image/jpeg, width=(int)640, height=(int)480, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1 };
	        image/jpeg, width=(int)320, height=(int)240, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1 };
	        image/jpeg, width=(int)320, height=(int)180, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1 };
	        image/jpeg, width=(int)176, height=(int)144, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1 };
	        image/jpeg, width=(int)160, height=(int)120, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1 };
	properties:
		udev-probed = true
		device.bus_path = pci-0000:00:14.0-usb-0:2.4:1.0
		sysfs.path = 
/sys/devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2.4/1-2.4:1.0/video4linux/video2
		device.bus = usb
		device.subsystem = video4linux
		device.vendor.id = 0c45
		device.vendor.name = "USB\\x20\\x20Camera"
		device.product.id = 6366
		device.product.name = "USB\ \ Camera:\ USB\ \ Camera"
		device.serial = USB_Camera_USB_Camera_USB_Camera
		device.capabilities = :capture:
		device.api = v4l2
		device.path = /dev/video2
		v4l2.device.driver = uvcvideo
		v4l2.device.card = "USB\ \ Camera:\ USB\ \ Camera"
		v4l2.device.bus_info = usb-0000:00:14.0-2.4
		v4l2.device.version = 329746 (0x00050812)
		v4l2.device.capabilities = 2225078273 (0x84a00001)
		v4l2.device.device_caps = 69206017 (0x04200001)
	gst-launch-1.0 v4l2src device=/dev/video2 ! ...


Device found:

	name  : USB  Camera: USB  Camera
	class : Video/Source
	caps  : video/x-h264, stream-format=(string)byte-stream, 
alignment=(string)au, width=(int)1920, height=(int)1080, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1, 30/1, 20/1, 15/1, 10/1, 5/1 };
	        video/x-h264, stream-format=(string)byte-stream, 
alignment=(string)au, width=(int)1920, height=(int)1080, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1, 30/1, 20/1, 15/1, 10/1, 5/1 };
	        video/x-h264, stream-format=(string)byte-stream, 
alignment=(string)au, width=(int)1280, height=(int)720, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1 };
	        video/x-h264, stream-format=(string)byte-stream, 
alignment=(string)au, width=(int)640, height=(int)480, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1 };
	        video/x-h264, stream-format=(string)byte-stream, 
alignment=(string)au, width=(int)320, height=(int)240, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1 };
	        video/x-h264, stream-format=(string)byte-stream, 
alignment=(string)au, width=(int)176, height=(int)144, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1 };
	        video/x-h264, stream-format=(string)byte-stream, 
alignment=(string)au, width=(int)160, height=(int)120, 
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction){ 30/1, 20/1, 
15/1, 10/1, 5/1 };
	properties:
		udev-probed = true
		device.bus_path = pci-0000:00:14.0-usb-0:2.4:1.0
		sysfs.path = 
/sys/devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2.4/1-2.4:1.0/video4linux/video4
		device.bus = usb
		device.subsystem = video4linux
		device.vendor.id = 0c45
		device.vendor.name = "USB\\x20\\x20Camera"
		device.product.id = 6366
		device.product.name = "USB\ \ Camera:\ USB\ \ Camera"
		device.serial = USB_Camera_USB_Camera_USB_Camera
		device.capabilities = :capture:
		device.api = v4l2
		device.path = /dev/video4
		v4l2.device.driver = uvcvideo
		v4l2.device.card = "USB\ \ Camera:\ USB\ \ Camera"
		v4l2.device.bus_info = usb-0000:00:14.0-2.4
		v4l2.device.version = 329746 (0x00050812)
		v4l2.device.capabilities = 2225078273 (0x84a00001)
		v4l2.device.device_caps = 69206017 (0x04200001)
	gst-launch-1.0 v4l2src device=/dev/video4 ! ...



Device found:

	name  : USB  Camera Analogue Stereo
	class : Audio/Source
	caps  : audio/x-raw, format=(string){ S16LE, S16BE, F32LE, F32BE, 
S32LE, S32BE, S24LE, S24BE, S24_32LE, S24_32BE, U8 }, 
layout=(string)interleaved, rate=(int)[ 1, 384000 ], channels=(int)[ 1, 
32 ];
	        audio/x-alaw, rate=(int)[ 1, 384000 ], channels=(int)[ 1, 32 ];
	        audio/x-mulaw, rate=(int)[ 1, 384000 ], channels=(int)[ 1, 32 ];
	properties:
		alsa.resolution_bits = 16
		device.api = alsa
		device.class = sound
		alsa.class = generic
		alsa.subclass = generic-mix
		alsa.name = "USB\ Audio"
		alsa.id = "USB\ Audio"
		alsa.subdevice = 0
		alsa.subdevice_name = "subdevice\ \#0"
		alsa.device = 0
		alsa.card = 4
		alsa.card_name = "USB\ \ Camera"
		alsa.long_card_name = "USB\ \ Camera\ USB\ \ Camera\ at\ 
usb-0000:00:14.0-2.4\,\ high\ speed"
		alsa.driver_name = snd_usb_audio
		device.bus_path = pci-0000:00:14.0-usb-0:2.4:1.3
		sysfs.path = 
/devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2.4/1-2.4:1.3/sound/card4
		udev.id = usb-USB_Camera_USB_Camera_USB_Camera-03
		device.bus = usb
		device.vendor.id = 0c45
		device.vendor.name = Microdia
		device.product.id = 6366
		device.product.name = "USB\ \ Camera"
		device.serial = USB_Camera_USB_Camera_USB_Camera
		device.form_factor = webcam
		device.string = front:4
		device.buffering.buffer_size = 352800
		device.buffering.fragment_size = 176400
		device.access_mode = mmap+timer
		device.profile.name = analog-stereo
		device.profile.description = "Analogue\ Stereo"
		device.description = "USB\ \ Camera\ Analogue\ Stereo"
		module-udev-detect.discovered = 1
		device.icon_name = camera-web-usb
		is-default = true
	gst-launch-1.0 pulsesrc 
device=alsa_input.usb-USB_Camera_USB_Camera_USB_Camera-03.analog-stereo 
! ...

