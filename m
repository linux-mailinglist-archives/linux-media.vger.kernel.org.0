Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7129F35BB33
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 09:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237067AbhDLHsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 03:48:54 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:41119 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237051AbhDLHsx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 03:48:53 -0400
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id CF07B40004;
        Mon, 12 Apr 2021 07:48:34 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH] media: i2c: ov8865: remove unnecessary NULL check
Date:   Mon, 12 Apr 2021 09:48:31 +0200
Message-Id: <20210412074831.7685-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The check on mode_index is sufficient to ensure that we have a
valid mode. Remove the explicit mode check similarly to
commit 38a50230292f ("media: i2c: ov5648: remove unnecessary NULL check")

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/i2c/ov8865.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 9ecf180635ee..4ad85dc4cd1f 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2691,7 +2691,7 @@ static int ov8865_enum_frame_interval(struct v4l2_subdev *subdev,
 		}
 	}
 
-	if (mode_index == ARRAY_SIZE(ov8865_modes) || !mode)
+	if (mode_index == ARRAY_SIZE(ov8865_modes))
 		return -EINVAL;
 
 	interval_enum->interval = mode->frame_interval;
-- 
2.31.1

