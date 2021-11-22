Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96697459508
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 19:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240480AbhKVSun (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 13:50:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239444AbhKVSu3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 13:50:29 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C008C061759;
        Mon, 22 Nov 2021 10:47:18 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id t5so81598518edd.0;
        Mon, 22 Nov 2021 10:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MWqT8jgM+LxizZRnwNQ4lYoOgf1SpCYqwsAExcOLMVI=;
        b=Hes/v+KIictHB9Qldriu0R0Qd+74EZhSW4B024o73zgqni34zeC7mkXgTMJkLtMm+i
         vcnS6Qc6Z37MOOBzqOxcV+rv/TvxLDJimsZjN2X5WwfiN3/96AUjETN5yaT/AvgKrx3b
         YwJ+0rSmwFY6kcTfK3LOrLxg9eCpGBITD1cm5ie7/l5oMSItGmq8ilvTzXcVXZbetgTX
         Dew+15IJM20AAfD5Ek7ISIXz/FjD9smpJ8pdQe8hMLhhPDmU7atznfWgVFNrtyPNpQOZ
         k2gRpRSmBY0A5knsMdYsxAju+8nT67k8oX7H2sA88WS5jBiIhqw5OY3jNjdmZF37PgvK
         VZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MWqT8jgM+LxizZRnwNQ4lYoOgf1SpCYqwsAExcOLMVI=;
        b=Ma+gIgGTHWkj7q7SZ/qIm048HpFxtnFtkVnjzsD71QCN9WZP/CKPurSWF8hj1D9kOa
         eIkMdXiKsTgPomkOEpdmLhJaiznVKNsmGYwXSXABCbp64MAL0jxjPQJoBokeEkUQ01xV
         cJY00ekLrh5cgxfOIinFdhpuuzoZDiuZ9mMvuGFKCSUxz2OtN7r4B+eje/OrAXDlOGwF
         EBbDCtfdxtxVFPP9ZcRrFNEVlTHXJZSB+ruk19SZ/Bd0mHK0qjZc5x8i0LbHVTEvH97K
         Sa2YWNQqqRUezsXtLc3wVAgbBfqV4f2ugWe2B8NcVMVOm0bhIdwlJIo3rDi4ByqyiuW8
         wNww==
X-Gm-Message-State: AOAM532vQD+gmyU0TTk8VZ4gFztpu/oQoasASP1RT9K7VdW6Jpfp4zkf
        KkRw+2EdoDO8gd7iARyWb9fFKazbCLQTWA==
X-Google-Smtp-Source: ABdhPJz35lPCNuyABipllxBzdcJzYzKIiQZ5XLS+pqrXIVlp7yUVBLtqgqtbilp4nqQsAW5aIh3sKQ==
X-Received: by 2002:a17:906:2b16:: with SMTP id a22mr42530944ejg.447.1637606836941;
        Mon, 22 Nov 2021 10:47:16 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id h10sm4512312edr.95.2021.11.22.10.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 10:47:16 -0800 (PST)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
        mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org, p.zabel@pengutronix.de, andrzej.p@collabora.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 4/7] media: hantro: move postproc enablement for old cores
Date:   Mon, 22 Nov 2021 19:46:59 +0100
Message-Id: <20211122184702.768341-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122184702.768341-1-jernej.skrabec@gmail.com>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Older G2 cores, like that in Allwinner H6, seem to have issue with
latching postproc register values if this is first thing done in job.
Moving that to the end solves the issue.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro_drv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 8c3de31f51b3..530994ab3024 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -130,7 +130,7 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
 				&ctx->ctrl_handler);
 
-	if (!ctx->is_encoder) {
+	if (!ctx->is_encoder && !ctx->dev->variant->legacy_regs) {
 		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
 			hantro_postproc_enable(ctx);
 		else
@@ -142,6 +142,13 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 {
 	struct vb2_v4l2_buffer *src_buf;
 
+	if (ctx->dev->variant->legacy_regs && !ctx->is_encoder) {
+		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
+			hantro_postproc_enable(ctx);
+		else
+			hantro_postproc_disable(ctx);
+	}
+
 	src_buf = hantro_get_src_buf(ctx);
 	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
 				   &ctx->ctrl_handler);
-- 
2.34.0

