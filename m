Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD402CCE6
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 19:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfE1RDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 13:03:23 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45864 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfE1RDW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 13:03:22 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E3B19280195
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v6 01/16] media: v4l2-common: Fix v4l2_fill_pixfmt[_mp]() prototypes
Date:   Tue, 28 May 2019 14:02:17 -0300
Message-Id: <20190528170232.2091-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528170232.2091-1-ezequiel@collabora.com>
References: <20190528170232.2091-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

Width/height and 4CC formats are expressed using u32 types everywhere,
let's fix the v4l2_fill_pixfmt[_mp]() prototypes to do the same.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes from v5:
* None

Changes from v4:
* New patch

 drivers/media/v4l2-core/v4l2-common.c | 5 +++--
 include/media/v4l2-common.h           | 8 ++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index b5778b2ffa27..9417a883ebe3 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -542,7 +542,7 @@ static inline unsigned int v4l2_format_block_height(const struct v4l2_format_inf
 }
 
 int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
-			 int pixelformat, int width, int height)
+			u32 pixelformat, u32 width, u32 height)
 {
 	const struct v4l2_format_info *info;
 	struct v4l2_plane_pix_format *plane;
@@ -596,7 +596,8 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
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

