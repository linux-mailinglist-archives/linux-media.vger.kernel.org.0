Return-Path: <linux-media+bounces-63419-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WSh8C70VH2oifQAAu9opvQ
	(envelope-from <linux-media+bounces-63419-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 19:41:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C21630C9E
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 19:41:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=IiOdh51P;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63419-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63419-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75F3F304FCA1
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 17:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9873FB077;
	Tue,  2 Jun 2026 17:28:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAA53FD14E
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 17:28:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421319; cv=none; b=glPp21pfC8IquNbiViFxIAoyGbzmHXwWJ3gVIvOfArLsIqWvci0MX+EGyIVRU3RD6AGbBhuxSzPo2tPaUX1hypJPUaBYhSqXsiaENfxHkp3kAP7W9QgTQS+5AwrTGlMgFJP/5wz8ofbMMUVmpohx3Bmav98afAZ7KbfP4qdMyCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421319; c=relaxed/simple;
	bh=umwawEzRaVqGQ58SmcAjEXQ5zooLJBV9oJWhj8xBmeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsMzRZTo4ZzdSZgL8rEjHt7UR/ojp+GOsOuPULuyCLs+rrueAJMVqrhB6omUShpiJZEHv9w7OJANLtSksGqqmPYsSezsd9n/c2AqAMJe2tdXThFwuJOaNmlPeoDy/lrvQ3ZRDGU0kXHwbo7Xg3N6TcBx6OHY02mCUVfgWElMKVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IiOdh51P; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780421316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ji3R873SgQHyxfzMQgkhE7LmK1MPE9r7ND0eG5Mf4OM=;
	b=IiOdh51P58hY1xLb3pAvo+txez+QQ5bS/A2GfvMA7ZD7bXnT21WdvqaIeXfwtpAenHTsKp
	3a4Cbz8n/MvSECWGtToNQ7DxiEWWA9Wv2csg8eZRKzQ8QkV820W7qRMj8j7ZGdSsuiri1A
	uPD1PjVS2CpsTYUMWeSmT+VrAB9oyAA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-hcXIVyfUOHO65GIIA9MZ-Q-1; Tue,
 02 Jun 2026 13:28:31 -0400
X-MC-Unique: hcXIVyfUOHO65GIIA9MZ-Q-1
X-Mimecast-MFC-AGG-ID: hcXIVyfUOHO65GIIA9MZ-Q_1780421308
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E0E1D18005B5;
	Tue,  2 Jun 2026 17:28:27 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.216])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 90A7219560A7;
	Tue,  2 Jun 2026 17:28:24 +0000 (UTC)
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
Subject: [PATCH v16 3/6] rust: sync: Add SetOnce::reset()
Date: Tue,  2 Jun 2026 13:25:02 -0400
Message-ID: <20260602172807.1051806-4-lyude@redhat.com>
In-Reply-To: <20260602172807.1051806-1-lyude@redhat.com>
References: <20260602172807.1051806-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[nvidia.com,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,google.com,ffwll.ch,vger.kernel.org,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,redhat.com,linuxfoundation.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63419-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:acourbot@nvidia.com,m:gary@garyguo.net,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:ojeda@kernel.org,m:maarten.lankhorst@linux.intel.com,m:aliceryhl@google.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:rafael@kernel.org,m:tzimmermann@suse.de,m:mripard@kernel.org,m:airlied@gmail.com,m:lossin@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:dakr@kernel.org,m:mkchauras@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:lyude@redhat.com,m:gregkh@linuxfoundation.org,m:lina@asahilina.net,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26C21630C9E

This function simply drops the contents of the SetOnce, given a mutable
reference - since that proves we have exclusive access to the SetOnce.
Additionally, update the invariants for SetOnce to make it clear as to why
this is safe.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync/set_once.rs | 60 +++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
index 139cef05e935f..d6e4fc2695673 100644
--- a/rust/kernel/sync/set_once.rs
+++ b/rust/kernel/sync/set_once.rs
@@ -15,7 +15,7 @@
 ///
 /// # Invariants
 ///
-/// - `init` may only increase in value.
+/// - `init` may only increase in value, unless modified through a mutable reference.
 /// - `init` may only assume values in the range `0..=2`.
 /// - `init == 0` if and only if `value` is uninitialized.
 /// - `init == 1` if and only if there is exactly one thread with exclusive
@@ -110,17 +110,61 @@ pub fn copy(&self) -> Option<T>
     {
         self.as_ref().copied()
     }
+
+    /// # Safety
+    ///
+    /// If this function returns `true`, `self` must be freed or `init` must be reset to `0`.
+    unsafe fn drop_val(&mut self) -> bool {
+        if *self.init.get_mut() != 2 {
+            return false;
+        }
+
+        let value = self.value.get_mut();
+        // SAFETY: Via our type invariants, `init` == 2 means `value` is initialized.
+        unsafe { value.assume_init_drop() };
+
+        true
+    }
+
+    /// Unset the [`SetOnce`].
+    ///
+    /// After this function is called, the [`SetOnce`] is empty and uninitialized. This function is
+    /// mainly intended for usage in destructors.
+    ///
+    /// Returns `true` if `self` was previously initialized.
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// # use kernel::sync::SetOnce;
+    /// let mut value = SetOnce::new();
+    /// assert_eq!(value.populate(67), true);
+    ///
+    /// assert_eq!(value.reset(), true);
+    /// assert!(value.as_ref().is_none());
+    /// assert_eq!(value.reset(), false);
+    ///
+    /// assert_eq!(value.populate(69), true);
+    /// ```
+    pub fn reset(&mut self) -> bool {
+        // SAFETY: We write `0` to init below if this returns true.
+        let dropped = unsafe { self.drop_val() };
+        if dropped {
+            // INVARIANT:
+            // - We set `init` back to 0 through a mutable reference.
+            // - We dropped `value` above.
+            *self.init.get_mut() = 0;
+        }
+
+        dropped
+    }
 }
 
 impl<T> Drop for SetOnce<T> {
+    #[inline(always)]
     fn drop(&mut self) {
-        if *self.init.get_mut() == 2 {
-            let value = self.value.get_mut();
-            // SAFETY: By the type invariants of `Self`, `self.init == 2` means that `self.value`
-            // contains a valid value. We have exclusive access, as we hold a `mut` reference to
-            // `self`.
-            unsafe { value.assume_init_drop() };
-        }
+        // SAFETY: We are dropping this value.
+        unsafe { self.drop_val() };
     }
 }
 
-- 
2.54.0


