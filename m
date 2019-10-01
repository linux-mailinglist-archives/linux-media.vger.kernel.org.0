Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A80C3277
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 13:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732396AbfJALYt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 07:24:49 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43258 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732298AbfJALYk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 07:24:40 -0400
Received: by mail-lf1-f68.google.com with SMTP id u3so9563280lfl.10;
        Tue, 01 Oct 2019 04:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k/QNAeiB1uteASJ99iJIBlS83CywKDXvhSpbUiVCPnQ=;
        b=CtKYI3ZSH+tGpLHlY3DYT8yqdl7H+g7Fqf6dbeMSdtLT3qq9MWDTXcNBB0atyCzoy9
         q0gTmp0QO/I+KgX87ocq97v5+1N7wBgYvYsePpFH74BNrv9uphBOb/OEMg9zucVwi0Jd
         3eoNDZghUc8twJdjnCF5FrYCCDd/tbQrgq4Z2g/TDYFOaeYcIs/97pBi9ApDaxbElcHS
         xZu/oevVwtMKRWRPRC9vu4oC1s3RugZ15wZty074nZScv9ToeibQtedboMJojvN38f4v
         iTzA2XyzBd4asUZh2kXnWkTDB5F1wdSZ40/P2iAhjKaG6ODY9pjpOwJobwgXXsVaIZ7M
         b9Jg==
X-Gm-Message-State: APjAAAWdvVG0nDpo8qz9u4WWvay2UYoK/A+q0gdiS3aJsOo3zQFQ46pu
        vmcO5zabvo2X+h9IkDVu9Hs=
X-Google-Smtp-Source: APXvYqwp/KteKI5hiLXC1BfiX20hhffjdr+xZD9L09iHmlSZaJ4dNDFBLVH+DszLFFMkp7hOZn/E7Q==
X-Received: by 2002:ac2:4adb:: with SMTP id m27mr14475596lfp.1.1569929077345;
        Tue, 01 Oct 2019 04:24:37 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 3sm3853894ljs.20.2019.10.01.04.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 04:24:36 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v9 7/8] media: v4l2-ctrl: Add new helper v4l2_ctrl_ptr_create
Date:   Tue,  1 Oct 2019 13:24:20 +0200
Message-Id: <20191001112421.2778-8-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001112421.2778-1-ribalda@kernel.org>
References: <20191001112421.2778-1-ribalda@kernel.org>
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
index c42f164e2c9e..51d74fa7c7e2 100644
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
+	union v4l2_ctrl_ptr p = {.p = ptr};
+
+	return p;
+}
+
 /**
  * struct v4l2_ctrl_ops - The control operations that the driver has to provide.
  *
-- 
2.23.0

