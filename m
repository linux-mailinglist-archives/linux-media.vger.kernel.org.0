Return-Path: <linux-media+bounces-64306-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FN6jMF0eKGoX+QIAu9opvQ
	(envelope-from <linux-media+bounces-64306-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 16:08:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5B7660DA5
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 16:08:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gnlehbGG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64306-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64306-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB851307839D
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 13:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DF217C203;
	Tue,  9 Jun 2026 13:59:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C310D4183C8
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 13:59:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781013585; cv=none; b=Ut0bECi8FECG0USriQZWf8MVTPkw4pKxSgQdz5IlI9VvgeezocnQp99xAprSQo2T8BSykTvx2KRHFYB/5bCSVOx7eRCDt8uG1VJQy7wF9JUyRWHgi/3FfJmMjojvRWNTmISfmcDYUDGN9o6h9u6jh5TpBW9isG2SgxdQBUplc3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781013585; c=relaxed/simple;
	bh=iZLbXg2n+E4YpnmuM4Z7SSoqx2KboJzXMu5oQmWPtKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UlObCcbmR+8GrtIpMXcDBOM1xOLxzti+BUS0VxF0dOpNo03HEgF+OmGz9fC7vIwYdylo9EyPQ5H/loK1nCm9ySBG7bYpE2KzrjUNuAlKIOMSYOVdLC9/FWb/0g1JQdEiRtkqVpgEw5mkhqAgSEGh+QWtXWb9ZupSh2Ha69fagkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnlehbGG; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46019edc13dso2715233f8f.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 06:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781013582; x=1781618382; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lCCMGdSYRe1FraxjZBzJ24lH0mO4Ml3X3ulO1yg3ewI=;
        b=gnlehbGGM1lV+pA46qiVIqWmXFMP5s2prvNjQYbXh/VjcGdLeI48tPppvN4jyhbhFS
         s7uF19VT6gf1y2uDg1qJxHa1PZr/H8dGMr7D+8cV/VajfjBhz0qqjPzd1J7E2UG9w0YM
         htI6CVOybN6CHwtWv6jSXXmkR1NOeCrQ20/k9UP+qttoKgApLIrP2t4D15bC2MU2A0sw
         QeUILbOEMfh7njd1BD8+8xLVQBMrcHDEQx+zRdWQN44PxqIg9AeHuTJME63iR9Uj7JVE
         ntuiX/JPfDtHHmsFx4sa7eDfKSc5lH42OlVa/lLFFi5JxiGRGuaV0Q63Ojd07PCMaRvr
         GOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781013582; x=1781618382;
        h=content-transfer-encoding:reply-to:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lCCMGdSYRe1FraxjZBzJ24lH0mO4Ml3X3ulO1yg3ewI=;
        b=aLXyQNosYkZ2gkIy0/SUbeQHvn/YPeN/GctjdjQNCgbsVRHMgC2EJIDXjk0bAatfdw
         5xsDmIzUqQaiWFB+rNd870n0Y7qSLFEAeDgcgDLUVah8Yi3O/sj+VlqPu5EpI0EB4PQf
         0TnHQ5HDOQUgwBXYRaPus/u3BHZny/KDdJTtkt0itsdrLHEnNBch/gUcMOAJkaH4tox5
         6Xl1CjpJDrbj2oagK62oGhQfOvZZAeHb0hv+QH3nTW1hXJ6SW0aR84m/NtC1qg6HoMk/
         CK85RqEDfCd2cZzAX0xopyBmT4a9+XR6IIp8sVMViZwXpkZoNBaizoH3QMxcXrfbkUOX
         2mXg==
X-Gm-Message-State: AOJu0YwOaTX2Nx24Ymoly3WXkbMPmt1EuW7TPaCSzxzWTBIyl4pdG1xL
	MMkSKCtTVaxLtnpQUPaLTDb+zyE28OswLNd545JP03b1tzNsN91+GWIe
X-Gm-Gg: Acq92OFPjFyLgU1b8VAysxnmBpyVkQExAUN31Y4VRdPsln/FLviPrzTIyynO0ZSPCn5
	e2b+oM2bXXWoz6UjdHTUVG1+X5Gwn/oqKSx0EbxzyKI1RiTdG2ejzWq/qr5CA7nMJohVm0S4lWr
	xZ25ckcoj/w21Lg8F84kq7QB/HmZcq1jgB3hk/9HatVDsRnlDa9nztdnv+lkfBSlrbFNbJXDd8C
	qivgSY1N6caVpfICgKHcsVP6syuSQ2bPM1RAUBTj8E5Cd8rofQeYxnFr1yp9ds8hbM2SflJlEo+
	C4UiIYrWxM8w60H48fxraMN98R8W7Ftrp0TgKFY6A/gn8Qt3Qj+orE8HgIOK7VyymYoLbJ6h9c2
	ch1VEHDr40Wx+vecMVDczYJJ0evMSteMq6QmaaguJG/fjejYRAfuxaJKxJ/f/Z34lU2jVPL6eWP
	kpJ9d1NG1P5v5zYifqM/uGN7/mUPY6DshIVjzYIJUi4froF6g=
X-Received: by 2002:a05:600c:34c9:b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490c25b3549mr347976035e9.7.1781013581993;
        Tue, 09 Jun 2026 06:59:41 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1548:4e00:defa:44a8:8592:150b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm537658365e9.11.2026.06.09.06.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:59:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: enable sg_table wrapping on CONFIG_DEBUG
Date: Tue,  9 Jun 2026 15:59:39 +0200
Message-ID: <20260609135939.2606-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64306-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:replyto,amd.com:email,amd.com:mid];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	HAS_REPLYTO(0.00)[christian.koenig@amd.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B5B7660DA5

Importers notoriously abused the struct page pointers from the sg_table the
DMA-buf exporter provides. This has created numerous problems ranging from
crashes over random memory corruption to security issues.

To find such bad importers DMA-buf already has a functionality to wrap the
sg_table and set the page pointers to NULL enabled under CONFIG_DMABUF_DEBUG.

Change that to just CONFIG_DEBUG to catch even more importers doing something
nasty.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 71f37544a5c6..d5dfa82ed2dd 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -857,7 +857,7 @@ static int dma_buf_wrap_sg_table(struct sg_table **sg_table)
 	struct dma_buf_sg_table_wrapper *to;
 	int i, ret;
 
-	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
+	if (!IS_ENABLED(CONFIG_DEBUG))
 		return 0;
 
 	/*
@@ -896,7 +896,7 @@ static void dma_buf_unwrap_sg_table(struct sg_table **sg_table)
 {
 	struct dma_buf_sg_table_wrapper *copy;
 
-	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
+	if (!IS_ENABLED(CONFIG_DEBUG))
 		return;
 
 	copy = container_of(*sg_table, typeof(*copy), wrapper);
-- 
2.43.0


