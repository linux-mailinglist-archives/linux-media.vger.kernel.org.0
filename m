Return-Path: <linux-media+bounces-58035-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHCGMMOGz2mwwwYAu9opvQ
	(envelope-from <linux-media+bounces-58035-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 11:22:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57239392B85
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 11:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21A2F305432C
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 09:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BBE3644BE;
	Fri,  3 Apr 2026 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZOfZycT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46645352F87;
	Fri,  3 Apr 2026 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208034; cv=none; b=ZRyRMMTFELvNADVzLUAIanAlAzd9HpH9NT5xHCnPLs9o9JXeDAYZ68xHm25CFg3UfWrfVpiXcuq0zDOZqjedBpIqSHUAz9rx1Zeb+C/0c3hDidq+loLEvTiinDwKK6xU8eNrSw+VWXc8llgoNlkugrJyb+AxTikWgYuT2XUTUC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208034; c=relaxed/simple;
	bh=6yQ3vTenqXPoi+0PWTGukMJaYEPSz03tyljhBa6IByM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GBI3ejqxZkqUjHZ8jS1dz7tb3XgYeElTtQDHcZl+lAI2VFFy3PMh2j555YK7Qle2yte/eIWPJ1lTyuenmp4LobP5FBybLWtZEBD4utv0PSV2HipQO3LtSvgoOlnmmFOK0IoM+zozHu+lyeOt1Nn2qeS3fcAXyBTQ30EvL57q4zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZOfZycT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AB8C4CEF7;
	Fri,  3 Apr 2026 09:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775208033;
	bh=6yQ3vTenqXPoi+0PWTGukMJaYEPSz03tyljhBa6IByM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dZOfZycTXUM3i6iopk6sUfFHNU0/Xqwy/r8HbSQ7CGZvidHZ1Z3vrFRo3K4SCpK22
	 /we6sw2gldNdAVF1lwjBWvDa/GZf/pmNvP3tcFcJMJyu4PI2NmNxfKygepsu5Nlmyd
	 r29qFVbXkGyAWEA6ZQ+r9fqoscaZpyJhPPCBlbpdSKJyk6r/b9EkC7sfyiqKzbGSNp
	 3dMqIBR3UB5nRPZt2U4fQ9PRrKKaUmpHTmfdJ38ZmKRO9U+i3l4nsJXmLqU6M7+UGY
	 CC7h3IPn5r9Dyfjvo7CUEJ1Vg8+EW13P18cgEcIxwbjf+jI/Ihh93Zr9NHd3mOyaXO
	 kWrJy7LRxAjyQ==
From: Barry Song <baohua@kernel.org>
To: urezki@gmail.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	dri-devel@lists.freedesktop.org,
	jstultz@google.com,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mm@kvack.org,
	mripard@kernel.org,
	sumit.semwal@linaro.org,
	xueyuan.chen21@gmail.com
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap() whenever possible
Date: Fri,  3 Apr 2026 17:20:28 +0800
Message-Id: <20260403092028.61257-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <aVvmxGUp2l0Tavwb@milan>
References: <aVvmxGUp2l0Tavwb@milan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,kernel.org,lists.freedesktop.org,google.com,lists.linaro.org,vger.kernel.org,kvack.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58035-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baohua@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 57239392B85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> I think so, at least the place:
> 
> <snip>
> [    2.959030] Oops: Oops: 0000 [#66] SMP NOPTI
> [    2.960004] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.18.0+ #220 PREEMPT(none)
> [    2.961781] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [    2.963870] BUG: unable to handle page fault for address: ffffffff3fd68118
> [    2.965383] #PF: supervisor read access in kernel mode
> [    2.966532] #PF: error_code(0x0000) - not-present page
> [    2.967682] BAD
> <snip>
> 
> but it is broken for sure:

> i += 1U << shift - "i" is an index in the page array.
> For example if order-0 you jump 4096 indices ahead.

> Should be: i += 1U << (shift - PAGE_SHIFT)

You’re right! And sorry for the slow response—it’s been
three months since the last discussion.

> vmap_page_range() does flushing and it has instrumented KMSAN inside.
> We should follow same semantic. Also it uses ioremap_max_page_shift as
> maximum page shift policy.

Not quite sure if vmap() should follow ioremap()’s
ioremap_max_page_shift. If needed, it shouldn’t be
difficult to do so.

I have a version queued for testing (Xueyuan is working
hard on it). Meanwhile, if you have any comments, please
feel free to share.

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 57eae99d9909..8d449e78a07a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3513,6 +3513,60 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
+static inline int get_vmap_batch_order(struct page **pages,
+		unsigned int max_steps, unsigned int idx)
+{
+	unsigned int nr_pages;
+
+	if (ioremap_max_page_shift == PAGE_SHIFT)
+		return 0;
+
+	nr_pages = compound_nr(pages[idx]);
+	if (nr_pages == 1 || max_steps < nr_pages)
+		return 0;
+
+	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
+		return compound_order(pages[idx]);
+	return 0;
+}
+#else
+static inline int get_vmap_batch_order(struct page **pages,
+		unsigned int max_steps, unsigned int idx)
+{
+	return 0;
+}
+#endif
+
+static int vmap_contig_pages_range(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages)
+{
+	unsigned int count = (end - addr) >> PAGE_SHIFT;
+	int err;
+
+	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
+						PAGE_SHIFT, GFP_KERNEL);
+	if (err)
+		goto out;
+
+	for (unsigned int i = 0; i < count; ) {
+		unsigned int shift = PAGE_SHIFT;
+
+		shift += get_vmap_batch_order(pages, count - i, i);
+		err = vmap_range_noflush(addr, addr + (1UL << shift),
+				page_to_phys(pages[i]), prot, shift);
+		if (err)
+			goto out;
+
+		addr += 1UL  << shift;
+		i += 1U << (shift - PAGE_SHIFT);
+	}
+
+out:
+	flush_cache_vmap(addr, end);
+	return err;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3556,8 +3610,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	addr = (unsigned long)area->addr;
-	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
+	if (vmap_contig_pages_range(addr, addr + size, pgprot_nx(prot),
+				pages) < 0) {
 		vunmap(area->addr);
 		return NULL;
 	}
-- 
2.39.3 (Apple Git-146)

