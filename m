Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C90015CD3F
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 22:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387400AbgBMVaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 16:30:17 -0500
Received: from mail-pf1-f202.google.com ([209.85.210.202]:33432 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728673AbgBMVaQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 16:30:16 -0500
Received: by mail-pf1-f202.google.com with SMTP id c72so4516001pfc.0
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 13:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Zm5HmfQ08ScCng/zTBgIQ4r/Dsxq2SkuLGsGUlmZSkY=;
        b=FZy9rV7Klz9GDbl/2sdmUC/UJ/RAnihDFexPPquCcX7fA5myeQhOvB6yQbtB0DYzp8
         AHlnNLF6EHrPz+sdVv3oBVeJEE/PAosTHcZxnAOFF39O1ISUEyz4Bu5wHyGQyD3S+uyi
         Xec11iom33bDLtPhPCkzUgrbPooIQTdUE5E0+48ajYN1svFa7eX66g8+tdvllvLmCG8l
         RtBr0LKPOaY2xzET9klNKXlSJerTWzW4dunSlsqhSTzYLPx1WDhQNnw/cgkDSie6oN3c
         i06hiDP+jTigYs154mYeCq/yJK6n0w0H7S+QxdocB+QGVn69vSYW5Dj53FNUykILtAK+
         6/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Zm5HmfQ08ScCng/zTBgIQ4r/Dsxq2SkuLGsGUlmZSkY=;
        b=QyYpwCS3udl7b/UVV8G5oplxywkzXWkBvVMNCnMcwo54DD6dmoZ2sJf+rZqrz1Y4XT
         zwvJRWfQwf/5xN57TjXaec5zYspZzW1Q6U5p2VxLK7Q5UOzSJNQO2zoghrbPip6hhYAq
         VkkQaCx5fgcepBYGtSXjGzSnRup9YABch+ZV8Z8v65wsvDCtryULNpBWMqOYCYYNm7rQ
         LJgA7Z91L3pYY1BO4K5szFBR7yAZlA87XIXdSuOTVl2jFUQUGsjzGYYKXv7A3ajG4SoG
         t21YgKCR6UEv7gw+d19WfDR0RWJcJ979ew6n6eI+hRlwfV9BHUznYeAgUWe+oWpVcRPn
         2Avg==
X-Gm-Message-State: APjAAAVgtYmxQ1u07fUZZ3FKiyfIh6+sWxB4Kx1iNYOfPX+I5iQFxT6B
        XZaciMjcPe5NeGHgKf8/1wVaw1ELoGVQE0GQFaFTCRwJUzkf7zjhGbNOzqBNTh5RCdwXCRTusw6
        DY5hdOcfQcK+7joaqk3X3soTKR6rKIvKmHE0iesTbK+tFS1WAxD6NZzxSgYFugEjf2uJpyDdILb
        T8bQ==
X-Google-Smtp-Source: APXvYqxrnq4hOQ9yBYQtQJnm2++rP8XeKrGAyPFqtvw14576pDXWbHeTVzEyW97kxq423Tf9eiilGCGhoMx0u0yE
X-Received: by 2002:a63:2309:: with SMTP id j9mr20056541pgj.54.1581629413468;
 Thu, 13 Feb 2020 13:30:13 -0800 (PST)
Date:   Thu, 13 Feb 2020 13:30:07 -0800
Message-Id: <20200213213007.17023-1-jkardatzke@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH] media: venus: support frame rate control
From:   Jeffrey Kardatzke <jkardatzke@google.com>
To:     linux-media@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "Mauro Carvalho Chehab )" <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Kardatzke <jkardatzke@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Frame rate control is always enabled in this driver, so make it silently
support the V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE.

Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
---
 drivers/media/platform/qcom/venus/venc_ctrls.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 877c0b3299e9..9ede692f77c5 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -199,6 +199,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		mutex_unlock(&inst->lock);
 		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+		// Silently ignore, it's always enabled.
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -351,6 +354,9 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME, 0, 0, 0, 0);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE, 0, 1, 1, 1);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.25.0.225.g125e21ebc7-goog

