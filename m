Return-Path: <linux-media+bounces-33730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE306AC9BBF
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DECB17D31C
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DCF18FC84;
	Sat, 31 May 2025 16:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klMnuxR7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D07C149E13
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 16:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709140; cv=none; b=KeKLHgfFhCI7iFI3lOB9NHxvESc6Kd1alabtGFAJLCkzYIXRfFJkopUngmgBMP+3k7lIY4WBZZE2jDfJFQ3ZaNGndjiJdN3P95QyR/E/k7y9cjIrtIez+O3ntr6NtZySgUyja3gcyo59VB5dy2hXk1Hr7DpjgbPKwjFT3vRASd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709140; c=relaxed/simple;
	bh=J2efyH+WWYocapP0Ros97+bsaPWVDZcSplpNaWEFkd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJo3OPux4pejoQqU9X2UTguOSjkDUma9aPHXaQ8xq4lMdQmwq1tZkdDtNm1JzSn+IFHgMrCuqwW1SPU2HIzu+jjFgu1RVSTaN9SpCwMkC9YXkfFB+ESjsCHW7O9xufSZpVJYnIDGQQ7ZJTIE6skxa5nM8vWbayQaU6iQ8SxrePw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klMnuxR7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5FBC4CEEE;
	Sat, 31 May 2025 16:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748709139;
	bh=J2efyH+WWYocapP0Ros97+bsaPWVDZcSplpNaWEFkd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=klMnuxR7W627PvYwgJzfJnOUZRuC8kOWt5i/JILMS8gFCu0hhsIQRjvJDD8X4UtSq
	 zdBscUtHBEoz+d0RpYUCOOezC2GJ9gXdO/tuuMWnfpoklyG3bBESF4lMgwWbv6oyQn
	 /ABYOJoPfeGEYQm7asgbqqtWze/jxgKoypDS5iwr183zdKBQtAtkUqLtbkpB13lf7x
	 qb2XshwdQMj47QU79aPQal6muIsYEgYj6+PR1rlxbBlVWdOiLZhzJarv/nDPD1rGeb
	 vJU0/4sVLIY0zs9DD8EHv+hl72KrVFO7MLGmzSaWw50h3TkcAajF5CKkgGOyL6rYAR
	 +KLjfnaUjZ48Q==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 11/12] media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
Date: Sat, 31 May 2025 18:31:46 +0200
Message-ID: <20250531163148.83497-12-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531163148.83497-1-hansg@kernel.org>
References: <20250531163148.83497-1-hansg@kernel.org>
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
index c4d3122d698e..72914c47ec9a 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2399,11 +2399,14 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
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


