Return-Path: <linux-media+bounces-20719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE09BA2C6
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 23:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7792A1C216DB
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 22:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C251AC426;
	Sat,  2 Nov 2024 22:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oQxhCiK7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC91E86E;
	Sat,  2 Nov 2024 22:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730587184; cv=none; b=G5wnOG18cgEIl/9D00V0twOK0lAt0WFNFFs7LBbEB1+QOkf28YrHlIPHiCeL2qHZSNLllFTcIO/RFOQSLSAK7iUjazg9mW4WpIRUHALOTpc+eOH3/UAqYctWHprh6jtru6CFQQSIQnhnG/Dws4vW+w9GVEw9Oq6BJpfjpdKyJ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730587184; c=relaxed/simple;
	bh=6Eop++qcnh7z5JGQtKxoxBR8JeXXueycqdHNLIJ3cnI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QwGt4DYytjsP3bk12i2XUlDgNf0g5ZsLLATqNCUYoI8s70S67G3zqB+p5tWNIEsXOzBroaoLDlYFSiqooFStVU1/69i8U/H3Bs53L5U/jOiW5Ndl+Vd6tJ0kPx39FQKfL5TbiOTvfF5ulNC8loU7625D9bT/EkfWqwRhO2HTLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oQxhCiK7; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.0.162] (254C1E29.nat.pool.telekom.hu [37.76.30.41])
	by mail.mainlining.org (Postfix) with ESMTPSA id 5DE36E45AB;
	Sat,  2 Nov 2024 22:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730587174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GIPMrWV1SAbPsQC3sU0RnQYgR2wvrsaafxIG9OfVj1k=;
	b=oQxhCiK7oeUD8fyMpGT7nIdjUum2NT0lCW6hE31jMeM5lSFztY18KyOkfH70FTh9pHwAZv
	3HGQ8XFow5z8HH4eNSMuTRUcJRaFjJ1zNoPClxVKdJZy8ezDNeAnqC7Bj8lJTdl+xvlU+r
	WZHROpcNto6sDCkXMl8uiGol27ObeScXFUN5/hRpnvGxdyjMBIc+QTfqgdGExLAs6Hvelb
	DPb2q0afCcIaEo++D5XvcsMfoFPp2NPHBnAiOhiewdCaG1UvJJeDX5Sv8buXjZQtGzNyVP
	baz+CBEPRm2rfsGjmH2sHe8Me25YHmnQV3bQObQgBVB3pxcKQQCQbeKuHwGoeg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v3 0/3] Add MSM8953 camss support
Date: Sat, 02 Nov 2024 23:39:11 +0100
Message-Id: <20241102-camss-msm8953-v3-0-7041c9fa7a58@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA+qJmcC/3XMSwrCMBSF4a2UjI3k5mFbR+5DHMT0tr1gUkkkK
 KV7N+1IFIf/gfPNLGEkTOxYzSxipkRTKKF2FXOjDQNy6kozKaQGEMCd9Slxn3zTGsUVNlboWuP
 Bdax87hF7em7e+VJ6pPSY4mvjM6zrPykDF1wLkMa0vbs6efKWwo0ChWE/xYGtXJafhPwmZCEaV
 SsQqI0G90Msy/IGHV5a9fIAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730587174; l=1493;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=6Eop++qcnh7z5JGQtKxoxBR8JeXXueycqdHNLIJ3cnI=;
 b=c930d87zKA/VGuJyRc6K+axAuX7qzJG5z0UcG8LFIcmMuLD6Et+E3SKqxnZ+vVQy6As4S0326
 33gtS9IyYvaB8yvFl1efS3YDefuxwnUoG2NjSwz9K0ac5r40G/lYFHe
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add camss support for MSM8953/SDM450/SDM632 based devices.

This patch series was tested on Redmi Note 4 (mido).

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
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
      media: camss: vfe: implement pm domain ops for v4.1
      media: dt-bindings: media: camss: Add qcom,msm8953-camss

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


