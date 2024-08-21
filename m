Return-Path: <linux-media+bounces-16548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66593959208
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 03:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2C9528525C
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 01:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AE21C6B5;
	Wed, 21 Aug 2024 01:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuINNNkC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFE014295
	for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 01:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724202446; cv=none; b=c0XWb2Q5TCdZ+nB5AbwdeA+rQqO4AJSzaREDLqjh/TiXDRkBP4Y8Av5DhfVoAlveVuVz9rhwayb96Dgtn1h3nDUCPkW7JM1Vg2uAy6oKFcGbg54SLSne8mQeXzPgg7uD939Cm30ml7PAwfR3TR0x2ZQGy68WpSP3EC2RSfmb38k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724202446; c=relaxed/simple;
	bh=3QF7clO/wm4lVEbZ4xGICANwuLVD9KxumgAbZbYM8N8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1OcJke8vBo2+qbZRHS1SI1VGJv8mmNQqoS5v+jcOIdZU/BwXQxStJ8+g1oFvWhfYimsFqZmQFuOTUi/qGmVnRxbQ/7CuHSEeHjBmwiFD/GQ36x6Kp77Hkgr1A3OxqTWVsZXgP37/y7LVNW47DWuqUp9bLyYWEe1ukpyLb+XRP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuINNNkC; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5becd359800so5113817a12.0
        for <linux-media@vger.kernel.org>; Tue, 20 Aug 2024 18:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724202443; x=1724807243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJQdnkyJ/De9E6i0b8MLZJp84zbCdmuE+LcsxYZQ9/s=;
        b=DuINNNkCZ/BiKv76SKgtVOrNDU8EfK02fcZUqCV5zGTg5wtzJNPqz/iPKPFs4Abial
         A98LRB2CdTMh3ffeoo1W+xg4eVJnYANjPU6R3wHNnZf5btQRcfl5BPzLkJqK0OFAfcCN
         f33lA1OmPpsmnXiYIRs0y6am2Wwwttd2dGdSticwzF6/QOBMEy2yPhOwEptWYX3yTdeK
         7FOcujaAfkRSWD0wFgabya3EgcmM7WqYaIch4prtKtAdcytzVQlBpcBmstWrYtr8kwR9
         Bp3tqc5gNzX3m3D1rbgfnNvf7RTAGmT+bo72UNnQAzs1iUg/I9xRb/m5bkGYdpNtjSRB
         zofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724202443; x=1724807243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJQdnkyJ/De9E6i0b8MLZJp84zbCdmuE+LcsxYZQ9/s=;
        b=dJxsYnaVRp8TcZM95WI7HBQ6YtNi9gGVBLGZ+ZjyblSIw25rf0Jn/2emuCcU38QMEY
         mFXRi1/rBH0y+LP7IWCBJO3B0Y+R3bifwIfWabxPqTab9YdA185s8EbHC7qZqqaoKthM
         Yiuci0ZrVJCrC4PCdCgjaeBPIfTbW2uPYQTOt+YCKSCuffn5pb8gYtDL3PDLWOl/pxFR
         cVxWDDTo70TisEO9JHx4xRrUD5Zlgzlmu0Hr0SGyci9AxF4h+ERbNwMVopVWdqDIf0Bs
         shTD1z+btwdanFhKMTMmaY+SmphK4m64dIR3+3Y1gx/Yltt1JfaJLVac6MnLTzVpeVxS
         7+Wg==
X-Gm-Message-State: AOJu0YxJBTuIk3Yxnd6CIgUZPsU8bJdTAuOe4doIxfQXUXNCpivV2l8f
	vtwngw8zQPpLCPFBdjRe4O+C4m5gNll7Xef7H5kcDmlWIPInfjEsWVgJDcMm7DgMSseazyHnome
	zYiXKwsPZaTPwpPRK6saq8/uJtng=
X-Google-Smtp-Source: AGHT+IGeWN1YqyDmFgzAoZVUFqrv4MWiA3ba+YF4f8aSs58WaXvP7ilV+AHY4BdPYnqR50wtmGVwZq3wB4GjuzC/Xag=
X-Received: by 2002:a05:6402:3886:b0:5be:fe26:daac with SMTP id
 4fb4d7f45d1cf-5bf1f15cd20mr293601a12.17.1724202442884; Tue, 20 Aug 2024
 18:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAC-GLBmTxCLVvm89vX6XYwpJOTkFeLSjASc2qy7DwySRcS8Hyw@mail.gmail.com>
 <97587b3a-1ea2-2569-a116-d762b144ea01@linux.intel.com> <5ffbe1b6-c795-834b-5a6b-85468b22c0c2@linux.intel.com>
In-Reply-To: <5ffbe1b6-c795-834b-5a6b-85468b22c0c2@linux.intel.com>
From: Kelvin Miller <uavtech2002@gmail.com>
Date: Tue, 20 Aug 2024 21:07:14 -0400
Message-ID: <CAC-GLB=SVTN9FCuDA=yHm0wpLMKRWET=5UtEX5VV5hfx3njbXw@mail.gmail.com>
Subject: Re: IPU6 Camera Video Output Upside Down
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com, 
	laurent.pinchart@ideasonboard.com, arnd@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cao,

It's just Kelvin.

I couldn't find/read your comments. Do you need anything from me?

v/r
Kelvin

On Mon, Aug 19, 2024 at 11:08=E2=80=AFPM Bingbu Cao <bingbu.cao@linux.intel=
.com> wrote:
>
> Miller,
>
> On 8/20/24 8:35 AM, Bingbu Cao wrote:
> > Miller,
> >
> > On 8/18/24 8:00 AM, Kelvin Miller wrote:
> >> All,
> >>
> >> I don't know who to direct this to, so I added the names of
> >> individuals working on intel_ipu6 related patches.
> >>
> >> I'm running the 6.10.5-arch1-1 and 6.10.5-arch1-1-surface kernels on a
> >> Microsoft Surface Pro 8 in EndeavourOS. The Surface Pro 8 has the
> >> ov5693 (front) and ov13858 (rear) sensors. Only the front sensor is
> >> recognized by libcamera. In all of the camera applications that I used
> >> (cheese, kamoso, and qcam) the video is inverted (upside down). It was
> >> recommended on the Surface Linux Github page
> >> (https://github.com/linux-surface/linux-surface/discussions/1354#discu=
ssioncomment-10367513)
> >> that I report this issue here.
>
> I replied some comments in this issue.
>
> >>
> >> Here are some outputs:
> >>
> >> $ v4l2-ctl -l -d $(media-ctl -d /dev/media0 -e 'ov5693 2-0036')
> >>
> >> User Controls
> >>
> >>                       exposure 0x00980911 (int)    : min=3D1 max=3D103=
0
> >> step=3D1 default=3D1030 value=3D1030
> >>                horizontal_flip 0x00980914 (bool)   : default=3D0 value=
=3D0
> >>                  vertical_flip 0x00980915 (bool)   : default=3D0 value=
=3D0
> >>
> >> Camera Controls
> >>
> >>             camera_orientation 0x009a0922 (menu)   : min=3D0 max=3D2
> >> default=3D0 value=3D0 (Front) flags=3Dread-only
> >>         camera_sensor_rotation 0x009a0923 (int)    : min=3D0 max=3D0
> >> step=3D1 default=3D0 value=3D0 flags=3Dread-only
> >>
> >> Image Source Controls
> >>
> >>              vertical_blanking 0x009e0901 (int)    : min=3D4 max=3D645=
63
> >> step=3D1 default=3D66 value=3D66
> >>            horizontal_blanking 0x009e0902 (int)    : min=3D1392 max=3D=
1392
> >> step=3D1 default=3D1392 value=3D1392 flags=3Dread-only
> >>                  analogue_gain 0x009e0903 (int)    : min=3D1 max=3D127
> >> step=3D1 default=3D8 value=3D127
> >>
> >> Image Processing Controls
> >>
> >>                 link_frequency 0x009f0901 (intmenu): min=3D0 max=3D0
> >> default=3D0 value=3D0 (419200000 0x18fc7c00) flags=3Dread-only
> >>                     pixel_rate 0x009f0902 (int64)  : min=3D0
> >> max=3D167680000 step=3D1 default=3D167680000 value=3D167680000 flags=
=3Dread-only
> >>                   test_pattern 0x009f0903 (menu)   : min=3D0 max=3D3
> >> default=3D0 value=3D0 (Disabled)
> >>                   digital_gain 0x009f0905 (int)    : min=3D1 max=3D409=
5
> >> step=3D1 default=3D1024 value=3D1024
> >>
> >> $ lsmod | grep ipu
> >> intel_ipu6_isys       143360  6
> >> videobuf2_dma_contig    28672  2 intel_ipu6_isys
> >> videobuf2_v4l2         40960  1 intel_ipu6_isys
> >> videobuf2_common       94208  4
> >> videobuf2_dma_contig,videobuf2_v4l2,intel_ipu6_isys,videobuf2_memops
> >> v4l2_fwnode            32768  8 ov5693,intel_ipu6_isys,ov13858
> >> v4l2_async             32768  4 v4l2_fwnode,ov5693,intel_ipu6_isys,ov1=
3858
> >> videodev              393216  15
> >> v4l2_async,v4l2_fwnode,videobuf2_v4l2,ov5693,v4l2loopback,intel_ipu6_i=
sys,ov13858
> >> mc                     90112  9
> >> v4l2_async,videodev,videobuf2_v4l2,ov5693,intel_ipu6_isys,ov13858,vide=
obuf2_common
> >> intel_ipu6             86016  7 intel_ipu6_isys
> >> ipu_bridge             24576  2 intel_ipu6,intel_ipu6_isys
> >>
> >> $ LIBCAMERA_LOG_LEVELS=3D0 cam --list
> >> [1:10:50.807754803] [10863] DEBUG IPAModule ipa_module.cpp:334
> >> ipa_ipu3.so: IPA module /usr/lib/libcamera/ipa_ipu3.so is signed
> >> [1:10:50.807872559] [10863] DEBUG IPAManager ipa_manager.cpp:235
> >> Loaded IPA module '/usr/lib/libcamera/ipa_ipu3.so'
> >> [1:10:50.807962280] [10863] DEBUG IPAModule ipa_module.cpp:334
> >> ipa_soft_simple.so: IPA module /usr/lib/libcamera/ipa_soft_simple.so
> >> is signe
> >> d
> >> [1:10:50.807980265] [10863] DEBUG IPAManager ipa_manager.cpp:235
> >> Loaded IPA module '/usr/lib/libcamera/ipa_soft_simple.so'
> >> [1:10:50.808012629] [10863] DEBUG IPAModule ipa_module.cpp:334
> >> ipa_vimc.so: IPA module /usr/lib/libcamera/ipa_vimc.so is signed
> >> [1:10:50.808025804] [10863] DEBUG IPAManager ipa_manager.cpp:235
> >> Loaded IPA module '/usr/lib/libcamera/ipa_vimc.so'
> >> [1:10:50.808050072] [10863] ERROR IPAModule ipa_module.cpp:172 Symbol
> >> ipaModuleInfo not found
> >> [1:10:50.808057333] [10863] ERROR IPAModule ipa_module.cpp:292
> >> v4l2-compat.so: IPA module has no valid info
> >> [1:10:50.808131102] [10863]  INFO Camera camera_manager.cpp:325
> >> libcamera v0.3.1+64-ce690bd9-dirty (2024-08-17T16:17:18EDT)
> >> [1:10:50.808343190] [10864] DEBUG Camera camera_manager.cpp:73
> >> Starting camera manager
> >> [1:10:50.821605192] [10864] DEBUG DeviceEnumerator
> >> device_enumerator.cpp:230 New media device "intel-ipu6" created from
> >> /dev/media0
> >> [1:10:50.824319260] [10864] DEBUG DeviceEnumerator
> >> device_enumerator_udev.cpp:96 Defer media device /dev/media0 due to 1
> >> missing dependencie
> >> s
> >> [1:10:50.824612021] [10864] DEBUG DeviceEnumerator
> >> device_enumerator_udev.cpp:322 All dependencies for media device
> >> /dev/media0 found
> >> [1:10:50.824624081] [10864] DEBUG DeviceEnumerator
> >> device_enumerator.cpp:258 Added device /dev/media0: intel-ipu6
> >> [1:10:50.825560945] [10864] DEBUG Camera camera_manager.cpp:138 Found
> >> registered pipeline handler 'ipu3'
> >> [1:10:50.825858267] [10864] DEBUG Camera camera_manager.cpp:138 Found
> >> registered pipeline handler 'simple'
> >> [1:10:50.825960032] [10864] DEBUG DeviceEnumerator
> >> device_enumerator.cpp:318 Successful match for media device
> >> "intel-ipu6"
> >> [1:10:50.826073453] [10864] DEBUG SimplePipeline simple.cpp:1554
> >> Sensor found for /dev/media0
> >> [1:10:50.826578250] [10864] DEBUG SimplePipeline simple.cpp:417 Found
> >> capture device Intel IPU6 ISYS Capture 32
> >> [1:10:50.826673664] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Exposure (0x00980911)
> >> [1:10:50.826807959] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Horizontal Flip (0x00980914)
> >> [1:10:50.826837706] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Vertical Flip (0x00980915)
> >> [1:10:50.826855790] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Camera Orientation (0x009a0922)
> >> [1:10:50.826903725] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Camera Sensor Rotation (0x009a0923)
> >> [1:10:50.826923461] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Vertical Blanking (0x009e0901)
> >> [1:10:50.826936999] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Horizontal Blanking (0x009e0902)
> >> [1:10:50.826951952] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Analogue Gain (0x009e0903)
> >> [1:10:50.826966185] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Link Frequency (0x009f0901)
> >> [1:10:50.826983040] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Pixel Rate (0x009f0902)
> >> [1:10:50.826997454] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Test Pattern (0x009f0903)
> >> [1:10:50.827015198] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Digital Gain (0x009f0905)
> >> [1:10:50.828490135] [10864] DEBUG CameraSensor camera_sensor.cpp:431
> >> 'ov5693 2-0036': Test pattern mode 1 ignored
> >> [1:10:50.828508710] [10864] DEBUG CameraSensor camera_sensor.cpp:431
> >> 'ov5693 2-0036': Test pattern mode 3 ignored
> >> [1:10:50.828545992] [10864] DEBUG CameraSensor camera_sensor.cpp:1187
> >> 'ov5693 2-0036': Apply test pattern mode 0
> >> [1:10:50.828573532] [10864] DEBUG SimplePipeline simple.cpp:487 Found
> >> pipeline: [ov5693 2-0036|0] -> [0|Intel IPU6 CSI2 4|1] -> [0|Intel IPU
> >> 6 ISYS Capture 32]
> >> [1:10:50.828701911] [10864] DEBUG V4L2 v4l2_videodevice.cpp:632
> >> /dev/video32[14:cap]: Opened device : isys: ipu6
> >> [1:10:50.828871825] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Exposure (0x00980911)
> >> [1:10:50.828899010] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Horizontal Flip (0x00980914)
> >> [1:10:50.828914160] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Vertical Flip (0x00980915)
> >> [1:10:50.828928349] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Camera Orientation (0x009a0922)
> >> [1:10:50.828947214] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Camera Sensor Rotation (0x009a0923)
> >> [1:10:50.828961230] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Vertical Blanking (0x009e0901)
> >> [1:10:50.828974089] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Horizontal Blanking (0x009e0902)
> >> [1:10:50.828986298] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Analogue Gain (0x009e0903)
> >> [1:10:50.828998654] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Link Frequency (0x009f0901)
> >> [1:10:50.829014321] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Pixel Rate (0x009f0902)
> >> [1:10:50.829027065] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Test Pattern (0x009f0903)
> >> [1:10:50.829043099] [10864] DEBUG V4L2 v4l2_device.cpp:636 'ov5693
> >> 2-0036': Control: Digital Gain (0x009f0905)
> >> [1:10:50.829102862] [10864] DEBUG DmaBufAllocator
> >> dma_buf_allocator.cpp:103 Failed to open /dev/dma_heap/linux,cma:
> >> Permission denied
> >> [1:10:50.829116555] [10864] DEBUG DmaBufAllocator
> >> dma_buf_allocator.cpp:103 Failed to open /dev/dma_heap/reserved:
> >> Permission denied
> >> [1:10:50.829124690] [10864] DEBUG DmaBufAllocator
> >> dma_buf_allocator.cpp:103 Failed to open /dev/dma_heap/system:
> >> Permission denied
> >> [1:10:50.829137432] [10864] DEBUG DmaBufAllocator
> >> dma_buf_allocator.cpp:109 Using /dev/udmabuf
> >> [1:10:50.830824251] [10864] DEBUG IPAManager ipa_manager.cpp:306 IPA
> >> module /usr/lib/libcamera/ipa_soft_simple.so signature is valid
> >> [1:10:50.830945293] [10864] DEBUG IPAProxy soft_ipa_proxy.cpp:45
> >> initializing soft proxy: loading IPA from
> >> /usr/lib/libcamera/ipa_soft_simpl
> >> e.so
> >> [1:10:50.831350571] [10864]  WARN IPAProxy ipa_proxy.cpp:161
> >> Configuration file 'ov5693.yaml' not found for IPA module 'simple',
> >> falling bac
> >> k to 'uncalibrated.yaml'
> >> [1:10:50.831585810] [10864] DEBUG IPASoft soft_simple.cpp:135 Tuning
> >> file version 1
> >> [1:10:50.831695682] [10864] DEBUG MediaDevice media_device.cpp:830
> >> /dev/media0[intel-ipu6]: Intel IPU6 CSI2 4[1] -> Intel IPU6 ISYS
> >> Capture
> >> 32[0]: 0
> >> [1:10:50.831706917] [10864] DEBUG MediaDevice media_device.cpp:830
> >> /dev/media0[intel-ipu6]: Intel IPU6 CSI2 4[1] -> Intel IPU6 ISYS
> >> Capture
> >> 32[0]: 1
> >> [1:10:50.831829423] [10864] DEBUG SimplePipeline simple.cpp:776 Link
> >> 'ov5693 2-0036':0 -> 'Intel IPU6 CSI2 4':0 configured with format
> >> 1296x
> >> 972-SBGGR10_1X10
> >> [1:10:50.831850084] [10864] DEBUG SimplePipeline simple.cpp:776 Link
> >> 'Intel IPU6 CSI2 4':1 -> 'Intel IPU6 ISYS Capture 32':0 configured
> >> with
> >> format 1296x972-SBGGR10_1X10
> >> [1:10:50.831916492] [10864] DEBUG SimplePipeline simple.cpp:627 Adding
> >> configuration for 1296x972 in pixel formats [ BG10, pBAA ]
> >> [1:10:50.832031091] [10864] DEBUG SimplePipeline simple.cpp:776 Link
> >> 'ov5693 2-0036':0 -> 'Intel IPU6 CSI2 4':0 configured with format
> >> 2592x
> >> 1944-SBGGR10_1X10
> >> [1:10:50.832040698] [10864] DEBUG SimplePipeline simple.cpp:776 Link
> >> 'Intel IPU6 CSI2 4':1 -> 'Intel IPU6 ISYS Capture 32':0 configured
> >> with
> >> format 2592x1944-SBGGR10_1X10
> >> [1:10:50.832056763] [10864] DEBUG SimplePipeline simple.cpp:627 Adding
> >> configuration for 2592x1944 in pixel formats [ BG10, pBAA ]
> >> [1:10:50.832301449] [10864] DEBUG Camera camera_manager.cpp:159
> >> Pipeline handler "simple" matched
> >> [1:10:50.832331269] [10864] DEBUG Camera camera_manager.cpp:138 Found
> >> registered pipeline handler 'uvcvideo'
> >> Available cameras:
> >> 1: Internal front camera (\_SB_.PC00.I2C2.CAMF)
> >>
> >> Please let me know if you need any more information.
> >>
> >> v/r
> >> Kelvin
> >>
> >
>
> --
> Best regards,
> Bingbu Cao

