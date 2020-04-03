Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB8919DFF4
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 22:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbgDCU66 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 16:58:58 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41905 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727907AbgDCU66 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 16:58:58 -0400
Received: by mail-pg1-f196.google.com with SMTP id m13so126032pgd.8
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2020 13:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BtfnuwGPseVG343HF/U5U+lpKHM1kxpxIYySf7VcBv8=;
        b=Vctdou8E+QuoSa5NyMGRwk7ExbUMyV4kRR/jDrNeA3m9im4BIG+Ta0o1SaLbxhbMPf
         IizoXdJzgGTNtZQNXYq9dOasE0Ox8kuAUBfJJTz6Xpkf+gKDpSpXGdTEEO3wCFlai1Cu
         utk5xOc400HRoGieqN+8r2LVzXlkGhbXQl2PLpNHSZgAFwruRKLfxX6mgPmiIVmm5vUL
         TFqrYZO8xfDsDTmiwK/+RwkjEuqY3vBoEF/GbEXz6npNtz+kzWHU9FIBdH0UpexvM0sS
         229kHncAQLYtJ5O7D9s6uxwtz2LnjUgJYYpstzcnYAe1V4pWZWsHItl+TwhZKSNfEa7W
         ZWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BtfnuwGPseVG343HF/U5U+lpKHM1kxpxIYySf7VcBv8=;
        b=g3Y7RZXbR4MGh4N9PXm4rxlKRAyyH/0Dfj8envzR0ruj8fPQe6RUI75ptJrOiqjoNx
         E5gQZ6Ni6aIXA4qLpTLPsK7HctPci3crzyp5nbD81fBnDDjHfNRfrjsM+dHvSnpLvu6W
         13d0k88c3No14sq9N3dl3B5ATotbnjnHTGysxntSp79H6sbNoLOl781p09V2q5YHwTv1
         5a173zqXEAMqUysOZvYtJT1hD+xgIiA9wXGOBh0Xfnrs3HYeTOXK02Dtp/xImMdY48X5
         Ezdv5Pcw4e12HINIanD7+WEAYUAcIv54RRh9v+qQzqRbDJ84YQAqqctVKxEX96gVhbfK
         1VXQ==
X-Gm-Message-State: AGi0PuaSpXxu4FySsTMrQyZXclxFXAWIXbv387sBEuu/QhfP3b1RTo8o
        5ClkprRk6LWQbGOdkUsEe6aq4TvVj9s=
X-Google-Smtp-Source: APiQypJHni+6w6MVyUPgGyt5BQuqMmYxr86ky5V+EvJn8RoxMAEuRc9MC4d/NkBFy2+Hxv31LInYpQ==
X-Received: by 2002:a63:b557:: with SMTP id u23mr9964954pgo.160.1585947536651;
        Fri, 03 Apr 2020 13:58:56 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id s39sm6521266pjb.10.2020.04.03.13.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 13:58:56 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 08/12] media: imx: utils: Remove unneeded argument to (find|enum)_format()
Date:   Fri,  3 Apr 2020 13:58:35 -0700
Message-Id: <20200403205839.4531-9-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403205839.4531-1-slongerbeam@gmail.com>
References: <20200403205839.4531-1-slongerbeam@gmail.com>
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
 drivers/staging/media/imx/imx-media-utils.c | 24 +++++++++------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 95913ab6d5b6..d9be04c68cc4 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -201,8 +201,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 
 static const struct imx_media_pixfmt *find_format(u32 fourcc,
 						  u32 code,
-						  enum imx_pixfmt_sel fmt_sel,
-						  bool allow_non_mbus)
+						  enum imx_pixfmt_sel fmt_sel)
 {
 	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
 	unsigned int i;
@@ -221,8 +220,7 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
 
-		if (!(fmt_sel & sel) ||
-		    (!allow_non_mbus && !fmt->codes))
+		if (!(fmt_sel & sel) || (!fourcc && !fmt->codes))
 			continue;
 
 		if (fourcc && fmt->fourcc == fourcc)
@@ -241,8 +239,7 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 }
 
 static int enum_format(u32 *fourcc, u32 *code, u32 index,
-		       enum imx_pixfmt_sel fmt_sel,
-		       bool allow_non_mbus)
+		       enum imx_pixfmt_sel fmt_sel)
 {
 	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
 	unsigned int i;
@@ -261,8 +258,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
 
-		if (!(fmt_sel & sel) ||
-		    (!allow_non_mbus && !fmt->codes))
+		if (!(fmt_sel & sel) || (!fourcc && !fmt->codes))
 			continue;
 
 		if (fourcc && index == 0) {
@@ -291,41 +287,41 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 const struct imx_media_pixfmt *
 imx_media_find_format(u32 fourcc, enum imx_pixfmt_sel fmt_sel)
 {
-	return find_format(fourcc, 0, fmt_sel, true);
+	return find_format(fourcc, 0, fmt_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_format);
 
 int imx_media_enum_format(u32 *fourcc, u32 index, enum imx_pixfmt_sel fmt_sel)
 {
-	return enum_format(fourcc, NULL, index, fmt_sel, true);
+	return enum_format(fourcc, NULL, index, fmt_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_format);
 
 const struct imx_media_pixfmt *
 imx_media_find_mbus_format(u32 code, enum imx_pixfmt_sel fmt_sel)
 {
-	return find_format(0, code, fmt_sel, false);
+	return find_format(0, code, fmt_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
 
 int imx_media_enum_mbus_format(u32 *code, u32 index,
 			       enum imx_pixfmt_sel fmt_sel)
 {
-	return enum_format(NULL, code, index, fmt_sel, false);
+	return enum_format(NULL, code, index, fmt_sel);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
 
 const struct imx_media_pixfmt *
 imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel fmt_sel)
 {
-	return find_format(0, code, fmt_sel | PIXFMT_SEL_IPU, false);
+	return find_format(0, code, fmt_sel | PIXFMT_SEL_IPU);
 }
 EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
 
 int imx_media_enum_ipu_format(u32 *code, u32 index,
 			      enum imx_pixfmt_sel fmt_sel)
 {
-	return enum_format(NULL, code, index, fmt_sel | PIXFMT_SEL_IPU, false);
+	return enum_format(NULL, code, index, fmt_sel | PIXFMT_SEL_IPU);
 }
 EXPORT_SYMBOL_GPL(imx_media_enum_ipu_format);
 
-- 
2.17.1

