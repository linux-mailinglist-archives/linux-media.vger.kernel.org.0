Return-Path: <linux-media+bounces-49180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCE5CD037A
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6D16304D497
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 14:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9129A327BF5;
	Fri, 19 Dec 2025 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="TtPgvYu2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="q1XRd9cE"
X-Original-To: linux-media@vger.kernel.org
Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41C426CE2C;
	Fri, 19 Dec 2025 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766153422; cv=none; b=GHPYSUcEuNASy4m9fU4yaJNiwxPF7NhHi0oxzzdnKIius8K/5aSKOUEuRs6t/ryY/L+JucdPvoI4sHXXNxpaX4AEDZ3rbL13wO5akzEVT5b610PEMLl0rawE9bDooRftNHFQnPMT9GECOy3aWXbFf/qkC+jK94jwSMdv+DsfGJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766153422; c=relaxed/simple;
	bh=tiYUY0BguT1Uj9ZmpFK1OrCOijuZ1ZWVEj/jOV3n8lw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YOMVe3WuOS0kvXbnn45oKd6EKMmtkSJmsHPujLbI17+cl2ERyIWtryZnGd/Ka2fR8hI7vQ4Vhzz50IXjbDGnNNyN79W5GOQJMIEYZs/yLcHFe+z5S0Same4mCRsQODzyio+tb4hcjQqENUY9T4WpkSQU12z93YHeYtlYGRI/kn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=TtPgvYu2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=q1XRd9cE; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 8E55F1380104;
	Fri, 19 Dec 2025 09:08:28 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 19 Dec 2025 09:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1766153308; x=
	1766160508; bh=koYLabjQOrhDbXlPsvIb4+RxqrircKynM1lOeT4TWD4=; b=T
	tPgvYu2BLVgHlVKVReJ7QG6VzoiwUDcjyecFnHhuIQjy4KKcg71zjTVCpOw2sPmd
	Tr3/sEo4p1q7ZHe8RMTSDprIokqg9WUaCXqC4RVij89vl7LcvdG1Z4RvC42h1HVy
	6R32L7UZCe/EKyfo9CcJ0/71YUZyzQtIbpXaG6gAa7jICPmxWbgXO0L8h7IElvJD
	aRE3agdlkPzK9VDaL1PA7sLTrNX3PFJY/LQDJZ2QdXiHTDt7R3a0sIgwSkGZ1FEc
	HGYTm2cTA93+Y8L26sUvct5R+Lmxdq7eTvAyAMY8KrX515JUY8fYQAwlqQsDW66h
	QL+AmDTrYNYJXkpB//hDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1766153308; x=1766160508; bh=koYLabjQOrhDbXlPsvIb4+Rxqrir
	cKynM1lOeT4TWD4=; b=q1XRd9cEs0zx+2b0Oa98TpUjJ26yXXiKVhYpjzGBdwiL
	jzgonEk0zebpZ+bcgmKrpplQx8Twf/p4rDBRO+70NCFLzf8ZpBqC9HzBkqbAbc2S
	4HmolWReXwozI1cl9tRo62aK9jY/AmX9F2PBl6Z7aS5uP1tKjPPDlixXUIb3f0ua
	OBsfqr4o1D0hFfhIZIgiLmJe1Rf+rRf0eBN/D0QDy7BWd11DGUhsnFhIpURr6bSn
	3+WnNyma11SB+O3xNCqiNu0c9ylZJ2gj1sSyF3oYmGw+WyN8tlzj9XALkJaoyHLq
	f3hO/hUOtG94yIMucWzpq/ESN57YgbAXo/EzPv9dPw==
X-ME-Sender: <xms:XFxFaYdNwYb6uJxvW66lGpmnVhY16D_TueHfoe6qvxi1CgWYjsN-2A>
    <xme:XFxFaSZd21g2zDq-CGyHFl44tNo_Fx9h0HxckVw0CySPZXV12v7nHRVWFAKyz3NvK
    EcV57KrXuLcjwD4yxAqSzhqyV-KeDGGb4-Iu4wP6LxFNibtLpXTrg>
X-ME-Received: <xmr:XFxFaVGPmUd2lTNCKZZLRi4Aqg240j5Gt5BidIt2R7Zc003jmmIONatLLSAwE6s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegkeehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecurfhhihhshhhinhhgqdfkkffrpghrthculdeitdejmdenuc
    fjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhephggrlhhtvghr
    ucghvghrnhgvrhcuufgthhhnvghiuggvrhcuoegtohhnthgrtghtsehstghhnhifrghlth
    gvrhdrvghuqeenucggtffrrghtthgvrhhnpeeiteefudduffdvfeevueeffefhvdfhjedu
    vedvieelgeeijefhfeetgfefffelveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghonhht
    rggtthesshgthhhnfigrlhhtvghrrdgvuhdpnhgspghrtghpthhtohepuddtpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopegtohhnthgrtghtsehstghhnhifrghlthgvrhdr
    vghupdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvg
    hvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhn
    ohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtgho
    mhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtg
    homh
X-ME-Proxy: <xmx:XFxFaYlRSTJ70gPi80xGtWJLlSfPTfCFvoRzA9TRHDX2Q9sSAn6-lQ>
    <xmx:XFxFaQcREzifWzqu_ufLv6bDvL5MZW_XUZ0LQzGAAZLb574ntN-jhw>
    <xmx:XFxFaeFcw7wtR-abLxTi8N4zp57t69qSUkV_IqC450FB0LhwkMwemA>
    <xmx:XFxFaejM13ECcZ84I5Ik2qoAnF7LOJCLOlEfj1xWkGa1WSCfJVemwA>
    <xmx:XFxFaer_QqB9cPboirgXz3JvdrYIqrkPVmS6t-fzdsVmffGx_1E9Zn8N>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Dec 2025 09:08:26 -0500 (EST)
From: Walter Werner Schneider <contact@schnwalter.eu>
Subject: [PATCH v3 0/2] media: i2c: Add ov2732 image sensor driver
Date: Fri, 19 Dec 2025 16:08:07 +0200
Message-Id: <20251219-ov2732-driver-v3-0-579d175e929e@schnwalter.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdcRWkC/33MQQ6CMBCF4auQWVvTTqGgK+9hXEA7yCQGSItVQ
 7i7hcQNC5f/S943QyDPFOCczeApcuChT6EPGdiu7u8k2KUGlFgoVKUYIpYahfMcyQukiqwsnG5
 sAekzemr5vXnXW+qOwzT4z8ZHta4/qdpJUQkppCVqT2hzqcwl2K5/1Y+J/JGesGoR/wqYhLYpj
 TZ57gzavbAsyxcvpgPK8AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766153306; l=5393;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=tiYUY0BguT1Uj9ZmpFK1OrCOijuZ1ZWVEj/jOV3n8lw=;
 b=Wry85EdsWDRnBUH/XNIHDmSBTSPKUNb+/uWAywtBNvHgMw7FI/1Ya3qIFzHKSmcpNrdBzuroY
 tkeMvMAeHPkC+xX1o69GEWeRUvPkVoIv051dtsJhLjyzDp2gsWokCG6
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

P.S. I only tried this as an out-of-tree module against the 6.18.0 kernel in
a Yocto project, I'm not sure how to test it against 6.19-rc1. But I did
compile it with 6.19-rc1 and ran dt_binding_check and checkpatch.

P.S.2 Thanks you for the reviews.

Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
---
Changes in v3:
- Cleanup state of GPIO.
- Renamed pwdn GPIO to powerdown.
- Removed unused format variable from ov2732_set_fmt.
- Removed properties from DT bindings.
- Replaced the two 1ms delays with a doubling of the 8192 cycles delay.
- Link to v2: https://lore.kernel.org/r/20251218-ov2732-driver-v2-0-fb763644d62c@schnwalter.eu

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

 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml | 108 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  13 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/ov2732.c                         | 787 +++++++++++++++++++++
 5 files changed, 916 insertions(+)
---
base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce
change-id: 20251217-ov2732-driver-2e8ec05d3bc5

Best regards,
-- 
Walter Werner Schneider <contact@schnwalter.eu>


