Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0333A3C32
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 08:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhFKGsv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 02:48:51 -0400
Received: from m12-12.163.com ([220.181.12.12]:52945 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhFKGsu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 02:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Xz2nQ
        GtOgVGJ1knRX1RxxdUkVoXX4TTNr3oLLZztcoM=; b=lI2JSZO1sAcH8SdYdqt93
        sdlBWXkLeJmYDqL4nRI6urxCbEJ8eczp6XWGk2lpjUgda9hd02R0bs1wPvQJodC4
        yb0136/U5h+efHFwBQtBG7WHhXKy8leCOoreTrJDMi3NhjGDQpIQQQyWzeC9BX7E
        84+nV+vfv/tQ20eiglIISE=
Received: from localhost.localdomain (unknown [218.17.89.92])
        by smtp8 (Coremail) with SMTP id DMCowACnvyu8AsNgJVQCJQ--.2919S2;
        Fri, 11 Jun 2021 14:29:18 +0800 (CST)
From:   lijian_8010a29@163.com
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        m.felsch@pengutronix.de, sakari.ailus@linux.intel.com,
        jacopo+renesas@jmondi.org, krzk@kernel.org,
        zhangxiaoxu5@huawei.com, gustavoars@kernel.org,
        hslester96@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Subject: [PATCH] media: i2c: tvp5150: deleted the repeated word
Date:   Fri, 11 Jun 2021 14:28:15 +0800
Message-Id: <20210611062815.93583-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowACnvyu8AsNgJVQCJQ--.2919S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWrCw1DWr1DKF4xCFWruFg_yoW3Xrb_Gw
        nxZF4xWr1v9F43Aa1Utr4fZry0yFs8ZFs7ZFn8ta43Kr4ruF12qrZ0yw17Cw1rA3Z0vF98
        Zayj934jyws7GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5ID7DUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/1tbi3x6uUGB0GgRA1wAAsi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: lijian <lijian@yulong.com>

deleted the repeated word 'the' in the comments.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/media/i2c/tvp5150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index e26e3f544054..092ee959e6ae 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -964,7 +964,7 @@ static int tvp5150_enable(struct v4l2_subdev *sd)
 
 	/*
 	 * Enable the YCbCr and clock outputs. In discrete sync mode
-	 * (non-BT.656) additionally enable the the sync outputs.
+	 * (non-BT.656) additionally enable the sync outputs.
 	 */
 	switch (decoder->mbus_type) {
 	case V4L2_MBUS_PARALLEL:
-- 
2.25.1


