Return-Path: <linux-media+bounces-67415-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y73LLNYCVGqHgwMAu9opvQ
	(envelope-from <linux-media+bounces-67415-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 23:10:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDC7745EBB
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 23:10:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XtuTVSnk;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67415-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67415-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8C0A3006D41
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 21:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6111237A82F;
	Sun, 12 Jul 2026 21:09:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE483793B0
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 21:09:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783890556; cv=none; b=YpIn9RpNMJczkJjTtHY+uVGgV4xEXC9RiGB6JS2hnXyOOUSbdju7uWJ4Q8qqAsSj+akIzctGaIeLSPv9rpTyl7NINNVepfEF9tm4HO5//GlKkLZ+ZLpWFqfVdoXeuzXNL7v/R3nI3fkVEKF6YAZYpMmOZ/rCaYpBTGZlw5Hn1/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783890556; c=relaxed/simple;
	bh=KEj2d3o151qmDKc/H1dXxyZtdyvAb7r5gfIIA413u7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JEP0Dw3Ufie4sebgCajmj8Q6S+Su5eTDN5UCYWIbyiquyVthoQHK5tslS4opkt49xOrQzjEXgp6jj+KWUE6YgaOBb3DibIiv5JwmsAZt0GdVz+287sXvhvTF8sUnn8JWx+OP+b+bcCmr+sgM0nIb3UxSwN6Zwd4PrPu23fGLht0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtuTVSnk; arc=none smtp.client-ip=74.125.224.129
Received: by mail-yx2-f1.google.com with SMTP id 00721157ae682-81c6e4ce922so20181497b3.0
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 14:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783890553; x=1784495353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bfv9SDN5MkAXjEfB0DOwHnNab5SbI48kmmTcYXar85Y=;
        b=XtuTVSnkEMgA1eUxGb2cU6a/I4eHZ9uuyrNPoq4+iJ1yFjKxImrs4qbV4XV8scaQ9e
         48JWPPW1J6I1tDUb6Fn/Cl6+CgqYZsHCeSpN3r/VKQMF8k8xdEy1idakQfGVSe6B9h3J
         lqyWu0QDpRm8cDQkkNf4zTCE89CbjCDU9YwYWiiyg2fe3qS1v8Oy5jfCQ+AInNBaeO54
         v/rvTXauEURWul+5smbRSYpHmL4qJaaQyu/ImNI2jPebCxkLaWr0UB2yttu7ICg6Rz6B
         4eJqUPDnA7uZW1IudHzDSHFFKmwXFATt+aDVV47AjufsT+91YSbBx4mVagmS2mkPEk+9
         yt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783890553; x=1784495353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bfv9SDN5MkAXjEfB0DOwHnNab5SbI48kmmTcYXar85Y=;
        b=UmPQVEaaLkP73KyJDM16BYwaRXfhjRfJAKYhqdRpG/ZuxcQQuLlGr8ZmNOvBfxFZ47
         HLa9z9SWkJpWxuHxOAsv7pMv6zFwkolxsUUTZFiKg4IIY0id04Nt/xCJrKI2oskw1Esv
         lU1LDbNp2S/z5GNa3abDMu8r8fm0Pbw30+o5AYTvVqtnBR7v7hNouIimY8xoVlABqX0o
         1r6Q61MJbFFkf0+XtzcD6J67jZWYRfH7QxDivfpQoY+MZ96cXE5fkxzEqOGVYsAX1irC
         X2p2iuJJVpTPrf5e2KTzc7fGgU9GIaJ4ldAc6Kx1FzDO61ySxS1dI+aPZik+YTBLEYrx
         wzuw==
X-Forwarded-Encrypted: i=1; AHgh+RrBe/RB3qZCTQZSwib3VUq3gKgVQIKQUs65UkwyCSpZk16I3EvmTsUjq7Lf/eF54wa1khMfhE+mRanH1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfHWNjbrx6krcL2xOd6i24xX0BOdhP0hs93arxjiCGcqaKyyyn
	uC4JA65l1A5s7w7gwCbLgzGT66ntxqCNn5w9YUM5bzmOJznzRaNyASLE
X-Gm-Gg: AfdE7ckX7Cd0FX8sM3paZEfYDUZdGqGWajaG61Vr0E1S0R73BLef3BsTskWpRaXCenI
	0P4c+X0MrS0g0w9Q6JXRVx3N2LVo7AH7X2/mnPTaCR4tj3mshEYY6s4AvoPV9CvgsjyxnCrSuvD
	NkUWmo4TL6ZTyNb4FglqUTYndtgLrsao8FSwAePrd7CrIkHphnPxjsgoQfiTRWs+rwVDQLi0qUF
	oFV1Kg2bd76o5N/TIri3uyjvkob5+DmRmP5myghltHIldoH3fblM+C3M/sqxDPjUTSmul/T3fzc
	X5jQO+e/SiWUaMG3748cmeigI+ESIaIokR+eCqTQxFssFLwBgMlOqpPxW6BR/jSGtZkBebzFWIg
	IXANnqB8Y/Bph9imI3EiwKZNhQ1YgyO/XMxHd4sO611oLpEmj2CQKheDdai/fQRV41sT0HJNKOb
	P7xZcFzQJbwEzxMNiT7eG6qSH2GVGKLJ1tl6Ne5sCppOHwWv2gOIVBYQ6ImBWIxQlUYi3x1w==
X-Received: by 2002:a05:690c:e646:b0:81e:ae6d:cadb with SMTP id 00721157ae682-81eae6dd390mr998877b3.7.1783890552782;
        Sun, 12 Jul 2026 14:09:12 -0700 (PDT)
Received: from [127.0.0.2] (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be9834dsm99737387b3.9.2026.07.12.14.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:09:12 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <colin.braun.cl@gmail.com>
Date: Sun, 12 Jul 2026 16:08:00 -0500
Subject: [RFC PATCH 3/4] rust: usb: add urb abstraction with control and
 isochronous support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260712-urb-abstraction-v1-v1-3-9fa011634ead@gmail.com>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
In-Reply-To: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-media@vger.kernel.org, 
 Colin Braun <colin.braun.cl@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783890545; l=28681;
 i=colin.braun.cl@gmail.com; s=20260630; h=from:subject:message-id;
 bh=KEj2d3o151qmDKc/H1dXxyZtdyvAb7r5gfIIA413u7Q=;
 b=lFqfuC3cuvUxCJdDCousl1xyHd9mDwZ69jE1e78gRM8yReHjvSLD/i2T89rW649cY8fiqQjwj
 bgaVh3SKyrpDH9sDoBtKu0kYGtm3MFCxcLGrfoLPrt2Pbj+QHX2hibK
X-Developer-Key: i=colin.braun.cl@gmail.com; a=ed25519;
 pk=DJ5DDAbTXtW6OgSgetK6R1PUfhtCNSvSayX3Je17ZAY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-67415-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:stern@rowland.harvard.edu,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,m:colinbrauncl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[colinbrauncl@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,rowland.harvard.edu,intel.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[colinbrauncl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,urb.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FDC7745EBB

Add abstractions for the USB Request Block (URB).

Reiterating the goals and how they are achieved:

1. No `unsafe` needed in driver code. This means providing a way for a
   driver to safely access private data sent with the URB.

- This is accomplished using a trampoline-like mechanism to reconstruct
a valid Urb, allowing us to access a driver's passed completion callback
and provide it the URB result.

2. Drivers are forced to handle the URB status in their completion
   callback before accessing the URB data.

- This is accomplished by wrapping the completed URB in a struct such
that the URB status must be checked before it transitions to a type
where the data is accessible.

3. Dropping an URB ensures it is not in-flight and frees its resources.

- This is accomplished by creating a custom `Drop` implementation that
kills the URB and performs the necessary actions to free its resources.

4. The URB can be safely resubmitted from the completion callback.

- This is trivial, just a resubmit method that consumes the URB to avoid
multiple resubmits or accessing data after submission.

The typestate pattern is used to flag an urb handle as either idle or
submitted. Once a driver submits an urb with an idle handle, the handle
moves to an active state that the driver must hold (otherwise its
`Drop` will run, killing the URB and freeing its resources).

Pipe and urb creation functions are created to support future bulk,
interrupt, and control requests.

Signed-off-by: Colin Braun <colin.braun.cl@gmail.com>
---
 include/linux/usb.h |   4 +
 rust/kernel/usb.rs  | 709 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 711 insertions(+), 2 deletions(-)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 1da4ad1610bc..c588d73c1592 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1513,6 +1513,9 @@ typedef void (*usb_complete_t)(struct urb *);
  * @complete: Completion handler. This URB is passed as the parameter to the
  *	completion function.  The completion function may then do what
  *	it likes with the URB, including resubmitting or freeing it.
+ * @rust_complete: Completion handler for Rust drivers. This is necessary to
+ *	allow Rust drivers to create completion handlers using the Rust ABI,
+ *	avoiding the need for `extern "C"`.
  * @iso_frame_desc: Used to provide arrays of ISO transfer buffers and to
  *	collect the transfer status for each buffer.
  *
@@ -1663,6 +1666,7 @@ struct urb {
 	int error_count;		/* (return) number of ISO errors */
 	void *context;			/* (in) context for completion */
 	usb_complete_t complete;	/* (in) completion routine */
+	void *rust_complete;		/* (in) rust completion routine */
 	struct usb_iso_packet_descriptor iso_frame_desc[];
 					/* (in) ISO ONLY */
 };
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 21dddc735bdf..f4a3d7c0ef6c 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -18,9 +18,15 @@
         to_result, //
     },
     prelude::*,
-    sync::aref::AlwaysRefCounted,
+    sync::{
+        aref::AlwaysRefCounted,
+        Arc,
+        ArcBorrow, //
+    },
+    time::Delta,
     types::Opaque,
     usb::ch9::{
+        CtrlRequest,
         Direction,
         EndpointDescriptor,
         InterfaceClass,
@@ -34,7 +40,11 @@
         offset_of,
         MaybeUninit, //
     },
-    ptr::NonNull,
+    ops::Deref,
+    ptr::{
+        self,
+        NonNull, //
+    },
     slice, //
 };
 
@@ -589,6 +599,645 @@ unsafe impl Send for Interface {}
 // allow any mutation through a shared reference.
 unsafe impl Sync for Interface {}
 
+crate::impl_flags!(
+    /// URB transfer flags.
+    ///
+    /// These correspond to the `URB_*` constants in `include/linux/usb.h`.
+    #[derive(Debug, Clone, Copy, Default, PartialEq, Eq)]
+    pub struct TransferFlags(u32);
+
+    /// Represents a single URB transfer flag.
+    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+    pub enum TransferFlag {
+        /// Short packet flag: return an error if the packet is shorter than
+        /// expected.
+        ShortNotOk = bindings::URB_SHORT_NOT_OK,
+        /// Isochronous ASAP flag: schedule the isochronous transfer as soon as
+        /// possible.
+        IsoAsap = bindings::URB_ISO_ASAP,
+        /// Do not perform a DMA mapping for the transfer buffer.
+        NoTransferDmaMap = bindings::URB_NO_TRANSFER_DMA_MAP,
+        /// Send a zero-length packet at the end of the transfer.
+        ZeroPacket = bindings::URB_ZERO_PACKET,
+        /// Do not interrupt the CPU when the URB completes.
+        NoInterrupt = bindings::URB_NO_INTERRUPT,
+    }
+);
+
+/// A USB pipe encoding endpoint type, direction, device address, and
+/// endpoint number into a single `u32`.
+///
+/// Pipe encoding follows the kernel's `PIPE_*` macros used by the USB
+/// core for control, bulk, isochronous, and interrupt transfers.
+#[derive(Clone, Copy)]
+pub struct Pipe(u32);
+
+impl Pipe {
+    /// Create a host-to-device (OUT) control pipe (endpoint 0).
+    pub fn new_send_control_pipe(dev: &Device) -> Self {
+        Self(bindings::PIPE_CONTROL << 30 | dev.devnum() << 8)
+    }
+
+    /// Create a device-to-host (IN) control pipe (endpoint 0).
+    pub fn new_receive_control_pipe(dev: &Device) -> Self {
+        Self(bindings::PIPE_CONTROL << 30 | dev.devnum() << 8 | bindings::USB_DIR_IN)
+    }
+
+    /// Create a device-to-host (IN) isochronous pipe.
+    pub fn new_receive_isoc_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
+        Self(
+            bindings::PIPE_ISOCHRONOUS << 30
+                | dev.devnum() << 8
+                | u32::from(endpoint.endpoint_number()) << 15
+                | bindings::USB_DIR_IN,
+        )
+    }
+
+    /// Create a host-to-device (OUT) isochronous pipe.
+    pub fn new_send_isoc_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
+        Self(
+            bindings::PIPE_ISOCHRONOUS << 30
+                | dev.devnum() << 8
+                | u32::from(endpoint.endpoint_number()) << 15,
+        )
+    }
+
+    /// Create a host-to-device (OUT) bulk pipe.
+    pub fn new_send_bulk_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
+        Self(
+            bindings::PIPE_BULK << 30
+                | dev.devnum() << 8
+                | u32::from(endpoint.endpoint_number()) << 15,
+        )
+    }
+
+    /// Create a device-to-host (IN) bulk pipe.
+    pub fn new_receive_bulk_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
+        Self(
+            bindings::PIPE_BULK << 30
+                | dev.devnum() << 8
+                | u32::from(endpoint.endpoint_number()) << 15
+                | bindings::USB_DIR_IN,
+        )
+    }
+
+    /// Create a host-to-device (OUT) interrupt pipe.
+    pub fn new_send_int_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
+        Self(
+            bindings::PIPE_INTERRUPT << 30
+                | dev.devnum() << 8
+                | u32::from(endpoint.endpoint_number()) << 15,
+        )
+    }
+
+    /// Create a device-to-host (IN) interrupt pipe.
+    pub fn new_receive_int_pipe(dev: &Device, endpoint: &HostEndpoint) -> Self {
+        Self(
+            bindings::PIPE_INTERRUPT << 30
+                | dev.devnum() << 8
+                | u32::from(endpoint.endpoint_number()) << 15
+                | bindings::USB_DIR_IN,
+        )
+    }
+}
+
+/// A single isochronous packet descriptor within an URB.
+///
+/// Wraps `struct usb_iso_packet_descriptor` from the C USB core.
+#[repr(transparent)]
+pub struct IsoPacketDescriptor(bindings::usb_iso_packet_descriptor);
+
+impl IsoPacketDescriptor {
+    /// Returns the offset of the packet's data within the transfer buffer.
+    pub fn offset(&self) -> u32 {
+        self.0.offset
+    }
+
+    /// Returns the length of the packet in bytes.
+    pub fn length(&self) -> u32 {
+        self.0.length
+    }
+
+    /// Returns the actual number of bytes transferred in this packet.
+    ///
+    /// Valid only after the URB completes.
+    pub fn actual_length(&self) -> u32 {
+        self.0.actual_length
+    }
+
+    /// Returns the per-packet completion status.
+    ///
+    /// Valid only after the URB completes.
+    pub fn status(&self) -> i32 {
+        self.0.status
+    }
+}
+
+/// Trait implemented by all URB state marker types.
+///
+/// Each state specifies pre-cleanup behaviour that runs before the
+/// underlying allocation is freed.
+pub trait UrbState {
+    /// Called before the URB allocation is freed.
+    fn pre_drop(urb: &mut bindings::urb);
+}
+
+/// Marker type for an idle (unsubmitted) URB.
+pub struct Idle;
+/// Marker type for an active (submitted, in-flight) URB.
+pub struct Active;
+
+impl UrbState for Idle {
+    fn pre_drop(_urb: &mut bindings::urb) {}
+}
+impl UrbState for Active {
+    fn pre_drop(urb: &mut bindings::urb) {
+        // SAFETY: `urb` is a valid pointer to an initialized `struct urb`.
+        unsafe { bindings::usb_kill_urb(urb) }
+    }
+}
+
+/// A USB Request Block (URB).
+///
+/// This structure wraps the C [`struct urb`] and provides a safe
+/// abstraction for USB transfers.
+///
+/// [`struct urb`]: https://www.kernel.org/doc/html/latest/driver-api/usb/usb.html#c.urb
+#[repr(transparent)]
+pub struct Urb<T>(Opaque<bindings::urb>, PhantomData<T>);
+
+impl<T> Urb<T> {
+    fn as_raw(&self) -> *mut bindings::urb {
+        self.0.get()
+    }
+
+    fn inner(&self) -> &bindings::urb {
+        // SAFETY: The type invariants guarantee that `self.0` wraps a valid
+        // `struct urb`.
+        unsafe { &*self.as_raw() }
+    }
+
+    fn status(&self) -> i32 {
+        self.inner().status
+    }
+
+    /// Returns a borrow of the driver-private context data, if any.
+    pub fn context(&self) -> Option<ArcBorrow<'_, T>> {
+        let context = self.inner().context;
+        if context.is_null() {
+            None
+        } else {
+            // SAFETY: `context` was initialized by `Arc::into_raw` in `init_common`.
+            Some(unsafe { ArcBorrow::from_raw(context.cast()) })
+        }
+    }
+}
+
+/// A handle to a [`struct urb`] allocated via `usb_alloc_urb`.
+///
+/// Created by [`Urb::new_bulk`], [`Urb::new_isoc`], etc. The URB is
+/// owned by this handle — dropping the handle frees the allocation.
+///
+/// Use [`Urb::submit`] to transition to [`UrbHandle<T, Active>`].
+pub struct UrbHandle<T, S: UrbState = Idle> {
+    /// Pointer to the underlying C `struct urb`.
+    urb: NonNull<bindings::urb>,
+    /// State marker.
+    _state: PhantomData<S>,
+    /// Type of driver-private context data.
+    _ty: PhantomData<T>,
+}
+
+// SAFETY: The underlying urb is always reference-counted and can be released from any thread.
+unsafe impl<T> Send for UrbHandle<T, Active> {}
+
+impl<T, S: UrbState> Deref for UrbHandle<T, S> {
+    type Target = Urb<T>;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: `Urb<T>` is a `#[repr(transparent)]` wrapper of `struct urb`,
+        unsafe { &*(self.urb.as_ptr() as *const Urb<T>) }
+    }
+}
+
+impl<T, S: UrbState> Drop for UrbHandle<T, S> {
+    fn drop(&mut self) {
+        // SAFETY: `self.as_raw()` points to a valid, initialized C `struct urb`.
+        let urb: &mut bindings::urb = unsafe { &mut *self.as_raw() };
+        S::pre_drop(urb);
+
+        if !urb.context.is_null() {
+            // SAFETY: After `pre_drop` the URB is idle, so it is safe to
+            // reclaim the context data.
+            unsafe {
+                drop(Arc::from_raw(urb.context.cast::<T>()));
+            }
+        }
+
+        if !urb.setup_packet.is_null() {
+            // SAFETY: The setup packet was allocated via `KBox::into_raw` in
+            // `init_common` and `urb.setup_packet` is still valid.
+            unsafe {
+                drop(KBox::from_raw(urb.setup_packet.cast::<CtrlRequest>()));
+            }
+        }
+
+        if !urb.transfer_buffer.is_null() {
+            // SAFETY: The transfer buffer was allocated via `KBox::into_raw` in
+            // `init_common` and `urb.transfer_buffer` is still valid.
+            unsafe {
+                drop(KBox::from_raw(ptr::slice_from_raw_parts_mut(
+                    urb.transfer_buffer.cast::<u8>(),
+                    urb.transfer_buffer_length as usize,
+                )));
+            }
+        }
+
+        // SAFETY: `urb` points to a valid, initialized `struct urb`
+        // and is not in-flight.
+        unsafe { bindings::usb_free_urb(ptr::from_mut(urb)) };
+    }
+}
+
+/// A completed URB whose status must be checked before accessing data.
+///
+/// The driver receives this in its completion handler. Call
+/// [`check`](UrbResult::check) to verify the transfer succeeded.
+pub struct UrbResult<'a, T> {
+    /// The pinned URB reference delivered by the trampoline.
+    urb: Pin<&'a mut Urb<T>>,
+}
+
+impl<'a, T> Deref for UrbResult<'a, T> {
+    type Target = Urb<T>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.urb
+    }
+}
+
+impl<'a, T> UrbResult<'a, T> {
+    /// Re-submit the URB from a completion handler.
+    ///
+    /// Consumes this handle, transferring ownership to the kernel.
+    /// This is intentionally private, since a driver should always
+    /// check the result in the completion handler.
+    fn resubmit(self, mem_flags: kernel::alloc::Flags) -> Result {
+        // SAFETY: `self.urb.as_raw()` points to a valid, initialized C `struct urb`.
+        to_result(unsafe { bindings::usb_submit_urb(self.as_raw(), mem_flags.as_raw()) })
+    }
+
+    /// Check the completion status and grant access to the URB data.
+    pub fn check(&mut self) -> Result<UrbData<'_, T>> {
+        if self.status() != 0 {
+            Err(Error::from_errno(self.status()))
+        } else {
+            Ok(UrbData {
+                urb: self.urb.as_mut(),
+            })
+        }
+    }
+
+    /// Check the completion status, granting data access on success or
+    /// resubmitting the URB on failure.
+    pub fn check_or_resubmit(
+        self,
+        mem_flags: kernel::alloc::Flags,
+    ) -> Result<UrbData<'a, T>, Result> {
+        if self.status() != 0 {
+            Err(self.resubmit(mem_flags))
+        } else {
+            Ok(UrbData { urb: self.urb })
+        }
+    }
+}
+
+/// A successfully completed URB whose data is safe to read.
+pub struct UrbData<'a, T> {
+    /// The pinned URB reference.
+    urb: Pin<&'a mut Urb<T>>,
+}
+
+impl<'a, T> Deref for UrbData<'a, T> {
+    type Target = Urb<T>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.urb
+    }
+}
+
+impl<'a, T> UrbData<'a, T> {
+    /// Returns the number of bytes actually transferred.
+    ///
+    /// For isochronous URBs this is the sum of all packet
+    /// `actual_length` values.
+    pub fn actual_length(&self) -> u32 {
+        self.inner().actual_length
+    }
+
+    /// Returns the transfer buffer as a byte slice.
+    pub fn transfer_buffer(&self) -> &[u8] {
+        let urb = self.inner();
+        if urb.transfer_buffer.is_null() {
+            &[]
+        } else {
+            // SAFETY: The transfer buffer was set in `init_common`.
+            // The pointer and length are valid for the lifetime of the `Urb`.
+            unsafe {
+                slice::from_raw_parts(
+                    urb.transfer_buffer as *const u8,
+                    urb.transfer_buffer_length as usize,
+                )
+            }
+        }
+    }
+
+    /// Returns the ISO frame descriptors for this URB.
+    pub fn iso_frame_descs(&self) -> &[IsoPacketDescriptor] {
+        let urb = self.inner();
+
+        if urb.number_of_packets == 0 {
+            &[]
+        } else {
+            let data = urb.iso_frame_desc.as_ptr().cast::<IsoPacketDescriptor>();
+
+            // SAFETY: The `iso_frame_desc` flexible array was allocated as
+            // part of the `usb_alloc_urb` allocation. `number_of_packets`
+            // is the corresponding length.
+            unsafe { slice::from_raw_parts(data, urb.number_of_packets as usize) }
+        }
+    }
+
+    /// Extracts the payload data for a given ISO packet descriptor.
+    ///
+    /// Returns `Err` if the packet status is non-zero.
+    pub fn data_from_iso_packet_desc(
+        &self,
+        iso_packet_desc: &IsoPacketDescriptor,
+    ) -> Result<&[u8]> {
+        if iso_packet_desc.status() != 0 {
+            return Err(Error::from_errno(iso_packet_desc.status()));
+        }
+        let urb = self.inner();
+        // SAFETY: `iso_packet_desc.offset()` was computed in
+        // `init_common` and lies within the transfer buffer.
+        let data =
+            unsafe { (urb.transfer_buffer.cast::<u8>()).add(iso_packet_desc.offset() as usize) };
+
+        // SAFETY: After URB completion `actual_length()` reflects the
+        // valid bytes in the packet. The slice is within the transfer
+        // buffer allocation. The packet status was verified above.
+        unsafe {
+            Ok(slice::from_raw_parts(
+                data,
+                iso_packet_desc.actual_length() as usize,
+            ))
+        }
+    }
+
+    /// Re-submit the URB from a completion handler.
+    ///
+    /// Consumes this handle, transferring ownership to the kernel.
+    pub fn resubmit(self, mem_flags: kernel::alloc::Flags) -> Result {
+        // SAFETY: `self.as_raw()` points to a valid, initialized C `struct urb`.
+        to_result(unsafe { bindings::usb_submit_urb(self.as_raw(), mem_flags.as_raw()) })
+    }
+}
+
+/// Trampoline function to call safe completion handlers.
+///
+/// # Safety
+///
+/// `urb_ptr` must point to a valid, initialized `struct urb` whose
+/// `context` and `rust_complete` fields were set by [`Urb::init_common`].
+unsafe extern "C" fn urb_complete_trampoline<T>(urb_ptr: *mut bindings::urb) {
+    // SAFETY: `urb_ptr` is a valid pointer provided by the USB core.
+    // `rust_complete` was set to a `fn(UrbResult<'_, T>)` when initialized.
+    let complete: fn(UrbResult<'_, T>) = unsafe { core::mem::transmute((*urb_ptr).rust_complete) };
+    // SAFETY: `urb_ptr` points to a valid `struct urb`.
+    let urb = unsafe { &mut *urb_ptr.cast() };
+    // SAFETY: The data `urb` references is never moved.
+    let urb = unsafe { Pin::new_unchecked(urb) };
+    complete(UrbResult { urb });
+}
+
+impl<T> Urb<T> {
+    #[allow(clippy::too_many_arguments)]
+    fn init_common(
+        mem_flags: kernel::alloc::Flags,
+        intf: &Interface<device::Bound>,
+        pipe: Pipe,
+        setup_packet: Option<KBox<CtrlRequest>>,
+        transfer_buffer: Option<KBox<[u8]>>,
+        context_data: Option<Arc<T>>,
+        complete: fn(UrbResult<'_, T>),
+        number_of_packets: u32,
+        iso_packet_len: u16,
+        transfer_flags: TransferFlags,
+        interval: i32,
+    ) -> Result<Pin<UrbHandle<T, Idle>>> {
+        // SAFETY: `usb_alloc_urb` allocates a `struct urb` + ISO frame.
+        let urb_ptr =
+            unsafe { bindings::usb_alloc_urb(number_of_packets as c_int, mem_flags.as_raw()) };
+        if urb_ptr.is_null() {
+            return Err(ENOMEM);
+        }
+
+        // SAFETY: `urb_ptr` points to allocated and zero-initialized memory
+        // of the correct layout for `struct urb` + ISO tail.
+        let urb = unsafe { &mut *urb_ptr };
+
+        let dev: &Device<device::Bound> = intf.as_ref();
+
+        urb.complete = Some(urb_complete_trampoline::<T>);
+        urb.dev = dev.as_raw();
+        urb.pipe = pipe.0;
+        urb.number_of_packets = number_of_packets as c_int;
+        urb.transfer_flags = u32::from(transfer_flags);
+        urb.interval = interval;
+
+        // Set up ISO frame descriptors.
+        if number_of_packets > 0 {
+            // SAFETY: `urb_ptr` was allocated with `number_of_packets` ISO
+            // descriptors via `usb_alloc_urb`. `as_mut_slice` yields a valid
+            // mutable slice of that length.
+            let descs = unsafe { urb.iso_frame_desc.as_mut_slice(number_of_packets as usize) };
+            for (i, desc) in descs.iter_mut().enumerate() {
+                let pkt_len = u32::from(iso_packet_len);
+                desc.offset = (i as u32) * pkt_len;
+                desc.length = pkt_len;
+            }
+        }
+
+        if let Some(sp) = setup_packet {
+            urb.setup_packet = KBox::into_raw(sp).cast::<u8>();
+        }
+
+        if let Some(tb) = transfer_buffer {
+            let len = tb.len();
+            urb.transfer_buffer_length = len as u32;
+            urb.transfer_buffer = KBox::into_raw(tb).cast::<core::ffi::c_void>();
+        }
+
+        if let Some(data) = context_data {
+            urb.context = Arc::into_raw(data).cast_mut().cast();
+        }
+
+        urb.rust_complete = complete as *mut core::ffi::c_void;
+
+        let urb_handle = UrbHandle {
+            // SAFETY: `urb_ptr` is guaranteed non-null by the null check above.
+            urb: unsafe { NonNull::new_unchecked(urb_ptr) },
+            _state: PhantomData,
+            _ty: PhantomData,
+        };
+
+        // SAFETY: `urb_handle.urb` is never moved.
+        Ok(unsafe { Pin::new_unchecked(urb_handle) })
+    }
+
+    /// Submit the URB for execution.
+    ///
+    /// On success the caller receives an [`UrbHandle<T, Active>`] which
+    /// holds the resources for the in-flight URB. Dropping it cancels the
+    /// URB and frees the allocation.
+    pub fn submit(
+        self: Pin<UrbHandle<T, Idle>>,
+        mem_flags: kernel::alloc::Flags,
+    ) -> Result<UrbHandle<T, Active>> {
+        // SAFETY: The urb pointed to is not moved.
+        let handle = unsafe { Pin::into_inner_unchecked(self) };
+        // SAFETY: `handle.as_raw()` points to a valid, initialized `struct urb`.
+        let result = unsafe { bindings::usb_submit_urb(handle.as_raw(), mem_flags.as_raw()) };
+
+        if result == 0 {
+            let urb = handle.urb;
+            core::mem::forget(handle);
+            Ok(UrbHandle {
+                urb,
+                _state: PhantomData,
+                _ty: PhantomData,
+            })
+        } else {
+            Err(Error::from_errno(result))
+        }
+    }
+
+    /// Creates a new bulk URB.
+    pub fn new_bulk(
+        mem_flags: kernel::alloc::Flags,
+        intf: &Interface<device::Bound>,
+        pipe: Pipe,
+        transfer_buffer: KBox<[u8]>,
+        context_data: Option<Arc<T>>,
+        complete: fn(UrbResult<'_, T>),
+        transfer_flags: TransferFlags,
+    ) -> Result<Pin<UrbHandle<T, Idle>>> {
+        Self::init_common(
+            mem_flags,
+            intf,
+            pipe,
+            None,
+            Some(transfer_buffer),
+            context_data,
+            complete,
+            0,
+            0,
+            transfer_flags,
+            0,
+        )
+    }
+
+    /// Creates a new interrupt URB.
+    #[allow(clippy::too_many_arguments)]
+    pub fn new_int(
+        mem_flags: kernel::alloc::Flags,
+        intf: &Interface<device::Bound>,
+        pipe: Pipe,
+        transfer_buffer: KBox<[u8]>,
+        context_data: Option<Arc<T>>,
+        complete: fn(UrbResult<'_, T>),
+        transfer_flags: TransferFlags,
+        interval: i32,
+    ) -> Result<Pin<UrbHandle<T, Idle>>> {
+        Self::init_common(
+            mem_flags,
+            intf,
+            pipe,
+            None,
+            Some(transfer_buffer),
+            context_data,
+            complete,
+            0,
+            0,
+            transfer_flags,
+            interval,
+        )
+    }
+
+    /// Creates a new control URB.
+    #[allow(clippy::too_many_arguments)]
+    pub fn new_ctrl(
+        mem_flags: kernel::alloc::Flags,
+        intf: &Interface<device::Bound>,
+        pipe: Pipe,
+        setup_packet: KBox<CtrlRequest>,
+        transfer_buffer: Option<KBox<[u8]>>,
+        context_data: Option<Arc<T>>,
+        complete: fn(UrbResult<'_, T>),
+        transfer_flags: TransferFlags,
+    ) -> Result<Pin<UrbHandle<T, Idle>>> {
+        Self::init_common(
+            mem_flags,
+            intf,
+            pipe,
+            Some(setup_packet),
+            transfer_buffer,
+            context_data,
+            complete,
+            0,
+            0,
+            transfer_flags,
+            0,
+        )
+    }
+
+    /// Creates a new isochronous URB.
+    #[allow(clippy::too_many_arguments)]
+    pub fn new_isoc(
+        mem_flags: kernel::alloc::Flags,
+        intf: &Interface<device::Bound>,
+        pipe: Pipe,
+        transfer_buffer: KBox<[u8]>,
+        context_data: Option<Arc<T>>,
+        complete: fn(UrbResult<'_, T>),
+        number_of_packets: u32,
+        iso_packet_len: u16,
+        transfer_flags: TransferFlags,
+        interval: i32,
+    ) -> Result<Pin<UrbHandle<T, Idle>>> {
+        // Reject URBs whose buffer is too small to hold all packets.
+        let needed = (number_of_packets as usize).saturating_mul(iso_packet_len as usize);
+        if transfer_buffer.len() < needed {
+            return Err(EINVAL);
+        }
+
+        Self::init_common(
+            mem_flags,
+            intf,
+            pipe,
+            None,
+            Some(transfer_buffer),
+            context_data,
+            complete,
+            number_of_packets,
+            iso_packet_len,
+            transfer_flags,
+            interval,
+        )
+    }
+}
+
 /// A USB device.
 ///
 /// This structure represents the Rust abstraction for a C [`struct usb_device`].
@@ -611,6 +1260,17 @@ impl<Ctx: device::DeviceContext> Device<Ctx> {
     fn as_raw(&self) -> *mut bindings::usb_device {
         self.0.get()
     }
+
+    fn inner(&self) -> &bindings::usb_device {
+        // SAFETY: The type invariants guarantee that `self.0` wraps a valid
+        // `struct usb_device`.
+        unsafe { &*self.as_raw() }
+    }
+
+    /// Returns the USB device number assigned by the bus.
+    fn devnum(&self) -> u32 {
+        self.inner().devnum as u32
+    }
 }
 
 impl Device<device::Bound> {
@@ -625,6 +1285,51 @@ pub fn set_interface(&self, interface: u8, altsetting: u8) -> Result {
             bindings::usb_set_interface(self.as_raw(), i32::from(interface), i32::from(altsetting))
         })
     }
+
+    /// Send a USB control message synchronously.
+    ///
+    /// Wraps `usb_control_msg`. The pipe direction is inferred from the setup
+    /// packet's [`Direction`]. The optional `data` buffer is
+    /// written to for IN transfers or read from for OUT transfers.
+    ///
+    /// Returns the number of bytes transferred on success.
+    pub fn control_msg(
+        &self,
+        setup: &CtrlRequest,
+        data: Option<&mut [u8]>,
+        timeout: Delta,
+    ) -> Result<i32> {
+        let pipe = match setup.direction() {
+            Direction::In => Pipe::new_receive_control_pipe(self),
+            Direction::Out => Pipe::new_send_control_pipe(self),
+        };
+        let (buf, len) = match data {
+            Some(d) => (d.as_mut_ptr().cast::<core::ffi::c_void>(), d.len() as u16),
+            None => (ptr::null_mut(), 0),
+        };
+        let timeout_ms = timeout.as_millis() as i32;
+
+        // SAFETY: `self.as_raw()` returns a valid `struct usb_device` pointer.
+        let ret = unsafe {
+            bindings::usb_control_msg(
+                self.as_raw(),
+                pipe.0,
+                setup.request(),
+                setup.requesttype(),
+                setup.value(),
+                setup.index(),
+                buf,
+                len,
+                timeout_ms,
+            )
+        };
+
+        if ret >= 0 {
+            Ok(ret)
+        } else {
+            Err(Error::from_errno(ret))
+        }
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic

-- 
2.54.0


