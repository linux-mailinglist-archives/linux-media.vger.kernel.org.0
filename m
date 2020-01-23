Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01BF0146033
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 02:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgAWBGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 20:06:48 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:52908 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAWBGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 20:06:47 -0500
Received: from [82.43.126.140] (helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iuQxH-000063-QP; Thu, 23 Jan 2020 01:06:43 +0000
From:   Colin King <colin.king@canonical.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: allegro: fix spelling mistake "to" -> "too"
Date:   Thu, 23 Jan 2020 01:06:43 +0000
Message-Id: <20200123010643.2834801-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a v4l2_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 3be41698df4c..9908d851d4be 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -781,7 +781,7 @@ static int allegro_mbox_write(struct allegro_dev *dev,
 
 	if (size > mbox->size) {
 		v4l2_err(&dev->v4l2_dev,
-			 "message (%zu bytes) to large for mailbox (%zu bytes)\n",
+			 "message (%zu bytes) too large for mailbox (%zu bytes)\n",
 			 size, mbox->size);
 		return -EINVAL;
 	}
-- 
2.24.0

