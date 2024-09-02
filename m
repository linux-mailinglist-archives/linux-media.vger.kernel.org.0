Return-Path: <linux-media+bounces-17405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAEB968F3D
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 696221F234A1
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E767188019;
	Mon,  2 Sep 2024 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmEZeAMg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4D116F0D0;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725314031; cv=none; b=tNynJStqUp4vpJDt0RqC9lqb8WXVutUroI+TXxAHJTZV7cSirTB+MP8kLf5y+T5jjd6bCAXbE8Fr7BFCh84dfHsNP4bIRWtC0kG9D30gt2QfjvT8n1EVuKxM2cZqDZyFdDatZFCmb8jSR0LwxhsDiEOx5iwLonYTfG2WyZklHuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725314031; c=relaxed/simple;
	bh=fkLGY4U5lk/Rad59LcWYJhIpX0ElWK9FM/qu8thACn4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B2898ji/8C6iQ58LraS2xFVK83MMeIw44BYvd0CuabhxQlTTGAVWEfToRgSsG594t6hQuFXVOyUvIdk1N3yzQcbjC/kPY6Qpny9MG8Jr4/Vci/xaDy072RdiGaSCy1OrUueqkou61BFFxKxpdVEARw1adH/u1ErxKFD+KMe4ahs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmEZeAMg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46567C4CEC2;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725314031;
	bh=fkLGY4U5lk/Rad59LcWYJhIpX0ElWK9FM/qu8thACn4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FmEZeAMgRN/ZWs0iiFpt6VzgY8Xc4FuXj/q/lquz5D6hS2uBefTIurOS8TdBRycqC
	 swDy5WsZXDO0Bsg2uphXYOtqGnRQvxqF9bqE5H1bpZyQpPY3PPEUe7c0lS5A9FzIlz
	 woIQ7gjR8cMu7TBGXtLTutrxIctrw+6Uqs/1+ed5VuIb+WvFvpt5S3wtYgYWtCJZCT
	 81A9jCKPhpEVLTGUuuGIPKyk7qjB8X5VXzEY74ZN4c3mIPVSBdDwhdmEBGkAl2Kfb5
	 IBZMFETPKWHHWeuM1XOjNRLpvdyYeJwytpxXWseGzlxLXYOTAvPY5zBY5YgfWUQ8G9
	 WsV1RJfoW/PgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36183C54FC6;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH 00/13] media: i2c: imx214: Miscellaneous cleanups and
 improvements
Date: Mon, 02 Sep 2024 23:54:27 +0200
Message-Id: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABM01mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0ML3czcCiNDE10LYyMTcwuTZPOk1FQloOKCotS0zAqwQdGxtbUAjcG
 iblgAAAA=
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725314079; l=1440;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=fkLGY4U5lk/Rad59LcWYJhIpX0ElWK9FM/qu8thACn4=;
 b=E/Uhb4OXlg2lmNafSJOLnsbDj7RCoODhTb3s5BxODnAqUXPumwIW+Y+dbgrwiwHRTIBnozf5C
 UnTyBygQ/96C+y/xVYJlBGSDhYUg+BK+fyPZhsLZaxVOnPWhKWWDzXr
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

This patch series is a collection of miscellaneous cleanups and
improvements to the imx214 driver.

The series converts the driver to the CCI helpers and adds controls
needed to make the driver work with libcamera.

The changes are inspired by the imx219 driver.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
André Apitzsch (13):
      media: i2c: imx214: Use subdev active state
      media: i2c: imx214: Remove unneeded goto
      media: i2c: imx214: Simplify with dev_err_probe()
      media: i2c: imx214: Convert to CCI register access helpers
      media: i2c: imx214: Replace register addresses with macros
      media: i2c: imx214: Drop IMX214_REG_EXPOSURE from mode reg arrays
      media: i2c: imx214: Use number of lanes from device tree
      media: i2c: imx214: Add vblank and hblank controls
      media: i2c: imx214: Extract format and crop settings
      media: i2c: imx214: Implement vflip/hflip controls
      media: i2c: imx214: Add analogue/digital gain control
      media: i2c: imx214: Verify chip ID
      media: i2c: imx214: Add test pattern control

 drivers/media/i2c/Kconfig  |    1 +
 drivers/media/i2c/imx214.c | 1313 +++++++++++++++++++++++++++-----------------
 2 files changed, 803 insertions(+), 511 deletions(-)
---
base-commit: b891f84dd1f93ef4a716f10a70da80db443db431
change-id: 20240818-imx214-8324784c7bee

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



