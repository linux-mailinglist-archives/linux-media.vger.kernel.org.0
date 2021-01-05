Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514382EAE66
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbhAEPbv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:31:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbhAEPbv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:31:51 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49EED8C2;
        Tue,  5 Jan 2021 16:29:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860583;
        bh=TK0Vw6F90kf7bX9OxewqspAANKIXHSenhtRm4C69tf0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RhM85teKGqnv+VhDOibla8ESABqyxRCNaj1hdL+nHcCCzfVa+cmHWgpgt0O9yZYQO
         a0jSEdaivpcjt5pz7n6g+ucpP0yyvdN+IyJ6xOD3Ojv/KK4rGp4EolQNCqy+NHfRjg
         s7Q1+SIuj+YK0B6odcvg9CbKZ1uY508q1U516Gmw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 11/75] media: imx: capture: Handle errors from v4l2_fh_open()
Date:   Tue,  5 Jan 2021 17:27:48 +0200
Message-Id: <20210105152852.5733-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the call to v4l2_fh_open() fails, return the error code instead of
proceeding normally as if nothing happened.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 0b1dbff198a2..b599e30df338 100644
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

