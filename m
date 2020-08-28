Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3503255B19
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 15:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729616AbgH1NTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 09:19:41 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:48035 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729544AbgH1NRq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 09:17:46 -0400
X-Originating-IP: 90.89.180.255
Received: from lhopital-XPS-13-9360.home (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPA id BA267FF803;
        Fri, 28 Aug 2020 13:17:43 +0000 (UTC)
From:   =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
To:     linux-media@vger.kernel.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mripard@kernel.org,
        wens@csie.org, yong.deng@magewell.com, mchehab+samsung@kernel.org,
        p.zabel@pengutronix.de, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
Subject: [PATCH v2 1/4] media: sun6i-csi: Fix the bpp for 10-bit bayer formats
Date:   Fri, 28 Aug 2020 15:17:33 +0200
Message-Id: <20200828131737.12483-2-kevin.lhopital@bootlin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828131737.12483-1-kevin.lhopital@bootlin.com>
References: <20200828131737.12483-1-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

10-bit bayer formats are aligned to 16 bits in memory, so this is what
needs to be used as bpp for calculating the size of the buffers to
allocate.
This function is only used to generate the number of bytes per line.

Fixes: 5cc7522d8965 ("media: sun6i: Add support for Allwinner CSI V3s")
Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
index c626821aaedb..8b83d15de0d0 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
@@ -100,7 +100,7 @@ static inline int sun6i_csi_get_bpp(unsigned int pixformat)
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SGRBG10:
 	case V4L2_PIX_FMT_SRGGB10:
-		return 10;
+		return 16;
 	case V4L2_PIX_FMT_SBGGR12:
 	case V4L2_PIX_FMT_SGBRG12:
 	case V4L2_PIX_FMT_SGRBG12:
-- 
2.17.1

