Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC2F2F18E0
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388756AbhAKO4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:56:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730264AbhAKO4J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:56:09 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED20C0617A5
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 06:54:51 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id y23so138112wmi.1
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 06:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QAsmUUEgKueJfUyE+PDxMx4ue7SmU3mq0cNtqhnnYsE=;
        b=cdKRerAvU1UPYuCV0vCuEM401EAsTCASkDnjlSRj1WBN57Ay7ruzDTalMK6YAH259i
         jNHa3Ywloylm9orbp/B59KbWqm+d+JrN+QB3raBMkVmxefG/Pf8KzPBSRKe8aicX/C3i
         vBLTwd6rdHknL3WZygJWlCDfMvLFEPQEqNZr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QAsmUUEgKueJfUyE+PDxMx4ue7SmU3mq0cNtqhnnYsE=;
        b=lLIsOfSejvn9l9IknsVsNRsheSEhS8uxvDWUYtU6rP8PuJ1fUKexZ4fFePUVuUqS2h
         8aa3Lf6MzGMx/YcTBUCqcrKne+AJtBkhuWRRopUN2tuk4ZYRsnwDp4BnMk/GUCBJbG/2
         QwDq3O4/fBgl9r2gnwZUZxdZHlTEgZvH7RKU94A9c7q5B39h+orLl0K4G+FxxItf2hoY
         Bs8aSNd1o94aB4PNXZaGjFVONfYbgezFNzH6s7alWO79DGYHIJbIz4fy7E0dIpkcFp5x
         sFP2J38NqFnw822ToZbrD1Yg2qSLNvTUX1hZ0qb6cdNRsRcUAgP9zAPplseFJdtHFrBq
         loug==
X-Gm-Message-State: AOAM531rqQ9Zc0VnQ27pxGHyd1o/qamNe56v3uFH4Aek9elvOiF0JjEM
        QPihFkkL3cipDpwrLvXoTEHgHL+dSTi6mURquH4=
X-Google-Smtp-Source: ABdhPJyOYz9gxuEVRQRIvRU+Jl4KvAUI5AC5g0C3gmc/dNz+48JZjXBUIIcCzXiCCego+TORLUQbYg==
X-Received: by 2002:a1c:6208:: with SMTP id w8mr103281wmb.96.1610376889935;
        Mon, 11 Jan 2021 06:54:49 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id s133sm17780wmf.38.2021.01.11.06.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 06:54:49 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 3/9] media: mtk-vcodec: Do not zero reserved fields
Date:   Mon, 11 Jan 2021 15:54:39 +0100
Message-Id: <20210111145445.28854-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210111145445.28854-1-ribalda@chromium.org>
References: <20210111145445.28854-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Core code already clears reserved fields of struct
v4l2_pix_format_mplane, check: 4e1e0eb0e074 ("media: v4l2-ioctl: Zero
v4l2_plane_pix_format reserved fields").

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 5 -----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 8 --------
 2 files changed, 13 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index c768a587a944..d746c41ea805 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -715,12 +715,7 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 		}
 	}
 
-	for (i = 0; i < pix_fmt_mp->num_planes; i++)
-		memset(&(pix_fmt_mp->plane_fmt[i].reserved[0]), 0x0,
-			   sizeof(pix_fmt_mp->plane_fmt[0].reserved));
-
 	pix_fmt_mp->flags = 0;
-	memset(&pix_fmt_mp->reserved, 0x0, sizeof(pix_fmt_mp->reserved));
 	return 0;
 }
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 21de1431cfcb..db1f62cc38b3 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -320,13 +320,7 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 		}
 	}
 
-	for (i = 0; i < pix_fmt_mp->num_planes; i++)
-		memset(&(pix_fmt_mp->plane_fmt[i].reserved[0]), 0x0,
-			   sizeof(pix_fmt_mp->plane_fmt[0].reserved));
-
 	pix_fmt_mp->flags = 0;
-	memset(&pix_fmt_mp->reserved, 0x0,
-		sizeof(pix_fmt_mp->reserved));
 
 	return 0;
 }
@@ -532,8 +526,6 @@ static int vidioc_venc_g_fmt(struct file *file, void *priv,
 	for (i = 0; i < pix->num_planes; i++) {
 		pix->plane_fmt[i].bytesperline = q_data->bytesperline[i];
 		pix->plane_fmt[i].sizeimage = q_data->sizeimage[i];
-		memset(&(pix->plane_fmt[i].reserved[0]), 0x0,
-		       sizeof(pix->plane_fmt[i].reserved));
 	}
 
 	pix->flags = 0;
-- 
2.30.0.284.gd98b1dd5eaa7-goog

