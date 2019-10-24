Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5CCEE2769
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 02:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392854AbfJXAmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 20:42:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408087AbfJXAmK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 20:42:10 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 948931186;
        Thu, 24 Oct 2019 02:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571877726;
        bh=uAeuS9jc6J3VFrylbnZJ3NgcPlteRMvyATsU//KqJ2c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kuF6Gp+nUec4qmAlJB0q+qC8CXJTJ4lCCOJnjmOfD0vkO8hHdCzr9w+knkhNpAmb4
         nanpiQsYR36BfHScim7pklKCzT/Cu80aOqkL6zGkwHQsbJO7EijPdQEw1h1tEgLOs/
         nbFUxFQFk7jWGrj3Yer6fMdqknbYhfVj2lMttnuM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 5/7] media: imx: imx7-media-csi: Add Y10 and Y12 formats support
Date:   Thu, 24 Oct 2019 03:41:53 +0300
Message-Id: <20191024004155.32068-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Support capturing the 10- and 12-bit greyscale formats.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index bfd6b5fbf484..e4c9bcc045f7 100644
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

