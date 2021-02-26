Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A4F3260E3
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 11:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhBZKGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 05:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbhBZKEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 05:04:06 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF0FC061225
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:29 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id l2so5940961pgb.1
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PcG87Nkjt5QbBleG5vxtSUtdpzRi3L5C7FtYOK30lrA=;
        b=lMSZtP4FYUD2nm5CZRVJ0sR/tBAIEYwJOxYXgHQTg2i50hELRMDTRTTOtz4/f6eJGJ
         XVeR7HrUDD2BpEPi+04FudIInSA3snmvscXcv73gUJlpqj4SA8a+k4qPP/UMnDnzKtt2
         CL5rFK4SCUHmDm5HFws2yHW8poG9bz1W5NpIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PcG87Nkjt5QbBleG5vxtSUtdpzRi3L5C7FtYOK30lrA=;
        b=VoBJnDs5o4NIV+P9GGUGZxk/7woywuBZVxlMECTHGsncgL4mhcGPSqvtpOXBroUQF8
         Y0W84dijuz8OZjCJEz5IKNcdJDIf+JWLtFAZaWW8lyOxWfxjPJjlxuyN5GcQZjVEDXHS
         wAdWvobS2HJlE1knbi97cB9GLHuANmwAouEC6PH9Ux7RZMAMYI962bmYx0xbJnPNRihp
         y7D0rukkSYake+p72k4G3C3EsuuyInTlDz3UxCpsnXCgbT+Jtuq+9BaA/QRfYWVe4+AD
         +LZCaWiF1i3P8r+pA1Uh/Jdp0JSLeTtIvtKsPu0j40r1EaKPE0595Pj+52kC2ds5n6Rg
         LRcg==
X-Gm-Message-State: AOAM533YV9xt9UKBYRXZvHv/71Z57FwpCsO+BW7HI1KSfWXZxI///bfR
        u4HhZB1hzKVb525yrqIs6325ZA==
X-Google-Smtp-Source: ABdhPJxOVnAMqf31FI6FHypB/fD4gWwwatIP/m8f0M7R/TSznMR+445vQprjiAla28YWfDTWQziEjA==
X-Received: by 2002:aa7:9a09:0:b029:1ed:9919:b989 with SMTP id w9-20020aa79a090000b02901ed9919b989mr2699134pfj.20.1614333749259;
        Fri, 26 Feb 2021 02:02:29 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
        by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 02:02:28 -0800 (PST)
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
Subject: [PATCH v3 10/15] media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
Date:   Fri, 26 Feb 2021 19:01:43 +0900
Message-Id: <20210226100148.1663389-11-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
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
index c286cc0f239f..8bcff0b3626e 100644
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
2.30.1.766.gb4fecdf3b7-goog

