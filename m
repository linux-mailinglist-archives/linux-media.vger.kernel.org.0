Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6199194703
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbgCZTF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:05:58 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35630 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728472AbgCZTF6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:05:58 -0400
Received: by mail-pf1-f193.google.com with SMTP id u68so3272908pfb.2
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+TAI0q34gHwmtyXjAoNg4OEwV/YTrpyWg3D0Tzerm6M=;
        b=rAsT0F5GYrv+5odWrECYA72sISvjJTitnt5qOeDvnCu6YuNn9DaCLbr2FZM8vjrXCb
         JWRiJxQgnuzyjduVSfx9OGeKeS7g+i3REFTiX7cROBI2aAHJKPmJ+rGdnwQkLiv6OXao
         a6GPto/OixvAj0U3GJ0Rj7oUuRV+9GazY0yCHxfgqFMjvBxwUF+5MEFS/phJxlmGFQxo
         IcSReN0+FjOzwEkGhhGCA7DdLyAjrVjO5MinPJk0/eekl48OcEy8R8rPdM3Zz74KRs6b
         G12OwU16NK1wmgVcJ0eBFrvJpu3vzTf/FwvkYesk/Bpccubix9N2vEL15BRjs1D2OLWP
         c16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+TAI0q34gHwmtyXjAoNg4OEwV/YTrpyWg3D0Tzerm6M=;
        b=jL+r6txubrySmCG+KNa/CN0Rgp0aaulSXrALuY0cx2qho5kwq8jh6xW0+GvgqiXF58
         fdIimiiRSSo6UurQOPsI7x4ZU791/0uoDmVa5N7zVQLWshvpJ2D+Eox7xZUkyNg69MkM
         1R97Y5zfFQMDmi1ih0KeWjTwrzmGYdR0bPudsbC3p8mbTwbsguOrJGF5xlcqpfkguPSS
         Ku1kPxPaIsWa2BOhi2J8rmzSGiBkq1jxa8KOPwrDaGNDPUD3hiL4j7GHecLedsvlTM3G
         mMKZDdGJiH5/e8lNmGJqA/c6VmhXK+GhVUbc13zHhX3bMydoJBD4IxBcsYshfTEnPxLt
         r81Q==
X-Gm-Message-State: ANhLgQ1zFiptd8S/lOX4YOjgMwtZk1UVVTG91fHj9VFzLQ+PbW6tIdoy
        oDmKr2COpOFit38LXaTEs6HLjeQm4vc=
X-Google-Smtp-Source: ADFU+vuOUoCDHCW8/3TaILQ+9spX13OXRQr63h0xwVMRz2SN1KshxAkJWfEpZe/fkQXvgto8sh9ROw==
X-Received: by 2002:a63:de51:: with SMTP id y17mr10266239pgi.70.1585249556901;
        Thu, 26 Mar 2020 12:05:56 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q103sm7414623pjc.1.2020.03.26.12.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:05:56 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 07/10] media: imx: utils: Remove unneeded argument to (find|enum)_format()
Date:   Thu, 26 Mar 2020 12:05:41 -0700
Message-Id: <20200326190544.16349-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326190544.16349-1-slongerbeam@gmail.com>
References: <20200326190544.16349-1-slongerbeam@gmail.com>
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
index febcf3203cb1..e5e9f750f685 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -194,8 +194,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 
 static const struct imx_media_pixfmt *find_format(u32 fourcc,
 						  u32 code,
-						  enum codespace_sel cs_sel,
-						  bool allow_non_mbus)
+						  enum codespace_sel cs_sel)
 {
 	const struct imx_media_pixfmt *fmt;
 	int i, j;
@@ -208,8 +207,7 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 CS_SEL_YUV : CS_SEL_RGB);
 
-		if (!(fmt_cs_sel & cs_sel) ||
-		    (!allow_non_mbus && !fmt->codes))
+		if (!(fmt_cs_sel & cs_sel) || (!fourcc && !fmt->codes))
 			continue;
 
 		if (fourcc && fmt->fourcc == fourcc)
@@ -227,8 +225,7 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
 }
 
 static int enum_format(u32 *fourcc, u32 *code, u32 index,
-		       enum codespace_sel cs_sel,
-		       bool allow_non_mbus)
+		       enum codespace_sel cs_sel)
 {
 	const struct imx_media_pixfmt *fmt;
 	unsigned int i, j = 0, match_index = 0;
@@ -241,8 +238,7 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
 			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
 			 CS_SEL_YUV : CS_SEL_RGB);
 
-		if (!(fmt_cs_sel & cs_sel) ||
-		    (!allow_non_mbus && !fmt->codes))
+		if (!(fmt_cs_sel & cs_sel) || (!fourcc && !fmt->codes))
 			continue;
 
 		if (fourcc && index == match_index)
@@ -275,26 +271,26 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
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

