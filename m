Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10D52EAEBE
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbhAEPgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:36:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728098AbhAEPgs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:36:48 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E92301BC3;
        Tue,  5 Jan 2021 16:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860605;
        bh=wf5wl0bh0uNjGRQfnQI3ysPJn71TWlvLw22OoUoJft0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=da9V+fbDIwOpIOK2YeJJaRgJk6n6TrCQA6PdJ1A3VK/KhNIyJqIeoKAdiuX867xkO
         DxD99S/eNgkGRdKzP/mAvAkq3Oe7aYjyYvNRXnRPOYi6sz5e7I77YDHrbs8MNZ1R3+
         sj7YBQcB7B0DqPllrzUfuBjvulc2jad9PQQ9KyR8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 45/75] media: imx: imx7-media-csi: Don't set the buffer stride when disabling
Date:   Tue,  5 Jan 2021 17:28:22 +0200
Message-Id: <20210105152852.5733-46-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no need to set the buffer stride to 0 when disabling the CSI.
Remove the extraneous register write.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 6bc430ea1263..f639ca5d5b2f 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -616,8 +616,6 @@ static void imx7_csi_disable(struct imx7_csi *csi)
 
 	imx7_csi_hw_disable_irq(csi);
 
-	imx7_csi_buf_stride_set(csi, 0);
-
 	imx7_csi_hw_disable(csi);
 }
 
-- 
Regards,

Laurent Pinchart

