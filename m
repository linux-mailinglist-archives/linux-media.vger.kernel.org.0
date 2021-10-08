Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D443F4267EF
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 12:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240004AbhJHKdB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 06:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240009AbhJHKcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 06:32:47 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F082CC06176C;
        Fri,  8 Oct 2021 03:30:49 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id n2so5844795plk.12;
        Fri, 08 Oct 2021 03:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1vSaD+K23J62kBXc5f4Gf9so221KhPSbs4YJD+VvKhA=;
        b=U8EW2wp4qReShlnXay4S7ydyIdzCH1AH1qjdK/kM3W8kwER3PTtks27vVJ0xrfvtSK
         zxMgaFDnyCI/7OMW4crF0kD8majo0M0i2HwDr4udB8nGh9J9k0gEfKlmUBdCERqGq+Qh
         YSQ5p4wM8vP2XQUrIuAzh6XQQEmsP9xHR8XylX/4XHbhLDeBQKY8NlzrqwP0TvFftj0/
         oZ0Lmyv0CAvZ950EzxJt0zHa2iVqSZ8nH2F8edSjyOV2WAXkhLQyPvdCXcbtT+W+81Km
         4d0/MA0IzpShkLnWF0ujND8ItL44WmrYJp4NYU/oBdob6ONaX5KujMZJ+PoiP7ZahbXU
         3BeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1vSaD+K23J62kBXc5f4Gf9so221KhPSbs4YJD+VvKhA=;
        b=XdJck2nzfEGt4iDC+IY8qR2DgHG83wRiPkxy5Puiq/6F9Y4caQLJ7ItCDXRjA+/0Hd
         3UO4/hLRvHl87mP8Du200+5jujqBmIbacejK/iyNzziUJT4uQ9x//Rg4jYvHzRRusRef
         A/VY8hCspgiSVtnCXrJyNDvfNfQUCntWlx6lbw83dgbS6oKrHahhgPPw+m+jtVBqTv18
         oZI6NqWu7JyLNWAFEFNG97zlYzDOvBpcmqx4unMTX3GBZ5rbIwoQaoZYQ7I0RT0tkxfY
         xBJO+5c4vWZIVYUY++lc/xiOQYa13k07hG5lQArsFM/wHDpi5SNyLzPbc9iLnfehDXht
         /6MA==
X-Gm-Message-State: AOAM532uHN/1v64M5fYBGCJwwisBKefkEYOmrCaDoSE0BR0yI9Lw1qqO
        lMI1e45FbIBGfn/kQUZRRpE=
X-Google-Smtp-Source: ABdhPJxey6T8s1PJUjASu05BTCcAI3nvN2CVUF/29EAPQeI+8ooJJU3yNkiEDyDglxjMU73hKrRNAw==
X-Received: by 2002:a17:90a:17cd:: with SMTP id q71mr11318543pja.129.1633689049513;
        Fri, 08 Oct 2021 03:30:49 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id y15sm2620151pfa.64.2021.10.08.03.30.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Oct 2021 03:30:49 -0700 (PDT)
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
Subject: [PATCH v3 6/8] media: v4l2-ctrls: Add ARGB color effects control
Date:   Fri,  8 Oct 2021 18:30:10 +0800
Message-Id: <1633689012-14492-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

- add V4L2_COLORFX_SET_ARGB color effects control.
- add V4L2_CID_COLORFX_ARGB for ARGB color setting.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v3: according to Hans's suggestion, thanks.
- remove old stm32 private R2M ioctl
- add V4L2_CID_COLORFX_ARGB
- add V4L2_COLORFX_SET_ARGB

 Documentation/userspace-api/media/v4l/control.rst | 8 ++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 2 ++
 include/uapi/linux/v4l2-controls.h                | 4 +++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
index f8d0b923da20..319606a6288f 100644
--- a/Documentation/userspace-api/media/v4l/control.rst
+++ b/Documentation/userspace-api/media/v4l/control.rst
@@ -242,8 +242,16 @@ Control IDs
     * - ``V4L2_COLORFX_SET_CBCR``
       - The Cb and Cr chroma components are replaced by fixed coefficients
 	determined by ``V4L2_CID_COLORFX_CBCR`` control.
+    * - ``V4L2_COLORFX_SET_ARGB``
+      - ARGB colors.
 
 
+``V4L2_CID_COLORFX_ARGB`` ``(integer)``
+    Determines the Alpha, Red, Green, and Blue coefficients for
+    ``V4L2_COLORFX_SET_ARGB`` color effect.
+    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
+    bits [15:8] as Green component, bits [23:16] as Red component, and
+    bits [31:24] as Alpha component.
 
 ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
     Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 421300e13a41..53be6aadb289 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:	return "Min Number of Output Buffers";
 	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
 	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
+	case V4L2_CID_COLORFX_ARGB:		return "Color Effects, ARGB";
 
 	/*
 	 * Codec controls
@@ -1392,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*min = *max = *step = *def = 0;
 		break;
 	case V4L2_CID_BG_COLOR:
+	case V4L2_CID_COLORFX_ARGB:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*step = 1;
 		*min = 0;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5532b5f68493..2876c2282a68 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -128,6 +128,7 @@ enum v4l2_colorfx {
 	V4L2_COLORFX_SOLARIZATION		= 13,
 	V4L2_COLORFX_ANTIQUE			= 14,
 	V4L2_COLORFX_SET_CBCR			= 15,
+	V4L2_COLORFX_SET_ARGB			= 16,
 };
 #define V4L2_CID_AUTOBRIGHTNESS			(V4L2_CID_BASE+32)
 #define V4L2_CID_BAND_STOP_FILTER		(V4L2_CID_BASE+33)
@@ -145,9 +146,10 @@ enum v4l2_colorfx {
 
 #define V4L2_CID_ALPHA_COMPONENT		(V4L2_CID_BASE+41)
 #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
+#define V4L2_CID_COLORFX_ARGB			(V4L2_CID_BASE+43)
 
 /* last CID + 1 */
-#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
+#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
 
 /* USER-class private control IDs */
 
-- 
2.7.4

