Return-Path: <linux-media+bounces-40047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2302B29467
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 19:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D03242A3836
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 17:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F29F302CB9;
	Sun, 17 Aug 2025 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHY7a6Ej"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D732D3229;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450584; cv=none; b=JEYmmqPSMdy3Pt/GVkgJfMunjD0XpR+GFB9ClQtT0HA6MAAIljtZxpejzRyKraTJF99g3NghrRVxVWIZgbGOPYzROqn1cyr1Taaw5WNEnWqTzTGIPG6Imax9rw7usz4KgboAlAu2UOnPoKG4TRUr4L7nwjaJU+x7/S3OEt703Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450584; c=relaxed/simple;
	bh=swz7EduqrJXYn4m0DTsTWGz7NiPMJvLP6reejfaggDA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e0/IxmAT+OBPq6M718gE8Y5KbaTyDhWOFnmPy2W7nofMrE2J6FhEdRAf2xWZ+mTMrEI12JnUf2+IoUOAnPWiurvRrlbD0R1d7T1NF3V0EljU0CFO822jaRAfXMXcdZMSwhB3tYNmcgCiBt4CLC9HH2CCIaTExrwQdyHYCjppCw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHY7a6Ej; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30FC1C4CEEB;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755450584;
	bh=swz7EduqrJXYn4m0DTsTWGz7NiPMJvLP6reejfaggDA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kHY7a6EjbUIjYoX17Cp7SV2M2K7MrvTDSBsAPUgC2CBDWgdv2fTCXlJ6pMdG81zky
	 MFVIEUrxMY7vcpsNTCFZuUpn2GBYNaophu4LGdRShpFta7z4F9rJ5PUus8mnECR93g
	 CPXHmwSSIYzx1OzLPVWb7bYcC0OM/6LjTcNKENo+R40Bki+43j5J9uNBou+mohDwTq
	 Y/tAzcX+Xqiy3oz+tWeWMM2ULyh2yAagHUUAcIzR6LOZ1sdCmV0Es+bTqol7gR421P
	 zcjLA5XgFTnHozUQVmczrHSCez1Yu2o68NnlSYSdU1WlaF9JuZ2l9a4v5a6BOXhkLu
	 qEn/W3giQ6aog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC71CA0EE9;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH 0/7] media: i2c: dw9719: add DT compatible and DW9718S
 support
Date: Sun, 17 Aug 2025 19:09:19 +0200
Message-Id: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL8MomgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNL3ZRyS3NDS12LRAsLI6PUtGTDJEMloOKCotS0zAqwQdGxtbUA3gN
 6gFgAAAA=
X-Change-ID: 20250709-dw9719-8a8822efc1b1
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Val Packett <val@packett.cool>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755450582; l=1698;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=swz7EduqrJXYn4m0DTsTWGz7NiPMJvLP6reejfaggDA=;
 b=Ju0qSZUBUEP3Chv/ygqg2puoFe5Q9Mu7/kvpDtNbyaoSpR+dMnKWyz4hMeUna57Fe2rhS4TwG
 cn01ixbWCCiAGToq1qSUbhczDpEinCYkrhfvRz1YNeRI/tMy71VU5ZO
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

The DW9718S voice coil motor is found on various smartphones like
motorola-nora that are currently being worked on in the postmarketOS
community. Since the way it operates is very similar to DW9719, this
patch series adds support for it to the existing dw9719 driver. Because
that driver did not yet support DT, we also add DT bindings and the
dongwoon,dw9719 ofw compatible. With DW9718S, the driver was
tested fully, including runtime PM.

This is a follow-up of [1] and [2].

Changes compared to previous submission:
* Deprecate dongwoon,vcm-freq in favor of dongwoon,vcm-prescale
* Instead of per-device config struct use model ID to handle cases

[1] https://lore.kernel.org/linux-media/20250210082035.8670-1-val@packett.cool/
[2] https://lore.kernel.org/linux-media/20250209-dw9761dts-v3-0-14d3f00f0585@apitzsch.eu/

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
André Apitzsch (2):
      dt-bindings: media: i2c: Add DW9718S, DW9719 and DW9761 VCM
      media: i2c: dw9719: Deprecate dongwoon,vcm-freq

Val Packett (5):
      media: i2c: dw9719: Add driver_data matching
      media: i2c: dw9719: Add DW9718S support
      media: i2c: dw9719: Update PM last busy time upon close
      media: i2c: dw9719: Add an of_match_table
      media: i2c: dw9719: Fix power on/off sequence

 .../bindings/media/i2c/dongwoon,dw9719.yaml        | 115 +++++++++++++++++++++
 drivers/media/i2c/dw9719.c                         | 111 +++++++++++++++++---
 2 files changed, 209 insertions(+), 17 deletions(-)
---
base-commit: 1357b2649c026b51353c84ddd32bc963e8999603
change-id: 20250709-dw9719-8a8822efc1b1

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



