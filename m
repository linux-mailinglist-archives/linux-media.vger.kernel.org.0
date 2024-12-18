Return-Path: <linux-media+bounces-23715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 083589F6B51
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 17:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDB56189874B
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 16:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992AB1F6683;
	Wed, 18 Dec 2024 16:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Epc3gYgt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668051F543B
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 16:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734539803; cv=none; b=bF1JUBWJZWCDdmpRYDb/r57HmO1noujyQL2xBx6pLyEsioZa/olhRN6IFXcbOW56L+Uh2tSX9m/W+A474w4ui+WZGQqVWigOwr6tOJSkzl9orGeWJFdYEITsyjbu57LEm2CxPohBFmBHsBN+t3d373QS1BtHxPs7b9ysyi7d4Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734539803; c=relaxed/simple;
	bh=Lkmm3Q7UWRbpjY3WOvcOtA+TyaBXzfzGsQ3d5NO7BII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6aEPxANEnBWSR3atsxZ/uC+Bv63dNP+3oucQazKJKp8NmldQivP9HX1bjEKrYST2+oq9oHfZHGQE6kzEjEfoetTMs50cb7To/jAm5GAD18I9j6i7ZpibJaAD9QtaYYqHqmp9/Vrrld2662r3uPa9yrlGq4D/cIDYWsEi5hBggY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Epc3gYgt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6905E59D;
	Wed, 18 Dec 2024 17:35:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734539758;
	bh=Lkmm3Q7UWRbpjY3WOvcOtA+TyaBXzfzGsQ3d5NO7BII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Epc3gYgt6ZPbwptK0Yq3os5YzTZjTeYpiWvLX+f2imNolD4Us7+jx70K3NbmhlRYP
	 vpfG42wKLhc7vtx+uTaLNTAj0ZAlOnhvGvg2R+tTGjsIGQ5ty4w3cbu8VLPrH4kEKV
	 meK0rUBjKxUNnl8UMCrKVrq4L86i4V/Y5Zp4vtCc=
Date: Wed, 18 Dec 2024 17:36:33 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: "duanek@chorus.net" <duanek@chorus.net>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org
Subject: Re: IPU6 Camera with ov08x40 (OVTI08F4 sensor) HP Spectre 16" Meteor
 Lake doesn't work
Message-ID: <3csrwld4fbhg7fg7v4dm4fccvxkracxuwj6y7k5z7k7t5zpeha@qfgr6pmzyg6f>
References: <1594170563.10937137.1728935697496.JavaMail.zimbra@chorus.net>
 <361614030.100297606.1734530611240.JavaMail.zimbra@chorus.net>
 <vb66ls2rs5fnr2yj2b5wktccevmrcwq4gztlh4vtezc6hej4vm@dtduyfphcezx>
 <1385342589.100511352.1734536762106.JavaMail.zimbra@chorus.net>
 <45xboahdow6gy7uanhrdsiln3zxcu4xdy7hew3usqtgurf7byj@wl7gvzgtzg5s>
 <1626527939.100593578.1734539132976.JavaMail.zimbra@chorus.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1626527939.100593578.1734539132976.JavaMail.zimbra@chorus.net>

Hi Duane

On Wed, Dec 18, 2024 at 11:25:32AM -0500, duanek@chorus.net wrote:
> Dear Jacopo,
>
> Thanks for forwarding to libcamera - I'm a newbie and am not sure who all should be involved.
>
> When I specify the camera, I get:
> duane@DuanesSpectre16:~/cameratest$ LIBCAMERA_LOG_LEVELS=0 qcam -c"\_SB_.PC00.LNK0"

You need '-C' to tell qcam you want to capture and how many frames

qcam --help might help

> [2:42:26.057450553] [29471] DEBUG IPAModule ipa_module.cpp:333 ipa_ipu3.so: IPA module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is signed
> [2:42:26.057555621] [29471] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
> [2:42:26.057657128] [29471] DEBUG IPAModule ipa_module.cpp:333 ipa_soft_simple.so: IPA module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is signed
> [2:42:26.057679142] [29471] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so'
> [2:42:26.057753046] [29471]  INFO Camera camera_manager.cpp:327 libcamera v0.3.2+240-936a099e
> [2:42:26.057820003] [29488] DEBUG Camera camera_manager.cpp:73 Starting camera manager
> [2:42:26.064137023] [29488] DEBUG DeviceEnumerator device_enumerator.cpp:230 New media device "intel-ipu6" created from /dev/media0
> [2:42:26.065419467] [29488] DEBUG DeviceEnumerator device_enumerator_udev.cpp:96 Defer media device /dev/media0 due to 1 missing dependencies
> [2:42:26.065544818] [29488] DEBUG DeviceEnumerator device_enumerator_udev.cpp:322 All dependencies for media device /dev/media0 found
> [2:42:26.065552508] [29488] DEBUG DeviceEnumerator device_enumerator.cpp:258 Added device /dev/media0: intel-ipu6
> [2:42:26.065764796] [29488] DEBUG Camera camera_manager.cpp:140 Found registered pipeline handler 'ipu3'
> [2:42:26.065932776] [29488] DEBUG Camera camera_manager.cpp:140 Found registered pipeline handler 'simple'
> [2:42:26.065961800] [29488] DEBUG DeviceEnumerator device_enumerator.cpp:318 Successful match for media device "intel-ipu6"
> [2:42:26.066013314] [29488] DEBUG SimplePipeline simple.cpp:1585 Sensor found for /dev/media0
> [2:42:26.066363804] [29488] DEBUG SimplePipeline simple.cpp:424 Found capture device Intel IPU6 ISYS Capture 0
> [2:42:26.066432874] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Exposure (0x00980911)
> [2:42:26.066533156] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Horizontal Flip (0x00980914)
> [2:42:26.066552146] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Vertical Flip (0x00980915)
> [2:42:26.066564186] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Camera Orientation (0x009a0922)
> [2:42:26.066598398] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Camera Sensor Rotation (0x009a0923)
> [2:42:26.066607749] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Vertical Blanking (0x009e0901)
> [2:42:26.066615496] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Horizontal Blanking (0x009e0902)
> [2:42:26.066624456] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Analogue Gain (0x009e0903)
> [2:42:26.066632496] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Link Frequency (0x009f0901)
> [2:42:26.066642252] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Pixel Rate (0x009f0902)
> [2:42:26.066650208] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Test Pattern (0x009f0903)
> [2:42:26.066661024] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Digital Gain (0x009f0905)
> [2:42:26.066898310] [29488] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036': Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for device
> [2:42:26.066913149] [29488]  WARN CameraSensor camera_sensor_legacy.cpp:401 'ov08x40 4-0036': The PixelArraySize property has been defaulted to 3856x2416
> [2:42:26.066919954] [29488] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036': Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for device
> [2:42:26.066925838] [29488]  WARN CameraSensor camera_sensor_legacy.cpp:412 'ov08x40 4-0036': The PixelArrayActiveAreas property has been defaulted to (0, 0)/3856x2416
> [2:42:26.066933317] [29488] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036': Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for device
> [2:42:26.066938196] [29488]  WARN CameraSensor camera_sensor_legacy.cpp:420 'ov08x40 4-0036': Failed to retrieve the sensor crop rectangle
> [2:42:26.066942687] [29488]  WARN CameraSensor camera_sensor_legacy.cpp:426 'ov08x40 4-0036': The sensor kernel driver needs to be fixed
> [2:42:26.066947226] [29488]  WARN CameraSensor camera_sensor_legacy.cpp:428 'ov08x40 4-0036': See Documentation/sensor_driver_requirements.rst in the libcamera sources for more information
> [2:42:26.067684243] [29488]  WARN CameraSensorProperties camera_sensor_properties.cpp:458 No static properties available for 'ov08x40'
> [2:42:26.067693564] [29488]  WARN CameraSensorProperties camera_sensor_properties.cpp:460 Please consider updating the camera sensor properties database
> [2:42:26.067741878] [29488] DEBUG CameraSensor camera_sensor.cpp:401 Entity 'ov08x40 4-0036' matched by CameraSensorLegacy
> [2:42:26.067778580] [29488] DEBUG SimplePipeline simple.cpp:491 Found pipeline: [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 ISYS Capture 0]
> [2:42:26.067916324] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Exposure (0x00980911)
> [2:42:26.067935252] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Horizontal Flip (0x00980914)
> [2:42:26.067945617] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Vertical Flip (0x00980915)
> [2:42:26.067954256] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Camera Orientation (0x009a0922)
> [2:42:26.067966526] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Camera Sensor Rotation (0x009a0923)
> [2:42:26.067975684] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Vertical Blanking (0x009e0901)
> [2:42:26.067985047] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Horizontal Blanking (0x009e0902)
> [2:42:26.067993028] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Analogue Gain (0x009e0903)
> [2:42:26.068007396] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Link Frequency (0x009f0901)
> [2:42:26.068017686] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Pixel Rate (0x009f0902)
> [2:42:26.068027135] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Test Pattern (0x009f0903)
> [2:42:26.068038204] [29488] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036': Control: Digital Gain (0x009f0905)
> [2:42:26.068090416] [29488] DEBUG V4L2 v4l2_videodevice.cpp:631 /dev/video0[28:cap]: Opened device : isys: ipu6
> [2:42:26.068226108] [29488] DEBUG DmaBufAllocator dma_buf_allocator.cpp:106 Failed to open /dev/dma_heap/linux,cma: No such file or directory
> [2:42:26.068234837] [29488] DEBUG DmaBufAllocator dma_buf_allocator.cpp:106 Failed to open /dev/dma_heap/reserved: No such file or directory
> [2:42:26.068241699] [29488] DEBUG DmaBufAllocator dma_buf_allocator.cpp:112 Using /dev/dma_heap/system
> [2:42:26.070251295] [29488] DEBUG IPAManager ipa_manager.cpp:306 IPA module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signature is valid
> [2:42:26.070330771] [29488] DEBUG IPAProxy soft_ipa_proxy.cpp:45 initializing soft proxy: loading IPA from /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
> [2:42:26.070835928] [29488]  WARN IPAProxy ipa_proxy.cpp:160 Configuration file 'ov08x40.yaml' not found for IPA module 'simple', falling back to 'uncalibrated.yaml'
> [2:42:26.070880076] [29488]  WARN IPASoft soft_simple.cpp:96 IPASoft: Failed to create camera sensor helper for ov08x40
> [2:42:26.071040106] [29488] DEBUG IPASoft soft_simple.cpp:117 IPASoft: Tuning file version 1
> [2:42:26.071109941] [29488] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instantiated algorithm 'BlackLevel'
> [2:42:26.071158211] [29488] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instantiated algorithm 'Awb'
> [2:42:26.071203227] [29488] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instantiated algorithm 'Lut'
> [2:42:26.071229619] [29488] DEBUG IPAModuleAlgo module.h:91 IPASoft: Instantiated algorithm 'Agc'
> [2:42:26.071324318] [29488] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 0
> [2:42:26.071333254] [29488] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 1
> [2:42:26.071401066] [29488] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x40 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 1928x1208-SGRBG10_1X10
> [2:42:26.071416834] [29488] DEBUG SimplePipeline simple.cpp:780 Link 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 1928x1208-SGRBG10_1X10
> [2:42:26.071466886] [29488] DEBUG SimplePipeline simple.cpp:631 Adding configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
> [2:42:26.071554427] [29488] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x40 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 3856x2416-SGRBG10_1X10
> [2:42:26.071561826] [29488] DEBUG SimplePipeline simple.cpp:780 Link 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 3856x2416-SGRBG10_1X10
> [2:42:26.071572163] [29488] DEBUG SimplePipeline simple.cpp:631 Adding configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
> [2:42:26.071786561] [29488] DEBUG Camera camera_manager.cpp:161 Pipeline handler "simple" matched
> [2:42:26.071805509] [29488] DEBUG Camera camera_manager.cpp:140 Found registered pipeline handler 'uvcvideo'
> [2:42:26.106083711] [29471] DEBUG SimplePipeline simple.cpp:1017 Largest stream size is 3848x2416
> [2:42:26.106124827] [29471] DEBUG SimplePipeline simple.cpp:1069 Picked 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x2416
> [2:42:26.106193385] [29471] DEBUG Camera camera.cpp:1137 streams configuration: (0) 3848x2416-ABGR8888
> [2:42:26.106237153] [29471] DEBUG SimplePipeline simple.cpp:1017 Largest stream size is 3848x2416
> [2:42:26.106243935] [29471] DEBUG SimplePipeline simple.cpp:1069 Picked 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x2416
> [2:42:26.106257446] [29471] DEBUG SimplePipeline simple.cpp:1017 Largest stream size is 3848x2416
> [2:42:26.106264326] [29471] DEBUG SimplePipeline simple.cpp:1069 Picked 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x2416
> [2:42:26.106275551] [29471]  INFO Camera camera.cpp:1202 configuring streams: (0) 3848x2416-ABGR8888
> [2:42:26.106354216] [29488] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 0
> [2:42:26.106386640] [29488] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 1
> [2:42:26.106484769] [29488] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x40 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 3856x2416-SGRBG10_1X10
> [2:42:26.106494021] [29488] DEBUG SimplePipeline simple.cpp:780 Link 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 3856x2416-SGRBG10_1X10
> [2:42:26.106551423] [29488]  WARN CameraSensor camera_sensor_legacy.cpp:501 'ov08x40 4-0036': No sensor delays found in static properties. Assuming unverified defaults.
> [2:42:26.106642460] [29488] DEBUG DelayedControls delayed_controls.cpp:99 Set a delay of 2 and priority write flag 0 for Exposure
> [2:42:26.106658556] [29488] DEBUG DelayedControls delayed_controls.cpp:99 Set a delay of 1 and priority write flag 0 for Analogue Gain
> [2:42:26.106822531] [29488]  INFO IPASoft soft_simple.cpp:251 IPASoft: Exposure 4-4992, gain 0-1984 (1)
> Zero-copy enabled
> [2:42:26.110235367] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.113343648] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.116390199] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.119374839] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.125329380] [29471] DEBUG Request request.cpp:369 Created request - cookie: 0
> [2:42:26.125505377] [29471] DEBUG Request request.cpp:369 Created request - cookie: 0
> [2:42:26.125523467] [29471] DEBUG Request request.cpp:369 Created request - cookie: 0
> [2:42:26.125531018] [29471] DEBUG Request request.cpp:369 Created request - cookie: 0
> [2:42:26.125546767] [29471] DEBUG Camera camera.cpp:1360 Starting capture
> [2:42:26.135295574] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1311 /dev/video0[28:cap]: 3 buffers requested.
> [2:42:26.135380273] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.135397476] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.135407136] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.135749405] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750 /dev/video0[28:cap]: Queueing buffer 0
> [2:42:26.294678108] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750 /dev/video0[28:cap]: Queueing buffer 1
> [2:42:26.294710299] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750 /dev/video0[28:cap]: Queueing buffer 2
> [2:42:46.501427517] [29471] DEBUG Camera camera.cpp:1404 Stopping capture
> [2:42:50.541207894] [29488] DEBUG Request request.cpp:129 Request(0:C:0/1:0)
> [2:42:50.541314260] [29488] DEBUG Request request.cpp:129 Request(1:C:0/1:0)
> [2:42:50.541329943] [29488] DEBUG Request request.cpp:129 Request(2:C:0/1:0)
> [2:42:50.541365704] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1596 /dev/video0[28:cap]: Releasing buffers
> [2:42:50.545182849] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1311 /dev/video0[28:cap]: 0 buffers requested.
> [2:42:50.545229101] [29488] DEBUG Request request.cpp:129 Request(3:X:0/1:0)
>
>
> ----- On Dec 18, 2024, at 10:09 AM, Jacopo Mondi jacopo.mondi@ideasonboard.com wrote:
>
> > Forwarded to the libcamera mailing list where experts on the
> > SimplePipeline and SoftwareISP can read (the ones that do not read
> > here)
> >
> > On Wed, Dec 18, 2024 at 10:46:02AM -0500, duanek@chorus.net wrote:
> >> Dear Jacopo,
> >>
> >> Thanks for your feedback.
> >>
> >> > However, as said, you should be able to get frames out
> >>
> >> Nope, I do not get any frames, just an offset image of a camera with a slash
> >> through it.
> >
> > That's the default qcam symbol for "camera not found" ?
> > Could you try with 'cam' saving frames to disk ?
> >
> >> qcam output:
> >>
> >> duane@DuanesSpectre16:~/cameratest$ LIBCAMERA_LOG_LEVELS=0 qcam -s
> >> "width=1928,height=1208"
> >
> > Or pass the camera number to qcam maybe ?
> >
> > qcam -c1 -C
> >
> >> [2:08:48.367287574] [26884] DEBUG IPAModule ipa_module.cpp:333 ipa_ipu3.so: IPA
> >> module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is signed
> >> [2:08:48.367391256] [26884] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA
> >> module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
> >> [2:08:48.367477441] [26884] DEBUG IPAModule ipa_module.cpp:333
> >> ipa_soft_simple.so: IPA module
> >> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is signed
> >> [2:08:48.367493138] [26884] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA
> >> module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so'
> >> [2:08:48.367559794] [26884]  INFO Camera camera_manager.cpp:327 libcamera
> >> v0.3.2+240-936a099e
> >> [2:08:48.367620533] [26896] DEBUG Camera camera_manager.cpp:73 Starting camera
> >> manager
> >> [2:08:48.376420422] [26896] DEBUG DeviceEnumerator device_enumerator.cpp:230 New
> >> media device "intel-ipu6" created from /dev/media0
> >> [2:08:48.377733959] [26896] DEBUG DeviceEnumerator device_enumerator_udev.cpp:96
> >> Defer media device /dev/media0 due to 1 missing dependencies
> >> [2:08:48.377858051] [26896] DEBUG DeviceEnumerator
> >> device_enumerator_udev.cpp:322 All dependencies for media device /dev/media0
> >> found
> >> [2:08:48.377865948] [26896] DEBUG DeviceEnumerator device_enumerator.cpp:258
> >> Added device /dev/media0: intel-ipu6
> >> [2:08:48.378074893] [26896] DEBUG Camera camera_manager.cpp:140 Found registered
> >> pipeline handler 'ipu3'
> >> [2:08:48.378233208] [26896] DEBUG Camera camera_manager.cpp:140 Found registered
> >> pipeline handler 'simple'
> >> [2:08:48.378263573] [26896] DEBUG DeviceEnumerator device_enumerator.cpp:318
> >> Successful match for media device "intel-ipu6"
> >> [2:08:48.378311479] [26896] DEBUG SimplePipeline simple.cpp:1585 Sensor found
> >> for /dev/media0
> >> [2:08:48.378648447] [26896] DEBUG SimplePipeline simple.cpp:424 Found capture
> >> device Intel IPU6 ISYS Capture 0
> >> [2:08:48.378714621] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Exposure (0x00980911)
> >> [2:08:48.378808007] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Horizontal Flip (0x00980914)
> >> [2:08:48.378826380] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Vertical Flip (0x00980915)
> >> [2:08:48.378838332] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Camera Orientation (0x009a0922)
> >> [2:08:48.378871227] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Camera Sensor Rotation (0x009a0923)
> >> [2:08:48.378881213] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Vertical Blanking (0x009e0901)
> >> [2:08:48.378889198] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Horizontal Blanking (0x009e0902)
> >> [2:08:48.378898404] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Analogue Gain (0x009e0903)
> >> [2:08:48.378906624] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Link Frequency (0x009f0901)
> >> [2:08:48.378916258] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Pixel Rate (0x009f0902)
> >> [2:08:48.378924779] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Test Pattern (0x009f0903)
> >> [2:08:48.378936396] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Digital Gain (0x009f0905)
> >> [2:08:48.379155405] [26896] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036':
> >> Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for device
> >> [2:08:48.379170976] [26896]  WARN CameraSensor camera_sensor_legacy.cpp:401
> >> 'ov08x40 4-0036': The PixelArraySize property has been defaulted to 3856x2416
> >> [2:08:48.379177570] [26896] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036':
> >> Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for device
> >> [2:08:48.379183658] [26896]  WARN CameraSensor camera_sensor_legacy.cpp:412
> >> 'ov08x40 4-0036': The PixelArrayActiveAreas property has been defaulted to (0,
> >> 0)/3856x2416
> >> [2:08:48.379191552] [26896] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036':
> >> Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for device
> >> [2:08:48.379196709] [26896]  WARN CameraSensor camera_sensor_legacy.cpp:420
> >> 'ov08x40 4-0036': Failed to retrieve the sensor crop rectangle
> >> [2:08:48.379201526] [26896]  WARN CameraSensor camera_sensor_legacy.cpp:426
> >> 'ov08x40 4-0036': The sensor kernel driver needs to be fixed
> >> [2:08:48.379206284] [26896]  WARN CameraSensor camera_sensor_legacy.cpp:428
> >> 'ov08x40 4-0036': See Documentation/sensor_driver_requirements.rst in the
> >> libcamera sources for more information
> >> [2:08:48.379910066] [26896]  WARN CameraSensorProperties
> >> camera_sensor_properties.cpp:458 No static properties available for 'ov08x40'
> >> [2:08:48.379920385] [26896]  WARN CameraSensorProperties
> >> camera_sensor_properties.cpp:460 Please consider updating the camera sensor
> >> properties database
> >> [2:08:48.379968649] [26896] DEBUG CameraSensor camera_sensor.cpp:401 Entity
> >> 'ov08x40 4-0036' matched by CameraSensorLegacy
> >> [2:08:48.380012101] [26896] DEBUG SimplePipeline simple.cpp:491 Found pipeline:
> >> [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 ISYS Capture 0]
> >> [2:08:48.380147601] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Exposure (0x00980911)
> >> [2:08:48.380167842] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Horizontal Flip (0x00980914)
> >> [2:08:48.380178186] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Vertical Flip (0x00980915)
> >> [2:08:48.380187557] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Camera Orientation (0x009a0922)
> >> [2:08:48.380203877] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Camera Sensor Rotation (0x009a0923)
> >> [2:08:48.380216208] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Vertical Blanking (0x009e0901)
> >> [2:08:48.380226671] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Horizontal Blanking (0x009e0902)
> >> [2:08:48.380237572] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Analogue Gain (0x009e0903)
> >> [2:08:48.380248729] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Link Frequency (0x009f0901)
> >> [2:08:48.380261582] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Pixel Rate (0x009f0902)
> >> [2:08:48.380272330] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Test Pattern (0x009f0903)
> >> [2:08:48.380287929] [26896] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> Control: Digital Gain (0x009f0905)
> >> [2:08:48.380350326] [26896] DEBUG V4L2 v4l2_videodevice.cpp:631
> >> /dev/video0[28:cap]: Opened device : isys: ipu6
> >> [2:08:48.380489828] [26896] DEBUG DmaBufAllocator dma_buf_allocator.cpp:106
> >> Failed to open /dev/dma_heap/linux,cma: No such file or directory
> >> [2:08:48.380499245] [26896] DEBUG DmaBufAllocator dma_buf_allocator.cpp:106
> >> Failed to open /dev/dma_heap/reserved: No such file or directory
> >> [2:08:48.380506362] [26896] DEBUG DmaBufAllocator dma_buf_allocator.cpp:112
> >> Using /dev/dma_heap/system
> >> [2:08:48.382623926] [26896] DEBUG IPAManager ipa_manager.cpp:306 IPA module
> >> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signature is valid
> >> [2:08:48.382698965] [26896] DEBUG IPAProxy soft_ipa_proxy.cpp:45 initializing
> >> soft proxy: loading IPA from
> >> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
> >> [2:08:48.383200984] [26896]  WARN IPAProxy ipa_proxy.cpp:160 Configuration file
> >> 'ov08x40.yaml' not found for IPA module 'simple', falling back to
> >> 'uncalibrated.yaml'
> >> [2:08:48.383245998] [26896]  WARN IPASoft soft_simple.cpp:96 IPASoft: Failed to
> >> create camera sensor helper for ov08x40
> >> [2:08:48.383400849] [26896] DEBUG IPASoft soft_simple.cpp:117 IPASoft: Tuning
> >> file version 1
> >> [2:08:48.383470999] [26896] DEBUG IPAModuleAlgo module.h:91 IPASoft:
> >> Instantiated algorithm 'BlackLevel'
> >> [2:08:48.383519951] [26896] DEBUG IPAModuleAlgo module.h:91 IPASoft:
> >> Instantiated algorithm 'Awb'
> >> [2:08:48.383566360] [26896] DEBUG IPAModuleAlgo module.h:91 IPASoft:
> >> Instantiated algorithm 'Lut'
> >> [2:08:48.383593617] [26896] DEBUG IPAModuleAlgo module.h:91 IPASoft:
> >> Instantiated algorithm 'Agc'
> >> [2:08:48.383675638] [26896] DEBUG MediaDevice media_device.cpp:826
> >> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture
> >> 0'[0]: 0
> >> [2:08:48.383684688] [26896] DEBUG MediaDevice media_device.cpp:826
> >> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture
> >> 0'[0]: 1
> >> [2:08:48.383751789] [26896] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x40
> >> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
> >> 1928x1208-SGRBG10_1X10
> >> [2:08:48.383767562] [26896] DEBUG SimplePipeline simple.cpp:780 Link 'Intel IPU6
> >> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format
> >> 1928x1208-SGRBG10_1X10
> >> [2:08:48.383814165] [26896] DEBUG SimplePipeline simple.cpp:631 Adding
> >> configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
> >> [2:08:48.383903884] [26896] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x40
> >> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
> >> 3856x2416-SGRBG10_1X10
> >> [2:08:48.383911671] [26896] DEBUG SimplePipeline simple.cpp:780 Link 'Intel IPU6
> >> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format
> >> 3856x2416-SGRBG10_1X10
> >> [2:08:48.383922495] [26896] DEBUG SimplePipeline simple.cpp:631 Adding
> >> configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
> >> [2:08:48.384191137] [26896] DEBUG Camera camera_manager.cpp:161 Pipeline handler
> >> "simple" matched
> >> [2:08:48.384220609] [26896] DEBUG Camera camera_manager.cpp:140 Found registered
> >> pipeline handler 'uvcvideo'
> >> [2:08:48.416374408] [26884] DEBUG SimplePipeline simple.cpp:1017 Largest stream
> >> size is 3848x2416
> >> [2:08:48.416415430] [26884] DEBUG SimplePipeline simple.cpp:1069 Picked
> >> 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x2416
> >> [2:08:48.416475078] [26884] DEBUG Camera camera.cpp:1137 streams configuration:
> >> (0) 3848x2416-ABGR8888
> >> [2:08:48.416517469] [26884] DEBUG SimplePipeline simple.cpp:1017 Largest stream
> >> size is 1928x1208
> >> [2:08:48.416523658] [26884] DEBUG SimplePipeline simple.cpp:1069 Picked
> >> 1928x1208-SGRBG10_1X10 -> 1928x1208-SGRBG10 for max stream size 1928x1208
> >> [2:08:48.416534256] [26884] DEBUG SimplePipeline simple.cpp:1118 Adjusting size
> >> from 1928x1208 to 1924x1208
> >> Stream configuration adjusted to  1924x1208-ABGR8888
> >> [2:08:48.416569398] [26884] DEBUG SimplePipeline simple.cpp:1017 Largest stream
> >> size is 1924x1208
> >> [2:08:48.416574746] [26884] DEBUG SimplePipeline simple.cpp:1069 Picked
> >> 1928x1208-SGRBG10_1X10 -> 1928x1208-SGRBG10 for max stream size 1924x1208
> >> [2:08:48.416582058] [26884]  INFO Camera camera.cpp:1202 configuring streams:
> >> (0) 1924x1208-ABGR8888
> >> [2:08:48.416663364] [26896] DEBUG MediaDevice media_device.cpp:826
> >> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture
> >> 0'[0]: 0
> >> [2:08:48.416700163] [26896] DEBUG MediaDevice media_device.cpp:826
> >> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture
> >> 0'[0]: 1
> >> [2:08:48.416821955] [26896] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x40
> >> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
> >> 1928x1208-SGRBG10_1X10
> >> [2:08:48.416832271] [26896] DEBUG SimplePipeline simple.cpp:780 Link 'Intel IPU6
> >> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format
> >> 1928x1208-SGRBG10_1X10
> >> [2:08:48.416891523] [26896]  WARN CameraSensor camera_sensor_legacy.cpp:501
> >> 'ov08x40 4-0036': No sensor delays found in static properties. Assuming
> >> unverified defaults.
> >> [2:08:48.416984811] [26896] DEBUG DelayedControls delayed_controls.cpp:99 Set a
> >> delay of 2 and priority write flag 0 for Exposure
> >> [2:08:48.417002236] [26896] DEBUG DelayedControls delayed_controls.cpp:99 Set a
> >> delay of 1 and priority write flag 0 for Analogue Gain
> >> [2:08:48.417169477] [26896]  INFO IPASoft soft_simple.cpp:251 IPASoft: Exposure
> >> 4-4442, gain 0-1984 (1)
> >> Zero-copy enabled
> >> [2:08:48.418429333] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer is
> >> contiguous
> >> [2:08:48.419291593] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer is
> >> contiguous
> >> [2:08:48.420117071] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer is
> >> contiguous
> >> [2:08:48.420926235] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer is
> >> contiguous
> >> [2:08:48.422633774] [26884] DEBUG Request request.cpp:369 Created request -
> >> cookie: 0
> >> [2:08:48.422717126] [26884] DEBUG Request request.cpp:369 Created request -
> >> cookie: 0
> >> [2:08:48.422726468] [26884] DEBUG Request request.cpp:369 Created request -
> >> cookie: 0
> >> [2:08:48.422733979] [26884] DEBUG Request request.cpp:369 Created request -
> >> cookie: 0
> >> [2:08:48.422746484] [26884] DEBUG Camera camera.cpp:1360 Starting capture
> >> [2:08:48.425078945] [26896] DEBUG V4L2 v4l2_videodevice.cpp:1311
> >> /dev/video0[28:cap]: 3 buffers requested.
> >> [2:08:48.425113504] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer is
> >> contiguous
> >> [2:08:48.425127393] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer is
> >> contiguous
> >> [2:08:48.425135907] [26896] DEBUG Buffer framebuffer.cpp:351 Buffer is
> >> contiguous
> >> [2:08:48.425417390] [26896] DEBUG V4L2 v4l2_videodevice.cpp:1750
> >> /dev/video0[28:cap]: Queueing buffer 0
> >> [2:08:48.550791060] [26896] DEBUG V4L2 v4l2_videodevice.cpp:1750
> >> /dev/video0[28:cap]: Queueing buffer 1
> >> [2:08:48.551301528] [26896] DEBUG V4L2 v4l2_videodevice.cpp:1750
> >> /dev/video0[28:cap]: Queueing buffer 2
> >> [2:09:34.537747960] [26884] DEBUG Camera camera.cpp:1404 Stopping capture
> >> [2:09:38.601196687] [26896] DEBUG Request request.cpp:129 Request(0:C:0/1:0)
> >> [2:09:38.601418601] [26896] DEBUG Request request.cpp:129 Request(1:C:0/1:0)
> >> [2:09:38.601442872] [26896] DEBUG Request request.cpp:129 Request(2:C:0/1:0)
> >> [2:09:38.601507834] [26896] DEBUG V4L2 v4l2_videodevice.cpp:1596
> >> /dev/video0[28:cap]: Releasing buffers
> >> [2:09:38.603272250] [26896] DEBUG V4L2 v4l2_videodevice.cpp:1311
> >> /dev/video0[28:cap]: 0 buffers requested.
> >> [2:09:38.603346754] [26896] DEBUG Request request.cpp:129 Request(3:X:0/1:0)
> >>
> >>
> >> Sincerely,
> >> Duane
> >>
> >> ----- On Dec 18, 2024, at 9:37 AM, Jacopo Mondi jacopo.mondi@ideasonboard.com
> >> wrote:
> >>
> >> > Hi Duane
> >> >  if you refer to...
> >> >
> >> > On Wed, Dec 18, 2024 at 09:03:31AM -0500, duanek@chorus.net wrote:
> >> >> Dear All,
> >> >>
> >> >> I thought I would update the situation as it stands with kernel 6.12.5, and
> >> >> latest version of libcamera, I am still failing to retrieve the sensor crop
> >> >> rectangle:
> >> >>
> >> >> duane@DuanesSpectre16:~/cameratest$ LIBCAMERA_LOG_LEVELS=0 cam --list
> >> >> [1:39:08.877408033] [24095] DEBUG IPAModule ipa_module.cpp:333 ipa_ipu3.so: IPA
> >> >> module /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is signed
> >> >> [1:39:08.877493605] [24095] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA
> >> >> module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
> >> >> [1:39:08.877574277] [24095] DEBUG IPAModule ipa_module.cpp:333
> >> >> ipa_soft_simple.so: IPA module
> >> >> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is signed
> >> >> [1:39:08.877590565] [24095] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA
> >> >> module '/usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so'
> >> >> [1:39:08.877634522] [24095]  INFO Camera camera_manager.cpp:327 libcamera
> >> >> v0.3.2+240-936a099e
> >> >> [1:39:08.877842699] [24098] DEBUG Camera camera_manager.cpp:73 Starting camera
> >> >> manager
> >> >> [1:39:08.884214258] [24098] DEBUG DeviceEnumerator device_enumerator.cpp:230 New
> >> >> media device "intel-ipu6" created from /dev/media0
> >> >> [1:39:08.885400683] [24098] DEBUG DeviceEnumerator device_enumerator_udev.cpp:96
> >> >> Defer media device /dev/media0 due to 1 missing dependencies
> >> >> [1:39:08.885500639] [24098] DEBUG DeviceEnumerator
> >> >> device_enumerator_udev.cpp:322 All dependencies for media device /dev/media0
> >> >> found
> >> >> [1:39:08.885507438] [24098] DEBUG DeviceEnumerator device_enumerator.cpp:258
> >> >> Added device /dev/media0: intel-ipu6
> >> >> [1:39:08.885678288] [24098] DEBUG Camera camera_manager.cpp:140 Found registered
> >> >> pipeline handler 'ipu3'
> >> >> [1:39:08.885794024] [24098] DEBUG Camera camera_manager.cpp:140 Found registered
> >> >> pipeline handler 'simple'
> >> >> [1:39:08.885815555] [24098] DEBUG DeviceEnumerator device_enumerator.cpp:318
> >> >> Successful match for media device "intel-ipu6"
> >> >> [1:39:08.885851217] [24098] DEBUG SimplePipeline simple.cpp:1585 Sensor found
> >> >> for /dev/media0
> >> >> [1:39:08.886089353] [24098] DEBUG SimplePipeline simple.cpp:424 Found capture
> >> >> device Intel IPU6 ISYS Capture 0
> >> >> [1:39:08.886141057] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Exposure (0x00980911)
> >> >> [1:39:08.886206532] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Horizontal Flip (0x00980914)
> >> >> [1:39:08.886223871] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Vertical Flip (0x00980915)
> >> >> [1:39:08.886234673] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Camera Orientation (0x009a0922)
> >> >> [1:39:08.886260625] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Camera Sensor Rotation (0x009a0923)
> >> >> [1:39:08.886270047] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Vertical Blanking (0x009e0901)
> >> >> [1:39:08.886277150] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Horizontal Blanking (0x009e0902)
> >> >> [1:39:08.886284629] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Analogue Gain (0x009e0903)
> >> >> [1:39:08.886292042] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Link Frequency (0x009f0901)
> >> >> [1:39:08.886300670] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Pixel Rate (0x009f0902)
> >> >> [1:39:08.886309739] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Test Pattern (0x009f0903)
> >> >> [1:39:08.886320963] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Digital Gain (0x009f0905)
> >> >> [1:39:08.886490155] [24098] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036':
> >> >> Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for device
> >> >> [1:39:08.886503025] [24098]  WARN CameraSensor camera_sensor_legacy.cpp:401
> >> >> 'ov08x40 4-0036': The PixelArraySize property has been defaulted to 3856x2416
> >> >> [1:39:08.886508510] [24098] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036':
> >> >> Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for device
> >> >> [1:39:08.886517928] [24098]  WARN CameraSensor camera_sensor_legacy.cpp:412
> >> >> 'ov08x40 4-0036': The PixelArrayActiveAreas property has been defaulted to (0,
> >> >> 0)/3856x2416
> >> >> [1:39:08.886524514] [24098] ERROR V4L2 v4l2_subdevice.cpp:1127 'ov08x40 4-0036':
> >> >> Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for device
> >> >
> >> > ... this error
> >> >
> >> > it shouldn't be fatal and you should be able to get frames anyhow
> >> >
> >> >> [1:39:08.886528470] [24098]  WARN CameraSensor camera_sensor_legacy.cpp:420
> >> >> 'ov08x40 4-0036': Failed to retrieve the sensor crop rectangle
> >> >> [1:39:08.886532315] [24098]  WARN CameraSensor camera_sensor_legacy.cpp:426
> >> >> 'ov08x40 4-0036': The sensor kernel driver needs to be fixed
> >> >
> >> > However, as the error message reports "The sensor kernel driver needs
> >> > to be fixed" as it doesn't support the minium required feature set to
> >> > be fully compliant with libcamera.
> >> >
> >> > However, as said, you should be able to get frames out
> >> >
> >> >
> >> >> [1:39:08.886536250] [24098]  WARN CameraSensor camera_sensor_legacy.cpp:428
> >> >> 'ov08x40 4-0036': See Documentation/sensor_driver_requirements.rst in the
> >> >> libcamera sources for more information
> >> >> [1:39:08.887129354] [24098]  WARN CameraSensorProperties
> >> >> camera_sensor_properties.cpp:458 No static properties available for 'ov08x40'
> >> >> [1:39:08.887138313] [24098]  WARN CameraSensorProperties
> >> >> camera_sensor_properties.cpp:460 Please consider updating the camera sensor
> >> >> properties database
> >> >> [1:39:08.887172183] [24098] DEBUG CameraSensor camera_sensor.cpp:401 Entity
> >> >> 'ov08x40 4-0036' matched by CameraSensorLegacy
> >> >> [1:39:08.887197696] [24098] DEBUG SimplePipeline simple.cpp:491 Found pipeline:
> >> >> [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 ISYS Capture 0]
> >> >> [1:39:08.887296099] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Exposure (0x00980911)
> >> >> [1:39:08.887314603] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Horizontal Flip (0x00980914)
> >> >> [1:39:08.887324889] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Vertical Flip (0x00980915)
> >> >> [1:39:08.887334206] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Camera Orientation (0x009a0922)
> >> >> [1:39:08.887347541] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Camera Sensor Rotation (0x009a0923)
> >> >> [1:39:08.887355861] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Vertical Blanking (0x009e0901)
> >> >> [1:39:08.887362771] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Horizontal Blanking (0x009e0902)
> >> >> [1:39:08.887369888] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Analogue Gain (0x009e0903)
> >> >> [1:39:08.887377420] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Link Frequency (0x009f0901)
> >> >> [1:39:08.887386386] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Pixel Rate (0x009f0902)
> >> >> [1:39:08.887394363] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Test Pattern (0x009f0903)
> >> >> [1:39:08.887405686] [24098] DEBUG V4L2 v4l2_device.cpp:699 'ov08x40 4-0036':
> >> >> Control: Digital Gain (0x009f0905)
> >> >> [1:39:08.887447262] [24098] DEBUG V4L2 v4l2_videodevice.cpp:631
> >> >> /dev/video0[16:cap]: Opened device : isys: ipu6
> >> >> [1:39:08.887546046] [24098] DEBUG DmaBufAllocator dma_buf_allocator.cpp:106
> >> >> Failed to open /dev/dma_heap/linux,cma: No such file or directory
> >> >> [1:39:08.887554189] [24098] DEBUG DmaBufAllocator dma_buf_allocator.cpp:106
> >> >> Failed to open /dev/dma_heap/reserved: No such file or directory
> >> >> [1:39:08.887560100] [24098] DEBUG DmaBufAllocator dma_buf_allocator.cpp:112
> >> >> Using /dev/dma_heap/system
> >> >> [1:39:08.889570199] [24098] DEBUG IPAManager ipa_manager.cpp:306 IPA module
> >> >> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signature is valid
> >> >> [1:39:08.889667041] [24098] DEBUG IPAProxy soft_ipa_proxy.cpp:45 initializing
> >> >> soft proxy: loading IPA from
> >> >> /usr/local/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
> >> >> [1:39:08.890244616] [24098]  WARN IPAProxy ipa_proxy.cpp:160 Configuration file
> >> >> 'ov08x40.yaml' not found for IPA module 'simple', falling back to
> >> >> 'uncalibrated.yaml'
> >> >> [1:39:08.890291460] [24098]  WARN IPASoft soft_simple.cpp:96 IPASoft: Failed to
> >> >> create camera sensor helper for ov08x40
> >> >> [1:39:08.890420321] [24098] DEBUG IPASoft soft_simple.cpp:117 IPASoft: Tuning
> >> >> file version 1
> >> >> [1:39:08.890493102] [24098] DEBUG IPAModuleAlgo module.h:91 IPASoft:
> >> >> Instantiated algorithm 'BlackLevel'
> >> >> [1:39:08.890548389] [24098] DEBUG IPAModuleAlgo module.h:91 IPASoft:
> >> >> Instantiated algorithm 'Awb'
> >> >> [1:39:08.890592459] [24098] DEBUG IPAModuleAlgo module.h:91 IPASoft:
> >> >> Instantiated algorithm 'Lut'
> >> >> [1:39:08.890619578] [24098] DEBUG IPAModuleAlgo module.h:91 IPASoft:
> >> >> Instantiated algorithm 'Agc'
> >> >> [1:39:08.890700245] [24098] DEBUG MediaDevice media_device.cpp:826
> >> >> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture
> >> >> 0'[0]: 0
> >> >> [1:39:08.890708008] [24098] DEBUG MediaDevice media_device.cpp:826
> >> >> /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture
> >> >> 0'[0]: 1
> >> >> [1:39:08.890768179] [24098] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x40
> >> >> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
> >> >> 1928x1208-SGRBG10_1X10
> >> >> [1:39:08.890781364] [24098] DEBUG SimplePipeline simple.cpp:780 Link 'Intel IPU6
> >> >> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format
> >> >> 1928x1208-SGRBG10_1X10
> >> >> [1:39:08.890818896] [24098] DEBUG SimplePipeline simple.cpp:631 Adding
> >> >> configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
> >> >> [1:39:08.890890653] [24098] DEBUG SimplePipeline simple.cpp:780 Link 'ov08x40
> >> >> 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
> >> >> 3856x2416-SGRBG10_1X10
> >> >> [1:39:08.890897783] [24098] DEBUG SimplePipeline simple.cpp:780 Link 'Intel IPU6
> >> >> CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format
> >> >> 3856x2416-SGRBG10_1X10
> >> >> [1:39:08.890908208] [24098] DEBUG SimplePipeline simple.cpp:631 Adding
> >> >> configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
> >> >> [1:39:08.891057954] [24098] DEBUG Camera camera_manager.cpp:161 Pipeline handler
> >> >> "simple" matched
> >> >> [1:39:08.891076593] [24098] DEBUG Camera camera_manager.cpp:140 Found registered
> >> >> pipeline handler 'uvcvideo'
> >> >> Available cameras:
> >> >> 1: Internal front camera (\_SB_.PC00.LNK0)
> >> >>
> >> >> Please let me know of any other testing I can do!
> >> >>
> >> >> Sincerely,
> >> >> Duane
> >> >>
> >> >>
> >> >> ----- On Oct 14, 2024, at 2:54 PM, duanek duanek@chorus.net wrote:
> >> >>
> >> >> > Dear All,
> >> >> > I would like to get the camera in my HP Spectre 16" laptop working under linux.
> >> >> > I have reported this to the libcamera group, and they suggested posting here:
> >> >> > https://bugs.libcamera.org/show_bug.cgi?id=237
> >> >> >
> >> >> > I have compiled a custom kernel with the kernel module for what I _think_ is my
> >> >> > camera, and it is detected on boot:
> >> >> >
> >> >> > sudo dmesg |grep intel-ipu6
> >> >> > [   10.453585] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
> >> >> > [   10.453786] intel-ipu6 0000:00:05.0: IPU6 in secure mode touch 0x80000000
> >> >> > mask 0x0
> >> >> > [   10.468306] intel-ipu6 0000:00:05.0: FW version: 20230925
> >> >> > [   10.471209] intel-ipu6 0000:00:05.0: Found supported sensor OVTI08F4:00
> >> >> > [   10.471268] intel-ipu6 0000:00:05.0: Connected 1 cameras
> >> >> > [   10.475739] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
> >> >> > [   10.515753] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
> >> >> > [   10.563160] intel-ipu6 0000:00:05.0: CSE authenticate_run done
> >> >> > [   10.563175] intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware version 6
> >> >> >
> >> >> > I have also configured dmabuf for permissions.
> >> >> > I have downloaded libcamera, configured and built.
> >> >> >
> >> >> > When I run: LIBCAMERA_LOG_LEVELS=0 cam --list
> >> >> > [0:09:56.854835470] [6213] DEBUG IPAModule ipa_module.cpp:333 ipa_ipu3.so: IPA
> >> >> > module /usr/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is signed
> >> >> > [0:09:56.854875988] [6213] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA
> >> >> > module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
> >> >> > [0:09:56.854894355] [6213] DEBUG IPAModule ipa_module.cpp:333
> >> >> > ipa_soft_simple.so: IPA module
> >> >> > /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is signed
> >> >> > [0:09:56.854901746] [6213] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA
> >> >> > module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so'
> >> >> > [0:09:56.854913026] [6213] DEBUG IPAModule ipa_module.cpp:333 ipa_vimc.so: IPA
> >> >> > module /usr/lib/x86_64-linux-gnu/libcamera/ipa_vimc.so is signed
> >> >> > [0:09:56.854917620] [6213] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA
> >> >> > module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_vimc.so'
> >> >> > [0:09:56.854926011] [6213] ERROR IPAModule ipa_module.cpp:171 Symbol
> >> >> > ipaModuleInfo not found
> >> >> > [0:09:56.854929187] [6213] ERROR IPAModule ipa_module.cpp:291 v4l2-compat.so:
> >> >> > IPA module has no valid info
> >> >> > [0:09:56.854935275] [6213]  INFO Camera camera_manager.cpp:325 libcamera v0.3.2
> >> >> > [0:09:56.855123127] [6216] DEBUG Camera camera_manager.cpp:73 Starting camera
> >> >> > manager
> >> >> > [0:09:56.861202179] [6216] DEBUG DeviceEnumerator device_enumerator.cpp:230 New
> >> >> > media device "intel-ipu6" created from /dev/media0
> >> >> > [0:09:56.862429442] [6216] DEBUG DeviceEnumerator device_enumerator_udev.cpp:96
> >> >> > Defer media device /dev/media0 due to 1 missing dependencies
> >> >> > [0:09:56.862492043] [6216] DEBUG DeviceEnumerator device_enumerator_udev.cpp:322
> >> >> > All dependencies for media device /dev/media0 found
> >> >> > [0:09:56.862494433] [6216] DEBUG DeviceEnumerator device_enumerator.cpp:258
> >> >> > Added device /dev/media0: intel-ipu6
> >> >> > [0:09:56.862629885] [6216] DEBUG Camera camera_manager.cpp:138 Found registered
> >> >> > pipeline handler 'ipu3'
> >> >> > [0:09:56.862637387] [6216] DEBUG Camera camera_manager.cpp:138 Found registered
> >> >> > pipeline handler 'simple'
> >> >> > [0:09:56.862640029] [6216] DEBUG DeviceEnumerator device_enumerator.cpp:318
> >> >> > Successful match for media device "intel-ipu6"
> >> >> > [0:09:56.862645091] [6216] DEBUG SimplePipeline simple.cpp:1552 Sensor found for
> >> >> > /dev/media0
> >> >> > [0:09:56.862665124] [6216] DEBUG SimplePipeline simple.cpp:416 Found capture
> >> >> > device Intel IPU6 ISYS Capture 0
> >> >> > [0:09:56.862673488] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Exposure (0x00980911)
> >> >> > [0:09:56.862681127] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Horizontal Flip (0x00980914)
> >> >> > [0:09:56.862683897] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Vertical Flip (0x00980915)
> >> >> > [0:09:56.862686983] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Camera Orientation (0x009a0922)
> >> >> > [0:09:56.862692069] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Camera Sensor Rotation (0x009a0923)
> >> >> > [0:09:56.862695160] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Vertical Blanking (0x009e0901)
> >> >> > [0:09:56.862697275] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Horizontal Blanking (0x009e0902)
> >> >> > [0:09:56.862699995] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Analogue Gain (0x009e0903)
> >> >> > [0:09:56.862702951] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Link Frequency (0x009f0901)
> >> >> > [0:09:56.862705721] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Pixel Rate (0x009f0902)
> >> >> > [0:09:56.862708614] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Test Pattern (0x009f0903)
> >> >> > [0:09:56.862712618] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Digital Gain (0x009f0905)
> >> >> > [0:09:56.862725913] [6216] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov08x40 4-0036':
> >> >> > Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for device
> >> >> > [0:09:56.862731090] [6216]  WARN CameraSensor camera_sensor.cpp:304 'ov08x40
> >> >> > 4-0036': The PixelArraySize property has been defaulted to 3856x2416
> >> >> > [0:09:56.862734575] [6216] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov08x40 4-0036':
> >> >> > Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for device
> >> >> > [0:09:56.862737003] [6216]  WARN CameraSensor camera_sensor.cpp:315 'ov08x40
> >> >> > 4-0036': The PixelArrayActiveAreas property has been defaulted to (0,
> >> >> > 0)/3856x2416
> >> >> > [0:09:56.862741568] [6216] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov08x40 4-0036':
> >> >> > Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for device
> >> >> > [0:09:56.862743916] [6216]  WARN CameraSensor camera_sensor.cpp:323 'ov08x40
> >> >> > 4-0036': Failed to retrieve the sensor crop rectangle
> >> >> > [0:09:56.862746073] [6216]  WARN CameraSensor camera_sensor.cpp:329 'ov08x40
> >> >> > 4-0036': The sensor kernel driver needs to be fixed
> >> >> > [0:09:56.862748203] [6216]  WARN CameraSensor camera_sensor.cpp:331 'ov08x40
> >> >> > 4-0036': See Documentation/sensor_driver_requirements.rst in the libcamera
> >> >> > sources for more information
> >> >> > [0:09:56.862886481] [6216]  WARN CameraSensorProperties
> >> >> > camera_sensor_properties.cpp:293 No static properties available for 'ov08x40'
> >> >> > [0:09:56.862891448] [6216]  WARN CameraSensorProperties
> >> >> > camera_sensor_properties.cpp:295 Please consider updating the camera sensor
> >> >> > properties database
> >> >> > [0:09:56.862894364] [6216] DEBUG SimplePipeline simple.cpp:486 Found pipeline:
> >> >> > [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 ISYS Capture 0]
> >> >> > [0:09:56.862903916] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Exposure (0x00980911)
> >> >> > [0:09:56.862906875] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Horizontal Flip (0x00980914)
> >> >> > [0:09:56.862909364] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Vertical Flip (0x00980915)
> >> >> > [0:09:56.862911941] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Camera Orientation (0x009a0922)
> >> >> > [0:09:56.862915743] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Camera Sensor Rotation (0x009a0923)
> >> >> > [0:09:56.862918412] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Vertical Blanking (0x009e0901)
> >> >> > [0:09:56.862920592] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Horizontal Blanking (0x009e0902)
> >> >> > [0:09:56.862922756] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Analogue Gain (0x009e0903)
> >> >> > [0:09:56.862925354] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Link Frequency (0x009f0901)
> >> >> > [0:09:56.862928023] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Pixel Rate (0x009f0902)
> >> >> > [0:09:56.862930347] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Test Pattern (0x009f0903)
> >> >> > [0:09:56.862934434] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Digital Gain (0x009f0905)
> >> >> > [0:09:56.862943516] [6216] DEBUG V4L2 v4l2_videodevice.cpp:631
> >> >> > /dev/video0[16:cap]: Opened device : isys: ipu6
> >> >> > [0:09:56.862961969] [6216] DEBUG DmaBufAllocator dma_buf_allocator.cpp:103
> >> >> > Failed to open /dev/dma_heap/linux,cma: No such file or directory
> >> >> > [0:09:56.862966349] [6216] DEBUG DmaBufAllocator dma_buf_allocator.cpp:103
> >> >> > Failed to open /dev/dma_heap/reserved: No such file or directory
> >> >> > [0:09:56.862971624] [6216] DEBUG DmaBufAllocator dma_buf_allocator.cpp:109 Using
> >> >> > /dev/dma_heap/system
> >> >> > [0:09:56.863135787] [6216] DEBUG IPAManager ipa_manager.cpp:306 IPA module
> >> >> > /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signature is valid
> >> >> > [0:09:56.863149345] [6216] DEBUG IPAProxy soft_ipa_proxy.cpp:45 initializing
> >> >> > soft proxy: loading IPA from
> >> >> > /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
> >> >> > [0:09:56.873712857] [6216]  WARN IPAProxy ipa_proxy.cpp:160 Configuration file
> >> >> > 'ov08x40.yaml' not found for IPA module 'simple', falling back to
> >> >> > 'uncalibrated.yaml'
> >> >> > [0:09:56.873732979] [6216]  WARN IPASoft soft_simple.cpp:114 Failed to create
> >> >> > camera sensor helper for ov08x40
> >> >> > [0:09:56.873831783] [6216] DEBUG IPASoft soft_simple.cpp:135 Tuning file version
> >> >> > 1
> >> >> > [0:09:56.873849138] [6216] DEBUG MediaDevice media_device.cpp:826
> >> >> > /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture
> >> >> > 0'[0]: 1
> >> >> > [0:09:56.873874763] [6216] DEBUG SimplePipeline simple.cpp:775 Link 'ov08x40
> >> >> > 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
> >> >> > 1928x1208-SGRBG10_1X10
> >> >> > [0:09:56.873878920] [6216] DEBUG SimplePipeline simple.cpp:775 Link 'Intel IPU6
> >> >> > CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format
> >> >> > 1928x1208-SGRBG10_1X10
> >> >> > [0:09:56.873885965] [6216] DEBUG SimplePipeline simple.cpp:626 Adding
> >> >> > configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
> >> >> > [0:09:56.873901964] [6216] DEBUG SimplePipeline simple.cpp:775 Link 'ov08x40
> >> >> > 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
> >> >> > 3856x2416-SGRBG10_1X10
> >> >> > [0:09:56.873904715] [6216] DEBUG SimplePipeline simple.cpp:775 Link 'Intel IPU6
> >> >> > CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format
> >> >> > 3856x2416-SGRBG10_1X10
> >> >> > [0:09:56.873908986] [6216] DEBUG SimplePipeline simple.cpp:626 Adding
> >> >> > configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
> >> >> > [0:09:56.873918943] [6216] DEBUG Camera camera_manager.cpp:159 Pipeline handler
> >> >> > "simple" matched
> >> >> > [0:09:56.873923366] [6216] DEBUG Camera camera_manager.cpp:138 Found registered
> >> >> > pipeline handler 'uvcvideo'
> >> >> > [0:09:56.873926699] [6216] DEBUG Camera camera_manager.cpp:138 Found registered
> >> >> > pipeline handler 'vimc'
> >> >> > Available cameras:
> >> >> > 1: Internal front camera (\_SB_.PC00.LNK0)
> >> >> >
> >> >> > which seems to indicate a camera found.
> >> >> >
> >> >> > This laptop has an electronic shutter, activated by a Function key, and under
> >> >> > linux (Debian Sid/Trixie), I can toggle the shutter.
> >> >> >
> >> >> > If I try: LIBCAMERA_LOG_LEVELS=0 qcam -s "width=1928,height=1208"  I get:
> >> >> >
> >> >> > [0:31:56.248638615] [8105] DEBUG IPAModule ipa_module.cpp:333 ipa_ipu3.so: IPA
> >> >> > module /usr/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is signed
> >> >> > [0:31:56.248713977] [8105] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA
> >> >> > module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
> >> >> > [0:31:56.248745147] [8105] DEBUG IPAModule ipa_module.cpp:333
> >> >> > ipa_soft_simple.so: IPA module
> >> >> > /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is signed
> >> >> > [0:31:56.248762096] [8105] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA
> >> >> > module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so'
> >> >> > [0:31:56.248783890] [8105] DEBUG IPAModule ipa_module.cpp:333 ipa_vimc.so: IPA
> >> >> > module /usr/lib/x86_64-linux-gnu/libcamera/ipa_vimc.so is signed
> >> >> > [0:31:56.248797242] [8105] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA
> >> >> > module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_vimc.so'
> >> >> > [0:31:56.248815534] [8105] ERROR IPAModule ipa_module.cpp:171 Symbol
> >> >> > ipaModuleInfo not found
> >> >> > [0:31:56.248823967] [8105] ERROR IPAModule ipa_module.cpp:291 v4l2-compat.so:
> >> >> > IPA module has no valid info
> >> >> > [0:31:56.248839450] [8105]  INFO Camera camera_manager.cpp:325 libcamera v0.3.2
> >> >> > [0:31:56.249067816] [8111] DEBUG Camera camera_manager.cpp:73 Starting camera
> >> >> > manager
> >> >> > [0:31:56.257921853] [8111] DEBUG DeviceEnumerator device_enumerator.cpp:230 New
> >> >> > media device "intel-ipu6" created from /dev/media0
> >> >> > [0:31:56.259095802] [8111] DEBUG DeviceEnumerator device_enumerator_udev.cpp:96
> >> >> > Defer media device /dev/media0 due to 1 missing dependencies
> >> >> > [0:31:56.259146226] [8111] DEBUG DeviceEnumerator device_enumerator_udev.cpp:322
> >> >> > All dependencies for media device /dev/media0 found
> >> >> > [0:31:56.259148998] [8111] DEBUG DeviceEnumerator device_enumerator.cpp:258
> >> >> > Added device /dev/media0: intel-ipu6
> >> >> > [0:31:56.259365000] [8111] DEBUG Camera camera_manager.cpp:138 Found registered
> >> >> > pipeline handler 'ipu3'
> >> >> > [0:31:56.259376054] [8111] DEBUG Camera camera_manager.cpp:138 Found registered
> >> >> > pipeline handler 'simple'
> >> >> > [0:31:56.259379285] [8111] DEBUG DeviceEnumerator device_enumerator.cpp:318
> >> >> > Successful match for media device "intel-ipu6"
> >> >> > [0:31:56.259384622] [8111] DEBUG SimplePipeline simple.cpp:1552 Sensor found for
> >> >> > /dev/media0
> >> >> > [0:31:56.259405468] [8111] DEBUG SimplePipeline simple.cpp:416 Found capture
> >> >> > device Intel IPU6 ISYS Capture 0
> >> >> > [0:31:56.259417404] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Exposure (0x00980911)
> >> >> > [0:31:56.259427279] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Horizontal Flip (0x00980914)
> >> >> > [0:31:56.259430625] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Vertical Flip (0x00980915)
> >> >> > [0:31:56.259434102] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Camera Orientation (0x009a0922)
> >> >> > [0:31:56.259439748] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Camera Sensor Rotation (0x009a0923)
> >> >> > [0:31:56.259444731] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Vertical Blanking (0x009e0901)
> >> >> > [0:31:56.259448236] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Horizontal Blanking (0x009e0902)
> >> >> > [0:31:56.259451979] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Analogue Gain (0x009e0903)
> >> >> > [0:31:56.259455940] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Link Frequency (0x009f0901)
> >> >> > [0:31:56.259459811] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Pixel Rate (0x009f0902)
> >> >> > [0:31:56.259463116] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Test Pattern (0x009f0903)
> >> >> > [0:31:56.259468191] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Digital Gain (0x009f0905)
> >> >> > [0:31:56.259482422] [8111] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov08x40 4-0036':
> >> >> > Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for device
> >> >> > [0:31:56.259488780] [8111]  WARN CameraSensor camera_sensor.cpp:304 'ov08x40
> >> >> > 4-0036': The PixelArraySize property has been defaulted to 3856x2416
> >> >> > [0:31:56.259492249] [8111] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov08x40 4-0036':
> >> >> > Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for device
> >> >> > [0:31:56.259495284] [8111]  WARN CameraSensor camera_sensor.cpp:315 'ov08x40
> >> >> > 4-0036': The PixelArrayActiveAreas property has been defaulted to (0,
> >> >> > 0)/3856x2416
> >> >> > [0:31:56.259499843] [8111] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov08x40 4-0036':
> >> >> > Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for device
> >> >> > [0:31:56.259502689] [8111]  WARN CameraSensor camera_sensor.cpp:323 'ov08x40
> >> >> > 4-0036': Failed to retrieve the sensor crop rectangle
> >> >> > [0:31:56.259505241] [8111]  WARN CameraSensor camera_sensor.cpp:329 'ov08x40
> >> >> > 4-0036': The sensor kernel driver needs to be fixed
> >> >> > [0:31:56.259507759] [8111]  WARN CameraSensor camera_sensor.cpp:331 'ov08x40
> >> >> > 4-0036': See Documentation/sensor_driver_requirements.rst in the libcamera
> >> >> > sources for more information
> >> >> > [0:31:56.259634530] [8111]  WARN CameraSensorProperties
> >> >> > camera_sensor_properties.cpp:293 No static properties available for 'ov08x40'
> >> >> > [0:31:56.259638620] [8111]  WARN CameraSensorProperties
> >> >> > camera_sensor_properties.cpp:295 Please consider updating the camera sensor
> >> >> > properties database
> >> >> > [0:31:56.259642356] [8111] DEBUG SimplePipeline simple.cpp:486 Found pipeline:
> >> >> > [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 ISYS Capture 0]
> >> >> > [0:31:56.259653932] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Exposure (0x00980911)
> >> >> > [0:31:56.259658031] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Horizontal Flip (0x00980914)
> >> >> > [0:31:56.259661609] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Vertical Flip (0x00980915)
> >> >> > [0:31:56.259665266] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Camera Orientation (0x009a0922)
> >> >> > [0:31:56.259669824] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Camera Sensor Rotation (0x009a0923)
> >> >> > [0:31:56.259673455] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Vertical Blanking (0x009e0901)
> >> >> > [0:31:56.259676909] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Horizontal Blanking (0x009e0902)
> >> >> > [0:31:56.259680356] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Analogue Gain (0x009e0903)
> >> >> > [0:31:56.259684182] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Link Frequency (0x009f0901)
> >> >> > [0:31:56.259687910] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Pixel Rate (0x009f0902)
> >> >> > [0:31:56.259691225] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Test Pattern (0x009f0903)
> >> >> > [0:31:56.259696017] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036':
> >> >> > Control: Digital Gain (0x009f0905)
> >> >> > [0:31:56.259706326] [8111] DEBUG V4L2 v4l2_videodevice.cpp:631
> >> >> > /dev/video0[224:cap]: Opened device : isys: ipu6
> >> >> > [0:31:56.259727296] [8111] DEBUG DmaBufAllocator dma_buf_allocator.cpp:103
> >> >> > Failed to open /dev/dma_heap/linux,cma: No such file or directory
> >> >> > [0:31:56.259731671] [8111] DEBUG DmaBufAllocator dma_buf_allocator.cpp:103
> >> >> > Failed to open /dev/dma_heap/reserved: No such file or directory
> >> >> > [0:31:56.259736325] [8111] DEBUG DmaBufAllocator dma_buf_allocator.cpp:109 Using
> >> >> > /dev/dma_heap/system
> >> >> > [0:31:56.259902167] [8111] DEBUG IPAManager ipa_manager.cpp:306 IPA module
> >> >> > /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signature is valid
> >> >> > [0:31:56.259915328] [8111] DEBUG IPAProxy soft_ipa_proxy.cpp:45 initializing
> >> >> > soft proxy: loading IPA from
> >> >> > /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
> >> >> > [0:31:56.260253048] [8111]  WARN IPAProxy ipa_proxy.cpp:160 Configuration file
> >> >> > 'ov08x40.yaml' not found for IPA module 'simple', falling back to
> >> >> > 'uncalibrated.yaml'
> >> >> > [0:31:56.260261868] [8111]  WARN IPASoft soft_simple.cpp:114 Failed to create
> >> >> > camera sensor helper for ov08x40
> >> >> > [0:31:56.260285368] [8111] DEBUG IPASoft soft_simple.cpp:135 Tuning file version
> >> >> > 1
> >> >> > [0:31:56.260299829] [8111] DEBUG MediaDevice media_device.cpp:826
> >> >> > /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture
> >> >> > 0'[0]: 0
> >> >> > [0:31:56.260304036] [8111] DEBUG MediaDevice media_device.cpp:826
> >> >> > /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture
> >> >> > 0'[0]: 1
> >> >> > [0:31:56.260323122] [8111] DEBUG SimplePipeline simple.cpp:775 Link 'ov08x40
> >> >> > 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
> >> >> > 1928x1208-SGRBG10_1X10
> >> >> > [0:31:56.260327682] [8111] DEBUG SimplePipeline simple.cpp:775 Link 'Intel IPU6
> >> >> > CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format
> >> >> > 1928x1208-SGRBG10_1X10
> >> >> > [0:31:56.260334385] [8111] DEBUG SimplePipeline simple.cpp:626 Adding
> >> >> > configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
> >> >> > [0:31:56.260351261] [8111] DEBUG SimplePipeline simple.cpp:775 Link 'ov08x40
> >> >> > 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
> >> >> > 3856x2416-SGRBG10_1X10
> >> >> > [0:31:56.260354556] [8111] DEBUG SimplePipeline simple.cpp:775 Link 'Intel IPU6
> >> >> > CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format
> >> >> > 3856x2416-SGRBG10_1X10
> >> >> > [0:31:56.260358905] [8111] DEBUG SimplePipeline simple.cpp:626 Adding
> >> >> > configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
> >> >> > [0:31:56.260368742] [8111] DEBUG Camera camera_manager.cpp:159 Pipeline handler
> >> >> > "simple" matched
> >> >> > [0:31:56.260372782] [8111] DEBUG Camera camera_manager.cpp:138 Found registered
> >> >> > pipeline handler 'uvcvideo'
> >> >> > [0:31:56.260376628] [8111] DEBUG Camera camera_manager.cpp:138 Found registered
> >> >> > pipeline handler 'vimc'
> >> >> > [0:32:00.473170819] [8105] DEBUG SimplePipeline simple.cpp:1002 Largest stream
> >> >> > size is 3848x2416
> >> >> > [0:32:00.473202717] [8105] DEBUG SimplePipeline simple.cpp:1054 Picked
> >> >> > 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x2416
> >> >> > [0:32:00.473218465] [8105] DEBUG Camera camera.cpp:1132 streams configuration:
> >> >> > (0) 3848x2416-ABGR8888
> >> >> > [0:32:00.473245535] [8105] DEBUG SimplePipeline simple.cpp:1002 Largest stream
> >> >> > size is 1928x1208
> >> >> > [0:32:00.473250290] [8105] DEBUG SimplePipeline simple.cpp:1054 Picked
> >> >> > 1928x1208-SGRBG10_1X10 -> 1928x1208-SGRBG10 for max stream size 1928x1208
> >> >> > [0:32:00.473255197] [8105] DEBUG SimplePipeline simple.cpp:1103 Adjusting size
> >> >> > from 1928x1208 to 1924x1208
> >> >> > Stream configuration adjusted to  1924x1208-ABGR8888
> >> >> > [0:32:00.473293271] [8105] DEBUG SimplePipeline simple.cpp:1002 Largest stream
> >> >> > size is 1924x1208
> >> >> > [0:32:00.473297929] [8105] DEBUG SimplePipeline simple.cpp:1054 Picked
> >> >> > 1928x1208-SGRBG10_1X10 -> 1928x1208-SGRBG10 for max stream size 1924x1208
> >> >> > [0:32:00.473303721] [8105]  INFO Camera camera.cpp:1197 configuring streams: (0)
> >> >> > 1924x1208-ABGR8888
> >> >> > [0:32:00.473326447] [8111] DEBUG MediaDevice media_device.cpp:826
> >> >> > /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture
> >> >> > 0'[0]: 0
> >> >> > [0:32:00.473341438] [8111] DEBUG MediaDevice media_device.cpp:826
> >> >> > /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture
> >> >> > 0'[0]: 1
> >> >> > [0:32:00.473382767] [8111] DEBUG SimplePipeline simple.cpp:775 Link 'ov08x40
> >> >> > 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format
> >> >> > 1928x1208-SGRBG10_1X10
> >> >> > [0:32:00.473387953] [8111] DEBUG SimplePipeline simple.cpp:775 Link 'Intel IPU6
> >> >> > CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format
> >> >> > 1928x1208-SGRBG10_1X10
> >> >> > [0:32:00.473403604] [8111]  INFO IPASoft soft_simple.cpp:232 Exposure 4-4442,
> >> >> > gain 6.94777e-310-1984 (1)
> >> >> > Zero-copy enabled
> >> >> > [0:32:00.474651600] [8111] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> >> >> > [0:32:00.475671913] [8111] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> >> >> > [0:32:00.476681479] [8111] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> >> >> > [0:32:00.478147695] [8105] DEBUG Request request.cpp:369 Created request -
> >> >> > cookie: 0
> >> >> > [0:32:00.478162670] [8105] DEBUG Request request.cpp:369 Created request -
> >> >> > cookie: 0
> >> >> > [0:32:00.478166787] [8105] DEBUG Request request.cpp:369 Created request -
> >> >> > cookie: 0
> >> >> > [0:32:00.478180310] [8105] DEBUG Camera camera.cpp:1355 Starting capture
> >> >> > [0:32:00.484289849] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1279
> >> >> > /dev/video0[224:cap]: 3 buffers requested.
> >> >> > [0:32:00.484377532] [8111] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> >> >> > [0:32:00.484408807] [8111] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> >> >> > [0:32:00.484433473] [8111] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> >> >> > [0:32:00.485163250] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1718
> >> >> > /dev/video0[224:cap]: Queueing buffer 0
> >> >> > [0:32:00.610747330] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1718
> >> >> > /dev/video0[224:cap]: Queueing buffer 1
> >> >> > [0:32:00.610795989] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1718
> >> >> > /dev/video0[224:cap]: Queueing buffer 2
> >> >> > [0:32:04.580974685] [8105] DEBUG Camera camera.cpp:1399 Stopping capture
> >> >> > [0:32:08.617087710] [8111] DEBUG Request request.cpp:129 Request(0:C:0/1:0)
> >> >> > [0:32:08.617207866] [8111] DEBUG Request request.cpp:129 Request(1:C:0/1:0)
> >> >> > [0:32:08.617222231] [8111] DEBUG Request request.cpp:129 Request(2:C:0/1:0)
> >> >> > [0:32:08.617240304] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1564
> >> >> > /dev/video0[224:cap]: Releasing buffers
> >> >> > [0:32:08.617274179] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1279
> >> >> > /dev/video0[224:cap]: 0 buffers requested.
> >> >> >
> >> >> > The image that qcam shows is attached. It _looks_ like the same symbol Windows
> >> >> > shows when the shutter is closed - just maybe reversed.
> >> >> >
> >> >> > If I try the same with the shutter open, my laptop freezes, and I have to do a
> >> >> > power-down reset.
> >> >> >
> >> >> > I am fairly handy and am willing to help, I just need some guidance into what I
> >> >> > need to do next
> >> >> >
> >> >> > Sincerely,
> >> >> > Duane

