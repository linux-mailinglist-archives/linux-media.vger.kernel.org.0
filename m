Return-Path: <linux-media+bounces-64602-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YqnKLIjhKmr0ygMAu9opvQ
	(envelope-from <linux-media+bounces-64602-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 18:25:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48728673794
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 18:25:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lwvyUAN7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64602-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64602-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A658834DECD3
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 16:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A55A42B753;
	Thu, 11 Jun 2026 16:17:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7A1426D0C
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 16:17:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194640; cv=none; b=q0Jn2IYWPjUD5w5XrUhvNTL7xsLiyKnLX5x2pq+qZ5BMQweXBQGs2hF/BZ8dAlGfMrw3h4JTmmB0L3rxbMKhZ/oMAEAukwBdgRlEqmI295MabUU2IwUIGDS4dUEhdks5zrq5WhDzEUmqH938eoZWvFLVNF479KH/rP6tOExoAMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194640; c=relaxed/simple;
	bh=Y/qboSZQk/pC41EA2RsQPuVOhUQ7kJKEY1lMdCJdYLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PhvMB3lh5gA0fnfAQrlN4Z+Y2eNedrHCDilv8nYJK9g86kSvUMl5N1AYYG9wzKF9JGHg4s1693MyZVLmZr44WDTpfTBzuP8a5wIfi8pSl2dD31xtRFQqL/iAcxgWFxIJhlpkOAcVEUm+5hwWMfUOwJEaM3AI7yVC0vX6H1N7gws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwvyUAN7; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so155115ad.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 09:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194639; x=1781799439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAxTBIOEmfhpqt503+PoPJMs1ii7LUEnvcbZDbUBB0A=;
        b=lwvyUAN7SasG6aWtqB4lwRPoDjj3HfYo4wNbWyS7Fr8N68HYpy0zbUsx5AmT2B27wm
         3GNDM9eTyqv839k0WADb+oe3q1yvhaHmbOrAAibug2UsRCLoBWgJ7fmKwik7RbnAfCaZ
         usWpQVnaCog2NW9F8b2Np9P6b1Kfx5bayhhSZWCVWVWKcDeiftnegu5Q3q0JgjxZo8dE
         tEcvhS5tfqWpS0bR7tpJAlZk5QlEBF9HkeFbPFBSohYvlHV8WjNou+bVZVle7y6/lYh9
         Uyao6ezDpf88lSCGAHdnSYBIjn6mxodnVNbZIEOLZ/qXWcrwj2yFa2cxXU8QA0UskKT8
         cO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194639; x=1781799439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jAxTBIOEmfhpqt503+PoPJMs1ii7LUEnvcbZDbUBB0A=;
        b=EbsAFaulW9stNll/DBauT1AyUaETWXvgEuysu5TpnUFrO57tB15sw9bWQwoluAeAY1
         G1wU2hLAQDBw3upYPIazuPhSqT7yoQ35llCgenPLbWN1j6ihPSdt6mbg9ZVKObu0NzRk
         P5KXPOceLQD+w7FgtqF2y/Cn9WtVhKrOZbww/fiJzyiGLVzVuaXmorXXqiuYbAsQxKV6
         hwicw1do2M6sTRhv85MRnpxNd+A8QfZ3nWDdO2SI3yxsXGwVrCExyNjFB81XaWSvxlw9
         zKIhjO7gzAxr/EwVY3Brxtq+uh1fbJmvYrbKldcqO6i+dYuLnYsQy5bgfaKfKdOaCeYZ
         zu8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9vC/hhkyGdmxNH+WPuJ/XphSCTp1mA0ciFMdJapSiqPE4/nbHXf0GCvvDJQKuGvyOiwntgJYApiHMtNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIaBxJRgRPmscguXFz8ksUMjNB95UkZPSKjWdsbgOlu2iegHB
	TaDaJcFswfhUwE9vXc5aJrwTfNmYI2rOjuDtXY6y/Uls+AyNkkppvzNN
X-Gm-Gg: Acq92OF4UWzQOSlvllYtiXGUEuE7Lw0cqoOIzyfusceYXoE1DOR/pg42MJxOpPu9YPm
	olLuo6WqikZ+wzWgjtcvAwLnQvFYbBuKGxrdi4eerKm5iZZYbUQ/UsoNOe9z0D1B5tpGve6Dpfu
	ISCcP/XLseCzY9GHyfHpaXL8CTTVqN5BMGBBE8S1MSEq3yhtJhAnEI6B1J9pTUreRjgMo1XmeIV
	4FGSbv9+/zsqdLBEOraqPaWP+DKyI4RYgMrx5+3vZ2UhpKV2PH6j24//8peQ28KZoVmfEB0zeLQ
	SCOS3wKpa5HAXQ4CBYrceQgWKJVWCVekCc8xIWlDGJsoMeoe1AfQ3nJxc1WH8y+Fa0taDj4jb3O
	R+ihGDrFNS2+2w4qwg/sOTACk5bBDy09yBZTJIKVxf1KHJGz2l50kgmS8hS7wBfqVh0zLorYHZX
	8psxnTvZnFQ/jCJ66Pvb0=
X-Received: by 2002:a17:902:c404:b0:2bf:128d:f7ff with SMTP id d9443c01a7336-2c2f0932d65mr42009805ad.16.1781194638490;
        Thu, 11 Jun 2026 09:17:18 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:41::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm288573265ad.52.2026.06.11.09.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:17:18 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Thu, 11 Jun 2026 08:28:43 -0700
Subject: [PATCH net-next v2 2/4] udmabuf: emit one sg entry per pinned
 folio
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-tcpdm-large-niovs-v2-2-ee2bf15e7523@meta.com>
References: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
In-Reply-To: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com, 
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,amd.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64602-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:mid,meta.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48728673794

From: Bobby Eshleman <bobbyeshleman@meta.com>

get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
underlying folio was larger.

Instead, walk folios[] and emit one sg entry per folio. When folios
represent large pages (as is for MFD_HUGETLB), each sg entry is a large
page. Normal PAGE_SIZE sg tables are unchanged.

This is helpful for importers like net/core/devmem that expect dmabuf sg
entries to be size and length aligned. Prior to this patch udmabuf
handed over one PAGE_SIZE sg entry per page, so devmem only saw
PAGE_SIZE chunks regardless of the underlying folio size.

dma_map_sgtable() does not always merge contiguous pages for us, so we
do this internally before exporting.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 drivers/dma-buf/udmabuf.c | 52 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 94b8ecb892bb..9b751dd98b12 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -141,26 +141,68 @@ static void vunmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 	vm_unmap_ram(map->vaddr, ubuf->pagecount);
 }
 
+/* Return the number of contiguous pages backed by the folio at @i.
+ * A udmabuf may map only part of a folio, or reference the same folio
+ * in multiple non-contiguous runs, so folio_nr_pages() can't be used.
+ */
+static pgoff_t udmabuf_folio_nr_pages(struct udmabuf *ubuf, pgoff_t i)
+{
+	struct folio *f = ubuf->folios[i];
+	pgoff_t j;
+
+	for (j = 1; i + j < ubuf->pagecount; j++) {
+		if (ubuf->folios[i + j] != f)
+			break;
+		/* Same folio, but not a sequential offset within it. */
+		if (ubuf->offsets[i + j] != ubuf->offsets[i] + j * PAGE_SIZE)
+			break;
+	}
+	return j;
+}
+
+/* Count the contiguous folio runs in @ubuf, one sg entry per run.
+ *
+ * Coalescing folios into a single sg entry up front lets importers actually
+ * see large chunks. We can't rely on dma_map_sgtable() to do this for us as
+ * the dma_map_direct() path preserves the input scatterlist lengths verbatim.
+ */
+static unsigned int udmabuf_sg_nents(struct udmabuf *ubuf)
+{
+	unsigned int nents = 0;
+	pgoff_t i;
+
+	for (i = 0; i < ubuf->pagecount; i += udmabuf_folio_nr_pages(ubuf, i))
+		nents++;
+	return nents;
+}
+
 static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 				     enum dma_data_direction direction)
 {
 	struct udmabuf *ubuf = buf->priv;
-	struct sg_table *sg;
 	struct scatterlist *sgl;
-	unsigned int i = 0;
+	struct sg_table *sg;
+	pgoff_t i, run;
+	unsigned int nents;
 	int ret;
 
+	nents = udmabuf_sg_nents(ubuf);
+
 	sg = kzalloc_obj(*sg);
 	if (!sg)
 		return ERR_PTR(-ENOMEM);
 
-	ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
+	ret = sg_alloc_table(sg, nents, GFP_KERNEL);
 	if (ret < 0)
 		goto err_alloc;
 
-	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
-		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
+	sgl = sg->sgl;
+	for (i = 0; i < ubuf->pagecount; i += run) {
+		run = udmabuf_folio_nr_pages(ubuf, i);
+		sg_set_folio(sgl, ubuf->folios[i], run << PAGE_SHIFT,
 			     ubuf->offsets[i]);
+		sgl = sg_next(sgl);
+	}
 
 	ret = dma_map_sgtable(dev, sg, direction, 0);
 	if (ret < 0)

-- 
2.53.0-Meta


