Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A802F1A4544
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 12:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgDJKfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 06:35:11 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43188 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgDJKfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 06:35:11 -0400
Received: by mail-pl1-f196.google.com with SMTP id z6so540278plk.10;
        Fri, 10 Apr 2020 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=os03ga9iMHnxoeBIW2QNUc5cfGpv9mh6v9GueIcmG6U=;
        b=hIlL8gb0AJbI2Rzgjr9/x2AoTLWdtmCBDfgBLIZkQxfE/GeyCK4osF0+J49IqcX/W9
         9Yef5iti2pBgoYrl2vdvb3G4LdOGkF47Cm2V5VSpvc+xg/MWHi4ewjIoV+uQHKNGDWsu
         k7mM2E0Demkw2hmj2IAhKtQGXLJmJH6rW+uqGrsWuR+RI0UmRascgpI2hEoyCssYls3K
         VPVoZ9TahZi34igU/yyeS4Gzgapwb34lFjF+T4uPsXbZb37iZ7lpDBJXu+xZhWWs4PH2
         61lMD1JnIYpOmeS3QY8YK5nD/U2AlqJu+f8tvb3PNK2RGwzYmzi0hj9yTxFwrZRIDGQg
         fjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=os03ga9iMHnxoeBIW2QNUc5cfGpv9mh6v9GueIcmG6U=;
        b=tq6p6X5rKsQml9zI21Vzzb4hCQ2fWtikvXCaAwclYK/XvGWOofuoq/SzPaoRVV3Q8F
         QA9TJz1PzNLM+L8d7lxsfZl/3NHRDLqDO8Od0NuadC1SpAKK0triffumJs2IuarCXMXZ
         OX19wdpbQem+QXe7ONVUetHonjtFKUvfPiddgLgVc11GnKZ1pgpd6k83bc7IUiXp9bEs
         qY2BrUWJYlau+IC2dcOuRTKqez4D6leFHoqCT7Fxp7oESvmXt+8ahu8GoZ1n4PQOJLu4
         hWIzl/5NbjnHpJmU22s+GnMGNG07JfibIw5aIRv7xw6xNlaQ/dnDCmBnxNtc9sqINdpT
         CRRQ==
X-Gm-Message-State: AGi0Pua78A2oVs6+9R7nPb4HmkRpYbXSwEDpOpML4yRqEYOOliri8by0
        9u7xDmbN9UQcKjIBgJaC+Ls=
X-Google-Smtp-Source: APiQypKA2z82A0G3XtZKt3T9f7+30TiQUEILCtFaauYMqUVI8RlhlBBfCGfFrHc2k/ddo+YjgLsTbw==
X-Received: by 2002:a17:902:b283:: with SMTP id u3mr3941396plr.311.1586514910229;
        Fri, 10 Apr 2020 03:35:10 -0700 (PDT)
Received: from localhost.localdomain (181.56.30.125.dy.iij4u.or.jp. [125.30.56.181])
        by smtp.gmail.com with ESMTPSA id 198sm1454236pfa.87.2020.04.10.03.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 03:35:09 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [RFC][PATCH] media: v4l2-ctrls: add more NULL pointer checks
Date:   Fri, 10 Apr 2020 19:35:01 +0900
Message-Id: <20200410103501.1083-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A number of v4l2-ctrls functions gracefully handle NULL ctrl pointers,
for instance, v4l2_g_ctrl(), v4l2_ctrl_activate(), __v4l2_ctrl_grab()
to name a few. But not all of them. It is relatively easy to crash the
kernel with the NULL pointer dereference:

	# modprobe vivid node_types=0x60000
	$ v4l2-compliance

BUG: kernel NULL pointer dereference, address: 0000000000000020
PF: supervisor read access in kernel mode
PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] SMP PTI
RIP: 0010:v4l2_ctrl_s_ctrl.isra.0+0x4/0x30 [vivid]
Call Trace:
 vidioc_s_input.cold+0x1a8/0x38d [vivid]
 __video_do_ioctl+0x372/0x3a0 [videodev]
 ? v4l_enumstd+0x20/0x20 [videodev]
 ? v4l_enumstd+0x20/0x20 [videodev]
 video_usercopy+0x1cb/0x450 [videodev]
 v4l2_ioctl+0x3f/0x50 [videodev]
 ksys_ioctl+0x3f1/0x7e0
 ? vfs_write+0x1c4/0x1f0
 __x64_sys_ioctl+0x11/0x20
 do_syscall_64+0x49/0x2c0
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

vivid driver crashes the kernel in various places, for instance,

	v4l2_ctrl_modify_range(dev->brightness, ...);
or
	v4l2_ctrl_s_ctrl(dev->brightness, ...);

because ->brightness (and quite likely some more controls) is NULL.
While we may fix the vivid driver, it would be safer to fix core
API. This patch adds more NULL pointer checks to ctrl API.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 22 ++++++++++++++++-
 include/media/v4l2-ctrls.h           | 37 ++++++++++++++++++++++++++--
 2 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 93d33d1db4e8..02a60f67c2ee 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -2869,6 +2869,9 @@ EXPORT_SYMBOL(v4l2_ctrl_add_handler);
 
 bool v4l2_ctrl_radio_filter(const struct v4l2_ctrl *ctrl)
 {
+	if (WARN_ON(!ctrl))
+		return false;
+
 	if (V4L2_CTRL_ID2WHICH(ctrl->id) == V4L2_CTRL_CLASS_FM_TX)
 		return true;
 	if (V4L2_CTRL_ID2WHICH(ctrl->id) == V4L2_CTRL_CLASS_FM_RX)
@@ -3794,7 +3797,9 @@ s32 v4l2_ctrl_g_ctrl(struct v4l2_ctrl *ctrl)
 	struct v4l2_ext_control c;
 
 	/* It's a driver bug if this happens. */
-	WARN_ON(!ctrl->is_int);
+	if (WARN_ON(!ctrl || !ctrl->is_int))
+		return -EINVAL;
+
 	c.value = 0;
 	get_ctrl(ctrl, &c);
 	return c.value;
@@ -4212,6 +4217,9 @@ EXPORT_SYMBOL(v4l2_s_ctrl);
 
 int __v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val)
 {
+	if (!ctrl)
+		return -EINVAL;
+
 	lockdep_assert_held(ctrl->handler->lock);
 
 	/* It's a driver bug if this happens. */
@@ -4223,6 +4231,9 @@ EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl);
 
 int __v4l2_ctrl_s_ctrl_int64(struct v4l2_ctrl *ctrl, s64 val)
 {
+	if (!ctrl)
+		return -EINVAL;
+
 	lockdep_assert_held(ctrl->handler->lock);
 
 	/* It's a driver bug if this happens. */
@@ -4234,6 +4245,9 @@ EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_int64);
 
 int __v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
 {
+	if (!ctrl)
+		return -EINVAL;
+
 	lockdep_assert_held(ctrl->handler->lock);
 
 	/* It's a driver bug if this happens. */
@@ -4246,6 +4260,9 @@ EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_string);
 int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
 			    const struct v4l2_area *area)
 {
+	if (!ctrl)
+		return -EINVAL;
+
 	lockdep_assert_held(ctrl->handler->lock);
 
 	/* It's a driver bug if this happens. */
@@ -4447,6 +4464,9 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	bool range_changed = false;
 	int ret;
 
+	if (!ctrl)
+		return -EINVAL;
+
 	lockdep_assert_held(ctrl->handler->lock);
 
 	switch (ctrl->type) {
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 7db9e719a583..22d7ea500f96 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -755,6 +755,8 @@ int v4l2_ctrl_add_handler(struct v4l2_ctrl_handler *hdl,
  * transmitter class controls.
  *
  * This function is to be used with v4l2_ctrl_add_handler().
+ *
+ * Returns false if ctrl == NULL.
  */
 bool v4l2_ctrl_radio_filter(const struct v4l2_ctrl *ctrl);
 
@@ -884,7 +886,7 @@ static inline void v4l2_ctrl_grab(struct v4l2_ctrl *ctrl, bool grabbed)
  * @step value is interpreted as a menu_skip_mask.
  *
  * An error is returned if one of the range arguments is invalid for this
- * control type.
+ * control type. Returns -EINVAL if ctrl == NULL.
  *
  * The caller is responsible for acquiring the control handler mutex on behalf
  * of __v4l2_ctrl_modify_range().
@@ -906,7 +908,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
  * @step value is interpreted as a menu_skip_mask.
  *
  * An error is returned if one of the range arguments is invalid for this
- * control type.
+ * control type. Returns -EINVAL if ctrl == NULL.
  *
  * This function assumes that the control handler is not locked and will
  * take the lock itself.
@@ -916,6 +918,9 @@ static inline int v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 {
 	int rval;
 
+	if (!ctrl)
+		return -EINVAL;
+
 	v4l2_ctrl_lock(ctrl);
 	rval = __v4l2_ctrl_modify_range(ctrl, min, max, step, def);
 	v4l2_ctrl_unlock(ctrl);
@@ -982,6 +987,8 @@ const s64 *v4l2_ctrl_get_int_menu(u32 id, u32 *len);
  * used from within the &v4l2_ctrl_ops functions.
  *
  * This function is for integer type controls only.
+ *
+ * Returns -EINVAL if ctrl == NULL.
  */
 s32 v4l2_ctrl_g_ctrl(struct v4l2_ctrl *ctrl);
 
@@ -996,6 +1003,8 @@ s32 v4l2_ctrl_g_ctrl(struct v4l2_ctrl *ctrl);
  * allowing it to be used from within the &v4l2_ctrl_ops functions.
  *
  * This function is for integer type controls only.
+ *
+ * Returns -EINVAL is ctrl == NULL.
  */
 int __v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val);
 
@@ -1010,11 +1019,16 @@ int __v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val);
  * used from within the &v4l2_ctrl_ops functions.
  *
  * This function is for integer type controls only.
+ *
+ * Return -EINVAL is ctrl == NULL.
  */
 static inline int v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val)
 {
 	int rval;
 
+	if (!ctrl)
+		return -EINVAL;
+
 	v4l2_ctrl_lock(ctrl);
 	rval = __v4l2_ctrl_s_ctrl(ctrl, val);
 	v4l2_ctrl_unlock(ctrl);
@@ -1062,11 +1076,16 @@ int __v4l2_ctrl_s_ctrl_int64(struct v4l2_ctrl *ctrl, s64 val);
  * used from within the &v4l2_ctrl_ops functions.
  *
  * This function is for 64-bit integer type controls only.
+ *
+ * Returns -EINVAL if ctrl == NULL.
  */
 static inline int v4l2_ctrl_s_ctrl_int64(struct v4l2_ctrl *ctrl, s64 val)
 {
 	int rval;
 
+	if (!ctrl)
+		return -EINVAL;
+
 	v4l2_ctrl_lock(ctrl);
 	rval = __v4l2_ctrl_s_ctrl_int64(ctrl, val);
 	v4l2_ctrl_unlock(ctrl);
@@ -1085,6 +1104,8 @@ static inline int v4l2_ctrl_s_ctrl_int64(struct v4l2_ctrl *ctrl, s64 val)
  * allowing it to be used from within the &v4l2_ctrl_ops functions.
  *
  * This function is for string type controls only.
+ *
+ * Returns -EINVAL if ctrl == NULL.
  */
 int __v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s);
 
@@ -1100,11 +1121,16 @@ int __v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s);
  * used from within the &v4l2_ctrl_ops functions.
  *
  * This function is for string type controls only.
+ *
+ * Returns -EINVAL if ctrl == NULL.
  */
 static inline int v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
 {
 	int rval;
 
+	if (!ctrl)
+		return -EINVAL;
+
 	v4l2_ctrl_lock(ctrl);
 	rval = __v4l2_ctrl_s_ctrl_string(ctrl, s);
 	v4l2_ctrl_unlock(ctrl);
@@ -1123,6 +1149,8 @@ static inline int v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
  * allowing it to be used from within the &v4l2_ctrl_ops functions.
  *
  * This function is for area type controls only.
+ *
+ * Returns -EINVAL if ctrl == NULL.
  */
 int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
 			    const struct v4l2_area *area);
@@ -1139,12 +1167,17 @@ int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
  * used from within the &v4l2_ctrl_ops functions.
  *
  * This function is for area type controls only.
+ *
+ * Returns -EINVAL if ctrl == NULL.
  */
 static inline int v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
 					const struct v4l2_area *area)
 {
 	int rval;
 
+	if (!ctrl)
+		return -EINVAL;
+
 	v4l2_ctrl_lock(ctrl);
 	rval = __v4l2_ctrl_s_ctrl_area(ctrl, area);
 	v4l2_ctrl_unlock(ctrl);
-- 
2.26.0

