Return-Path: <linux-media+bounces-48529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4906CB1C22
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 03:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F49B306434A
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 02:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37625277013;
	Wed, 10 Dec 2025 02:53:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39526EEBA;
	Wed, 10 Dec 2025 02:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765335237; cv=none; b=DyMGPQTTM0vxKnZIVmIjcDrVw9VhIW4PHnlXPV83BMQwtJrNMri7AMgprNDqIXJlnd0k5AOjD3z4NwkrJAClbq79knq5+xEbtiF1PePwYzVcw0orYrkP57zZmNqUOPLnXgX9qZRHt4omzP66P+T6aNaY+hMGdIQTqJhCnqYTta4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765335237; c=relaxed/simple;
	bh=mixF3j4/id6gytWpqfblLejoFTNYBuNZeX33lWfeVf8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UYT8OSBV+kJWZfBiYDpvdhl1PIRwjid2bUobQYkn7Jd1mry4YgrehP7XhcqDpEQd9TwWcuTkBzFsDDEsbadKPBE5n9DhsGuw+TskJU7IAAkjEK/wOwDgNu+gck+fa7vInBAAAhRvgJblvozYlAHGNOkq838xjO//pRCjJvqZiBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.239])
	by APP-01 (Coremail) with SMTP id qwCowADXfGi94DhpQUwoAA--.1136S2;
	Wed, 10 Dec 2025 10:53:49 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: mchehab@kernel.org,
	lihaoxiang@isrc.iscas.ac.cn,
	hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: cx88: Add missing unmap in snd_cx88_hw_params()
Date: Wed, 10 Dec 2025 10:53:48 +0800
Message-Id: <20251210025348.51940-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADXfGi94DhpQUwoAA--.1136S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtryfWFWUJr17KFWrKw45KFg_yoWDWFXEgr
	9FgFZxZrWUur1Yyw12qr1I93y8tayv9r48uFyft3ZxtF15Kr4Uu3yqqr4rJrn7urWayr98
	Kw17ZFyrJr9rXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1F6r1fM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbhvttUUUU
	U==
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiCQ8ME2k4uB6lOgAAsx

In error path, add cx88_alsa_dma_unmap() to release
resource acquired by cx88_alsa_dma_map().

Fixes: b2c75abde0de ("[media] cx88: drop videobuf abuse in cx88-alsa")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/media/pci/cx88/cx88-alsa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
index 29fb1311e443..4e574d8390b4 100644
--- a/drivers/media/pci/cx88/cx88-alsa.c
+++ b/drivers/media/pci/cx88/cx88-alsa.c
@@ -483,8 +483,10 @@ static int snd_cx88_hw_params(struct snd_pcm_substream *substream,
 
 	ret = cx88_risc_databuffer(chip->pci, &buf->risc, buf->sglist,
 				   chip->period_size, chip->num_periods, 1);
-	if (ret < 0)
+	if (ret < 0) {
+		cx88_alsa_dma_unmap(chip);
 		goto error;
+	}
 
 	/* Loop back to start of program */
 	buf->risc.jmp[0] = cpu_to_le32(RISC_JUMP | RISC_IRQ1 | RISC_CNT_INC);
-- 
2.25.1


