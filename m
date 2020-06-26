Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9AE20ADED
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbgFZIGW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729271AbgFZIGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:06:20 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2838BC08C5DB
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:21 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id b92so4622125pjc.4
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F6U2kLLRCj0NVNw/QlFArT2QiCEFka/0C4bkaDQjPqM=;
        b=gM1di/XSYvnZe1PpTYoZ7dmbK5xqrvIjVpb6pD0IL5cxvE1X4a2CDs8/pYofq+9/FG
         LpTplu9ZcMLWF3PXIw80f93CwQ69vPwn6p3MSIq9DuYOx3mi+eH8P8SstoyjxNZE4Y5z
         Yu5WMC7PyeIDZZwUyWbUsiarYd9a84UU0zX9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F6U2kLLRCj0NVNw/QlFArT2QiCEFka/0C4bkaDQjPqM=;
        b=Ps3EDsXMu+o8GSyFg8kCzIQcP6dZTirhuSO4stVRXxncJFQ3zRpykYbWV/+yCyXfPV
         Gc0HskEp0eLXiXcBeEfI9pWc0RNuR262t9jpN7XRu0WOEAxwQ+jic/pgYB4bhwS/Ye9C
         T1GnH4/yQHp0AdEIcYbMXK2HS0ZFtRJf2jkoyqqDIj2F9EtQJh3R/Je/n8d+jmqeE+JR
         j8sur3sHsiZudbnQHCH9YdNiQrJJ6X++1vJYvoMG4r3YQ8NC1h7Xie4Nk85rcMZx21A9
         EKNQ1NVS/YvZ3W1bGDaBKwcIKMATQZbimP3q8fJiVYAMAfOYGI5wJv7XsNiu99RofEOF
         ok0w==
X-Gm-Message-State: AOAM533V76I8qbuW6+klfTWpAk5Q1/QWXwcLJv7hifVLeL/7svtSPvBB
        44aCH2uCg1Wl/x64bIFDeux4QA==
X-Google-Smtp-Source: ABdhPJyG5OutRcLxxs/czs3n6d1rqJf8k0E9DH0hoHXoW2R21CXvKW4LIRQcUAye8Aeh/mDbigVRRQ==
X-Received: by 2002:a17:90a:5c85:: with SMTP id r5mr2188895pji.40.1593158780782;
        Fri, 26 Jun 2020 01:06:20 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 01:06:20 -0700 (PDT)
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
Subject: [PATCH v2 16/18] media: mtk-vcodec: venc: make S_PARM return -ENOTTY for CAPTURE queue
Date:   Fri, 26 Jun 2020 17:04:40 +0900
Message-Id: <20200626080442.292309-17-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2-compliance expects ENOTTY to be returned when a given queue does
not support S_PARM.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index aae610e6d4e8..346a33c6869d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -200,7 +200,7 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
-		return -EINVAL;
+		return -ENOTTY;
 
 	ctx->enc_params.framerate_num =
 			a->parm.output.timeperframe.denominator;
-- 
2.27.0.212.ge8ba1cc988-goog

