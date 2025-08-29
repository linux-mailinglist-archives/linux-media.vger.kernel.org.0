Return-Path: <linux-media+bounces-41340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC9DB3BE5E
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 16:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 252063B0514
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 14:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9174F335BCC;
	Fri, 29 Aug 2025 14:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htPRDqKR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C13322C65
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 14:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478569; cv=none; b=oZDwokH3YQ6M7xhUHny7Z1FlerC+/zOqsv48xXRcTUytQ1XNSQ8AQuP/4YQ/k+4OIoIIYGa8z6fNECok3ddE2QTENdKBv3zIa9FZWkuO0nybbKAVa5KVmzYpy+G1v4FOwE9Hy8838Wc33plC9mtDAFejjavkOVqpx0Fhra5W1jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478569; c=relaxed/simple;
	bh=NhwvmmbzfMgmAh1wi32wkkIkpPFDcdR3wXwD2CamPyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W32bjM+/iT6WCb9oEAXRNyeSf711EURDq2FB7Ke3rEF1ZlAP89iK+NyopFIWGT8IZNb11Sl1QiEoRoMBFlSVfcrlQmPhVbVpSGfQ30gdKAdUJBv9V0R8N16qontKpfLxAsSR7+C7QXjlDYZpeCeHsquqQ8v6+Iun8utwoz9ISdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htPRDqKR; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f3fb21a58so106505e87.2
        for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 07:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756478565; x=1757083365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1C97Rh1+Y8ywLH8ummxCCRjzifbNFqPzpmuAc7WE1p0=;
        b=htPRDqKRW7PcMuC9kC5tNMmoAwQ62DZkcnMJmztQvSjD3Fa4QhNfID3BMZCyMHMR9O
         6eFiC/LO6xDleqokF2kuEtdTxSStJwljMlBuWdtzNifDzrykot2Zc5Rx/x66+k8QHQ+t
         JUtNiXjJSK8ayBAyktQnjJBqBX3l3aiHESibJDp2Ya6ixs5SeXGlS/6+LBdTViOR00Oz
         oemqc+peL6ew/Ni/QNKXbLdTccXyrZdGtqEiguHe86Tppb1tBjPmU/0JWWsz81+dzi5W
         sOO2jCbVGNvvXQnYwvm2WbzsJJnxQQZgXyTEBciuy5/pXkQbJPnvedFXARaDKK9Q2iOv
         hUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478565; x=1757083365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1C97Rh1+Y8ywLH8ummxCCRjzifbNFqPzpmuAc7WE1p0=;
        b=CrrBt8vlqNPTojyB60qIMrzNL+c54qkSGoaIyRPQ7TwXWHyXWowHyd4uDpopPDpETO
         2LiBN4fAQ/0Lvoffm0uHra900plajK1qsxJMNCQ44TI68wFyMcYY6qorSumW+D11HtJN
         7AjdEL0HjV3GIS5PpN9J9PfAZ9Iq+qOrT7OWS61BsWTkDXgga7LiilX8B7DzSjPFj0qt
         cRUnNYSJJDmJVCRT8pjRJIr/x2K+KbmoCS6ew+AXnEt21aNGduyyn7/Phv81BgTFsBrt
         WHX/n+4Et9TnIzfs7b3fK+2ycVMTJoRg/UgOU3Dr3I3adFRXdmDj59MywJF7s8cK9j9j
         7noA==
X-Forwarded-Encrypted: i=1; AJvYcCVCBvEbvWS87SV0mfEko0DCpOHrWzWodnfJRNanS18bBUJIZZFyRrg7YhBqMdf/VR6tE7p6x10FecAPcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5NS8kkGTsU1wKEdadD8J9/NLsbwXsmPsqm3zMka3ttdPdkNMk
	LuP98Fdo1N2LNE+mHbrltq1pMRoM/8qbG46ftAhHc4EDWFI9W7TtNATGCQ/D58Y7ES4hGe6hOEE
	TWqT4
X-Gm-Gg: ASbGncueG0fRSPSgRBhwaCCII8/OVp6+1tu77DQRO9N261ennFJERH8ip/o7Q0G8SSM
	JW3XojUSky/fLx5xpXbhV4FrtFXwKcVfXueLssMRGg7IjNnKUYyTJ9bwc9xVXXdOFnov4L5jmyJ
	ETs7f7acKsIGzFEVataiBlopYdtPs+X4aU0gPUERVVC9qKc5TB3BZ0DS0iUkQcafJnr8hDJrx4k
	r9aYN37R6WTX4QbVbKvlBA/ayy4j4259TZsP3Mp90/C5xWOR7duyZ3jfHAOHrR4HxpTrr5jz/Qh
	TL/74cMPdUrCMj4qucb+CflVt01MknY61wShieNFxicPFY2WNBcNVhdwmhgMqURDFaLHQi+XVop
	XWhhWNZkOAeB2DWM/xzx3lKzTYgdJJF9pclwrGWwAddSikEDUYW8RrYa28EuQMfav35j62dJhcF
	CONlqN8A==
X-Google-Smtp-Source: AGHT+IEbzSAbsDp9pM/rntXhlfNgfd2f+rTHGQVV0TvmMk3trcrTGTbVLiWc3MF6A62rZpJ+RHkX6A==
X-Received: by 2002:a05:6512:3ca8:b0:55f:63c8:7e32 with SMTP id 2adb3069b0e04-55f6b023898mr275823e87.5.1756478564862;
        Fri, 29 Aug 2025 07:42:44 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6771b237sm677240e87.54.2025.08.29.07.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:42:44 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: Add OmniVision OG0VE1B image sensor driver
Date: Fri, 29 Aug 2025 17:42:40 +0300
Message-ID: <20250829144242.236732-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OmniVision OG0VE1B is a monochrome image sensor, which produces frames
in 8/10-bit raw output format and supports 640x480, 400x400, 200x200
and 100x100 output image resolution modes.

At the moment the only supported resolution in the device driver is
640x480@120fps (Y8).

The driver version is based on top of media/master, which contains
a new devm_v4l2_sensor_clk_get() helper function.

Output of v4l2-compliance tool from v4l-utils-1.20.0:

----8<----
v4l2-compliance SHA: not available, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev30:

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
	Standard Controls: 10 Private Controls: 0

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
----8<----

Link to v1 of the OG0VE1B camera sensor device driver:
- https://lore.kernel.org/all/20250820224646.130270-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
* added Reviewed-by: tag to the device tree binding part (Rob),
* removed unnecessary explicit setting of og0ve1b->sd.dev (Tarang),
* switched to regulator bulk operations (Sakari comment for ov6211),
* minor non-function changes.

Vladimir Zapolskiy (2):
  dt-bindings: media: i2c: Add OmniVision OG0VE1B camera sensor
  media: i2c: Add OmniVision OG0VE1B camera sensor

 .../bindings/media/i2c/ovti,og0ve1b.yaml      |  97 +++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/og0ve1b.c                   | 816 ++++++++++++++++++
 5 files changed, 932 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 create mode 100644 drivers/media/i2c/og0ve1b.c

-- 
2.49.0


