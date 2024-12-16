Return-Path: <linux-media+bounces-23494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7CF9F3C5D
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79C471890B7F
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 21:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2D71F03E1;
	Mon, 16 Dec 2024 21:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dChWhtOd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD641E8823;
	Mon, 16 Dec 2024 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734382892; cv=none; b=HgWkOzVYP2H5EbtheGVgamHc0dyyxDPSNFbHHrNgz1qBPb0e8LwoHqYjApKA79HH3t7K7pN5y1XOxf+9yWrEMTiSB0CPLNStlSzYRTPN45UHHuyPQDCL6sbyMe8CpMR1gzgOE5Q5Ssm7oeufZO+enba6zTuhiGvheTW/6vWAPIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734382892; c=relaxed/simple;
	bh=mql0VdMHxwNdxgwWS5tIw3gl03RhYb4X7yohCJHNDAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SWwvT7Kl1F7hWOIqmzeoz4X4xvcsOj/DLvCpoMzPMtMxzN5kluOrIHyy6G+YzfprLFjvRNsTGmVQJjkxLxOw7CL8cXDQXHjvH1JZbGP7e+tY+0cnZbKnj3/rhzmd+5qYQF7URtCtqdQL71+1NdRCCbR8wtnU5aUyJTsCGsfwips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dChWhtOd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CCFAC4CEE0;
	Mon, 16 Dec 2024 21:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734382892;
	bh=mql0VdMHxwNdxgwWS5tIw3gl03RhYb4X7yohCJHNDAk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dChWhtOd7ygZ7/AKlBVmHJSQKRw9rEY0GSlgLRsWCjlCXKZqspp8Lz9QaYVZOFZV2
	 QrG4nx2R2ndFGEhLehTUHdHtZoL+OzWxThptF6R+t6ZlHESX38+8bD7Xvogl5TWw1E
	 UrdqIfcd3DfWkJjTJ2fRKGPv6um874Al95TeuXF2aftjCz3eBIUfVTeK5v2eaEJexR
	 xXSgNLIj1pH/LzZhWxY5MJlE+u5oY6/g1jZRuytUEKV8c4IZgsq55pchyvcPIR9Jkx
	 XYwshXEmIKGrZmxvpAKKpvgosa33d7j7zVeq1gWsELGPuyTHx3X7yjrZCIpGRqHMwm
	 915lkxzSL5KKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BA5E77184;
	Mon, 16 Dec 2024 21:01:32 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 16 Dec 2024 22:00:51 +0100
Subject: [PATCH v4 05/13] media: i2c: imx214: Drop IMX214_REG_EXPOSURE from
 mode reg arrays
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-imx214-v4-5-8cbda160fbce@apitzsch.eu>
References: <20241216-imx214-v4-0-8cbda160fbce@apitzsch.eu>
In-Reply-To: <20241216-imx214-v4-0-8cbda160fbce@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734382889; l=1197;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=Wt4lKgiTle4e7hLJrl5jH3tQeoO5pMkD6ZjLLk3ju6Y=;
 b=0TQdwxldUE/02+8nnajua7mLVAqMqjd+RwgV97/iPsvtGdm9H95YeofWYr2iNLFcAZ8Sf/PYO
 f3y7nYoylV/CNwRz4Up3mFPl6cDdkWdrWkMppdZZSEzlVYGZL8HHTxr
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The IMX214_REG_EXPOSURE is configured twice, once with a hardcoded value
in the mode_<res> registers arrays, and once via v4l2_ctrl_ops. The
latter is enough, drop the former.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 0789c149659cf98656312be575e5a7de1b8f5981..378720ad11b9421ce8a803da3072a980151667ba 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -254,7 +254,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 	{ CCI_REG8(0x3011), 0x00 },
 	{ IMX214_REG_STATS_OUT_EN, IMX214_STATS_OUT_ON },
 
-	{ IMX214_REG_EXPOSURE, IMX214_EXPOSURE_DEFAULT },
 	{ IMX214_REG_SHORT_EXPOSURE, 500 },
 
 	{ IMX214_REG_ANALOG_GAIN, 0 },
@@ -328,7 +327,6 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
 	{ CCI_REG8(0x3011), 0x00 },
 	{ IMX214_REG_STATS_OUT_EN, IMX214_STATS_OUT_ON },
 
-	{ IMX214_REG_EXPOSURE, IMX214_EXPOSURE_DEFAULT },
 	{ IMX214_REG_SHORT_EXPOSURE, 500 },
 
 	{ IMX214_REG_ANALOG_GAIN, 0 },

-- 
2.47.1



