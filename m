Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C88223AE2
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 13:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgGQLzT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 07:55:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56790 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgGQLzS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 07:55:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 568FC2A576B
From:   Helen Koike <helen.koike@collabora.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Helen Koike <helen.koike@collabora.com>, tfiga@chromium.org,
        hiroh@chromium.org, nicolas@ndufresne.ca, Brian.Starkey@arm.com,
        kernel@collabora.com, narmstrong@baylibre.com,
        linux-kernel@vger.kernel.org, frkoenig@chromium.org,
        mjourdan@baylibre.com, stanimir.varbanov@linaro.org
Subject: [PATCH v4 4/6] media: mediabus: Add helpers to convert a ext_pix format to/from a mbus_fmt
Date:   Fri, 17 Jul 2020 08:54:33 -0300
Message-Id: <20200717115435.2632623-5-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200717115435.2632623-1-helen.koike@collabora.com>
References: <20200717115435.2632623-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

Just a new version of v4l2_fill_mbus_format() and v4l2_fill_ext_pix_format()
to deal with the new v4l2_ext_pix_format struct.
This is needed to convert the VIMC driver to the EXT_FMT/EXT_BUF iocts.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
Changes in v4:
- Add helper v4l2_fill_ext_pix_format()
- Rebased on top of media/master (post 5.8-rc1)

Changes in v3:
- Rebased on top of media/master (post 5.4-rc1)

Changes in v2:
- New patch
---
 include/media/v4l2-mediabus.h | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 45f88f0248c4e..8133407377f7d 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -119,6 +119,26 @@ v4l2_fill_pix_format(struct v4l2_pix_format *pix_fmt,
 	pix_fmt->xfer_func = mbus_fmt->xfer_func;
 }
 
+/**
+ * v4l2_fill_ext_pix_format - Ancillary routine that fills a &struct
+ *	v4l2_ext_pix_format fields from a &struct v4l2_mbus_framefmt.
+ *
+ * @pix_fmt:	pointer to &struct v4l2_ext_pix_format to be filled
+ * @mbus_fmt:	pointer to &struct v4l2_mbus_framefmt to be used as model
+ */
+static inline void
+v4l2_fill_ext_pix_format(struct v4l2_ext_pix_format *pix_fmt,
+		     const struct v4l2_mbus_framefmt *mbus_fmt)
+{
+	pix_fmt->width = mbus_fmt->width;
+	pix_fmt->height = mbus_fmt->height;
+	pix_fmt->field = mbus_fmt->field;
+	pix_fmt->colorspace = mbus_fmt->colorspace;
+	pix_fmt->ycbcr_enc = mbus_fmt->ycbcr_enc;
+	pix_fmt->quantization = mbus_fmt->quantization;
+	pix_fmt->xfer_func = mbus_fmt->xfer_func;
+}
+
 /**
  * v4l2_fill_pix_format - Ancillary routine that fills a &struct
  *	v4l2_mbus_framefmt from a &struct v4l2_pix_format and a
@@ -182,4 +202,26 @@ v4l2_fill_mbus_format_mplane(struct v4l2_mbus_framefmt *mbus_fmt,
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
2.26.0

