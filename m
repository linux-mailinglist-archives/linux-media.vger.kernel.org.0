Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 230EA197069
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 22:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbgC2U7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 16:59:38 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42906 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728848AbgC2U7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 16:59:37 -0400
Received: by mail-pf1-f194.google.com with SMTP id 22so7558176pfa.9
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 13:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2XL8e9nKBtPkzls+PTY5xCa+JqWOPgoqsc3hINVH1gQ=;
        b=uPFUqja79lTDnZnPkULkXvrmq1gqu0uuycb8DaNmWl6kt5zQywB6wsD8KmRVLEgMYF
         CWRSsnK/8MHYNT5xJ2IQwzlW0CAuBsY+dMdcAQ4Zrd9h4bV4j4yD0u6DtOIi9lAez3G7
         8F7QyAl0gKkuPM6zmNfrIXy7ZSx4qxarzCwHZS9Q6HTpqIddEyW7muhvql369QdivKID
         7tHIxtbCb3w56trzO4fBsPUR1ly84YFzMoyKYmTAQFM/RUtQogVC0wfJ8O+QWjHbstXA
         9qaN7NWW1/8Zv1PLE0HXfvcJYSwtrWsMG9KNoyyKUvrZ5XhLDMJ7SQ+D++KhN0Ncw/UU
         rVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2XL8e9nKBtPkzls+PTY5xCa+JqWOPgoqsc3hINVH1gQ=;
        b=PtEKrwvO4MbFcWzkiM530iG0//6q2vDFpzjHoVy92TnTGDJgxEJSTUqsWyF8LvLUc0
         orCnt3jscI5Mli6YJxq+YUTkzKF2zCAEvgOT8eNbQ68rLyHsawWN2lNm0Kn8cHpK9Bp6
         rH0jbqvAkmrwWqoZ2NOF4SK1kzIfuc3wAMVc+YP7TnvAG+FkF5vAU2jMf5svJzrYWtWl
         4SR9jZWQW60vPHCzYzerJXDkU9tQ65FGB4PPZ2tkCtxQnI2CQQEImIgl2JZCuGw3Ce4J
         LBeiuiL6qcftSphmlAnKY6gYUvTZjIlpOIdnODKoTfKMLEDS9QJ6uisB8sxc/CDE0KTf
         PbeA==
X-Gm-Message-State: ANhLgQ06IGowimTdS8WTwi3kF1zXTkYhCso6CYptLJz4A6zWECz+mtwU
        lFIqDQe03ptiLkeqqRiFipL4sDQI4Ug=
X-Google-Smtp-Source: ADFU+vtAOluXRPep7Mx7Fj8oclfWvo1CArhleETt15UofLMi6q4BTDCbHtmaciZgeRVPX4SdueMASg==
X-Received: by 2002:a63:a052:: with SMTP id u18mr10155530pgn.210.1585515575612;
        Sun, 29 Mar 2020 13:59:35 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id 15sm8606049pfu.186.2020.03.29.13.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 13:59:35 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 07/11] media: imx: utils: Remove unneeded argument to (find|enum)_format()
Date:   Sun, 29 Mar 2020 13:59:16 -0700
Message-Id: <20200329205920.20118-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329205920.20118-1-slongerbeam@gmail.com>
References: <20200329205920.20118-1-slongerbeam@gmail.com>
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
index da010eef0ae6..bf187f6d87fe 100644
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

