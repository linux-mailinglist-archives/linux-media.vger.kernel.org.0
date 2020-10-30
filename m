Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF43C2A0408
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 12:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgJ3LWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 07:22:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58824 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ3LWm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 07:22:42 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:14c:483:7e3e::1005])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A4AC61F45EBD;
        Fri, 30 Oct 2020 11:22:36 +0000 (GMT)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        heiko@sntech.de, kernel@collabora.com, hverkuil-cisco@xs4all.nl,
        dafna.hirschfeld@collabora.com, zhengsq@rock-chips.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        mchehab@kernel.org, tfiga@chromium.org, ribalda@google.com
Subject: [PATCH v2 1/3] media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer format
Date:   Fri, 30 Oct 2020 08:22:22 -0300
Message-Id: <20201030112225.2095909-2-helen.koike@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030112225.2095909-1-helen.koike@collabora.com>
References: <20201030112225.2095909-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shunqian Zheng <zhengsq@rock-chips.com>

Add the Rockchip ISP1 specific processing parameter format
V4L2_META_FMT_RK_ISP1_PARAMS and metadata format
V4L2_META_FMT_RK_ISP1_STAT_3A for 3A.

Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
Hello,

This patch is a continuation of:

https://patchwork.kernel.org/project/linux-arm-kernel/patch/20191106120132.6876-2-helen.koike@collabora.com/

These formats are already documented under
Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst

We had agreed to keep under
drivers/staging/media/rkisp1/uapi/rkisp1-config.h while the driver was
in staging, since we are moving it out of staging, I guess this is the
time :)

Regards,
Helen
---
 drivers/media/v4l2-core/v4l2-ioctl.c              | 2 ++
 drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 4 ----
 include/uapi/linux/videodev2.h                    | 4 ++++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index eeff398fbdcc1..202597d031c6b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1402,6 +1402,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
 	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
+	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A params"; break;
+	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A statistics"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
index 8d906cc7da8fc..6e449e7842605 100644
--- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
+++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
@@ -9,10 +9,6 @@
 
 #include <linux/types.h>
 
-/* Vendor specific - used for RK_ISP1 camera sub-system */
-#define V4L2_META_FMT_RK_ISP1_PARAMS   v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 params */
-#define V4L2_META_FMT_RK_ISP1_STAT_3A  v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
-
 /* Defect Pixel Cluster Detection */
 #define RKISP1_CIF_ISP_MODULE_DPCC		(1U << 0)
 /* Black Level Subtraction */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 534eaa4d39bc8..c2e13ba81196b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -770,6 +770,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
 #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
 
+/* Vendor specific - used for RK_ISP1 camera sub-system */
+#define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 params */
+#define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
-- 
2.28.0

