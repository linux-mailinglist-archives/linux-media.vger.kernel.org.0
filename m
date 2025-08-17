Return-Path: <linux-media+bounces-40048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B61B29469
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 19:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7E5D4E753B
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 17:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845DB303CB0;
	Sun, 17 Aug 2025 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iChUsccl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FF32FF67F;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450584; cv=none; b=arLGZT92EKDhRDXNttaFPgq8nR07Ff/QDPGAtHbImMZRv+OejCN1zsaoMJ4S5YMDO7cV774cliWZaJ2I5ORJY+kmoTQ+ue+HBs3cuR9dRbgYHlHix9F8BhxJ3aPikIYOY0y4J8zHYK5+s303IWCAKigErvJgdjye34s98ajQhU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450584; c=relaxed/simple;
	bh=oF8OGHEdUasnDtScM1QpSp5OdLbaIVAuuSJGWGodoQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUsBZ4jOw5Xsrb0T+K3CUZB4jnq1HC3HthYhZGUFcP642VC9jlgmP2aiYz3eU8iX27zBILMTVCBwXjro6xUrJHLqkqq6TXgGbMN3KpcOzKU726vnUx1LBYHwY9xz5ZaUqAfgqjOxqJ9ga+ZaESjURee+YFLFzZP1OouLOQ4yoi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iChUsccl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D1BAC4CEF4;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755450584;
	bh=oF8OGHEdUasnDtScM1QpSp5OdLbaIVAuuSJGWGodoQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iChUscclweMx6MWlo8R7vrbyv8xxAYHD8P4h/b28Xrtv92vdpLDo/M+Ro5AoPd2qP
	 3KHeqDlFHO5QK5wG659vrzeUPqS5rUDfREINaqPEgYHzuormS5rUAh6RhE4xVVpMy+
	 b14+o0c5ffHberpvz1noNX4gTereO2ycLZPtv41d3dBkhLMJsy7uxH5amvrE6jILT/
	 doRzSbGCbPcKwnWIZ9ghF5KcCkT48kujc+jPIh9NLgHBbaXBiLOkCHpUJJbbey42E7
	 j17XbEIPJEyNVE423nam0+A1S7iD6gu4xptmPxNMDr3U+g9/8Uzo3bnGZznnNNETc8
	 zemLbzQFk8q2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F38CA0EEB;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 17 Aug 2025 19:09:21 +0200
Subject: [PATCH 2/7] media: i2c: dw9719: Deprecate dongwoon,vcm-freq
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250817-dw9719-v1-2-426f46c69a5a@apitzsch.eu>
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
In-Reply-To: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755450582; l=1393;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=CNimidG5dpwY71WsspuUUXuvPQWxHyQ+3/Fs96sevrE=;
 b=7mNobBa1+SXToZWZB7gk88AEgE+cOrgzJGmBazKbPW2H+dcQ4/MlyWas8Fj0jpKnHZVfykCRn
 QQUA9Zx27CoDWWMZgQgefplhl96JCH2xgYf70zaZObQCEmyzdfZNfc3
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The name of property "dongwoon,vcm-freq" doesn't match its purpose.
Change the name of the property to "dongwoon,vcm-prescale" to better
describe its purpose and deprecate the old one.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/dw9719.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 032fbcb981f20f4e93202415e62f67379897a048..5ed0042fce18acd9e6ce9f6cf6c6982e36fed275 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -82,6 +82,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 {
 	u64 val;
 	int ret;
+	int err;
 
 	ret = regulator_enable(dw9719->regulator);
 	if (ret)
@@ -123,7 +124,13 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 					 &dw9719->sac_mode);
 
 		/* Optional indication of VCM frequency */
-		device_property_read_u32(dw9719->dev, "dongwoon,vcm-freq",
+		err = device_property_read_u32(dw9719->dev, "dongwoon,vcm-freq",
+					       &dw9719->vcm_freq);
+		if (err == 0)
+			dev_warn(dw9719->dev, "dongwoon,vcm-freq property is deprecated, please use dongwoon,vcm-prescale\n");
+
+		/* Optional indication of VCM prescale */
+		device_property_read_u32(dw9719->dev, "dongwoon,vcm-prescale",
 					 &dw9719->vcm_freq);
 	}
 

-- 
2.50.1



