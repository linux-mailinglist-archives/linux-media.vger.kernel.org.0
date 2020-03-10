Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C823C1802CC
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgCJQGo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:06:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55128 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgCJQGn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:06:43 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 172D25F;
        Tue, 10 Mar 2020 17:06:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583856402;
        bh=eTLv9evwq1hclFQkt0ctn8B9AB20PyR+QlzvsKMUw3s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qceh14ssTICpQxIMOccAWiLe7YBA6/KmQf8t0AgNYKwVPxZlYxIDtb6OoQIwy2V7L
         3xUVfTrDSvI0D1eDPX8LeiL4uAMNaZ5pRfTr+hA0CJNrMTbtVhqruzF1DOyb2gecEY
         pkFpKu9OqDXJt25X8k8Pg1gjTLgewcKGeMdJ76J4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 04/10] media: imx: imx7-mipi-csis: Filter on CSI-2 data type
Date:   Tue, 10 Mar 2020 18:06:27 +0200
Message-Id: <20200310160633.950-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
References: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable filtering based on CSI-2 data type. Otherwise sources that send
multiple data types (such as sensors that send embedded data) will not
be properly supported. They will both result in additional non-image
lines being captured, and in the receiver being confused as it doesn't
resynchronise on vsync.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 2dd0b02e98b7..de17a1d22873 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -430,6 +430,7 @@ static void mipi_csis_set_params(struct csi_state *state)
 	val = mipi_csis_read(state, MIPI_CSIS_CMN_CTRL);
 	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
 	val |= (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
+	val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
 	mipi_csis_write(state, MIPI_CSIS_CMN_CTRL, val);
 
 	__mipi_csis_set_format(state);
-- 
Regards,

Laurent Pinchart

