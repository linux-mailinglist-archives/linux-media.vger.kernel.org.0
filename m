Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9D82F691D
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 19:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbhANSJJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 13:09:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbhANSJI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 13:09:08 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3895C0613D3;
        Thu, 14 Jan 2021 10:08:23 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id ED3531F45D0B
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        boris.brezillon@collabora.com, hiroh@chromium.org,
        nicolas@ndufresne.ca, Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, stanimir.varbanov@linaro.org,
        tfiga@chromium.org
Subject: [RFC PATCH v6 08/11] media: mediabus: Add helpers to convert a ext_pix format to/from a mbus_fmt
Date:   Thu, 14 Jan 2021 15:07:35 -0300
Message-Id: <20210114180738.1758707-9-helen.koike@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114180738.1758707-1-helen.koike@collabora.com>
References: <20210114180738.1758707-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just a new version of v4l2_fill_mbus_format() and v4l2_fill_ext_pix_format()
to deal with the new v4l2_ext_pix_format struct.
This is needed to convert the VIMC driver to the EXT_FMT/EXT_BUF iocts.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
Changes in v6:
- Rename v4l2_fill_ext_pix_format() to v4l2_fill_ext_pix_format_from_mbus() (Tomasz)

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
index 841e190aedd9..055e2abbc1dd 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -209,4 +209,46 @@ v4l2_fill_mbus_format_mplane(struct v4l2_mbus_framefmt *mbus_fmt,
 	mbus_fmt->xfer_func = pix_mp_fmt->xfer_func;
 }
 
+/**
+ * v4l2_fill_ext_pix_format_from_mbus - Ancillary routine that fills a &struct
+ *     v4l2_ext_pix_format fields from a &struct v4l2_mbus_framefmt.
+ *
+ * @pix_fmt:   pointer to &struct v4l2_ext_pix_format to be filled
+ * @mbus_fmt:  pointer to &struct v4l2_mbus_framefmt to be used as model
+ */
+static inline void
+v4l2_fill_ext_pix_format_from_mbus(struct v4l2_ext_pix_format *pix_fmt,
+				   const struct v4l2_mbus_framefmt *mbus_fmt)
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
+/**
+ * v4l2_fill_mbus_format_ext - Ancillary routine that fills a &struct
+ *     v4l2_mbus_framefmt from a &struct v4l2_ext_pix_format.
+ *
+ * @mbus_fmt:  pointer to &struct v4l2_mbus_framefmt to be filled
+ * @pix_fmt:   pointer to &struct v4l2_ext_pix_format to be used as model
+ * @code:      data format code (from &enum v4l2_mbus_pixelcode)
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
2.29.2

