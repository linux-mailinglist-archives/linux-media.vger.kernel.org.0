Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD753260E7
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 11:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhBZKGj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 05:06:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhBZKEf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 05:04:35 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7038EC0611C1
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:35 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id e3so1950838pfj.6
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gJgvh0R1fbIgxse7gyq7HYcHWSSI9BRuWoAHbwnFZ7Y=;
        b=Cdnesy/S9Vewg8GbUNKD9HO7UJ5yWGwu5vDSGKyM7jSprc9wI/rmNMgQAXgoZ9OyfR
         221Of6Jf+Stja0LgBMQKyXxe5OrVYxLlLU2Qbqkzw8LODZO6hjXvnC7EqQxWbOjPzvFd
         O9e275ShxITllS7UbtqMV+fyMXeb7OI+GpnK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gJgvh0R1fbIgxse7gyq7HYcHWSSI9BRuWoAHbwnFZ7Y=;
        b=cqyeEJKLAyj13QWO3G93v6jMEL+HE43EgqprRufXL4Q2p4Clrqzpln3GXsG/v4UidK
         k1zMe7EffT8b7+fFi631q+rdy1epY53IPDT7gO6MfsqdligP0OZLgOyQv3Aj5fA6x2hk
         cJreigknk0lZYO9xCOXp3K4KK6xFBF7U+1lSDbK6WzQS//U3pgaJUojlxGhZ2LpNwtev
         QOpgQPtxovjEiSwKSn2nN71yqZrkuivUo9eklP+Xzi7HV1fHXerRWIY1W/Brr6OwOr0X
         pBq22mJwNAYM1JyFkU8F448UGNc3WcOVgOvnN+wGUd4OW3gxikp8NWOCss3MGAIGH0BF
         +4nA==
X-Gm-Message-State: AOAM533Mfqk9Sr/t+wSfu4lPLKUuY/RE1gLrD1sbUdRqeFG8kJNOgLJ8
        G2v86a2Wndh2J6XvNpJQjZv/VQ==
X-Google-Smtp-Source: ABdhPJwvhjb42g7FGahErDy7BbkM/Vo0fpcgW4EgznivAahJnVQA/d8Q+hv7py1rzJupdV9aJzzCYg==
X-Received: by 2002:a63:4761:: with SMTP id w33mr2284778pgk.118.1614333755035;
        Fri, 26 Feb 2021 02:02:35 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
        by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 02:02:34 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 12/15] media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
Date:   Fri, 26 Feb 2021 19:01:45 +0900
Message-Id: <20210226100148.1663389-13-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calling S_FMT or TRY_FMT on the OUTPUT queue should adjust the
resolution to the limits supported by the hardware. Until now this was
only done on the CAPTURE queue, which could make clients believe that
unsupported resolutions can be used when they set the coded size on the
OUTPUT queue.

In the case of the stateless decoder, the problem was even bigger since
subsequently calling G_FMT on the CAPTURE queue would result in the
unclamped resolution being returned, further inducing the client into
error.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 8bcff0b3626e..209ccf3d2d67 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -223,19 +223,19 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 
 	pix_fmt_mp->field = V4L2_FIELD_NONE;
 
+	pix_fmt_mp->width = clamp(pix_fmt_mp->width,
+				MTK_VDEC_MIN_W,
+				MTK_VDEC_MAX_W);
+	pix_fmt_mp->height = clamp(pix_fmt_mp->height,
+				MTK_VDEC_MIN_H,
+				MTK_VDEC_MAX_H);
+
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		pix_fmt_mp->num_planes = 1;
 		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		int tmp_w, tmp_h;
 
-		pix_fmt_mp->height = clamp(pix_fmt_mp->height,
-					MTK_VDEC_MIN_H,
-					MTK_VDEC_MAX_H);
-		pix_fmt_mp->width = clamp(pix_fmt_mp->width,
-					MTK_VDEC_MIN_W,
-					MTK_VDEC_MAX_W);
-
 		/*
 		 * Find next closer width align 64, heign align 64, size align
 		 * 64 rectangle
-- 
2.30.1.766.gb4fecdf3b7-goog

