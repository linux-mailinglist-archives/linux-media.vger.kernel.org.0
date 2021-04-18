Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C37923634A5
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 12:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhDRKhn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 06:37:43 -0400
Received: from mout02.posteo.de ([185.67.36.66]:47577 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhDRKhm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 06:37:42 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 4E4A22400FE
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 12:37:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1618742233; bh=SAqTuehql45q0JuTWZy7CNkejtygzl6s6w7GoFO9cYk=;
        h=From:To:Cc:Subject:Date:From;
        b=Hb9mUykgzrwn22yRa3g59wX+X1QClbRlS45CB5HiH+jjMT1Nc+IFtE5M55bFh0QW4
         3mZdoWfxHcW1U0HzLHANpjGz9eaoYBRG9eSNmEwP3od6jJD1KatXImSIJO+wLM1TxR
         46Qk2yKNaS/T2TitwxtNNypfBW8KTTYfQm3vxx+Mj00jezWmyj2JL9rutN7XROHH2J
         wfsvERPaywwFJe6J4nOdF5M/nSjs4Qg+bKVeMSEpbq7C08DYFk4JWU84bNSsATO8cq
         g/FXd84VO6OclubV1MZ/7UUNLn0pdWca/S5g7MxN/xhO7lbh88PK9akAFPVWZS+oQ9
         PDB3+uOes/3hA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4FNRGH3q8yz6tmK;
        Sun, 18 Apr 2021 12:37:11 +0200 (CEST)
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     linux-media@vger.kernel.org
Cc:     Sebastian Fricke <sebastian.fricke@posteo.net>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: rkisp1: rksip1-capture.c: Improve comments and fix typos
Date:   Sun, 18 Apr 2021 10:34:25 +0000
Message-Id: <20210418103425.45525-1-sebastian.fricke@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improve the wording of the function description to increase readability.

Fix three typos:
s/during processing a frame/while processing a frame/
s/it also update/it also updates/
s/there's not buf in shadow/there's no buffer in a shadow register/

Replace the abbreviation 'buf' with the full word buffer, the
abbreviation 'config' with the verb configure, and 'regs' with registers.
The goal of this change is to ease the reading flow of the comment.

Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>
---
Side-note:
I also believe there should be a description for the abbreviation FE, as
it is not described anywhere. I think it means frame end, right?.
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 5f6c9d1623e4..9643bdd05b7b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -830,8 +830,8 @@ static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
 }
 
 /*
- * Most of registers inside rockchip ISP1 have shadow register since
- * they must be not be changed during processing a frame.
+ * Most registers inside the rockchip ISP1 have shadow register since
+ * they must not be changed while processing a frame.
  * Usually, each sub-module updates its shadow register after
  * processing the last pixel of a frame.
  */
@@ -847,14 +847,14 @@ static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
 	spin_lock_irq(&cap->buf.lock);
 	rkisp1_set_next_buf(cap);
 	cap->ops->enable(cap);
-	/* It's safe to config ACTIVE and SHADOW regs for the
+	/* It's safe to configure ACTIVE and SHADOW registers for the
 	 * first stream. While when the second is starting, do NOT
-	 * force update because it also update the first one.
+	 * force update because it also updates the first one.
 	 *
-	 * The latter case would drop one more buf(that is 2) since
-	 * there's not buf in shadow when the second FE received. This's
-	 * also required because the second FE maybe corrupt especially
-	 * when run at 120fps.
+	 * The latter case would drop one more buffer(that is 2) since
+	 * there's no buffer in a shadow register when the second FE received.
+	 * This's also required because the second FE maybe corrupt
+	 * especially when run at 120fps.
 	 */
 	if (!other->is_streaming) {
 		/* force cfg update */
-- 
2.25.1

