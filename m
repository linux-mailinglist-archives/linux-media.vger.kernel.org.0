Return-Path: <linux-media+bounces-58778-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFU0MBIl32lcPQAAu9opvQ
	(envelope-from <linux-media+bounces-58778-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 07:41:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE3400886
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 07:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61CF83076DD4
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 05:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAE137F8A5;
	Wed, 15 Apr 2026 05:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGP16O99"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282752DB79E
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 05:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776231669; cv=none; b=cCWucWYVXKYlYLYOZUOZw156/Ayv/2ynIHQL+EbcdCIY0THav0cZLIgaT+akX2IsWG8WpvqUmVWKMWCEHVy3/31Pgm6/PuCydcssL6OWMdE//VBt1u5SkzkwD4qjTETmFvScUvUq7WI3zjylRyBXn9EWgcFHAoPkoSlkVdkdOPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776231669; c=relaxed/simple;
	bh=c609N/Vt3/7x+Wvxx3SUVMvhUU211Cy1u17j4oJEYWk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VWDvzRBRiCv9BkZ6CU2c8fH1afBJYskmJYCOj5ZcMqL6Z/EHyuA/owh6yXgK7AOKNY7dAI5qoKcZKhGWzZbGzh1zqKFij5fzKnjR0hJvsoova6yZNvwJjQQ75qzoOTWi80oSwDi3ot7I9n683Kq1FxOJjjMAvi8045Kkj8ru4cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGP16O99; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso29597535ad.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 22:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776231666; x=1776836466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tunBQlCi4LkJrjuRpI6SbvkfyuiW6qh1ym4H60f4yAo=;
        b=cGP16O99DFjSnyh6D2ZY6KZYTqQJDU0HCJfzbLhwzl29feJSIo45UduvWXN4J9Frwf
         GbYonFaIkwI8oYXbDGpOlxco6CGFgDHejjQSqcFyC04+dC8A0bzrhdMOMwZeHYSieA2r
         HkjyEvVuVf74rquoU+SDG+DOV9AApY1G7c4+vrMXGAjzFA7WnLsNDlJfGe90qKFuBi8c
         UyrMZZLjw99mvEIXMbzTf3j2WwSqDw1H3hpUnGCUH06LGnza88gti/RMbcQmcv0XMnAy
         q68MgfOZrQLH7KqJjAb0Z5vapwKu1f7fv18Lyfo5UKnrfRiBAvmBH6aab11EqwkpQmLl
         QlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776231666; x=1776836466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tunBQlCi4LkJrjuRpI6SbvkfyuiW6qh1ym4H60f4yAo=;
        b=ZhH75y1cQC9YUIJLbKrHXpXlY/rgGADoX5d/wXWFZmmW6rYZnQNeuBB8TQFhaCbW8M
         eROGCBe9dev7edeVb6c/84bOsc1wsP7zCudhRddgCa7eDI0swp1T3n0Tgp88y+1+H5Qr
         y6VxA7uK6BKJbsjl70VaXsDAXeQ/LarhtiDHCvvRJKwCcHHOPrw6lobPTpDf1cZXt6jg
         VkWOjUfHsePCf+Gmc4KVVbMVUfUqEDURQRDUhwt1toCrPIea9E2ih5lL00USpVCWORSV
         wvHgP/3gb/Kdi7XENUGbmEIwAFDUMNsYWXqmdHWMf1GwcJB4vQDfgIy8lUs/i81qLfZO
         FkRw==
X-Gm-Message-State: AOJu0YxLLqiO3t0CPDlU0AsiImk+pyiApH8vqD2pbWNKlBSVIUZbKkYc
	Eid3apE0ZDzrAtrCeHzCBVlmR0cyw4Thdg+9ZVlXdRUKPnenaEZyRe82
X-Gm-Gg: AeBDieuOtR1soZ0J4mH4mTiTmX3kVvlDdecvjxBh2gDqKLcpJZw+9EOvqAHP+y9SXaf
	KIdX2Hcb6+B7dKz0T0mcb5rNFsBebfWMkweU7XFSiATTFhDHwqs0fs4pQVf5riNL51Tpvh3CWwn
	rKXjREpOQsFeBb6AmXiVSClRR+vJ8TafjbQCciVijcIUb7eGILmpyIRVPnXET7M/uomxHCYXRCL
	UpuyB6CkC+tCe+vqNsOc7XFOUuvs0sLURToGeVtfYuhoaq891ZXQmweR4Q2xYit3vn98coOzDEX
	Urs2JEq/RGMsh7zJNFAFWMwdGCNaRLlXHYDIGy+AWuOUrRS+p0X0r+NY2GS8KvbzOKyufpf8JI9
	4DgwYtZKWjnHuWh5444suDJOLY/l9q+GtstOyjivVK0p+onjeyaDtVmmQgYNF42opm8I+XrQ0BA
	54jMQ7/pJst4jivPqUHlxvskHfa+h9rrr562yDuad41Nw=
X-Received: by 2002:a17:902:ea05:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2b45f961f07mr100131135ad.5.1776231666456;
        Tue, 14 Apr 2026 22:41:06 -0700 (PDT)
Received: from xiao.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4780f0258sm7973305ad.5.2026.04.14.22.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 22:41:05 -0700 (PDT)
From: Xiang Gao <gxxa03070307@gmail.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Xiang Gao <gaoxiang17@xiaomi.com>
Subject: [PATCH] dma-buf: fix stale @lock references in struct dma_buf documentation
Date: Wed, 15 Apr 2026 13:41:01 +0800
Message-Id: <20260415054101.535520-1-gxxa03070307@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58778-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gxxa03070307@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,xiaomi.com:email]
X-Rspamd-Queue-Id: 3BEE3400886
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Xiang Gao <gaoxiang17@xiaomi.com>

The kernel-doc comments for vmapping_counter and vmap_ptr in struct
dma_buf reference "@lock" as the protecting lock, but struct dma_buf
no longer has a "lock" member. The mutex was removed in favor of using
the dma_resv lock exclusively. The implementation correctly uses
dma_resv_assert_held(dmabuf->resv) in dma_buf_vmap() and
dma_buf_vunmap(), so update the documentation to reference @resv
instead.

Signed-off-by: gaoxiang17 <gaoxiang17@xiaomi.com>
---
 include/linux/dma-buf.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 133b9e637b55..ef6d93fd7a2c 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -322,13 +322,13 @@ struct dma_buf {
 	 * @vmapping_counter:
 	 *
 	 * Used internally to refcnt the vmaps returned by dma_buf_vmap().
-	 * Protected by @lock.
+	 * Protected by @resv.
 	 */
 	unsigned vmapping_counter;
 
 	/**
 	 * @vmap_ptr:
-	 * The current vmap ptr if @vmapping_counter > 0. Protected by @lock.
+	 * The current vmap ptr if @vmapping_counter > 0. Protected by @resv.
 	 */
 	struct iosys_map vmap_ptr;
 
-- 
2.34.1


