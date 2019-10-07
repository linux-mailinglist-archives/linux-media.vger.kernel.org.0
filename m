Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8C1CE66D
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728598AbfJGPGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:06:52 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38142 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728533AbfJGPGw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:06:52 -0400
Received: by mail-lf1-f68.google.com with SMTP id u28so9527482lfc.5;
        Mon, 07 Oct 2019 08:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=emfiFOeFAAxgXit83uDIdAuAU1rO2ypqLYWuaCBBiAI=;
        b=RQGfBXiT4eZiil9ZQUX0fBf/QKSRccv5KTUgbVbjc2HIzN7can8Fovgc6pq7kKVnNy
         xI4yqiOavemoRY32GLuNMOWnp6NQIThNa6YqLPGtmv0TWISLV5VtvMKeNvCbamo0pPgU
         KUS0AvwyQOvsJ/L+eDR81hcg/7Rn/Oaf7DIcsoODWjphuTNWfQuKUJstNT3Nkr/PlOC/
         htBTGLqafTml6jCGzPQvA8GX+mntCYKlGBylNsWN6Xg41kSaA95d8trPbBiFxxGtYllM
         xZ3ynzMq4J8HdndcvOaFpaTylHJb9Mf0jtDGqpDdQYbOEfoT23eB2zy4S1j+ojQq2o39
         ErJw==
X-Gm-Message-State: APjAAAXYQ9HKfCtqb7LveWELAHIHuzgvXDZLLsyZuuuZfKngRVe9/x07
        R5Zrfue1VO538vk/pPlJrYA=
X-Google-Smtp-Source: APXvYqz+IJjl2HjzlrutbMg0+HcDbH5hZL+hMTpy7bS3Hnnh6LfE72wgQzIB9yjjE+RdZW1+6Zt71Q==
X-Received: by 2002:a05:6512:419:: with SMTP id u25mr16510375lfk.165.1570460810724;
        Mon, 07 Oct 2019 08:06:50 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id n2sm3145517ljj.30.2019.10.07.08.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 08:06:49 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v12 7/8] media: v4l2-ctrl: Add new helper v4l2_ctrl_ptr_create
Date:   Mon,  7 Oct 2019 17:06:35 +0200
Message-Id: <20191007150636.16458-8-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007150636.16458-1-ribalda@kernel.org>
References: <20191007150636.16458-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This helper function simplifies the code by not needing a union
v4l2_ctrl_ptr and an assignment every time we need to use
a ctrl_ptr.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 include/media/v4l2-ctrls.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 5331cf6c8517..d4e1b1902044 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -73,6 +73,18 @@ union v4l2_ctrl_ptr {
 	void *p;
 };
 
+/**
+ * v4l2_ctrl_ptr_create() - Helper function to return a v4l2_ctrl_ptr from a
+ * void pointer
+ * @ptr:	The void pointer
+ */
+static inline union v4l2_ctrl_ptr v4l2_ctrl_ptr_create(void *ptr)
+{
+	union v4l2_ctrl_ptr p = { .p = ptr };
+
+	return p;
+}
+
 /**
  * struct v4l2_ctrl_ops - The control operations that the driver has to provide.
  *
-- 
2.23.0

