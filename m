Return-Path: <linux-media+bounces-53055-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMbgE5zzlWlTWwIAu9opvQ
	(envelope-from <linux-media+bounces-53055-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 18:15:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF3158291
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 18:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD16A3004427
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 17:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5541E2FB97A;
	Wed, 18 Feb 2026 17:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YSMjRkq7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BfEdJX0U"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF6334405F
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 17:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434902; cv=none; b=YepO01UBzYKqMInusbfxPYkpE+K9V6Pu/aljVx6te+Xa71xvkPxKFaRJGKXSjycyvHy2C7w4ZJb9iTO3KkKikACOXJLD3TqZPGCUTtyAfDtQF1Sr3Qqr5v8saXEtvRVTlHU4/t5PYL8mqVE9cqQoiOaHu5PdXoRKMpe+fUTdVGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434902; c=relaxed/simple;
	bh=T7TaCoFwQTn7ya9dyYewtIMUd/ANi6geFOdBNfrVckg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YfZXZjrRrK5YR7y8u1B50byidS6Kvyt6lao/oWz+QEDHyGUqWl0VX44maL/7CR7G280tvG14sqp26oI4KXqGkuulrD1SZw67N3gluhtCMxAs2L9RlAeo3VOZuyuXKGQdJrY2XrC+vZkE1koaeATZgVwEInyOZUtFFJnxBdd5Coc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YSMjRkq7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BfEdJX0U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771434900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xm1Nmfmv6nKrRksdRVhDRN/vEcg8hHt9kLWtxxaZhMo=;
	b=YSMjRkq7hUm60KdJ5Pu5kIGYhCT/81QFixY/3Xc8W7niG/KiP6wMDEy0mr6HOODgsDp7Q+
	fuFJg0YY7jU1HZUjJvyLhsFtXSmZz5rC/R8tX74w0StopzH/BO0I4rRJp3GojUYFpoDTx9
	GlT157no/AISC/zJm9Pu5lFa0wXWA+g=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-qpmuhP4eOXqrqWIW-sXasg-1; Wed, 18 Feb 2026 12:14:59 -0500
X-MC-Unique: qpmuhP4eOXqrqWIW-sXasg-1
X-Mimecast-MFC-AGG-ID: qpmuhP4eOXqrqWIW-sXasg_1771434898
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-894a861fd7cso1195656d6.3
        for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 09:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771434898; x=1772039698; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xm1Nmfmv6nKrRksdRVhDRN/vEcg8hHt9kLWtxxaZhMo=;
        b=BfEdJX0Ulebo/wGENUAMBX/nJmZAXhNlbQ1zAZwqAVX6Fvh5LcT5O3Jpnbr5HNoF+i
         M3X26K9nJP7mo/DokcVdLt2xHZL6X8jNfnu625EOFW3AucYRusFm5jgPgVShiAvO9jKC
         2RFFP491F75Qs3s/F61w61qrjC250sm0ba9mcCsHg5q1QnGvB+YB2a4othHDKW4iHpHb
         zqpW7rz9wIpA9TKE7XC9D9nlwyMwv2MdofVKBp/shIUWbyurmX6P4MgKF6IWAS8TPi8C
         P0nGfkn8PxaapMLYWojQY6QuKi6AxiSKXDi1hJQLXSsyaPvC2xpxrAnC582ml4NYw4IL
         pKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771434898; x=1772039698;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xm1Nmfmv6nKrRksdRVhDRN/vEcg8hHt9kLWtxxaZhMo=;
        b=HkSLwdyGVN2pCWLmFS3RJm29RIHuYEr/ZT/ONBcgUN8BY6RV4c5g5NrjJbivzr6Oqm
         4Z6ckZisNk5nc60ON/vpWr/bsYPWEfpqXX6ZOYk6JeINlSsyUl2K8ubxSQ9Qv+a9zZ5Q
         zqkSprLZVwRzRApYdubDeIH94wG6N2bMqGViUfH8dFQJXa4jqLOlExYQktGGxBY7PwzH
         NS/ofxqg23QHkHIqWOypOCEN9DAQkeStqOu24sXkjRcCu5WBGETVaQKImwzfL+ynoCS5
         zJfbORQ1jpeAT/W3qOc6wNq+H1LYqFaj8W2t1C/V8FBGRBc5eISCCa7xLny7KBxJB/ep
         C5yw==
X-Gm-Message-State: AOJu0YwQhfdStIWqGkCMEpR+JECm0HFSEFxqEQtsWzVK6kgeWmXJlOJb
	dnlFCmqLiqWL4tBZXTLP8N1MLNEBiAeg86dFhMAgAjpKyKzdeKE1ez7gQlTrgFqn6vx4My8I3lF
	duJO74MqokoLzC47kX9rCkp6hPPefwahTv7NYpCDfihMOc4YxxE5QX7JSgqKiDQwJ
X-Gm-Gg: AZuq6aIlRBqtrPPAh385fgy+iZZOdOZ5vaj/q6TdebnfgUr/vYxbD+mHwomhLrX91Ez
	+rDhq8NMDiRgygFdoWPLTnTXGkNWOSf7R1lxWJQx36hjWjR5CVZJRXyFgl+oKsC6mY9i/1YOy0C
	91CIvExUIm1wfm8fbHThpUBJeT0icN+j7b63f2j8c4/K5OHqSuIdiF0+j1SRiCSaNIpCsnss/SJ
	gr2kBwvT5JrJhC6/L4HJ0byrzOsxmYBreybpNnLJ6TJ8/5UVn6IkLac9LqAhhJaeCZ0BTUZu44v
	DodcXyq2BSRZtrRKuNAO3U5f7KQ3CKYxr0WzTNz0KaNvhq7HpUpzCAZYobbnCdPhoRdRnh/s+o8
	bcO47061LwEkwnh+U1ProJczfW1HNeNR5zPtvM3/utPj8vKUcg6nDKytijd9prsc=
X-Received: by 2002:a05:6214:c21:b0:894:73b9:d31c with SMTP id 6a1803df08f44-8974047b86cmr215133126d6.33.1771434898364;
        Wed, 18 Feb 2026 09:14:58 -0800 (PST)
X-Received: by 2002:a05:6214:c21:b0:894:73b9:d31c with SMTP id 6a1803df08f44-8974047b86cmr215132386d6.33.1771434897854;
        Wed, 18 Feb 2026 09:14:57 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net. [100.17.19.56])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cca6fddsm186357896d6.19.2026.02.18.09.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:14:57 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Subject: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
Date: Wed, 18 Feb 2026 12:14:09 -0500
Message-Id: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NQQ6CMBCF4auQWTumLQSpK+5hWIx0arsokBYbD
 eHuVuLS5feS+WeDxNFzgmu1QeTsk5+nAnWqYHQ0PRi9KQYlVCuk6tAEuj8tOqYFx0DFHNA2Ugl
 SxjbUQTldIlv/OrK3odj5tM7xfXzJ8rv+grX4H8wSJdZtc2HSumat+8jG0Xoe5wDDvu8fvz0pl
 7kAAAA=
X-Change-ID: 20260128-dmabuf-heap-cma-dmem-f4120a2df4a8
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53055-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 78EF3158291
X-Rspamd-Action: no action

An earlier series[1] from Maxime introduced dmem to the cma allocator in
an attempt to use it generally for dma-buf. Restart from there and apply
the charge in the narrower context of the CMA dma-buf heap instead.

In line with introducing cgroup to the system heap[2], this behavior is
enabled based on dma_heap.mem_accounting, disabled by default.

dmem is chosen for CMA heaps as it allows limits to be set for each
region backing each heap. The charge is only put in the dma-buf heap for
now as it guaranties it can be accounted against a userspace process
that requested the allocation.

[1] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org/
[2] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com/

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
Changes in v2:
- Rebase on Maxime's introduction of dmem to the cma allocator:
  https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org/
- Remove the dmem region registration from the cma dma-buf heap
- Remove the misplaced logic for the default region.
- Link to v1: https://lore.kernel.org/r/20260130-dmabuf-heap-cma-dmem-v1-1-3647ea993e99@redhat.com

---
Eric Chanudet (1):
      dma-buf: heaps: cma: charge each cma heap's dmem

Maxime Ripard (2):
      cma: Register dmem region for each cma region
      cma: Provide accessor to cma dmem region

 drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
 include/linux/cma.h              |  9 +++++++++
 mm/cma.c                         | 20 +++++++++++++++++++-
 mm/cma.h                         |  3 +++
 4 files changed, 45 insertions(+), 2 deletions(-)
---
base-commit: 948e195dfaa56e48eabda591f97630502ff7e27e
change-id: 20260128-dmabuf-heap-cma-dmem-f4120a2df4a8

Best regards,
-- 
Eric Chanudet <echanude@redhat.com>


