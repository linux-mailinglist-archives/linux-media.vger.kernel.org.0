Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7387139CE1B
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 10:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhFFIZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Jun 2021 04:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbhFFIZo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Jun 2021 04:25:44 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39ACC061766;
        Sun,  6 Jun 2021 01:23:38 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id r11so16334075edt.13;
        Sun, 06 Jun 2021 01:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4aW81uICbtPCTBV64hByiwvqx1T+Xsj8aZZhwnv+iCg=;
        b=LaFfjVjB66ka1WEgXbj7rzzdfGfwJ+fvJ9T9QyjAbCXXZjjJzYbSwQH9IXEojdpyDl
         m05ki49g9U5ZKnwJQut+0gDo33/+pPW4PF3MmuGFPHMbbTH74b9j0A1nQv2USNezwcEE
         mbzGBRzogjBAvBGkUr4saTq8B+g2A+dfmjXYUYdgOPgynNBhMR5Pb0hGHa367Zxb8ene
         qJWyz/JeTbFcfcX/KESc6+8PNvipsFyv8ZNl9BxGNvqzSl2FHdtgKXPikjGhqM0nX8MB
         hKst5io7QEGEqu5FLS0zYIv4Aof/uqptrEck7NmFIl4AoVTuNPj3giOSvK67rLzqbCvH
         hCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4aW81uICbtPCTBV64hByiwvqx1T+Xsj8aZZhwnv+iCg=;
        b=bPQK4kMrOoyJPQKEq19j2XJcC5zr3LH8F3M++YP8e63MIJlzJOPE+VSKeqwJya6qgc
         O/e/fv3VaY0QPoxZcH17T6JlwXq3KYM6SdHsHikK7XqY+u4vhE6hikizIDamDNoH/Gf0
         QfMHd56Y64dgPgG0zaTgq9sVejH40BpTSlvsnhhCatrKeA2Ui/eX9ufcuXbGk3YWZ8mN
         4rG3GoHc0EGOV/4nzkiPWshg4EdAsJ305Exn9FqmBYVb3CNTR7Cy1fWpwVzcbRRn+Hnr
         ZZv5KgXsFMV4+NpkP2lYDNin3a+8fzZXrmuQNmdmMf6pN/6QrMtRj/4jMWfcVmOsVj+/
         5A1g==
X-Gm-Message-State: AOAM533+bbOU3722wozYIHUyJYRReey0XHSuzMXLQ/o3UMLLDeY9Dqlg
        XRK8UhEH0tx5HTiIEkGoGa8=
X-Google-Smtp-Source: ABdhPJwUi5AIU2YWU2GWKSIpcJprUQ3af1/G5wM7VU4yjHHoEcY63ncZHfrTg0Hn8e/eqAqSUl7GAQ==
X-Received: by 2002:aa7:d550:: with SMTP id u16mr14105847edr.72.1622967816582;
        Sun, 06 Jun 2021 01:23:36 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id y1sm4945908ejl.7.2021.06.06.01.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 01:23:36 -0700 (PDT)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com,
        benjamin.gaignard@collabora.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] media: hevc: Add segment address field
Date:   Sun,  6 Jun 2021 10:23:13 +0200
Message-Id: <20210606082314.454193-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210606082314.454193-1-jernej.skrabec@gmail.com>
References: <20210606082314.454193-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If HEVC frame consists of multiple slices, segment address has to be
known in order to properly decode it.

Add segment address field to slice parameters.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 3 +++
 include/media/hevc-ctrls.h                                | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 9120c5bcaf90..fac4b477da82 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2997,6 +2997,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - __u8
       - ``pic_struct``
       -
+    * - __u32
+      - ``slice_segment_addr``
+      -
     * - __u8
       - ``ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
       - The list of L0 reference elements as indices in the DPB.
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index dc964ff7cd29..19f8e2ad3375 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -197,10 +197,11 @@ struct v4l2_ctrl_hevc_slice_params {
 	__u8	pic_struct;
 
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
+	__u32	slice_segment_addr;
 	__u8	ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
 	__u8	ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
 
-	__u8	padding[5];
+	__u8	padding;
 
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Weighted prediction parameter */
 	struct v4l2_hevc_pred_weight_table pred_weight_table;
-- 
2.31.1

