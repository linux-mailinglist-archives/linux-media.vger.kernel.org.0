Return-Path: <linux-media+bounces-19629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD3799D7C7
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 21:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 858601F22F2B
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 19:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0891CC8B1;
	Mon, 14 Oct 2024 19:55:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail2.tds.syn-alias.com (mail2.tds.syn-alias.com [129.159.94.43])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662C2140E34
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 19:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.159.94.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728935701; cv=none; b=hELOGP1bGvS+HKsi6gyhM+SSQaMeEYYAVfwhUlIN6dX0exX8O5g6T0DE42abz6W5wQep3eQpPRdgp3aLkx1RRIrOdO7d5HHVa2+sZKchzBhYznBL31vx0kudhkbvoFpfS2FAf/a5sZ9LPG9w4RaPZo2daaA2+lARLtFANrvVYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728935701; c=relaxed/simple;
	bh=XTrEFWyUukiYJbbVG1NKCqeU6D0OObG/42T5/UepMBk=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=ineOq4b29b1RoI4W6MpueFU8XCLsh5QGCihB55po5AWChb5i8V8bHQP9DqcMiBUGLvDVS+yT+q+iFxCkUIDlS8b8QXB2cLZvbn6EnXBaj2n97nrm55a0s5nOJi0lEQp+nEnqYyRDhLVCJBdV4w/RepqaRNTwZN5Nc0JcCRoxMMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net; spf=pass smtp.mailfrom=chorus.net; arc=none smtp.client-ip=129.159.94.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chorus.net
X-Authed-Username: ZHVhbmVrQGNob3J1cy5uZXQ=
Received: from [10.219.153.35] ([10.219.153.35:61562] helo=md15.tds.email-ash1.sync.lan)
	by mail.tds.net (envelope-from <duanek@chorus.net>)
	(ecelerity 4.4.1.20033 r(msys-ecelerity:tags/4.4.1.0^0)) with ESMTP
	id 16/0F-25653-1177D076; Mon, 14 Oct 2024 15:54:57 -0400
Date: Mon, 14 Oct 2024 15:54:57 -0400 (EDT)
From: "duanek@chorus.net" <duanek@chorus.net>
To: linux-media@vger.kernel.org
Message-ID: <1594170563.10937137.1728935697496.JavaMail.zimbra@chorus.net>
Subject: IPU6 Camera with ov08x40 (OVTI08F4 sensor) HP Spectre 16" Meteor
 Lake doesn't work
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 9.0.0_GA_4653 (ZimbraWebClient - GC129 (Win)/9.0.0_GA_4653)
Thread-Index: k6zrhxQKu8Fw7JE6ELfBF0kJ4fDfJQ==
Thread-Topic: IPU6 Camera with ov08x40 (OVTI08F4 sensor) HP Spectre 16" Meteor Lake doesn't work
X-Vade-Verdict: clean
X-Vade-Analysis-1: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeghedgudeggecutefuodetggdotefrodftvfcurfhr
X-Vade-Analysis-2: ohhfihhlvgemucfujgfpteevqfftpdfvfffupdfgpfggqdfvfffupdfqfgfvnecuuegrihhlohhuthem
X-Vade-Analysis-3: uceftddunecunecujfgurhepfffhvffkufggtgfgihfothesthejtgdtiidtjeenucfhrhhomhepfdgu
X-Vade-Analysis-4: uhgrnhgvkhestghhohhruhhsrdhnvghtfdcuoeguuhgrnhgvkhestghhohhruhhsrdhnvghtqeenucgg
X-Vade-Analysis-5: tffrrghtthgvrhhnpeejleeuteektdeuiedukeeijefgtdejgffgheeileehkedvvdekteduhffghefh
X-Vade-Analysis-6: teenucffohhmrghinheplhhisggtrghmvghrrgdrohhrghenucfkphepuddtrddvudelrdduheefrdef
X-Vade-Analysis-7: hedpvddtjedrvddttddrvddvjedrgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehi
X-Vade-Analysis-8: nhgvthepuddtrddvudelrdduheefrdefhedphhgvlhhopehmugduhedrthgushdrvghmrghilhdqrghs
X-Vade-Analysis-9: hhdurdhshihntgdrlhgrnhdpmhgrihhlfhhrohhmpeguuhgrnhgvkhestghhohhruhhsrdhnvghtpdhr
X-Vade-Analysis-10: tghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpmhhtrghhohhs
X-Vade-Analysis-11: thepshhmthhptddvrdhtughsrdgvmhgrihhlqdgrshhhuddrshihnhgtrdhlrghnpdhnsggprhgtphht
X-Vade-Analysis-12: thhopedupdhishgpnhgrpehfrghlshgvpdgruhhthhgpuhhsvghrpeguuhgrnhgvkhestghhohhruhhs
X-Vade-Analysis-13: rdhnvght
X-Vade-Client: TDS

Dear All,
I would like to get the camera in my HP Spectre 16" laptop working under linux.
I have reported this to the libcamera group, and they suggested posting here:
https://bugs.libcamera.org/show_bug.cgi?id=237

I have compiled a custom kernel with the kernel module for what I _think_ is my camera, and it is detected on boot:

sudo dmesg |grep intel-ipu6
[   10.453585] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
[   10.453786] intel-ipu6 0000:00:05.0: IPU6 in secure mode touch 0x80000000 mask 0x0
[   10.468306] intel-ipu6 0000:00:05.0: FW version: 20230925
[   10.471209] intel-ipu6 0000:00:05.0: Found supported sensor OVTI08F4:00
[   10.471268] intel-ipu6 0000:00:05.0: Connected 1 cameras
[   10.475739] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
[   10.515753] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
[   10.563160] intel-ipu6 0000:00:05.0: CSE authenticate_run done
[   10.563175] intel-ipu6 0000:00:05.0: IPU6-v4[7d19] hardware version 6

I have also configured dmabuf for permissions.
I have downloaded libcamera, configured and built.

When I run: LIBCAMERA_LOG_LEVELS=0 cam --list
[0:09:56.854835470] [6213] DEBUG IPAModule ipa_module.cpp:333 ipa_ipu3.so: IPA module /usr/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is signed
[0:09:56.854875988] [6213] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
[0:09:56.854894355] [6213] DEBUG IPAModule ipa_module.cpp:333 ipa_soft_simple.so: IPA module /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is signed
[0:09:56.854901746] [6213] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so'
[0:09:56.854913026] [6213] DEBUG IPAModule ipa_module.cpp:333 ipa_vimc.so: IPA module /usr/lib/x86_64-linux-gnu/libcamera/ipa_vimc.so is signed
[0:09:56.854917620] [6213] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_vimc.so'
[0:09:56.854926011] [6213] ERROR IPAModule ipa_module.cpp:171 Symbol ipaModuleInfo not found
[0:09:56.854929187] [6213] ERROR IPAModule ipa_module.cpp:291 v4l2-compat.so: IPA module has no valid info
[0:09:56.854935275] [6213]  INFO Camera camera_manager.cpp:325 libcamera v0.3.2
[0:09:56.855123127] [6216] DEBUG Camera camera_manager.cpp:73 Starting camera manager
[0:09:56.861202179] [6216] DEBUG DeviceEnumerator device_enumerator.cpp:230 New media device "intel-ipu6" created from /dev/media0
[0:09:56.862429442] [6216] DEBUG DeviceEnumerator device_enumerator_udev.cpp:96 Defer media device /dev/media0 due to 1 missing dependencies
[0:09:56.862492043] [6216] DEBUG DeviceEnumerator device_enumerator_udev.cpp:322 All dependencies for media device /dev/media0 found
[0:09:56.862494433] [6216] DEBUG DeviceEnumerator device_enumerator.cpp:258 Added device /dev/media0: intel-ipu6
[0:09:56.862629885] [6216] DEBUG Camera camera_manager.cpp:138 Found registered pipeline handler 'ipu3'
[0:09:56.862637387] [6216] DEBUG Camera camera_manager.cpp:138 Found registered pipeline handler 'simple'
[0:09:56.862640029] [6216] DEBUG DeviceEnumerator device_enumerator.cpp:318 Successful match for media device "intel-ipu6"
[0:09:56.862645091] [6216] DEBUG SimplePipeline simple.cpp:1552 Sensor found for /dev/media0
[0:09:56.862665124] [6216] DEBUG SimplePipeline simple.cpp:416 Found capture device Intel IPU6 ISYS Capture 0
[0:09:56.862673488] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Exposure (0x00980911)
[0:09:56.862681127] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Horizontal Flip (0x00980914)
[0:09:56.862683897] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Vertical Flip (0x00980915)
[0:09:56.862686983] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Camera Orientation (0x009a0922)
[0:09:56.862692069] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Camera Sensor Rotation (0x009a0923)
[0:09:56.862695160] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Vertical Blanking (0x009e0901)
[0:09:56.862697275] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Horizontal Blanking (0x009e0902)
[0:09:56.862699995] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Analogue Gain (0x009e0903)
[0:09:56.862702951] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Link Frequency (0x009f0901)
[0:09:56.862705721] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Pixel Rate (0x009f0902)
[0:09:56.862708614] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Test Pattern (0x009f0903)
[0:09:56.862712618] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Digital Gain (0x009f0905)
[0:09:56.862725913] [6216] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov08x40 4-0036': Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for device
[0:09:56.862731090] [6216]  WARN CameraSensor camera_sensor.cpp:304 'ov08x40 4-0036': The PixelArraySize property has been defaulted to 3856x2416
[0:09:56.862734575] [6216] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov08x40 4-0036': Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for device
[0:09:56.862737003] [6216]  WARN CameraSensor camera_sensor.cpp:315 'ov08x40 4-0036': The PixelArrayActiveAreas property has been defaulted to (0, 0)/3856x2416
[0:09:56.862741568] [6216] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov08x40 4-0036': Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for device
[0:09:56.862743916] [6216]  WARN CameraSensor camera_sensor.cpp:323 'ov08x40 4-0036': Failed to retrieve the sensor crop rectangle
[0:09:56.862746073] [6216]  WARN CameraSensor camera_sensor.cpp:329 'ov08x40 4-0036': The sensor kernel driver needs to be fixed
[0:09:56.862748203] [6216]  WARN CameraSensor camera_sensor.cpp:331 'ov08x40 4-0036': See Documentation/sensor_driver_requirements.rst in the libcamera sources for more information
[0:09:56.862886481] [6216]  WARN CameraSensorProperties camera_sensor_properties.cpp:293 No static properties available for 'ov08x40'
[0:09:56.862891448] [6216]  WARN CameraSensorProperties camera_sensor_properties.cpp:295 Please consider updating the camera sensor properties database
[0:09:56.862894364] [6216] DEBUG SimplePipeline simple.cpp:486 Found pipeline: [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 ISYS Capture 0]
[0:09:56.862903916] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Exposure (0x00980911)
[0:09:56.862906875] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Horizontal Flip (0x00980914)
[0:09:56.862909364] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Vertical Flip (0x00980915)
[0:09:56.862911941] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Camera Orientation (0x009a0922)
[0:09:56.862915743] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Camera Sensor Rotation (0x009a0923)
[0:09:56.862918412] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Vertical Blanking (0x009e0901)
[0:09:56.862920592] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Horizontal Blanking (0x009e0902)
[0:09:56.862922756] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Analogue Gain (0x009e0903)
[0:09:56.862925354] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Link Frequency (0x009f0901)
[0:09:56.862928023] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Pixel Rate (0x009f0902)
[0:09:56.862930347] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Test Pattern (0x009f0903)
[0:09:56.862934434] [6216] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Digital Gain (0x009f0905)
[0:09:56.862943516] [6216] DEBUG V4L2 v4l2_videodevice.cpp:631 /dev/video0[16:cap]: Opened device : isys: ipu6
[0:09:56.862961969] [6216] DEBUG DmaBufAllocator dma_buf_allocator.cpp:103 Failed to open /dev/dma_heap/linux,cma: No such file or directory
[0:09:56.862966349] [6216] DEBUG DmaBufAllocator dma_buf_allocator.cpp:103 Failed to open /dev/dma_heap/reserved: No such file or directory
[0:09:56.862971624] [6216] DEBUG DmaBufAllocator dma_buf_allocator.cpp:109 Using /dev/dma_heap/system
[0:09:56.863135787] [6216] DEBUG IPAManager ipa_manager.cpp:306 IPA module /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signature is valid
[0:09:56.863149345] [6216] DEBUG IPAProxy soft_ipa_proxy.cpp:45 initializing soft proxy: loading IPA from /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
[0:09:56.873712857] [6216]  WARN IPAProxy ipa_proxy.cpp:160 Configuration file 'ov08x40.yaml' not found for IPA module 'simple', falling back to 'uncalibrated.yaml'
[0:09:56.873732979] [6216]  WARN IPASoft soft_simple.cpp:114 Failed to create camera sensor helper for ov08x40
[0:09:56.873831783] [6216] DEBUG IPASoft soft_simple.cpp:135 Tuning file version 1
[0:09:56.873849138] [6216] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 1
[0:09:56.873874763] [6216] DEBUG SimplePipeline simple.cpp:775 Link 'ov08x40 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 1928x1208-SGRBG10_1X10
[0:09:56.873878920] [6216] DEBUG SimplePipeline simple.cpp:775 Link 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 1928x1208-SGRBG10_1X10
[0:09:56.873885965] [6216] DEBUG SimplePipeline simple.cpp:626 Adding configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
[0:09:56.873901964] [6216] DEBUG SimplePipeline simple.cpp:775 Link 'ov08x40 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 3856x2416-SGRBG10_1X10
[0:09:56.873904715] [6216] DEBUG SimplePipeline simple.cpp:775 Link 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 3856x2416-SGRBG10_1X10
[0:09:56.873908986] [6216] DEBUG SimplePipeline simple.cpp:626 Adding configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
[0:09:56.873918943] [6216] DEBUG Camera camera_manager.cpp:159 Pipeline handler "simple" matched
[0:09:56.873923366] [6216] DEBUG Camera camera_manager.cpp:138 Found registered pipeline handler 'uvcvideo'
[0:09:56.873926699] [6216] DEBUG Camera camera_manager.cpp:138 Found registered pipeline handler 'vimc'
Available cameras:
1: Internal front camera (\_SB_.PC00.LNK0)

which seems to indicate a camera found.

This laptop has an electronic shutter, activated by a Function key, and under linux (Debian Sid/Trixie), I can toggle the shutter.

If I try: LIBCAMERA_LOG_LEVELS=0 qcam -s "width=1928,height=1208"  I get:

[0:31:56.248638615] [8105] DEBUG IPAModule ipa_module.cpp:333 ipa_ipu3.so: IPA module /usr/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so is signed
[0:31:56.248713977] [8105] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_ipu3.so'
[0:31:56.248745147] [8105] DEBUG IPAModule ipa_module.cpp:333 ipa_soft_simple.so: IPA module /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so is signed
[0:31:56.248762096] [8105] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so'
[0:31:56.248783890] [8105] DEBUG IPAModule ipa_module.cpp:333 ipa_vimc.so: IPA module /usr/lib/x86_64-linux-gnu/libcamera/ipa_vimc.so is signed
[0:31:56.248797242] [8105] DEBUG IPAManager ipa_manager.cpp:235 Loaded IPA module '/usr/lib/x86_64-linux-gnu/libcamera/ipa_vimc.so'
[0:31:56.248815534] [8105] ERROR IPAModule ipa_module.cpp:171 Symbol ipaModuleInfo not found
[0:31:56.248823967] [8105] ERROR IPAModule ipa_module.cpp:291 v4l2-compat.so: IPA module has no valid info
[0:31:56.248839450] [8105]  INFO Camera camera_manager.cpp:325 libcamera v0.3.2
[0:31:56.249067816] [8111] DEBUG Camera camera_manager.cpp:73 Starting camera manager
[0:31:56.257921853] [8111] DEBUG DeviceEnumerator device_enumerator.cpp:230 New media device "intel-ipu6" created from /dev/media0
[0:31:56.259095802] [8111] DEBUG DeviceEnumerator device_enumerator_udev.cpp:96 Defer media device /dev/media0 due to 1 missing dependencies
[0:31:56.259146226] [8111] DEBUG DeviceEnumerator device_enumerator_udev.cpp:322 All dependencies for media device /dev/media0 found
[0:31:56.259148998] [8111] DEBUG DeviceEnumerator device_enumerator.cpp:258 Added device /dev/media0: intel-ipu6
[0:31:56.259365000] [8111] DEBUG Camera camera_manager.cpp:138 Found registered pipeline handler 'ipu3'
[0:31:56.259376054] [8111] DEBUG Camera camera_manager.cpp:138 Found registered pipeline handler 'simple'
[0:31:56.259379285] [8111] DEBUG DeviceEnumerator device_enumerator.cpp:318 Successful match for media device "intel-ipu6"
[0:31:56.259384622] [8111] DEBUG SimplePipeline simple.cpp:1552 Sensor found for /dev/media0
[0:31:56.259405468] [8111] DEBUG SimplePipeline simple.cpp:416 Found capture device Intel IPU6 ISYS Capture 0
[0:31:56.259417404] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Exposure (0x00980911)
[0:31:56.259427279] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Horizontal Flip (0x00980914)
[0:31:56.259430625] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Vertical Flip (0x00980915)
[0:31:56.259434102] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Camera Orientation (0x009a0922)
[0:31:56.259439748] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Camera Sensor Rotation (0x009a0923)
[0:31:56.259444731] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Vertical Blanking (0x009e0901)
[0:31:56.259448236] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Horizontal Blanking (0x009e0902)
[0:31:56.259451979] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Analogue Gain (0x009e0903)
[0:31:56.259455940] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Link Frequency (0x009f0901)
[0:31:56.259459811] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Pixel Rate (0x009f0902)
[0:31:56.259463116] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Test Pattern (0x009f0903)
[0:31:56.259468191] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Digital Gain (0x009f0905)
[0:31:56.259482422] [8111] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov08x40 4-0036': Unable to get rectangle 2 on pad 0/0: Inappropriate ioctl for device
[0:31:56.259488780] [8111]  WARN CameraSensor camera_sensor.cpp:304 'ov08x40 4-0036': The PixelArraySize property has been defaulted to 3856x2416
[0:31:56.259492249] [8111] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov08x40 4-0036': Unable to get rectangle 1 on pad 0/0: Inappropriate ioctl for device
[0:31:56.259495284] [8111]  WARN CameraSensor camera_sensor.cpp:315 'ov08x40 4-0036': The PixelArrayActiveAreas property has been defaulted to (0, 0)/3856x2416
[0:31:56.259499843] [8111] ERROR V4L2 v4l2_subdevice.cpp:1085 'ov08x40 4-0036': Unable to get rectangle 0 on pad 0/0: Inappropriate ioctl for device
[0:31:56.259502689] [8111]  WARN CameraSensor camera_sensor.cpp:323 'ov08x40 4-0036': Failed to retrieve the sensor crop rectangle
[0:31:56.259505241] [8111]  WARN CameraSensor camera_sensor.cpp:329 'ov08x40 4-0036': The sensor kernel driver needs to be fixed
[0:31:56.259507759] [8111]  WARN CameraSensor camera_sensor.cpp:331 'ov08x40 4-0036': See Documentation/sensor_driver_requirements.rst in the libcamera sources for more information
[0:31:56.259634530] [8111]  WARN CameraSensorProperties camera_sensor_properties.cpp:293 No static properties available for 'ov08x40'
[0:31:56.259638620] [8111]  WARN CameraSensorProperties camera_sensor_properties.cpp:295 Please consider updating the camera sensor properties database
[0:31:56.259642356] [8111] DEBUG SimplePipeline simple.cpp:486 Found pipeline: [ov08x40 4-0036|0] -> [0|Intel IPU6 CSI2 0|1] -> [0|Intel IPU6 ISYS Capture 0]
[0:31:56.259653932] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Exposure (0x00980911)
[0:31:56.259658031] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Horizontal Flip (0x00980914)
[0:31:56.259661609] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Vertical Flip (0x00980915)
[0:31:56.259665266] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Camera Orientation (0x009a0922)
[0:31:56.259669824] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Camera Sensor Rotation (0x009a0923)
[0:31:56.259673455] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Vertical Blanking (0x009e0901)
[0:31:56.259676909] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Horizontal Blanking (0x009e0902)
[0:31:56.259680356] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Analogue Gain (0x009e0903)
[0:31:56.259684182] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Link Frequency (0x009f0901)
[0:31:56.259687910] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Pixel Rate (0x009f0902)
[0:31:56.259691225] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Test Pattern (0x009f0903)
[0:31:56.259696017] [8111] DEBUG V4L2 v4l2_device.cpp:634 'ov08x40 4-0036': Control: Digital Gain (0x009f0905)
[0:31:56.259706326] [8111] DEBUG V4L2 v4l2_videodevice.cpp:631 /dev/video0[224:cap]: Opened device : isys: ipu6
[0:31:56.259727296] [8111] DEBUG DmaBufAllocator dma_buf_allocator.cpp:103 Failed to open /dev/dma_heap/linux,cma: No such file or directory
[0:31:56.259731671] [8111] DEBUG DmaBufAllocator dma_buf_allocator.cpp:103 Failed to open /dev/dma_heap/reserved: No such file or directory
[0:31:56.259736325] [8111] DEBUG DmaBufAllocator dma_buf_allocator.cpp:109 Using /dev/dma_heap/system
[0:31:56.259902167] [8111] DEBUG IPAManager ipa_manager.cpp:306 IPA module /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so signature is valid
[0:31:56.259915328] [8111] DEBUG IPAProxy soft_ipa_proxy.cpp:45 initializing soft proxy: loading IPA from /usr/lib/x86_64-linux-gnu/libcamera/ipa_soft_simple.so
[0:31:56.260253048] [8111]  WARN IPAProxy ipa_proxy.cpp:160 Configuration file 'ov08x40.yaml' not found for IPA module 'simple', falling back to 'uncalibrated.yaml'
[0:31:56.260261868] [8111]  WARN IPASoft soft_simple.cpp:114 Failed to create camera sensor helper for ov08x40
[0:31:56.260285368] [8111] DEBUG IPASoft soft_simple.cpp:135 Tuning file version 1
[0:31:56.260299829] [8111] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 0
[0:31:56.260304036] [8111] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 1
[0:31:56.260323122] [8111] DEBUG SimplePipeline simple.cpp:775 Link 'ov08x40 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 1928x1208-SGRBG10_1X10
[0:31:56.260327682] [8111] DEBUG SimplePipeline simple.cpp:775 Link 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 1928x1208-SGRBG10_1X10
[0:31:56.260334385] [8111] DEBUG SimplePipeline simple.cpp:626 Adding configuration for 1928x1208 in pixel formats [ BA10, pgAA ]
[0:31:56.260351261] [8111] DEBUG SimplePipeline simple.cpp:775 Link 'ov08x40 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 3856x2416-SGRBG10_1X10
[0:31:56.260354556] [8111] DEBUG SimplePipeline simple.cpp:775 Link 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 3856x2416-SGRBG10_1X10
[0:31:56.260358905] [8111] DEBUG SimplePipeline simple.cpp:626 Adding configuration for 3856x2416 in pixel formats [ BA10, pgAA ]
[0:31:56.260368742] [8111] DEBUG Camera camera_manager.cpp:159 Pipeline handler "simple" matched
[0:31:56.260372782] [8111] DEBUG Camera camera_manager.cpp:138 Found registered pipeline handler 'uvcvideo'
[0:31:56.260376628] [8111] DEBUG Camera camera_manager.cpp:138 Found registered pipeline handler 'vimc'
[0:32:00.473170819] [8105] DEBUG SimplePipeline simple.cpp:1002 Largest stream size is 3848x2416
[0:32:00.473202717] [8105] DEBUG SimplePipeline simple.cpp:1054 Picked 3856x2416-SGRBG10_1X10 -> 3856x2416-SGRBG10 for max stream size 3848x2416
[0:32:00.473218465] [8105] DEBUG Camera camera.cpp:1132 streams configuration: (0) 3848x2416-ABGR8888
[0:32:00.473245535] [8105] DEBUG SimplePipeline simple.cpp:1002 Largest stream size is 1928x1208
[0:32:00.473250290] [8105] DEBUG SimplePipeline simple.cpp:1054 Picked 1928x1208-SGRBG10_1X10 -> 1928x1208-SGRBG10 for max stream size 1928x1208
[0:32:00.473255197] [8105] DEBUG SimplePipeline simple.cpp:1103 Adjusting size from 1928x1208 to 1924x1208
Stream configuration adjusted to  1924x1208-ABGR8888
[0:32:00.473293271] [8105] DEBUG SimplePipeline simple.cpp:1002 Largest stream size is 1924x1208
[0:32:00.473297929] [8105] DEBUG SimplePipeline simple.cpp:1054 Picked 1928x1208-SGRBG10_1X10 -> 1928x1208-SGRBG10 for max stream size 1924x1208
[0:32:00.473303721] [8105]  INFO Camera camera.cpp:1197 configuring streams: (0) 1924x1208-ABGR8888
[0:32:00.473326447] [8111] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 0
[0:32:00.473341438] [8111] DEBUG MediaDevice media_device.cpp:826 /dev/media0[intel-ipu6]: 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: 1
[0:32:00.473382767] [8111] DEBUG SimplePipeline simple.cpp:775 Link 'ov08x40 4-0036'[0] -> 'Intel IPU6 CSI2 0'[0]: configured with format 1928x1208-SGRBG10_1X10
[0:32:00.473387953] [8111] DEBUG SimplePipeline simple.cpp:775 Link 'Intel IPU6 CSI2 0'[1] -> 'Intel IPU6 ISYS Capture 0'[0]: configured with format 1928x1208-SGRBG10_1X10
[0:32:00.473403604] [8111]  INFO IPASoft soft_simple.cpp:232 Exposure 4-4442, gain 6.94777e-310-1984 (1)
Zero-copy enabled
[0:32:00.474651600] [8111] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
[0:32:00.475671913] [8111] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
[0:32:00.476681479] [8111] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
[0:32:00.478147695] [8105] DEBUG Request request.cpp:369 Created request - cookie: 0
[0:32:00.478162670] [8105] DEBUG Request request.cpp:369 Created request - cookie: 0
[0:32:00.478166787] [8105] DEBUG Request request.cpp:369 Created request - cookie: 0
[0:32:00.478180310] [8105] DEBUG Camera camera.cpp:1355 Starting capture
[0:32:00.484289849] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1279 /dev/video0[224:cap]: 3 buffers requested.
[0:32:00.484377532] [8111] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
[0:32:00.484408807] [8111] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
[0:32:00.484433473] [8111] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
[0:32:00.485163250] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1718 /dev/video0[224:cap]: Queueing buffer 0
[0:32:00.610747330] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1718 /dev/video0[224:cap]: Queueing buffer 1
[0:32:00.610795989] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1718 /dev/video0[224:cap]: Queueing buffer 2
[0:32:04.580974685] [8105] DEBUG Camera camera.cpp:1399 Stopping capture
[0:32:08.617087710] [8111] DEBUG Request request.cpp:129 Request(0:C:0/1:0)
[0:32:08.617207866] [8111] DEBUG Request request.cpp:129 Request(1:C:0/1:0)
[0:32:08.617222231] [8111] DEBUG Request request.cpp:129 Request(2:C:0/1:0)
[0:32:08.617240304] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1564 /dev/video0[224:cap]: Releasing buffers
[0:32:08.617274179] [8111] DEBUG V4L2 v4l2_videodevice.cpp:1279 /dev/video0[224:cap]: 0 buffers requested.

The image that qcam shows is attached. It _looks_ like the same symbol Windows shows when the shutter is closed - just maybe reversed.

If I try the same with the shutter open, my laptop freezes, and I have to do a power-down reset.

I am fairly handy and am willing to help, I just need some guidance into what I need to do next

Sincerely,
Duane

