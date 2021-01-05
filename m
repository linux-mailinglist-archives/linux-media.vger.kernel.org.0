Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79C1B2EAE62
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbhAEPbf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:31:35 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbhAEPbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:31:34 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 061C38B5;
        Tue,  5 Jan 2021 16:29:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860582;
        bh=1ImEPN+/+vYwJDVp8ecM7B9arGIIFvPXvAUQ3fmAjmM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P68L0RypVpE1fHq72OpbWTN4VneX1DHZo8X3Ryd7Uo99svp7lfijq0iyx9y0ELkBV
         gqIwXB46tkhCkR4dDGqTs3kFKtFHyit9bXce2iZUjbl0PByBcz0fylxn2hOunNH/rL
         OnJbs9phBAT1b7zDHxn4vqGbLqQtq8sPkCP17Iyg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 09/75] media: imx: capture: Use device name to construct bus_info
Date:   Tue,  5 Jan 2021 17:27:46 +0200
Message-Id: <20210105152852.5733-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_capability bus_info field is meant to locate the device in the
system. Using a subdev name isn't a good fit, the device name is a much
better option. Use it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 21f01ec56bd5..8efe3d753967 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -74,7 +74,7 @@ static int vidioc_querycap(struct file *file, void *fh,
 	strscpy(cap->driver, IMX_CAPTURE_NAME, sizeof(cap->driver));
 	strscpy(cap->card, IMX_CAPTURE_NAME, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", priv->src_sd->name);
+		 "platform:%s", dev_name(priv->dev));
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

