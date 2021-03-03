Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B2832C7CB
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355688AbhCDAct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:49 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39034 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388028AbhCCU2U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 15:28:20 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6A45D1F46028
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 6/8] media: controls: Log VP8 stateless control in .std_log
Date:   Wed,  3 Mar 2021 17:27:12 -0300
Message-Id: <20210303202714.212394-7-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210303202714.212394-1-ezequiel@collabora.com>
References: <20210303202714.212394-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simply print the type of the control.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 1a683f4fa978..0fc7180a47e9 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1781,6 +1781,9 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_FWHT_PARAMS:
 		pr_cont("FWHT_PARAMS");
 		break;
+	case V4L2_CTRL_TYPE_VP8_FRAME:
+		pr_cont("VP8_FRAME");
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
-- 
2.30.0

