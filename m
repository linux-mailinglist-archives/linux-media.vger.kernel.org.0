Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2EAB42D709
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhJNK1s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbhJNK1r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:27:47 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E079AC061760;
        Thu, 14 Oct 2021 03:25:42 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id lk8-20020a17090b33c800b001a0a284fcc2so6582690pjb.2;
        Thu, 14 Oct 2021 03:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r8HJ6DgODtj2X2cqd5mOjTvpDOOECTMV1Qw563xhwTM=;
        b=mpc74U8iXqWqKswUPZ5p5H8afkLFsxDUpV8Js49OSjvOQA0/Uadbd5LN71Qnghk3CJ
         V4tYCVOuDfBSP8iIiynxP6lA1Pi7Mk4X86AEKCYzbVa1vzpiQ4OcY+XU8Wq5Cvlx5uQX
         hr7hTu7jMfPRb+2VrL48gHi8bLPqv10v/QwA6JvCIqSPNP5bKRP02Z77AhqajsIuLu07
         lsghDHcSKkCLprlJjdmeSL1Fq2VUom+g6YkWrlOk2hYFBHwGydAytdy4d8XeTfhpqust
         K/JMpgvVhyiDAjeJJcigzAstg5OgzVeMH0wPjCEoVKQU5TyrzBikeSWV8W1Iybq4p9ka
         rfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r8HJ6DgODtj2X2cqd5mOjTvpDOOECTMV1Qw563xhwTM=;
        b=Wpp+OOpvClDcaX3ky7v+EElQefHHC0ely+JN+z20rLGMN7/dlJHyhTuS65bCcPEu6b
         nsAAEEWlSvtmVFTcExvmNMFQMvGvuqj1fBJLRPSqWSFPSmHHaN3sWD7P12Hx/G7aMuUu
         cpS0bDhFQsLhRkxBEC0ECVv01pkDklIVSvp69X57hpFtLS3kZsRmLdid5ciDBzLlRqEm
         pEXPO2vrjaZ++JYJ6Ngw3p21+g+x654Y/uHeoP/l2qMMGoeudwqW0y82MKUqghS3cvSG
         59fsMBlZHRCzS9i0CB0GZtRFM9O9MtvrBhmNtaF7HOGkV79B5b1svCihvmQnMgnbGRTv
         pikQ==
X-Gm-Message-State: AOAM5337aOWYt+HDWJV+H2jcUERBHLs0BFNREPFo6zNz6aP7Gdi15P2Z
        jiANy2RlTLAtBu58WcBACR4=
X-Google-Smtp-Source: ABdhPJzKxYnF0aGU+TyU3PMufbcyBKd0EQJgQ/9fRF15N0SJKrKkNhhFj2gzhLmQcxZMPFOZwxQzeg==
X-Received: by 2002:a17:90b:4d86:: with SMTP id oj6mr11020697pjb.46.1634207142519;
        Thu, 14 Oct 2021 03:25:42 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id ip10sm2105939pjb.40.2021.10.14.03.25.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Oct 2021 03:25:42 -0700 (PDT)
From:   dillon.minfei@gmail.com
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
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v4 6/8] media: v4l2-ctrls: Add RGB color effects control
Date:   Thu, 14 Oct 2021 18:25:04 +0800
Message-Id: <1634207106-7632-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Add V4L2_COLORFX_SET_RGB color effects control, V4L2_CID_COLORFX_RGB
for RGB color setting.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v4:
- replace V4L2_COLORFX_SET_ARGB, V4L2_CID_COLORFX_ARGB to
  V4L2_COLORFX_SET_RGB, V4L2_CID_COLORFX_RGB since Alpha paramter not used
  in current. thanks Hans.

 Documentation/userspace-api/media/v4l/control.rst | 9 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 2 ++
 include/uapi/linux/v4l2-controls.h                | 4 +++-
 3 files changed, 14 insertions(+), 1 deletion(-)

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
index 421300e13a41..f4bd90170105 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:	return "Min Number of Output Buffers";
 	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
 	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
+	case V4L2_CID_COLORFX_RGB:		return "Color Effects, RGB";
 
 	/*
 	 * Codec controls
@@ -1392,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*min = *max = *step = *def = 0;
 		break;
 	case V4L2_CID_BG_COLOR:
+	case V4L2_CID_COLORFX_RGB:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*step = 1;
 		*min = 0;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5532b5f68493..9aa3fd368383 100644
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
+#define V4L2_CID_COLORFX_RGB			(V4L2_CID_BASE+43)
 
 /* last CID + 1 */
-#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
+#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
 
 /* USER-class private control IDs */
 
-- 
2.7.4

