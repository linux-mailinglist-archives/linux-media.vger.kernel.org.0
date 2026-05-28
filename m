Return-Path: <linux-media+bounces-62977-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAxOCUKWGGoMlQgAu9opvQ
	(envelope-from <linux-media+bounces-62977-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 21:23:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7575C5F705B
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 21:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CEA83137243
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 19:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731FA3FF1B4;
	Thu, 28 May 2026 19:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WBK5gB3g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com [209.85.160.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB03FD12B
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 19:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779995823; cv=none; b=c513JwNZPXoSN948f87j49vLw0ckOc1Yv4LWbWnoPki47ITxMlzlS3iHKq+L5bTGncuGtoIEAtwxdkFDrPcjDMPWHCyVwuYVkAPbYtJAF/gjg/yHrztlVeQhlSLTLz/QpB8jeD/hv+uyZJy9OTiu6QVFkrrKOMOXxwsbMrOm5B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779995823; c=relaxed/simple;
	bh=7nsiCepyNb7uhyn7v++Qgh6kBtGu5mTdr2I4JeUzJwg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JOBEOzeG2BchtIGIIHHtUY4KdLYPzqxj2rQiFWwOiusF8oy1wgXlFIEKpkVI/oG5X11w8zCxmhpL3OQhMRUl4u/hWGGexS7jijmfx/CqouUX+RN1OWHCzojpli9MLibsHEUSb4iPMIdVJ8FBLjfkG8e941P0Z4hXFXOl6GdSOXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xuehaohu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WBK5gB3g; arc=none smtp.client-ip=209.85.160.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xuehaohu.bounces.google.com
Received: by mail-qt1-f202.google.com with SMTP id d75a77b69052e-516d51ffb59so61990401cf.3
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 12:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779995821; x=1780600621; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ruTGaXcXn18lBWCvQSOsc+J+nN/WfLLq3tF9jPQMx3w=;
        b=WBK5gB3gz0knR7r1QSCw2Hgqe4P+flmyYn+HX4a6wgABeJudGCp9uiKxyM2G6QVCJH
         OWK91reZahY3emKrdytKrTEl2mImWVBoLoqfbE4FNkNZsCkofLk8F+FjUPga8PgsPSMq
         hcTtAlTCzVgPEBU8wynmFWad7DRL4ei5NYMpUk0uYMNN/2klnittp4erQaQ4iRJwyrSF
         Is5b+0ZfN1A7Yj8ETSjEMbGLN/9XW24dJOgbUOxk0t0jYJqjczWRS1p9XvGkHQQ6GoBE
         rIvujSOt8964PhapkcSA65LXa7HrGWmJ1j1z7/XMoqsspDEx+mUNjURsp0AzcPRyCNtO
         BCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779995821; x=1780600621;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruTGaXcXn18lBWCvQSOsc+J+nN/WfLLq3tF9jPQMx3w=;
        b=s9nppHkQxRhQBy6E667STFhyhZA81Ue9ZvdZwIXuWszuK3RG6isTUb9FELj5Pxt8GR
         gM4HT0ZvPW6DwYiroWMZn8o3LUbrSn/l478T/d+G7vJqhodR0CXD4dltctKGFaiJTzoY
         AIbjbvs3TZyf2APiDfBrlddEz24bn8jyfkQVSOfr+Xe8aMO5/cA02IqZjW5evuxjkXbM
         uO3XHO1k9I0y3OVSk/8JDRmVr9hkHgMIyjCnbcWC2VsUzOjmvRiXrqXEcTLeg/J6zU91
         p9UO5vLnsApHjxgNqd9RvgmGLe+NrDZPKlRxBAw3QJKDGnihQFH1RRopok8h3EhjBGqK
         cWHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dvPLFcq2HB7GjlTadPNF55c01zDDQ4osh+goPCSlUPhH9TGau/ZwP69846WqRK2MxkXv49jeA8Yr0rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnMc8pY4FMzGEm0Co3nSgX/AOeBoFVDrByXRm0tPxiEBDdYBm9
	JHJEe7vlClNnUZzj1QX6C0F6mlE7vi5wdjk8XW3qVTU97BDWWolpoAeWhJUX8UZNWPPVTBUJ7NI
	sKiXf+Irsgnyf
X-Received: from qtlo20.prod.google.com ([2002:ac8:4294:0:b0:50f:d8f5:705f])
 (user=xuehaohu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:4c8c:b0:516:e8aa:271 with SMTP id d75a77b69052e-5172cb95a12mr2327291cf.26.1779995821046;
 Thu, 28 May 2026 12:17:01 -0700 (PDT)
Date: Thu, 28 May 2026 19:16:58 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.929.g9b7fa37559-goog
Message-ID: <20260528191658.2506362-1-xuehaohu@google.com>
Subject: [PATCH v4] dma-buf: Fix silent overflow for phys vec to sgt
From: David Hu <xuehaohu@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, jmoroni@google.com, praan@google.com, 
	David Hu <xuehaohu@google.com>, stable@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62977-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7575C5F705B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In case MMIO size is bigger than 4G and peer2peer DMA goes
through host bridge, we trigger a code path that assigns the
total linked IOVA (which is greater than 4G) to mapped_len.

Previously, `mapped_len` was declared as 32-bit `unsigned int`.
When accumulating `size_t` lengths, this leads to a silent wrap-around.
This truncation causes truncated lengths to be passed to functions
like `fill_sg_entry()`.

Fix this by changing `mapped_len` to `size_t` (64-bit). While
at it, fix similar potential overflow issues in `calc_sg_nents`
by using `size_t` for `nents` and checking against `UINT_MAX`
and using `unsigned int` for the loop iterator in `fill_sg_entry`
to match.

Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
Cc: stable@vger.kernel.org
Cc: iommu@lists.linux.dev
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: David Hu <xuehaohu@google.com>
---
Changes in v4:
 - Added WARN_ON_ONCE() to the nents overflow check to prevent silent
   failures (Claude Bot).

Changes in v3:
 - Removed leftover sentence fragment from the commit message.
 - Kept `nents = 0` initialization (previously stated as removed in the
   v2 changelog) as it is strictly required for the `+=` accumulation
   loop in `calc_sg_nents()`.

Changes in v2:
 - Fixed 'IVOA' -> 'IOVA' typo and expanded commit message (Claude Bot).
 - Added Reverse Xmas tree formatting (Pranjal).
 - Folded in extra bounds checking for calc_sg_nents() (Pranjal).
 - Folded in type consistency fix for fill_sg_entry() (Pranjal).

 drivers/dma-buf/dma-buf-mapping.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 794acff2546a..1aabc0ee70bb 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -10,7 +10,7 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 					 dma_addr_t addr)
 {
 	unsigned int len, nents;
-	int i;
+	unsigned int i;
 
 	nents = DIV_ROUND_UP(length, UINT_MAX);
 	for (i = 0; i < nents; i++) {
@@ -36,7 +36,7 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
 				  struct phys_vec *phys_vec, size_t nr_ranges,
 				  size_t size)
 {
-	unsigned int nents = 0;
+	size_t nents = 0;
 	size_t i;
 
 	if (!state || !dma_use_iova(state)) {
@@ -51,6 +51,9 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
 		nents = DIV_ROUND_UP(size, UINT_MAX);
 	}
 
+	if (WARN_ON_ONCE(nents > UINT_MAX))
+		return 0;
+
 	return nents;
 }
 
@@ -95,9 +98,10 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 					 size_t nr_ranges, size_t size,
 					 enum dma_data_direction dir)
 {
-	unsigned int nents, mapped_len = 0;
 	struct dma_buf_dma *dma;
 	struct scatterlist *sgl;
+	size_t mapped_len = 0;
+	unsigned int nents;
 	dma_addr_t addr;
 	size_t i;
 	int ret;
-- 
2.54.0.929.g9b7fa37559-goog


