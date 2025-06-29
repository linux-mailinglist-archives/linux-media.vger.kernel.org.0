Return-Path: <linux-media+bounces-36222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F76FAED122
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B65D189271A
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EDD23FC41;
	Sun, 29 Jun 2025 20:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqMqjsC4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC74223D283
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230618; cv=none; b=m8hIKTdxuOxK0bImmTmA9ZUT8uL0LhXOHJIqviuKXWC6wsiuXqs5ZPMLNDYloMZa8sB0prAk4ZsScL4VaZBZ3qnBea6NhQIBDSdqBrZe0+7BorMnpRla7YfaB3Nk5rOocrIpxmEy8Ul5y7+T/AFrUnsBWhTVUnGMdXDBRFdIRiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230618; c=relaxed/simple;
	bh=vvWD1BCvlfZ78jkMTq4DRO9alCYHlnyPJzeol9qhcZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hw9WpjAmnbGkq6zZcZmwtKJ/KDs7EH84yHuYpw3WWZgYIAX3BrxEeVkZFe2Up4OczXbXpmWVJFa8CvE+4+AMNnxw5jaVS2WNgTjqraZUZdFnxIn53SwhxaoKGnEsjBTxgX6cCNOLgkS0bpmTugo9M6JcJBydtRjLYOrn0n6d5/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqMqjsC4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65466C4CEEB;
	Sun, 29 Jun 2025 20:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230618;
	bh=vvWD1BCvlfZ78jkMTq4DRO9alCYHlnyPJzeol9qhcZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XqMqjsC4nDTKMfUJIMtICt2SM+SolSErXfV0qxogkvWyXt0YFOZ5OAO+NvGPH9AAU
	 zp+XHacoLqDEEXbUPSUGXnKaeHUIYw27fEno2qlqeexqbTvHR+6EsproxgrZjc6Jkn
	 krhuKPOGbqR3d0jiG1tPOqS0YtE0Lk6p5YB+SyzrhSuNYAw66r8/KWFh4uUNRJWQ+T
	 /4YavbTnC0NFyliExI0k4gZa1C7QdqcGkqWLjh0es7TJZdFTs7ss6hUgWsDR/yA0C0
	 riajk/hrhbSPbIdE3RAckZf/Y7O+Qt1BGoJmi9JOKanndCG+7nt8yOPjyJI4ciZvSX
	 /gK7V2ogrLsFg==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 14/15] media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
Date: Sun, 29 Jun 2025 22:56:24 +0200
Message-ID: <20250629205626.68341-15-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250629205626.68341-1-hansg@kernel.org>
References: <20250629205626.68341-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With IPU# bridges, endpoints may only be created when the IPU bridge is
initialized. This may happen after the sensor driver's first probe().

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/mt9m114.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index ec5e9ce24d1c..5e759a23e6cc 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2448,11 +2448,14 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 	struct fwnode_handle *ep;
 	int ret;
 
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver,
+	 * wait for this.
+	 */
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (!ep) {
-		dev_err(&sensor->client->dev, "No endpoint found\n");
-		return -EINVAL;
-	}
+	if (!ep)
+		return dev_err_probe(&sensor->client->dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	sensor->bus_cfg.bus_type = V4L2_MBUS_UNKNOWN;
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &sensor->bus_cfg);
-- 
2.49.0


