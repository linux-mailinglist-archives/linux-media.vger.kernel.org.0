Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 783EC9AFB7
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 14:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394796AbfHWMhx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:37:53 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45061 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394781AbfHWMhu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:37:50 -0400
Received: by mail-ed1-f65.google.com with SMTP id x19so13207378eda.12;
        Fri, 23 Aug 2019 05:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y8r+eWz5qGFdQwglnaA6qcRMWI4/EQdR6uEwrrJmWAw=;
        b=e2iVUzBrbD9sy43NjXtSAobf5oGbPlneBZCuR004OSDfnKCYF8uLhUXi9qbVf1VX5G
         oKWrNeW3WzjmQvTB5A6KMtkr799v/mHjZaf/HLtS06JJoxaAEQSrULHWKoe8MqCLTTrx
         2QAFQSmJ+XvXHJLSyYXX76KhdgEbSnRzhQY2oi+rvxLtT1ZN6WOMt3Uie0E/Y3tQhC3F
         9xr0BemQoidWVAad4jnGg7iPF3Wfm3H5H6uOMUrmnTPXuzvCJfuTxWLhIpa8pfMJR7rS
         3q3/3VugfA80bT6wxGI40U0RSk1fuxa2n8OeDQgB4NzC9rNZaSh/m4t6PydnHtnyHtFZ
         EcNA==
X-Gm-Message-State: APjAAAW82vijAybontW6tl6499qkMhuUMCPkIq0Tin3Vq5249+kbxCu1
        6iq6EU9xjupMofCjKceh48HpB8LLel0=
X-Google-Smtp-Source: APXvYqxx5IN+ml83ka93/qGxNp8Om+mK7ycCRdrY6L9j4x6/UdpYjbgAmMheycYvYWbdXvk5ggMacQ==
X-Received: by 2002:a50:f4c3:: with SMTP id v3mr4155153edm.115.1566563868453;
        Fri, 23 Aug 2019 05:37:48 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 9sm389687ejw.63.2019.08.23.05.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 05:37:47 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v3 6/7] Documentation: Document v4l2_ctrl_new area
Date:   Fri, 23 Aug 2019 14:37:36 +0200
Message-Id: <20190823123737.7774-6-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190823123737.7774-1-ribalda@kernel.org>
References: <20190823123737.7774-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Helper for creating area controls.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 Documentation/media/kapi/v4l2-controls.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/media/kapi/v4l2-controls.rst b/Documentation/media/kapi/v4l2-controls.rst
index ebe2a55908be..656e9428f6a6 100644
--- a/Documentation/media/kapi/v4l2-controls.rst
+++ b/Documentation/media/kapi/v4l2-controls.rst
@@ -149,6 +149,15 @@ Integer menu controls with a driver specific menu can be added by calling
 			const struct v4l2_ctrl_ops *ops,
 			u32 id, s32 max, s32 def, const s64 *qmenu_int);
 
+Area controls can be added by calling
+:c:func:`v4l2_ctrl_new_area`:
+
+.. code-block:: c
+
+	struct v4l2_ctrl *v4l2_ctrl_new_area(struct v4l2_ctrl_handler *hdl,
+			const struct v4l2_ctrl_ops *ops,
+			u32 id, const struct v4l2_area *area);
+
 These functions are typically called right after the
 :c:func:`v4l2_ctrl_handler_init`:
 
-- 
2.23.0.rc1

