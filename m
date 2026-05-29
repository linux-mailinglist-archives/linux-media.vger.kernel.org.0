Return-Path: <linux-media+bounces-63059-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG0lAZTfGWpmzggAu9opvQ
	(envelope-from <linux-media+bounces-63059-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 20:48:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F448607808
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 20:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95DAE3105332
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 18:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D2D410D24;
	Fri, 29 May 2026 18:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V+BvAY7Z"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F2478851
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 18:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780079843; cv=none; b=GL3T9lG57QW47t7ByRnLOFo98EmMfkpaEH7I2FuRR2IvEP4UXw0MaVSNjL7bKY1Ai9BXHn5J/qCEFeSN5iDP10b/IvGXzHtYJ5G8+8fzInyzN96ykizJ7DJPevf/6ivL3jS4QhT0a8AbDwn1kPjZwOPDunL/QMA10SDFquaNzu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780079843; c=relaxed/simple;
	bh=rEQoSq9IEEKZKygG/YbRuz243qjYKgg0W4HBMQTatF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZ6Y2MgywOAgnqzCU/xaaGQ289fOwK08rQE9UGCghmDpC1z6cB/sqfgGGQN8PYSfVIX+uw8VioarN9K/YE//eLHy+Wz7g0+LeBnWagUgdXnWERRq6GFYwBC0YWLfHmoafq/0DU3kyy/iLMTE8m99l1R7HykEpP8nMv+AjhNQb0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V+BvAY7Z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780079839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ibOzZZ9MbBgPCsyeHLx7hx/XOPF768dDk7bOGh7vXek=;
	b=V+BvAY7ZO7jWvRaYXi7RkYgMTMNXINP0GY6ecXaT0x3vfVQ/8CMqmJempE0K5HG2g268UH
	klRtxbzLCAr9NeEJWyMcEA9IQKYlNxmK+W9F67BVI7rlyFjc4KaU0VtoKAGlOzQhWkz+h0
	OQIVq6mvOqnFAqO2yrnyIswktRef7Rc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-N3PmdtkkNv6foI_0vejyiA-1; Fri,
 29 May 2026 14:37:13 -0400
X-MC-Unique: N3PmdtkkNv6foI_0vejyiA-1
X-Mimecast-MFC-AGG-ID: N3PmdtkkNv6foI_0vejyiA_1780079830
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81E7019560AE;
	Fri, 29 May 2026 18:37:09 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.101])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9C43B1688;
	Fri, 29 May 2026 18:37:05 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	driver-core@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Benno Lossin <lossin@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lyude Paul <lyude@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v15 0/6] Rust bindings for gem shmem
Date: Fri, 29 May 2026 14:33:58 -0400
Message-ID: <20260529183702.677677-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,google.com,ffwll.ch,vger.kernel.org,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,redhat.com,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63059-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gitlab.freedesktop.org:url,patchwork.freedesktop.org:url]
X-Rspamd-Queue-Id: 6F448607808
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Most of this patch series has already been pushed upstream, this is just
the second half of the patch series that has not been pushed yet + some
additional changes which were required to implement changes requested by
the mailing list. This patch series is originally from Asahi, previously
posted by Daniel Almeida.

The previous version of the patch series can be found here:

	https://patchwork.freedesktop.org/series/164580/

Branch with patches applied available here:

	https://gitlab.freedesktop.org/lyudess/linux/-/commits/rust/gem-shmem

This patch series applies on top of drm-rust-next with the following
dependencies applied:

	https://lore.kernel.org/rust-for-linux/20260529173137.303717-1-lyude@redhat.com/T/#t

Lyude Paul (6):
  rust: gem: shmem: Fix Default implementation for ObjectConfig
  rust: drm: gem/shmem: Add DmaResvGuard helper
  rust: drm: gem: Add vmap functions to shmem bindings
  rust: faux: Allow retrieving a bound Device
  drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()
  rust: drm: gem: Introduce shmem::Object::sg_table()

 drivers/gpu/drm/drm_gem_shmem_helper.c |  32 +-
 include/drm/drm_gem_shmem_helper.h     |   1 +
 rust/kernel/drm/gem/shmem.rs           | 497 ++++++++++++++++++++++++-
 rust/kernel/faux.rs                    |   7 +-
 4 files changed, 512 insertions(+), 25 deletions(-)


base-commit: 0e42ec83d46ab8877d38d37493328ed7d1a24de8
prerequisite-patch-id: c8ade07eec6e9c9e875800b114137c459d362e4e
prerequisite-patch-id: c38da06dbc4cfd2589bf2e7e9f0ebaa4da521ddf
-- 
2.54.0


