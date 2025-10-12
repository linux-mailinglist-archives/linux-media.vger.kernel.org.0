Return-Path: <linux-media+bounces-44218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2F8BD0D6F
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 01:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D2F23B3B2C
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 23:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B08D2EC54C;
	Sun, 12 Oct 2025 23:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aIgmTQKj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB827277CAB
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 23:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760310674; cv=none; b=BKwgmRy5pKh4OCGOnSM9iadtxow08LMcx4u8IZsA8r+mMawP1P5omu4XhlXObWpoeZ3x1lI2/VGKyym8DZt4hV3rxqF+YhyhvOp48x32jpMDzRC/nSSJJARQYmJ9HBihc8ksvGPH52delLdV77XVrSdbJ/I7b0qTBC5d1NySYvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760310674; c=relaxed/simple;
	bh=CAXorevUrI+L/I8ZaM2bLNGWQis0HydE/lcGX8g+Grc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ogiUeHIMDMHtE3Jz7/LfrJE12HtVOrh/iRzD6PZ0NVpb78YQmqB6EVEU0J8c4YI+KLR/vdzFprF7s26XPOJaR3VoBFTcUkHhAr1VFBT6CK3BJNXncMQUxc1/eTXBO7FKiqXnVxi7JZ0j9GMdrxnnuuNCumYNZWo7VtrKmNWlIFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aIgmTQKj; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57bd7f0e2daso574254e87.0
        for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 16:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760310669; x=1760915469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6s7MB5eF5/KPjVvCROYigyH6C8BGY1LYw88UsC8mq34=;
        b=aIgmTQKjwxGQ9TplVrVr9Zk09qLaW43goxQT5Bdwv3YHy6d6wv1O2Kq9OfZkzi61n8
         CrOoztOfDwNwC11vqA+hK4XuUADgJF/F1nucxBT+UMe3+iMwbMMl/BMCpURcyBI1dU1l
         4Ey8WpuJtx+uMQvXz9AFPk+Ci6xDqQI7HpBoYJaWKli9glu2YwAUeUXgvae+GP9FKSta
         l8oOEvobBc0PtHwK1S1S80vvupGM6rUvbJ7EQ8Gt4UwYZiDM9lUuv8UINu0/9zxiDysG
         lD/ECkGfnRXoJ1/s/h2/QFJkIJY3Zo0Rgm3PVFstb4UT5QSTj6Oq6kuk/bDUhIZJUCY3
         5miA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760310669; x=1760915469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6s7MB5eF5/KPjVvCROYigyH6C8BGY1LYw88UsC8mq34=;
        b=uKFsNJ3M2fTlpZj/9rvZ4Boy7IBrsh+y5DFUG5NFugASqevxXH76qj1shjl3ahArWh
         18OD1MpgZ14dPlOrbu9im42zCkrcNH78dV+MFfgnTUiF/eSnvh5yogRqxO/1GhN2Jo3I
         fXOtj1NA5+S+KI7PR36UoOahCQv4JxgQnJyZNpvlDxL6m9SIiSv9fDtiR/xfU9/5Rm0F
         1fvOdMhPRBDFUl4Dksy2AXgEVIr/iUeYrWPmptAnQyBvtYzHzAxzqBxnqdo43YfmRwnQ
         aRHbK5qQWVLp0cMQOABJ9i1JF32gbEYz6TGYUV3xdtLpr7FzasDBSpEvZ33Lvxgd3E3+
         2RdA==
X-Forwarded-Encrypted: i=1; AJvYcCXdmAf0HkAotFPdq2FUAVNOpBGuvlDoZTR5e0GjO90n3hLsiyMRDkZenzR/4zApwEWjjzfN0GhYR0XMtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YykFseBklVJYz0ZllKrmgJDZEE/d/FK9cxFgF1O4PeSdQ3OTT+n
	UbGaQsFu4PEn6DjGtCiXyHOw/mKCp+5r/UTjZsgl9bYgeuuh1KEtLSkFhjVaeI3vqOA=
X-Gm-Gg: ASbGnct7hm8uYDeHWuxaF7jKhXyvf00DUWRTqcmxkwL98/RmT1PgLSxZdWIYXtwWP51
	GOqGksJawPulheZe14SztsYWKMWkUIDvxDI6vH00M8gjYhWZcIw5QuCgZVLy5kljIloy1DI79PH
	VAK9uayvTgRqH0WBMTCirE8EgQt2zGG71PmpQLKuHFxem8yTpvCR8JhB0wJ9chwpzLZjyZ7cKgy
	aK9TIBEoZmYWn3SIW7iSr9vjPeYBm7X6z4y5Sm/TGoQyVYRjN+r/Z7GBGTLRKV4Lf4IahdFnc0v
	YnU6G9QOaD6ta6XroQX0Kfg5WRszhL91kg1gS6f6/B9W9A1j1b4DAA0ZHnNGSEzdgQXfoW3XmF+
	k/TuOAKgdy6su2LUlWWl7gYURY9RYIGkiqIfawmyuQKSJiVE0dw23MKWHSU88gr7Ava4zEWnHqk
	G969BXXi5lHCsvh9qVpuCzrL4=
X-Google-Smtp-Source: AGHT+IFurfkVKwZIaoaiyaYJbRPSTCpN3JM/if6a/pvzP/mEPLYruN5/ojl/y5Q1EKilXuZiH586pQ==
X-Received: by 2002:a2e:be1b:0:b0:336:d8e5:8dd2 with SMTP id 38308e7fff4ca-37609cd6744mr28262891fa.2.1760310668116;
        Sun, 12 Oct 2025 16:11:08 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762eb7328bsm25258741fa.56.2025.10.12.16.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 16:11:06 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: Add Samsung S5K3M5 13MP camera sensor driver
Date: Mon, 13 Oct 2025 02:11:00 +0300
Message-ID: <20251012231102.1797408-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung S5K3M5 (ISOCELL 3M5) is a 13MP image sensor, it produces
Bayer GRBG (2x2) frames in RAW10 output format, the maximum supported
output resolution is 4208x3120 at 30 frames per second rate.

The changeset supports two output resolutions 4208x3120@30 and 2104x1184@60,
PLL configuration is done for 24MHz external clock, in future it would be
possible to add a setup for 19.2MHz external clock also.

The next V4L2 controls are supported by the driver: vertical/horizontal flip,
exposure, analogue gain, vertical/horizontal blanking and test pattern.

----8<----8<----8<----8<----8<----8<----

% v4l2-compliance -d /dev/v4l-subdev30
v4l2-compliance SHA: not available, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev30:

Required ioctls:

Allow for multiple opens:
	test second /dev/v4l-subdev30 open: OK
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

Total for device /dev/v4l-subdev30: 41, Succeeded: 41, Failed: 0, Warnings: 0


Vladimir Zapolskiy (2):
  dt-bindings: media: i2c: Add Samsung S5K3M5 image sensor
  media: i2c: Add Samsung S5K3M5 13MP camera sensor driver

 .../bindings/media/i2c/samsung,s5k3m5.yaml    |   95 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/s5k3m5.c                    | 1362 +++++++++++++++++
 5 files changed, 1476 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml
 create mode 100644 drivers/media/i2c/s5k3m5.c

-- 
2.49.0


