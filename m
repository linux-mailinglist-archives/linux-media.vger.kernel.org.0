Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6710373D6
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 14:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbfFFMLi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 08:11:38 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:51875 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727510AbfFFMLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 08:11:37 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YrExhzc7c3qlsYrF2hma9J; Thu, 06 Jun 2019 14:11:36 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 8/9] vicodec: stateless codecs do not have EOS and SOURCE_CHANGE events
Date:   Thu,  6 Jun 2019 14:11:30 +0200
Message-Id: <20190606121131.37110-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
References: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfF8IrJ5MbVPIR6gyWP7iAau3S6ZwUN5Ek0hxsRNg/O3trIAdxqRi0Nu4U0JbqlsDS30hoWrW+xtaYDDzGiHb5e1yZ4Lon6vV7IApIaa+FvVQ9ZwIkMIr
 WT8FFnl1NcYawcqA9n0SswVWRAWX3Ej/cf0fHkuRKIKpGPfFbenlfa2E6vbgrqqZIyfDltuH5b2mGSL6tlsjHnFfq8EHXNTs4WhdKjYKK0/+AXW/y05Q1qp1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Return an error when attempting to subscribe to those events
for a stateless codec.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/vicodec/vicodec-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index ce7f7bf1b998..91cd0c1dbede 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -1293,6 +1293,8 @@ static int vicodec_subscribe_event(struct v4l2_fh *fh,
 			return -EINVAL;
 		/* fall through */
 	case V4L2_EVENT_EOS:
+		if (ctx->is_stateless)
+			return -EINVAL;
 		return v4l2_event_subscribe(fh, sub, 0, NULL);
 	default:
 		return v4l2_ctrl_subscribe_event(fh, sub);
-- 
2.20.1

