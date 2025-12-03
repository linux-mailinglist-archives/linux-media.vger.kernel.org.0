Return-Path: <linux-media+bounces-48110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01003C9DB2C
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 05:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 947433A26C6
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 04:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A837D26ED2B;
	Wed,  3 Dec 2025 04:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RxwtyGir"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF75241690
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 04:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734582; cv=none; b=kcnHCk4fA0FJ7uFCVLcIV/5AiPmrmGRK2zenHFF25nxp+X6F+VpPA7pon255t5e+8eNn+17+0GCPdUHJ4QHzMDAifzuVp76xXmYpxnEs8exz9AWbOw2VXE5DH4SXazDOs2DGf7VbVXUBmJy7vbl1pRgcY8c4cCMNF1EijREuFwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734582; c=relaxed/simple;
	bh=R6Cr8ocb0oEl2uodBSv6KebYw4TmgNZ0DrKfzvEkPs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NvvmNkhSgO4oH1murgDIKbm+0aj8hokOxgdt1KjLLA38be/RCDVAyTq8o3tmkGXGxHBviSgvJZyVIqHAm8aPvg1Ukb5Baa4Wp95RV7OaAS12bXtk5Bf0/+1VvzflpwgzrK3RmS1+gcP8NP9A52grFKfohymjauRlnkVJf+VIKr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RxwtyGir; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-594285eed50so521415e87.0
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 20:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764734578; x=1765339378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhshrMAQHNXfy+sz4qwei88JokhQtbQdlKMxj/ILfBU=;
        b=RxwtyGirZkzdbzBVze/HmSLmJAcOVe9udRfiSVKwIA55C4A9x++YxFhsMA1OQrUM96
         ZCVjASfHHP+QA+MfxsN3u5ym7+wxTX+oCEGKQ4/2ilMt461RzFk01xEfc6Ty+jSU78oB
         Eau4CsT4wwMfP0rSQpbUcxRV2Gy5nqKbI8MAe7LeDFThghhOb/8xPlD4EZYSONIasgQZ
         J//uspvTSYsuOBfHUyVN5GqQUh04neQiQ1cdheSQQ2iFyjObGNvZmooyfnWW/JovXpJd
         1I0uo5S9+VM/zLIvid66IFiRDUZgGO8e7aVksHAhzGMHjFIFadqClvlFmbBFdctJZ++J
         MHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764734578; x=1765339378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhshrMAQHNXfy+sz4qwei88JokhQtbQdlKMxj/ILfBU=;
        b=LKKlQ5pjrws6Rrkia9m4MvjH/IM1u0EIc4JUWd3yDmApVRcHD4nG9L3l59cqNjNXvs
         eRkT39OYBp1sI5c2daysDemTtn+ION4tWeRkanNTD+gXA4dMijtOKkH6T9Onf/hxwUTS
         Hp/wJ8Rmjw7mbq9WqAJWc0/M+C6NTma5X3BZN1F6vIzKlr/oEz20BkZYYl8TpMqx213I
         FYuZhpRyiHhPIL9/7VAbz6BXALbAjIx+Lx/1jt0clmnfXHovAdS8WF/eyg5eHaChv4pp
         JvFAxsuyLzT8k3vAuRQyV+KiPdWR3n19otX4O/OUXELk5j+F5CXXpIjSJcY04mb2kkZ5
         Dlkw==
X-Forwarded-Encrypted: i=1; AJvYcCWpvr8YkxnnuC9gaG3Hlalz/SHWQkoYjOZs55UmMRfd3uj8Pkfqw7RIt0r1hLNlkOmp80Zrkglg5SujLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfXSyaQQOUyyFfaCIJhRssebFZZRiGR00FEsJ8chI0YHbsT79R
	K+e8xChVsLKzjX5P30wNU8uRHcqRqNKLsB3eHPFjMgjhZMXmlgr+SlfHMl8g7jLIng4=
X-Gm-Gg: ASbGnctPexergUG+hb8yV+jvzkeG/gACZSy6OQqwQSuZCpxA0csyO/QBuGle8pFW86d
	G/luFJE82mF+IaLphJ1VTYn7fppNDn+BPI1210hcKiGj6hTrhdbzY/eZfnhUPPYPD/xISUbClm9
	ilNcTtJbmSTQ0CXEejKxHDeaYTnzo+kFE9zDn0+1SYwXyaPMw+n1eKR+jC5BZra8HB0WgSanSZE
	eIV1B17SOsWp/ddeS+a4kpk9AHCaPgbiCS+Otvk3TtCOC16k4b8GURwbU3LsFVI48pv5Ex4BCcD
	OeLcelBrilVe4NqrypJ5IzMeXhh80PFSjvJED8lGLTfPvaRqxr0jT1/TQjea1rcZte8VOWexD5K
	VTe2uwX/sxf2G/Qy/s+UYbnduuekbvKdOTY5MIVPTwSZBxwS+PwajL72RU1eEl05YrezaI/g3OS
	aEcydv7LrWcg1QCZ/favNRKuJzsXqHYEU3yCDP9C+XczZWS5Lp6enInicdu8lmUXB5
X-Google-Smtp-Source: AGHT+IFEYAvgAL87C4nbXwzIlruIun8/JDmoS0wwNVH8z5rBpHTQmugtqTwD/DfgXo+9EANlBG6JSA==
X-Received: by 2002:ac2:4e16:0:b0:57e:ed2d:190f with SMTP id 2adb3069b0e04-597d3f9e010mr145270e87.7.1764734577889;
        Tue, 02 Dec 2025 20:02:57 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8b1082sm5210181e87.29.2025.12.02.20.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 20:02:56 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: Add Samsung S5K3M5 13MP camera sensor driver
Date: Wed,  3 Dec 2025 06:02:38 +0200
Message-ID: <20251203040241.71018-1-vladimir.zapolskiy@linaro.org>
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

The sensor is present and tested on SM8550-QRD and on SM8550-HDK board with
a Rear Camera Card.

Changes from v1 to v2:
1) added Tested-by and Reviewed-by tags from Neil and Krzysztof respectively,
2) specified optional data-lanes property (Sakari),
3) renamed voltage supply properties to match pad names by Samsung (Luca),
4) added minor requested updates to s5k3m5_probe() (Sakari),
5) added minor requested updated s5k3m5_init_controls() (Sakari),
6) added a simple .get_selection to support the basic crop controls (Sakari),
7) set default number of CSI lanes (Sakari),
8) changed a helper function to calculate pixel rate to get frequency parameter,
9) removed .link_freq_index since there is only one supported option.

Link to v1:
- https://lore.kernel.org/linux-media/20251012231102.1797408-1-vladimir.zapolskiy@linaro.org/

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

 .../bindings/media/i2c/samsung,s5k3m5.yaml    |  103 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/s5k3m5.c                    | 1377 +++++++++++++++++
 5 files changed, 1499 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml
 create mode 100644 drivers/media/i2c/s5k3m5.c

-- 
2.49.0


