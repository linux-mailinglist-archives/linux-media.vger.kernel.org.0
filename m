Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E126CE099
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 13:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbfJGLfT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 07:35:19 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39150 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbfJGLfS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 07:35:18 -0400
Received: by mail-lj1-f195.google.com with SMTP id y3so13246559ljj.6;
        Mon, 07 Oct 2019 04:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5A36dry6P/XdWhWibfmP9iwvjj4WogIUlnkb+TsrNII=;
        b=FwNoEqIw/r2Nr4gGC7gfGAcXXie9FPQ7oa//R1wTWj56g3CbBPZo7HnBRmfkOwYwOT
         Ljrd2s1hYwqKHqTIhXwfCo7+pFetQqMJatSDUTwBWKLzixpO42ANkHwc9y8MBFg9KbF/
         54hJ+zWodDuGxQ1bczBPOHYqM69f5zQbADd3rjW09Tt3pbduCCfNbzmpp15aF34GAmAf
         CnjsUqZWBTp3nJwKaiXIiRnWunjDVHGQWbwmFy9gswCBpYK++aMgVbSy/RWFv4Tm62S0
         fIfVxRkbxfeNOdHCoq1G9gTt9AF+Kg3HO2l+GrSPiG+POrgLBmudoKjXN3lp6I6/J7n0
         4yRQ==
X-Gm-Message-State: APjAAAV204tkcnpQIQKvqwxD/jKJckJtRe30PGkSBGkYiG7K61OdH0sl
        eUQJYiNKfYxkW9z7tnxoVvI=
X-Google-Smtp-Source: APXvYqy26ApRN+6kygYoXsM9KJd/z4ze7tUjYgazXxqNEql/N97IuAAEZfr73kLG61uP1Wb0iVBz2A==
X-Received: by 2002:a2e:9753:: with SMTP id f19mr18040020ljj.197.1570448115457;
        Mon, 07 Oct 2019 04:35:15 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id b25sm3666047ljj.36.2019.10.07.04.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 04:35:14 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v10 7/8] media: v4l2-ctrl: Add new helper v4l2_ctrl_ptr_create
Date:   Mon,  7 Oct 2019 13:35:01 +0200
Message-Id: <20191007113502.11746-8-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007113502.11746-1-ribalda@kernel.org>
References: <20191007113502.11746-1-ribalda@kernel.org>
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
index c42f164e2c9e..0bfedd3d70a6 100644
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

