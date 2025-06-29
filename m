Return-Path: <linux-media+bounces-36177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F43AECE22
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D94891897CB7
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 14:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21208236A7C;
	Sun, 29 Jun 2025 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLZPlJs0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF62233128;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208575; cv=none; b=BzJOnIMeDIPim4FZR0LR4TPVRjSZt+vC/wZNof8z6owNRj8PM4p7SHnL9SsrfaOwu4GcyVe68KA4W4tIVCCr0icWlLp2XkwCtVIfUwwzHQmnj4xqUkVpq/DcyGWCSCaWlGsinGD6GR5IhH3Aw7CbNV3wFXUGkKSYXy5yx83DVx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208575; c=relaxed/simple;
	bh=jVm7InTmmzD8MKv7ev68okVLYkTPm5dp3cUiYjOZ1uE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ee7+aUkz4E0axHi8MeNLF5t4G5tgW4bpojcAW8EZ86wi+rPvLrEZXVz/JzxkpgaQPmTtho8ijEuIMDsGL/iNn4t7Gj980U2ePMvzLuj5UlmKcIkNv7Ggqbx4NMjGU04cXd7pdpdmVmvUcdP62hA416e3VrbWVm3Tm9OiSXUkYXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLZPlJs0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 607DBC4CEF4;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751208574;
	bh=jVm7InTmmzD8MKv7ev68okVLYkTPm5dp3cUiYjOZ1uE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QLZPlJs0Vn36xlg4/cz6RhPUpwcfiPKObaoSA4VIW3j89trb67DD2+WrSP2HVTcLm
	 JgPXOOaZfmF5U+qQZYpiLw08aA3fVC6p/e9GW1/mVXjmq2vGie0sQpRurDgSVGAThI
	 6tNnqxVsNoY/qbz6zLko9/tKWfSXsqRW9EvSpyT8bURX6HCJVMcP8DYW9d5m9oCLtL
	 GBFkCxWZ6BYmwNFtT+jAEsUP33xoz86z0463XBehUlk73lakV0qqYWNF7NkS+FOLAR
	 2gpzeR7jf3+Lw4YTU8enoiAKEM3p6E94mfEk3NbPSqNRQEiumdLb0TCc9ng/bB+Bxc
	 Ei56+JRjQ4RjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5756AC83029;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 29 Jun 2025 16:49:24 +0200
Subject: [PATCH 5/5] media: i2c: imx214: Separat legacy link frequency
 check from PLL calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250629-imx214_fixes-v1-5-873eb94ad635@apitzsch.eu>
References: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
In-Reply-To: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751208572; l=1164;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=fAmGDmfadAfG2+q/PfRs357Eh8ZGt/KKlqJTNCdh9uA=;
 b=uTy7Vr/Wz2r8Keavv7B3f00oF7RQ7FpLgLFTJhRmo6PbYIKYRQRaqolNWwFhwB02ms5fT36hg
 Ge/EdJ4CWRTDi5tqC0TuF3R/r9PdImnqhA41F9GWjPXNmrncMFfKk8y
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

This makes it easier to drop this legacy support from the driver later.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 63cf30acdc241de2f9ab3db339590da4af3d5102..52433775e9baddd8ab988e866a83387d53c1fd5c 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1362,18 +1362,16 @@ static int imx214_parse_fwnode(struct imx214 *imx214)
 		u64 freq = bus_cfg->link_frequencies[i];
 		struct ccs_pll pll;
 
-		if (!imx214_pll_calculate(imx214, &pll, freq))
-			break;
 		if (freq == IMX214_DEFAULT_LINK_FREQ_LEGACY) {
 			dev_warn(dev,
 				 "link-frequencies %d not supported, please review your DT. Continuing anyway\n",
 				 IMX214_DEFAULT_LINK_FREQ);
 			freq = IMX214_DEFAULT_LINK_FREQ;
-			if (imx214_pll_calculate(imx214, &pll, freq))
-				continue;
 			bus_cfg->link_frequencies[i] = freq;
-			break;
 		}
+
+		if (!imx214_pll_calculate(imx214, &pll, freq))
+			break;
 	}
 
 	if (i == bus_cfg->nr_of_link_frequencies)

-- 
2.50.0



