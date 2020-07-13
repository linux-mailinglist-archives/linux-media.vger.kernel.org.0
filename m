Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2ED121CF65
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 08:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbgGMGKL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 02:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729341AbgGMGJs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 02:09:48 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A53C061794
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2020 23:09:48 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z3so5526620pfn.12
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2020 23:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=il4DpcD/apPDl2cTCXc8/jfWcqySO11EC2m8fJv5U88=;
        b=hhS/XVomC66uSGacbR44AJu4XX8RglVUnHbYRQFol+JOwVlyO4zmLPxjZJVS2QAdPG
         f5e0TK74oOqb0gaxzYWjWU7yYwwdWiPjdfvbvDKizkxbdcHPi5xoVRDGXk7gTs4fly6H
         ULSsSLkR05CHdOA7/iNUCTpSeSaZU/O2iRGl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=il4DpcD/apPDl2cTCXc8/jfWcqySO11EC2m8fJv5U88=;
        b=JZKvzfpDk7HdC08zlVT2m3Tl8wjwKLivJsqNAMpAslQilKfW2hEu70/B1MUp9dWnX6
         OQucce60qn+YlAZv7fwTdpMXMrquxcZS1O2Dz0PBd+El/VNKkQ5TmgQ5SBzeLGWQWj0P
         lpehARv4VGWsEFMulmEzWHDekrWbHVqQ3MdG9pOyybheX0YMHh+SxyuWI0Eq5a9Hcj2B
         JjALubRpfpLDIaTvSupqnwsl/bsJSdvdCuRauw/yIxxLuOdT5FWUmQZX+t0yxOba+lKF
         xgv3pgdcaeFjdB/JrHKm5LhQO3eWxOKx41TvEIv2W2/QCmBthIB/WTQp5nx6AVYMvUoj
         I7hQ==
X-Gm-Message-State: AOAM533JXeBr7XM3p8uKL3CG3DsNUM2J4lSCma78NKR3CMpdA/C+O9lY
        C1xTDKsL0YoIZYHgqxkMZuWFZw==
X-Google-Smtp-Source: ABdhPJw4BuEKfXc1u9J80dnCet+O2HF62eLmMroTE4/+eQtDNPiyJisvtCiuH9Xyms3zgoFcD2wLwA==
X-Received: by 2002:a62:1610:: with SMTP id 16mr8378715pfw.113.1594620587680;
        Sun, 12 Jul 2020 23:09:47 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 23:09:47 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 12/16] media: mtk-vcodec: venc: set OUTPUT buffers field to V4L2_FIELD_NONE
Date:   Mon, 13 Jul 2020 15:08:38 +0900
Message-Id: <20200713060842.471356-13-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A default value of 0 means V4L2_FIELD_ANY, which is not correct.
Reported by v4l2-compliance.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
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
2.27.0.383.g050319c2ae-goog

