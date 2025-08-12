Return-Path: <linux-media+bounces-39633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 571BAB23ABF
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 533191895D56
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F08A293C5C;
	Tue, 12 Aug 2025 21:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KoX1VWOK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B3B2F069B
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755034235; cv=none; b=IFtJrEE9oHM7NZEycGBtObPoWmui5heH7eFFx6B1X+CjemgV9U6a0Er8hVoTHj1C/f760SRR+kreHkuIA6zoDKsVBb0PJ/maqVVN0toDp7EngFArALXutXrrfIcTYatpP0XJ2AodsqYMoEWzhdRUN1dqIvhKhtRTp5pA9fYjN7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755034235; c=relaxed/simple;
	bh=3bVGOgvaYtRz/DiOgO0OoOapLNzF0TPvyKYhduvb25I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDr/yvP8BUk9YXBDMyN4cxhgzOAuaAC+RbIjqaWmJx69xalLmS8uzHODCS5FHTbnVxTKwDuCQQArWOuCke/bBYz3s6+tHvC/Q6es6gd4r+8J/eS6L/FduLc3fgsPa5DY8IH2yp3fhU9rWMh62ss4IBVsA2tB8UHr4xUCANxY63c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KoX1VWOK; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55b84101d9aso1004462e87.0
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 14:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755034232; x=1755639032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=psUWPz4+wtssRKGsWfUW0I6L6tFiRQT3bgTI77yJwKM=;
        b=KoX1VWOKOuF3r3aqL1kr2iPU74ibQAqhCBPczNylZb4xsmKcw/jNXdrYau2lHi/Zhw
         XTgujw3WNjlO3L/BBhkdH04CAuGkNTYb7z9UMwW9EFBBkbh+cN6SvEM7JmEilIjqOcm1
         ztadkhzGpLMyzY7sjvKSZTe8p08eA1t8qAprlQ9HZ9dVSTm1WwzVO8WwpkFpSXijaH9/
         goTlY8IhjctdTfQFZRKxq8ri6fFYGzorB9VUgw4jwKiP3bwqKDvCXOaNt9J4xhpgq+6q
         ZMihU4JEd8iLwgP/CJ7Qf616uF8t9Xe/10MnrhqjcAWmL367xNT3pP6+HBMq7GuU6ETl
         b0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755034232; x=1755639032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psUWPz4+wtssRKGsWfUW0I6L6tFiRQT3bgTI77yJwKM=;
        b=uVg+OKdQlMLDXbQBdptUn6gCDRWb/bv9LBzq3xYMU2bzHI2Fzn6i3TmAG861veylHt
         Gi+IfLcIWJ6EGwnV4uYAOolgjgg/jV6uSyVB9lty7oDdD6DU6f0BhPHFRCvOuCUEaNmM
         nmMEiiOacUQ75RaYnq1D7U/+brt/1syENo7SzNGYaR5R8P0q2pHsQlgAfp/MP+krQL81
         j+kvpYq/9TKzhVBuRRVClSkgzdgcXk/kbecuTovFSqibusFaPMMCocGC4OWbO56y6FHZ
         l8X1SWtYpJnzibhi/Paf3xsI/gJHckRMudKoVZxrRYjPGzGf16YY/hmXMdXrd/1cqbGP
         4ajA==
X-Gm-Message-State: AOJu0Ywo2ORm3OZ4XaiPLFZORhNIpjB2O8egJT6jBqcrCoA8dna6h/VM
	Dag/7S8j4anQctm6HTTNlggv7YzUUiI6ABJskGM44GvdP7xltBQ6TSU78vIR3Q7TDTE=
X-Gm-Gg: ASbGncsQoZPfkmAsoPUbuSuZ0bMdzZS/WsOCcIilOcO69402L9TVR1yyJjGPFHpGJJP
	cj4UbDbxnTI0tZZu96UrXtZaxhe3MHlsSzfupnn05HUIwpvmNBGd+R1MGjzJjHGcLVivRXBt+g7
	nhe5Lf+YCUg8d1NTruMSIh+CBasVUhso8bW4Mdp7fO/kAXCCQxtFg+rS9NQbhf0MQwvLxfXuCGC
	2us8JwQdRlMEiQNmfxsK4jh4ZrxZcUj33GQ8CvXMXR6qM8RRkPe96+rxUv7nqEM8q+EtxD1bTzj
	qQ0aa5cu9z/j4OrxF7Qx4uM85u4pJGamwcEpoxerC3G4U8IPxsjATT7ScO3Jg27hoO68HyXFjTf
	tgl4zVwiJKCP1xmNZAmVrETTT4G3RR1b+T+K1mueowxlSUrXfaMWcuzONWrNdI6aqieHPHvk9iS
	66BD1Kkp8My3uQyX1TrH0=
X-Google-Smtp-Source: AGHT+IGKZEt10hTqYaGBDYQkcQX+jVft77pRoDdB6GrtxnJm2RdN9TM8DfIL3yibObyTJJ91TTDg/g==
X-Received: by 2002:a05:6512:2204:b0:55c:c971:2252 with SMTP id 2adb3069b0e04-55ce03fa27cmr106653e87.9.1755034231887;
        Tue, 12 Aug 2025 14:30:31 -0700 (PDT)
Received: from localhost.localdomain (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55ccccd4917sm1612331e87.106.2025.08.12.14.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 14:30:31 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] media: i2c: Add OmniVision OV6211 image sensor driver
Date: Wed, 13 Aug 2025 00:30:22 +0300
Message-ID: <20250812213024.361267-1-vladimir.zapolskiy@linaro.org>
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

The driver version is based on top of the series, which adds a new
devm_v4l2_sensor_clk_get() helper [1].

Link to v2 of the OV6211 camera sensor device driver:
* https://lore.kernel.org/all/20250729231454.242748-1-vladimir.zapolskiy@linaro.org/

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
* https://lore.kernel.org/linux-media/20250717124001.108486-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
1. restrict endpoint unevaluated properties (Krzysztof),
2. changed dev_err() to dev_err_probe() whenever it's applicable (Krzysztof),
3. removed in-driver I2C operations in favour of V4L2 CCI interface (Kieran),
4. added hblank, vblank, pixel rate and rotation/orientation V4L2 ro controls (Kieran, Dave),
5. due to unselectable data lanes property removed data_lanes handling (Dave),
6. replaced devm_clk_get_optional() with devm_v4l2_sensor_clk_get() (Dave, Mehdi),
7. minor cosmetic updates (reported error messages, goto label names etc.).

[1] https://lore.kernel.org/linux-media/8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com/

Vladimir Zapolskiy (2):
  dt-bindings: media: i2c: Add OmniVision OV6211 image sensor
  media: i2c: Add OmniVision OV6211 image sensor driver

 .../bindings/media/i2c/ovti,ov6211.yaml       |  96 +++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov6211.c                    | 809 ++++++++++++++++++
 5 files changed, 924 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml
 create mode 100644 drivers/media/i2c/ov6211.c

-- 
2.49.0


