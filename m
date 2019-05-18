Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 421AC220FE
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2019 02:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbfERAre (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 20:47:34 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:25899 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726870AbfERArd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 20:47:33 -0400
X-Halon-ID: 7eeb583f-7906-11e9-8601-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 7eeb583f-7906-11e9-8601-0050569116f7;
        Sat, 18 May 2019 02:47:26 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] vimc: Remove unneeded return statement in vimc_sen_s_stream()
Date:   Sat, 18 May 2019 02:46:54 +0200
Message-Id: <20190518004654.12719-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The other subdevice implementations in vimc (debayer and scaler) which
share there code structure with the sensor does not have an explicit
return statement at the end of the s_stream(0) code path. Align the
sensor subdevices by dropping the return statement.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/vimc/vimc-sensor.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 081e54204c9f4ece..baca9ca67ce0af0b 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -221,7 +221,6 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 
 		vfree(vsen->frame);
 		vsen->frame = NULL;
-		return 0;
 	}
 
 	return 0;
-- 
2.21.0

