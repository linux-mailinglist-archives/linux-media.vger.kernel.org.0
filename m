Return-Path: <linux-media+bounces-51499-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD2rCH4mdmkgMgEAu9opvQ
	(envelope-from <linux-media+bounces-51499-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 15:19:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B08680F53
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 15:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2040F30071D9
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACE431D74B;
	Sun, 25 Jan 2026 14:19:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CD73EBF31;
	Sun, 25 Jan 2026 14:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769350765; cv=none; b=KrMmBMQk/uYkvAg5foK1pQ9+pSe8a5HDrA/nr/S7bo+f5MxLDFcaZrIhzmljxkv9DM+OLYj604hT8ozQANysu1Np/rsqMZQlxF0+B9V5i1z0kLxR6D4O3psX6DVBBn4yRIipps83dxmG1mx65OqoljUGOl9HcoQSLFDShmon6+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769350765; c=relaxed/simple;
	bh=ei4lr9P/HGBeE1x3R6SgfCn921F029WpWZYvyIos9tA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d0OTSenvmRqUkiK4/ov+58+BvN0pmKphBpLokFiQhAGsP5BC8oQwG4uDK9FTpCt8zfcwgw7W6ORAB8xvOw/foDuklCe7k0JqwwvHPdAq0o9qYA3z/rGLbt+6AjE2gBKKudIQS1nILsZ88xasGP1Ur1B10VFV57sc+pKy5OOV1FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-03 (Coremail) with SMTP id rQCowACHa+JkJnZp1DWtBg--.15455S2;
	Sun, 25 Jan 2026 22:19:17 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: jackson.lee@chipsnmedia.com,
	mchehab@kernel.org,
	bob.beckett@collabora.com,
	sebastian.fricke@collabora.com,
	dafna.hirschfeld@collabora.com,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] media: chips-media: wave5: fix a potential memory leak in wave5_vdi_init()
Date: Sun, 25 Jan 2026 22:19:15 +0800
Message-Id: <20260125141915.2088123-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACHa+JkJnZp1DWtBg--.15455S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw4ruryDXw17uryfKw4fAFb_yoWDWrg_ZF
	sYqF17XFW8Aayvyr4UtF4fuayqq3909r40vF1SvF1Fg3y5C347WF1akry5uF1UWrsFvasr
	K343WryxCF13ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBgoSE2l1qXuW3gABsK
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51499-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[lihaoxiang@isrc.iscas.ac.cn,linux-media@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email,isrc.iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 7B08680F53
X-Rspamd-Action: no action

Add wave5_vdi_free_dma_memory() in the error path of
wave5_vdi_init() to prevent a potential memory leak.

Fixes: 45d1a2b93277 ("media: chips-media: wave5: Add vpuapi layer")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/media/platform/chips-media/wave5/wave5-vdi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vdi.c b/drivers/media/platform/chips-media/wave5/wave5-vdi.c
index bb13267ced38..8f71920a8a35 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vdi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vdi.c
@@ -49,6 +49,7 @@ int wave5_vdi_init(struct device *dev)
 
 	if (!PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
 		WARN_ONCE(1, "unsupported product code: 0x%x\n", vpu_dev->product_code);
+		wave5_vdi_free_dma_memory(vpu_dev, &vpu_dev->common_mem);
 		return -EOPNOTSUPP;
 	}
 
-- 
2.25.1


