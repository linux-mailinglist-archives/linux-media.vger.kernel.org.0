Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8014FCF5B7
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 11:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729915AbfJHJL2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 05:11:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42890 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728866AbfJHJL2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 05:11:28 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9A57428F7F8;
        Tue,  8 Oct 2019 10:11:26 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [RFC PATCH v3 4/6] media: mediabus: Add an helper to convert a ext_pix format to an mbus_fmt
Date:   Tue,  8 Oct 2019 11:11:17 +0200
Message-Id: <20191008091119.7294-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191008091119.7294-1-boris.brezillon@collabora.com>
References: <20191008091119.7294-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just a new version of v4l2_fill_mbus_format() to deal with the new
v4l2_ext_pix_format struct.
This is needed to convert the VIMC driver to the EXT_FMT/EXT_BUF iocts.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
- Rebased on top of media/master (post 5.4-rc1)

Changes in v2:
- New patch
---
 include/media/v4l2-mediabus.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 45f88f0248c4..00de5ae05e84 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -182,4 +182,26 @@ v4l2_fill_mbus_format_mplane(struct v4l2_mbus_framefmt *mbus_fmt,
 	mbus_fmt->xfer_func = pix_mp_fmt->xfer_func;
 }
 
+/**
+ * v4l2_fill_mbus_format_ext - Ancillary routine that fills a &struct
+ *	v4l2_mbus_framefmt from a &struct v4l2_ext_pix_format.
+ *
+ * @mbus_fmt:	pointer to &struct v4l2_mbus_framefmt to be filled
+ * @pix_fmt:	pointer to &struct v4l2_ext_pix_format to be used as model
+ * @code:	data format code (from &enum v4l2_mbus_pixelcode)
+ */
+static inline void
+v4l2_fill_mbus_format_ext(struct v4l2_mbus_framefmt *mbus_fmt,
+			  const struct v4l2_ext_pix_format *pix_fmt, u32 code)
+{
+	mbus_fmt->width = pix_fmt->width;
+	mbus_fmt->height = pix_fmt->height;
+	mbus_fmt->field = pix_fmt->field;
+	mbus_fmt->colorspace = pix_fmt->colorspace;
+	mbus_fmt->ycbcr_enc = pix_fmt->ycbcr_enc;
+	mbus_fmt->quantization = pix_fmt->quantization;
+	mbus_fmt->xfer_func = pix_fmt->xfer_func;
+	mbus_fmt->code = code;
+}
+
 #endif
-- 
2.21.0

