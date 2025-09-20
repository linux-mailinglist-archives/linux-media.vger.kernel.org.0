Return-Path: <linux-media+bounces-42825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 518EAB8C78E
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 14:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 120D0582003
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 12:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276F5303A1E;
	Sat, 20 Sep 2025 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLgo5Ugy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A1D2FFDF5;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758369835; cv=none; b=KD2OxgF+mD/Ul/4ACTK0KFx7iBZlny9UIpvg3wlJ3dE+ImvCenxPyuGpwbiI5GxB3nCjbcy9wv9sUu/i1lQ9J9QyFBNG12UpLZB+VCsx/iSrlQm+3EyX6GZUbFxHqthIy3PIvcFHZNz3GVVZxCBsOkTdctV5dRKMLGLX5uRrZQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758369835; c=relaxed/simple;
	bh=cuM0nBe1tiAuXnzV30is7jGUGiFTlfNi+vFVdoJb35E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YdBuV5XEMfIRMctKTXnpBY9r7VDJc+kvtGEYOEUaVvdgEcCLtBY0iosOqgp29OsJGMXC4ODLnzlV6uPdOTu4gBtM43bNO9ReFjjq2ZXrZGHBj7NRhy1Plh0rvXr1LMclu41ETnA0iDtiNEqwyPPVIaJsMvaAAT9kfAdSfYWYkDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLgo5Ugy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64EE6C4CEFA;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758369835;
	bh=cuM0nBe1tiAuXnzV30is7jGUGiFTlfNi+vFVdoJb35E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bLgo5UgytKuLJmazghZO14AD5FNIWngXjQvs6yE/qXiZcHIQIWU2jwFZjkhOUBc+T
	 SsXrY5qCCFjP+PZLMldoM7aQmCYi8z2alqRtXMek6sd++Y6EMfVW7OElPRV0/h1NmD
	 KcAnCTEPm0eo6q1D+eMfTi5OdWCN2JeB5S3CetR/sR1XBV9gea5h92hWB0hyhc6tVk
	 y9av3D5/2/T6xBdWQLq3NxyjSj1k4xagQ0SY4ipyUJw27vsgyoaqsmnckNEXCZajqi
	 mVqmUjkXVysrLm1/0l7ohzsqnf9cB6C+yL4dCJJKo58134BW1Ch+71BpXSpBSb2vlU
	 5RnID2IWkfxXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF45CAC5A8;
	Sat, 20 Sep 2025 12:03:55 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 20 Sep 2025 14:03:46 +0200
Subject: [PATCH v2 7/8] media: i2c: dw9719: Update PM last busy time upon
 close
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250920-dw9719-v2-7-028cdaa156e5@apitzsch.eu>
References: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
In-Reply-To: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758369833; l=778;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=VbfafRxdOY0QSTO5ZHN0pYfZbUgGkIdRhbekGlrCdzU=;
 b=3eJJI02EOCQhEH1NiwouP1tDE6ONH5nW8FLORTih5gRb/z/IqGU+QhtxL38eIA9vZ6K2D4x/f
 grSdvIcxAcMDBg32/o157DOYrjdqelerYOGmHNHw06VJ2Dmakqe236P
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Val Packett <val@packett.cool>

Update the close callback to match other similar drivers like dw9768.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/dw9719.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 5e3a200db3b5df8bf49547fc842c1cfd74322a40..a24594523030df7df7fb60afb5248472b4a8ea13 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -284,7 +284,7 @@ static int dw9719_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 static int dw9719_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	pm_runtime_put(sd->dev);
+	pm_runtime_put_autosuspend(sd->dev);
 
 	return 0;
 }

-- 
2.51.0



