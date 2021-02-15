Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEA531B493
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhBOEaw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:30:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45318 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhBOEaj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:30:39 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB82718FE;
        Mon, 15 Feb 2021 05:28:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363299;
        bh=lU2+5dUi+ZKmkTZVfa3I8OrNtirBYCQXiCPZXGZBrZY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wm4rGJDhUVB4wI3tjJukNN4+0iSdQclmcIEyNqBz0DLFG5uaUs0cADmrEg5yiufpX
         81QSCPPWJyyCnQsTds9cTZuxKnFSZfq262HrMJf5TX0PnoidYqiKynzT5Dq73pDKa2
         G9Nmc8oDERHMCy31GeIul9pwnzy8PXeGkg9tE62o=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 10/77] media: imx: capture: Handle errors from v4l2_fh_open()
Date:   Mon, 15 Feb 2021 06:26:34 +0200
Message-Id: <20210215042741.28850-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the call to v4l2_fh_open() fails, return the error code instead of
proceeding normally as if nothing happened.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/imx/imx-media-capture.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 50bbcb1217e3..101ad562c2eb 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -643,13 +643,16 @@ static int capture_open(struct file *file)
 		return -ERESTARTSYS;
 
 	ret = v4l2_fh_open(file);
-	if (ret)
+	if (ret) {
 		dev_err(priv->dev, "v4l2_fh_open failed\n");
+		goto out;
+	}
 
 	ret = v4l2_pipeline_pm_get(&vfd->entity);
 	if (ret)
 		v4l2_fh_release(file);
 
+out:
 	mutex_unlock(&priv->mutex);
 	return ret;
 }
-- 
Regards,

Laurent Pinchart

