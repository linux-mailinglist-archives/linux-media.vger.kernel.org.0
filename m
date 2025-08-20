Return-Path: <linux-media+bounces-40490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743D7B2E840
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 991477BD020
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 22:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731902D3749;
	Wed, 20 Aug 2025 22:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AsjshsQ3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1089A2C235F
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 22:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755729947; cv=none; b=dIUHIE5IAwb3rqmSDwK19cYkQ/qa/q8FkOZWjJHaSgxUY65lFOduvA9xQQd0t9abgO/H7oRlNH08nuixzK5Gutw8Gz60Az0f7V44AGcVrVipFSuPSrGEr7CtX/bz3DpimYt+yugl2aNjkevrHxyweyUQa4xXHUXpI0cLXZRGU+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755729947; c=relaxed/simple;
	bh=LXJNINxCZnS2XvJKfx7NVSzrjFC0MN3Ti01MeGtL8Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m1xk1n+WKQ2PdYHBLB5JfebpvkOj1ignNAzZHjWxfYp9QnKPkLsJXJ/VHkXPRHbRIzrsK4LSksxITF/foFIqL+6CVqYrxJ9cZoprgwTTVAyA3YyJZguyYsHJAZ1aAZOgcbwXmdWJeUduXw0QPJtI66ARGg/h0Xke46E0udmuMow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AsjshsQ3; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55ce52b9c8fso79486e87.3
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 15:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755729944; x=1756334744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vZxq66Xr8FVSafFus/saJc6xxmXcrzIyfbnj1KG7OFo=;
        b=AsjshsQ30A0FCqorbPnp1T4TcimILXD6O5+LZmEXjsuKGGOTPYNoKX+7QtBPxPE9dl
         v8MsVIcGQZePbPk856RADeIpY7OVARdbThIFFy2E7TRAqBASd8XjrPy6WGRszdBu+y0Z
         fLiH58FDgOfNS8cpVsZWplJ98XfW3HBeuwg2snPOhE7h/WNI2+Nl/5GCWIIqbNqP4Rq8
         qnfJ4w1QPF59YEYT+J+EzOEzaWg/NxFdpYN219xQDuwNPC5NK+21K4ExGwv/3NjuuOyg
         CCT0crkzTe1DbuXlZvBORxHZ1z3xr/GwvVdAHpoL2bwyt/4Y1T4u8/r/5+6pF7+FEpaa
         e//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755729944; x=1756334744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZxq66Xr8FVSafFus/saJc6xxmXcrzIyfbnj1KG7OFo=;
        b=K7MCG5Ll+5Q6BcNS4RaVqt9ZDLsyu1qCJj8FuoR7r1NqIt0btPQ7HRnJWad/OeQMhn
         gpgUwrgF3S+3Vx7XXie2LdK68RGmknv41vBNfD3zEgp4/daKaujNqnmm43qvCiLc03Cg
         8zEKg3ey8ZnM1bHaQSIdcXyU0B7X4zHq3x2X8LYkhx6GjlpKOsfUAty60ovN67sl6WeL
         zJkbzlMvp86IAEmY8WAD2NNbaynFdQsaHt6gxa+ce0sHiMllffQQM4G25/f/uy1WA/t1
         2tskDAv44MWaHd/g9AzVQ552rWVDaP1nons2xTIYeGBeGwF3pWfP9iAIniitgrSEBfp2
         XoYA==
X-Forwarded-Encrypted: i=1; AJvYcCVKeKShy1JbxpCuWSu8jWjF/zo7lxX3lOGuUCaRnXM/nASpQQoliE+Tb9jkLqr32VEKkcaFlEaXl3WjXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLdBje7F7VOBRcHcHFsBS2ioNY1/M6ja2m9p8SXgNFUmD24xVM
	g4Zv0t7JjwLXrsalax342Y7s+cBWDO93UReCTk5+pyBlJYY1LZ66X+WrDdVd6Jz1+NA8+LdA7Rf
	SeK4a
X-Gm-Gg: ASbGnctzExHshNp2qJF/tr53kFf2CxTIaotu1L3F27VPZF7r5wKSSpdfsnRb3zm7hBv
	rd4GB6vZasJexML9+mTgkww8yvLXc+oL/atOinDeBJXv4Gl4QmKh+FmrPpTjCRgk7kYsjK9fXVN
	N1G0spzzJJXWp+IK7qisUdA1TXhTmDuR+/3x7VJp3qQzlLjkVjEaNSLFypcH3wBv3ieXwObeqZo
	AjlgXq0yyFlEOM++TfT6MYB892TO8LSNsMS2Za9w3zYDcCyM/RZmVwRapjQfPtVftuakmfES2n6
	29EpiaC8EeD/LT7r8JqNW6l+tyc3foiE30nmMZ8oQZMG2klfPX63HZFw31PSt3uUFCcdW5fS0cY
	jiSWQrP+RDarBoDNQlJP7E/VhBG8tCH9O+YxSokU6jEKUS/HmtAWdwMugFTuWr2ZcXZI+sqHh72
	h2GZByew==
X-Google-Smtp-Source: AGHT+IH2sY7FiaPhpUwuFeQWWwihgla8Xgfno2yTEVME6Z5cOP3OMkN79Hgh5adkrby9/IF8JNXGYg==
X-Received: by 2002:a05:6512:1329:b0:553:a4a8:b84f with SMTP id 2adb3069b0e04-55e0d4e7bdbmr80699e87.1.1755729944105;
        Wed, 20 Aug 2025 15:45:44 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ffcefsm2763048e87.136.2025.08.20.15.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 15:45:43 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/2] media: i2c: Add OmniVision OV6211 image sensor driver
Date: Thu, 21 Aug 2025 01:45:39 +0300
Message-ID: <20250820224541.130229-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OmniVision OV6211 is a monochrome image sensor, which produces frames in
8/10-bit raw output format and supports 400x400, 200x200 and 100x100
output image resolution modes.

At the moment the only supported resolution in the device driver is
400x400@120fps (Y8).

The driver version is based on top media/master, which contains a new
devm_v4l2_sensor_clk_get() helper.

Link to v3 of the OV6211 camera sensor device driver:
- https://lore.kernel.org/all/20250812213024.361267-1-vladimir.zapolskiy@linaro.org/

Changes from v3 to v4:
* v4l2_ctrl_handler_init() properly set error in handler, an early check
  is not mandatory (Tarang, Sakari),
* removed pm_runtime_mark_last_busy() since it's called by
  pm_runtime_put_autosuspend() (Tarang, Sakari),
* pm_runtime_get_if_in_use() replaced by pm_runtime_get_if_active() (Sakari),
* use v4l2_link_freq_to_bitmap() helper function to check a link frequency
  map (Sakari),
* added a new test pattern control, apparently it's identical to ov7251 one.

I hope I managed to convince Sakari that the change to regulator bulk
functions is undesireble, and this change is not added to v3.

Link to v2 of the OV6211 camera sensor device driver:
- https://lore.kernel.org/all/20250729231454.242748-1-vladimir.zapolskiy@linaro.org/

Changes from v2 to v3:
* added Reviewed-by: tag to the device tree binding (Rob),
* simplifed access to the associated struct device (Tarang),
* ov6211_get_format() replaced by v4l2_subdev_state_get_format() (Tarang),
* removed private .cur_mode, since just one mode is supported (Tarang),
* removed a custom serialization mutex (Tarang),
* set power on before registering the sensor in V4L2 (Tarang),
* v4l2_subdev_internal_ops: replaced .open with .init_state,
* updated signature of ov6211_update_pad_format() to generalize it and
  to simplify adding more modes in future,
* replaced a custom .s_stream from v4l2_subdev_video_ops by .enable_streams
  and .disable_streams callbacks in v4l2_subdev_pad_ops,
* add support of PM runtime autosuspend into the driver,
* taking into account a similarity of OV6211 PLL1 configuration to
  the known OV7251 PLL1 correct the set MIPI link frequency value.

Link to v1 of the OV6211 camera sensor device driver:
- https://lore.kernel.org/linux-media/20250717124001.108486-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
* restrict endpoint unevaluated properties (Krzysztof),
* changed dev_err() to dev_err_probe() whenever it's applicable (Krzysztof),
* removed in-driver I2C operations in favour of V4L2 CCI interface (Kieran),
* added hblank, vblank, pixel rate and rotation/orientation V4L2 to
  the list of controls (Kieran, Dave),
* due to unselectable data lanes property removed data_lanes handling (Dave),
* replaced devm_clk_get_optional() with devm_v4l2_sensor_clk_get() (Dave, Mehdi),
* minor cosmetic updates (reported error messages, goto label names etc.).

Vladimir Zapolskiy (2):
  dt-bindings: media: i2c: Add OmniVision OV6211 image sensor
  media: i2c: Add OmniVision OV6211 image sensor driver

 .../bindings/media/i2c/ovti,ov6211.yaml       |  96 ++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov6211.c                    | 835 ++++++++++++++++++
 5 files changed, 950 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml
 create mode 100644 drivers/media/i2c/ov6211.c

-- 
2.49.0


