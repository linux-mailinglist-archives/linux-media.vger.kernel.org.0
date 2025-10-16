Return-Path: <linux-media+bounces-44646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A76BE1368
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 04:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A8C0F4E4624
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 02:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876621DF265;
	Thu, 16 Oct 2025 02:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jsDy82FF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCF61E487
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 02:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760580268; cv=none; b=I4IvBn7N835Yz53C4JVX2c81No57Mt119USthdepm7t5/HwEbInd1Zjg9jVYO0aSFx1WAdHqiWkvzBh075i2kQmfOTSpPtLoTsIbo/d1qJ0NsgiJEPAnbvXsx2uIggtS48HP/7fBROhdPQy8p9Ugs+e2bWCg1Gb1B4INC2HGMus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760580268; c=relaxed/simple;
	bh=Hvg6k/MME8MJglm/n6aor6UBfGLa1CTiKDRths6ZL+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cF+q9Sk8DtyF2qVcTbhYFLb4IPU4LlUiF0rpBSCkgm+TbbSc+EBCq5U8C3gYTE+JPX3l6IJCN5D88CqO86TW4mGzCS5xD6vCr84Vs74Skf92SVrPTJOpDR8KJsCO6Tj01wCh51GH9sE/an3E8WA2jrxwot76Z/4HG8FP9sW3gvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jsDy82FF; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57e3cad25e8so43213e87.1
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 19:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760580265; x=1761185065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YOB8VSxcdvbD37UrkvKIHBp+WD8atI6WeU4LWquFpcA=;
        b=jsDy82FFOoD0GHMwdG3Tuf9YZsDR9ivnIhtHCqcoxeDJN/ymhiltZS1WmpRzJhHWps
         pgAWHjvHUUsaAj0vrJnKyyNhYmtsEOBOuuTkpnQEbAH5u5+QkE9zOrS4JGL0L7+lwq1O
         XJxZ/X30PEDPG1CoaSOWKhB0rBvJmwUwjegWkxGamBacHG9r9PC9uB/7qtCwONG9WYX/
         XY4+IFn0VNyOINdfUBkmr6Xgq6LWDp7OTCeuUi74v7XErOO3JDdbhmB5czn4fkIk7kHV
         qwKieumGRuyy3TlsUufVv9cgjW6aplKFgltj33lMRyt1mlt1iwihsL46s8Zr6lYWLILI
         5IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760580265; x=1761185065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOB8VSxcdvbD37UrkvKIHBp+WD8atI6WeU4LWquFpcA=;
        b=cATz+BHUI/bN4wXmSfPzf72YxmiYX9OvwG2yB/qpPPDpHSwbzhc0m/ZePd1u5GtuZe
         +1yZgJJCDn/F+DWIQ7j2V/hQ9PJ1CNJ+DxpKMX10eRRTLgYBxLHVzopKR9Qg3hmuvAwK
         U/eKlLBaD0XWKA77vaWP1pxiCYaR2NL9RKcdWa65djDFqFVggG+7xwFoQFr3hQp2AhJE
         lM1iVnxttjY6WO2rklX8s2FgiFF1c6fc4m/O5MF/YIe+QPVKNBEazpweA2UwNNt+j7XV
         XaDll0L626M4veH3tJN0BdxAG2VNmdTE/WRboeRakTJzzXIq2XRM6Y9yfSIG34e9+h+K
         PzyA==
X-Forwarded-Encrypted: i=1; AJvYcCUGxXzkDyOZWWl3erd3Blwr2Oout72dTJKTFZ/81lSi6j7IedA/jw9Ar07W3XLig1QSyNot1ttfraTK/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkEygd/Yy8U+vWa3JWSsvNSD3sqBUiWbvprtVK2JrAsXbk//xZ
	SdDzDgSDG0+mfk5VNQxU8heYmbGSaPe4g3t6pPcf72mgmaF808I7sbivhvLEuRNvYfQ=
X-Gm-Gg: ASbGncsQNSMD8K8aEho03ZMoXzkfx7nZJ7z4zCdc7UDHCXmvOP8tWpr5O4SFKuIMDIp
	b10uW6KjHPjrusCY0k6Q3Mx/m4OPMEBOnf+dMNHdLZl8XbGE879xyEiIZLB1qczV0r0gV24EVaL
	bMlo+x8Ya8lPwgCEvImszK6uFx3XgAUH/bI1EoqMPX649Eg3Yk0GvHwJucyz1pRqPA+FapXkgkU
	fimAij6ZvJhcCU62P7O61PrrJwCnUXMopynuROHZSkpt+Wfc7BjnClhb90mb9bi0GMkXIs0EC3R
	F3dXhLEgpj6/ejN2SaT9ZajmMeSidMaTZr9RT6G9KxXV2rNzL4nnPjAFs6m1ns1IscEwzYUHwrp
	S/9QKpDCozNbj2QFn9/tCP3oh1YOdf/j/YMFiHD8v3wlMolkxro0ak2yILfpErS3Xq/s+Ttl2ma
	8+NxG7EBmDjyc4d1IRRAbGRhKK+Img2GXUapg23q20Qsc/2FbnNK0GOZVjrHspKmaL/Scj
X-Google-Smtp-Source: AGHT+IEMqeNVUsBBLnzuxCA9tSh6jqzKLPLxLDOY1FZo4XrWjDRiznHN7UYooBcox/z+pe4NBRUoHA==
X-Received: by 2002:a05:6512:3ca3:b0:57d:9bd4:58d5 with SMTP id 2adb3069b0e04-5906d8ec283mr5353848e87.5.1760580264963;
        Wed, 15 Oct 2025 19:04:24 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563c98sm6703951e87.74.2025.10.15.19.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 19:04:24 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: add Samsung S5KJN1 image sensor device driver
Date: Thu, 16 Oct 2025 05:04:17 +0300
Message-ID: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung S5KJN1 is a 50MP image sensor, it produces Bayer GRBG (2x2)
frames in RAW10 output format, the maximum supported output resolution
is 8160x6144 at 10 frames per second rate.

Changes from v1 to v2:
* added a collected Reviewed-by tag to the dt bindings documentation (Rob),
* managed to get one PLL setup to cover both supported output modes,
* vflip/hflip sensor controls swap media bus code of Bayer patterns,
* extracted a common initialization subsequence of modes into its own array,
* set a step to the analog gain control like it's done in downstream,
* reworded a sequence of CCI commands in s5kjn1_enable_streams().

Link to v1:
- https://lore.kernel.org/linux-media/20250928200956.1215285-1-vladimir.zapolskiy@linaro.org

----8<---- V4L2 compliance results (v4l-utils-1.20.0) ----8<----
% v4l2-compliance -d /dev/v4l-subdev28
v4l2-compliance SHA: not available, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev28:

Required ioctls:

Allow for multiple opens:
	test second /dev/v4l-subdev28 open: OK
	test for unlimited opens: OK
	test invalid ioctls: OK

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
	Standard Controls: 12 Private Controls: 0

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
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev28: 41, Succeeded: 41, Failed: 0, Warnings: 0

----8<----

Vladimir Zapolskiy (2):
  dt-bindings: media: i2c: Add Samsung S5KJN1 image sensor
  media: i2c: add Samsung S5KJN1 image sensor device driver

 .../bindings/media/i2c/samsung,s5kjn1.yaml    |   95 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/s5kjn1.c                    | 1387 +++++++++++++++++
 5 files changed, 1501 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
 create mode 100644 drivers/media/i2c/s5kjn1.c

-- 
2.49.0


