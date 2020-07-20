Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354C52260D5
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 15:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgGTNYT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 09:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbgGTNYT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 09:24:19 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240AEC0619D4
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 06:24:19 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u25so9705392lfm.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PCNLmGR8sMtBYV74iVoiny++gKyFU6QKve9J6ft8KaU=;
        b=YLYbNeJbyBIaAQ8rb/3znbvrfWAkG4bvqP1j/gNRpW2GRjAqCS3c57lHyprI9vcUVy
         CFYb6/y0MWLSE9CSw6JnkGdtlKiGuenOa6djBdXOcXB5EZe4wJ/G7oXvQ7cCPaNamTef
         cnXYLGAHpAjq/bOaUfi4sP9VWdQu3vzn/aG6Fjt2+/ybVS/Cf4NRtH/7inpbltWwLXvx
         9M9lYOOvRcrBJ++S/+qt8xMlSOTOCTGXb83x40QVyzfzokshHKrV6DUZODmIrA9GXWim
         bMophe4N3uJwQBu0Sr/9uv2THyxTHEDF5bsZ6Dd3yM9YBKQwikBqCqYtNwc9pWARjKHq
         vGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PCNLmGR8sMtBYV74iVoiny++gKyFU6QKve9J6ft8KaU=;
        b=NbZvz89PMvSJF7wXUl3x3LfE77n/DICids1AoztyVXNYIvgpC2sFEVvasrgI+HlEwn
         6ikJqQpMafCRMyyIcJhgDwiuDiiy/z9LnQP6cGUjx1Ki/I5fO4RHTNPhqef7KHUpnHfk
         iv0C8dJE4NFVM9RNUTEqTE9WZYGxPIuE4Kq88cUfHlnpGw7Cx2byD32s5nVPITiV8q0C
         KL/i/5YM0PeUhwDS/Fk8QorDmRJOvmxKPvFHi7gQROkQeotJX5MlF0mliq9OrSbLEhgW
         lY7kbUckY3ao6JOT6gEIjbwz0yTB4AXUNEbv+JYiCxhRSusJeJoxZ5aS0gijPsvhmOGL
         dmnQ==
X-Gm-Message-State: AOAM530Ai2oSAI/jS2G5rNH8Hbgoev3BgXFkUVKtR3vCH2AXxdVB5mMk
        glFWDGpNzA/q58xVAdwJAQTFNOiBg1s=
X-Google-Smtp-Source: ABdhPJytG2Zgu+Ki97e5vuTKx8cSPSuv8MmaZXlz3NwLFdPuLR5QOLyNERbVvYpBHWPXrKtnKiUjVg==
X-Received: by 2002:a19:f80e:: with SMTP id a14mr811645lff.49.1595251457123;
        Mon, 20 Jul 2020 06:24:17 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id h6sm867829lfc.84.2020.07.20.06.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 06:24:16 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 5/6] media: s5p-mfc: Use standard frame skip mode control
Date:   Mon, 20 Jul 2020 16:23:12 +0300
Message-Id: <20200720132313.4810-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
References: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the standard menu control for frame skip mode in the MFC
driver. The legacy private menu control is kept for backward
compatibility.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
index 912fe0c5ab18..3092eb6777a5 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
@@ -261,6 +261,11 @@ static struct mfc_control controls[] = {
 		.menu_skip_mask = 0,
 		.default_value = V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED,
 	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE,
+		.maximum = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+		.default_value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+	},
 	{
 		.id = V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
@@ -1849,6 +1854,7 @@ static int s5p_mfc_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 		p->seq_hdr_mode = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE:
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
 		p->frame_skip_mode = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT:
-- 
2.17.1

