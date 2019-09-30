Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 128BBC1EA3
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 12:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730605AbfI3KGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 06:06:48 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38227 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730485AbfI3KGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 06:06:47 -0400
Received: by mail-lj1-f193.google.com with SMTP id b20so8795211ljj.5;
        Mon, 30 Sep 2019 03:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mt9PJojqcUM4cqVHa79FQdY7MJpX4LpkJTQluT5lFmg=;
        b=dlvPJMv3ufK7dNUBgrYCIQ9lvRxWi0miO9Lsf4e4PMS0JyKspenBiS7qAMQwbXndx4
         uwCOSFvWBNGqLKVAaQ2ZhH4UsAKP7xmPFORlTNYOCR7CBq95MysTcQjBpvi60g4fYlDz
         10A9hSt3X5hp1qophdLTFGJGkh4LQJR+nFkpdYOE6gSzv5l31BbcRKsHIphhI8d4RlOc
         rcC+7XXNBTDpAVybrme3E0C3NFD/j0A+R433r2oT7/vDU4gqVKJfkD2XbZnC0kZY5qpf
         w35wcMJeA2MA++Nuj/Ci/Y0DyUOTPmBJDUTLMs3cp5ULoBMpeuY6VaxjetVeBjDyKVg8
         jp5A==
X-Gm-Message-State: APjAAAXyohygPK0Ic0GVgvofM0SJ+shNR+NeeT7UH92YaCy6OgcrV06t
        UONqfcQMSKXXtkkyUJ8daTk=
X-Google-Smtp-Source: APXvYqx8kYRfIeqLb+n4G9xETjEBllXw6uWSapy/kW5H9ck7P7s3SkYk1UPU1wy08xlI/sMcUDozEg==
X-Received: by 2002:a2e:654a:: with SMTP id z71mr11743727ljb.37.1569838003980;
        Mon, 30 Sep 2019 03:06:43 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z72sm3091580ljb.98.2019.09.30.03.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 03:06:42 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ricardo@ribalda.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda Delgado <ricardo@kernel.org>
Subject: [PATCH v7 2/8] Documentation: v4l2_ctrl_new_std_compound
Date:   Mon, 30 Sep 2019 12:06:30 +0200
Message-Id: <20190930100636.18318-3-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930100636.18318-1-ribalda@kernel.org>
References: <20190930100636.18318-1-ribalda@kernel.org>
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
Signed-off-by: Ricardo Ribalda Delgado <ricardo@kernel.org>
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

