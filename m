Return-Path: <linux-media+bounces-36173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A237AECE18
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7842016ABAE
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 14:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C03C23506A;
	Sun, 29 Jun 2025 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JY1OTZ7I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C2230BE4;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208574; cv=none; b=N0S0VgyFfve93Xhqn8dIHO4kcVaNgHlzmWkwW76Qw8DanmxLvarIsIVz81xlILZMZLg1yTEbFGao+lKC0iU5ekRKM8NZdmmZ2yzxBB66K91hC2yvtnBrZigTQ3eSb6srlKU7ZTnCXwiyaZ/0sswhu4YE6Qe9w5zReDn3s2LE3Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208574; c=relaxed/simple;
	bh=32Dk3+stv2FMV1f/SlDwjNbE8izcpX6EH6nD+4pLYQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lOB18iV+DhgUaeydlq0XdX1QBreF44+KG/O2gyjlLxT7RC3XQVmIk82HXbRAZUiY1tdPEWZZwht8dUIwpQOJXtRQzROj85XQLcd0MqCKocIcodJuGTQtFAHjdQpPvUd35PgrGYEGDBQctqUcAQof9LfgOr93SgOmPip0Ohq2zYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JY1OTZ7I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 478D4C4CEEE;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751208574;
	bh=32Dk3+stv2FMV1f/SlDwjNbE8izcpX6EH6nD+4pLYQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JY1OTZ7IGk8GI+/OOnAJmSaGyzpwUUeTwWPl+fX3QYCqMQXl+OjP8ruCtE+9pH2rM
	 PAiM+ktluwgEa+yUUr0YLZhNZC+FdsGxPQEZ/a2WYKlUoLGEXPBM6biJ6NW3kwK93Z
	 wplEn4ma4urKdRTvznDU4MjxtnUx9MZPPVEpB81iwySYZY7jN36bAzX6V3DWSx6hAZ
	 3ukr7m0bOlRRvOGJnLhzgFIwkx2YESeE3ZDV2KKjDfjRSMBvhTRjDQ1TKoqCtV3G02
	 GSUXxmf9oC6wBMyJ3PFvfmyf/v0hxrnKsyX9BEVoV2Fn2vhy8usR6rmFZDuqvTL+64
	 sr2g9+IRVjlaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9EBC7EE30;
	Sun, 29 Jun 2025 14:49:34 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 29 Jun 2025 16:49:22 +0200
Subject: [PATCH 3/5] media: i2c: imx214: Use __free(fwnode_handle)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250629-imx214_fixes-v1-3-873eb94ad635@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751208572; l=1452;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=cis5fHWWpVu5DfDmrxWq7MQBme/0c6ap6dmmUsyUgU4=;
 b=MrJ7RQvfxgUpNd59AD9NvPSsDOojWKRrzhXiQsY7fRNAClemWo/7q4/SmKqUB2WB1SFP8NpS+
 A1wXsRV+hZGCMcowgqD9K8XmXBiC2+iVv2PE+oBVwQSyzuvnSWQbVi5
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Use the __free(fwnode_handle) hook to free the endpoint when the
function exits to simplify the error path.

While at it, simplify return if parsing endpoint node failed.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index d9193bafa3cbb8fec2679200c38d30077d1b11bd..b84197ee5177d609b1395e14e1404ffa5b9a6dbf 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1326,8 +1326,8 @@ static int imx214_identify_module(struct imx214 *imx214)
 
 static int imx214_parse_fwnode(struct imx214 *imx214)
 {
+	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
 	struct v4l2_fwnode_endpoint *bus_cfg = &imx214->bus_cfg;
-	struct fwnode_handle *endpoint;
 	struct device *dev = imx214->dev;
 	unsigned int i;
 	int ret;
@@ -1338,11 +1338,8 @@ static int imx214_parse_fwnode(struct imx214 *imx214)
 
 	bus_cfg->bus_type = V4L2_MBUS_CSI2_DPHY;
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, bus_cfg);
-	fwnode_handle_put(endpoint);
-	if (ret) {
-		dev_err_probe(dev, ret, "parsing endpoint node failed\n");
-		goto error;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "parsing endpoint node failed\n");
 
 	/* Check the number of MIPI CSI2 data lanes */
 	if (bus_cfg->bus.mipi_csi2.num_data_lanes != 4) {

-- 
2.50.0



