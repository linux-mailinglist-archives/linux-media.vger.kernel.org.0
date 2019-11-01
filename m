Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF79EC1B4
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2019 12:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730408AbfKALYJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Nov 2019 07:24:09 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45912 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730400AbfKALYI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Nov 2019 07:24:08 -0400
Received: by mail-lf1-f67.google.com with SMTP id v8so6943483lfa.12;
        Fri, 01 Nov 2019 04:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GW+RiqAUvdeyf1VPnXKgJgDQjIa6mTVNLoSeIKSIaY4=;
        b=RUt/Xjxi5gOUV0fyzwyPbDBXjrZ+0SQ5l3wO9qE67sD+6ajkni0rRl1QIeZi3RWtkq
         H0TO2CJJSDwN0TfQL6ftgwQ9rpJh8Oxdba6DHgsmm5oSZ9rQwHku4YX3GCh2eL8g3Rgs
         W5ArZT2Lkc9Bh6b2OARf/XaAMmM7B3+eRwm+/xYJS1gAF9vkFUGVsDKMbtpM0rUOUvtw
         WOIACUbwjYrENY14eXri10NSNa9zls/Neh+IUcxQhhR5wF2FZABbbaq95RZQ740jpwAB
         9u/PgdgCwZOG3/Nc8War1Q9q4H0nvJQU/mspL9i+3wFVOvWR92SC9z9r4cDY8jNRSPrO
         buyQ==
X-Gm-Message-State: APjAAAVzHo13LUGiMYVK9XiRCTduZBsWM7zWhk47/yMZE44i0/wnO3m2
        heIcyneokDe3amhXxIUenTM=
X-Google-Smtp-Source: APXvYqyNzeAy5m2UIQEMKuFs4p+MsN6n3/TdythcE1kEt315jXzGuKwONXyg2qlxU1U4PEcErYff7A==
X-Received: by 2002:ac2:5144:: with SMTP id q4mr7215134lfd.36.1572607444411;
        Fri, 01 Nov 2019 04:24:04 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id v1sm2313691lji.89.2019.11.01.04.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:24:03 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v3 3/5] media: vivid: Add an area control
Date:   Fri,  1 Nov 2019 12:23:56 +0100
Message-Id: <20191101112358.29538-3-ribalda@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191101112358.29538-1-ribalda@kernel.org>
References: <20191101112358.29538-1-ribalda@kernel.org>
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
index b250fc3764e2..fd35863798a7 100644
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
+	.width = 0xcafe,
+	.height = 0xb1b1d,
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

