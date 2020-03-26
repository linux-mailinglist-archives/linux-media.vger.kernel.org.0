Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 771AC194B43
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 23:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbgCZWI7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 18:08:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42046 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgCZWI7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 18:08:59 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF9E3A48;
        Thu, 26 Mar 2020 23:08:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585260535;
        bh=IFCqj9m1Hx7CeSn1WjDd2awqXSk2wQ/KIFB8VBN/Lqc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mNr1RhXPFPTddLjNNdLQhxsPyfmVRIC6cx4aMSS8hgc+OaW+3GskkaHL1yBJnV4s7
         zS26sTJVbP9/tHb/+d0UfLMkvVRwYjv+t7/MLrkxfJV41VHpfXYWAuB+6fWmK52rcQ
         Moz1lYANagt3ucXGUjMel0v6pfoau27Pm+1Nv6qU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 07/11] media: imx: utils: Remove unneeded argument to (find|enum)_format()
Date:   Fri, 27 Mar 2020 00:08:36 +0200
Message-Id: <20200326220840.18540-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200326220840.18540-1-laurent.pinchart@ideasonboard.com>
References: <20200326220840.18540-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The find_format() and enum_format() functions take an argument that
tells whether to take into account formats that don't have associated
media bus codes. The same information can be deduced from the fourcc
argument passed to these functions. Remove the allow_non_mbus argument
and use fourcc instead internally.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 2dcb6285a6c0..cbf441716cab 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -196,8 +196,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 static const
 struct imx_media_pixfmt *find_format(u32 fourcc,
 				     u32 code,
-				     enum codespace_sel cs_sel,
-				     bool allow_non_mbus)
+				     enum codespace_sel cs_sel)
 {
 	bool allow_bayer = cs_sel & CS_SEL_BAYER;
 	unsigned int i;
@@ -213,7 +212,7 @@ struct imx_media_pixfmt *find_format(u32 fourcc,
 			   ? CS_SEL_YUV : CS_SEL_RGB;
 
 		if ((cs_sel != CS_SEL_ANY && fmt_cs_sel != cs_sel) ||
-		    (!allow_non_mbus && !fmt->codes) ||
+		    (!fourcc && !fmt->codes) ||
 		    (!allow_bayer && fmt->bayer))
 			continue;
 
@@ -233,8 +232,7 @@ struct imx_media_pixfmt *find_format(u32 fourcc,
 }
 
 static int enum_format(u32 *fourcc, u32 *code, u32 index,
-		       enum codespace_sel cs_sel,
-		       bool allow_non_mbus)
+		       enum codespace_sel cs_sel)
 {
 	bool allow_bayer = cs_sel & CS_SEL_BAYER;
 	unsigned int i;
@@ -250,7 +248,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			   ? CS_SEL_YUV : CS_SEL_RGB;
 
 		if ((cs_sel != CS_SEL_ANY && fmt_cs_sel != cs_sel) ||
-		    (!allow_non_mbus && !fmt->codes) ||
+		    (!fourcc && !fmt->codes) ||
 		    (!allow_bayer && fmt->bayer))
 			continue;
 
@@ -280,26 +278,26 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 const struct imx_media_pixfmt *
 imx_media_find_format(u32 fourcc, enum codespace_sel cs_sel)
 {
-	return find_format(fourcc, 0, cs_sel, true);
+	return find_format(fourcc, 0, cs_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_format);
 
 int imx_media_enum_format(u32 *fourcc, u32 index, enum codespace_sel cs_sel)
 {
-	return enum_format(fourcc, NULL, index, cs_sel, true);
+	return enum_format(fourcc, NULL, index, cs_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_format);
 
 const struct imx_media_pixfmt *
 imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel)
 {
-	return find_format(0, code, cs_sel, false);
+	return find_format(0, code, cs_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
 
 int imx_media_enum_mbus_format(u32 *code, u32 index, enum codespace_sel cs_sel)
 {
-	return enum_format(NULL, code, index, cs_sel, false);
+	return enum_format(NULL, code, index, cs_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
 
-- 
Regards,

Laurent Pinchart

