Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91DA143316E
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 10:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234864AbhJSIqd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 04:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234857AbhJSIqZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 04:46:25 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB5EC06176F;
        Tue, 19 Oct 2021 01:44:09 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id t21so5148357plr.6;
        Tue, 19 Oct 2021 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1VqU4XTjCpirHS39n6Ik6WoFuzFscoD7Gz6T1rIL72A=;
        b=fPX8rWmpzjzpH/OQxS77IoGJc3xbaB8bKw+m7+Tm3IR/qeFSLZ+qfSlnSTIlLhNPUO
         PCOBf0TTrgZhPw7lrwp6QT6rIqSJcO7C5zaP9UftBVgxmevAzxSdqGtdmsfQgqc5SRb3
         iiZf163blJRtfXNSk1bHC4H/GNa3tiFLtQUiLpLMe75nAkWPNrm/LaNuUFyccDavlJKB
         g8tYXh8hH80mZiNF9gkb65qVfIJPIkd8vMpeDyAmKPT8Xv6BXSFOLBrVJbv7SbZ9kIT0
         jHe32FPmK19AWygbE4lmFEmUSWGQpMpZhfuT1XmgaT5L8uBDQWMW/yPHDMru+EmAubFg
         X/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1VqU4XTjCpirHS39n6Ik6WoFuzFscoD7Gz6T1rIL72A=;
        b=QooJ/sdjZymE+KqG0YIPiTDBeatP/I5QnoEj1QSAj2IUq0uUxJrJc6lCscUuI1Q6a0
         UDzG5qPOMkj1tp7nYZGtn6ZSS6unAN+bbDdBHv8eUqU9XWTcH3WNUGR/hiqntTi4fhVJ
         F/Nb30oBhfK2flmbkSc49+DwxrS7Bm50G4FniSFAB2HDcCeRmLCMnOTF5jGCZAyMt/ds
         nYeirX0oE5i9ZnuAxu8zB3D2X1ObTeLg1KNFlQAzMBw2oi3YxEkw5et2wfuDhZfQXQAR
         EfVV6j2cUZxKkL9wLUB/kSl5YLnWBbyFnFPnVUiG4uqppl+w59KuaYTxUre6pwr/IBk5
         TOaQ==
X-Gm-Message-State: AOAM530/Y+FR4gCM9VsZ/6047dN6EKddUX2E4LoGmqp++Aj+k/eF2lhW
        qCk5M8K1Bxq79zjQUCSQoCI=
X-Google-Smtp-Source: ABdhPJyfW1mP1njhIKYVaL1M/HtxJBdQwz1eAcuC+TRtsUJLSXNJ8Z/JXZVOFK3MR3N6IyLcR1HsSA==
X-Received: by 2002:a17:902:e746:b0:13f:398e:a0e2 with SMTP id p6-20020a170902e74600b0013f398ea0e2mr31807286plf.48.1634633049003;
        Tue, 19 Oct 2021 01:44:09 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.44.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Oct 2021 01:44:08 -0700 (PDT)
From:   Dillon Min <dillon.minfei@gmail.com>
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 08/10] media: v4l2-ctrls: Add RGB color effects control
Date:   Tue, 19 Oct 2021 16:43:21 +0800
Message-Id: <1634633003-18132-9-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2_COLORFX_SET_RGB color effects control, V4L2_CID_COLORFX_RGB
for RGB color setting.

with two mirror changes:
- change 0xFFFFFF to 0xffffff
- fix comments 2^24 to 2^24 - 1

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v6: add space in '(V4L2_CID_BASE+43)' to avoid checkpatch warrnings.

 Documentation/userspace-api/media/v4l/control.rst | 9 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 6 ++++--
 include/uapi/linux/v4l2-controls.h                | 4 +++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
index f8d0b923da20..3eec65174260 100644
--- a/Documentation/userspace-api/media/v4l/control.rst
+++ b/Documentation/userspace-api/media/v4l/control.rst
@@ -242,8 +242,17 @@ Control IDs
     * - ``V4L2_COLORFX_SET_CBCR``
       - The Cb and Cr chroma components are replaced by fixed coefficients
 	determined by ``V4L2_CID_COLORFX_CBCR`` control.
+    * - ``V4L2_COLORFX_SET_RGB``
+      - The RGB components are replaced by the fixed RGB components determined
+        by ``V4L2_CID_COLORFX_RGB`` control.
 
 
+``V4L2_CID_COLORFX_RGB`` ``(integer)``
+    Determines the Red, Green, and Blue coefficients for
+    ``V4L2_COLORFX_SET_RGB`` color effect.
+    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
+    bits [15:8] as Green component, bits [23:16] as Red component, and
+    bits [31:24] must be zero.
 
 ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
     Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 0cb6c0f18b39..431f7ec17557 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:	return "Min Number of Output Buffers";
 	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
 	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
+	case V4L2_CID_COLORFX_RGB:              return "Color Effects, RGB";
 
 	/*
 	 * Codec controls
@@ -1394,11 +1395,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*min = *max = *step = *def = 0;
 		break;
 	case V4L2_CID_BG_COLOR:
+	case V4L2_CID_COLORFX_RGB:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*step = 1;
 		*min = 0;
-		/* Max is calculated as RGB888 that is 2^24 */
-		*max = 0xFFFFFF;
+		/* Max is calculated as RGB888 that is 2^24 - 1 */
+		*max = 0xffffff;
 		break;
 	case V4L2_CID_COLORFX_CBCR:
 		*type = V4L2_CTRL_TYPE_INTEGER;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 133e20444939..1406df0cc107 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -128,6 +128,7 @@ enum v4l2_colorfx {
 	V4L2_COLORFX_SOLARIZATION		= 13,
 	V4L2_COLORFX_ANTIQUE			= 14,
 	V4L2_COLORFX_SET_CBCR			= 15,
+	V4L2_COLORFX_SET_RGB			= 16,
 };
 #define V4L2_CID_AUTOBRIGHTNESS			(V4L2_CID_BASE+32)
 #define V4L2_CID_BAND_STOP_FILTER		(V4L2_CID_BASE+33)
@@ -145,9 +146,10 @@ enum v4l2_colorfx {
 
 #define V4L2_CID_ALPHA_COMPONENT		(V4L2_CID_BASE+41)
 #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
+#define V4L2_CID_COLORFX_RGB			(V4L2_CID_BASE + 43)
 
 /* last CID + 1 */
-#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
+#define V4L2_CID_LASTP1                         (V4L2_CID_BASE + 44)
 
 /* USER-class private control IDs */
 
-- 
2.7.4

