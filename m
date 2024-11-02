Return-Path: <linux-media+bounces-20710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0502F9B9BF3
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 02:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EA231F21D48
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 01:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099D75FEED;
	Sat,  2 Nov 2024 01:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="S6PVYOmr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A0F4C66;
	Sat,  2 Nov 2024 01:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730511157; cv=none; b=Ds1/5jODgdI2FSGGmm+Pzm8ZI+7wpGFWoUY6nQ9YsllWdj5ZZ4GTTco98w7A9Ky21+KormUnYZKANiVlBh6EW81YD613x03RoEOpBfZs5PDGIWk30hRADTJtRKlD3guSZRFqrlG/5XdPAC8yZMJYTAQdhmjvThiDp1oZ3SplfNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730511157; c=relaxed/simple;
	bh=Z8Eqi287/LRs5aQXsTLr2gMdeAdGT391y9PigMh1Vs8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y/+qTGFknPEyMmQmm6oJfXU8fxqEV5K2Zx5hTzVP/p7BVwp4KSavdGzVMcVZMyFI4jeuwNrWcecXtgliTfcIPhBRZXf4bzpnHGsrSOfewtJCbamrxoxnEmCxMIbrhtizaCbhmND/WhpgcP7mSOfJxuweqq/y7p8oLQjDCAyNmKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=S6PVYOmr; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.0.162] (BC24930C.dsl.pool.telekom.hu [188.36.147.12])
	by mail.mainlining.org (Postfix) with ESMTPSA id 32851E45AB;
	Sat,  2 Nov 2024 01:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730511153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JDDoz4b5kdaZD2eVt/HBGWPglFBhUzUbG0grE/lXalA=;
	b=S6PVYOmratTIK7hjisjmyCkDDqXgtqYhdSkqdgT6zXTlPT3BGtKlJPfe9ijBlH5c7GcM2K
	b11CPvxl8v3cPmnB8K8/YeDKEz5VZlhq3ZaVURWIjyEf2rlE6+e/Yx6/Dp3e0SgS0F72U2
	eW4jB5hmPxqxLa4tx0sMd1UQCt4dW3MGKpf512OPpo6ZpK1LTG+KxW0whKrTPPb0Xw6cBc
	6UOM0+i7m5BunY0DUI8Snf74zS7U3BcjzxurZu46lmmsY2Qsn4+S88HmcA9CJvoMnjgVUZ
	l1+IeAIv65Leni1QtKvMzEQDDJ20Y04wZbBU8/fEFLxEvikiHII18IL/5GM7PQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/3] Add MSM8953/SDM450/SDM632 camss support
Date: Sat, 02 Nov 2024 02:32:27 +0100
Message-Id: <20241102-camss-msm8953-v2-0-837310e4541c@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACuBJWcC/3XMQQ7CIBCF4as0sxYDFLR15T1MF0in7SQChjGNp
 uHuYvcu/5e8bwPGTMhwaTbIuBJTijX0oQG/uDijoLE2aKmNUlIJ7wKzCBy63raixc5JczZ48iP
 UzzPjRO/duw21F+JXyp+dX9Vv/SetSkhhpNLW9pO/e30NjuKDIsX5mPIMQynlC54UpFKvAAAA
X-Change-ID: 20241101-camss-msm8953-3e8a0474e6cd
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Barnabas Czeman <barnabas.czeman@mainlining.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730511153; l=1306;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=Z8Eqi287/LRs5aQXsTLr2gMdeAdGT391y9PigMh1Vs8=;
 b=zEpszkI2Cf5IOc7M5HfCGBXKLBAmBy3aFX6JnMEPnu+lGiFEsmOuG7Uda5Rqv0C/Uv1YariX+
 yfXq6wCG+qhCrD4CFH3dttYHmpuMGk+LGzNf8IuWVDDpmsKAC9Olj3j
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add camss support for MSM8953 based  devices.

This patch series was tested on Redmi Note 4 (mido).

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Add power-domain-names and pd_name.
- Fix style issues and orderings in schema.
- Link to v1: https://lore.kernel.org/r/20241101-camss-msm8953-v1-0-4012559fcbc2@mainlining.org

---
Barnabás Czémán (2):
      media: camss: vfe: implement pm domain ops for v4.1
      media: dt-bindings: media: camss: Add qcom,msm8953-camss binding

Vladimir Lypak (1):
      media: qcom: camss: Add MSM8953 resources

 .../bindings/media/qcom,msm8953-camss.yaml         | 323 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-ispif.c    |   5 +
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 170 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 7 files changed, 509 insertions(+), 2 deletions(-)
---
base-commit: f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06
change-id: 20241101-camss-msm8953-3e8a0474e6cd

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


