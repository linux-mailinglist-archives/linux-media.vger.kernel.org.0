Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD49520AE10
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729411AbgFZIH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729200AbgFZIGC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:06:02 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6B3C08C5DB
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:02 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f3so4637534pgr.2
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R5vXuXwwtIZUfF4BfG9q9gkBaSVJwvlyD2fg0DvyG/o=;
        b=SZIoVTB2bUsJPcvPGht36M0kNPya2OtypIUm6R/kU5idf+jHwGcKBDebxUMontdwE3
         ucu8ImAhdYwNMIGhZBU/ejFM6SA8aC6xrI2AQao5qFzDp/WSgwiTK0sOKxLJb7WLOiGX
         0c7g+j1jwesG3xBx+UbJku56d/hrsWmoLjKkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R5vXuXwwtIZUfF4BfG9q9gkBaSVJwvlyD2fg0DvyG/o=;
        b=SGcfxIDnneLfNhV1WxCZ6jCL0zmIOBUBG8vuY5YrElg0UGHCKsFLkRe31WGgk8UeHu
         xsx3VWx16BZyU0ZsNHujbYS1+UljWOKJu+fVHNvHvPyKE4qQY3llAQsrapbxNd3j1gZJ
         TkB42PgCjBN/NTJVU6TQpRYo71ClaI8Lw9P6W3ahEA0kHiJWvCD4TXWcVH8aNrRr/KF3
         1DNc56aiWn3rirfc9lfcAZT+9CHsZq3zR4QLLwnzHU9CWws7CSwHy8s8lmbhf8uq13TN
         pwwUeR/MP4xMYWMDYdrLshSN3x6EStCyYB5ZMd6fUc4YBSrpbcrHv/VeobhtJqfr45rG
         aBqQ==
X-Gm-Message-State: AOAM530hshf57skPXO4rctzU/YdzWvlvKG3B/sK6qqkNbBqbq5oGgkCf
        blHbHI3mUqDNXVxR/zu0PzLVwjDGNXBBYQ==
X-Google-Smtp-Source: ABdhPJwsPYMFNn4UtISOFCd1oyh+Vgmf6qCPkOU+H1OcttLDf70TTxwBOBUiqZwXjwu/ORDB1zroQw==
X-Received: by 2002:a63:c58:: with SMTP id 24mr1611333pgm.343.1593158762125;
        Fri, 26 Jun 2020 01:06:02 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 01:06:01 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2 10/18] Revert "media: mtk-vcodec: Remove extra area allocation in an input buffer on encoding"
Date:   Fri, 26 Jun 2020 17:04:34 +0900
Message-Id: <20200626080442.292309-11-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit 81735ecb62f882853a37a8c157407ec4aed44fd0.

The hardware needs data to follow the previous alignment, so this extra
space was not superfluous after all. Besides, this also made
v4l2-compliance's G_FMT and S_FMT tests regress.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 05743a745a11..f2ba19c32400 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -299,12 +299,14 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 
 		pix_fmt_mp->num_planes = fmt->num_planes;
 		pix_fmt_mp->plane_fmt[0].sizeimage =
-			pix_fmt_mp->width * pix_fmt_mp->height;
+				pix_fmt_mp->width * pix_fmt_mp->height +
+				((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
 		pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
 
 		if (pix_fmt_mp->num_planes == 2) {
 			pix_fmt_mp->plane_fmt[1].sizeimage =
-				(pix_fmt_mp->width * pix_fmt_mp->height) / 2;
+				(pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
+				(ALIGN(pix_fmt_mp->width, 16) * 16);
 			pix_fmt_mp->plane_fmt[2].sizeimage = 0;
 			pix_fmt_mp->plane_fmt[1].bytesperline =
 							pix_fmt_mp->width;
@@ -312,7 +314,8 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 		} else if (pix_fmt_mp->num_planes == 3) {
 			pix_fmt_mp->plane_fmt[1].sizeimage =
 			pix_fmt_mp->plane_fmt[2].sizeimage =
-				(pix_fmt_mp->width * pix_fmt_mp->height) / 4;
+				(pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
+				((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
 			pix_fmt_mp->plane_fmt[1].bytesperline =
 				pix_fmt_mp->plane_fmt[2].bytesperline =
 				pix_fmt_mp->width / 2;
-- 
2.27.0.212.ge8ba1cc988-goog

