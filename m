Return-Path: <linux-media+bounces-42818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FFAB8C767
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 14:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A2F0581F2C
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 12:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA5E3016E7;
	Sat, 20 Sep 2025 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ummTROZD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866781B87C0;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758369835; cv=none; b=Hms5F4h7v355mpRv/UOxb5YchK7aw2lS0jwT6u2eGcmFokEMpTwP7lHpj8UvThu6cm38QyecGv1tXxwedgnGJswwihmeLMEMvjSTtbHtjmYa9UQCWeC9gLjpvTfueB5ejZCShbxtzsRN6KxENhWtrI0E7cjv7KSTInYX2iDuTc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758369835; c=relaxed/simple;
	bh=xX8mdKL0drmu1HYdr0BtmNvCDrB96bVL3f3GE/mOqnQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nztk795cLPQffhIGEtjwywN/ogFI59UEMy6g32b+9MyaHPfi2KX8ItL5L5un/ui4UY9fFSCHE7Fm8CLNKcR66KcOiN2jP6NIfUJQvyQ0Hvqhq8UWWWcNb5csca+QRQmNioccmPVbME/2A9fR11vHWEMD+re28EOWiwLt/OOLpwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ummTROZD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04CD7C4CEEB;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758369835;
	bh=xX8mdKL0drmu1HYdr0BtmNvCDrB96bVL3f3GE/mOqnQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ummTROZD4Q1xxFyVhn1bE3vEslcZXJp2Mux1vvncZEW4dYlV+RWUmYUrnLXSPTaZI
	 S3LZtJUxixn4YaIpJD7xqar1YTant4gvIzjG1YXwDHMINAq3ZJd81PTXcCOT6xMAuz
	 mUg/w0dWwjDX0LYvGsVluPuC3jqoNY+7A0zyXo+ocKlY0rntLY0reH5YpJ31S0/I+0
	 XZif1GrrVtAvEC5wPNttlqQO9w54poS4/hiup9Nmu5x7unNZ7KOEArmD3Cu5jdLSyI
	 ExRLLrAnmp67J3/aUodL34Kz5kUS8N2TFWqPe20+yq21gA00sZNszfqzdHIbRd7Tgw
	 aqwjUF9svlcFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2556CAC5A7;
	Sat, 20 Sep 2025 12:03:54 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v2 0/8] media: i2c: dw9719: add DT compatible and DW9718S
 support
Date: Sat, 20 Sep 2025 14:03:39 +0200
Message-Id: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABuYzmgC/zXMSw7CIBSF4a00dywGSMvDkfswHSC92DtpG6j4a
 Ni7WOPwPzn5NkgYCROcmg0iZko0TzXkoQE/uumGjIbaILnsuOaWDQ+rhWXGGSMlBi+uAup5iRj
 ouUOXvvZIaZ3ja3ez+K4/wgj9J7JgnLVShVZ5ZV3nzm6h9Z38eMQ79KWUD7tPxW6eAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758369833; l=2668;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=xX8mdKL0drmu1HYdr0BtmNvCDrB96bVL3f3GE/mOqnQ=;
 b=uSeJi/hISwdEZNt+1DnPzeXEdlyjfxxb3x5fiS0Y0ZokJb57VNFsRSXEMWB8a4LjbsTRPKuQT
 SYxZk8GQ3GpCkkOZAGi36HYP6TUUPnICdX2JOdeyhCjAb2/zp494x3i
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
Changes in v2:
- Add patch (3) which removes i2c device table
- Restructure patches because of that
  - keep patches 1 and 2
  - add patch 3
  - patch 6 becomes patch 4
  - patch 3 becomes patch 5
  - patch 4 becomes patch 6
  - patch 5 becomes patch 7
  - patch 7 becomes patch 8
- Patch 1 (bindings)
  - Remove unneeded 'minimum: 0'
  - Remove if/then that handles 'default' to reduce complexity
  - Add myself as maintainer
- Patch 5
  - Fix void-pointer-to-enum-cast warning
- Patch 7
  - Drop pm_runtime_mark_last_busy(); it is already called by
    pm_runtime_put_autosuspend()
- Patch 8
  - Remove extra parentheses
  - Print error if writing to power register fails
  - Add reason for doubled waiting time during power up to comment
  - Pass NULL instead of unused 'ret' to cci_write()
- Link to v1: https://lore.kernel.org/r/20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu

---
André Apitzsch (3):
      dt-bindings: media: i2c: Add DW9718S, DW9719 and DW9761 VCM
      media: i2c: dw9719: Deprecate dongwoon,vcm-freq
      media: i2c: dw9719: Remove unused i2c device id table

Val Packett (5):
      media: i2c: dw9719: Add an of_match_table
      media: i2c: dw9719: Add driver_data matching
      media: i2c: dw9719: Add DW9718S support
      media: i2c: dw9719: Update PM last busy time upon close
      media: i2c: dw9719: Fix power on/off sequence

 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  88 +++++++++++++++++
 drivers/media/i2c/dw9719.c                         | 110 +++++++++++++++++----
 2 files changed, 178 insertions(+), 20 deletions(-)
---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250709-dw9719-8a8822efc1b1

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



