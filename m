Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50A313890D8
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 16:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347703AbhESOcD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 10:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347666AbhESOcC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 10:32:02 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBECC06175F
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:30:43 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id x18so5726748pfi.9
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R+qFAFfMoc0Yucgu6eUD8mX568+obmb19D6ELlcRmjM=;
        b=iR+E7LPFefwqCp1itb4p/NP06ls686VNt/KWEA8X2O02aXe8wy/Oe1MZ1x8deyZ6hN
         ogf0kcoaqIV+x3AQPvXw2xzAlj4yUk8fZ8/bafIlyhT5HI81p4B0sulvkmO1RHO4TQJU
         kn+P+N8ADTLtpTkrYBYBDUOgYwAXQRZw5ec2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R+qFAFfMoc0Yucgu6eUD8mX568+obmb19D6ELlcRmjM=;
        b=Bdisx2y/15uyxh5JDcn2pLWPeqmt+V8wSlFPjby3prlL20lCmOjvZIr7ZNgaRag+zf
         MuuAoBoLr/SUTkBGKWhSpDrGmmghPhHH9WCSe2wl2qt6k1CStomVOeF/mLXtJSsRKaCo
         8TSFRFMi8yUK/22urWvhcdwjSoC0RPg3RlXJrmf2M5X02iVk5ZLs1yZsB1j+jJ/Le6Us
         ikpmSkiOgdAmPisRLJUVtDEn7o6qGuMv8Pxef3VKnCbr5AAsjU5WwcUknayjEuJOBNWC
         5T6Knb7Dox6JKjFk7V4gK8DYnHvwR5cOIDoHxgBr9IO+Z/WmtOVtQz5Rr1yxbG+H8/Nf
         aChA==
X-Gm-Message-State: AOAM530EdOQVXhpFKcMb2gI4YawPecJgkPLtZzIWOeA87GHVhbv/wN37
        kEsRZQUJcytqxyVu840s2UtfWw==
X-Google-Smtp-Source: ABdhPJzE9m0ahz3wmyrv0dEBy0FOLET41SMlFMBOWhO5fu66APdGn1l+PQfBNwdSBI2gkwx01qJj1g==
X-Received: by 2002:a05:6a00:134b:b029:2bf:2c30:ebbd with SMTP id k11-20020a056a00134bb02902bf2c30ebbdmr11118765pfu.74.1621434642909;
        Wed, 19 May 2021 07:30:42 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:87ab:ff82:1544:697])
        by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:30:42 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v5 02/14] media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
Date:   Wed, 19 May 2021 23:29:59 +0900
Message-Id: <20210519143011.1175546-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210519143011.1175546-1-acourbot@chromium.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let's use the dedicated helpers to make sure we get the expected
behavior and remove redundant code.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 8df8bcfe5e9c..1a633b485a69 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -484,18 +484,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 static int vidioc_try_decoder_cmd(struct file *file, void *priv,
 				struct v4l2_decoder_cmd *cmd)
 {
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
+	return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
 }
 
 
-- 
2.31.1.751.gd2f1c929bd-goog

