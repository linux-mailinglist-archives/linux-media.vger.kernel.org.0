Return-Path: <linux-media+bounces-49079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA16CCD1D9
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 19:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4D04300B5FD
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 18:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFEF287276;
	Thu, 18 Dec 2025 18:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="bTN6Axzs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BO4ITtPq"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC6B1DF75D;
	Thu, 18 Dec 2025 18:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766081756; cv=none; b=tD/u9+EQC7BhfmP3tbgLbQmc8KV1eS/vXFasmiIv2uNnXoTTYcgKHk8qwTiu78xttsdu81yo12VolXhPz2/l6yNlNX0zmDvM4V79WFxEnHj5mPv3qfMjaCea88dkvi96iOTeBdnck+i7w7xo/PYGwC7t5tzbEkFMKiry9VtyYUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766081756; c=relaxed/simple;
	bh=IlSdrFC8+EP9Bx9mmTMmGasm0DLvCT7fW2vn596+myY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YCoizB1uViiCabxowhHK7B0CtU0cjFFJCUTBTLO7Q7kMZNpiCxhkYrPyeEXJ84tEczypkqeLEi84YBlgBNS8WSUnI+tqLhexbaVqi2ianVpFd23R9cwqW6wwryymoXtpueQrnxSw25x1VpvH3Ss11Cj+kU4RelwudTT1VHnbZG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=bTN6Axzs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BO4ITtPq; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 74FBDEC00FD;
	Thu, 18 Dec 2025 13:15:48 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 18 Dec 2025 13:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1766081748; x=
	1766168148; bh=jyIRqmKJ5kwhtbTEN3lRGYbVqQek0MAUWdaBMOiBYEc=; b=b
	TN6AxzsYyO//uSZu+J+ASHHbJ09SWM9vbZUCpycK6kcqpOgIh8peoTJehRwD5duL
	hg4uHtLD50T7rskC7MXZNxNUsjvjXnH6+9bta6HZYQX4wR9JNpLL45j6X9InN471
	ImsOe5wcVrOTSlRt9fP7llDsSFVbVbpqgdRZenSf1QiWgMpgJHPSTQ74geGpun6p
	SeFSD7+HPtcDDj/O+4ApOAmQENx8t6MbTKHyCXjUJu2l4jNjddgHRNuiVvbfOeDS
	PNl0Li0MYQWOm8XHJznKjFfjO2W8tw3FC5u553RILehJM0cScPZHlr6pUQADsnRM
	2jhZIPDsv6XWB/yt+58gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1766081748; x=1766168148; bh=jyIRqmKJ5kwhtbTEN3lRGYbVqQek
	0MAUWdaBMOiBYEc=; b=BO4ITtPqmSwopmI57xDhHgMM8Nc9izkcrButM461sCXF
	VipA1Fg9Er5sQlSyLKzp3Rt1CZJrMWysPx9Z1CaGyQt0sSpQ1SqlRxTWQJvrEYM8
	jrEe+gyWg87B35CDXa0vt/pQOzNFvXAD4viW38lxgVaFVwYcA4i8WZxlga5+a5EJ
	J0gSYDjAEqHDwBHO1Khhx8tQzU7WHvN+73cGoLmaHbuxoeEZzYrtlExhiKI1Z9bC
	NSmABt1+rFvzcJakc20VmjBLqHNwdCNpB4R8vd4o0n5vAx1MrlrLSO9S6VCqMENI
	BSRorodS5qtul6Pe206/BkS6UpZb/k59bI6bY71n8A==
X-ME-Sender: <xms:1EREaZXrstUU5ICMlXhBNP9mwMK0T9RaE9qNiNgkFWGtfo5BTMI2_Q>
    <xme:1EREaRw9pOKyvRpnxMI-vvQ_m7W5mFhuPzMrHwoy42sUozgzDcUo6_jwZZYUvt9sk
    U198TY5LHsVTdyDR9V16Jtmwb75kN-a12nI-V8uR0njX_48mj_ysg>
X-ME-Received: <xmr:1EREaQ_vHza0QAIK4OoswyLkUAwWUiL1ZlXzTSwTBRTj-TNkLFpt_wQLc1LeSOo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegieduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhephggrlhhtvghrucgh
    vghrnhgvrhcuufgthhhnvghiuggvrhcuoegtohhnthgrtghtsehstghhnhifrghlthgvrh
    drvghuqeenucggtffrrghtthgvrhhnpeeiteefudduffdvfeevueeffefhvdfhjeduvedv
    ieelgeeijefhfeetgfefffelveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghonhhtrggt
    thesshgthhhnfigrlhhtvghrrdgvuhdpnhgspghrtghpthhtohepuddtpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrtghophhord
    hmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopegtohhnthgr
    tghtsehstghhnhifrghlthgvrhdrvghupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgvhhgrsgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtgho
    mhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:1EREaW_JrILLPw4ajhnAhYE-1JUqgCD2sXcM-UYaIrPQYpXDndFpxw>
    <xmx:1EREafXBLczrOfG-rAZE78AwNM58TLbC0EqBzZziU0P2rDojB5iXiw>
    <xmx:1EREaTeGfkZ_ACYMOhDQfoyhfskGK9i9dS_2kCxDDdcqHXudh1tnwQ>
    <xmx:1EREaYaq8-weYo55z_Gqqa0JEkzbSPdfKXsTJRHJ4HbNnA_k-EbOZA>
    <xmx:1EREaWDGm1HcQ3EHGbONAbyvDK9uLOODCa2WXlfEdQDirjN7BfpJ5h1n>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 13:15:46 -0500 (EST)
From: Walter Werner Schneider <contact@schnwalter.eu>
Subject: [PATCH v2 0/2] media: i2c: Add ov2732 image sensor driver
Date: Thu, 18 Dec 2025 20:15:33 +0200
Message-Id: <20251218-ov2732-driver-v2-0-fb763644d62c@schnwalter.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMVERGkC/13MQQ6CMBCF4auQWTumHUTQlfcwLLAdZBIDZopVQ
 3p3K4kbl/9L3rdAYBUOcCwWUI4SZBpz0KYAN3TjlVF8biBDlSVb4xSpLgm9SmRF4oadqXx5cRX
 kz125l9fqndvcg4R50vfKR/tdf1LzJ0WLBo1j7g/kdsbuT8EN47O7zaxbfkCbUvoA+BRIna4AA
 AA=
X-Change-ID: 20251217-ov2732-driver-2e8ec05d3bc5
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Walter Werner Schneider <contact@schnwalter.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766081746; l=5025;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=IlSdrFC8+EP9Bx9mmTMmGasm0DLvCT7fW2vn596+myY=;
 b=wQo++9kbL8w2hBra6YyQF3kwOL1NqPry1+o1Fxndf8NOhhCrwCfd3CNsV8tks1bZwqo51jw8Q
 tYDg4znAtgxB8gs8cIsYMnC2VXPxrbxSMnxXbU92zH8moM8fOcs8fc+
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=

This patch series introduces a new driver for the OmniVision OV2732 image
sensor.

The driver was written from scratch using modern V4L2 APIs, taking
inspiration from existing camera sensor drivers like the Sony IMX219 and
with help from the libcamera folks on IRC.

This initial version provides basic support for the sensor, future patches
will add additional features.

I'm new to all this, so feel free to point out anything that can be
improved.

```

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev4:

Driver Info:
        Driver version   : 6.18.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000002
interval-uses-which 
Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev4 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 14 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev4: 45, Succeeded: 45, Failed: 0, Warnings: 0
```

P.S. I only tried this as an out-of-tree module against the 6.18.0 kernel in
a Yocto project, I'm not sure how to test it against 6.19-rc1. But I did
compile it with 6.19-rc1 and ran dt_binding_check and checkpatch.

Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
---
Changes in v2:
- Adjusted delays in power up, power down and start of stream. Only a
  single 10ms sleep remains, looks like I've read the datasheet wrong.
- The intermittent communication errors are solved by a single 1ms sleep
  in the right place.
- Added missing format values in ov2732_init_state.
- Set default GPIO pin state in ov2732_probe.
- Other small changes: comments, name capitalization, removed unused.
  variables.
- Link to v1: https://lore.kernel.org/r/20251218-ov2732-driver-v1-0-0ceef92c4016@schnwalter.eu

---
Walter Werner Schneider (2):
      dt-bindings: media: i2c: Add ov2732 image sensor
      media: i2c: Add ov2732 image sensor driver

 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml | 111 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  13 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/ov2732.c                         | 797 +++++++++++++++++++++
 5 files changed, 929 insertions(+)
---
base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce
change-id: 20251217-ov2732-driver-2e8ec05d3bc5

Best regards,
-- 
Walter Werner Schneider <contact@schnwalter.eu>


