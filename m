Return-Path: <linux-media+bounces-45329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64ABFEF5E
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 04:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2DCB18C199B
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 02:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9ED2045AD;
	Thu, 23 Oct 2025 02:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KLa311u4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182B147F4A
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 02:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761188044; cv=none; b=C8DSMM3MyikbwpyyXoE5GpFooD8iVPJxGtlP8TyFDGkEJuLfbgQKobahB/epW945almO5LdfFXKRNQHoxl6ATvwNcAXjW7F/SoEt7jX5g56OOYmJmg4fJJ/j0JHYBzgXZRdRUKvXH1T6oPBJvEZ0micc1Wgq4i55kI4oGE4HVrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761188044; c=relaxed/simple;
	bh=LTmKjJbA1n/wtPmo+T/n+bhndG69uYTXrNMP2lZsbg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ShUVEI+15JdYJomN3ZvIh4AeLkVQlOCjIbQ9GPa5Jjjm5F3LXlY/ruEqEJgfyBbd6clZwJ59nzjYonWi6Ko24QM52Gru8Qp56TAQ0QQvMgt8yy112Vw0Kwwcb8vMIY0s8G+nXn7jkA9XmhhzVVWiatkusHDRrN8u8UeMB0d4Hv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KLa311u4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-591b99cb0c4so40657e87.2
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 19:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761188040; x=1761792840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t6DRCxslgheKjuwQ6b7p22t18pwk6dfTdi7SUdxUpSM=;
        b=KLa311u4iGmouBw6UpTQCIrfOR4+WZJvB5pqeHnLnXzNPm21NY9exVBPNJ34DHV7OB
         bxKo43hAByomJih74z2Y30cAGZUgvalQjSuL/hlNeJDWWUI2t//qwAuhFlerq18D+LrQ
         n9NEFCJLnuV17A3HDCIedmyvS26uye+zEcTk/zRSXZzRO70uL/oDapWfISch4KNs5N36
         z9oZBFKemVZ090+M4TP7Yy89lKIShvwMri8MJnNrYKWyGD179RdqFPxemkgcXMDgAA8a
         r5IdoWhXk29m+SsHN4bd5VWflfcOrjcEG2fTJS2mf5gYLfxNaYh6KCiFSwIkVfrc4kfV
         HCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761188040; x=1761792840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6DRCxslgheKjuwQ6b7p22t18pwk6dfTdi7SUdxUpSM=;
        b=X2MB9d4iGttGWib3NaHsfI0lxHklRsEvuaNnyMoO6cvtlgQCZO2IWmzvAvg2cHpbwa
         yw7+baMybezEnG3hTYDHxn88AgHPEoTyIlzPTrxv/WYp1wh6De19qZCvnLBimkS4W7tv
         MrzP7EuzX6i6y6ltPrrP4YMvlJm78Q/tWqLSusC/mT/ugcHuJe7u/0WWBj7LwikJGXmb
         Gt+zx8XWGm5EouR2naSX+3daJmGzTaTjhqUbyizjZU/YNuGQiI/j6oYiNmfTmNu+/O1D
         i2C0+qezDWb3ICfwLz8NVbAXaNOOfSknvNR8gmd88zhGv0Afz2+/C6WfHHrcvTjwJdn7
         yWsA==
X-Forwarded-Encrypted: i=1; AJvYcCU/cFSNGHbCQQ9v7YOzBGCHSjaHyDcmaUgoT936r+e8nsyxY+eO0I8GegG2eKR0nojq5ZXHyrp+SkFWiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztPuNMTC/0nG2T+qcErVOpLvdnXhljnogqotowFDK0aeadlzb/
	KiiJUlYJveGH5HPetVoETROv9RnkXpcH5SGB2yTBUYnFurtgvFbKT0mUvoQV1mFOINM=
X-Gm-Gg: ASbGncsDUJugfH9lJXLuIFTmSeEJHyM8uqfslF6eDHDViDOhMWrMqKPFsbjxmKRQCKx
	oxsr5RstWFGBP9ErOT0A4L4hFkNo8Do+tpcxIVki1gjtFRRR3jfueyu8q6C6hNxQ2kLHBIUtft0
	owdJ1gSquAWPslGFsNAva0z+MjE5rmwNttTlogNrFFjknVCpErR3vG0AmlDSMwfGbzYKUl6JeFZ
	cPFCZzCsB5QlWXztn4J5Mi8MUXC2CivRHNl8Dk1YfihQ55vYdl682mo+0ohLCyDU8RvOouzHE0o
	Qfaq5C+RK0NXctDg35cgjAb5ubMorN0Wp/TgGZf1821Qr4Tnw3S/sX+YtFuJ5a61QORHZztC+K4
	j+YyHl6Wg6bM5P/uR+hrG1M2KgYa10JgwiY9YueSNZppPLj3uavOw8WmqrO541z8yDvn3JaaHmd
	5WUxcTmw9xIZMlDXYkOuVK8/K0rAlZRRL9gx7ObkQJ5TQ=
X-Google-Smtp-Source: AGHT+IHH4oV3M7SKzw7m3Q/81rIVaPIQiJSEUcw6JkpXNeaUSU9AePOT738Wdt0WUL3wtTQ0qTpnoA==
X-Received: by 2002:a05:6512:684:b0:585:805b:e3b0 with SMTP id 2adb3069b0e04-591d85ae86fmr4502083e87.9.1761188040065;
        Wed, 22 Oct 2025 19:54:00 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d1f26bsm346957e87.77.2025.10.22.19.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 19:53:58 -0700 (PDT)
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
Subject: [PATCH v3 0/2] media: i2c: add Samsung S5KJN1 image sensor device driver
Date: Thu, 23 Oct 2025 05:53:54 +0300
Message-ID: <20251023025356.2421327-1-vladimir.zapolskiy@linaro.org>
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

Changes from v2 to v3:
* made data-lanes property optional and described its supported value (Sakari),
* removed a macro over a number of supply regulators (Sakari),
* simplified a function to calculate pixel rate from lane frequency (Sakari),
* added a error check in s5kjn1_set_pad_format() (Sakari)
* added a trivial function to get crop rectangles (Sakari),
* minor changes in s5kjn1_probe() function (Sakari).

Link to v2:
- https://lore.kernel.org/linux-media/20251016020419.2137290-1-vladimir.zapolskiy@linaro.org/

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

 .../bindings/media/i2c/samsung,s5kjn1.yaml    |  103 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/s5kjn1.c                    | 1407 +++++++++++++++++
 5 files changed, 1529 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
 create mode 100644 drivers/media/i2c/s5kjn1.c

-- 
2.49.0


