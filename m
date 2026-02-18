Return-Path: <linux-media+bounces-53057-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO7CLuzzlWlTWwIAu9opvQ
	(envelope-from <linux-media+bounces-53057-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 18:16:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1E01582D8
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 18:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC216304D263
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 17:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A862F744C;
	Wed, 18 Feb 2026 17:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IUYGgHHC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p6Rij6Rj"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7200734106E
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434906; cv=none; b=LsUMcjq0Oar5icH2+GkybtQot5KKkpaKEtKm8DSL7T4rSbUwKY9lPiuFQ353ioYIO7ItP6A+0xu9T7IeWdFjuIOMmnk6Qz6IxmvyFq0tuLrt3VshN8OUNWcgBO07a+s7lSgWIhllu8N2eY9u4ITDzFqlQRbSCwlZyNqh12oWfSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434906; c=relaxed/simple;
	bh=tvITXHeVStwjhEWmH+cVpE7FG4BkG61UXXc8maGmGU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UyTqua6q9p7b7nZu0ojusZ2Iwva2hd73GLUSvuzz77qyDojcKRuf7SvT4MyxtUH1DDfBLo34YlI+MPZfpl6wY+u8phvRWabw+FLSaE7S7gHEM4qqeMlv3u+xbRrAqZuHjL6ThiQEVH2ua4UaW9/0A++cJHKY8r0Eyej9MBtNt48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IUYGgHHC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p6Rij6Rj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771434904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=42FtUK8DRzgqq7HgnylfgEXKEQfWmOW3Tw8CmlqQgJI=;
	b=IUYGgHHCy36LGtPIudFHAmrLD5P/hAFxd0EXCCklHj7xF80ceN6eobU5zsoBd96uBJZvqL
	LArhMJHbz4g3SJf1VIripW36Ju/vSLQGl5k3ZLSxdWOLX6SsC6slDl3vwTx5cVtVEbu+0R
	T/HBjaZbtyiwSKTvT6U87cXSLi0j5M4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-tUc8BUeyNxqp1XVWd57_rA-1; Wed, 18 Feb 2026 12:15:03 -0500
X-MC-Unique: tUc8BUeyNxqp1XVWd57_rA-1
X-Mimecast-MFC-AGG-ID: tUc8BUeyNxqp1XVWd57_rA_1771434903
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ca3ef536ddso31102185a.0
        for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 09:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771434903; x=1772039703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42FtUK8DRzgqq7HgnylfgEXKEQfWmOW3Tw8CmlqQgJI=;
        b=p6Rij6Rj2jON0x1NgxfH3ArJbWiXUBE9oXTTFfL7AvetIxmKRWmhdXHax/bYU0REcp
         ozvqmcLn90snRrK4BQvJVQUn/b4brv+hWMqQlFiOj/jrAKUBixXw/AIhfVQtAH3wyJld
         F97Z/6YpgfCRdMASGkvep05cRAOkRw8G/DkFmMY+qRShdtvct7znbhWjzF2SDfo9IIIr
         1FMLuM9R/zoXgTVq49j7zcVXqrrTdFD2TsJb8JFyAuuF3buOY5bBspgrgkzQ5crEHibI
         v/NlOdEhr2Ifw3qGHJWhkuqA0+Sc7jq6MT5InF/glNKtOXrA4kvt38hZWqVMq4WlK30p
         wdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771434903; x=1772039703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42FtUK8DRzgqq7HgnylfgEXKEQfWmOW3Tw8CmlqQgJI=;
        b=iIpG5CCfu1TfoeUNm4rjb8OETbO8GgIkX3SpZ4H2CdB32guv9j4cS/5wpFJiKCzhO7
         FhLijJKKpEi9JtpPzqs6VhaR++8fRgzF15WOqD63PaXZAEworYkcD4O4WgiNXvEh+jda
         1BaWCSPM79HXWugW939C6HTY9q+TplF/kahFaksc0465PMeYJTYf5c/7Z2fmieGLwZtS
         kPoaC/0l0qp9k5cTDXBFS01i56ql9m4dlzvHKe/CjIms0lsuM7Ko9q1+lMsDoVAqOysv
         lTbiAXhVcH9wROSrk7kqwzOV5/gci2Xl8a8UWpqZILLQL0TosIzAdq6qy8euVwJBb8h8
         Jdjw==
X-Gm-Message-State: AOJu0YyeO/d8tVW+QeCP6pyMM7An+7zGTSz49N+qzAK6PQOPLrmI4X+f
	UschjF7IcO+DMBq5mewdRQztS8HHfheajAJ9fXpwy3FTjW9P79RaYXrDaM0+wR+NN+g84Vs+8H4
	n4/N/3N9XtR+AIbRXxIlPT4KtLcWhZSNSE3oT6nWNFa31MNnhORkP0rZdPIgqN9GK
X-Gm-Gg: AZuq6aIHPvh16YZoROrfnHwo5FdDWsWbCb1PRgdLV6jw3UeXO0dPffKD2Q00rD0E9Lq
	4V0yke5XeSk5Dhb4+48PdkH8nnooTSwIPwpwVIOz0CsNG4dS/1FRv0VpjG/UdqKSwxE8D5mB8A4
	XuyIlC4FKuXJHsNNxV2OW7aUfalIP9f5guxiF1CkUvJGEZh+uZqlAUDmyhN1a7q5YUYidMNNlfK
	32Oul8uerXS4YYOqWuC50UDhrFfg+JHI8qZsKDIRmWGEm7SM/NXo3i5I0kRt58N9ibmR/xKxuoJ
	4uk767NaVp0NEvxcuGHeGxr/dKoM1cz1NCIITasKfzzp5hT6yLUzStud/E2Ds4Jmug8BM8IXugg
	g7W2e5+recnst9mgZscQecvePUAxzD1xaa3hNFuIdJ6I4fTmteds3BQ/Gjan9OMI=
X-Received: by 2002:a05:620a:294b:b0:8ca:2cf9:819c with SMTP id af79cd13be357-8cb423c2500mr1979541585a.40.1771434902644;
        Wed, 18 Feb 2026 09:15:02 -0800 (PST)
X-Received: by 2002:a05:620a:294b:b0:8ca:2cf9:819c with SMTP id af79cd13be357-8cb423c2500mr1979531285a.40.1771434901901;
        Wed, 18 Feb 2026 09:15:01 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net. [100.17.19.56])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb3a3e9adesm1523117985a.49.2026.02.18.09.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:15:00 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Wed, 18 Feb 2026 12:14:11 -0500
Subject: [PATCH v2 2/3] cma: Provide accessor to cma dmem region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-dmabuf-heap-cma-dmem-v2-2-b249886fb7b2@redhat.com>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
In-Reply-To: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
 linux-mm@kvack.org, Eric Chanudet <echanude@redhat.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53057-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[echanude@redhat.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F1E01582D8
X-Rspamd-Action: no action

From: Maxime Ripard <mripard@kernel.org>

Consumers of the CMA API will have to know which CMA region their device
allocate from in order for them to charge the memory allocation in the
right one.

Let's provide an accessor for that region.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 include/linux/cma.h | 9 +++++++++
 mm/cma.c            | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 62d9c1cf632652489ccd9e01bf1370f2b1f3c249..8ece66c35e9e640b98db4b24a9bd118ad07ec082 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -77,4 +77,13 @@ static inline bool cma_validate_zones(struct cma *cma)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+struct dmem_cgroup_region *cma_get_dmem_cgroup_region(struct cma *cma);
+#else /* CONFIG_CGROUP_DMEM */
+static inline struct dmem_cgroup_region *cma_get_dmem_cgroup_region(struct cma *cma)
+{
+	return NULL;
+}
+#endif /* CONFIG_CGROUP_DMEM */
+
 #endif
diff --git a/mm/cma.c b/mm/cma.c
index 78016647d512868cd87bc2c1a52dd2295acaaf01..c8b0de1da3e71bd6b8ab749ab58eb27446a1657e 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -53,6 +53,13 @@ const char *cma_get_name(const struct cma *cma)
 	return cma->name;
 }
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+struct dmem_cgroup_region *cma_get_dmem_cgroup_region(struct cma *cma)
+{
+	return cma->dmem_cgrp_region;
+}
+#endif /* CONFIG_CGROUP_DMEM */
+
 static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
 					     unsigned int align_order)
 {

-- 
2.52.0


