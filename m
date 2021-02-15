Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B8431B4B1
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhBOEfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:35:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhBOEfw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:35:52 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E284B1AB5;
        Mon, 15 Feb 2021 05:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363322;
        bh=/qjyzoZKpfMFIqXKWgPQezM40s1+VDKJiiFc+PuVkEs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DTHxIrv12iuycQHcHzm7hvXQROZeXx6PeCZ/j45CYvThUJ4qVdy0HU/7UKjgJBijQ
         B+YkIWnLxC7Ma7R5pfLAKcqNoiQbGlZg4KeBGiAmsahnsIAW3Wrxaz7nNXhvBuhhWK
         uI6UDgRFNo87FA1t61UbWC7TtcR6HjJyZ38fkVPc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 40/77] media: imx: imx7-media-csi: Rename imx7_csi_dma_start() to *_setup()
Date:   Mon, 15 Feb 2021 06:27:04 +0200
Message-Id: <20210215042741.28850-41-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx7_csi_dma_start() doesn't start DMA. Rename it to
imx7_csi_dma_setup() to avoid confusion.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index dc25b593eaeb..af4119dc8fd6 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -441,7 +441,7 @@ static void imx7_csi_dma_unsetup_vb2_buf(struct imx7_csi *csi,
 	}
 }
 
-static int imx7_csi_dma_start(struct imx7_csi *csi)
+static int imx7_csi_dma_setup(struct imx7_csi *csi)
 {
 	struct imx_media_video_dev *vdev = csi->vdev;
 	int ret;
@@ -614,7 +614,7 @@ static int imx7_csi_streaming_start(struct imx7_csi *csi)
 {
 	int ret;
 
-	ret = imx7_csi_dma_start(csi);
+	ret = imx7_csi_dma_setup(csi);
 	if (ret < 0)
 		return ret;
 
-- 
Regards,

Laurent Pinchart

