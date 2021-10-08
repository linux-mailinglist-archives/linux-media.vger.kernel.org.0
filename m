Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D65542675E
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 12:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239592AbhJHKIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 06:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239545AbhJHKIE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 06:08:04 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B38C061755
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 03:06:09 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id x8so5816548plv.8
        for <linux-media@vger.kernel.org>; Fri, 08 Oct 2021 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KUHB0swnVu/KYbAl644YyqO7PSS/qaz1tm73DfYZaVs=;
        b=KjcoqE6YX7cIYNyMM5PYyjs3wF5Gr2V320ljZVdIb+8BUaW/8M5CCYKaLtzNoZGRUe
         uX7RLS8mMIbBVIyHfU4+FZU7qGeetDJtcCyahAW9TugFrTxmLr2rwzbIgcHNJDICBion
         2QHzwmrXqPVSsePpTXgSsGzmNzcRd3RM8c36k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KUHB0swnVu/KYbAl644YyqO7PSS/qaz1tm73DfYZaVs=;
        b=UEGXu9ytzpcZI7voujdZ5N30XIy3eyBSUCuN1qSkWdO1b2B2i2n6prrGDM3gF+4IOo
         hvLr8xx7GarePLyRS4wfWmmNe2oOvW0y1Z9SHaI0uhz/yQLO0Im8On19mDBE7LoGJndQ
         9HlnH/UDvfgIk8Gsh5OIQNQ1pmtGr1Drs+clQnnxzdAPb8mGZk60AuclAO5O82puVIqZ
         vV+wZvNhnpGUu4OViTj171qZe5USXffwEjKq74guHHiAhXOowN0bTwV5XfDXfnNOVNii
         AwNzEujDHH4e8fKI/Bg2FsPQar3/2Rk1cjWKe/sQ3FjovLiFkHbLCsWO75s+y+o7MpG+
         4ztQ==
X-Gm-Message-State: AOAM532A+fQRh676lMAoARlLzIiX6G3UsbcIYB04Q61BtKP+f4pcq7df
        tKKf9ga+nnSRnkbzXovCt+12g9STETmkSA==
X-Google-Smtp-Source: ABdhPJxkBdREzfd4W+kfYcgYxTKjv3LHKdMoe+zGfcZMc2uCzCDqxRU5AMNwaiX+5Rzy51jDyTfhwQ==
X-Received: by 2002:a17:90a:b706:: with SMTP id l6mr11379699pjr.200.1633687569261;
        Fri, 08 Oct 2021 03:06:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ad8d:f936:2048:d735])
        by smtp.gmail.com with ESMTPSA id a7sm2082255pfn.150.2021.10.08.03.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 03:06:08 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        stable@vger.kernel.org
Subject: [PATCH 1/2] media: rkvdec: Do not override sizeimage for output format
Date:   Fri,  8 Oct 2021 18:04:22 +0800
Message-Id: <20211008100423.739462-2-wenst@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
In-Reply-To: <20211008100423.739462-1-wenst@chromium.org>
References: <20211008100423.739462-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rkvdec H.264 decoder currently overrides sizeimage for the output
format. This causes issues when userspace requires and requests a larger
buffer, but ends up with one of insufficient size.

Instead, only provide a default size if none was requested. This fixes
the video_decode_accelerator_tests from Chromium failing on the first
frame due to insufficient buffer space. It also aligns the behavior
of the rkvdec driver with the Hantro and Cedrus drivers.

Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 76e97cbe2512..951e19231da2 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -1015,8 +1015,9 @@ static int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx,
 	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
 
 	fmt->num_planes = 1;
-	fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
-				      RKVDEC_H264_MAX_DEPTH_IN_BYTES;
+	if (!fmt->plane_fmt[0].sizeimage)
+		fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
+					      RKVDEC_H264_MAX_DEPTH_IN_BYTES;
 	return 0;
 }
 
-- 
2.33.0.882.g93a45727a2-goog

