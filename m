Return-Path: <linux-media+bounces-48528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CBDCB1BF2
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 03:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F15BB312F2EB
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 02:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA7F23D7CE;
	Wed, 10 Dec 2025 02:46:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC26271468;
	Wed, 10 Dec 2025 02:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765334769; cv=none; b=mifvUas+wnj+8mG2S48GqAweumpvNThz5sYkj9NZeRDQagqnjirAxWiG29Dnb1ncg6fJ8pk+aOmpV7VvP2q61g2ZBXycANa7I1ttZYiU9+k82Tph55lDmaTnxMA2ckBUTL3zIBMkWrp3Xz4sszKdg//YDV+lFcQYyng/Ub8iuV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765334769; c=relaxed/simple;
	bh=Ey/o4pjjDSkIuvhbLXQSidNTIWVXM7YwaXNfklJrEKg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ckPPfELguFSwCu01D4uAWLziVew3zBxkzwr5O5pJdmUiKmsEbPV2eu6FItCAgDlwLdIl9jHSOKkAKyz0ouB5m7qLlaK+umMGhArQeOec+XgbeZzyYejr3nPwbeG8h0qofhtWuAhPFXkaI80LWZEio9P/1avE9ZPw/5eHeK1VXWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.239])
	by APP-01 (Coremail) with SMTP id qwCowAA33Wjo3jhpmh4oAA--.1129S2;
	Wed, 10 Dec 2025 10:46:01 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: mchehab@kernel.org,
	lihaoxiang@isrc.iscas.ac.cn,
	hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: cx25821: Add missing unmap in snd_cx25821_hw_params()
Date: Wed, 10 Dec 2025 10:45:59 +0800
Message-Id: <20251210024559.50171-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA33Wjo3jhpmh4oAA--.1129S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4rXFy7Kw1fZw1fKryDWrg_yoWfZrXEgF
	9Iq39rur4UCrsYyr4xtr4S934UtFZ8uF4xua13tFyYya4UAF1UXr90v34rJ3yvvrW5A3s0
	k347GFy8JrWDAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBgoLE2k35laN1wADsj

In error path, add cx25821_alsa_dma_unmap() to release the
resource acquired by cx25821_alsa_dma_map()

Fixes: b2c75abde0de ("[media] cx88: drop videobuf abuse in cx88-alsa")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/media/pci/cx25821/cx25821-alsa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
index a42f0c03a7ca..f463365163b7 100644
--- a/drivers/media/pci/cx25821/cx25821-alsa.c
+++ b/drivers/media/pci/cx25821/cx25821-alsa.c
@@ -535,6 +535,7 @@ static int snd_cx25821_hw_params(struct snd_pcm_substream *substream,
 			chip->period_size, chip->num_periods, 1);
 	if (ret < 0) {
 		pr_info("DEBUG: ERROR after cx25821_risc_databuffer_audio()\n");
+		cx25821_alsa_dma_unmap(chip);
 		goto error;
 	}
 
-- 
2.25.1


