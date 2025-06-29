Return-Path: <linux-media+bounces-36175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB07AAECE1B
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D93883B0418
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 14:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCBF23506D;
	Sun, 29 Jun 2025 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIbWq39Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8472B230BE5;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208574; cv=none; b=Itfg5kLR9m9T7HTmqHQt/+sqfZanVn44/tOc1S9uMocsyU3tAxFgF53cRc0C50s3auJ2FizGVvOT7IowfgtZKZikYqldKsdPQG/WJ9sSVJy2lTrdnFX/Za54rzJYr9bCsed6Zi1V88cFLcz5j5N9pv/UL7wMkh76cv6vNoL+cVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208574; c=relaxed/simple;
	bh=Qrm0HjuGR3bHxMm7TLB4FwO8uMQKo+bfdVF5GxtW79o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OC60o+Ek03jO134n66R77hcZSDm82jx1CF35iD2sr2NDP4tR7y1JfVeK5AGAOTJcbsQH6PMdqjMNVWRwBqwOpFnPY7LsuD5y52mABrDcphktWheWM3grSTJblF7aIPalDBSYX/O/cegLExlGvOgeT1Na6L1nvKMGygnL7AuOtJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIbWq39Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27D87C4CEF0;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751208574;
	bh=Qrm0HjuGR3bHxMm7TLB4FwO8uMQKo+bfdVF5GxtW79o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XIbWq39ZcOcPz4chx3UH2vg/Hurcr9cGLsARHi4dcbmYwzVQhzyRXdEplsEUKnxG3
	 ejEWC4Acst8ZFlhus9D/4nSkZUlCqkXLZX3HJtlIYg29sIY9PjNFMCNlqlGBfngyYP
	 F2mGcov7REKac+SNdBL/ZfxTMOtGlTP/Xd0M+7wZ+oiyJ4mSE3kLGZmRjDa8m0skYW
	 LAjsmLmsOBtbDzMwUygorypEu4bgm4BCbbkHKPZG05LZIOEdkJna582DeT4zZhm+vq
	 D5wnrsaqClcc0tnzzP5pKnHzp3Cbhli2xVDumP5k7XJyyFAi0WoZyIqhpYm8UiwvG+
	 fmeYtclt99mpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15844C83026;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH 0/5] media: i2c: imx214: Add some style improvements
Date: Sun, 29 Jun 2025 16:49:19 +0200
Message-Id: <20250629-imx214_fixes-v1-0-873eb94ad635@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG9SYWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNj3czcCiNDk/i0zIrUYl1DI+M0IwvTNNMkMyMloJaColSwBFBHdGx
 tLQBbj4ZMXgAAAA==
X-Change-ID: 20250623-imx214_fixes-123f285f5b62
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751208572; l=963;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=Qrm0HjuGR3bHxMm7TLB4FwO8uMQKo+bfdVF5GxtW79o=;
 b=mdoLtV5SWyla4ObJye/fTmXTvFkEF1uQdtwjacG5Eii5Cr5bMPpjaraofCZA60PwaCvFLH6YI
 f1BC7ZEWRhKCU1qdoC89TWcw02vqt4mM6G7mKjwhWUzJIT+XSkiyyXt
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
André Apitzsch (5):
      media: i2c: imx214: Remove unneeded parentheses
      media: i2c: imx214: Drop dev argument from imx214_parse_fwnode()
      media: i2c: imx214: Use __free(fwnode_handle)
      media: i2c: imx214: Move imx214_pll_update to imx214_ctrls_init
      media: i2c: imx214: Separat legacy link frequency check from PLL calculation

 drivers/media/i2c/imx214.c | 245 ++++++++++++++++++++++-----------------------
 1 file changed, 121 insertions(+), 124 deletions(-)
---
base-commit: 5e2562c1e46d3623fbdef77693f374eade075840
change-id: 20250623-imx214_fixes-123f285f5b62

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



