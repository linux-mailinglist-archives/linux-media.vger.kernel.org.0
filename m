Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1B73E225F
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 06:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242702AbhHFEQR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 00:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhHFEQQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 00:16:16 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA36C061798
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 21:16:00 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id j13-20020a0cf30d0000b029032dd803a7edso5569522qvl.2
        for <linux-media@vger.kernel.org>; Thu, 05 Aug 2021 21:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=DhkoP3CndI6xOQyniDPb4V1Ek5PJMvMmCPk1Pl/SFdk=;
        b=uE4ntQ3e6/bd319jhZU2640yqFPUWgI9Z1oQV6U50RDeC8CGxXBq7QWAVZaWSkPUCY
         Z8MRdY6/n6QIl7KSfmwzK4yf51Iy8sXYxYqgHGS//Fhz4/Cyoj2WJSUbd4FsXMiyVSI1
         otDzL4yIQuLjaEDO5J6QHCbAEOihaTVaZe6QOpzKmSbsCo9KbB3JHbCiPpYqpovSLX+y
         pbcHEITB9K7/f/1vHV0w2D/7XdAYxMzK3KYP7+hxiZZuRogOhivHt9PRKHAIolD704nH
         0ScMhmeZF4OOr3qriS0+ytBI/fdZC0BXt2HAf2EZzWLFeH2x9dQp5VOPTxdYhrBVMhmT
         ecEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=DhkoP3CndI6xOQyniDPb4V1Ek5PJMvMmCPk1Pl/SFdk=;
        b=Z0W6usyn06yUFxeYnYm+tW6N6oej6GAj2L7BImj3Lvg27S/s2LXqFb8KrhttRZhjqH
         DFFYVpyop5nd2BcLZWhYY4VMpoWfO38zwcKFZvZ95VtPd+YiIbD5fSagZMnLgBiLLtYM
         rkBmFoDpu9PTjuRW74ckEbLS0wdxiqeZgfHVZ/hz5sxH6e/RpFM8nwtPP274i4eXiMf3
         wUj2XKe4FGiZwyA6Pzurg5G90WRapmCerk1QkTjkxXIbdEQmoYpSYAMmSScR+49afek9
         XwTJ3ifDP1X8eOqBO0oGAdFn64nrQIpcETKZ24GxL9FJnOIXgLMKO1kHsWJFNmFJbzDc
         /hVw==
X-Gm-Message-State: AOAM530FK/gQZNMZrq9RG5vsVrBklRHLkca0LTCU8BpF5U3jdQxdLXYz
        +isrZfLcoKBwSOxRNPt0agn/VqMxYj1P
X-Google-Smtp-Source: ABdhPJwDOZAFSB2KFl1TezoMeHIutNrC0Fy4BBTwqgurX8ctFKbAVKr3I5BgwGL0MmxhDupCCXCF9+RjcYUF
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:2a85:: with SMTP id
 jr5mr9022641qvb.5.1628223359525; Thu, 05 Aug 2021 21:15:59 -0700 (PDT)
Date:   Fri,  6 Aug 2021 12:15:18 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 02/14] media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com,
        acourbot@chromium.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        dafna.hirschfeld@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Courbot <acourbot@chromium.org>

Let's use the dedicated helpers to make sure we get the expected
behavior and remove redundant code.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
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
2.32.0.605.g8dce9f2422-goog

