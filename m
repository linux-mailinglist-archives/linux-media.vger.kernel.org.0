Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8DD336F939
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 13:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbhD3L1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 07:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhD3L1K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 07:27:10 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1B6C06138B
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 04:26:21 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id t21so5324851plo.2
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 04:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ylnHk+JNuqq5ZmDFacYDEfwOgLykql+ZShEQSvQwkpU=;
        b=I5CJcszoEnVMCJRX73o9D+zV2auj6LWS7feT05oebev/wKacdLL+3prEoQ9oDl4iht
         obAOaZ5+Zk2EoVnfTavi/QcQSb3W1/0nC67S4kgZT5HTp2MapwiLvlkSlKrm0TJM8WxR
         MyALGWO4qZkltcqkR2v9T9XRH86bhxsvF5K7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ylnHk+JNuqq5ZmDFacYDEfwOgLykql+ZShEQSvQwkpU=;
        b=tlYXNL6axr5JXU0F5NbUMMrYJcCOUZlZD0DWheLXkgJQ+N/5ifxDstROCopaFW/eTF
         UroS5qKGekewPjf1xaRBxApqzEq2XE8kp6Umm01T3QPKcE5H+enw2xg8G9l9rvOoCOwU
         SdwaqFsXTHRiI7oorl3DFlACMO6kTetj6pwGofUZEUYcv5byDUugFqFOSFvlFGM/5cHr
         8EZzCR472I1lLy/zZ/TCBfhGbWi4BbSZc+i40IK4xkdepy/f2QqbDLg9YG1deVFphdLa
         9oPf+Fz1ANEDOOTIuFlCgiWaFgfN2wOwio37vhZtZElntN3DEUHZMxs+aep45/dvLaHJ
         /AHg==
X-Gm-Message-State: AOAM531gat2/dr+msUBWia2hDP+EiAvZzTp87FKoza5xq6iapRkk9Dz5
        xlma2B87YjK+0Qox7eOoFryZmQ==
X-Google-Smtp-Source: ABdhPJwU/FF0411SpORuI8rQAjETnXq+LFVWG/DnEHH5trDF7L30y1kMn1g6schCj5R5BHbBqvV1Vg==
X-Received: by 2002:a17:902:7081:b029:ec:c083:878a with SMTP id z1-20020a1709027081b02900ecc083878amr4689125plk.76.1619781981314;
        Fri, 30 Apr 2021 04:26:21 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:2c33:77c9:7bef:267e])
        by smtp.gmail.com with ESMTPSA id l10sm1809457pjy.42.2021.04.30.04.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 04:26:20 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 1/5] media: v4l UAPI: add ROI selection targets
Date:   Fri, 30 Apr 2021 20:26:07 +0900
Message-Id: <20210430112611.475039-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210430112611.475039-1-senozhatsky@chromium.org>
References: <20210430112611.475039-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UVC 1.5 requires Region Of Interest control to implement
GET_CUR, GET_DEF, GET_MIN and GET_MAX requests. This patch
adds new V4L2 selection API targets that will implement
those ROI requests.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/uapi/linux/v4l2-common.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/uapi/linux/v4l2-common.h b/include/uapi/linux/v4l2-common.h
index 7d21c1634b4d..3651ebb8cb23 100644
--- a/include/uapi/linux/v4l2-common.h
+++ b/include/uapi/linux/v4l2-common.h
@@ -78,6 +78,14 @@
 #define V4L2_SEL_TGT_COMPOSE_BOUNDS	0x0102
 /* Current composing area plus all padding pixels */
 #define V4L2_SEL_TGT_COMPOSE_PADDED	0x0103
+/* Current Region of Interest area */
+#define V4L2_SEL_TGT_ROI		0x0200
+/* Default Region of Interest area */
+#define V4L2_SEL_TGT_ROI_DEFAULT	0x0201
+/* Region of Interest minimum values */
+#define V4L2_SEL_TGT_ROI_BOUNDS_MIN	0x0202
+/* Region of Interest maximum values */
+#define V4L2_SEL_TGT_ROI_BOUNDS_MAX	0x0203
 
 /* Selection flags */
 #define V4L2_SEL_FLAG_GE		(1 << 0)
-- 
2.31.1.527.g47e6f16901-goog

