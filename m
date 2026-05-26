Return-Path: <linux-media+bounces-62831-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJuZAcgRFmojhQcAu9opvQ
	(envelope-from <linux-media+bounces-62831-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 23:34:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAF85DCC9B
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 23:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0894E3099F72
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 21:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F183A6B8D;
	Tue, 26 May 2026 21:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dOEjXbOW"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86643C2794
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 21:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779830973; cv=none; b=fZoSUVOo+b8vSMT9IeQBmjQAXSksNL/Q34HJScebELQR1tWUS7994JI/vKUoE897W8b4h2WDj9NOMmIlTSyDrcRz4FzmXwjUwD+rxbbI+FJdwVUOctb1Vg4L5gY817tyE8zuaSCA5NXhmuRuSbEPzxAO3d+9MtuAOyG4qZW55YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779830973; c=relaxed/simple;
	bh=eJGgY/sHPzqhfQGfSSThZhIFHdqT/CoLVtlW/pQ7tEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U7tcf6Pis5c7OoOnan68yD6Mt9//7yIdWmF2CzmQiGC1C8an6x2NohDg/U+Bp+FTZmwzvxRKYtOer5f/dg5Wa7pz+WHAD6ZKL7kVZCupRN1BAeT/KF+E7ojtZIIw8m08hy2LhnY2uw91HCASals+dApoZkzbffu/YpK3ERAwl10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dOEjXbOW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779830969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGTPG3QEQJmlnLPRQxC3z6rB8s3h7HSZZcCP8Kz7ue8=;
	b=dOEjXbOWTeb3NolOaPsUNtCRiBwMX90TBpAbQ6WDIZbVxCzhIhT7tQ7T2iB5wyt2tEnHXv
	PBH8kIlQlYW0IOFFvBPLhTnbql5hslCLqqVZrSXdfj8c4G1KhCj2C6ZswUJNoTaoY9PWwu
	k3O31ysDT+jfvPeR4PAsBwhzmzfjyEs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-690-LsvWmM20M52MIdIkOVigtg-1; Tue,
 26 May 2026 17:29:23 -0400
X-MC-Unique: LsvWmM20M52MIdIkOVigtg-1
X-Mimecast-MFC-AGG-ID: LsvWmM20M52MIdIkOVigtg_1779830960
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F77C19560B7;
	Tue, 26 May 2026 21:29:20 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.238])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7065130001BE;
	Tue, 26 May 2026 21:29:16 +0000 (UTC)
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
Subject: [PATCH v14 3/6] rust: drm: gem: s/device::Device/Device/ for shmem.rs
Date: Tue, 26 May 2026 17:28:54 -0400
Message-ID: <20260526212857.1158294-4-lyude@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,google.com,ffwll.ch,vger.kernel.org,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,redhat.com,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62831-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: 7CAF85DCC9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We're about to start explicitly mentioning kernel devices as well in this
file, so this makes it easier to differentiate the two by allowing us to
import `device` as `kernel::device`.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

---
V11:
* Fix location of //

 rust/kernel/drm/gem/shmem.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 8b7de136ab1f9..116ed0a13eac2 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -12,10 +12,10 @@
 use crate::{
     container_of,
     drm::{
-        device,
         driver,
         gem,
-        private::Sealed, //
+        private::Sealed,
+        Device, //
     },
     error::to_result,
     prelude::*,
@@ -115,7 +115,7 @@ fn as_raw_shmem(&self) -> *mut bindings::drm_gem_shmem_object {
     ///
     /// Additional config options can be specified using `config`.
     pub fn new(
-        dev: &device::Device<T::Driver>,
+        dev: &Device<T::Driver>,
         size: usize,
         config: ObjectConfig<'_, T>,
         args: T::Args,
@@ -157,9 +157,9 @@ pub fn new(
     }
 
     /// Returns the `Device` that owns this GEM object.
-    pub fn dev(&self) -> &device::Device<T::Driver> {
+    pub fn dev(&self) -> &Device<T::Driver> {
         // SAFETY: `dev` will have been initialized in `Self::new()` by `drm_gem_shmem_init()`.
-        unsafe { device::Device::from_raw((*self.as_raw()).dev) }
+        unsafe { Device::from_raw((*self.as_raw()).dev) }
     }
 
     extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
-- 
2.54.0


