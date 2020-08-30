Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37593256CC8
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 10:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgH3IU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 04:20:56 -0400
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net ([209.97.182.222]:40780
        "HELO zg8tmja5ljk3lje4mi4ymjia.icoremail.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with SMTP id S1725869AbgH3IU4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 04:20:56 -0400
Received: from oslab.tsinghua.edu.cn (unknown [166.111.139.112])
        by app-1 (Coremail) with SMTP id DwQGZQBnSSNbYUtfs2HPAA--.4425S2;
        Sun, 30 Aug 2020 16:20:46 +0800 (CST)
From:   Jia-Ju Bai <baijiaju@tsinghua.edu.cn>
To:     mchehab@kernel.org, sean@mess.org, pavel@ucw.cz
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju@tsinghua.edu.cn>
Subject: [PATCH] media: pci: ttpci: av7110: avoid compiler optimization of reading data[0] in debiirq()
Date:   Sun, 30 Aug 2020 16:20:42 +0800
Message-Id: <20200830082042.17462-1-baijiaju@tsinghua.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DwQGZQBnSSNbYUtfs2HPAA--.4425S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr1UZryfZr17Kw4xAw48tFb_yoWfZrc_Wr
        ykXrW3uw4DZF97tr12yrsay3yjya98XF1xC3WSqa43Aw1DCr4xX39IkFnrJr97C345urW5
        AFyDXFnY9w17CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbckFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8ZwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUhiSdUUUUU=
X-CM-SenderInfo: xedlyxhdmxq3pvlqwxlxdovvfxof0/
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In debiirq(), data_0 stores the value of data[0], but it can be dropped
by compiler optimization. Thus, data[0] is read through READ_ONCE().

Fixes: 6499a0db9b0f ("media: pci: ttpci: av7110: fix possible buffer overflow caused by bad DMA value in debiirq()")
Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Jia-Ju Bai <baijiaju@tsinghua.edu.cn>
---
 drivers/media/pci/ttpci/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/ttpci/av7110.c b/drivers/media/pci/ttpci/av7110.c
index bf36b1e22b63..f7d098d5b198 100644
--- a/drivers/media/pci/ttpci/av7110.c
+++ b/drivers/media/pci/ttpci/av7110.c
@@ -406,7 +406,7 @@ static void debiirq(unsigned long cookie)
 	case DATA_CI_GET:
 	{
 		u8 *data = av7110->debi_virt;
-		u8 data_0 = data[0];
+		u8 data_0 = READ_ONCE(data[0]);
 
 		if (data_0 < 2 && data[2] == 0xff) {
 			int flags = 0;
-- 
2.17.1

