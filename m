Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B36EE0A6
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 14:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbfKDNJf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 08:09:35 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36245 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729090AbfKDNJe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 08:09:34 -0500
Received: by mail-lf1-f67.google.com with SMTP id a6so8794970lfo.3;
        Mon, 04 Nov 2019 05:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D+ffK2Zkjlt7h/8BLS2fe/6Xm65ngdwZAR8g1pMusNs=;
        b=S9ae7lFpIdpFW6KBKJ1OAK2M7JrCNDt7cIl+mQnZ0CmR2u1YoJCsk0WB1JA9CUvHnm
         CeSvR0c8h4+SjuuUYniuQfY55wb740n3vQj1Ho/oeVYfEZ6FR6MjhCJzNH2zZ+PMZHqQ
         YGJjZZzVqeC9thZ/LoK8Hd1Sz7JLBB9WYacaM6qwHGX7+jF+hzcZeHw+HNEVhlAu3pSv
         J3ad1aTG+BuqkXafP6ACMfMRQNdl50dZMRZTkQkNx/vrdMSMR7u7XdfviqLWhOqkXfbD
         lBQoZoSlSnv2qWX7UjvjsJ34UipCzZURo608SjkJmOPjYIbPcdaD9yp3wr/7HJ9rzJKh
         hnJg==
X-Gm-Message-State: APjAAAUYww7oY19Mj+bfVLlxZTsSuLfFOqErEceGMBSmaQAZkjqPxCMv
        kfQ/h84++Sbw/0HbrOFXsuk=
X-Google-Smtp-Source: APXvYqwAPna3HlCtgfd+U1N3gbBMdK0foxIWoaCXbVaah9Ui2/Nu1dGdcFLg4ascmDU4/ORvXPfkKw==
X-Received: by 2002:a19:d7:: with SMTP id 206mr16680328lfa.22.1572872972409;
        Mon, 04 Nov 2019 05:09:32 -0800 (PST)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id q124sm985414ljq.93.2019.11.04.05.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 05:09:31 -0800 (PST)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v4 3/6] media: vivid: Add an area control
Date:   Mon,  4 Nov 2019 14:09:20 +0100
Message-Id: <20191104130923.22184-3-ribalda@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191104130923.22184-1-ribalda@kernel.org>
References: <20191104130923.22184-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This control represents a generic read/write area.

Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 drivers/media/platform/vivid/vivid-ctrls.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index b250fc3764e2..68e8124c7973 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -32,6 +32,7 @@
 #define VIVID_CID_U32_ARRAY		(VIVID_CID_CUSTOM_BASE + 8)
 #define VIVID_CID_U16_MATRIX		(VIVID_CID_CUSTOM_BASE + 9)
 #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
+#define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -266,6 +267,18 @@ static const struct v4l2_ctrl_config vivid_ctrl_disconnect = {
 	.type = V4L2_CTRL_TYPE_BUTTON,
 };
 
+static const struct v4l2_area area = {
+	.width = 1000,
+	.height = 2000,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_area = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_AREA,
+	.name = "Area",
+	.type = V4L2_CTRL_TYPE_AREA,
+	.p_def.p_const = &area,
+};
 
 /* Framebuffer Controls */
 
@@ -1574,6 +1587,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->string = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_string, NULL);
 	dev->bitmask = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_bitmask, NULL);
 	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
-- 
2.24.0.rc1

