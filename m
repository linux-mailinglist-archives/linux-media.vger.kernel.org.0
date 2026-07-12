Return-Path: <linux-media+bounces-67413-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nQCqK4UCVGpxgwMAu9opvQ
	(envelope-from <linux-media+bounces-67413-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 23:09:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8870F745E98
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 23:09:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MYqt7GiO;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67413-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67413-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A89430058D1
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 21:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8002E37757A;
	Sun, 12 Jul 2026 21:09:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx2-f0.google.com (mail-yx2-f0.google.com [74.125.224.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1621436604B
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 21:09:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783890551; cv=none; b=kHv5GRWzgHuxYpk6lHzvvcbM/ekke6D/7qCa5kRH0GkElX55QD5Jcvork4/qqQS91OkT4m3N6AaaFtP9QVcUI6zEq3Ygem9bQyt/+MFb2KcQ6d+XM7lWXBwclUTdLVkH3AhIVIIm2H1TJSXtVZSwIbegPwP4JQVXD14jTOyLFMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783890551; c=relaxed/simple;
	bh=wt+tB9y390TcpLxqDw+hREzmpPjKqG33LQ5CkHM9iQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYw4AnEc753Nzc0zaP97v/e+l+DclY0/J43kNv4JJNc9CZQFovr8WBdsGiCdT6EaNu1YuVc9fPisRh8vEUq9Me2ei4EJiKy6n6P85rbd97yF8yQ2bE+Wc9nYPCwJ2kjX2RL1TfZKjSuwpnu21mu4WWJXO10qa7sG0kdZk/nczY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYqt7GiO; arc=none smtp.client-ip=74.125.224.128
Received: by mail-yx2-f0.google.com with SMTP id 00721157ae682-81e7a64294cso4811357b3.1
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 14:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783890549; x=1784495349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgFTptXx85PWXDmKZTTKsGUVnhLFqzTUqDOgVugKp74=;
        b=MYqt7GiOk1UeAEx8+wfrNjly8837ljNvO/eoS/Rdv5KvJXgt7urgp53BqmPYtGT0CH
         2Syhe8xvCHw26J26sV0RWEJYswXehTWSUNCaMrD7H7znDwe29Jsb9/F0SPXrsxWn7mwR
         YTPh92mE7Rff/nFmv2+pTPHnwL3D90w7fWfbJl1N/Ia88ZxEjXIH8g9UvqBnZWk2d36n
         3c/gXvqsprhMULlc5zrLWqenyOpE1hy0V+UeotNnwo1ytriAa6Ns1Nl15ubhWo/lKuPT
         /KVWYy7y5Agpv+kHySKW2tTlq/hf+JMXEEZow0+Efg1QFLTTfoW6GT4v5fonf5Ves3SU
         LFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783890549; x=1784495349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgFTptXx85PWXDmKZTTKsGUVnhLFqzTUqDOgVugKp74=;
        b=p1L6b+6clreVavyk0ds13E3eCo07aBdmFnKQYx5L2C4QU9VfmHpBgbhTjGGMciSzid
         BxzklaNlAS8jry8+1zi00okMDvDMFSyhnrSti37xNn3NkIbVW4j3Qc0Cc8Dq2q3pXXEq
         P1Kf91wDmouljcyW3UfenbXuieqYK2Cg0b62RfpxCqyvCCT0xlJlHW8O+uOWqFRAZN5H
         J9OBpM2y48GnSZOkuFY+6csskqZS2snYd0KwQw7yIYqgFIlwoX6WeiQq/03uwL+/d2eJ
         sm0a38FCNaH8qzGWPMfSlkRiBpFA7z7Mw2M3G+UisHMMokWgLhQoY0hZ2ySpCoHaQOR0
         wYEA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+XVN1qcJ3yrf5voLyn12xgTu+vz6GAhSDTQ9FxJSgroF1H/PKK6HuRrCXR3zpsLBytOKo4eiICG9R0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjEZf1zI4X9DEqRGrgHM+WFyPkTLx2FWMLGRVOxpE5Rkxp57wa
	q5J8cGjWCUzXiCmfD3W+yB+Xiw1HEwsY764wylcX+VYbcfyoRWiL8LoOXCYZZXTCeIXJqw==
X-Gm-Gg: AfdE7cnJwqZe/67SsQjbSnG35Y/XemmMHJragpuBENTYO5Kpw6QI/ckMPE70MSea852
	FE8ATutWwPDafb/7m4saJFpy9b3YwIsdzKGd3PzARLarK5Fs+aZXpDnW4CW9BQYdLV6ymLFJMQK
	E7fKcIINpQb/M1/QYvtr8nfqmmQiPsjqfI/xGB/fs1Of10cJYs9jU9xhl9ngF1ytAfFYfO2iy3K
	NcM51Z54uAPmu/PIptYdOREYee63bUsdSW/JBJ0HB80StjDfTkHvu7yUhTH4w8G0eT8mVbD/tgb
	hRkEjYBdcG5jMGNf/YH8CZ4F35mtJ1kHoU4b6Oy9d+re4BFpoNTB0lkay9QoSai/uCC/dWw5Ora
	vjau9JEHa4Mv4fWgR9FTAdEGEuQHZMywW4ieXaUGOcrTM1jr+/TunWaX574eXdjs8Z9zQ/EVWAV
	bhGTL/VdNokRG45mbTr5rOXmh55XETqMK6boaeroZpOQThfzCl7zj0QJdh5w0BZioWUBfH2fzwa
	sXdmJV5
X-Received: by 2002:a05:690c:c16:b0:81d:2254:8504 with SMTP id 00721157ae682-81e9016d68emr50666257b3.56.1783890549094;
        Sun, 12 Jul 2026 14:09:09 -0700 (PDT)
Received: from [127.0.0.2] (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be9834dsm99737387b3.9.2026.07.12.14.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:09:08 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <colin.braun.cl@gmail.com>
Date: Sun, 12 Jul 2026 16:07:58 -0500
Subject: [RFC PATCH 1/4] rust: usb: add USB ch9 standard descriptors and
 constants
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260712-urb-abstraction-v1-v1-1-9fa011634ead@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783890545; l=10602;
 i=colin.braun.cl@gmail.com; s=20260630; h=from:subject:message-id;
 bh=wt+tB9y390TcpLxqDw+hREzmpPjKqG33LQ5CkHM9iQo=;
 b=0EGedI4jFhW8LW7B5X37qUv2IHDeUccyF/02Lw1xsp8e3A5oQNs1UZtnvFo2c2f3wP5Tc7Kfk
 PyUgtbsl48QB4XI686nMZuc0Hi/yIEz0kWlt7AZJd14o71gI5TI4cm7
X-Developer-Key: i=colin.braun.cl@gmail.com; a=ed25519;
 pk=DJ5DDAbTXtW6OgSgetK6R1PUfhtCNSvSayX3Je17ZAY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-67413-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8870F745E98

Add a new module for USB chapter 9 structs and constants.

The goal of this patch is to provide safe Rust wrappers around the C
types from include/uapi/linux/usb/ch9.h.

These are needed by drivers and other USB abstractions (interfaces,
endpoints, URBs, etc.).

Signed-off-by: Colin Braun <colin.braun.cl@gmail.com>
---
 rust/kernel/usb.rs     |   2 +
 rust/kernel/usb/ch9.rs | 295 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 297 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 7aff0c82d0af..3ae9c05cd32a 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -31,6 +31,8 @@
     ptr::NonNull,
 };
 
+pub mod ch9;
+
 /// An adapter for the registration of USB drivers.
 pub struct Adapter<T: Driver>(T);
 
diff --git a/rust/kernel/usb/ch9.rs b/rust/kernel/usb/ch9.rs
new file mode 100644
index 000000000000..f451b7273731
--- /dev/null
+++ b/rust/kernel/usb/ch9.rs
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstractions for USB chapter 9.
+//!
+//! C header: [`include/linux/usb/ch9.h`](srctree/include/linux/usb/ch9.h)
+
+use crate::fmt;
+
+/// USB interface class code.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[repr(transparent)]
+pub struct InterfaceClass(u8);
+
+impl InterfaceClass {
+    /// Create an [`InterfaceClass`] from a raw `u8` class code.
+    pub const fn from_raw(class: u8) -> Self {
+        Self(class)
+    }
+
+    /// Get the raw `u8` class code value.
+    pub const fn as_raw(self) -> u8 {
+        self.0
+    }
+}
+
+macro_rules! define_all_usb_classes {
+    (
+        $($variant:ident = $binding:expr,)+
+    ) => {
+        impl InterfaceClass {
+            $(
+                #[allow(missing_docs)]
+                pub const $variant: Self = Self($binding as u8);
+            )+
+        }
+
+        impl fmt::Display for InterfaceClass {
+            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+                match self {
+                    $(
+                        &Self::$variant => write!(f, stringify!($variant)),
+                    )+
+                    _ => <Self as fmt::Debug>::fmt(self, f),
+                }
+            }
+        }
+    };
+}
+
+define_all_usb_classes! {
+    PER_INTERFACE           = bindings::USB_CLASS_PER_INTERFACE,
+    AUDIO                   = bindings::USB_CLASS_AUDIO,
+    COMM                    = bindings::USB_CLASS_COMM,
+    HID                     = bindings::USB_CLASS_HID,
+    PHYSICAL                = bindings::USB_CLASS_PHYSICAL,
+    STILL_IMAGE             = bindings::USB_CLASS_STILL_IMAGE,
+    PRINTER                 = bindings::USB_CLASS_PRINTER,
+    MASS_STORAGE            = bindings::USB_CLASS_MASS_STORAGE,
+    HUB                     = bindings::USB_CLASS_HUB,
+    CDC_DATA                = bindings::USB_CLASS_CDC_DATA,
+    CSCID                   = bindings::USB_CLASS_CSCID,
+    CONTENT_SEC             = bindings::USB_CLASS_CONTENT_SEC,
+    VIDEO                   = bindings::USB_CLASS_VIDEO,
+    WIRELESS_CONTROLLER     = bindings::USB_CLASS_WIRELESS_CONTROLLER,
+    PERSONAL_HEALTHCARE     = bindings::USB_CLASS_PERSONAL_HEALTHCARE,
+    AUDIO_VIDEO             = bindings::USB_CLASS_AUDIO_VIDEO,
+    BILLBOARD               = bindings::USB_CLASS_BILLBOARD,
+    USB_TYPE_C_BRIDGE       = bindings::USB_CLASS_USB_TYPE_C_BRIDGE,
+    MCTP                    = bindings::USB_CLASS_MCTP,
+    MISC                    = bindings::USB_CLASS_MISC,
+    APP_SPEC                = bindings::USB_CLASS_APP_SPEC,
+    VENDOR_SPEC             = bindings::USB_CLASS_VENDOR_SPEC,
+}
+
+/// USB interface descriptor.
+///
+/// Wraps the C `struct usb_interface_descriptor` defined in
+/// `include/uapi/linux/usb/ch9.h`. Corresponds to USB 2.0 spec §9.6.5,
+/// table 9-12.
+#[repr(transparent)]
+pub struct InterfaceDescriptor(bindings::usb_interface_descriptor);
+
+impl InterfaceDescriptor {
+    /// Returns the size of this descriptor in bytes.
+    #[allow(non_snake_case)]
+    pub fn bLength(&self) -> u8 {
+        self.0.bLength
+    }
+
+    /// Returns the descriptor type (`USB_DT_INTERFACE`).
+    #[allow(non_snake_case)]
+    pub fn bDescriptorType(&self) -> u8 {
+        self.0.bDescriptorType
+    }
+
+    /// Returns the interface number (zero-based).
+    #[allow(non_snake_case)]
+    pub fn bInterfaceNumber(&self) -> u8 {
+        self.0.bInterfaceNumber
+    }
+
+    /// Returns the alternate setting number.
+    #[allow(non_snake_case)]
+    pub fn bAlternateSetting(&self) -> u8 {
+        self.0.bAlternateSetting
+    }
+
+    /// Returns the number of endpoints used by this interface (excluding
+    /// the default control endpoint).
+    #[allow(non_snake_case)]
+    pub fn bNumEndpoints(&self) -> u8 {
+        self.0.bNumEndpoints
+    }
+
+    /// Returns the interface class code.
+    #[allow(non_snake_case)]
+    pub fn bInterfaceClass(&self) -> InterfaceClass {
+        InterfaceClass(self.0.bInterfaceClass)
+    }
+
+    /// Returns the interface subclass code.
+    #[allow(non_snake_case)]
+    pub fn bInterfaceSubClass(&self) -> u8 {
+        self.0.bInterfaceSubClass
+    }
+
+    /// Returns the interface protocol code.
+    #[allow(non_snake_case)]
+    pub fn bInterfaceProtocol(&self) -> u8 {
+        self.0.bInterfaceProtocol
+    }
+
+    /// Returns the index of the string descriptor describing this
+    /// interface.
+    #[allow(non_snake_case)]
+    pub fn iInterface(&self) -> u8 {
+        self.0.iInterface
+    }
+}
+
+/// USB endpoint descriptor.
+///
+/// Wraps the C `struct usb_endpoint_descriptor` defined in
+/// `include/uapi/linux/usb/ch9.h`. Corresponds to USB 2.0 spec §9.6.6,
+/// table 9-13.
+#[repr(transparent)]
+pub struct EndpointDescriptor(bindings::usb_endpoint_descriptor);
+
+impl EndpointDescriptor {
+    /// Returns the endpoint address (direction + endpoint number).
+    #[allow(non_snake_case)]
+    pub fn bEndpointAddress(&self) -> u8 {
+        self.0.bEndpointAddress
+    }
+
+    /// Returns the endpoint attributes (transfer type).
+    #[allow(non_snake_case)]
+    pub fn bmAttributes(&self) -> u8 {
+        self.0.bmAttributes
+    }
+
+    /// Returns the maximum packet size for this endpoint.
+    #[allow(non_snake_case)]
+    pub fn wMaxPacketSize(&self) -> u16 {
+        self.0.wMaxPacketSize
+    }
+
+    /// Returns the interval for isochronous/interrupt endpoints.
+    #[allow(non_snake_case)]
+    pub fn bInterval(&self) -> u8 {
+        self.0.bInterval
+    }
+}
+
+/// USB control request (SETUP packet).
+///
+/// Wraps the C `struct usb_ctrlrequest` defined in
+/// `include/uapi/linux/usb/ch9.h`. Corresponds to USB 2.0 spec §9.3,
+/// table 9-2.
+#[repr(transparent)]
+pub struct CtrlRequest(bindings::usb_ctrlrequest);
+
+impl CtrlRequest {
+    /// Creates a new control request from its constituent fields.
+    pub const fn new(
+        requesttype: RequestType,
+        request: u8,
+        value: u16,
+        index: u16,
+        length: u16,
+    ) -> Self {
+        Self(bindings::usb_ctrlrequest {
+            bRequestType: requesttype.0,
+            bRequest: request,
+            wValue: value.to_le(),
+            wIndex: index.to_le(),
+            wLength: length.to_le(),
+        })
+    }
+
+    /// Returns the data-transfer direction encoded in the setup packet.
+    pub fn direction(&self) -> Direction {
+        if self.requesttype() & Direction::In as u8 == 0 {
+            Direction::Out
+        } else {
+            Direction::In
+        }
+    }
+
+    /// Returns the `bRequestType` field.
+    pub fn requesttype(&self) -> u8 {
+        self.0.bRequestType
+    }
+
+    /// Returns the `bRequest` field.
+    pub fn request(&self) -> u8 {
+        self.0.bRequest
+    }
+
+    /// Returns the `wValue` field (native endian).
+    pub fn value(&self) -> u16 {
+        u16::from_le(self.0.wValue)
+    }
+
+    /// Returns the `wIndex` field (native endian).
+    pub fn index(&self) -> u16 {
+        u16::from_le(self.0.wIndex)
+    }
+
+    /// Returns the `wLength` field (native endian).
+    pub fn length(&self) -> u16 {
+        u16::from_le(self.0.wLength)
+    }
+}
+
+/// USB data transfer direction for a control request.
+///
+/// Used in the `bRequestType` field of a SETUP packet
+/// (USB 2.0 spec §9.3, table 9-2).
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[repr(u8)]
+pub enum Direction {
+    /// Host-to-device.
+    Out = bindings::USB_DIR_OUT as u8,
+    /// Device-to-host.
+    In = bindings::USB_DIR_IN as u8,
+}
+
+/// USB request type for a control request.
+///
+/// Used in the `bmRequestType` field of a SETUP packet to distinguish
+/// standard, class, and vendor-specific requests.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[repr(u8)]
+pub enum Type {
+    /// Standard request defined by the USB specification.
+    Standard = bindings::USB_TYPE_STANDARD as u8,
+    /// Class-specific request defined by a USB class specification.
+    Class = bindings::USB_TYPE_CLASS as u8,
+    /// Vendor-specific request.
+    Vendor = bindings::USB_TYPE_VENDOR as u8,
+    /// Reserved for future use.
+    Reserved = bindings::USB_TYPE_RESERVED as u8,
+}
+
+/// USB setup packet request type (`bmRequestType`).
+///
+/// Encodes the direction, type, and recipient of a control request.
+pub struct RequestType(u8);
+
+/// USB request recipient for a control request.
+///
+/// Used in the `bmRequestType` field of a SETUP packet.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[repr(u8)]
+pub enum Recipient {
+    /// Recipient is the device.
+    Device = bindings::USB_RECIP_DEVICE as u8,
+    /// Recipient is an interface.
+    Interface = bindings::USB_RECIP_INTERFACE as u8,
+    /// Recipient is an endpoint.
+    Endpoint = bindings::USB_RECIP_ENDPOINT as u8,
+    /// None of the above.
+    Other = bindings::USB_RECIP_OTHER as u8,
+}
+
+impl RequestType {
+    /// Creates a [`RequestType`] from a direction, type, and recipient.
+    ///
+    /// The three fields are packed into a single `u8` per the USB
+    /// specification (USB 2.0 spec §9.3, table 9-2).
+    pub const fn new(dir: Direction, r#type: Type, recipient: Recipient) -> Self {
+        Self(dir as u8 | r#type as u8 | recipient as u8)
+    }
+}

-- 
2.54.0


