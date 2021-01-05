Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F6D2EAEC5
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbhAEPhq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:37:46 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbhAEPhp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:37:45 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A0491BD8;
        Tue,  5 Jan 2021 16:30:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860612;
        bh=OChvj+s4FZH7XqkncWPhSaSDI3bv858iJVMYNm3NmbY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ptkCrBV7NCA69ug2RP/Ba+nW2giUhVzaEx+uJXoEliaJE891bSRUFQcrh/rHwk6oR
         ocM08oX/RMC71M+OmNIcfUso5VpzruB7e0X5SbydJNLcaAlELkrbpTxdgKWv2DASay
         BouVBXFbE4xsTdqAmCzPOuab5yf38KPDmjm1pUPU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 52/75] media: imx: imx7-media-csi: Remove double reflash of DMA controller
Date:   Tue,  5 Jan 2021 17:28:29 +0200
Message-Id: <20210105152852.5733-53-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The DMA controller needs to be reflashed after being configured. There
is however no need to do it twice, once in imx7_csi_configure() and once
in imx7_csi_sw_reset(), called from imx7_csi_enable(). Remove the
former.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index d826ac45f52d..7aec88b27915 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -530,9 +530,6 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 			   BIT_IMAGE_HEIGHT(out_pix->height),
 			   CSI_CSIIMAG_PARA);
 	imx7_csi_reg_write(csi, stride, CSI_CSIFBUF_PARA);
-
-	/* reflash the embedded DMA controller */
-	imx7_csi_dma_reflash(csi);
 }
 
 static int imx7_csi_init(struct imx7_csi *csi)
-- 
Regards,

Laurent Pinchart

