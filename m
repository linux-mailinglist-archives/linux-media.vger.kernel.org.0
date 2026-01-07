Return-Path: <linux-media+bounces-50083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE8CFBEE0
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 05:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05FE23039AE3
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 04:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDE323D7F5;
	Wed,  7 Jan 2026 04:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9tCHjd/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB24188CC9
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 04:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767759874; cv=none; b=NRJW/ozFKV66NKYDFkG0d10+/eTsmPlrUW6wOVvLaOUVZZXvQy/ejgIH8k5VwWRtAQgxkqRumVzWllVs/OxQDkTw8dmd6kA+khhp5UG7ySuY0izovXMHEnZ6iiSgoichoIEGI9lieJRvlHDS9vSbnufy4Cng/R8KCSrzPL1car8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767759874; c=relaxed/simple;
	bh=QoEydU6h2r0D0PwDBN8+9gzv4tzYc8b9zBCcJbvkw1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fST1tosYyBwoXaMY5WntoyC8dtdRVWOLgK6XOC+rVQdGIj/UcCbLlytvAK8TQ27fOcErBhc1SsiovwMnPilVkAOiXyJfcRnmCDaq1jInhYV2P4lyfEOW8UBl27+ydjCpn0mGFG4NOW69mGqY+ubfj7yc/AqdryZQVPGlD9wFG5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9tCHjd/; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88fca7bce90so16190616d6.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 20:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767759872; x=1768364672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=foLR2dTcYP4XS4NpABZxr5kZsIpw5l3lYiCp5Kd5N30=;
        b=F9tCHjd/T2dUKdBmEZyjwrxPrzEGH+q472E6QgXTQ6IskzWEgtJ/5rSywo/JIghcpB
         yxCZTo2LN3ZoHt0O8wBrlVJovOddOrb6hMJLVrML5IjIOQdv9IM02PwJpqO7txrZQ8Ar
         TH22kW6MpuJzrU7bwtCupTV+Kdmo25DvdTr6eafIvb0dlsRmz7Kygvf506KN4YVT4hRC
         YAZyRt4fNbHLNxhZH9XjllYDW31vDaVIQzFV3JYWLhuXxyXWSPj0UCELHNX9YZRlTaNx
         z6sXyF8CoGI8xcGrxIRB+dgTN7tluzezgLCSWPrLti7aPmqYDHoJwMXW/HyuPeOJt0OE
         RW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767759872; x=1768364672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foLR2dTcYP4XS4NpABZxr5kZsIpw5l3lYiCp5Kd5N30=;
        b=aO3ySVvOz7Qlgqo1eH8FYTDkyk7oG8JV7Nss6t1AtGibMjDlXAqa6vB95xzhOwWyvm
         /CWG7v7qf0DjqF2/8tEBEkt4p5QrzFoRlDZlODJn8h/bg19vw/zDRS4z91U4A/Ldn0Uq
         5iG7AqJoydwx/52+DyPG1y83Ls6TYb/L2Xj8WHtlZ/KcD8gq1rMMh0iLwPJ9YecSeQZp
         vBf8gzwFf7Ses8zevsn20bYEKxca2AQvv3FE97ir/kpoGpanEXz2K8x+96P7U9zoafJI
         z8QX85v62sW5eUIlOJkJOu7KF40X3zqDqcfLHlhWtM6WJywLfsr2GsGdDhseWNMumSgl
         MPyg==
X-Forwarded-Encrypted: i=1; AJvYcCXXHaoSTpaGWA9DzFe+LQ25+AAKa7d7jU+ipu3F4+HHEHu7VMnytozkMEu6YsME/qtBcq0i4N3T1ZSCgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqBpHiOR9TxHrY3qFtvZdomhe6vNhRjWGrs5aP2aX2Z2eAqRD9
	8ny+rbSeCYtl1VwfWg4xWabXc8P4ckvqHuvzA/OELli7BJNSQrSVLwGO
X-Gm-Gg: AY/fxX7/NrvJMh7PUgCeqjQ+2RP2ooebW1tzWxLOVcNpasoxl+kGsOThppbe/4LA8zx
	6cUu+Ks7NJYSZsjCTA5IMsg3E/YZYkkT8fmOiGyJ+NjZpRpfFeV024uQ7THrspyLW/WdZc0s0fy
	pWQqVJiLpdoUjgAT3Bz/n4WgI1xREVe7GAHhLEo9vClAC0Vugt5CsIu/TH3f78epAgwThU/nYzW
	2zfFwzsGzM1acfKRl26jcEzWLhIpnTa4CiRevjwTF9SXMI5Wtei7E9etloa/OTibdJmG1PUFxlV
	lqob7by9LRUxWU+RTil9zZU3Hx0aCMIbpKokggIUG84KW2pG5Y7zn1CYC+zaQ8xNgP64NYHeLsq
	lEt9cnNUJT6I22vGdySU8PnAB+pFA2jsLzIlZkYP9gnw/x++R/O/S+QT6KvnTKfl5V/9sUFgAjv
	qqKw4DsjBKn4zLFQ==
X-Google-Smtp-Source: AGHT+IFMcPjHVkeZMdl9Hl8GA7wGzaPseWw7WxemviJhy/p7asvPmy59KOUjV7qnXWUC1pZBy673aQ==
X-Received: by 2002:a05:6214:5f03:b0:880:4eac:8689 with SMTP id 6a1803df08f44-890842709cfmr17306166d6.57.1767759871920;
        Tue, 06 Jan 2026 20:24:31 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e472csm26596296d6.23.2026.01.06.20.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:24:31 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 0/5] media: i2c: IMX355 for the Pixel 3a
Date: Tue,  6 Jan 2026 23:24:46 -0500
Message-ID: <20260107042451.92048-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

Changes since v4 (https://lore.kernel.org/r/20251211014846.16602-1-mailingradian@gmail.com):
- add NAK from Krzysztof (2/5)
- label the camss ports (3/5, 5/5)
- define endpoint properties correctly (1/5)
- use devm_regulator_bulk_get_const (2/5)
- remove clock-names (1/5, 5/5)
- set reset GPIO as active low (1/5, 2/5, 5/5)
- explicitly drive reset low at start of sequence (2/5)
- make data-lanes in endpoint optional and start at 1 (1/5, 5/5)
- add mclk3 pin (4/5)
- add Reviewed-by's (4/5)

Changes since v3 (https://lore.kernel.org/r/20250905215516.289998-6-mailingradian@gmail.com):
- separate camera mclk pins and move to different patch (4/5, 5/5)
- remove polarity from rear camera pin (5/5)
- remove output-low from front camera pins (5/5)
- mention effects of dcf6fb89e6f7 ("media: qcom: camss: remove a check for unavailable CAMSS endpoint") (3/5)
- specify single clock-name without items nesting (1/5)
- rebase on 49c6ac166cf7 ("media: i2c: imx355: Replace client->dev
  usage") and eaa7d46d9654 ("media: i2c: imx335: Use V4L2 sensor clock
  helper") (2/5)
- do not use of_match_ptr for OF match table (2/5)
- remove redundant GPIO validity checks (2/5)
- describe endpoint data-lanes (1/5)

Changes since v2 (https://lore.kernel.org/r/20250714210227.714841-6-mailingradian@gmail.com):
- use devm_v4l2_sensor_clk_get (2/4)
- require supplies and clock-names (1/4)
- move unevaluatedProperties down (1/4)
- disable clocks as last power-off action (2/4)
- use 0 in gpio pin power-supply (4/4)

Changes since v1 (https://lore.kernel.org/r/20250630225944.320755-7-mailingradian@gmail.com):
- too much to have a complete list (1-4/4)
- squash camera orientation patch (4/4, previously 5/5)
- squash driver changes (2/4, previously 3/5)
- remove labelled endpoint node in sdm670.dtsi (3/4, 4/4)
- change init sequence to match other similar drivers (2/4)
- retrieve clock frequency from devicetree-defined clock (4/4)
- remove clock-frequency from dt-bindings (1/4)
- remove redundant descriptions of child nodes (1/4)
- switch initial drive of the reset GPIO to low (2/4)
- set mclk frequency to 19.2 MHz (4/4)
- add vdda-pll supply for camss (4/4)
- use common power on and off functions (2/4)
- use devm_clk_get_optional (2/4)
- remove extra layer when describing mclk pin (4/4)
- rename regulators (1/4, 2/4, 4/4)

Richard Acayan (5):
  dt-bindings: media: i2c: Add Sony IMX355
  media: i2c: imx355: Support devicetree and power management
  arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
  arm64: dts: qcom: sdm670: add camera mclk pins
  arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera

 .../bindings/media/i2c/sony,imx355.yaml       | 115 +++++++++++++++++
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 104 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  46 ++++---
 drivers/media/i2c/imx355.c                    | 116 ++++++++++++++++--
 4 files changed, 358 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

-- 
2.52.0


