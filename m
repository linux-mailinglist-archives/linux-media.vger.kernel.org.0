Return-Path: <linux-media+bounces-20728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C9B9BA4EA
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2024 10:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A911AB21957
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2024 09:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684631632F8;
	Sun,  3 Nov 2024 09:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="F+wO/eWY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F7533FE;
	Sun,  3 Nov 2024 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730627160; cv=none; b=Bmhd6TlahSoQX8m+2AJN/4FK1Q2eb2SR5l4EIpqT4h0fW6TJ6C/1B5L5HGPFqrUJXrlwQM08VirI2zuwYNyzYN/4cG85yrTqXDSHf577CDlkMIzqwtVqemuFSAyUCbR+sI5NWX/YIRc1aS/aSJFrgK4xPmCCc7hiGkNXhB7px80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730627160; c=relaxed/simple;
	bh=2ngTE+MOj7uTHuhJZT4eNswem9AMpelsYNQGt5GRREQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XIstYlmfyrWPGP8UcuvTrzKGmFFV7saG5r2RM13sDSLSGd5A1XHrOWLEpWTm+bmU1edQcc5qOw4MdkIEOVCiugRmGI0ZSR7v14d3kvb/zP/a46jMFBMBzfP4SqUASf+fU7jls1/ot6arGMcd0eMybeeN7P4P6nBt4quBPPGb8/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=F+wO/eWY; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.0.162] (254C1CEE.nat.pool.telekom.hu [37.76.28.238])
	by mail.mainlining.org (Postfix) with ESMTPSA id 65112E45BA;
	Sun,  3 Nov 2024 09:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730627156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Iha7oo8qG3jip9wuGmXANnN6j/+LdYXuxSQ7hGfH2vc=;
	b=F+wO/eWY9SwHSuPqR4Q2TGQiUoObFXUMiSUJN5uQUfnn+yai98d+KenDan1vzNIUnu67/z
	H5e8EPmZofr0VNkKeqPHIMUoU4Zen/2DN/D9cKZcnVtgZX3m4R+tcVoSgjNam/AqTkBSo6
	Du2FUJ7dK+F9cHtijsWq+LTUxcuJPL2MhoGITnKd+3Ot9AMQjUSDu93Ue9GT4zkTURvH2h
	ysZk9hw168Z6gknGJ/ObOqX9TTXN2++QZ5NNI3PsQWNlIXAiDE+m0lPT0H1VXcsZKaUqjk
	X4yahIumbrU/L+VQKeZJsllBRI9ldD5V2I+iQXtPL6jskpgOHaYTD+tdaOKNGQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v4 0/3] Add MSM8953 camss support
Date: Sun, 03 Nov 2024 10:45:33 +0100
Message-Id: <20241103-camss-msm8953-v4-0-48d0ec75958d@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD1GJ2cC/33MSwrCMBSF4a2UjI3kaVJH7kMcxPS2vWBSSaQop
 Xs37Uh8Df8D55tIhoSQyb6aSIIRMw6xhNpUxPcudkCxKU0EE4pzxql3IWcacrC1llSCdUwZBTv
 fkPK5JmjxvnrHU+ke821Ij5Uf+bL+kkZOGVWMC63r1p+9OASH8YIRY7cdUkcWbhSvhHgnRCGsN
 JIzUFpx/5WQfwlZCMPKt26dcdp+EPM8PwHxsgqrNQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730627156; l=1673;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=2ngTE+MOj7uTHuhJZT4eNswem9AMpelsYNQGt5GRREQ=;
 b=yHRDasGy4mEausIOgsOGL/eR1OUUDwizuU2IBDysOYHu3BZstkAOmAjDZCQ/CpEDDpcmb9Vn6
 EbEGT7jPvNfAUR2dSl0yMj7x9B7Byw4AoRlXb3a/I023JhYiEzSvHcq
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add camss support for MSM8953/SDM450/SDM632 based devices.

This patch series was tested on Redmi Note 4 (mido).

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v4:
- Fix schema commit subject prefix.
- Change vfe commit subject prefix.
- Link to v3: https://lore.kernel.org/r/20241102-camss-msm8953-v3-0-7041c9fa7a58@mainlining.org

Changes in v3:
- Fix schema issues addressed by reviews.
- Fix commit messages.
- Link to v2: https://lore.kernel.org/r/20241102-camss-msm8953-v2-0-837310e4541c@mainlining.org

Changes in v2:
- Add power-domain-names and pd_name.
- Fix style issues and orderings in schema.
- Link to v1: https://lore.kernel.org/r/20241101-camss-msm8953-v1-0-4012559fcbc2@mainlining.org

---
Barnabás Czémán (2):
      media: qcom: camss: implement pm domain ops for VFE v4.1
      media: dt-bindings: Add qcom,msm8953-camss

Vladimir Lypak (1):
      media: qcom: camss: Add MSM8953 resources

 .../bindings/media/qcom,msm8953-camss.yaml         | 322 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-ispif.c    |   5 +
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 170 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 7 files changed, 508 insertions(+), 2 deletions(-)
---
base-commit: f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06
change-id: 20241101-camss-msm8953-3e8a0474e6cd

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


