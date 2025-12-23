Return-Path: <linux-media+bounces-49420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7405ACD9961
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 15:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C55BA30B423C
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 14:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BC431986F;
	Tue, 23 Dec 2025 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="Wsmjem/M";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i2jJ7P10"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FFF3168FB;
	Tue, 23 Dec 2025 14:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766499108; cv=none; b=M4uL0VI0CBwbiBfBacNtxtEPwZi3TGzxIMq5Ap2NI4VTThDuXWE3lewj70vV89yFZYaur92wpE0zExHHzBKEwJ+kPPhTOEMuan+WyMSjQOPk5Al/g9xmxMlByOgYjNv1JdJZCbQBOPiYLkS4n9+gBE+lrgbGjxzESacQjnpIgMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766499108; c=relaxed/simple;
	bh=brDt1uSwXU/oK9a2nhJelYrhzyqeUTYL22yb1EI3wG8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gC6sR/m3zpr9+u0KPoASPIZscsFa85i8poYYB95fTwFmOgguRi0BMNrhPgB1fv809R2phJ7sXksL3pm8VlDJycO9uQUmW8wkVKiuqpCHsbhOXFiUa7Okl6j+izeiJaw6PwO5cEvzbnyQEq32bpsVoETmyqml4VJDbC5bHzSGKKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=Wsmjem/M; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i2jJ7P10; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E93291400082;
	Tue, 23 Dec 2025 09:11:44 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 23 Dec 2025 09:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1766499104; x=
	1766585504; bh=Zj4qBp1eALUPWPjGjFiCPJ8w2tniEguSSQ4F+ctxWIc=; b=W
	smjem/M+07MPh/TX0kY6xWHTUY83SZJEKSx6gpKWyMmqwvhZ5sDolnXsxk8u8jdl
	ErOrIzziAVoCtjLjCoVkT4E7/vU1Yi7qLRTV9MFzVC+bSKyZupPNRxxCqR1hQOn/
	0B/CPWqoArIUlWAT5ZivqWtITM6BCljC/eGJfnAc/4eDJCwV1o3Hwxx7kye0h1gx
	gl9yYEjBuihDPy8ibzw+4Ucwevif82yBm/yfLfNe1BY7QsJPafhXAbltnRRXwl4Z
	3bGm4WA2iw6TQ5LGXkxYMQoCTfEUlPdR1BD7d9IKfB1PkwUHZQqvzYHlJLnkm2Ew
	kCrbCOyvtTRQZI1quiUKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1766499104; x=1766585504; bh=Zj4qBp1eALUPWPjGjFiCPJ8w2tni
	EguSSQ4F+ctxWIc=; b=i2jJ7P10dxzEXcWKO9ylEHyreQPLdTIsrgce0Inpm3G7
	ERqEvRqRP1nQYVm9GaudAbjYTHRQGwJl8cH/et9kbdFgI7n9ckBqQtTZoNPC8Vst
	qchgozc1Rc+fCkqfHmD3YQwTpEqPPlzvcGaoFdT1Vu4/I9SigDqpw/YJIOdN5QVv
	Bwy315LAvjsJj6461YzBHlC0HUjRfEGs6e9XBI/q8FTALz5th9QPrPhULStwtnco
	dcinWdk27Q4Z4Aj7hFREkLJHg/jxV1iWOPWTRg8G7l8QLulMixvgBtnf74bi54k7
	h9YVTVkk/tLBedER4p30oPZ37azq4anKBCRvaSxgvA==
X-ME-Sender: <xms:IKNKabCsdE-QrvizzcdkgRSLbDaBCtJc32vWj7pbiVm_y21JjFEU5g>
    <xme:IKNKaTHkwawf_qbFolInnKNwYlzjWM-kNX5mpUrHMb9I6Z9YcsXvcGdI7RwkZoaUs
    RqhNDQKW5QvlmdM3jDZ6Y3SJ9XjUjCcXARyG-mm8iddxiTolFjBdA>
X-ME-Received: <xmr:IKNKaV3FSOOOXCj19F7vMMxByAF61BQ7tiPhDm9gsLUy8GA4WXGm_PY6xwmn0yE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhephggrlhhtvghrucgh
    vghrnhgvrhcuufgthhhnvghiuggvrhcuoegtohhnthgrtghtsehstghhnhifrghlthgvrh
    drvghuqeenucggtffrrghtthgvrhhnpeeiteefudduffdvfeevueeffefhvdfhjeduvedv
    ieelgeeijefhfeetgfefffelveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghonhhtrggt
    thesshgthhhnfigrlhhtvghrrdgvuhdpnhgspghrtghpthhtohepuddupdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgs
    ohgrrhgurdgtohhmpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkih
    esohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughi
    rgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghhrggssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdo
    ughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IKNKaUNoCOpx7-MjsYItUl-iBDNewzVDJ8Zoao5XMa2OS6DDWLXkNA>
    <xmx:IKNKaVaknTQFcyc4kQBSGJGretF0rftE3_RnKby6bHmpMCarbnDEXg>
    <xmx:IKNKaSy7dm4eIlmI9kcZyBtwJgmKsHtMlpkhcoEBUDi3sRUk8nrEXA>
    <xmx:IKNKaUNbN-ZEn651fS-cD1Cu6Ujw8bfA2fxQB91xpK4vX87-ZiK8PA>
    <xmx:IKNKaYgLpVVqArOFWKOsJYFwoJPopW4vRipNrmZiuEter66qns9UFvIo>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Dec 2025 09:11:42 -0500 (EST)
From: Walter Werner Schneider <contact@schnwalter.eu>
Subject: [PATCH v5 0/2] media: i2c: Add ov2732 image sensor driver
Date: Tue, 23 Dec 2025 16:10:59 +0200
Message-Id: <20251223-ov2732-driver-v5-0-34a53bc52910@schnwalter.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPOiSmkC/33MSwrCMBSF4a2UjI0kN6/GkfsQBza5tQFpJalRk
 e7dVBCkFIf/gfO9SMIYMJFd9SIRc0hh6EuoTUVcd+rPSIMvTYCB4sANHTIYAdTHkDFSwBodU14
 0TpHyuUZsw+PjHY6lu5DGIT4/fObz+pXqhZQ5ZZQ5xNaCk4zrfXJdfz9dRoxbvJFZy/BXgCK0j
 dFCS+k1uDVB/Ap2KYgiKGM9NwotWFwT5I8AsBRkEWoptAJU1lq2FKZpegOSt0xHdAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766499102; l=5790;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=brDt1uSwXU/oK9a2nhJelYrhzyqeUTYL22yb1EI3wG8=;
 b=tE/lUPdALjQMYDsEJL4ujuvABO+6kLooUD/Zl7Dze7WmG85lpDw7wEaHm2TaU1gLSJNAPtTby
 vku2bcSYNdNAD/A1GkyGRaE0qEQkmoLpzyJLQmKlvZwc9bI2/r2QUm1
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

 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml | 108 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  13 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/ov2732.c                         | 788 +++++++++++++++++++++
 5 files changed, 917 insertions(+)
---
base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce
change-id: 20251217-ov2732-driver-2e8ec05d3bc5

Best regards,
-- 
Walter Werner Schneider <contact@schnwalter.eu>


