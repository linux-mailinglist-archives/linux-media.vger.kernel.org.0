Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA3B31B491
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhBOEa2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:30:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45318 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbhBOEaJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:30:09 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B788A25;
        Mon, 15 Feb 2021 05:28:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363297;
        bh=4ez9i4IiuJ2BMznP3FgmhPQm8xQeooCelUf5BM4rdxs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BN6+iDkr07YZqlDHM1aqos/H6SEaiJwd/7kUK4UrxjgFCi+oG5jcBP8WAae8S9req
         lcsDwQmKCOYgxIStYWgsEctfgEtMaWzrm6MZYlzwUmrMM7cyk3dH/2rF8LiobGH2bb
         QPsrmcKRCXnf9L4KGNB8QtLaoYB7R1KnzXDsRF9o=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 08/77] media: imx: capture: Use device name to construct bus_info
Date:   Mon, 15 Feb 2021 06:26:32 +0200
Message-Id: <20210215042741.28850-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_capability bus_info field is meant to locate the device in the
system. Using a subdev name isn't a good fit, the device name is a much
better option. Use it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/imx/imx-media-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 5fcf731ed450..4c9ae3a7c37d 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -74,7 +74,7 @@ static int vidioc_querycap(struct file *file, void *fh,
 	strscpy(cap->driver, IMX_CAPTURE_NAME, sizeof(cap->driver));
 	strscpy(cap->card, IMX_CAPTURE_NAME, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", priv->src_sd->name);
+		 "platform:%s", dev_name(priv->dev));
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

