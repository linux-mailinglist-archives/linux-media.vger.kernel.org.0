Return-Path: <linux-media+bounces-65715-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ICk7J9hwPmqhGAkAu9opvQ
	(envelope-from <linux-media+bounces-65715-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:30:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9366CCFEC
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:30:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65715-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65715-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB4B1305D465
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 12:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0196C3F4DEF;
	Fri, 26 Jun 2026 12:28:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7225A3F4DDA;
	Fri, 26 Jun 2026 12:28:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782476925; cv=none; b=ZZAzHLbgPPOsqgCqaFariH1TjFxRxY0MIn1hpl+Wy2kMJGwgj4zpoJv/l9N5ngz6rL6gPoZ0ia9yDjKIeLCmZq/N+vr9L/YKCdBsHS1zYdZy1AZqGg6zgoCAWMwoJi+XaejNxVqjSuF110xlTHh8fw9w+O4kVAjvHjSDGUPiBNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782476925; c=relaxed/simple;
	bh=FHsBO7kcWla9zwF2tMnClSDq4nYKDEJTP6UxdG7WnGY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VrztBWByRBnE6DjRd2+1/YTTxLmYX2Z37cos1kwOVuhAuDxG1SphptnfxIlPzrRFqyRC/NWYRg8sWi1Hryl0rgqHnOfAZ/hDWHi9JBGHK0wC6TjH/Y2ztWh6UzPsy1zo1MPlcDEytWBrLvjm1djKLK7wtlUIgs5K4AzuLeNxwcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [117.182.75.66])
	by APP-05 (Coremail) with SMTP id zQCowACX99p1cD5qtSBoFQ--.22740S2;
	Fri, 26 Jun 2026 20:28:38 +0800 (CST)
From: WenTao Liang <vulab@iscas.ac.cn>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	WenTao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] fix: dma-buf: unwrap_merge_complex: dma_fence_get_stub reference leaked   on all paths
Date: Fri, 26 Jun 2026 20:28:36 +0800
Message-Id: <20260626122836.35856-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACX99p1cD5qtSBoFQ--.22740S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyxuFyruF48WF15Ww1kuFg_yoW8Cry8pF
	4xKr1jgr98ta17Xw1UZr12qFy5Gw1rJFy09r1Y9a43u3W5Jw1jvFW0grWv9rsrC3s2kFWS
	kr4Ykr98XFy5A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUeL05UU
	UUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwoKA2o+TTtnngABse
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65715-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[vulab@iscas.ac.cn,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:vulab@iscas.ac.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vulab@iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E9366CCFEC

dma_fence_get_stub() acquires an extra reference on the global stub
  fence, but this reference is never released on any execution path. The
  stub fence is filtered out inside dma_fence_unwrap_merge (already
  signaled), so the extra reference is never consumed. Both success and
  error paths fail to call dma_fence_put on the stub.

Cc: stable@vger.kernel.org
Fixes: 245a4a7b531c ("dma-buf: generalize dma_fence unwrap & merging v3")
Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
---
 drivers/dma-buf/st-dma-fence-unwrap.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 72ca632e3981..b9ed85570211 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -483,7 +483,7 @@ static int unwrap_merge_order(void *arg)
 
 static int unwrap_merge_complex(void *arg)
 {
-	struct dma_fence *fence, *f1, *f2, *f3, *f4, *f5;
+	struct dma_fence *fence, *f1, *f2, *f3, *f4, *f5, *stub;
 	struct dma_fence_unwrap iter;
 	int err = -ENOMEM;
 
@@ -508,10 +508,11 @@ static int unwrap_merge_complex(void *arg)
 	if (!f4)
 		goto error_put_f3;
 
+	stub = dma_fence_get_stub();
 	/* Signaled fences should be filtered, the two arrays merged. */
-	f5 = dma_fence_unwrap_merge(f3, f4, dma_fence_get_stub());
+	f5 = dma_fence_unwrap_merge(f3, f4, stub);
 	if (!f5)
-		goto error_put_f4;
+		goto error_put_stub;
 
 	err = 0;
 	dma_fence_unwrap_for_each(fence, &iter, f5) {
@@ -532,8 +533,10 @@ static int unwrap_merge_complex(void *arg)
 		err = -EINVAL;
 	}
 
+	dma_fence_put(stub);
 	dma_fence_put(f5);
-error_put_f4:
+error_put_stub:
+	dma_fence_put(stub);
 	dma_fence_put(f4);
 error_put_f3:
 	dma_fence_put(f3);
-- 
2.39.5 (Apple Git-154)


