Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC39AC1ED0
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 12:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730739AbfI3KTE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 06:19:04 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35468 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730694AbfI3KS4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 06:18:56 -0400
Received: by mail-lj1-f196.google.com with SMTP id m7so8852414lji.2;
        Mon, 30 Sep 2019 03:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u6PH07eWhP9yLzHtDWmI6SB0uTSpZSpElPRT+7mhohA=;
        b=CFDdOBG9XbQ5nZvmw0GinZmQD/aOP56uIdRhkb0d5rht1mwl4hchAhNUPrEr/YyTBi
         fP+OhQUhUagTxp0VHvkTE1VQD0Qovo/9Ay9bLvj1coNzkmRzwm0Qv+gYaX9cPGk270RW
         WtaJSiE4ZZbDSB15qIoJpm+bJCDFyNNXGuQMN/UU7gVtP4LFc2wZr0XgV4gQ23r9yJR2
         ztXUCzasth4GaQmlaj+tM+6bt49NChPDmQ5QtcOOG5IrH+U4ndQZ0M4yqQE9fo4wp5a4
         o3l6gzfehmcQY46M3ETuwCAAjoFrqQxUjiYAy/CbbTnA4Uju4OLlO9lj8LiOBrBeExnV
         TkTQ==
X-Gm-Message-State: APjAAAUYkS+VeMaX3T5hXrwltv7CxIF3VsDN1RFc1IsdcS5/tRRq6SM1
        PxiUf+0so9SXHcKRWpMYZU8=
X-Google-Smtp-Source: APXvYqy/J8Nltz74xeY945qkmg7xT8cKGfK1+u/0Y07eu0Zo3jTlJVYLUuRSJdb3JMWVBKuUEQ9feQ==
X-Received: by 2002:a2e:90d9:: with SMTP id o25mr7903132ljg.94.1569838733873;
        Mon, 30 Sep 2019 03:18:53 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z8sm3805970lfg.18.2019.09.30.03.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 03:18:52 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v8 7/8] media: v4l2-ctrl: Add new helper v4l2_ctrl_ptr_from_void
Date:   Mon, 30 Sep 2019 12:18:40 +0200
Message-Id: <20190930101841.19630-8-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930101841.19630-1-ribalda@kernel.org>
References: <20190930101841.19630-1-ribalda@kernel.org>
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
 include/media/v4l2-ctrls.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index c42f164e2c9e..d69cfdffd41d 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -73,6 +73,17 @@ union v4l2_ctrl_ptr {
 	void *p;
 };
 
+/**
+ * v4l2_ctrl_ptr() - Helper function to return a v4l2_ctrl_ptr from a
+ * void pointer
+ * @ptr:	The void pointer
+ */
+static inline union v4l2_ctrl_ptr v4l2_ctrl_ptr_from_void(void *ptr)
+{
+	BUILD_BUG_ON(sizeof(union v4l2_ctrl_ptr) != sizeof(void *));
+	return (union v4l2_ctrl_ptr) ptr;
+}
+
 /**
  * struct v4l2_ctrl_ops - The control operations that the driver has to provide.
  *
-- 
2.23.0

