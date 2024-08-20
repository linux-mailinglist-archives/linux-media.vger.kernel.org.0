Return-Path: <linux-media+bounces-16504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18939957BC5
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 05:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 994A61F2369A
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 03:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F42A2837A;
	Tue, 20 Aug 2024 03:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cp221Ywh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918C733F9
	for <linux-media@vger.kernel.org>; Tue, 20 Aug 2024 03:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724123332; cv=none; b=UVdNfeI/M1AgdtdURX+/+8Mr6r15nRgcVg+mjWpMDo59mSmNDMmIBKcpP1JQsoSGR0Wv1z6fx1Gixjt4uRZXLzlHIYZXu5Z6MxWXqVJSVagtOn+9Q60SDya/HgdTy9ydDkYJxBvPUzurD4gyhiYp+6kj/Wfp5/XScEhQX4op8us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724123332; c=relaxed/simple;
	bh=escNdeFT1yiQl6ZJOn1VTdmHxmmsCBLOTMb3mL1aNb0=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Z9dK4gZrbYe4gtYMGvp7Z9tH5SleVekIDi1g6xSyRRVX1gAMgVS43fwkG4QaQo0hOQE4S8/ycGy2pKctAfRX6dkgcnfLYk5EeplI4t1jXL2xptVuieQ9YIzdUS6KI7+cZjepF/CSPCph7TUMew2yrIEuOrvMPm0dMZvTvkBdFc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cp221Ywh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724123330; x=1755659330;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=escNdeFT1yiQl6ZJOn1VTdmHxmmsCBLOTMb3mL1aNb0=;
  b=Cp221Ywh19FNN0Etcvc2R8rku3TqSJ1xm+OPYbMhYEjFdd2o4STB48to
   EKS3M6I0w/UQfL9csO0BtsM9aLSFVCqK7bFwKWb6HDo1DbaljgqvtJlaC
   JmNH44VKkfIZbJ09T8OQnGt6ZKH9OBzs7xyivaNHwwEI1Wjub5CICsUXm
   TlEE/siFKQNLciH5gSqDxZiZsyHlxWvO99WFJX1VtHYgYEFvTaK/Uj1oc
   nSwDldM6b/qQvWp0z2J+O5nmgKSscOE+MV03OgDuh3pSmP2wJRGwUvIPL
   QuVPGv6J9y7NfhmqLD4HYZWnF1G6PsgsNYv/2C2eW0Y8SFgiX49g82oIb
   A==;
X-CSE-ConnectionGUID: Rksohmn/QwW5LalWGR1EUA==
X-CSE-MsgGUID: UUQxTY/ESy+jCH3ghcF8zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33067359"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="33067359"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 20:08:50 -0700
X-CSE-ConnectionGUID: PsnNgCJOTFKlKGFssn5owQ==
X-CSE-MsgGUID: TwD0bshTTbWMG0NCGjQZ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="61135609"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa007.jf.intel.com with ESMTP; 19 Aug 2024 20:08:49 -0700
Subject: Re: IPU6 Camera Video Output Upside Down
From: Bingbu Cao <bingbu.cao@linux.intel.com>
To: Kelvin Miller <uavtech2002@gmail.com>, linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com, laurent.pinchart@ideasonboard.com, arnd@kernel.org
References: <CAC-GLBmTxCLVvm89vX6XYwpJOTkFeLSjASc2qy7DwySRcS8Hyw@mail.gmail.com>
 <97587b3a-1ea2-2569-a116-d762b144ea01@linux.intel.com>
Message-ID: <5ffbe1b6-c795-834b-5a6b-85468b22c0c2@linux.intel.com>
Date: Tue, 20 Aug 2024 11:10:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <97587b3a-1ea2-2569-a116-d762b144ea01@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Miller,

On 8/20/24 8:35 AM, Bingbu Cao wrote:
> Miller,
> 
> On 8/18/24 8:00 AM, Kelvin Miller wrote:
>> All,
>>
>> I don't know who to direct this to, so I added the names of
>> individuals working on intel_ipu6 related patches.
>>
>> I'm running the 6.10.5-arch1-1 and 6.10.5-arch1-1-surface kernels on a
>> Microsoft Surface Pro 8 in EndeavourOS. The Surface Pro 8 has the
>> ov5693 (front) and ov13858 (rear) sensors. Only the front sensor is
>> recognized by libcamera. In all of the camera applications that I used
>> (cheese, kamoso, and qcam) the video is inverted (upside down). It was
>> recommended on the Surface Linux Github page
>> (https://github.com/linux-surface/linux-surface/discussions/1354#discussioncomment-10367513)
>> that I report this issue here.

I replied some comments in this issue.

>>
>> Here are some outputs:
>>
>> $ v4l2-ctl -l -d $(media-ctl -d /dev/media0 -e 'ov5693 2-0036')
>>
>> User Controls
>>
>>                       exposure 0x00980911 (int)    : min=1 max=1030
>> step=1 default=1030 value=1030
>>                horizontal_flip 0x00980914 (bool)   : default=0 value=0
>>                  vertical_flip 0x00980915 (bool)   : default=0 value=0
>>
>> Camera Controls
>>
>>             camera_orientation 0x009a0922 (menu)   : min=0 max=2
>> default=0 value=0 (Front) flags=read-only
>>         camera_sensor_rotation 0x009a0923 (int)    : min=0 max=0
>> step=1 default=0 value=0 flags=read-only
>>
>> Image Source Controls
>>
>>              vertical_blanking 0x009e0901 (int)    : min=4 max=64563
>> step=1 default=66 value=66
>>            horizontal_blanking 0x009e0902 (int)    : min=1392 max=1392
>> step=1 default=1392 value=1392 flags=read-only
>>                  analogue_gain 0x009e0903 (int)    : min=1 max=127
>> step=1 default=8 value=127
>>
>> Image Processing Controls
>>
>>                 link_frequency 0x009f0901 (intmenu): min=0 max=0
>> default=0 value=0 (419200000 0x18fc7c00) flags=read-only
>>                     pixel_rate 0x009f0902 (int64)  : min=0
>> max=167680000 step=1 default=167680000 value=167680000 flags=read-only
>>                   test_pattern 0x009f0903 (menu)   : min=0 max=3
>> default=0 value=0 (Disabled)
>>                   digital_gain 0x009f0905 (int)    : min=1 max=4095
>> step=1 default=1024 value=1024
>>
>> $ lsmod | grep ipu
>> intel_ipu6_isys       143360  6
>> videobuf2_dma_contig    28672  2 intel_ipu6_isys
>> videobuf2_v4l2         40960  1 intel_ipu6_isys
>> videobuf2_common       94208  4
>> videobuf2_dma_contig,videobuf2_v4l2,intel_ipu6_isys,videobuf2_memops
>> v4l2_fwnode            32768  8 ov5693,intel_ipu6_isys,ov13858
>> v4l2_async             32768  4 v4l2_fwnode,ov5693,intel_ipu6_isys,ov13858
>> videodev              393216  15
>> v4l2_async,v4l2_fwnode,videobuf2_v4l2,ov5693,v4l2loopback,intel_ipu6_isys,ov13858
>> mc                     90112  9
>> v4l2_async,videodev,videobuf2_v4l2,ov5693,intel_ipu6_isys,ov13858,videobuf2_common
>> intel_ipu6             86016  7 intel_ipu6_isys
>> ipu_bridge             24576  2 intel_ipu6,intel_ipu6_isys
>>
>> $ LIBCAMERA_LOG_LEVELS=0 cam --list
>> [1:10:50.807754803] [10863] DEBUG IPAModule ipa_module.cpp:334
>> ipa_ipu3.so: IPA module /usr/lib/libcamera/ipa_ipu3.so is signed
>> [1:10:50.807872559] [10863] DEBUG IPAManager ipa_manager.cpp:235
>> Loaded IPA module '/usr/lib/libcamera/ipa_ipu3.so'
>> [1:10:50.807962280] [10863] DEBUG IPAModule ipa_module.cpp:334
>> ipa_soft_simple.so: IPA module /usr/lib/libcamera/ipa_soft_simple.so
>> is signe
>> d
>> [1:10:50.807980265] [10863] DEBUG IPAManager ipa_manager.cpp:235
>> Loaded IPA module '/usr/lib/libcamera/ipa_soft_simple.so'
>> [1:10:50.808012629] [10863] DEBUG IPAModule ipa_module.cpp:334
>> ipa_vimc.so: IPA module /usr/lib/libcamera/ipa_vimc.so is signed
>> [1:10:50.808025804] [10863] DEBUG IPAManager ipa_manager.cpp:235
>> Loaded IPA module '/usr/lib/libcamera/ipa_vimc.so'
>> [1:10:50.808050072] [10863] ERROR IPAModule ipa_module.cpp:172 Symbol
>> ipaModuleInfo not found
>> [1:10:50.808057333] [10863] ERROR IPAModule ipa_module.cpp:292
>> v4l2-compat.so: IPA module has no valid info
>> [1:10:50.808131102] [10863]  INFO Camera camera_manager.cpp:325
>> libcamera v0.3.1+64-ce690bd9-dirty (2024-08-17T16:17:18EDT)
>> [1:10:50.808343190] [10864] DEBUG Camera camera_manager.cpp:73
>> Starting camera manager
>> [1:10:50.821605192] [10864] DEBUG DeviceEnumerator
>> device_enumerator.cpp:230 New media device "intel-ipu6" created from
>> /dev/media0
>> [1:10:50.824319260] [10864] DEBUG DeviceEnumerator
>> device_enumerator_udev.cpp:96 Defer media device /dev/media0 due to 1
>> missing dependencie
>> s
>> [1:10:50.824612021] [10864] DEBUG DeviceEnumerator
>> device_enumerator_udev.cpp:322 All dependencies for media device
>> /dev/media0 found
>> [1:10:50.824624081] [10864] DEBUG DeviceEnumerator
>> device_enumerator.cpp:258 Added device /dev/media0: intel-ipu6
>> [1:10:50.825560945] [10864] DEBUG Camera camera_manager.cpp:138 Found
>> registered pipeline handler 'ipu3'
>> [1:10:50.825858267] [10864] DEBUG Camera camera_manager.cpp:138 Found
>> registered pipeline handler 'simple'
>> [1:10:50.825960032] [10864] DEBUG DeviceEnumerator
>> device_enumerator.cpp:318 Successful match for media device
>> "intel-ipu6"
>> [1:10:50.826073453] [10864] DEBUG SimplePipeline simple.cpp:1554
>> Sensor found for /dev/media0
>> [1:10:50.826578250] [10864] DEBUG SimplePipeline simple.cpp:417 Found
>> capture device Intel IPU6 ISYS Capture 32
>> [1:10:50.826673664] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Exposure (0x00980911)
>> [1:10:50.826807959] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Horizontal Flip (0x00980914)
>> [1:10:50.826837706] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Vertical Flip (0x00980915)
>> [1:10:50.826855790] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Camera Orientation (0x009a0922)
>> [1:10:50.826903725] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Camera Sensor Rotation (0x009a0923)
>> [1:10:50.826923461] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Vertical Blanking (0x009e0901)
>> [1:10:50.826936999] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Horizontal Blanking (0x009e0902)
>> [1:10:50.826951952] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Analogue Gain (0x009e0903)
>> [1:10:50.826966185] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Link Frequency (0x009f0901)
>> [1:10:50.826983040] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Pixel Rate (0x009f0902)
>> [1:10:50.826997454] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Test Pattern (0x009f0903)
>> [1:10:50.827015198] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Digital Gain (0x009f0905)
>> [1:10:50.828490135] [10864] DEBUG CameraSensor camera_sensor.cpp:431
>> 'ov5693 2-0036': Test pattern mode 1 ignored
>> [1:10:50.828508710] [10864] DEBUG CameraSensor camera_sensor.cpp:431
>> 'ov5693 2-0036': Test pattern mode 3 ignored
>> [1:10:50.828545992] [10864] DEBUG CameraSensor camera_sensor.cpp:1187
>> 'ov5693 2-0036': Apply test pattern mode 0
>> [1:10:50.828573532] [10864] DEBUG SimplePipeline simple.cpp:487 Found
>> pipeline: [ov5693 2-0036|0] -> [0|Intel IPU6 CSI2 4|1] -> [0|Intel IPU
>> 6 ISYS Capture 32]
>> [1:10:50.828701911] [10864] DEBUG V4L2 v4l2_videodevice.cpp:632
>> /dev/video32[14:cap]: Opened device : isys: ipu6
>> [1:10:50.828871825] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Exposure (0x00980911)
>> [1:10:50.828899010] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Horizontal Flip (0x00980914)
>> [1:10:50.828914160] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Vertical Flip (0x00980915)
>> [1:10:50.828928349] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Camera Orientation (0x009a0922)
>> [1:10:50.828947214] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Camera Sensor Rotation (0x009a0923)
>> [1:10:50.828961230] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Vertical Blanking (0x009e0901)
>> [1:10:50.828974089] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Horizontal Blanking (0x009e0902)
>> [1:10:50.828986298] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Analogue Gain (0x009e0903)
>> [1:10:50.828998654] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Link Frequency (0x009f0901)
>> [1:10:50.829014321] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Pixel Rate (0x009f0902)
>> [1:10:50.829027065] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Test Pattern (0x009f0903)
>> [1:10:50.829043099] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
>> 2-0036': Control: Digital Gain (0x009f0905)
>> [1:10:50.829102862] [10864] DEBUG DmaBufAllocator
>> dma_buf_allocator.cpp:103 Failed to open /dev/dma_heap/linux,cma:
>> Permission denied
>> [1:10:50.829116555] [10864] DEBUG DmaBufAllocator
>> dma_buf_allocator.cpp:103 Failed to open /dev/dma_heap/reserved:
>> Permission denied
>> [1:10:50.829124690] [10864] DEBUG DmaBufAllocator
>> dma_buf_allocator.cpp:103 Failed to open /dev/dma_heap/system:
>> Permission denied
>> [1:10:50.829137432] [10864] DEBUG DmaBufAllocator
>> dma_buf_allocator.cpp:109 Using /dev/udmabuf
>> [1:10:50.830824251] [10864] DEBUG IPAManager ipa_manager.cpp:306 IPA
>> module /usr/lib/libcamera/ipa_soft_simple.so signature is valid
>> [1:10:50.830945293] [10864] DEBUG IPAProxy soft_ipa_proxy.cpp:45
>> initializing soft proxy: loading IPA from
>> /usr/lib/libcamera/ipa_soft_simpl
>> e.so
>> [1:10:50.831350571] [10864]  WARN IPAProxy ipa_proxy.cpp:161
>> Configuration file 'ov5693.yaml' not found for IPA module 'simple',
>> falling bac
>> k to 'uncalibrated.yaml'
>> [1:10:50.831585810] [10864] DEBUG IPASoft soft_simple.cpp:135 Tuning
>> file version 1
>> [1:10:50.831695682] [10864] DEBUG MediaDevice media_device.cpp:830
>> /dev/media0[intel-ipu6]: Intel IPU6 CSI2 4[1] -> Intel IPU6 ISYS
>> Capture
>> 32[0]: 0
>> [1:10:50.831706917] [10864] DEBUG MediaDevice media_device.cpp:830
>> /dev/media0[intel-ipu6]: Intel IPU6 CSI2 4[1] -> Intel IPU6 ISYS
>> Capture
>> 32[0]: 1
>> [1:10:50.831829423] [10864] DEBUG SimplePipeline simple.cpp:776 Link
>> 'ov5693 2-0036':0 -> 'Intel IPU6 CSI2 4':0 configured with format
>> 1296x
>> 972-SBGGR10_1X10
>> [1:10:50.831850084] [10864] DEBUG SimplePipeline simple.cpp:776 Link
>> 'Intel IPU6 CSI2 4':1 -> 'Intel IPU6 ISYS Capture 32':0 configured
>> with
>> format 1296x972-SBGGR10_1X10
>> [1:10:50.831916492] [10864] DEBUG SimplePipeline simple.cpp:627 Adding
>> configuration for 1296x972 in pixel formats [ BG10, pBAA ]
>> [1:10:50.832031091] [10864] DEBUG SimplePipeline simple.cpp:776 Link
>> 'ov5693 2-0036':0 -> 'Intel IPU6 CSI2 4':0 configured with format
>> 2592x
>> 1944-SBGGR10_1X10
>> [1:10:50.832040698] [10864] DEBUG SimplePipeline simple.cpp:776 Link
>> 'Intel IPU6 CSI2 4':1 -> 'Intel IPU6 ISYS Capture 32':0 configured
>> with
>> format 2592x1944-SBGGR10_1X10
>> [1:10:50.832056763] [10864] DEBUG SimplePipeline simple.cpp:627 Adding
>> configuration for 2592x1944 in pixel formats [ BG10, pBAA ]
>> [1:10:50.832301449] [10864] DEBUG Camera camera_manager.cpp:159
>> Pipeline handler "simple" matched
>> [1:10:50.832331269] [10864] DEBUG Camera camera_manager.cpp:138 Found
>> registered pipeline handler 'uvcvideo'
>> Available cameras:
>> 1: Internal front camera (\_SB_.PC00.I2C2.CAMF)
>>
>> Please let me know if you need any more information.
>>
>> v/r
>> Kelvin
>>
> 

-- 
Best regards,
Bingbu Cao

