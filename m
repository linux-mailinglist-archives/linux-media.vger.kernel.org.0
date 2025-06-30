Return-Path: <linux-media+bounces-36337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F420FAEE746
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 21:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 413DF3E083C
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 19:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756342ED17E;
	Mon, 30 Jun 2025 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlQBH0PW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F932E613F;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310421; cv=none; b=dr+2K8vpyvkYbcbNb07th0wX5HQ6MJalf9T3TZBQI3FWhGkSvw7f9orWDQi0Jy0DdPebmCPkGm40NlH8Uz6TiBDtoOrUqbCLG1T9aTJjwrp65JLqjQ1IE2cWzSAI1/Gsx7YjDeC+WUn8pGZHVMrmDztrSIB6xCZuZJ40lV3lBRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310421; c=relaxed/simple;
	bh=CsLioO4S0UhSQ7xBbQqFYY0bp80O1MggCmDLd/9lJc8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bF1AXbDBzqa25qWMlLBp/8/yCFm4CxfifJSm5Em6PuoJLTNEq9oOJ0s30ZJFFb4OL15sXo1Q8VX+jVDx2C2zj1qLq5c9WRQv6S3+C15Q44hwxDYkxYIJw5t6VIc4uv1taLco9zJ1MjZc+l1Q1qadQCFTSJe6EO9500aQb1H7mJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlQBH0PW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6035FC4CEE3;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751310421;
	bh=CsLioO4S0UhSQ7xBbQqFYY0bp80O1MggCmDLd/9lJc8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=PlQBH0PWlJYa/B7U7CxgcpUy8NX1h/n3g4YL/iRTHMi6VyxwoXdcWmsXI7gEch3UG
	 ajDwlXr1m2nGyJP2N+o5hdAH+uxQP6f2JS2j5Mikg4SWDxfJ2bqSpVj2FYePT2Crcd
	 IcHi+ydMwKXuv66fxP7eEjwyVP30phPZbquF4SNwPaTQ97GIEOqbvHsKvu/CO/QD6r
	 VUCPtwm11opb6TS/4HjzOlr01b0wcXehuEGVJdBqUbPEHc34s5umhjgpBS3RGch9Gw
	 n9T/VNs/SppEPph+NTNbCWiWdUXJb2jaYpVUF82ZXj3AXVnfCrM5fU6lwRlWiVH2xL
	 aVZF+rq7xXmFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A9CC83036;
	Mon, 30 Jun 2025 19:07:01 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v2 0/5] media: i2c: imx214: Add some style improvements
Date: Mon, 30 Jun 2025 21:05:20 +0200
Message-Id: <20250630-imx214_fixes-v2-0-cd1a76c412c0@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPDfYmgC/1WMyw6CMBBFf4XM2pp2ShFc+R+GGB5TmYVAOkhQw
 r9bSVy4PPfmnBWEApPAOVkh0MzCQx8BDwk0XdXfSXEbGVCj0xlaxY8FTXrzvJAog9Zj7ryrM4S
 ojIH2IxrXMnLHMg3htddn811/oeI/NBulVX6yVBdp1WbWXaqRp7c03ZGeUG7b9gESRQKlqgAAA
 A==
X-Change-ID: 20250623-imx214_fixes-123f285f5b62
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Markus Elfring <Markus.Elfring@web.de>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751310420; l=1246;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=CsLioO4S0UhSQ7xBbQqFYY0bp80O1MggCmDLd/9lJc8=;
 b=xY/S9YNCYbMxswSn24N7cArYaza0xKkgnfeEQCugtMHm+SSemOAnDrPx5aS1f6dP47z1nF3Ey
 5ZQuK//kTsYBh+u/a5dcuBvhu2e1OW646Gfd0S9bZSzY0hw47WGNoFJ
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

The following changes have be suggested by Laurent in [1]. But the
related series had already be applied. That's why they are addressed in
this series.

[1] https://lore.kernel.org/linux-media/20250621181751.GA9125@pendragon.ideasonboard.com/

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v2:
- Drop unnecessary sentence from commit message (patch 3/5)
- Fix typo in summary (patch 5/5)
- Use imperative mood for commit message (patch 5/5)
- Add R-b tags
- Link to v1: https://lore.kernel.org/r/20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu

---
André Apitzsch (5):
      media: i2c: imx214: Remove unneeded parentheses
      media: i2c: imx214: Drop dev argument from imx214_parse_fwnode()
      media: i2c: imx214: Use __free(fwnode_handle)
      media: i2c: imx214: Move imx214_pll_update to imx214_ctrls_init
      media: i2c: imx214: Separate legacy link frequency check from PLL calculation

 drivers/media/i2c/imx214.c | 245 ++++++++++++++++++++++-----------------------
 1 file changed, 121 insertions(+), 124 deletions(-)
---
base-commit: 5e2562c1e46d3623fbdef77693f374eade075840
change-id: 20250623-imx214_fixes-123f285f5b62

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



