Return-Path: <linux-media+bounces-49905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B913CF3999
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 13:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 199D130C716E
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 12:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E0A32C31B;
	Mon,  5 Jan 2026 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="XQoc8g/m";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Egx/i/cC"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4833BBDF;
	Mon,  5 Jan 2026 12:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616291; cv=none; b=R5GvJgMw//8E8fnMxv+oQgjay/IbByqoxdox0cK/vHWngJ6W9XyYcVkQCVGo//wt2Qy2Iz52wq8hHyGLaOxo23mlu7zKST4PHYW2ryqv2hwL20gHFQ77hL510gpG4IaLoSfQV5cnjfFikS61EeHYYjDc7sm58x/8IUnzlZ9aX+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616291; c=relaxed/simple;
	bh=hDBujZ8c5vd9fX7U5eGmEx24Kwzo+zNHPuEKCmtncK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QvuDrb28Hj1QOzjIbaNtdExnHOg5SRoTVLPAC8GwdNKqd9BG+Cxbnd/CNojzz+zJs1dSLxqWpG1iQQMjkisrsTsl1NUJVKVv818OV4V2RBfdsuqIvNZXmLOP8hsBXcGZmNnAw8tRGGeUNNTulAfmI+YAg6FV99RLEour2cuwq1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=fail (0-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=XQoc8g/m reason="key not found in DNS"; dkim=fail (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Egx/i/cC reason="key not found in DNS"; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 66993EC00D0;
	Mon,  5 Jan 2026 07:31:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 05 Jan 2026 07:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm3; t=1767616287; x=
	1767702687; bh=96kzBMyxnGjJtA477vuij/isxq6eH+gn8fb/DApiWHU=; b=X
	Qoc8g/mXzMAk78/qSg6nO4s/yyss0XOFWGeBhtIzZ5dHJJVWDuIF7OdGtmfqf6Fi
	WKdRDfh+Tji1TwD0nnyfjgDwbf0of6q8eFF1wGpxVpVcKOSBbrWRrLzGE/7ZIENc
	fJcWiKquIFIlMh8OU/kceUaMsi3uEznhG6xjp4lXbdlXwxmBCf47QhuKmLlcWbUz
	h1aasfb5ae6hr1NCOoA5lcemYsq4ourexS6VnrejCfCuaxAfjzR/14D14aEDcaH8
	g2d+iDsYwscSS3orNsC5ifgvg2xwdQ1hg+wjMmzDqSn8/hk9k0PgfYhcGKU5gHL8
	86UbA6Nb713G9+A0ALqAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767616287; x=1767702687; bh=96kzBMyxnGjJtA477vuij/isxq6e
	H+gn8fb/DApiWHU=; b=Egx/i/cCZVPnrdLQonuyFkpw4zMe42v/KNg5PjKyWYEF
	HMWQlxrcP8owfR9S8NB0xXqagt5Zngc1YlE1+7arZgKWtKJtGjgua6o+qKV1/48j
	Qn5pwXs5NXmWMDzldcKmB96L5CPY8nO6cgnCm7AKTRZWKR+MdKQHGuVXfeFKLbxB
	jKI5Y+7eBqaAOsY7nVB17p2GK8b7RKHC7XOls/wRhDG3FvX2pEvhPDZ98zM73FeJ
	h62XE/nWKT33cNymzNtfM5F/TNZaJekMFGGG9B15ZGk80Q+YDuqZG400wBQk45u3
	AOty/oSawNumB1S1KoXvWrQ64sQhCWpN5Fdib3bhZg==
X-ME-Sender: <xms:H69baVmuqWdM-Q49ol9zvQwxOi-uk05CrH-IVyVwQiXuLr9yVZ8n9Q>
    <xme:H69baSZvnbCuOX7Xulidq4neG1Xyd90lFRnbgVdAzCb8gNABl6M3y2w9jvfEvaDHK
    LzGT3Nzw-G89EayBIthCQGrbHU4CzMVdTHSlKjjuwHc9eAtV8EmCg>
X-ME-Received: <xmr:H69baa4Nd1ao6eoeZwiTu4x_Je7XClj8iI9vuugaFNWZRvjvi6VsM5GBmFOj3ZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeljeefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhephggrlhhtvghrucgh
    vghrnhgvrhcuufgthhhnvghiuggvrhcuoegtohhnthgrtghtsehstghhnhifrghlthgvrh
    drvghuqeenucggtffrrghtthgvrhhnpeeiteefudduffdvfeevueeffefhvdfhjeduvedv
    ieelgeeijefhfeetgfefffelveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghonhhtrggt
    thesshgthhhnfigrlhhtvghrrdgvuhdpnhgspghrtghpthhtohepuddupdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhn
    thgvlhdrtghomhdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhise
    hoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgr
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrtghophhordhmohhnug
    hisehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtg
    hhvghhrggssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:H69bacD4YXK1WaIsY5oQLGPusLdsIdXTulxktjPROJTEj0KoOsDY5A>
    <xmx:H69baY93zFPHprAfb3NbpmgW3Cz9vmJQEbPGdqXWccgp_ytjeurmfw>
    <xmx:H69baXHgt-2rlD2NpCi1fxdzwfaNRlJbFbYt7IEM_hVeNPiisyvmSQ>
    <xmx:H69baaQ3DM4rezPnZKe00CIMYdNLRq7PvcZ2wKIRGLMbEPfFxAvxNQ>
    <xmx:H69baRVJE3-SPWGuGuqS_OtYMOjsNasfjIqlHsub3_IhMLFo-z1CioQw>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jan 2026 07:31:25 -0500 (EST)
From: Walter Werner Schneider <contact@schnwalter.eu>
Subject: [PATCH v6 0/2] media: i2c: Add ov2732 image sensor driver
Date: Mon, 05 Jan 2026 14:30:51 +0200
Message-Id: <20260105-ov2732-driver-v6-0-95c1b0b0ba7b@schnwalter.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPuuW2kC/33QwUrEMBDG8VdZcjaSTDJJx5PvIR66ydQGpF2SN
 SpL3910QSi1ePx/ML/D3EThnLiIp9NNZK6ppHlq4R5OIoz99MYyxdYCFKAG7eVcwRuQMafKWQJ
 3HBRGcw4o2s0l85C+7t7La+sxleucv+981ev6K3U7qWqppArMA0GwSrvnEsbps3+/cn7kD7FqF
 f4VoAnD2TvjrI0OwpFgtgLtBdME9BS1RyYgPhLsRgDYC7YJnTUOgZGI1JGAW8HsBWyCsT2uLwX
 Sf4RlWX4At5qtXLYBAAA=
X-Change-ID: 20251217-ov2732-driver-2e8ec05d3bc5
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Walter Werner Schneider <contact@schnwalter.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767616285; l=6198;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=hDBujZ8c5vd9fX7U5eGmEx24Kwzo+zNHPuEKCmtncK4=;
 b=ybPdaA9xjjdss+M8uBXHSquMDGTUTh/mfp0kVdYA1Bepd/XFRxVXWAr+KrmIa2yXHlHJ9jxes
 8V1klG9SDmzBIA3HVcHObzX4wVzC/sFc39zMKQSROvuCXUerppxVF2j
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

$ v4l2-compliance -d /dev/v4l-subdev4
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

P.S.2 Thank you for the reviews.

Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
---
Changes in v6:
- Dropped clock name and OV2732_NUM_SUPPLIES.
- Added 4 more test patterns.
- Use fwnode_graph_get_endpoint_by_id.
- Use pm_runtime_set_suspended instead of pm_runtime_put_noidle.
- Removed redundant error message.
- Reduced max analogue gain value.
- Link to v5: https://lore.kernel.org/r/20251223-ov2732-driver-v5-0-34a53bc52910@schnwalter.eu

Changes in v5:
- Fixed register size for gains.
- Fixed digital gain max value.
- Fixed value set to the exposure register, fixes low brightness.
- Link to v4: https://lore.kernel.org/r/20251222-ov2732-driver-v4-0-843652e59990@schnwalter.eu

Changes in v4:
- Set the pixel rate ops to NULL.
- Link to v3: https://lore.kernel.org/r/20251219-ov2732-driver-v3-0-579d175e929e@schnwalter.eu

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

 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml | 103 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  13 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/ov2732.c                         | 794 +++++++++++++++++++++
 5 files changed, 918 insertions(+)
---
base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce
change-id: 20251217-ov2732-driver-2e8ec05d3bc5

Best regards,
-- 
Walter Werner Schneider <contact@schnwalter.eu>


