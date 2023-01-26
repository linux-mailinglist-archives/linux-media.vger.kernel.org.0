Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7384C67CF31
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 16:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbjAZPHE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 10:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjAZPHC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 10:07:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27ABF34303
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:07:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D58861886
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA4BC4339B;
        Thu, 26 Jan 2023 15:07:00 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH 01/17] media: visl: make visl_qops static
Date:   Thu, 26 Jan 2023 16:06:41 +0100
Message-Id: <20230126150657.367921-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This struct can be static. This fixes a sparse warning:

visl-video.c:690:22: warning: symbol 'visl_qops' was not declared. Should it be static?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/media/test-drivers/visl/visl-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/media/test-drivers/visl/visl-video.c
index b08664dfbe5f..7cac6a6456eb 100644
--- a/drivers/media/test-drivers/visl/visl-video.c
+++ b/drivers/media/test-drivers/visl/visl-video.c
@@ -687,7 +687,7 @@ static void visl_buf_request_complete(struct vb2_buffer *vb)
 	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
 }
 
-const struct vb2_ops visl_qops = {
+static const struct vb2_ops visl_qops = {
 	.queue_setup          = visl_queue_setup,
 	.buf_out_validate     = visl_buf_out_validate,
 	.buf_prepare          = visl_buf_prepare,
-- 
2.39.0

