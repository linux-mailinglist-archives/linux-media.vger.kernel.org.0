Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A25F37065B
	for <lists+linux-media@lfdr.de>; Sat,  1 May 2021 10:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbhEAIVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 May 2021 04:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhEAIVA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 May 2021 04:21:00 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAE4C06138B
        for <linux-media@vger.kernel.org>; Sat,  1 May 2021 01:20:10 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id lp8so316317pjb.1
        for <linux-media@vger.kernel.org>; Sat, 01 May 2021 01:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ylnHk+JNuqq5ZmDFacYDEfwOgLykql+ZShEQSvQwkpU=;
        b=YXhoS2pU2hvfW019BAiAszVK4eSDsIqFZ+yEKWjufqpG5zfOG7SIkphyor3r0BuXlP
         wy2iqwRKgdHi55Ku+vCNmgiMUBhFebPk8X0KYaWiS/Ty7R9i+yHaRjzaB5FTrF8c23O0
         WoLVWPAoTEnMMf8evhZBQGUKngWTYDIAp17lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ylnHk+JNuqq5ZmDFacYDEfwOgLykql+ZShEQSvQwkpU=;
        b=sF/56Exnk9RTty5YDipHvsdgzOQtjn4l/Kw3nMgMOuNwGJxeIfCBh8YZas/V1I0cr4
         LJ5+S+qPZefLuI7vgXlgWZ7COB2WuAEk3pQvohLjhoYlV9/5gZzd6IUdLhRQB3Qzw19f
         o+npItO66ilrURnLuH6s0E3CZEVoRn8nc2mWHT2c2NSqVRII4b4YLwFHxeerKj25oKbM
         ln1M5pqy3gOarfeb8+DH5h0S1bHK4y4p7wHRYylzKj+kxJaUQ0FstrljDYt8b07Egstb
         hwuIQ2P0bryFQiPUEMQEFf8q03dRAJgIXuf5M+YvGzNAPYQIl+xMKJdraat9foLgwE4Y
         2ZnA==
X-Gm-Message-State: AOAM5331GN3nPbpHOex0JLukbOGaF6L32hLJQVTwn2tD9A0wtm54Ar++
        /izYH31/39913nux4oRREuvMTg==
X-Google-Smtp-Source: ABdhPJx2mp2dZu1A0XSG18f8CEsROVW/j3BS/eOmMLtj0jWiktr1sOZCdImZ0JpqCeUCapoTrxSiUQ==
X-Received: by 2002:a17:90a:a589:: with SMTP id b9mr9487803pjq.80.1619857210492;
        Sat, 01 May 2021 01:20:10 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:8be7:e987:d00a:1442])
        by smtp.gmail.com with ESMTPSA id b7sm3763003pjq.36.2021.05.01.01.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 01:20:10 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 1/5] media: v4l UAPI: add ROI selection targets
Date:   Sat,  1 May 2021 17:19:57 +0900
Message-Id: <20210501082001.100533-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210501082001.100533-1-senozhatsky@chromium.org>
References: <20210501082001.100533-1-senozhatsky@chromium.org>
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

