Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5066431B4A5
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhBOEdy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:33:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45636 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhBOEdr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:33:47 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 936641943;
        Mon, 15 Feb 2021 05:28:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363313;
        bh=GWq7aseRf6joIjIj8SzsfgyWh6JcksWycx6DjGUkAYk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vPcYhisbMTbNGaSp8lvz3/zFoj1nroK6MfH3Tg9iFC/73XUfvbcow6vmU/stY5KXc
         /tF6WvGVBjcEkKLXMbwUa6aiqWfkn4u/MRBW+KX02wf/0lDuqz6v2JXrGbicYsY+yj
         KuPzk4KsRGWWMo9CPhKaABKy0qNTS1DVxOL7eZPk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 29/77] media: imx: imx7-media-csi: Disable legacy video node API
Date:   Mon, 15 Feb 2021 06:26:53 +0200
Message-Id: <20210215042741.28850-30-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Support for the MC-centric API has been tested on the i.MX7. Enable it
for that platform. i.MX6 should be converted next.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index a032d785746d..3bf2505de6a2 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1100,7 +1100,7 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	}
 
 	csi->vdev = imx_media_capture_device_init(csi->sd.dev, &csi->sd,
-						  IMX7_CSI_PAD_SRC, true);
+						  IMX7_CSI_PAD_SRC, false);
 	if (IS_ERR(csi->vdev))
 		return PTR_ERR(csi->vdev);
 
-- 
Regards,

Laurent Pinchart

