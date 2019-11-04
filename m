Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E096EE0AB
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 14:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729006AbfKDNJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 08:09:40 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45007 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729090AbfKDNJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 08:09:40 -0500
Received: by mail-lf1-f68.google.com with SMTP id v4so12190788lfd.11;
        Mon, 04 Nov 2019 05:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xyLLjGx5ZrVCZEiXYSVVcb3hHEr+G7AeV53GCDjOTy0=;
        b=VVw+7A3kpVe+rJlt79+B39uTcMCEtRFb58bnYTmeLe30Xg8ihB8/SA64rAfC8um3Jk
         GZ74tf4oAQHYzSYf8vviHyeYxW8lfeJNeslVm2FBB+RYMu3vBfG3ZxVjKkFSqYgvG+fA
         WghaXvSOrXWPI1TsM3t3Z3mdQao3BaTsMi3qL26lYEM/uUq7iFKwKHNp99ocXb8xreFS
         3QHfWAnxnwo5djENUN6i66riusRWUe/2N01dwzK+ivXe/LEp3LjXeJ9ZTVQaT6SobC8a
         jLcjaYVmM8wVSnovtquUTPQlzm5nM1MB9wS1Xk8iyOthVtGRWG3NAnMXyhjvmszctCX4
         EcbA==
X-Gm-Message-State: APjAAAVlnzsbC5MCIKvzohwz8kX9ofBDgw8l8rdBcKOMhpo35Dn02EZb
        +50Xj52EHattt3ZRK2HTLpo=
X-Google-Smtp-Source: APXvYqwvoqeUb29ZDHdgJFMuRgN/S//zAH64o/UdmhfHQknXt8Um5U9YmzrpFsDcmP+LsBJHPTcqeA==
X-Received: by 2002:a19:746:: with SMTP id 67mr16747604lfh.42.1572872978354;
        Mon, 04 Nov 2019 05:09:38 -0800 (PST)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id q124sm985414ljq.93.2019.11.04.05.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 05:09:37 -0800 (PST)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v4 6/6] media: v4l2-ctrl: Use p_const when possible
Date:   Mon,  4 Nov 2019 14:09:23 +0100
Message-Id: <20191104130923.22184-6-ribalda@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191104130923.22184-1-ribalda@kernel.org>
References: <20191104130923.22184-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After adding a const pointer to ctrl_ptr, lets use it where it make
sense.

Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 73d99c3561ce..a565ae3ba7e4 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1556,7 +1556,8 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
 		if (ctrl->is_int)
 			return ptr1.p_s32[idx] == ptr2.p_s32[idx];
 		idx *= ctrl->elem_size;
-		return !memcmp(ptr1.p + idx, ptr2.p + idx, ctrl->elem_size);
+		return !memcmp(ptr1.p_const + idx, ptr2.p_const + idx,
+			       ctrl->elem_size);
 	}
 }
 
@@ -1566,8 +1567,8 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	void *p = ptr.p + idx * ctrl->elem_size;
 
-	if (ctrl->p_def.p)
-		memcpy(p, ctrl->p_def.p, ctrl->elem_size);
+	if (ctrl->p_def.p_const)
+		memcpy(p, ctrl->p_def.p_const, ctrl->elem_size);
 	else
 		memset(p, 0, ctrl->elem_size);
 
@@ -1954,7 +1955,7 @@ static int ptr_to_user(struct v4l2_ext_control *c,
 	u32 len;
 
 	if (ctrl->is_ptr && !ctrl->is_string)
-		return copy_to_user(c->ptr, ptr.p, c->size) ?
+		return copy_to_user(c->ptr, ptr.p_const, c->size) ?
 		       -EFAULT : 0;
 
 	switch (ctrl->type) {
@@ -2069,7 +2070,7 @@ static void ptr_to_ptr(struct v4l2_ctrl *ctrl,
 {
 	if (ctrl == NULL)
 		return;
-	memcpy(to.p, from.p, ctrl->elems * ctrl->elem_size);
+	memcpy(to.p, from.p_const, ctrl->elems * ctrl->elem_size);
 }
 
 /* Copy the new value to the current value. */
@@ -2587,7 +2588,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		 is_array)
 		sz_extra += 2 * tot_ctrl_size;
 
-	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p)
+	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
 		sz_extra += elem_size;
 
 	ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
@@ -2634,9 +2635,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		ctrl->p_cur.p = &ctrl->cur.val;
 	}
 
-	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p) {
+	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const) {
 		ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
-		memcpy(ctrl->p_def.p, p_def.p, elem_size);
+		memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
 	}
 
 	for (idx = 0; idx < elems; idx++) {
-- 
2.24.0.rc1

