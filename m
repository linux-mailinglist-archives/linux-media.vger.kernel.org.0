Return-Path: <linux-media+bounces-49356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C12B8CD663D
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 15:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EBF393002D2D
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 14:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC3F3002A9;
	Mon, 22 Dec 2025 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="HQObk5Sc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QSmd6o8B"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD9826E706;
	Mon, 22 Dec 2025 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414285; cv=none; b=Aj/s0tYzf4UGtSiNWCxkiwxSpIFlDORYmTNlg6UHd0KIRFSVItm2cRqpiYXO0WT9CQNBk/BWqTwpYJe1P1pE4Cg3k2XvbsG3UAFE1agjr3ipAXfvXmxxVpCL+i2kfUR/YR9olipVg1s08Oc7ZDPu8wYvb4rNdjGZoFm1k9T9bdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414285; c=relaxed/simple;
	bh=RsOIgbJAl0keiFENTME9riMDwgorJ7BNjMjtsrAyE00=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mw6PurG+QjSjbc8k6V+ng8XfRO3hSotpXCRFbbTYElj1FSuK0gVZgtGk12wklWrD5OOvur9wjQE8V2w2GvQuSKTB5CnZlXBxpQLMYFmJwlA3voh9ByVJcBeUrcSSF9s5YqBEj8eji7zRnUeWlhvZGidl7AJzLbNd0QQ8YqKJz1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=HQObk5Sc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QSmd6o8B; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A306E14000B3;
	Mon, 22 Dec 2025 09:38:01 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 22 Dec 2025 09:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1766414281; x=
	1766500681; bh=VG2unve4zSMZI+lXMW3U8t0YAqF/0Pf2DgkmX+53PdY=; b=H
	QObk5ScX5J3cWkX50U/9MVEpyezJc/J//57bFR+VlHj/Dztpmj5htSzxqfdXIgfN
	GUaqvHXcKfHr3+qMLN4wfKAu/W6faWPBE9ra6eRPV2EbWvy+vwvABWP1cpA1MrVO
	qpKXPK6r0MtWpaxLti3K8RlEg2gLZC3H6grTg7NMD0J/geq3ANt5MPTN8DyMsBXE
	x0DFUjbJ1aQ/sF8Tq3CskamWUz2z/JoeWhYAyhRD+/gGXP7k1au1Pgx5WZme4L5I
	zrh5YJtKUyHIWNIQXJALrQHWrSSHzKQsrvOFHby8yzyZzXtLvA+HdQvcI3/MUkjS
	lWlAufPLVXHpqYSqU71mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1766414281; x=1766500681; bh=VG2unve4zSMZI+lXMW3U8t0YAqF/
	0Pf2DgkmX+53PdY=; b=QSmd6o8BD+AGAACXCJd8+0YAIULXlBqrVtZxccKVI8s5
	CQl+MXxGxWtrNwC0cdKQajBL66krRyzcFTaKg4CHz86CJMUXKwXVSPy0JtVmmdRF
	8DqzDqUpJmjKMInHGm5FxvebEBhY3XDl8e6QVT76FEj8T9pvY9z92vUELhI7Fafu
	dbgWZCX6kCN5etMomB/kvi1gyAlx+/+2I9Sonuj8sB/g2cHEL4SRW9Jtg+pEEJ0b
	/oLNVWsnaTMNe2kZ5jEG1aRF1CZ/4xIYvVzjESQaH/DYgkvqUqSsEksztuXVQo3U
	GqPM1cxI8HSViU4jU+uVq+kz6ThHc+wR4gr4PvvtXw==
X-ME-Sender: <xms:yVdJaYj30NdeYtZ0WSse5vEO8A8s8Ar5jSCzJxJLY6vr9nPDDOEXQA>
    <xme:yVdJaSnSa_adTAJfJcl_4Tu1k7nE9XgmNm6Iym1VSgJnPi2dMPFoqrVVmQB8Gm50z
    Ww8k8DLwWBntc7kEW_2xdgXVWfueZd1YHZTiuq2A7m5VVT3Gwcw>
X-ME-Received: <xmr:yVdJafXnD10LM6iIeW9rrLxd5FHX4zgKQ-GUJlFszLPwBQAJnuuCBEFqwZcEZ7M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehjedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhephggrlhhtvghrucgh
    vghrnhgvrhcuufgthhhnvghiuggvrhcuoegtohhnthgrtghtsehstghhnhifrghlthgvrh
    drvghuqeenucggtffrrghtthgvrhhnpeeiteefudduffdvfeevueeffefhvdfhjeduvedv
    ieelgeeijefhfeetgfefffelveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghonhhtrggt
    thesshgthhhnfigrlhhtvghrrdgvuhdpnhgspghrtghpthhtohepuddupdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheptghonhhtrggtthesshgthhhnfigrlhhtvghrrdgvuhdprhgtphhtthhopegtohhnoh
    hrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsg
    horghrugdrtghomhdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhi
    sehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguih
    grsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgvhhgrsgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrd
    hinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:yVdJafuyBmF_Z3CrmlSRR6MDRrdNuQR_p7E_efnV37sBRx-gRjZhWQ>
    <xmx:yVdJaa7EpMd0p-1NIXSDMOZ_EfMDDs0C1pPEilx14x_UK-Laljzvlw>
    <xmx:yVdJaaSQrpDOdxgIu_IhwzKs1yc-N45WGtIEP3zPOLt_OepEBIi8qQ>
    <xmx:yVdJaVsPZ3y3Ji3di-o_zTyLMSglznBntEBOJEaBkijKz7-cQ_fdnQ>
    <xmx:yVdJacA_USKfWETLK8z9ufUC8JCDK-gMhBpsPRJtznVzbA9PHDmpsI5x>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Dec 2025 09:37:59 -0500 (EST)
From: Walter Werner Schneider <contact@schnwalter.eu>
Subject: [PATCH v4 0/2] media: i2c: Add ov2732 image sensor driver
Date: Mon, 22 Dec 2025 16:37:09 +0200
Message-Id: <20251222-ov2732-driver-v4-0-843652e59990@schnwalter.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJVXSWkC/33M0QrCIBiG4VsZHmfor87ZUfcRHWz6rwmxhS4rx
 u49NwhiRIfvB98zkYjBYySHYiIBk49+6HPIXUFsV/cXpN7lJsBAceCaDgm0AOqCTxgoYIWWKSc
 aq0j+3AK2/rl6p3PuzsdxCK+VT3xZP1K1kRKnjDKL2BqwkvHyGG3XP+rriGGPd7JoCf4KkIW20
 aUopXQl2F+C+BbMVhBZUNo4rhUaMLgV5nl+A6P7WEYyAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766414278; l=5542;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=RsOIgbJAl0keiFENTME9riMDwgorJ7BNjMjtsrAyE00=;
 b=9u0l8OaWis8o8+x67bCW+q8BZf/rnYcRqQenaZ9adbO+j5RR3dGTrcg3rQ2cQFp6e5C48ZYHt
 ln4o+3sWdLACswt0USNV33FcJ2kpAdcnSJjIs7bZqPDSd44F7x/Cb1O
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
 drivers/media/i2c/ov2732.c                         | 787 +++++++++++++++++++++
 5 files changed, 916 insertions(+)
---
base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce
change-id: 20251217-ov2732-driver-2e8ec05d3bc5

Best regards,
-- 
Walter Werner Schneider <contact@schnwalter.eu>


