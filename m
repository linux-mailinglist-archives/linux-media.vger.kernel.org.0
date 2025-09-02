Return-Path: <linux-media+bounces-41575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1A4B4010C
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F08E32C2CF1
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACFA2D1916;
	Tue,  2 Sep 2025 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q4dF/nF/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578A2D0620
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 12:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817122; cv=none; b=BOflXeHVui1hT4P3iZkQT6xSiFIApK4WBMerpeSdEyCwkVPFGTRVSq1ABav5h7UCPluYwLvhkYSOQgVskNFs794qJCod7LAunmdZCv3KmjRSN/wUKWN/eJaUQuYJ1modLnRC4nFFU8dM4aF+aVQbDgHP2KTMQecb0BntXkY+t9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817122; c=relaxed/simple;
	bh=+HMleIjUCtRWa7u9aco2rJ0KaGzCpa/tdzXVN8oW82s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aO7B+6unWR7kcycr78OuVxCzo1RRh21FA0o+xB3rJIEfXL7e9FLTUbFtblZ3u+qFP7RQY788GbDu9Rtd5pnob58SNeW+j0KCS59097LdyauqRiDfi/IdFbb5J9FvdIvw+Q7twL7/MzkhIBJhhjRsjU9OZDsmds7MMzZCqmr9Jik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q4dF/nF/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb731ca55so99969766b.0
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 05:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756817119; x=1757421919; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dfyuJshObVa+wHBR2tMga45j89hx5b/Qk3+dnyKvnZM=;
        b=q4dF/nF/Q2q6LdrQ672hQ4uCCyMSNEjP9euGvbjRTVCgeREPxgn645Kb1IXja/gVrY
         aLfuemYafwH/02imp2I5F8hHRWxx0eLHEl7YawkqZcuo9cGXG6qctypD+bMMNiqXPfiK
         ne5YjljwMht4PKehIoYKaaRpB482Gftu4akIyK9SgKHE/qd1MPvoZt7brOrDhBmxU3C8
         ahwSEK7ZQAJAqCYk5zGoqi4cfGDzkhsNmwW6cv3nqgZEomlomx9jldmTIv00qIkIYikT
         3j/hzibmVQSqQc8z3UAh40BtEV7QB2bFmPzlTRHNKOlE9V6AKIBff+NEnTksy/W0elDJ
         AZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817119; x=1757421919;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfyuJshObVa+wHBR2tMga45j89hx5b/Qk3+dnyKvnZM=;
        b=OTZXPQ9I1SoSkYO1n21FqZUDQR461HB/pkkngG4vimh+zSSArW4qP7H0n2WDK26gdw
         v7dL8wcctkIoMlx6hvrT0t+t3/Dbm+J63aIeRIOQ/H+eueCKDNQTTGGT0zR5yZiNdf00
         jvy4W3fSfY/oAbH7zjGRE5xIzNlYQ/+8uTJV1dXN++CTg5HO/kFS9J+oJ+F9eupCPGia
         6fPzu8KE4WMR2eAsBy3juMgGKl+0Lj8dLB0gjug0a61uzumMUNObRlT9pr1dEHAyV7Fh
         aK2YPkYw+ZhCT9+5Oz+KJixCvhGR2Lo3lIezdfKq1Eveo5I9A5wAGRGMZdujX2+k3AZO
         /h/w==
X-Forwarded-Encrypted: i=1; AJvYcCXr4adXGqMTtLAIABY2z7tQjMzxFphjQhUagTahwrxR1LcW+B5isSxj7Ou0IcC1ajOOuKRi76vvGxNkvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj0D2qwir9SpboY1jsUgHtmUDkADQQltHfzEsf7OLqIozKg7MM
	pdCbfpszh6xxFFu10flRNF11Y7tx9F33fFJ38rgAxw00tl6BHjcTK2++YQgb92IJozQ=
X-Gm-Gg: ASbGncuF7DRoSLsRwv2jGiYnDZvn4j/fJODo7tEQoF0kZ/9lApZMU1p3syg+N8A+pJj
	/d0XSiqWvreQSnWA3LcjW228Q9z71mVPl93YvYNznJPbd8DwVTCGSM1l+xwsV2va4V3V7SMMDNL
	ejV+jMEf10RnBZutL9Q/taCzfe9qAx8q4u15bfcCKSWV6LkZpdfkwBG/2nqGxkDMp3z2vKS9IXM
	VF736GGFKS43930VZY9A1d6pUGzSGdM1B+K8LD0xdwWk+TLhPt9ktK5nCoGweBZBsqmDpCkgl3w
	gU/359z7Ux7sVedw1hpIRg5BsSr6JvPdbVVhXmzNeFosNnNUf3FWhUXCVgNgr4/KLYeIjos0gbR
	JuChFLrOD3dweckK8dJbCqVQ7qQA5XwWm26I9YE4=
X-Google-Smtp-Source: AGHT+IGHfjpHW63pHl9+bQc4F8HWfe7CjKrHuhNZOOtUE5jb6dg3KmLwdut+wHWDarGF1MPHJxlt7w==
X-Received: by 2002:a17:907:9629:b0:af9:5903:3696 with SMTP id a640c23a62f3a-aff04059ba9mr828710966b.2.1756817118624;
        Tue, 02 Sep 2025 05:45:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0428f88a61sm515784866b.70.2025.09.02.05.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:45:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/3] media: iris: Add support for SM8750 (VPU v3.5)
Date: Tue, 02 Sep 2025 14:45:09 +0200
Message-Id: <20250902-sm8750-iris-v3-0-564488b412d2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANXmtmgC/22Py26DMBBFfwV5XaOxMdigKMp/VF04YJIRAbcel
 yZE/HsJqOpDXd6Rzrlz74xcQEesSu4suBEJ/bCE7Clh9dkOJ8exWTKTIHPQQnHqjc6BY0DiSql
 GS6HqEjK2EK/BtXhdbc8vWw7u7X2Rxu3IekdkV2mV7DYnSJEpkZtUCiiLgkvehelGU/Rt2vnp4
 j+ow8MFBxt86sNp/2g6WnK89n2PsUoGd43860H2KD4jRR9u66pRrM3/DhgFB54BFLLMbH6s9Y+
 eVTTKb9jAH1gucNFoo0C3BrT5Bc/z/Amfdz4kXQEAAA==
X-Change-ID: 20250714-sm8750-iris-444d7214c903
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5236;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+HMleIjUCtRWa7u9aco2rJ0KaGzCpa/tdzXVN8oW82s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotubZMzNM1v7htENgFY5uzpAdbStKyXlnkd4Zv
 DH93jN7WpyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLbm2QAKCRDBN2bmhouD
 1/0JD/0W2BzUu3QrTri+Ma0kCl4Z94l0koGcXeZUC0aPNEJNeI9qTTzfoQYDiqgbRBoxdn/yPZA
 jRr+dbaYfy+Ezk9g2sYePxh4Vn5nnQ6eoD1FqDgtRgVE+zgucICLXnW78qEvUqODnI7ojsE2u7+
 6E/r6IQNn5Toqqkzvg/zmFTxwLMuJ5OhdF0vGs1yZ2d1Jck61uez9moLeVIp9RFDT6tZrN415o6
 fgg3zN599ThSbBVhOUBuOLpTBjGq9XNUCXl9NXXpYkUE8jb6taORx28qsY+svUGRZTfPlo7GupN
 hdxNP6fb+h46FfSlMVxWhsaexDxZnn/RmGuTzMVn3tJoewcD1e5ztskhGy5dkpzzmtQtdFb0//c
 y1LOK2+ilTSXxD6i29Gb22TECjMCm1yTnHd/+771DEsVuGWN5BFY0N4BNjIYYim5H/OUAhT6j+x
 mvcit/xUSl/uzhf9sAyCYT42dge7A3ucOa3z2t0M4FVh0yvthFYmzPvOKIXqNFXfkaFH4Od20gE
 6CMNq0wbF+StxGv3OqxRZlWN++3UPP6G5UI29PAvV42sUdUgXvMl9IqIxLBMmSKA0Iiv+tZu0Jk
 6m2fjnqxnyxKsqq16zNkCyc5gMt7GlOyIGzxbhaQgluO5xTjb1fIJRxkNPbhX5ntAxiPxPIRZOX
 L/now3bVj+YMcEQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v3:
- Patch #1 dt-bindings: Drop venus-common.yaml, add missing opp-570
  in the example.
- Patch #3:
   - Drop reset_control_bulk_reset() in iris_vpu35_power_on_controller()
     (Dikshita)
   - Implement write-retry loop for WRAPPER_IRIS_CPU_NOC_LPI_CONTROL,
     similarly what is done for VPU v3.3
- Link to v2: https://lore.kernel.org/r/20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org

Changes in v2:
- Unify power-off sequence with SM8650 and re-use existing callbacks.
- Drop incorrect WRAPPER_CORE_POWER_CONTROL and unused
  controller_resets.
- Rename FW to qcom/vpu/vpu35_p4.mbn.
- DT binding: correct typo + Rb tag.
- Link to v1: https://lore.kernel.org/r/20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org

DTS for reference was posted here:
https://lore.kernel.org/all/20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org/

Description:
============
Add support for SM8750 Iris codec with major differences against
previous generation SM8650.

DTS will follow up separately (depends on other DTS patches so cannot be
merged as is).

Tested decoding with Gstreamer (v4l2h264dec).

v4l2-compliance report:

v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video0:

Driver Info:
	Driver name      : iris_driver
	Card type        : Iris Decoder
	Bus info         : platform:aa00000.video-codec
	Driver version   : 6.16.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Decoder

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
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
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      media: dt-bindings: qcom,sm8550-iris: Add SM8750 video codec
      media: iris: Split power on per variants
      media: iris: Add support for SM8750 (VPU v3.5)

 .../bindings/media/qcom,sm8750-iris.yaml           | 201 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  68 +++++++
 .../platform/qcom/iris/iris_platform_sm8750.h      |  22 +++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   2 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 170 +++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  12 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   6 +
 9 files changed, 486 insertions(+), 5 deletions(-)
---
base-commit: 709a73d51f11d75ee2aee4f690e4ecd8bc8e9bf3
change-id: 20250714-sm8750-iris-444d7214c903
prerequisite-message-id: <20250702134158.210966-2-krzysztof.kozlowski@linaro.org>
prerequisite-patch-id: 1658ac2fc03eb4b33a236c2dfc2a053249068354

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


