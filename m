Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3FA16CF8E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 16:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390618AbfGRORD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 10:17:03 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:59357 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390605AbfGRORC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 10:17:02 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MdNHa-1iNS2127Qe-00ZLMK; Thu, 18 Jul 2019 16:16:53 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Johan Korsnes <johan.korsnes@gmail.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Gabriel Francisco Mandaji <gfmandaji@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH] media: vivid: work around high stack usage with clang
Date:   Thu, 18 Jul 2019 16:16:43 +0200
Message-Id: <20190718141652.3323402-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pQKRRjSAwPvJe/DxyiorcFmR6g4THfSDWMYc4p1kZ8aLckuM0qr
 xiClQ7AIVuxhBy+lGsPSBjcs77ak3SReRcHc5Am7mqZgcmrz9f4AoLd3JloLdNFEQglNegX
 6jdTth3eX4T4XaZYZZVQjYzBNeckqyHawmVjOWSrwzLGx4S2Tp/SgN1edqnon9OwZxy0rr+
 ftQgSnAn9XDmMOCvB2ebA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8NGldS+p5eQ=:By0jRMiqfFn2SYMphKkJGN
 i3yDPSR68JLDHktBXZ/qviTIEXWjHGJIdnA1VW72vr/hIz3WOnGbh7uZdJqfKdg5W5XuegFHI
 CjIkleZu201NWQ+tOktdMjcBbsF8z7rAOJvJd0rM7BXwi3fayjvf8l7SVubOp3GgyiqE9akGY
 KwzerfPyAtao1W+byoBidehfl987Lw4pHrMLUv7d5lru4Qg5Rxwcs0EM1yaUUMp52PI0R9oEg
 L+WvO2ty8u789v/03RE9d/S1OgvvOIGsj8dun2hMJ04PHuPnbj5+h6uKlhohhxfffam01eYT8
 9kKMawa1wwQ28ZB0wQtX1QaakIsJ+xDEL63P54/GxBsGNrVINo8NT/2gc0MpkproSgjZ6SCWS
 h5lJOb5BVBClB3WcPG5+8U2SM3oV8m/oZJSIZ3ewHFCPImc5ulF1iJP6a2xGssg2yzPbP25+a
 d/S7rlHcj+CxpFnLBqMKthxqafWyqaud59fXGcSTybzxX+Fc38wWBiYu0rjynB1/6wUEUok9d
 QBdwA7Pl6CjsbMpH8SarPDXByn6sQs7cSZt2u3bpIGfsOOm2KC/kwn2EDjDhY9KgStKqyX/sM
 Fae6snP4LKzacTQ6bqMOe/8a1LfqWfS/5eH+ijSfqkslnL7hpZ0nHeZFdA/Pa1Glrb7NM+xjr
 nIdJuXqpjFhUmg3rj+0cf8okhl6YlHouWlE/0mBoF4mQ1GXOO69SEcd5TJGhIJ91ltRZvYb9q
 Xc7tFuIOp6ppiw+kpl1+2E7ACbzQatv09fxO6A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Building a KASAN-enabled kernel with clang ends up in a case where too
much is inlined into vivid_thread_vid_cap() and the stack usage grows
a lot, possibly when the register allocation fails to produce efficient
code and spills a lot of temporaries to the stack. This uses more
than twice the amount of stack than the sum of the individual functions
when they are not inlined:

drivers/media/platform/vivid/vivid-kthread-cap.c:766:12: error: stack frame size of 2208 bytes in function 'vivid_thread_vid_cap' [-Werror,-Wframe-larger-than=]

Marking two of the key functions in here as 'noinline_for_stack' avoids
the pathological case in clang without any apparent downside for gcc.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Not sure how much effort we want to put into fixing clang to not
get into this case. I could open an llvm bug report if something
thinks this has a chance of getting fixed there.
---
 drivers/media/platform/vivid/vivid-kthread-cap.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/platform/vivid/vivid-kthread-cap.c
index 6cf495a7d5cc..4f94897e6303 100644
--- a/drivers/media/platform/vivid/vivid-kthread-cap.c
+++ b/drivers/media/platform/vivid/vivid-kthread-cap.c
@@ -232,8 +232,8 @@ static void *plane_vaddr(struct tpg_data *tpg, struct vivid_buffer *buf,
 	return vbuf;
 }
 
-static int vivid_copy_buffer(struct vivid_dev *dev, unsigned p, u8 *vcapbuf,
-		struct vivid_buffer *vid_cap_buf)
+static noinline_for_stack int vivid_copy_buffer(struct vivid_dev *dev, unsigned p,
+		u8 *vcapbuf, struct vivid_buffer *vid_cap_buf)
 {
 	bool blank = dev->must_blank[vid_cap_buf->vb.vb2_buf.index];
 	struct tpg_data *tpg = &dev->tpg;
@@ -670,7 +670,8 @@ static void vivid_cap_update_frame_period(struct vivid_dev *dev)
 	dev->cap_frame_period = f_period;
 }
 
-static void vivid_thread_vid_cap_tick(struct vivid_dev *dev, int dropped_bufs)
+static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
+							 int dropped_bufs)
 {
 	struct vivid_buffer *vid_cap_buf = NULL;
 	struct vivid_buffer *vbi_cap_buf = NULL;
-- 
2.20.0

