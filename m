Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28BD536C4D6
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 13:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236039AbhD0LQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 07:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235428AbhD0LQs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 07:16:48 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9F5C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 04:16:04 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id y62so8494004pfg.4
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 04:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qDhPIhfqI4Pq+xMHlyEIR9SMexQlN4dYaagLiPYwmXw=;
        b=oCxdPjDxqgobH5jkDDoNia3CKUV62rbY0dfh44gq35HsSMuaWJlr7F7TsvdG5aln89
         uH1/2zlA2BbYG7ca2eTjKcf+Zgx+Jsi1QXv4yKGn5lIrSXaVvO67wQ3TlvbBUdngMyaR
         vrJ0MO5ui2qHu/dLUbKRXQtfcWpYoxmDpPKBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qDhPIhfqI4Pq+xMHlyEIR9SMexQlN4dYaagLiPYwmXw=;
        b=QCjMjWwnz0sUtxsSJt8T/ZZopxPpWySRSGjw38LoRze9EuF7KGAM47I4vHRp+r+5yh
         8p/+ygmHOKY6+yNwgNyriX8VzLJeiEI7zNwMCGXjK8jGKWw3FHAFe1O+6hGg7K59qhhV
         FRgTI7gRsk3KWHMAjoaCHGRXcbNSQ0WONN63LcT+3sB+LoprFj+pS6EkxGX9x3AzMMgf
         oc5+VjZTTswdVzmD4I+7vKU/8H0VWsfiSHgGVW5nRAmbsosJBPP4cHyzWnL6rx4RWVxM
         fbsdljWuJdyVbwrJpDDfDXEBzzubJidrHeQrv1bv/i6/5eSa6rAF03zOkLD5y/5NucCA
         rNcw==
X-Gm-Message-State: AOAM531D+mUSnmWTVj0x11eD/DMaCuvtzmmmchA1ALdX60wuInvNKfHg
        +kDmz8JnrgmM0PyOK4g0nqB8VA==
X-Google-Smtp-Source: ABdhPJxqw98nbi47JE/oWyswUWPhOTXxfI7Or9Fl7giJxqzcHMD94e1TOTYdUKyFM6zwAZpP78OejQ==
X-Received: by 2002:a63:e347:: with SMTP id o7mr4815571pgj.184.1619522164479;
        Tue, 27 Apr 2021 04:16:04 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:b182:d363:32d0:53a2])
        by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 04:16:04 -0700 (PDT)
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
Subject: [PATCH v4 10/15] media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
Date:   Tue, 27 Apr 2021 20:15:21 +0900
Message-Id: <20210427111526.1772293-11-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let's use the dedicated helpers to make sure we get the expected
behavior on stateful decoders as well.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.c   | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 01c5333d6cff..4ef4b68ec9bd 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -52,22 +52,10 @@ static int vidioc_try_decoder_cmd(struct file *file, void *priv,
 	if (ctx->dev->vdec_pdata->uses_stateless_api)
 		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
 								cmd);
-
-	switch (cmd->cmd) {
-	case V4L2_DEC_CMD_STOP:
-	case V4L2_DEC_CMD_START:
-		if (cmd->flags != 0) {
-			mtk_v4l2_err("cmd->flags=%u", cmd->flags);
-			return -EINVAL;
-		}
-		break;
-	default:
-		return -EINVAL;
-	}
-	return 0;
+	else
+		return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
 }
 
-
 static int vidioc_decoder_cmd(struct file *file, void *priv,
 				struct v4l2_decoder_cmd *cmd)
 {
-- 
2.31.1.498.g6c1eba8ee3d-goog

