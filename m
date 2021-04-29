Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AE036ECB4
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 16:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240708AbhD2OuP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 10:50:15 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35914 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240725AbhD2OuL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 10:50:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8C5561F43534
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v7 09/10] media: controls: Log MPEG-2 stateless control in .std_log
Date:   Thu, 29 Apr 2021 11:48:17 -0300
Message-Id: <20210429144818.67105-10-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210429144818.67105-1-ezequiel@collabora.com>
References: <20210429144818.67105-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simply print the type of the control.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 6a033102d31b..a693ff8dc3dc 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1873,6 +1873,15 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
 		pr_cont("HDR10_MASTERING_DISPLAY");
 		break;
+	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
+		pr_cont("MPEG2_QUANTISATION");
+		break;
+	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
+		pr_cont("MPEG2_SEQUENCE");
+		break;
+	case V4L2_CTRL_TYPE_MPEG2_PICTURE:
+		pr_cont("MPEG2_PICTURE");
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
-- 
2.30.0

