Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DEF20AE0D
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729264AbgFZIHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729220AbgFZIGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:06:08 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB57C08C5DB
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:08 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id cv18so1402852pjb.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ju0O0uW2865hksycznBHtUgpNV8XHzR5v3KuNKXnRKE=;
        b=gtJRqCnKsJ7/KtReGeGFmX9uU+fkClb7UaCFvZefifel5YcVKVLpWKbR16XTcL0KRi
         SQ+p8Jz/SCeYDidoYtVOAdmKT9XYAGrNT62/6Oue3mSLR//N4fXbDX/Oqff+IujpBrdO
         StyqeprKYLFhaELA+T+86DyaTYfyzKeOH4AEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ju0O0uW2865hksycznBHtUgpNV8XHzR5v3KuNKXnRKE=;
        b=M3uuNq1NXgBkFgOvXwZE/0vU+9w7FD5U4TvFiJPVribaz4ANwLJeCq9DcLi0yRPZRX
         Jwrstt/KUMNrr7knuSlopGR3wklU6VKNDBEwgJ9+3p662zxWKUz34OkR/9j/+aVzRmUS
         GXgR/Irwzt160DZR+6KKZ7f8hLqAwt8vktv/Dx3D4mm5p80HvwzoTkrpxgHEWLk8Fb8O
         VQzfA+avWC/CjJMVOkyx0ScmD7HrS+akQOhL9RvDzTvcpnvoMPZiUnLsGJIEZbgPMbb/
         jS+HKLfQkjjrc2LmFYNnvrKdO+vJRHcDjOKsQlMzMeYFz3v1kHfDbVFSBJcDq54fuOke
         7Djw==
X-Gm-Message-State: AOAM532yEDIAI86G8quzLIUkOkqcHuOFxLtlzHDXBWxFr74Q2fixv01F
        fl44WEZCPQKxBTEX0ZY1dn/dIp06erdkOA==
X-Google-Smtp-Source: ABdhPJzOkAYsZviFsY47s6Pz1QDXY2VPFW39j2s8prpRXPcCwJzDLMkX9tyA9JPFxd8HTFev1aMWYQ==
X-Received: by 2002:a17:902:7288:: with SMTP id d8mr1669811pll.18.1593158768403;
        Fri, 26 Jun 2020 01:06:08 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 01:06:07 -0700 (PDT)
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
Subject: [PATCH v2 12/18] media: mtk-vcodec: venc: set OUTPUT buffers field to V4L2_FIELD_NONE
Date:   Fri, 26 Jun 2020 17:04:36 +0900
Message-Id: <20200626080442.292309-13-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A default value of 0 means V4L2_FIELD_ANY, which is not correct.
Reported by v4l2-compliance.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index f833aee4a06f..1a981d842c19 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -893,8 +893,17 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 	ctx->state = MTK_STATE_FREE;
 }
 
+static int vb2ops_venc_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	vbuf->field = V4L2_FIELD_NONE;
+	return 0;
+}
+
 static const struct vb2_ops mtk_venc_vb2_ops = {
 	.queue_setup		= vb2ops_venc_queue_setup,
+	.buf_out_validate	= vb2ops_venc_buf_out_validate,
 	.buf_prepare		= vb2ops_venc_buf_prepare,
 	.buf_queue		= vb2ops_venc_buf_queue,
 	.wait_prepare		= vb2_ops_wait_prepare,
-- 
2.27.0.212.ge8ba1cc988-goog

