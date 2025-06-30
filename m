Return-Path: <linux-media+bounces-36338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D98DDAEE749
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 21:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6AB4188304A
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 19:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824802ED857;
	Mon, 30 Jun 2025 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDQWat00"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DE12E62AF;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310421; cv=none; b=S2P2l6mmL6D48j2+yXse5YDTDk3WYLALMG46brzABs6TPsAfqxTebBnuvQOX4/CkqZOjZ1qgib3qIwJecVWS7VfxsK1+Vt63EU6Pqw+fSLt2g6W4hrX/kZxzcajSgEWJK9C2W0x+xl5HKqIFFFbAljkCmkbrL+kSzSYezVZk4pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310421; c=relaxed/simple;
	bh=1oA5HYoHDlOdLDnH2gUHr3xPvXZnlg4xzE1bc8Tsssg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P8kWHGCHCqe6jTwUaRysnv7Nb1JAm0u9Gw99GSTTyXWfrjREq0EovFVAImdRV56wcxe98CyA+y+F7i5QdlSctHA/TAqCnCpipytkHLJ/iGq1LZ47HGzsXL40Xi+M6EHmDnu6b8BrGMojpgRmZdQXRB6ZvNgHQsROhW2dx6yffIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDQWat00; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7CCBC4CEF5;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751310421;
	bh=1oA5HYoHDlOdLDnH2gUHr3xPvXZnlg4xzE1bc8Tsssg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MDQWat00IX0M+hPXctSam4UpLCDAAG7PQKUvBtEy/G3DuCNUZ2tu72yRP93nZQXLL
	 fJ5pKLfUcnh3MW/UjBo1xphtffmVDWoSnHYw7O8bQHzbnwXqY0so/UZEiDLgscCQ7K
	 a1ZP+X+rx4i2BkS5ocsKEVq/q5e1iuVHHcBHiJD3liU7CB4pfVpG4gof2fEzORGWLm
	 yy1dxufw4r++S3PXMgLSDaL6COmOL/7g3vY211zJOeCBg4pI5YUtxFyLfGDbj06evJ
	 pDfpfjomqQXETmVLGMMRMKfld/Ug8sf7Qgek0fxNp8Se8lUxqDga6yYMYtK5Yxtd3Y
	 /bUf6Exl+/jTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F798C8303A;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 30 Jun 2025 21:05:25 +0200
Subject: [PATCH v2 5/5] media: i2c: imx214: Separate legacy link frequency
 check from PLL calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250630-imx214_fixes-v2-5-cd1a76c412c0@apitzsch.eu>
References: <20250630-imx214_fixes-v2-0-cd1a76c412c0@apitzsch.eu>
In-Reply-To: <20250630-imx214_fixes-v2-0-cd1a76c412c0@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Markus Elfring <Markus.Elfring@web.de>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751310420; l=1224;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=B0DoG/QzE0dwOg3xIuySaJ133mLZqVs0+/AN502VxYw=;
 b=lG0lxn/StKH0FQAb/9jjIFE6k22V29bS9210YQKnoanP22iorKdSgUmML+KnrEC1JQSGRo3Wp
 CZkKn2iRn6XB+VCLz/YJRzdjuIH5u8jWN3BlXkiL1I8QVu6nYtVhCyQ
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Make it easier to drop the legacy support from the driver later.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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



