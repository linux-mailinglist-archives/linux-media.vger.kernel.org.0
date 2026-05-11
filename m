Return-Path: <linux-media+bounces-61175-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA96MVpNAmpaqQEAu9opvQ
	(envelope-from <linux-media+bounces-61175-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 23:42:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6664151673B
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 23:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52C41302FEBA
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 21:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2514D98E6;
	Mon, 11 May 2026 21:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aIhcFWiq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com [209.85.219.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7D43644C6
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 21:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535767; cv=none; b=Qpd+bCMJfBO7M3+0e9xNmswxOSA12VdZ9ko+NJVCPjQsNo/qAwS5CugjoVhiL8siJxpAa7yUo673DOtaCl/x8wP1FaArhzTuQFyPgCBnd1yff3UKoMPwXjnlQ/cb7BliCRixOuEWbMrT9Pc7+uBzApzko3pNGI/W8APbY1Zxwak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535767; c=relaxed/simple;
	bh=+wmBy+cV4mdDMvDOMiL3HVFinoZDxxUvO7PUL14ZxeQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=alNGnqA2RrXUA/SvvKSITAQzbolYy/fl8YmIsOLoePgBRsAbstLUA5CeDbl5axogh+A1uRsCHHQEB//UcqpFVIaKkKz5OYXCnfnvKnkmecTG1gtI+CGETC7DCRcWGKhldlPbwpOT4iiYU05N97/MVdzRwTGUwqt8aNCJM4ssQss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xuehaohu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aIhcFWiq; arc=none smtp.client-ip=209.85.219.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xuehaohu.bounces.google.com
Received: by mail-qv1-f74.google.com with SMTP id 6a1803df08f44-8aca4660827so128399226d6.3
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 14:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778535765; x=1779140565; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yA1gek3HR3At3Q9DFaDVVLNqwF2oJxAWcK0srTpOdyw=;
        b=aIhcFWiqnvwtXtJSFx3Nf/iEt8ynEvnkcRV8yLWHi9yT0mDfKKE9DelAlokcRdlujy
         Nelv/i4sE0pxYPD3svRXysljJEUbI80MlQ0z/FX2mBH+rYZxN4cOYn+7vZt/SJr5hB/6
         e674FTmdJx6YjeGQZ4dA6FWP36kv9VoItNpHfGSL0qnaW0eeSYWFO/c1I5APrg6Uc2QO
         ZFuAYuYCV81SA/cMMDRj59yAjmJhhCsEGjn/yj/Xff2P41JC/8vXX4KMSnGJ7op7dc+B
         qgOmXqf6G3ypLsukY4pKhT0OGjqXZTd7KRZLJkaAn9da2h/pYqPF2/js2IB0sehS0NrK
         Y4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778535765; x=1779140565;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yA1gek3HR3At3Q9DFaDVVLNqwF2oJxAWcK0srTpOdyw=;
        b=Mz9ca/eW0opyCvciSWhQZwyTOq3ojhtP5rC3MdhpYZH+TPiuHJf/ecduHhwb/YeY3d
         VeWuDeYLIk9yTHrXgJ1k4geKrWLg5VUXe/P8Bgm892ke6HILTneIhh56ADIkygQmG8WO
         AmwSJhc435KLUY8cz/DPEutVg/y0FdZ/yox1FGOFkaiEXfSOPKgBjDHgDeI7vEbDdbBi
         VFj6Gs41PYWmbb+IqObQK3GMMZriZrIKVniIKxv7YNUJ2TwPQ/av9bsBgY01zKiQnD8d
         9nV27N2KFS9lDFbCm2DxoVxe1OSOFpUtMHwX1T3TOvP18BSPGiidDETkSiIo1EoMUJJ3
         SHsQ==
X-Forwarded-Encrypted: i=1; AFNElJ88L+V06S6NbzVGV/UK2Jz5pS1o5PheH5Mi09ENN4KL+Dg/8GFpbl9ux/HVHU8pbSvmjMX+E02BG+BreA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz63xqFLpaFyRZzb8/IUerguY4m/dYaLNC3tbeThrhTOwghb26s
	CFHND1WJGD1y2Z5fqMAJcMM7yVvT4ZLrxhjjGWy/NJ20xScWvmijq9T/Ccw/ceS68U1vAcgdQvA
	ZkK5BT8uuU4oD
X-Received: from qvbkd27.prod.google.com ([2002:a05:6214:401b:b0:8a2:c383:22e2])
 (user=xuehaohu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:3f81:b0:89f:4a69:44b9 with SMTP id 6a1803df08f44-8c663f6deb2mr7250256d6.40.1778535765277;
 Mon, 11 May 2026 14:42:45 -0700 (PDT)
Date: Mon, 11 May 2026 21:42:43 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511214243.349487-1-xuehaohu@google.com>
Subject: [PATCH] dma-buf: Fix silent overflow for phys vec to sgt
From: David Hu <xuehaohu@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, jmoroni@google.com, 
	David Hu <xuehaohu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6664151673B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61175-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

In case MMIO size is bigger than 4G, and peer2peer
dma goes through host bridge, we trigger the code
path to assign total linked IVOA, greater than 4G
to mapped_len, and leading to a silent overflow

Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
Signed-off-by: David Hu <xuehaohu@google.com>
---
 drivers/dma-buf/dma-buf-mapping.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 794acff2546a..658064140357 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -95,7 +95,8 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 					 size_t nr_ranges, size_t size,
 					 enum dma_data_direction dir)
 {
-	unsigned int nents, mapped_len = 0;
+	unsigned int nents = 0;
+	size_t mapped_len = 0;
 	struct dma_buf_dma *dma;
 	struct scatterlist *sgl;
 	dma_addr_t addr;
-- 
2.54.0.563.g4f69b47b94-goog


