Return-Path: <linux-media+bounces-19936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C019A5744
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 00:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B22C4B22FD2
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 22:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC47519A28D;
	Sun, 20 Oct 2024 22:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4v05JZp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E481991AD;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729462452; cv=none; b=Q0ZaAyyYGoj3qAeeNO3OGqCh1s0NR0g2J3ayLr46KS16YQFfetYYEVOScVqDai04vaUbgORvFSvDHbuyeofM1InSgB1HU8TVzQX0VmZNOhfIvOfXE1bDFoVjcoU2RegsfjqpO+ony16f2EOv9JUw/M1TRnokmPH0BvcM4BtYNv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729462452; c=relaxed/simple;
	bh=kUMF23bGvfWmOwYeH+m6DOgo6Xe41Wh0R2rputl+dIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOPZ5c7lS86VUMWFtcOMLPofS7V1cCfBLcFa4IVakQBQ+nu5TVQucW3stcjPrLICJ7PRgSnsLRChD8Q3/yXhvKdsHJwg5S3x4aWecyqgKB/szEbGvmnLSOmdGa7bo76E6RaqVVfM9dJ2twTWYqXIN/ysGsnblBblVVJrlG2LplI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4v05JZp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBA05C4AF0E;
	Sun, 20 Oct 2024 22:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729462452;
	bh=kUMF23bGvfWmOwYeH+m6DOgo6Xe41Wh0R2rputl+dIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X4v05JZpa7vC/91Fb7XYcEhX8hQHCvnKJzGVLEIM7oPg0HhPqE5TRFlCFg2OPpiRu
	 lEU9CzZQWGk/Pt2C80ILqhlvQEv+OknM7piL/olUwFZjIi6D8I5v82JTnKlVwSn14A
	 IiV4LJDzQ04Tni3MAMqh5J83MryQolRkDxskz2pKdnt5Cxh24X1HsC15W34eXCi0Gi
	 Uo8gm2xYQSHjdF6M6ENpBcgCpoJFiKGC0DdpcE88RzwEizJ/qV5pegwUbvfKCj4QH9
	 0Ho0vGyF7Ihaxghs2q+U4ItDt96pYzrHi/5usCTjsQdGWhonIxve1m7BuIUhkTVLFa
	 2Vn7hdnN+Show==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB37D3C92D;
	Sun, 20 Oct 2024 22:14:11 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 21 Oct 2024 00:13:26 +0200
Subject: [PATCH v2 06/13] media: i2c: imx214: Drop IMX214_REG_EXPOSURE from
 mode reg arrays
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241021-imx214-v2-6-fbd23e99541e@apitzsch.eu>
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
In-Reply-To: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729462449; l=1197;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=0XA/1Uf+hc8+yHy+Gkzx2R9DneNOd4QyEdjlnWihHQ4=;
 b=KHipMYMeEviwOtMui1x5f2V3j78qegTZ93VjWBbXHeqSJJlepzmY4buo7HDWifSxSqTYtto2x
 NYy+mVezsDcAIOV+uhJdKoBi2oMg+YeLzXPE0eSC2f17ycknZPTopbA
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
index 49beba5807c5dd84109fe90b745de0484d01390c..0c83149bcc3e3b833a087d26104eb7dfaafdf904 100644
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
2.47.0



