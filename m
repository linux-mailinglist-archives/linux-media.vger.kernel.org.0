Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7135F31B489
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhBOE3U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:29:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45318 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhBOE3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:29:14 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08D0014C0;
        Mon, 15 Feb 2021 05:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363294;
        bh=I8Svdrs+I5w29jhEhcMwEr7dqJKME+cuH1UYtODc+nc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rYvZca5T0U6w7hrUNj2FRwI5svdCWkMYrq/c0ABNq2pj0MAWm/uQn9xquhs/TF60w
         sr3EiMLAGjpAk8Y7dI3QuE2rNdYq6nolQI9eCmx7iHJDwqf2HTmpbiA1BqsIdOC5GJ
         ZvAI++vrnIU3aU8rKdZi4M4m0UmstnD8ETtanxMM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 04/77] media: imx: Compile imx6-media-objs only for CONFIG_VIDEO_IMX_CSI
Date:   Mon, 15 Feb 2021 06:26:28 +0200
Message-Id: <20210215042741.28850-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

imx6-media-objs contains a set of objects that are specific to the i.MX6
IPU-based media subsystem. They're not needed for the i.MX7 CSI. Only
compile them if CONFIG_VIDEO_IMX_CSI is selected.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/imx/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
index 69cc5da04a2e..6ac33275cc97 100644
--- a/drivers/staging/media/imx/Makefile
+++ b/drivers/staging/media/imx/Makefile
@@ -1,11 +1,11 @@
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
 
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
-- 
Regards,

Laurent Pinchart

