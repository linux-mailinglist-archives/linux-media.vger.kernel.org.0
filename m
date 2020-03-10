Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C72471802CA
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbgCJQGn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:06:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55128 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbgCJQGn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:06:43 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15BD5AC3;
        Tue, 10 Mar 2020 17:06:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583856401;
        bh=F6pnyA6UqQKFlUS8r8mqGFKmuJoZvHEmNGFNTUKbSbg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e7BHw2nBlBo+Ui1t2/ECFn1s+oW5gvn6dn+Evafq/+1xsOES73XdPqtAH8wwnAXGm
         1XAado6AyRf/2s0zrec/pzp4O9ePYIn6hcwclQsTRU+PRDzofJto/yt5uQY1P3ftIl
         BlJo8Tu2lucBr0KlhoVc9UjwzUT8dz71jCVcspcc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 02/10] media: imx: imx7_mipi_csis: Print the RESOL_CH0 register
Date:   Tue, 10 Mar 2020 18:06:25 +0200
Message-Id: <20200310160633.950-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
References: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the RESOL_CH0 register to the list of registers printed through the
debugfs debug infrastructure for the driver, as it can be useful to
verify proper configuration of the CSI-2 receiver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 0053e8b0b88e..f96e32549381 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -301,6 +301,7 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 		{ 0x20, "DPHYSTS" },
 		{ 0x10, "INTMSK" },
 		{ 0x40, "CONFIG_CH0" },
+		{ 0x44, "RESOL_CH0" },
 		{ 0xC0, "DBG_CONFIG" },
 		{ 0x38, "DPHYSLAVE_L" },
 		{ 0x3C, "DPHYSLAVE_H" },
-- 
Regards,

Laurent Pinchart

