Return-Path: <linux-media+bounces-58163-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A9dBQDO1GkOxwcAu9opvQ
	(envelope-from <linux-media+bounces-58163-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 11:27:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2763ABF4E
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 11:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F58B30364C6
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 09:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A71139B49C;
	Tue,  7 Apr 2026 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="kwlK0TjD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD59C3A4523
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553982; cv=none; b=EwJU+6VmDW7305S7eiyTZca0I9eu8qgPYwt2gLIrVqa4UKaFp/hfo6TY5Sd3QOpDkviPoL8s8meMfY2XHPUcSjUkN6da7IbtPX201qYO5qtsrDjVS86laD/OCyuRY1+fJMX3tmMN5+XFw1aXoNpAWgWvn8ioe9uIySrGhcJL+Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553982; c=relaxed/simple;
	bh=310agd/8XO4BgwQg8W/cFgXuQDf81Aa7ia7xyYtrlGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDB+MODCmLKTLSSiFL14PVCG3BI7tdbg0r4EYWFOue8/JA4eWjCVp1nJyCXwwgx6g+5vR6lJ43CRnyfTV0sXnF2tvlyonq1Z6l/afAQ2OneSoPgDfBp/aL52uRg8ofAdIV9Ycmm3Ett2w90ZHvZ67WG0pFbvWROenwBpY+KNnZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=kwlK0TjD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48896199cbaso42197575e9.1
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 02:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1775553979; x=1776158779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4JppuW+8jHhiWrz5kQ42R8XjkKGXIqfSYDySDPjjqyw=;
        b=kwlK0TjDPp7yDydpY8YwRZMMDqaWrP0Gwhdo5SUnwjBIjzjPX+rK+FmUnelcZiTmY0
         /sAAAvl5FBTC35gwv3HDkq6+D5yWWLlR2S8tlfz3u2UUAlHNGNPIOEgk/X940VpCeKDd
         zzr/esvJAqNtthUaHOQFnQcZB9MDU5bL4fcLWoOuE/2hN8e7fiX2X/9K+7x0hxIW56WH
         6eGDo7OwDdJ53BJZoNPnUARVA/KkMImtluoKfIgYz+SosCg8Pso9SD0T6NVek2sUasOI
         EnC4ibY1jCiFXFzj61lj3CEgJrjIi4CQxoVxysL3rqAq8bvuAjrxF5cm9aWSzdPbm/oj
         N9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553979; x=1776158779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JppuW+8jHhiWrz5kQ42R8XjkKGXIqfSYDySDPjjqyw=;
        b=H/WUSR42jnsn5Nrx7widDd6by6PjWEVJKwKUsXqFljLWUbPNG7pBArUyQjaGIgXUgO
         H1CuZeNe9FEChXafbF82ksqQTU0vLowLK758lepsqQPLtN5I7lCKne7/i+dJiK/Xy84l
         hWf2SEMP0HX1AfL+QaVUxW3GaByyXcmDUaJp5DwtsqyvfNIEkmsnox6Z7wmz/G9m8Nre
         /PvfN8wL3e0o7MIUuw93SEl9x2Q7PJVhbZ6Mf838HKaHrOlgdJV8W3/36YSzkJOKlNTa
         dfK7B1K/CJF8RdNMQ1/wTNIrViGU4Ul0G0Ru6WJfGLEruGqmLhcM5IJ8T7PcCqlDwdWZ
         nPDA==
X-Forwarded-Encrypted: i=1; AJvYcCWwDv6Pue8t9BnD5Y03/gkYbHNEvZul7O6L47yUHVWGJWKRhiIKDqnCtssahQyPLLQ6BcFZ7lIlNABLpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWMi5M7YwzEIVJ4av3vvhLmf5Fug0e1jyFH7dtt1CoWg5nJ8T5
	AoEZQN9Uj0lnd/prhlzthAAxesyuGyRPukD5ng/uNX/UOQTyRl3lHa3+hD2HzTLD9cI=
X-Gm-Gg: AeBDietWzhX86GhA16dhsBd4nUvBwewH7fMqAVyDfJDGOacjlmo8vgvLsLcH/+WH3Ir
	Sog5mAStEGKqBgQ/ERXmSM2oA1561Y9kC+OLGPIEGcdOMQvqI+scwmiMWDqZkmBPtXvz2cxkYPi
	PcwkhPDTILg2qhE7ot7UEz6uU1z4VEi6W9FAzC9OaZUxgqSmzmmslcFX/0tOp7GZMFs0+WlxJp2
	Ujjp3Gxir70gl4owgdmYg8d4g22QI4MP+R8yBPhkVujI7bF+H+3DWxtGEAA+ufG6FRstS0+locg
	EISUr71IGvVnhxRBXYctGRzamdeltXjI1lNvtUliSEtaIa7GBbBG3nyW38X8ZMF8K/hPWufqbL+
	RdF2qCN4SbSXjvhKACxjxMmhjKwiFDUuE31+21PB2cKHLAsuFyu1Z30FrkxqMP4ppciQ5y8is6r
	Ed3Hw2cX59hZZNeg==
X-Received: by 2002:a05:600c:6098:b0:488:9fb7:376d with SMTP id 5b1f17b1804b1-4889fb73b1amr196429615e9.28.1775553978818;
        Tue, 07 Apr 2026 02:26:18 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm268832955e9.10.2026.04.07.02.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:26:18 -0700 (PDT)
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
Subject: [PATCH v2] dma-buf: heaps: system: document system_cc_shared heap
Date: Tue,  7 Apr 2026 11:26:17 +0200
Message-ID: <20260407092617.635223-1-jiri@resnulli.us>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58163-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[24];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli.us:mid,nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,resnulli-us.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 7B2763ABF4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jiri Pirko <jiri@nvidia.com>

Document the system_cc_shared dma-buf heap that was introduced
recently. Describe its purpose, availability conditions and
relation to confidential computing VMs.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
Reviewed-by: T.J.Mercier <tjmercier@google.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 05445c83b79a..f56b743cdb36 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -16,6 +16,13 @@ following heaps:
 
  - The ``system`` heap allocates virtually contiguous, cacheable, buffers.
 
+ - The ``system_cc_shared`` heap allocates virtually contiguous, cacheable,
+   buffers using shared (decrypted) memory. It is only present on
+   confidential computing (CoCo) VMs where memory encryption is active
+   (e.g., AMD SEV, Intel TDX). The allocated pages have the encryption
+   bit cleared, making them accessible for device DMA without TDISP
+   support. On non-CoCo VM configurations, this heap is not registered.
+
  - The ``default_cma_region`` heap allocates physically contiguous,
    cacheable, buffers. Only present if a CMA region is present. Such a
    region is usually created either through the kernel commandline
-- 
2.51.1


