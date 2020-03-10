Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 096181802D1
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgCJQGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:06:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55140 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgCJQGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:06:47 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97811D09;
        Tue, 10 Mar 2020 17:06:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583856404;
        bh=Nb6OGfEJt7hIR2HArIumUmKdxv80Zt4MuRbJSN3ndAA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IRe8rIXijvw8msTqcMait7AqIO95BvvS9mWqjBor4YSAplHy153VH2Keyvi4oBZBN
         78En0e4+wOUbm5tqYNhYT8D2p89MzO+tmoJQeQWE2H/rB0SGtIaxziVXQqNxbiTTB2
         BPtdx/zK2YeAlKGZgGvhPnY83u+ootgvhWJ4mLFU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 09/10] media: imx: imx7-media-csi: Add Y10 and Y12 formats support
Date:   Tue, 10 Mar 2020 18:06:32 +0200
Message-Id: <20200310160633.950-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
References: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Support capturing the 10- and 12-bit greyscale formats.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 706c47741a3c..e85202255168 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -804,6 +804,14 @@ static int imx7_csi_configure(struct imx7_csi *csi)
 	case V4L2_PIX_FMT_YUYV:
 		cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
 		break;
+	case V4L2_PIX_FMT_Y10:
+		cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
+		cr1 |= BIT_PIXEL_BIT;
+		break;
+	case V4L2_PIX_FMT_Y12:
+		cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
+		cr1 |= BIT_PIXEL_BIT;
+		break;
 	case V4L2_PIX_FMT_SBGGR8:
 		cr18 |= BIT_MIPI_DATA_FORMAT_RAW8;
 		break;
-- 
Regards,

Laurent Pinchart

