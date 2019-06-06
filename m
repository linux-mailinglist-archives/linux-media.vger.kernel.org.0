Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C903F373D4
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 14:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfFFMLh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 08:11:37 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:42951 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727124AbfFFMLg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 08:11:36 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YrExhzc7c3qlsYrF1hma8f; Thu, 06 Jun 2019 14:11:35 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/9] vicodec: fix initial stateless sizeimage value
Date:   Thu,  6 Jun 2019 14:11:25 +0200
Message-Id: <20190606121131.37110-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
References: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKtIBrnrPXSVio9cPUc5JB9Ftpx+rBkd7RzCHgtzXD4RR8L2gM0yjVm1hADwzWZIq1xQhT+YMm5f1T+FF5Q7+37T74jyOFE7XpMFoBufC39KsTR1Bhg5
 IK+7IuX4Zh+ohQFt3ocmRlKmO9rEpP/AgBcp4Dhylp/Gew64btiUQx6DpGUD4yr43DP3QMqE7VtOJEgZevDYMGMdFB0a9Rl/7jR5O6KHJWcSzDAfx6ViLdNC
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The initial sizeimage value was wrong for the stateless decoder.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/vicodec/vicodec-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index b23d57f50c94..7a7082808a23 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -1799,8 +1799,10 @@ static int vicodec_open(struct file *file)
 	raw_size = 1280 * 720 * info->sizeimage_mult / info->sizeimage_div;
 	comp_size = 1280 * 720 * pixfmt_fwht.sizeimage_mult /
 				 pixfmt_fwht.sizeimage_div;
-	if (ctx->is_enc || ctx->is_stateless)
+	if (ctx->is_enc)
 		ctx->q_data[V4L2_M2M_SRC].sizeimage = raw_size;
+	else if (ctx->is_stateless)
+		ctx->q_data[V4L2_M2M_SRC].sizeimage = comp_size;
 	else
 		ctx->q_data[V4L2_M2M_SRC].sizeimage =
 			comp_size + sizeof(struct fwht_cframe_hdr);
-- 
2.20.1

