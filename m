Return-Path: <linux-media+bounces-15382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3A593E665
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 17:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54E77B211C1
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 15:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2192D8249F;
	Sun, 28 Jul 2024 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVLkdVGJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7440C81ADA;
	Sun, 28 Jul 2024 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181480; cv=none; b=tVDyzkt59Pzh66Dmf7qwaMwLZptpVNwDv1k94JdI2gOJpGmjdnlf9GOTzqgB8a5huIoBXr8vbq2Beplv/Cf6oWz4FMk8u1IH3bMSzMGtdEfuo7GDX6EgmWlSqa1KgEabO5lo2idt6QFoKN9rkOfaPDcdAUOv6sS6B2KV+fYHuZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181480; c=relaxed/simple;
	bh=sYqLLLkqbeBStOv9GEZsyA5OLxo/x9VoE601Yk1kU/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWRXinzwG1uqmgtnqpGEx8w5Br+C3M5bngYvvGTfLrrqtr8pGpiFlYqd6sWQ2lk1KxwAjXxyRzySVy4obsluVy1OYOBTOeFnwWJAhb9oep2tZB2HKTirc9gRXcxRofzp1JuE3zRZdif6hSF70cglgAoVPuS1n4z649s/0YqniJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVLkdVGJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D27C4AF0E;
	Sun, 28 Jul 2024 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181479;
	bh=sYqLLLkqbeBStOv9GEZsyA5OLxo/x9VoE601Yk1kU/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WVLkdVGJhE1gXWeuEFjzYP5Txd3y5vNIdEe3PuZ7xwlGpeTyOOOcm5yUpmrDjuZ8b
	 rp+yGc+9Uc8L6GWy3nbmUrdbHUPwkVXk1vVyHJ795X9FLv1OY/+gNg2vjL7rayzM54
	 4r66iYuBWlK1dESWYoAcYu/rlOliKhOy0uMIZr4Hyuc9nXwHeRjRmJmXaG39WPOoyX
	 EPsflpfSViviVPWdLyzL5vUyPBliJGcg9LkktTa8R6yiDH7b6Xt9I+SOEliYb7Roqe
	 87qwQY1JcM1A1DQB3eq01vft5lDS6vfAXobPlCL3yMVoYBo+7VfT2sb2oidVp402sM
	 kCL4N4ABZ5FQg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	jacopo@jmondi.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 22/34] media: i2c: ov5647: replacing of_node_put with __free(device_node)
Date: Sun, 28 Jul 2024 11:40:46 -0400
Message-ID: <20240728154230.2046786-22-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit

From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>

[ Upstream commit 971b4eef86ccb8b107ad2875993e510eec4fdeae ]

Replace instance of of_node_put with __free(device_node)
to protect against any memory leaks due to future changes
in control flow.

Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/ov5647.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 7e1ecdf2485f7..0fb4d7bff9d14 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1360,24 +1360,21 @@ static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
-	struct device_node *ep;
+	struct device_node *ep __free(device_node) =
+		of_graph_get_endpoint_by_regs(np, 0, -1);
 	int ret;
 
-	ep = of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!ep)
 		return -EINVAL;
 
 	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
 	if (ret)
-		goto out;
+		return ret;
 
 	sensor->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
 			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
 
-out:
-	of_node_put(ep);
-
-	return ret;
+	return 0;
 }
 
 static int ov5647_probe(struct i2c_client *client)
-- 
2.43.0


