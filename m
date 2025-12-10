Return-Path: <linux-media+bounces-48545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4D9CB276A
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 09:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE39930071BC
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 08:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D8430275E;
	Wed, 10 Dec 2025 08:52:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9CE242D60;
	Wed, 10 Dec 2025 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765356767; cv=none; b=bTTQiFvp6vvcMztyyrRkJ9EaC45mDDazqSBfuSS22Gt7g0BY5d24WwyMppvKdqUq1ROi4pCNUNRAL+nA8vYWGeP8gH2e1EXchXr/6vPyDeVAfWNFg2pZ/HXAMSqKeXcyMY5N+b6zlZhYMKNFChFhAOy2znWu6sxHbUpoZHSA4kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765356767; c=relaxed/simple;
	bh=4JAEFzOvbqzvSCkk/X0VDc7q0EdtoYeExC/T2EmYNkY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=af0U1GvKp680pEjdjlBQ5Hyg0tt/4+CDwqy1BQgPwQAG96Yyk44nlzI5f5ywjMLbPQUSYLZq3GnStgnybRtAgX3cAR0VX3/0kpa/ZAtI9E0UBbpPWJ1L87tuqfealNpKAdQ9ZCTbJZ9Zt0WgtinSI1mYBh+swDELXIdsEvM4SIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.239])
	by APP-05 (Coremail) with SMTP id zQCowAAHnA_PNDlp62QyAA--.976S2;
	Wed, 10 Dec 2025 16:52:31 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: mchehab@kernel.org,
	lihaoxiang@isrc.iscas.ac.cn,
	hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] media: cx25821: Add missing unmap in snd_cx25821_hw_params()
Date: Wed, 10 Dec 2025 16:52:30 +0800
Message-Id: <20251210085230.67448-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAHnA_PNDlp62QyAA--.976S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4rtF4fXw4xJr1DArWUJwb_yoWDJFXEgF
	9Fq39rur4UCr4vyr48tr4S934UtFZ8uFs7Z3W3tFyYya4UCF1UJr90v34rJ3yqqrW5A3s0
	yry7GFyUArWDAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1F6r1fM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7UUUU
	U==
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBgsME2k49dzpxgAAsF

In error path, add cx25821_alsa_dma_unmap() to release the
resource acquired by cx25821_alsa_dma_map()

Fixes: 8d8e6d6005de ("[media] cx28521: drop videobuf abuse in cx25821-alsa")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
Changes in v2:
- Fix the "Fixes" tag error.
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


