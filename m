Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD21F196A01
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 00:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbgC1XKW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 19:10:22 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46996 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbgC1XKW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 19:10:22 -0400
Received: by mail-pg1-f195.google.com with SMTP id k191so6667593pgc.13
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2020 16:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aOtb35FNMsD5Jp3maP5fsa6UUEhYC9vPFnZgmX7lerM=;
        b=oPmy75djLG0BB3xnqvSAtxiYDDmUhDJ+NEF4lKuLDORW/YFmhbjScf7J3KkXUp5GzP
         z6zEJGtP/XyQAbblst0BWjmzxkPTZRC5uHuQYiYDu+GfZ8seJLyWu66d18UTeLadv03t
         LYmRLiSDlpl0bs+Ka0lT/2cD/Wo5XRJ2/5xP7GS/JT8k10N3mTL26PSN7VpQvEojsqfM
         THEFXGtI7ZUw0jXqvONKAVuiOR/Y/i/RzV3RSRMV9MZeNT6WuUoA0prFnVr7uBscAO5S
         QNKNQ7b/AIK7kGSe1XBB0sCAFKe8gyuNrSpDfG4/PN9wXXLvA57QJEi6CwThv0LvXaRe
         9+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aOtb35FNMsD5Jp3maP5fsa6UUEhYC9vPFnZgmX7lerM=;
        b=pzN1vFEnhGM94tcOw8YCtUbBimF1T7d7+x2GeY3XT+FKiQ4MeRx4BfGRelA5ynhAss
         e2zDHTTccj7jztRc4gkJqeAjkcFpq5OzZt3ONZYCRnMBMiqmjHnMtA3I4rKEKtFySqBw
         bSrCJr41tm2VAojljQFeq2yCFMtobNgkEu0QRefUM0l5OvunySKwCUaZUy7iZb4azWKA
         PXHCrJ8VJqS/Rme05DJkiqr8XLYv/kKXuUx9zMNMYA6Bu5vqhB/019tr3mCepynrvRe4
         APGM902EjTWTkdmZ83Hg+8Axdr4K6X4tJYb4t4w3xcsg4kiAnw0yXzKrSUQ6z2f0+dy3
         4h2w==
X-Gm-Message-State: ANhLgQ1KOgInC+gz7BpaioPZq/1jQCKx6ZX8gsqkth6743J4e7TE0UfO
        LKAaG+OuMLVTG6CbTnhcT30RFJOQTbo=
X-Google-Smtp-Source: ADFU+vsLKFY+SKismv88IXNq6dsnKNPMRU574u43EVOHcWzJsBiiSYc5q2w32Z1INydINI8qF54mrQ==
X-Received: by 2002:a63:f113:: with SMTP id f19mr6521993pgi.168.1585437020842;
        Sat, 28 Mar 2020 16:10:20 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:3081:8132:c81a:db99])
        by smtp.gmail.com with ESMTPSA id w74sm3978602pfd.112.2020.03.28.16.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 16:10:20 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 07/10] media: imx: utils: Remove unneeded argument to (find|enum)_format()
Date:   Sat, 28 Mar 2020 16:09:59 -0700
Message-Id: <20200328231002.649-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328231002.649-1-slongerbeam@gmail.com>
References: <20200328231002.649-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The find_format() and enum_format() functions take an argument that
tells whether to take into account formats that don't have associated
media bus codes. The same information can be deduced from the fourcc
argument passed to these functions. Remove the allow_non_mbus argument
and use fourcc instead internally.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 0904b6479577..33c874668ad4 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -194,8 +194,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 
 static const struct imx_media_pixfmt *find_format(u32 fourcc,
 						  u32 code,
-						  enum codespace_sel cs_sel,
-						  bool allow_non_mbus)
+						  enum codespace_sel cs_sel)
 {
 	unsigned int i;
 
@@ -208,8 +207,7 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 CS_SEL_YUV : CS_SEL_RGB);
 
-		if (!(fmt_cs_sel & cs_sel) ||
-		    (!allow_non_mbus && !fmt->codes))
+		if (!(fmt_cs_sel & cs_sel) || (!fourcc && !fmt->codes))
 			continue;
 
 		if (fourcc && fmt->fourcc == fourcc)
@@ -228,8 +226,7 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 }
 
 static int enum_format(u32 *fourcc, u32 *code, u32 index,
-		       enum codespace_sel cs_sel,
-		       bool allow_non_mbus)
+		       enum codespace_sel cs_sel)
 {
 	unsigned int i;
 
@@ -242,8 +239,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 CS_SEL_YUV : CS_SEL_RGB);
 
-		if (!(fmt_cs_sel & cs_sel) ||
-		    (!allow_non_mbus && !fmt->codes))
+		if (!(fmt_cs_sel & cs_sel) || (!fourcc && !fmt->codes))
 			continue;
 
 		if (fourcc && index == 0) {
@@ -272,26 +268,26 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
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
2.17.1

