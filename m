Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E61B45CCEB
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351230AbhKXTQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:52872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351113AbhKXTQm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BDE5610E8;
        Wed, 24 Nov 2021 19:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781211;
        bh=s74V3GxdYYJTz+2GcE2sG2QwoR8/KQlxxxsyyTkQRCY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V7KMfkRFwLW8uAAPcabxno83SEf9MwBa8McDunMaV3aday6eJS0BluwutiKfdAQz/
         TRia0Wq0ikGhGnjuhCFBAp2V8xcYdgTeUwGQ4xuzMMzH2PY2N7YWr+pHfWjzV0yKAo
         Fy6Pd00WnkKeafML4l+0Z+at/bJWoClro9XbdokF8Orjjaw1VIaP3TcSqWr9G88Krj
         BhIK1tQTQHXIs0ROZA/p1Uw5WBqMrSVfzyZ0tQrs9aoAeIu57cgwpws+8VXJDkw4L8
         nuMbtLRa2QdpMEyz3Ql3NL/Jy3eyp6Q36qBL99JyRQWxJFa7HaAnxQY4azEiW+RKw6
         eDxydcRL0CCeA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q5o-LU; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 14/20] media: adv7511: drop unused functions
Date:   Wed, 24 Nov 2021 20:13:17 +0100
Message-Id: <031cdb0042f8239a6746831f5c8f89cf4aef6107.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Those are aliases for another function and not used at the
current implementation. So, just drop it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/i2c/adv7511-v4l2.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 41f4e749a859..8e13cae40ec5 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -270,28 +270,6 @@ static int adv7511_pktmem_rd(struct v4l2_subdev *sd, u8 reg)
 	return adv_smbus_read_byte_data(state->i2c_pktmem, reg);
 }
 
-static int adv7511_pktmem_wr(struct v4l2_subdev *sd, u8 reg, u8 val)
-{
-	struct adv7511_state *state = get_adv7511_state(sd);
-	int ret;
-	int i;
-
-	for (i = 0; i < 3; i++) {
-		ret = i2c_smbus_write_byte_data(state->i2c_pktmem, reg, val);
-		if (ret == 0)
-			return 0;
-	}
-	v4l2_err(sd, "%s: i2c write error\n", __func__);
-	return ret;
-}
-
-/* To set specific bits in the register, a clear-mask is given (to be AND-ed),
-   and then the value-mask (to be OR-ed). */
-static inline void adv7511_pktmem_wr_and_or(struct v4l2_subdev *sd, u8 reg, u8 clr_mask, u8 val_mask)
-{
-	adv7511_pktmem_wr(sd, reg, (adv7511_pktmem_rd(sd, reg) & clr_mask) | val_mask);
-}
-
 static inline bool adv7511_have_hotplug(struct v4l2_subdev *sd)
 {
 	return adv7511_rd(sd, 0x42) & MASK_ADV7511_HPD_DETECT;
-- 
2.33.1

