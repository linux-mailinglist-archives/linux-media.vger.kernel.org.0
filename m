Return-Path: <linux-media+bounces-1971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD42E80A6A7
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55170B20D33
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA57225D4;
	Fri,  8 Dec 2023 15:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gAuvzIPL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 732FB122;
	Fri,  8 Dec 2023 07:08:12 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.108])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5801EBA;
	Fri,  8 Dec 2023 16:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702048049;
	bh=nrEAdhHZwA2L0AvxJ6FGfgqEfXwThQSUE+QCVNTuuhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gAuvzIPLzZbXJAQOVLdFaCDYd4M7E8B4M6iDC4DeTXNdPI1Mc+WFc8omlFcUDmeeJ
	 tuvNgP8E5C3mjtX+vsWmKDvyeLDlRNgHMXfzonSj+Zgw/A+PqS3K7h9oV6LV01NEDb
	 YZaGhlOkwcvLOpu60KBkOgFrLjqmZtzQw+y4W6zc=
From: Umang Jain <umang.jain@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: "Paul J . Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/8] media: i2c: imx335: Improve configuration error reporting
Date: Fri,  8 Dec 2023 20:37:49 +0530
Message-ID: <20231208150756.124720-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208150756.124720-1-umang.jain@ideasonboard.com>
References: <20231208150756.124720-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

The existing imx335_parse_hw_config function has two paths
that can be taken without reporting to the user the reason
for failing to accept the hardware configuration.

Extend the error reporting paths to identify failures when
probing the device.

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index cbabef968e21..31c612c6bdd8 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -795,8 +795,10 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 	}
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (!ep)
+	if (!ep) {
+		dev_err(imx335->dev, "Failed to get next endpoint\n");
 		return -ENXIO;
+	}
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
@@ -821,6 +823,8 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 		if (bus_cfg.link_frequencies[i] == IMX335_LINK_FREQ)
 			goto done_endpoint_free;
 
+	dev_err(imx335->dev, "no compatible link frequencies found\n");
+
 	ret = -EINVAL;
 
 done_endpoint_free:
-- 
2.41.0


