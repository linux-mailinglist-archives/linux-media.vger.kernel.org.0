Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FB3291989
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 21:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgJRTSk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 15:18:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:56766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727691AbgJRTSi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 15:18:38 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1ADD1222EC;
        Sun, 18 Oct 2020 19:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603048718;
        bh=bKe3MNMrhUKZGjJmilsT28wL8uxdUhmboq/eRPyBLps=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2mKp0/p4ztURBU+BQPpwodmX1vz3pJAN/6LNj2sQI8pcbsBBTPLNU8FKRem+ogj++
         Oh59oVEHd95W+x0/gpoZgEm55kpbIbIUiXkpppdQj+aZ3T7GZn/CbkMgIf6Kyb+12j
         xA2BwhgCvcCn2ygEW42TQtm3aqaM4T0JzzPehhiQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 024/111] media: rcar_drif: Fix fwnode reference leak when parsing DT
Date:   Sun, 18 Oct 2020 15:16:40 -0400
Message-Id: <20201018191807.4052726-24-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018191807.4052726-1-sashal@kernel.org>
References: <20201018191807.4052726-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

[ Upstream commit cdd4f7824994c9254acc6e415750529ea2d2cfe0 ]

The fwnode reference corresponding to the endpoint is leaked in an error
path of the rcar_drif_parse_subdevs() function. Fix it, and reorganize
fwnode reference handling in the function to release references early,
simplifying error paths.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/rcar_drif.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
index 3d2451ac347d7..3f1e5cb8b1976 100644
--- a/drivers/media/platform/rcar_drif.c
+++ b/drivers/media/platform/rcar_drif.c
@@ -1227,28 +1227,22 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
 	if (!ep)
 		return 0;
 
+	/* Get the endpoint properties */
+	rcar_drif_get_ep_properties(sdr, ep);
+
 	fwnode = fwnode_graph_get_remote_port_parent(ep);
+	fwnode_handle_put(ep);
 	if (!fwnode) {
 		dev_warn(sdr->dev, "bad remote port parent\n");
-		fwnode_handle_put(ep);
 		return -EINVAL;
 	}
 
 	sdr->ep.asd.match.fwnode = fwnode;
 	sdr->ep.asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
 	ret = v4l2_async_notifier_add_subdev(notifier, &sdr->ep.asd);
-	if (ret) {
-		fwnode_handle_put(fwnode);
-		return ret;
-	}
-
-	/* Get the endpoint properties */
-	rcar_drif_get_ep_properties(sdr, ep);
-
 	fwnode_handle_put(fwnode);
-	fwnode_handle_put(ep);
 
-	return 0;
+	return ret;
 }
 
 /* Check if the given device is the primary bond */
-- 
2.25.1

