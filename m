Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B80902EAE51
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbhAEPaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:30:55 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbhAEPay (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:30:54 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC8DC8A0;
        Tue,  5 Jan 2021 16:29:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860580;
        bh=6u38c5JUaWykWN8WCpEgLQKRnRCVG8mlyhovyReyzuo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PQi0orLAn253msv/r81QqAfLDElps9xHctd3HLP6FHWYU2Z81eTMiFoDoAYSQozuK
         Z9bvudNELnlMWFbqa1M3K6TgBD79wRSyrjVA33IpT8AvuJK9Khwl8FO8WghYZncClD
         Yy4d2mQ4i5HzVrG9MPDF6K/8yzhGb8/jxov6QhjA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 05/75] media: imx: Compile imx6-media-objs only for CONFIG_VIDEO_IMX_CSI
Date:   Tue,  5 Jan 2021 17:27:42 +0200
Message-Id: <20210105152852.5733-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

imx6-media-objs contains a set of objects that are specific to the i.MX6
IPU-based media subsystem. They're not needed for the i.MX7 CSI. Only
compile them if CONFIG_VIDEO_IMX_CSI is selected.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
index 9bd9e873ba7c..6ac33275cc97 100644
--- a/drivers/staging/media/imx/Makefile
+++ b/drivers/staging/media/imx/Makefile
@@ -1,16 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0
+imx-media-common-objs := imx-media-capture.o imx-media-dev-common.o \
+	imx-media-of.o imx-media-utils.o
+
 imx6-media-objs := imx-media-dev.o imx-media-internal-sd.o \
 	imx-ic-common.o imx-ic-prp.o imx-ic-prpencvf.o imx-media-vdic.o \
 	imx-media-csc-scaler.o
 
-imx-media-common-objs := imx-media-capture.o imx-media-dev-common.o \
-	imx-media-of.o imx-media-utils.o
-
 imx6-media-csi-objs := imx-media-csi.o imx-media-fim.o
 
-obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media.o
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
 
+obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media.o
 obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
 obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
 
-- 
Regards,

Laurent Pinchart

