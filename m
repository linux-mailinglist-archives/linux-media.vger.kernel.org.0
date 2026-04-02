Return-Path: <linux-media+bounces-57972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKdjGMp6zmmMnwYAu9opvQ
	(envelope-from <linux-media+bounces-57972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 16:18:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B399038A5D2
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 16:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14B7730A10A1
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 14:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751CB3E92A9;
	Thu,  2 Apr 2026 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="gXQ++GHo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5076D3E63A8
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 14:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139069; cv=none; b=RgA9cKbEJL54NocZQx3QBXxA/bfC89Z8NX/C32JcXDDblS9gipLZXoYT2+LyS4shZfq3LLXIN7bG1wj10vg7tzmO0f2BZX6p7dgmrAW7jITJArd416oGwbzphNDWIw23GLOhtAzUgWWVFdsB1XD8uCncSwVL/RNH5tVOxOMI+54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139069; c=relaxed/simple;
	bh=MPUb4Jcw0khVVnkcTIA3BNp03DgeMWQmGjHIAMMxg10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nTy5FAyOYdePSO1K0Bh5St5EPBO3Qd/cu3veQ2jUFOTecEbgou1PhtW2k1wwvSyt2NlvYyI6maIFx4++juMgm9ss4NJ5z6OXFoEwQTpTezWHW/K6tEFKPmDwYBhoYHL8vCDM8XkDDd5mBxpxDBRibRVServAc9wcLL0/ouu0Goc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=gXQ++GHo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so6861365e9.0
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 07:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1775139064; x=1775743864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x+ekjncP59XWcpI8woAJDAw1Fg3HF0fV5kIcIgDAtdU=;
        b=gXQ++GHo4X9NQKbK0OVUjfoNSa6U9LySoEuLhbwvEhAh0FyNACnJ5SmmWKJY8tt0IR
         NIoDnG+QGs0Fe12FDKhS8TAU9PCkMUWWg0BdPXdG+uuPzAByamGtEgIcdrIhrs38cFQv
         pNyoWtCqvbvdG6AagAbl4lAZOLfhBHet9MxLRcM3CeS/e/x25cmg8FirERfa9JVVrEWM
         hASZ20U+3p2FvME1pHDBvoFdRdkj4ITp7wesgYwzqMY7QZfdaWYAgqZ9q8HsH754JBcK
         J0lSJuglpAXis5l9NIJfq94/YqKzZOVJXg8bFKYSnndF+0sZANwyMEIhdhsCGCuEf33k
         h2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139064; x=1775743864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+ekjncP59XWcpI8woAJDAw1Fg3HF0fV5kIcIgDAtdU=;
        b=FpVcevcLv8NqnMyc1Bme1I4CHv8/QqjlWoW3Cg3c82wZ9SOYM8vEbIvnXa4PpV3FQh
         iPQ2cYPaiZ1FF3wFyIpGHyarjd10zzyUJR4XuPQYlYWoaP/BKB+ZMxlAWlAYCx66vfye
         PfYYJOn/doE+H/vO0vU2/4wtpMaCIahCb4GyzJg6T/dPP7AXCkGibOz5wkQLl3YARZWx
         pso39tesNc+b79gflCsofHVjjMnn67IEB8u4dEXu9CT7kXY0uoLtxC57NoZCL1gybI+W
         ye3H3w2ljYPhzWcARxOjrrHsJIcUe0YJpTOkx1oEAtHNSvEq2fS+xpeL+QT6yYYjyxjK
         +6tw==
X-Forwarded-Encrypted: i=1; AJvYcCUCS7Bd16r+P1xMCTx5c5lHCJKP7KeQjlgzCYJQ+xxmiKujPRR9ayijyDHIuRxQUXjyilhSxD1IC9S4IA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh4P+3qKNaN/6MFmPXJ0DxHUoR3kOupoTRGFOMP/0TKayEIQ1B
	jXSqg46Sy7XqxKWXoSZ6wbUFV9SL4yOvwZdrK8wUap39UFvrch3QhpI0oXkec6DzTuE=
X-Gm-Gg: ATEYQzzjPgtjdfiUUE3abYVkVTWraMlsnTHT6wkJTaDFCVaisTHrs9UvM9/4/u9vgLm
	yTb8bg6qPSfmqtz2pp0efBIaKvI39C7wRogubAQjaoHE6Br9Ag+qo+zNg1YixEgEsJ11d6PyhRl
	ldKDnILgR9izyuPAkA4hiiSqO6IRdS9Q3XYiHG97Y9bSkGL1ELXFY07YoEvdKsR7Cskdd+H3ZaP
	hyRz0pF1DI+HH53MJJRWbuh1ZKUnWE229XM3UaidEi6qK9R1t70sbFoQ1gOHMqsRTH1dUNx/qzL
	hb0SObpKnvejoRn4e8XxQ7l1zoBY6O6ss77DsrW0fZvYg6i+8uDlKPw5TO3TwBSx4cCxYonk3uv
	uvQgvOD10X4srob/URfF2db1Xyc1nOEJtWZy9VmE1kkg4c4WJvuN06VlOxd4VWZuNwmTFOelJ57
	y7pJSov+HCQiujeg==
X-Received: by 2002:a05:600c:8708:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-4888e064a89mr45823005e9.7.1775139064484;
        Thu, 02 Apr 2026 07:11:04 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48891d5437fsm20447355e9.5.2026.04.02.07.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:11:04 -0700 (PDT)
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	sean.anderson@linux.dev,
	ptesarik@suse.com,
	catalin.marinas@arm.com,
	aneesh.kumar@kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	thomas.lendacky@amd.com,
	john.allen@amd.com,
	ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: [PATCH] dma-buf: heaps: system: document system_cc_shared heap
Date: Thu,  2 Apr 2026 16:11:03 +0200
Message-ID: <20260402141103.598495-1-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57972-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,resnulli.us:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B399038A5D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jiri Pirko <jiri@nvidia.com>

Document the system_cc_shared dma-buf heap that was introduced
recently. Describe its purpose, availability conditions and
relation to confidential computing VMs.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 05445c83b79a..591732393e7d 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -16,6 +16,14 @@ following heaps:
 
  - The ``system`` heap allocates virtually contiguous, cacheable, buffers.
 
+ - The ``system_cc_shared`` heap allocates virtually contiguous, cacheable,
+   buffers using shared (decrypted) memory. It is only present on
+   confidential computing (CoCo) VMs where memory encryption is active
+   (e.g., AMD SEV, Intel TDX). The allocated pages have the encryption
+   bit cleared, making them accessible for device DMA without TDISP
+   support. On non-CoCo VMs configurations, this heap is
+   not registered.
+
  - The ``default_cma_region`` heap allocates physically contiguous,
    cacheable, buffers. Only present if a CMA region is present. Such a
    region is usually created either through the kernel commandline
-- 
2.51.1


