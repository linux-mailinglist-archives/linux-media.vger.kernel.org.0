Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 756EA12CBC
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 13:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbfECLr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 07:47:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46190 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727659AbfECLrZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 07:47:25 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 65B10283616;
        Fri,  3 May 2019 12:47:23 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 01/15] media: v4l2-common: Fix v4l2_fill_pixfmt[_mp]() prototypes
Date:   Fri,  3 May 2019 13:47:05 +0200
Message-Id: <20190503114719.28784-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503114719.28784-1-boris.brezillon@collabora.com>
References: <20190503114719.28784-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Width/height and 4CC formats are expressed using u32 types everywhere,
let's fix the v4l2_fill_pixfmt[_mp]() prototypes to do the same.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v5:
* New patch
---
 drivers/media/v4l2-core/v4l2-common.c | 5 +++--
 include/media/v4l2-common.h           | 8 ++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index d869a2910435..6ae84aa1f7a9 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -520,7 +520,7 @@ static inline unsigned int v4l2_format_block_height(const struct v4l2_format_inf
 }
 
 int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
-			 int pixelformat, int width, int height)
+			u32 pixelformat, u32 width, u32 height)
 {
 	const struct v4l2_format_info *info;
 	struct v4l2_plane_pix_format *plane;
@@ -574,7 +574,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
 
-int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, int pixelformat, int width, int height)
+int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
+		     u32 width, u32 height)
 {
 	const struct v4l2_format_info *info;
 	int i;
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 0a41bbecf3d3..3226bc8107cc 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -420,9 +420,9 @@ struct v4l2_format_info {
 
 const struct v4l2_format_info *v4l2_format_info(u32 format);
 
-int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, int pixelformat,
-		     int width, int height);
-int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, int pixelformat,
-			int width, int height);
+int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
+		     u32 width, u32 height);
+int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
+			u32 width, u32 height);
 
 #endif /* V4L2_COMMON_H_ */
-- 
2.20.1

