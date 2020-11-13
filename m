Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956002B164C
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 08:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgKMHVZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 02:21:25 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:38274 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726112AbgKMHVZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 02:21:25 -0500
Received: from localhost.localdomain (unknown [124.16.141.242])
        by APP-05 (Coremail) with SMTP id zQCowABXapzqM65fmQzMAA--.55224S2;
        Fri, 13 Nov 2020 15:21:15 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] media: cx88: use ARRAY_SIZE
Date:   Fri, 13 Nov 2020 07:21:11 +0000
Message-Id: <20201113072111.63734-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowABXapzqM65fmQzMAA--.55224S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GryDZrWxKr47Zr48tF4xWFg_yoW3Zwc_uF
        ykWFn3Zry5Wr1DtrsIqF1S9342va95Wry8XF1Sqa4ayFZ09F13J3yjqFZ5JrnFkrsFyFW7
        CryDWFy3XwnxWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbFAYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I
        3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
        WUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
        wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
        k0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
        Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8v_M3UUUUU==
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiAw0TA13qZgnRdwAAsg
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use ARRAY_SIZE instead of dividing sizeof array with sizeof an element

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/media/pci/cx88/cx88-mpeg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-mpeg.c b/drivers/media/pci/cx88/cx88-mpeg.c
index a57c991b165b..a3edb548afde 100644
--- a/drivers/media/pci/cx88/cx88-mpeg.c
+++ b/drivers/media/pci/cx88/cx88-mpeg.c
@@ -524,8 +524,7 @@ static int cx8802_request_acquire(struct cx8802_driver *drv)
 		core->last_analog_input = core->input;
 		core->input = 0;
 		for (i = 0;
-		     i < (sizeof(core->board.input) /
-			  sizeof(struct cx88_input));
+		     i < ARRAY_SIZE(core->board.input);
 		     i++) {
 			if (core->board.input[i].type == CX88_VMUX_DVB) {
 				core->input = i;
-- 
2.17.1

