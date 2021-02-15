Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36C231B492
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhBOEad (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:30:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45636 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbhBOEaP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:30:15 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 368ED18EF;
        Mon, 15 Feb 2021 05:28:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363297;
        bh=lld5EfDoAtA5WNNMJ9+QNIui5JPW2HCVK4AYfQGFwyI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=No3zJgRgWiJ9TD9VgC9hw6qmULdP4U/DSi4cXSkwSfHmNpkZpk7pCKiZNtYsHvYaJ
         RqhHWJssDm68Nq0Yd0CECbxkrpZMFVxA4UnVsTMLeGj/n/jtx3y8HeD/dt86ORrcnZ
         uCjiE0wHQbTeYkW4Bww8T8YCxF6usOGw6rjZBNkw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 09/77] media: imx: capture: Remove forward declaration of capture_qops
Date:   Mon, 15 Feb 2021 06:26:33 +0200
Message-Id: <20210215042741.28850-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The forward declaration of capture_qops isn't needed, remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/imx/imx-media-capture.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 4c9ae3a7c37d..50bbcb1217e3 100644
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

