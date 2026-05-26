Return-Path: <linux-media+bounces-62830-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPRXBNYQFmojhQcAu9opvQ
	(envelope-from <linux-media+bounces-62830-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 23:29:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 870245DCC04
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 23:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47BF1300C9AD
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 21:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A89C30C60D;
	Tue, 26 May 2026 21:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JRROu47N"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929FE3C4B8A
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779830972; cv=none; b=jQTEwhPHpNMjp/lyKkBNmbW/8/ad59GRORVLbfIdsWBNPlTbgEuS07vDRzUTPsdmBsoEIGtpUcvOBBi5jEcSxmBvfkCaxFDpZ+pr4cAtaM1R6wpPs+8u1jqmvROSVa7XZsG1XP0Su5poJ75TkALe5DMQMqNSoTvFFShmqAf7now=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779830972; c=relaxed/simple;
	bh=A3BK2WnGiGinC8G8uh44KNuTg0qtxi2s9zDoOZWxO6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5t9sG18k4g1VlPjLh8YaflicCwps1dVOBzhDp2P/le9tr0/f9v680FQNKWMOX3HlDCXqi17WNM6+1vsPUZ/wU1fkzBIVuXjwI4STiPITMZxZm8IaydYdUeJOB6O+B5bBpHFscAF/C/2GNILw60R4ss8lbmvAMatUHBscW1NxDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JRROu47N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779830966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=35xOY5UpjGtZddGUxJfTOaK/u/wc0iWDPCGCXs5Om6w=;
	b=JRROu47Ndk4QiWciGTw8ILyvUa9uXePZ2Y6d/gpaT0EVkqBMyS2NWrEccsW6IDgnnFqCzl
	cIrqUdm/7K6I74oLJgH0RrNqfm0AUYy4m39awysS2TB1aL+tHOT32rbDuajHSwQ/MMf8r1
	Rqi6nkWh3Va5rj75Etkj6JDF8ua+R/s=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-cEgIZJ2IMoG2W1xSPwgxqA-1; Tue,
 26 May 2026 17:29:19 -0400
X-MC-Unique: cEgIZJ2IMoG2W1xSPwgxqA-1
X-Mimecast-MFC-AGG-ID: cEgIZJ2IMoG2W1xSPwgxqA_1779830956
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 408E01955F25;
	Tue, 26 May 2026 21:29:16 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.238])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C072E30001BB;
	Tue, 26 May 2026 21:29:12 +0000 (UTC)
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
Subject: [PATCH v14 2/6] rust: gem: shmem: Fix Default implementation for ObjectConfig
Date: Tue, 26 May 2026 17:28:53 -0400
Message-ID: <20260526212857.1158294-3-lyude@redhat.com>
In-Reply-To: <20260526212857.1158294-1-lyude@redhat.com>
References: <20260526212857.1158294-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
	TAGGED_FROM(0.00)[bounces-62830-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 870245DCC04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I completely forgot when coming up with this type that #[derive(Default)]
only works if all generics mentioned in the type implement Default (and T
usually doesn't). This being said: We don't use `T` for anything besides
using it for a reference type, so whether or not it implements `Default`
shouldn't actually need to matter.

So, fix this by just manually implementing Default instead of deriving it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/shmem.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index e1b648920d2f6..8b7de136ab1f9 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -39,7 +39,6 @@
 ///
 /// This is used with [`Object::new()`] to control various properties that can only be set when
 /// initially creating a shmem-backed GEM object.
-#[derive(Default)]
 pub struct ObjectConfig<'a, T: DriverObject> {
     /// Whether to set the write-combine map flag.
     pub map_wc: bool,
@@ -50,6 +49,16 @@ pub struct ObjectConfig<'a, T: DriverObject> {
     pub parent_resv_obj: Option<&'a Object<T>>,
 }
 
+impl<'a, T: DriverObject> Default for ObjectConfig<'a, T> {
+    #[inline(always)]
+    fn default() -> Self {
+        Self {
+            map_wc: false,
+            parent_resv_obj: None,
+        }
+    }
+}
+
 /// A shmem-backed GEM object.
 ///
 /// # Invariants
-- 
2.54.0


