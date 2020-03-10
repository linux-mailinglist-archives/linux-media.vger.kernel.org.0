Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA4B1802D0
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgCJQGq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:06:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55140 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgCJQGp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:06:45 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C3D7580;
        Tue, 10 Mar 2020 17:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583856403;
        bh=+Ow796cILhn1WLb8qVyTtmNe/AxiuvndMbFfvaH18kY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HTMYhkdrO9DSxTnY4ZRPQFPlkSXGk5RbhaBtkOm6yv7nhyENfVThQQ+25aWAZvO2d
         K7BRAbtPZHsxTk08kVESPc8lqo9cmfiFB9C1pwAM8Fo3gkmIOatcCX+GB9bNiDAyn+
         GKUV20BZumpFro1pUTwV0EfoxKWmfOPvGEfbirbI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 06/10] media: imx: imx7-media-csi: Fix video field handling
Date:   Tue, 10 Mar 2020 18:06:29 +0200
Message-Id: <20200310160633.950-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
References: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 4791bd7d6adc ("media: imx: Try colorimetry at both sink and
source pads") reworked the way that formats are set on the sink pad of
the CSI subdevice, and accidentally removed video field handling.
Restore it by defaulting to V4L2_FIELD_NONE if the field value isn't
supported, with the only two supported value being V4L2_FIELD_NONE and
V4L2_FIELD_INTERLACED.

Fixes: 4791bd7d6adc ("media: imx: Try colorimetry at both sink and source pads")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
Changes since v1:

- Fix commit message to mention V4L2_FIELD_INTERLACED instead of
  V4L2_FIELD_ALTERNATE
---
 drivers/staging/media/imx/imx7-media-csi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 2f665e4b8c40..706c47741a3c 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1009,6 +1009,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		sdformat->format.width = in_fmt->width;
 		sdformat->format.height = in_fmt->height;
 		sdformat->format.code = in_fmt->code;
+		sdformat->format.field = in_fmt->field;
 		*cc = in_cc;
 
 		sdformat->format.colorspace = in_fmt->colorspace;
@@ -1023,6 +1024,9 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 							 false);
 			sdformat->format.code = (*cc)->codes[0];
 		}
+
+		if (sdformat->format.field != V4L2_FIELD_INTERLACED)
+			sdformat->format.field = V4L2_FIELD_NONE;
 		break;
 	default:
 		return -EINVAL;
-- 
Regards,

Laurent Pinchart

