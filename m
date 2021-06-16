Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 511D73A9585
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 11:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbhFPJHl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 05:07:41 -0400
Received: from m12-12.163.com ([220.181.12.12]:51375 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232199AbhFPJHf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 05:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=UGFP8
        /RSPb0vQgFHNw18cfj7EGxy7Okd4YcI1roKqFc=; b=biKT964WMFooHs81TwS5r
        NqI7F4W5kstIoGKxCVBYD2COeHc2YVveHT/hpvL3JwZeagayfWYm46n4m0PEzR7k
        p7nVmrOjlHAMQjc0fYSnzP/SlfHefeECtpNsPbSO7fFu0OhydVe68TCU/WBRdOak
        wd3DyhViXlRNKuUWMBzZbY=
Received: from localhost.localdomain (unknown [218.17.89.92])
        by smtp8 (Coremail) with SMTP id DMCowAA3NdGec8lgbxncKA--.524S2;
        Wed, 16 Jun 2021 11:44:32 +0800 (CST)
From:   lijian_8010a29@163.com
To:     mkrufky@linuxtv.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Subject: [PATCH] media: tuners: mxl5007t: Removed unnecessary 'return'
Date:   Wed, 16 Jun 2021 11:43:33 +0800
Message-Id: <20210616034333.26367-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowAA3NdGec8lgbxncKA--.524S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFy8GrWruw1fuF1xXrWkJFb_yoW8AryUpr
        9xZF9xuFWqqr1DJa15try5AFn8CF4vk340vry7G3sakFyUZrs8X39rJay8Jr9ayFy8Aw1r
        ArsF9r4Iyr4UXFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bbwZcUUUUU=
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/1tbiqwCzUFUMZ1tR3gAAsi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: lijian <lijian@yulong.com>

Removed unnecessary 'return'.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/media/tuners/mxl5007t.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/tuners/mxl5007t.c b/drivers/media/tuners/mxl5007t.c
index 26a277975cb1..03c46a62bf26 100644
--- a/drivers/media/tuners/mxl5007t.c
+++ b/drivers/media/tuners/mxl5007t.c
@@ -172,7 +172,6 @@ static void set_reg_bits(struct reg_pair_t *reg_pair, u8 reg, u8 mask, u8 val)
 		i++;
 
 	}
-	return;
 }
 
 static void copy_reg_bits(struct reg_pair_t *reg_pair1,
@@ -193,7 +192,6 @@ static void copy_reg_bits(struct reg_pair_t *reg_pair1,
 		}
 		i++;
 	}
-	return;
 }
 
 /* ------------------------------------------------------------------------- */
@@ -221,7 +219,6 @@ static void mxl5007t_set_mode_bits(struct mxl5007t_state *state,
 	default:
 		mxl_fail(-EINVAL);
 	}
-	return;
 }
 
 static void mxl5007t_set_if_freq_bits(struct mxl5007t_state *state,
@@ -274,8 +271,6 @@ static void mxl5007t_set_if_freq_bits(struct mxl5007t_state *state,
 	set_reg_bits(state->tab_init, 0x02, 0x10, invert_if ? 0x10 : 0x00);
 
 	state->if_freq = if_freq;
-
-	return;
 }
 
 static void mxl5007t_set_xtal_freq_bits(struct mxl5007t_state *state,
@@ -343,8 +338,6 @@ static void mxl5007t_set_xtal_freq_bits(struct mxl5007t_state *state,
 		mxl_fail(-EINVAL);
 		return;
 	}
-
-	return;
 }
 
 static struct reg_pair_t *mxl5007t_calc_init_regs(struct mxl5007t_state *state,
@@ -398,8 +391,6 @@ static void mxl5007t_set_bw_bits(struct mxl5007t_state *state,
 		return;
 	}
 	set_reg_bits(state->tab_rftune, 0x0c, 0x3f, val);
-
-	return;
 }
 
 static struct
-- 
2.25.1


