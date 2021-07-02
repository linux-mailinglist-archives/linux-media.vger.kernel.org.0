Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39B1C3B9AA2
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 04:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234694AbhGBCER (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 22:04:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44266 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234672AbhGBCEN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 22:04:13 -0400
Received: from localhost.localdomain (unknown [IPv6:2804:14d:72b1:a2ff:e85c:7833:5d85:73d6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dwlsalmeida)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E4FD71F446F7;
        Fri,  2 Jul 2021 03:01:38 +0100 (BST)
From:   daniel.almeida@collabora.com
To:     hverkuil@xs4all.nl, jernej.skrabec@gmail.com,
        ezequiel@collabora.com, paul.kocialkowski@bootlin.com,
        mripard@kernel.org
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        Daniel Almeida <daniel.almeida@collabora.com>
Subject: [RFC,WIP PATCH 1/2] media: cedrus: fix double free
Date:   Thu,  1 Jul 2021 23:01:28 -0300
Message-Id: <20210702020129.470720-2-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702020129.470720-1-daniel.almeida@collabora.com>
References: <20210702020129.470720-1-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel Almeida <daniel.almeida@collabora.com>

If v4l2_ctrl_new_custom fails in cedrus_init_ctrls the error path will
free ctx->ctrls, which is also freed in cedrus release. Fix this by
setting ctx->ctrls to NULL instead of inadvertently removing kfree
calls.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index c0d005dafc6c..e72810ace40f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -207,6 +207,7 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
 
 			v4l2_ctrl_handler_free(hdl);
 			kfree(ctx->ctrls);
+			ctx->ctrls = NULL;
 			return hdl->error;
 		}
 
-- 
2.32.0

