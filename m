Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7548119A0B
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 22:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbfLJVtH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 16:49:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:56306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbfLJVIm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 16:08:42 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8846F24696;
        Tue, 10 Dec 2019 21:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576012121;
        bh=beiWJNS4QYxxYoJmAldP87bt8Aot7L9TlkcNwav9MAQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SYnlwgU9VabiFGf9wv7+WiLRgg17lWaqqqTCaTzIxhES+dQ8+pZr4tTlKLr570r3y
         dNOrXoltpOjQED5SXLMRzYd1elYMvrEVtOhsH2Ch/V46KG2MPj5VsYsraQOJ4xEetc
         c9cZZrLxo6kMgSetpdGF9BYKu8ypQaVcgKajwsLU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Benoit Parrot <bparrot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 092/350] media: ti-vpe: vpe: Make sure YUYV is set as default format
Date:   Tue, 10 Dec 2019 16:03:17 -0500
Message-Id: <20191210210735.9077-53-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Benoit Parrot <bparrot@ti.com>

[ Upstream commit e20b248051ca0f90d84b4d9378e4780bc31f16c6 ]

v4l2-compliance fails with this message:

   fail: v4l2-test-formats.cpp(672): \
	Video Capture Multiplanar: TRY_FMT(G_FMT) != G_FMT
   fail: v4l2-test-formats.cpp(672): \
	Video Output Multiplanar: TRY_FMT(G_FMT) != G_FMT
	...
   test VIDIOC_TRY_FMT: FAIL

The default pixel format was setup as pointing to a specific offset in
the vpe_formats table assuming it was pointing to the V4L2_PIX_FMT_YUYV
entry. This became false after the addition on the NV21 format (see
above commid-id)

So instead of hard-coding an offset which might change over time we need
to use a lookup helper instead so we know the default will always be what
we intended.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Fixes: 40cc823f7005 ("media: ti-vpe: Add support for NV21 format")
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/ti-vpe/vpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index e44299008a7b5..2b731c8f54593 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -2288,7 +2288,7 @@ static int vpe_open(struct file *file)
 	v4l2_ctrl_handler_setup(hdl);
 
 	s_q_data = &ctx->q_data[Q_DATA_SRC];
-	s_q_data->fmt = &vpe_formats[2];
+	s_q_data->fmt = __find_format(V4L2_PIX_FMT_YUYV);
 	s_q_data->width = 1920;
 	s_q_data->height = 1080;
 	s_q_data->nplanes = 1;
-- 
2.20.1

