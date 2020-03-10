Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 471291802D3
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgCJQGt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:06:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55128 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbgCJQGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:06:47 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DF9012F4;
        Tue, 10 Mar 2020 17:06:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583856405;
        bh=JN5WJZtRStw23IFWCWkFelfNRhbJ+OK3qqPFh63WO2Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bhlv7d0Irt5x0efRqp0XkMxJrqbKHLR90LTqrv04eWVOYjiKMHpYgTzQP3bzK2Lkl
         KuoPhX9HFBogyDcW5NNYoqTDYs/KQSPi7jleR0w9hqt9qdytw52bIxuWxyg34EvNpF
         EU+sdvIYU0zjXUhA7U5oc+BC1RgQ8UyqTgqEMK7M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 10/10] media: imx: imx7-media-csi: Support clamping Y10 and Y12 to Y8
Date:   Tue, 10 Mar 2020 18:06:33 +0200
Message-Id: <20200310160633.950-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
References: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

10-bit and 12-bit greyscale input data to the CSI can be written as
8-bit data to memory. Support this.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index e85202255168..3225082ce58d 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -804,6 +804,14 @@ static int imx7_csi_configure(struct imx7_csi *csi)
 	case V4L2_PIX_FMT_YUYV:
 		cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
 		break;
+	case V4L2_PIX_FMT_GREY:
+		if (in_code == MEDIA_BUS_FMT_Y8_1X8)
+			cr18 |= BIT_MIPI_DATA_FORMAT_RAW8;
+		else if (in_code == MEDIA_BUS_FMT_Y10_1X10)
+			cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
+		else
+			cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
+		break;
 	case V4L2_PIX_FMT_Y10:
 		cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
 		cr1 |= BIT_PIXEL_BIT;
-- 
Regards,

Laurent Pinchart

