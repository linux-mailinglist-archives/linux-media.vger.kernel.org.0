Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD41923D3
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 14:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727638AbfHSMuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 08:50:20 -0400
Received: from retiisi.org.uk ([95.216.213.190]:47466 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727632AbfHSMuT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 08:50:19 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 64D75634C8D;
        Mon, 19 Aug 2019 15:49:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 6/6] smiapp: Avoid fall-through in switch
Date:   Mon, 19 Aug 2019 15:47:28 +0300
Message-Id: <20190819124728.10511-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
References: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove switch fall-through cases in the driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 76d7d204ec17..61de8cdccc4b 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -1674,13 +1674,12 @@ static void smiapp_propagate(struct v4l2_subdev *subdev,
 				sensor->binning_vertical = 1;
 			}
 		}
-		/* Fall through */
-	case V4L2_SEL_TGT_COMPOSE:
-		*crops[SMIAPP_PAD_SRC] = *comp;
 		break;
 	default:
-		BUG();
+		WARN_ON(1);
+		return;
 	}
+	*crops[SMIAPP_PAD_SRC] = *comp;
 }
 
 static const struct smiapp_csi_data_format
@@ -2062,7 +2061,7 @@ static int __smiapp_sel_supported(struct v4l2_subdev *subdev,
 		    && sensor->limits[SMIAPP_LIMIT_SCALING_CAPABILITY]
 		    != SMIAPP_SCALING_CAPABILITY_NONE)
 			return 0;
-		/* Fall through */
+		return -EINVAL;
 	default:
 		return -EINVAL;
 	}
@@ -2716,7 +2715,7 @@ static struct smiapp_hwconfig *smiapp_get_hwconfig(struct device *dev)
 		case 180:
 			hwcfg->module_board_orient =
 				SMIAPP_MODULE_BOARD_ORIENT_180;
-			/* Fall through */
+			break;
 		case 0:
 			break;
 		default:
-- 
2.20.1

