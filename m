Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA9F2E54E
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 21:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfE2T25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 15:28:57 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54740 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfE2T25 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 15:28:57 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3784826CFA4
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 1/2] media: v4l2-ctrl: Initialize _BUTTON and _CTRL_CLASS
Date:   Wed, 29 May 2019 16:28:10 -0300
Message-Id: <20190529192811.13986-1-ezequiel@collabora.com>
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
 drivers/media/v4l2-core/v4l2-ctrls.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 1870cecad9ae..c7d5fdb8efb4 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1530,6 +1530,8 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_MENU:
 	case V4L2_CTRL_TYPE_BITMASK:
 	case V4L2_CTRL_TYPE_BOOLEAN:
+	case V4L2_CTRL_TYPE_BUTTON:
+	case V4L2_CTRL_TYPE_CTRL_CLASS:
 		ptr.p_s32[idx] = ctrl->default_value;
 		break;
 	case V4L2_CTRL_TYPE_U8:
-- 
2.20.1

