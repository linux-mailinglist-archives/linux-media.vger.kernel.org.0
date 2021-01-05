Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA162EAE64
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbhAEPbp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:31:45 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbhAEPbp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:31:45 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98FDC8B6;
        Tue,  5 Jan 2021 16:29:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860583;
        bh=9eoD/6BxcGafDdXR7m5ZiNw1IG7lkLOGveWIlaOsrXI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bg7/SjPhF86gvXgyPbZmMrqw/eX0BLgigfJI8b+jKlu3SpmWcjR4Asy1GeCCqsnSh
         4CTvuyhjgGoWfe7pA4WuPufRaEA1dopGD/jMsL+ljBYHqk3eGi4uYlhGmMTG9Si3+0
         Rz/CsCg0P06FNzuiyit+G3E30YTYlv1ys4A72wjU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 10/75] media: imx: capture: Remove forward declaration of capture_qops
Date:   Tue,  5 Jan 2021 17:27:47 +0200
Message-Id: <20210105152852.5733-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The forward declaration of capture_qops isn't needed, remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 8efe3d753967..0b1dbff198a2 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -60,8 +60,6 @@ struct capture_priv {
 /* In bytes, per queue */
 #define VID_MEM_LIMIT	SZ_64M
 
-static const struct vb2_ops capture_qops;
-
 /*
  * Video ioctls follow
  */
-- 
Regards,

Laurent Pinchart

