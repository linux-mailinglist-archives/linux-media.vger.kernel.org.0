Return-Path: <linux-media+bounces-44451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA91BDACE5
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 000624E9103
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349E6308F2C;
	Tue, 14 Oct 2025 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6hXNNd+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888893019A6;
	Tue, 14 Oct 2025 17:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463645; cv=none; b=Yl2HVvV7oq5FMHYRupaTp9z/Rz2lNAY5iPEimBDgMGbK0htajR5LajYPKLYY6R0lmF23UZUUsPfiiWEOvieU14oyHE7ts1TenWoZB44okgGOCdDWgtWO0J5KLXXMLlRlodWhREaIkkzuGN+vTHkrylRcByH/SnASZIDBMD73uY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463645; c=relaxed/simple;
	bh=zkGbMlEwNKrZyFRP/07H11vP+DRa2xuS4qS5FucimXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RaoW4ort6TIiMYEz4F7QEqz1Y1JAYyW3myJm0mcpGIjZrmTldR77dXN7ae/A9MshZzf2fvwf7Xq6apLux8xfo2xDExobhaJUKIBL5PLs1iHGuBrn5/eeJH7EgS937CqVRflKNTA6FxaQ1UKMB1aa5rFe+MsyDX7VexzNVeLiAQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6hXNNd+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6006C113D0;
	Tue, 14 Oct 2025 17:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463645;
	bh=zkGbMlEwNKrZyFRP/07H11vP+DRa2xuS4qS5FucimXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M6hXNNd+n2ov1Eg6xE9wHj7M3voTFXTxhA+0tRYqCus5AT5WSewTu/Ep1SgNEQWUa
	 gLQ2OI4mQFq7A3xRCYKxTt7LyqFk7jFcnGpQzwG57h5DPwg6KCqpHz46VzY14YGjMt
	 +fP27pRAS/EIhyTiXA6l0MJX30oEXTe0w1nsMM1CugBTfUmGf3/QZ0e3nIooj2DOMR
	 o6mTEOsgQzXorYUq5ly11EZAho40hkKCKdP1QwGToEZ01sDTcaqpVhH70D2KEbdfpM
	 09pCvASs8F5z0EImmegI8wvFSF13LJf5avQQKslsryIcIUGp8PWTr1mn4S3RPSTSh8
	 REsQHACRpZxDw==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 04/25] media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() calls
Date: Tue, 14 Oct 2025 19:40:12 +0200
Message-ID: <20251014174033.20534-5-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing v4l2_subdev_cleanup() calls to cleanup after
v4l2_subdev_init_finalize().

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 95d6a0f046a0..f92867f542f0 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -864,6 +864,7 @@ static void ov01a10_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
@@ -934,6 +935,7 @@ static int ov01a10_probe(struct i2c_client *client)
 err_pm_disable:
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(&client->dev);
+	v4l2_subdev_cleanup(&ov01a10->sd);
 
 err_media_entity_cleanup:
 	media_entity_cleanup(&ov01a10->sd.entity);
-- 
2.51.0


