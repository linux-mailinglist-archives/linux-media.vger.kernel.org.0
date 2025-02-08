Return-Path: <linux-media+bounces-25830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 380C1A2D5C1
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 12:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C549B188A179
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 11:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CEF2451E9;
	Sat,  8 Feb 2025 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIJc48uc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AEF17ADE8;
	Sat,  8 Feb 2025 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739013235; cv=none; b=ZS4Wp7jrf6cODADOb9F7KEKizj7KWYkfHvRgPHjgkZobAaciBQfIn8vwACxSDh9uurbyQADtp1SYkoedMruKmSLoxkJTSKUoFUWh9i9rGmj0AIUysr2NyQ54KXmtimq7PzGbPD8k8oYfC/0lrzS2n0SW+O3naLZSy/yzDxuPUaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739013235; c=relaxed/simple;
	bh=FrdVi2CqVa9IJh4hdyg9dLTcJLkpJ4AWnneBkooQyWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fvDJ/w5pvm4QnvAVUf3ZzdCcfgEaLPKJsRgfwlCG3xoQ1rhN78FZQUaDWA5Ot0wL5F8Hcb9641qdJwNBXI3HdHFYWDgE4R5dLYvJtkDSHPyOKCuJHmGsj5d9RtLausATTZs2kk954ioAseoLz1XWwI6VBAjoku3gfR+JgHZoZ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pIJc48uc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2BA9C4CED6;
	Sat,  8 Feb 2025 11:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739013234;
	bh=FrdVi2CqVa9IJh4hdyg9dLTcJLkpJ4AWnneBkooQyWI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=pIJc48ucSRY8HRBmS/4o2bcfNBAQPOVRVu/enYiUnAXhfbPuQbWBxDKZnupPn5xBd
	 9f4Y1PvWwIonprZadizY+mggGStUjmsxeSxLKIfzjy4RYGzUwZYTt+EFv8Or5Aenrw
	 /zgn60yzdjH+Fz3jFqL/7mJck0QNWA6mdpmulW9Zd+9Msv74lAyqyX+QxJzZus0F0n
	 SVFjO9pM3/oFaJck1YcMDmsZmdf2sF7DSIqTL0Y25FemQn089Nvm8VVtmclSfWKomO
	 Y0jqZFyLD/rCtIeReIjHQnUUdlRNiJE+ESdxwbYqYe2o607nk30dMdHpNRJFcce0mm
	 Tgvaho51CJTLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B765BC02198;
	Sat,  8 Feb 2025 11:13:54 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 08 Feb 2025 12:13:49 +0100
Subject: [PATCH v2] media: dw9719: Add of_match table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250208-dw9761dts-v2-1-c038f8a2fb94@apitzsch.eu>
X-B4-Tracking: v=1; b=H4sIAGw8p2cC/43Oy27DIBCF4VexWJdoZrDBeJX3iLLAMI5ZOG6BX
 CTL7x6atvsuf+no09lE5hQ5i6HZROJ7zHG91qCPRvjZXS8sY6gtCKgDAi3DwxqNoWTpg/fgDbY
 jOlH3n4mn+Hxbp3PtKa2LLHNi9ye0iNARKN31B7JGGYlyDnxZOfAxcZhdOfh1+cUSf93qn/Iji
 oVzdu8/9d6/reGO39zoMsuaSyxD009ak/UA9blVgZRG0i16pcGw6bseLVvjRnHe9xd6asUMIQE
 AAA==
X-Change-ID: 20250206-dw9761dts-cdcc0c714b1a
To: Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739013233; l=1668;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=b835oDqUUZS0v891A6AlggPykmhV5x5NmgzamCCTc1s=;
 b=4hhSpZKPITXRRN4vBFA46KSzOWefN37FlAADEfvQdm6PUU79Ry8HS4ryRkVrOS0GJDIQsHGJS
 3fWNMEHzD/qDwRtLdm0/SV1FW/mloJ8wuQd3KUY68+ottY4rHuay0XA
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Add of_match table for "dongwoon,dw9719" and "dongwoon,dw9761"
compatible string. This fixes automatic driver loading when using a
device-tree, and if built as a module like major linux distributions do.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
This patch depends on https://lore.kernel.org/linux-media/20241105203658.29737-1-hdegoede@redhat.com/
---
 drivers/media/i2c/dw9719.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 032fbcb981f20f4e93202415e62f67379897a048..6c76212d4c698462a9128d26ef95f0eccb243c7c 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -360,6 +360,13 @@ static const struct i2c_device_id dw9719_id_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
 
+static const struct of_device_id dw9719_of_table[] = {
+	{ .compatible = "dongwoon,dw9719" },
+	{ .compatible = "dongwoon,dw9761" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dw9719_of_table);
+
 static DEFINE_RUNTIME_DEV_PM_OPS(dw9719_pm_ops, dw9719_suspend, dw9719_resume,
 				 NULL);
 
@@ -367,6 +374,7 @@ static struct i2c_driver dw9719_i2c_driver = {
 	.driver = {
 		.name = "dw9719",
 		.pm = pm_sleep_ptr(&dw9719_pm_ops),
+		.of_match_table = of_match_ptr(dw9719_of_table),
 	},
 	.probe = dw9719_probe,
 	.remove = dw9719_remove,

---
base-commit: 8f6629c004b193d23612641c3607e785819e97ab
change-id: 20250206-dw9761dts-cdcc0c714b1a
prerequisite-message-id: 20241105203658.29737-1-hdegoede@redhat.com:v1
prerequisite-patch-id: b0a57666bd20b97291583c3052065dc314a37e79

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



