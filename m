Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 244E43793F
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 18:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729538AbfFFQNm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 12:13:42 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59230 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729502AbfFFQNm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 12:13:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5C5FA282418
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 1/2] media: v4l2-ctrl: Initialize _BUTTON and _CTRL_CLASS
Date:   Thu,  6 Jun 2019 13:12:53 -0300
Message-Id: <20190606161254.17311-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These two control types don't really need a default value,
as they are not expected to carry any value.

However, it's slightly clearer to initialize them explicitly
instead of falling back to the switch default.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes from v2:
* Initialize the controls to zero, instead of default.

Changes from v1:
* No change.
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 1870cecad9ae..92a5521f6813 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1532,6 +1532,10 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		ptr.p_s32[idx] = ctrl->default_value;
 		break;
+	case V4L2_CTRL_TYPE_BUTTON:
+	case V4L2_CTRL_TYPE_CTRL_CLASS:
+		ptr.p_s32[idx] = 0;
+		break;
 	case V4L2_CTRL_TYPE_U8:
 		ptr.p_u8[idx] = ctrl->default_value;
 		break;
-- 
2.20.1

