Return-Path: <linux-media+bounces-37711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FCAB048F3
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 23:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 122434A1AB1
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 21:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6089A2472AE;
	Mon, 14 Jul 2025 21:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTUO6OHd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5080B22FE0E;
	Mon, 14 Jul 2025 21:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752526971; cv=none; b=GvD8vkFW4sxd/qMF1l7evieVJw3tElI0Z2FJ8V1Kv3T5zDziZ3IDPFMbQZVSJWaQjNUNTltxXMyl5h6/R6/e3XO9BYRABFKBIS6TZ6n6IrxSyyUINj0Z2baILnki214hH0eEAdOOJgyrnvykAjS926LEsMWho82as5ReNqflKaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752526971; c=relaxed/simple;
	bh=WMxNnriEm/NoLbunp3OzPFaAF8D/CoAlBwnd/3rs62g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tl+s/HJgHlyAOn2uM57GtayuGMscTZSWQga1E+VbBIRWwwtG9sCX7D6RwRUVqxtYSJJigA2DYRTaTY3STogXz7IgtfYC0W6A3nOrKHU8f/4MvXgmnbze2Zg9smoBId09QxGpqJiFM4kS11VU1zvuktiBFPCQpI6m61b0DBYJBZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTUO6OHd; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ab39fb71dbso42558941cf.3;
        Mon, 14 Jul 2025 14:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752526969; x=1753131769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gplrP/FG68X8Pjj+2kSqYY5u0l/VjjHNXHnC2w8sKFQ=;
        b=NTUO6OHdq0xs5TnfZYWw7QSuSumUNkD1XV5xkhl8CCeBJTrGm1CtyAeDJeXd/vfcyP
         6Pi4UArikQojDx2X0+Tq/1CfqNaIRKztC5RDK75GSQCBEIKZ3MCFQT3tBMOU6FMHURRc
         P+W5V5rdT1RYEEA1eI2iG74J3RFgR/cchOxdLU4MAyAl3zvrNuOdxEvctBD0ugrPR3vg
         IoB81jGQ/Eq1M/Zu9rXAAox1s8BaOsxYKrv9QgkUPtZfWGiDONIlgad5lk5VTE/ktpwV
         dm3Vc6hWlww43CHQHpB8OYIzaNVmF3jjL6O2ladn+4YV3CLEJf43v02srtLqCNS/rEw0
         RC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752526969; x=1753131769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gplrP/FG68X8Pjj+2kSqYY5u0l/VjjHNXHnC2w8sKFQ=;
        b=iRqdRHgfwCdeHvgmoNPJQjgdJDuXqDiXGidCuecptvJG3sgM18S5D9jQiBIjwEh8lG
         50T9j1XQYflMpRCr8lZogOHgMRNP4Wui3UyWQ+0CzILpbe4vBMRg2kvRCYxgXuxMrNNC
         O1crQJ9dbBjhzJzwz1JIKKyctfao2mKqX1vWGQXcSFULK/lFrt+bNASNyi82qihHA9mk
         RiPmrx1ECbiDkMGd8COR6WtbfxFYEaZa0LxsZ5qW2B/s1k1T3CeTOOgytSBOvhdGNOPa
         7Y99MmhmPt9ry50iWPeVMzxP6cfvc/hASOUIYJChih/6bSkUvyXGUkqGbSnNBc/g0BVA
         AxHg==
X-Forwarded-Encrypted: i=1; AJvYcCULXsmstP+Ey0KaLxaiOn09GA7bGdubOS+9X9CIPK3R7XXMQYnyTqgxKEMUpg8EsYZdHJt8tbdONQGS6KveOw==@vger.kernel.org, AJvYcCVqh1lmqom6tmX8UMPYnxXfeiMmbYzEgZG9zmfSkji1p4FC2/YDMHgMdgjlV0dmKw1MrqKzv+z6D/B2@vger.kernel.org, AJvYcCX6uRtEwdufikJfsysbGVNsa1RNDGmQAPI9ujnbhGvkH+ZgVHxiZD44xlvxtqDxQkXSK9Xz/YknriiVDiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhR3TChK1iINIul1gOflBvsHcqHbgj59gAqJtbIhfATBx3Svkx
	Qvf/3stRPjqpXf6O4MOA7vEXNDnzkG2dGUuh3x1HDi5AftDybGzxf9Zb
X-Gm-Gg: ASbGncuGxBAF1I44Gi5p6cx1vXDFkI1iiwvHeGPpGs9+sq8rwh1uFxa+TjfHL1ePGMH
	LUvyRElcdCcysQRY0YoV9TKxx7nuAcs3F23LgN+cKQ8lDHTYto2w1lsrl58d3btHo1AkA7YrXt1
	WiyTb/xpzQ13RTlW8Ws+qxNuYB0t9vMlaxm+ZWsE6cl2a0Kkr+Wk0trUL1OEzAex55TMdOxF8Cr
	lEBx3y/ettrvR0dqOdh3h9jGa4YPY65FPbvxfMcogCGfbINHW2d2v6UfX2OShtVwS35E1Q4jeAx
	gJjq/G1hzDebyPgoNku59GUuCrZMi5ZW7auI6RcaVOSRce9g2Tp6N3G68mu4MVGD/Msl8fqK5UJ
	ygiCixvjing==
X-Google-Smtp-Source: AGHT+IHGY7H21cBqs84ZKLIXZ3KHHgeaLBV+I/oOpy3rX+Dqnx8huMOBfu8Nm87UQNAaQtW+OT9HWw==
X-Received: by 2002:a05:622a:60a:b0:4a7:70a5:e726 with SMTP id d75a77b69052e-4aabba03d4fmr181986221cf.52.1752526968871;
        Mon, 14 Jul 2025 14:02:48 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::10ce])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a9edea5bb1sm53533471cf.53.2025.07.14.14.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 14:02:48 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 0/4] media: i2c: IMX355 for the Pixel 3a
Date: Mon, 14 Jul 2025 17:02:28 -0400
Message-ID: <20250714210227.714841-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

This depends on https://lore.kernel.org/r/20250630224158.249726-2-mailingradian@gmail.com
because the GPIOs would go right next to the charging, if sorted
alphabetically.

Changes since v1 (20250630225944.320755-7-mailingradian@gmail.com):
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

Richard Acayan (4):
  dt-bindings: media: i2c: Add Sony IMX355
  media: i2c: imx355: Support devicetree and power management
  arm64: dts: qcom: sdm670: remove camss endpoint nodes
  arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera

 .../bindings/media/i2c/sony,imx355.yaml       | 108 +++++++++++++
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 116 ++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  12 --
 drivers/media/i2c/imx355.c                    | 143 ++++++++++++++++--
 4 files changed, 355 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

-- 
2.50.1


