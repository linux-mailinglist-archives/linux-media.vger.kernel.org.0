Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68F42A3D13
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 07:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgKCG57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 01:57:59 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:38858 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgKCG57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Nov 2020 01:57:59 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 02 Nov 2020 22:57:59 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Nov 2020 22:57:57 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 03 Nov 2020 12:27:50 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 207F0559F; Tue,  3 Nov 2020 12:27:49 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [RESEND PATCH] v4l2-ctrls: allow V4L2_CTRL_TYPE_BUTTON with request api
Date:   Tue,  3 Nov 2020 12:27:37 +0530
Message-Id: <1604386657-16495-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

remove check for V4L2_CTRL_TYPE_BUTTON from
v4l2_ctrl_request_clone and v4l2_ctrl_request_setup().

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index f320016..f6c4943 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -3391,9 +3391,6 @@ static int v4l2_ctrl_request_clone(struct v4l2_ctrl_handler *hdl,
 		/* Skip refs inherited from other devices */
 		if (ref->from_other_dev)
 			continue;
-		/* And buttons */
-		if (ctrl->type == V4L2_CTRL_TYPE_BUTTON)
-			continue;
 		err = handler_new_ref(hdl, ctrl, &new_ref, false, true);
 		if (err)
 			break;
@@ -4475,8 +4472,7 @@ int v4l2_ctrl_request_setup(struct media_request *req,
 		 * Skip if this control was already handled by a cluster.
 		 * Skip button controls and read-only controls.
 		 */
-		if (ref->req_done || ctrl->type == V4L2_CTRL_TYPE_BUTTON ||
-		    (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY))
+		if (ref->req_done || (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY))
 			continue;
 
 		v4l2_ctrl_lock(master);
-- 
1.9.1

