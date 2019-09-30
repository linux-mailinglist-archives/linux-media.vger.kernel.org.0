Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8552C1EC8
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 12:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730639AbfI3KSu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 06:18:50 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46726 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbfI3KSt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 06:18:49 -0400
Received: by mail-lf1-f68.google.com with SMTP id t8so6536327lfc.13;
        Mon, 30 Sep 2019 03:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m6p9TCl1q4PmCyDnNVWS8vM5CeKoKD3/SoQWgI0Yo4g=;
        b=nJyncTDlS/QuW6xLRLivkXU8x0Ksk4oW7iq5EXLkGSbFd1mzrxAQkYlsOnqV35HQSW
         Jx9NSCnPsF5xOP+fs7nnj5FwYQ4Ee+VSk77c7KIn054FbysRgx0OCUdx4J4Xcvu5JiTv
         b0uRpWfF8/7f9s11ws2EVtt1D3gbl89q8RmJQ3vOc/GZdWU2bndQ10GjaVAosJqvmBh7
         JtF07Yi47/lKDW440u14t0eol0Y3BINvXxuafIuBoMAFm5hZCT979MYRImwcAcKeAojl
         X+BvUIdNRK0dDvjVKd6ZC6dWtFSf7O+roM6d6rA6QA5eiiUBlFWozGBK7Q+AMez1QOPK
         NuCg==
X-Gm-Message-State: APjAAAXoA704ZCQji0m/D6W55f5msqKu4ZY1Nt6eQy8hFc8wXhP0DQt8
        TjKVg6DoFR6sf3+iRvKrR7I=
X-Google-Smtp-Source: APXvYqyv6Q4FkbNx6MnMI5ldyOQYnSsEReNHMEHxoxNmMXVkbhcHpJmL3qkicqhJHUA/n7J66JcX6Q==
X-Received: by 2002:a19:c191:: with SMTP id r139mr4244803lff.23.1569838727428;
        Mon, 30 Sep 2019 03:18:47 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z8sm3805970lfg.18.2019.09.30.03.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 03:18:46 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ricardo@ribalda.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v8 2/8] Documentation: v4l2_ctrl_new_std_compound
Date:   Mon, 30 Sep 2019 12:18:35 +0200
Message-Id: <20190930101841.19630-3-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930101841.19630-1-ribalda@kernel.org>
References: <20190930101841.19630-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ricardo Ribalda Delgado <ricardo@ribalda.com>

Function for initializing compound controls with a default value.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 Documentation/media/kapi/v4l2-controls.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/media/kapi/v4l2-controls.rst b/Documentation/media/kapi/v4l2-controls.rst
index ebe2a55908be..b20800cae3f2 100644
--- a/Documentation/media/kapi/v4l2-controls.rst
+++ b/Documentation/media/kapi/v4l2-controls.rst
@@ -140,6 +140,15 @@ Menu controls with a driver specific menu are added by calling
                        const struct v4l2_ctrl_ops *ops, u32 id, s32 max,
                        s32 skip_mask, s32 def, const char * const *qmenu);
 
+Standard compound controls can be added by calling
+:c:func:`v4l2_ctrl_new_std_compound`:
+
+.. code-block:: c
+
+       struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
+                       const struct v4l2_ctrl_ops *ops, u32 id,
+                       const union v4l2_ctrl_ptr p_def);
+
 Integer menu controls with a driver specific menu can be added by calling
 :c:func:`v4l2_ctrl_new_int_menu`:
 
-- 
2.23.0

