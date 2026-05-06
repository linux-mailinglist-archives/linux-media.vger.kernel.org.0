Return-Path: <linux-media+bounces-60573-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDeyGRsc+2nSWgMAu9opvQ
	(envelope-from <linux-media+bounces-60573-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:46:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A404D976F
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 867033014BE2
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 10:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E943FFADA;
	Wed,  6 May 2026 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="LqF/UBuS"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9240F1DB95E;
	Wed,  6 May 2026 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064389; cv=pass; b=YeL74EYtzdvETPtZlS+vYJdUjCcQsrXJqWuqAjvQF1m1qQ6R2Xx7Ah8bRT0zGyTzSa7iIrK3IzbrxlY5wvtFpoln8jJl6XsyxYoH3hT93Qx9gWj8+wSCQAH9GkgQ87+KAgwxf8xGQb+/fABMRh0Q+CT1JzVqScmOrr9zeLbX/ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064389; c=relaxed/simple;
	bh=Win+OwrrHH8ItEHIDccisZnVT9CHaUC455l+BImuuaM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dEog4boaQMYaez9vSprEcKJqYY3yzpooqVd5YhvQCj9vemNoP9oQkrPLApvNKlYh+UZ/JE8BIbxRUJ1L0oq4V1aXm6velVNnCbJnsOjqrv5eBEmcmOf7Sznpkq1ImGVlY3A2FHbZRJq61va2EttoNRayB+VzrKGY0wKuS2ATRUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=LqF/UBuS; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1778064375; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dD+MAHs7bn+0hkCGxAH2Y14qOgcWvY61twD7s6yo6x9dTjPI36bSumE9WInf7BLanZa5cV3iDcTwI0V2CYS8TPeQ5DPD9+i7ikH5LqfVgDWMigtuZ/KASMXc/cCiM+8o0RTqmHWu//A96sukafLW5HT9UQvPCs37VabZe17CH0Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778064375; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RvG681xq2rNXteugTNEM7Um/68qeSlyFUSIc0ImpD0o=; 
	b=eLvhIOnbvatlm909dRF7SgeKmb4GVtOH4neuNjiY38W61SSCYN8IiGFV0k2GU0rOfaBbrF2kPdutXqVUxH8UGh0vdrIRmREqeSi5C4vT+wrHHk/bKpFVgD8/1SQDQbzHom9sr7k/sW7VDmFfeKV2qrXzaFriqSnVlPHncqaBpOU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778064375;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=RvG681xq2rNXteugTNEM7Um/68qeSlyFUSIc0ImpD0o=;
	b=LqF/UBuSIuFQj0g3V9cB/8wAouiRG9F2IhpfRD0BNmzdvc//GE4ixLEkX4q+hdQU
	9AyDOYVy3BtuB6TKO9ufIcLmMgqt2S3T4Qv5XAoHjYcYRUfW/yRcWiheUTuu+4I4sCV
	lUyDjBtjb3xfnkYglxmKGp9GX0GVEIgtFRfKsAOs=
Received: by mx.zohomail.com with SMTPS id 1778064373709928.0603511785826;
	Wed, 6 May 2026 03:46:13 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/4] Let userspace explicitly trigger memory reclaims
Date: Wed, 06 May 2026 12:45:55 +0200
Message-Id: <20260506-panthor-explicit-reclaim-v1-0-44f82ac147ce@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQqDMBBEf0X23KVpSkX8leIhJmvdYjTdRBHEf
 29aPQ0PZt5sEEmYItTFBkILR57GDLdLAbY344uQXWbQSpfqoUoMZkz9JEhrGNhyQiE7GPZ4d11
 HTunKVRbyPAh1vP7Vz+bgOLdvsunnOxtCnzl/pqMGrYmEdvKeU1048Zg4XM+EZt+/ZGdBLq8AA
 AA=
X-Change-ID: 20260506-panthor-explicit-reclaim-3dffed028d8c
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: B6A404D976F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60573-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

RAM is not, in fact, cheap. Especially on embedded systems with a low
amount of memory, but known and well-defined userspace, more explicit
resource management can lead to better utilisation patterns. As an
example, a resource manager process on a purpose-built device may wish
to launch, and then explicitly swap out, memory of processes that are
kept "warm", to improve perceived startup latency of individual
full-screen applications without making the kernel figure out the usage
pattern from observation alone in order to swap out the right pages.

To allow for this explicit control in the context of panthor's GPU
memory, add two new sysfs knobs. The first, mem_reclaim, runs an
explicit priv BO reclaim cycle on the TGID written to it.

The second, mem_claim, does the opposite: it swaps BOs back into active
memory.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (4):
      drm/panthor: Add freed_sz parameter to reclaim_priv_bos
      MAINTAINERS: Add sysfs ABI docs to list of panthor files
      drm/panthor: Add explicit memory reclaim sysfs knob
      drm/panthor: Add explicit memory claim sysfs knob

 Documentation/ABI/testing/sysfs-driver-panthor-mem | 34 ++++++++
 MAINTAINERS                                        |  1 +
 drivers/gpu/drm/panthor/panthor_drv.c              | 93 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.c              |  7 +-
 drivers/gpu/drm/panthor/panthor_gem.h              |  1 +
 drivers/gpu/drm/panthor/panthor_mmu.c              | 70 +++++++++++++++-
 drivers/gpu/drm/panthor/panthor_mmu.h              |  4 +
 7 files changed, 205 insertions(+), 5 deletions(-)
---
base-commit: 2c4b906cd135bbb44855287d0d0eff0ee0b47afe
change-id: 20260506-panthor-explicit-reclaim-3dffed028d8c

Best regards,
--  
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


