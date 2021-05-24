Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 365D538E6E0
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 14:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbhEXMtY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 08:49:24 -0400
Received: from m12-17.163.com ([220.181.12.17]:47689 "EHLO m12-17.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232512AbhEXMtX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 08:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ZK9OC
        bbr/q5T46hfDT7TPj4sjHwU7PndImxbhw+BG20=; b=T64zb2IVo7YmNnWzdyc31
        j293n+l7VYBzrUOj5JLswEEqt2rUWUH4aKVtmIc3gAQsegr2iTBawEaKmjQym/kf
        l011RQDJFdSZ2IQjShFUZNm5rtsNbOljK1Wj49wWwHxN30lwyT0s4hmjieqE9dEL
        l9DMu73g/DIuaYPYw74zWo=
Received: from COOL-20201210PM.ccdomain.com (unknown [218.94.48.178])
        by smtp13 (Coremail) with SMTP id EcCowAAHCZFwoKtg4aRi3A--.26390S2;
        Mon, 24 May 2021 20:47:48 +0800 (CST)
From:   zuoqilin1@163.com
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        zuoqilin <zuoqilin@yulong.com>
Subject: [PATCH] drivers: media: Simplify the return expression of interpolate_value()
Date:   Mon, 24 May 2021 20:47:54 +0800
Message-Id: <20210524124754.1491-1-zuoqilin1@163.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowAAHCZFwoKtg4aRi3A--.26390S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF1xWryxAw1kGF1UJr48Crg_yoWDWFb_Gw
        18Wrn7uryjgF40vrnFyrnYy3yvvryUur1kA3WIqay3JrWrWr1fGr4vyr17JFW5WF17uFs0
        q3Z5WFySkFZFkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU02ZX5UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 52xr1xpolqiqqrwthudrp/xtbBRR2ciVPAL-tEVgAAsY
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: zuoqilin <zuoqilin@yulong.com>

Simplify the return expression.

Signed-off-by: zuoqilin <zuoqilin@yulong.com>
---
 drivers/media/dvb-frontends/mb86a20s.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/mb86a20s.c b/drivers/media/dvb-frontends/mb86a20s.c
index a7faf0c..fc80391 100644
--- a/drivers/media/dvb-frontends/mb86a20s.c
+++ b/drivers/media/dvb-frontends/mb86a20s.c
@@ -1346,7 +1346,7 @@ static u32 interpolate_value(u32 value, const struct linear_segments *segments,
 {
 	u64 tmp64;
 	u32 dx, dy;
-	int i, ret;
+	int i;
 
 	if (value >= segments[0].x)
 		return segments[0].y;
@@ -1367,9 +1367,7 @@ static u32 interpolate_value(u32 value, const struct linear_segments *segments,
 	tmp64 = value - segments[i].x;
 	tmp64 *= dy;
 	do_div(tmp64, dx);
-	ret = segments[i].y - tmp64;
-
-	return ret;
+	return segments[i].y - tmp64;
 }
 
 static int mb86a20s_get_main_CNR(struct dvb_frontend *fe)
-- 
1.9.1


