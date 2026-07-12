Return-Path: <linux-media+bounces-67416-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sojSJK8CVGp+gwMAu9opvQ
	(envelope-from <linux-media+bounces-67416-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 23:10:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6B0745EB1
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 23:10:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DB1EjdAl;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67416-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67416-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7003830071EF
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 21:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F694376A03;
	Sun, 12 Jul 2026 21:09:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B577137A82A
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 21:09:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783890558; cv=none; b=b0L+sl8o/I1KR7lqpaRwkDuvJRbWARiKhUEWIu1kt2gviQpCSF4OKCrUZt5ntd6tdewA/TMyroP1BB7VrCbEu5gwDQ4QD9gfO68NEthoIHIC5bjKArbFZqQLZX8U2Nma3EocrA2V9+bFStpqj9zZZnUuhrU50993ocnB6ngHspc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783890558; c=relaxed/simple;
	bh=WQvKshDrAosb6Qtw7MpQmrVnyV9nFzUo7+XObHv3hgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scZs6Rt3Yg7bbcEo4LbMP+GolfWTDIuTX76TIjrwa/6N6k1phXz+aVYaxzm5YPiVCJsMcgEYk4675/2+u/0cbWsHDSMAjN8X+OXipDWw0uk0U2RYB41RGAVSrQOTU96FXuhk7P+OvIrejfcMyJw7CtZ+VMy89YPzgIJe2yaQg0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DB1EjdAl; arc=none smtp.client-ip=74.125.224.132
Received: by mail-yx2-f4.google.com with SMTP id 00721157ae682-81e8f17ad9eso9331867b3.1
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 14:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783890555; x=1784495355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vodfbLbrZTh4k1ELxmOTY9e67AVLB+3FCuvHYZI16k=;
        b=DB1EjdAlERr7tsgkrOIT3Yd2ciRvMJcLNgj7Nf0htHZTL7i2oVRgb0vvOGcnQ+I3t3
         2peqGbk4/4+hWBdF+mMlzWfzfsxhWLMa5NDU5JeKo8NGqbwpVvM3NrkzoXhVtL6MSD5J
         Qbqn9G2CTMXnigJj5We0Tn5aQTv3Mi9l8TJVwewFNGk9Ij4TozNGizC9K9ot5F3df9z6
         FmmaC95IHbsJUwIFsjAwwav8/5F8FzXUw6IR4zohTLEgyBQGLTHkuxDykntnUIdWy84y
         hzDcEnG3BH9C9Xs8UGOlZuNBn13l9mXU8ZAmmBgvnKRmxIjvp1pdhJxrOc+yhUVmkmL5
         2UGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783890555; x=1784495355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vodfbLbrZTh4k1ELxmOTY9e67AVLB+3FCuvHYZI16k=;
        b=QfUJX3BSDJGUCbE70whTFilwDaawmb7DGpKgLpmwPGgQKS57Z0UQtuOvzDV3I364tO
         zlYi3wSJ/lEzaS0lIu5cZUgQbFWiV9LLngBXkJLhXJQO8ekLvSVzSDiOdVE9Wv+wCJJU
         y6JwM1sbxcQHBIuWVxJT3ts6urzsoorDjRf3h9hWGKrTYIHTGtaR+v30eyqxGurFZPW1
         jGaRbwJaENa5fcaiKHYZIMU/1mMgIzYDpjkpxqRQdGs8q5i5bOSxZEDqnIfax9LHfVtB
         y0n6yCdlaJyIiZRe/ZM49yjumeYYyVGXO5BrWTU9jdo0XlEVW5mb+F2mdvqEN83/m/1c
         p7hQ==
X-Forwarded-Encrypted: i=1; AHgh+RofP2oaGc4wizcGZbBBjIGMeq7VElqy8VwBGm3AsSJrnqmoXVONCdRWiXXWfoNwl0b0sayxwvV60lFAJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5VnXaGj/nkVBpYJ12ef6HCQrS4C+vlq9DOOjjaT1+XyDcrwm4
	gcIzMwIXoJFjmVvuDcPbB7082Nde5lVTuJ/AhpcvYYmYWhgd+9Zx+Mru
X-Gm-Gg: AfdE7cm7vskFfkgqxfnVK5aG4Z5Q1Uas/5htjxeAQMmFU/VOOA/khSavhMmGSMdSu5I
	8Ub52EI3icDkER8VCvzCtk7Q6p6mrgU8YH4FTWdIT9iMtz0TMN4QkjQH+5DDN0zor4xa1l1CwWf
	2EDOaY5k691YqcNoxqWomWV/X8VOpbZoaKdA+JUlpmvuo7YvKSEY66W706cL6FeRdaK//pYv2mv
	gONDn0d7mTPa7HKW0p5L5KEWE4Stn9sNp5lW8Runb/pxYCAocsGgCrImo/gHP5hGipSGDmFH/XZ
	bIC3bU4wCOuR0KloNCbcY3KR+iT59CdMuDuJvN1C1RSYLKXIStAqrBJts70p7oGCUHnBq3ovo2N
	oxY0UoERIyqqWQ9f4DtwwpCyrk46GLKlzcZ1dmeQRPPpAmgtvyP8/4e9nhmQWeA4OzOP1Z2TrXD
	trX9LKV4dlbuEn6hUmnUWP2IOkLZIBAOnLcpZiyBKTLHtJriBaJZ/aF/t7/2WO5yoNKG8566SOa
	fvGivqO
X-Received: by 2002:a05:690c:6008:b0:813:1001:cf85 with SMTP id 00721157ae682-81e9013e309mr54632687b3.37.1783890554640;
        Sun, 12 Jul 2026 14:09:14 -0700 (PDT)
Received: from [127.0.0.2] (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be9834dsm99737387b3.9.2026.07.12.14.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:09:14 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <colin.braun.cl@gmail.com>
Date: Sun, 12 Jul 2026 16:08:01 -0500
Subject: [RFC PATCH 4/4] media: add gv-usb2 audio capture driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-urb-abstraction-v1-v1-4-9fa011634ead@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783890545; l=16409;
 i=colin.braun.cl@gmail.com; s=20260630; h=from:subject:message-id;
 bh=WQvKshDrAosb6Qtw7MpQmrVnyV9nFzUo7+XObHv3hgM=;
 b=eAFC0DaDVkJFQFNbLa8qWNzd9PbtHYHv/Rf+X1jYBm8Fki7XhfYlHf1HyJU2IX//IDgvKazmW
 RlAbpZ3m6J9DD6TlV1eRsTsMk1/CiCcdzWH6384HOtl5AcRVpKSOuo5
X-Developer-Key: i=colin.braun.cl@gmail.com; a=ed25519;
 pk=DJ5DDAbTXtW6OgSgetK6R1PUfhtCNSvSayX3Je17ZAY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-67416-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B6B0745EB1

Add a Rust driver for the I-O Data GV-USB2 Composite-USB Video
Capture Device. Leverages the USB abstractions from patches 1-3.

The GV-USB2 contains an STK1150, a USB bridge microchip for converting
old analog video signals into digital data. The STK1160's datasheet
is available, but the same is not true for the STK1150. However, it
seems that most of the registers are the same as the STK1160's.

This implementation demonstrates the ability to send and receive data
via control and isochronous USB transfers. Due to a lack of V4L2 and
ALSA abstractions, this initial implementation only exposes data from
an audio endpoint via debugfs. I would like to expand on this driver
later.

Signed-off-by: Colin Braun <colin.braun.cl@gmail.com>
---
 drivers/media/usb/Kconfig            |   1 +
 drivers/media/usb/Makefile           |   1 +
 drivers/media/usb/gv-usb2/Kconfig    |   9 +
 drivers/media/usb/gv-usb2/Makefile   |   1 +
 drivers/media/usb/gv-usb2/driver.rs  | 361 +++++++++++++++++++++++++++++++++++
 drivers/media/usb/gv-usb2/gv_usb2.rs |  16 ++
 drivers/media/usb/gv-usb2/regs.rs    |  25 +++
 7 files changed, 414 insertions(+)

diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
index 813171d25ac5..9867d0dc5626 100644
--- a/drivers/media/usb/Kconfig
+++ b/drivers/media/usb/Kconfig
@@ -14,6 +14,7 @@ if MEDIA_CAMERA_SUPPORT
 	comment "Webcam devices"
 
 source "drivers/media/usb/gspca/Kconfig"
+source "drivers/media/usb/gv-usb2/Kconfig"
 source "drivers/media/usb/pwc/Kconfig"
 source "drivers/media/usb/s2255/Kconfig"
 source "drivers/media/usb/usbtv/Kconfig"
diff --git a/drivers/media/usb/Makefile b/drivers/media/usb/Makefile
index 6d171beea20d..f69aaec671ca 100644
--- a/drivers/media/usb/Makefile
+++ b/drivers/media/usb/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_VIDEO_AU0828) += au0828/
 obj-$(CONFIG_VIDEO_CX231XX) += cx231xx/
 obj-$(CONFIG_VIDEO_EM28XX) += em28xx/
 obj-$(CONFIG_VIDEO_GO7007) += go7007/
+obj-$(CONFIG_VIDEO_GVUSB2) += gv-usb2/
 obj-$(CONFIG_VIDEO_HDPVR) += hdpvr/
 obj-$(CONFIG_VIDEO_PVRUSB2) += pvrusb2/
 obj-$(CONFIG_VIDEO_STK1160) += stk1160/
diff --git a/drivers/media/usb/gv-usb2/Kconfig b/drivers/media/usb/gv-usb2/Kconfig
new file mode 100644
index 000000000000..755a669bba26
--- /dev/null
+++ b/drivers/media/usb/gv-usb2/Kconfig
@@ -0,0 +1,9 @@
+config VIDEO_GVUSB2
+	tristate "GV-USB2 audio/video capture device driver"
+	depends on VIDEO_DEV && RUST
+	help
+	  Rust driver for the I-O Data GV-USB2 Composite-USB Video Capture
+	  Device.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called gv_usb2.
diff --git a/drivers/media/usb/gv-usb2/Makefile b/drivers/media/usb/gv-usb2/Makefile
new file mode 100644
index 000000000000..7cc0f83a11c1
--- /dev/null
+++ b/drivers/media/usb/gv-usb2/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_VIDEO_GVUSB2) += gv_usb2.o
diff --git a/drivers/media/usb/gv-usb2/driver.rs b/drivers/media/usb/gv-usb2/driver.rs
new file mode 100644
index 000000000000..a8ab03e9a133
--- /dev/null
+++ b/drivers/media/usb/gv-usb2/driver.rs
@@ -0,0 +1,361 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::regs;
+use kernel::{
+    debugfs::{
+        self,
+        BinaryWriter, //
+    },
+    device,
+    prelude::*,
+    sync::{
+        new_spinlock,
+        Arc,
+        SpinLock, //
+    },
+    time::Delta,
+    usb,
+};
+
+/// The number of isochronous urbs to submit.
+const NUM_URBS: usize = 4;
+
+/// The expected max packet size for audio.
+const MAX_AUDIO_PACKET_SIZE: u16 = 256;
+
+/// The GV-USB2 USB driver struct.
+///
+/// Created during probe and stored as the driver's private data.
+pub(crate) struct GvUsb2Driver {
+    /// Shared audio state.
+    _audio: Arc<AudioState>,
+    /// Pool of isochronous URBs submitted for audio capture.
+    _urbs: [Option<usb::UrbHandle<AudioState, usb::Active>>; NUM_URBS],
+    /// The debugfs file exposing captured audio to userspace.
+    _capture_file: Pin<KBox<debugfs::File<IsocCapture>>>,
+    /// The debugfs directory node.
+    _debugfs_dir: debugfs::Dir,
+}
+
+/// Shared state for audio capture.
+#[pin_data]
+struct AudioState {
+    /// Ring buffer for streaming audio data from URBs to userspace.
+    #[pin]
+    ring: SpinLock<AudioRingBuffer>,
+}
+
+/// A ring buffer for audio data.
+///
+/// Used to transfer audio data from the URB completions to userspace
+/// via debugfs.
+struct AudioRingBuffer {
+    /// Audio buffer, sized to a power of two.
+    buf: KBox<[u8]>,
+    /// Producer index.
+    head: u32,
+    /// Consumer index.
+    tail: u32,
+    /// Mask to handle ring buffer wrap-around. Must be capacity - 1.
+    mask: u32,
+}
+
+impl AudioRingBuffer {
+    /// Write data into the ring buffer.
+    ///
+    /// Returns the number of bytes written.
+    fn write(&mut self, data: &[u8]) -> usize {
+        let capacity = self.mask as usize + 1;
+        let fill = self.head.wrapping_sub(self.tail) as usize;
+
+        if fill >= capacity {
+            return 0;
+        }
+
+        let to_write = core::cmp::min(capacity - fill, data.len());
+        if to_write == 0 {
+            return 0;
+        }
+
+        let mask = self.mask as usize;
+        let head_idx = self.head as usize & mask;
+        let space_to_end = capacity - head_idx;
+
+        if to_write <= space_to_end {
+            self.buf[head_idx..head_idx + to_write].copy_from_slice(&data[..to_write]);
+        } else {
+            let (first, rest) = data.split_at(space_to_end);
+            self.buf[head_idx..capacity].copy_from_slice(first);
+            self.buf[..to_write - space_to_end].copy_from_slice(rest);
+        }
+
+        self.head = self.head.wrapping_add(to_write as u32);
+
+        to_write
+    }
+
+    /// Read data from the ring buffer.
+    ///
+    /// Returns the number of bytes copied into `buf`.
+    fn read(&mut self, buf: &mut [u8]) -> usize {
+        let capacity = self.mask as usize + 1;
+        let fill = self.head.wrapping_sub(self.tail) as usize;
+
+        if fill == 0 {
+            return 0;
+        }
+
+        let to_read = core::cmp::min(fill, buf.len());
+        let mask = self.mask as usize;
+        let tail_idx = self.tail as usize & mask;
+        let space_to_end = capacity - tail_idx;
+
+        if to_read <= space_to_end {
+            buf[..to_read].copy_from_slice(&self.buf[tail_idx..tail_idx + to_read]);
+        } else {
+            let first_len = space_to_end;
+            let second_len = to_read - space_to_end;
+            buf[..first_len].copy_from_slice(&self.buf[tail_idx..capacity]);
+            buf[first_len..to_read].copy_from_slice(&self.buf[..second_len]);
+        }
+
+        self.tail = self.tail.wrapping_add(to_read as u32);
+
+        to_read
+    }
+}
+
+/// Debugfs reader that drains the audio ring buffer.
+struct IsocCapture {
+    /// Shared audio state whose ring buffer is read on each `read()` call.
+    state: Arc<AudioState>,
+}
+
+impl BinaryWriter for IsocCapture {
+    fn write_to_slice(
+        &self,
+        writer: &mut kernel::uaccess::UserSliceWriter,
+        offset: &mut kernel::fs::file::Offset,
+    ) -> Result<usize> {
+        let mut buf = [0u8; 4096];
+        let n = match self.state.ring.try_lock() {
+            Some(mut guard) => guard.read(&mut buf),
+            None => 0,
+        };
+        if n == 0 {
+            return Ok(0);
+        }
+        writer.write_slice_file(&buf[..n], offset)
+    }
+}
+
+kernel::usb_device_table!(
+    USB_TABLE,
+    MODULE_USB_TABLE,
+    <GvUsb2Driver as usb::Driver>::IdInfo,
+    [(usb::DeviceId::from_id(0x04BB, 0x0532), ()),]
+);
+
+impl usb::Driver for GvUsb2Driver {
+    type IdInfo = ();
+    type Data<'bound> = Self;
+    const ID_TABLE: usb::IdTable<Self::IdInfo> = &USB_TABLE;
+
+    /// Probe the GV-USB2 device.
+    ///
+    /// Matches only audio interface 2 (isochronous endpoint 4).
+    /// Switches to altsetting 1, initializes the ADC, submits four isochronous
+    /// URBs, and exposes the audio stream via debugfs.
+    fn probe<'bound>(
+        intf: &'bound usb::Interface<device::Core<'_>>,
+        _id: &usb::DeviceId,
+        _info: &'bound Self::IdInfo,
+    ) -> impl PinInit<Self, Error> + 'bound {
+        let dev: &device::Device<device::Core<'_>> = intf.as_ref();
+
+        dev_dbg!(
+            dev,
+            "INTERFACE {}: num altsettings = {}\n",
+            intf.cur_altsetting().number(),
+            intf.altsettings().len(),
+        );
+        for endpoint in intf.cur_altsetting().endpoints() {
+            dev_dbg!(
+                dev,
+                "  endpoint dir: {:?}, endpoint type: {:?}\n",
+                endpoint.endpoint_dir(),
+                endpoint.endpoint_type()
+            );
+        }
+
+        if intf.cur_altsetting().class() == usb::ch9::InterfaceClass::AUDIO {
+            // Audio class is supported by snd-usb-audio, reject the interface.
+            return Err(ENODEV);
+        }
+
+        // Interface 2 is the audio one for gv-usb2, skip the others
+        if intf.cur_altsetting().number() != 2 {
+            return Err(ENODEV);
+        }
+
+        // Switch to altsetting 1 (full-bandwidth).
+        intf.set_interface(1)?;
+
+        let audio_ep = find_audio_endpoint(intf)?;
+        dev_dbg!(
+            dev,
+            "Found audio endpoint: {}\n",
+            audio_ep.endpoint_number()
+        );
+
+        let buf = KBox::new([0; 32_768], GFP_KERNEL)?;
+        let audio: Arc<AudioState> = Arc::pin_init(
+            pin_init!(AudioState {
+                ring <- new_spinlock!(AudioRingBuffer {
+                    buf,
+                    head: 0,
+                    tail: 0,
+                    mask: 32_767,
+                }),
+            }),
+            GFP_KERNEL,
+        )?;
+
+        // Initialize the audio ADC: GPIO, AC97 disable, I2S enable.
+        reset_adc(intf)?;
+
+        let urbs = submit_audio_urbs(intf, audio_ep, &audio)?;
+
+        let dir = debugfs::Dir::new(c"gv-usb2");
+        let file = KBox::pin_init(
+            dir.read_binary_file(
+                c"audio_raw",
+                IsocCapture {
+                    state: audio.clone(),
+                },
+            ),
+            GFP_KERNEL,
+        )?;
+
+        let driver = Self {
+            _audio: audio,
+            _urbs: urbs,
+            _capture_file: file,
+            _debugfs_dir: dir,
+        };
+
+        dev_dbg!(dev, "GV-USB2 successfully initialized\n");
+        Ok(driver)
+    }
+
+    /// Disconnect the GV-USB2 device.
+    ///
+    /// All resources are cleaned up when dropped.
+    fn disconnect<'bound>(intf: &'bound usb::Interface<device::Core<'_>>, _data: Pin<&Self>) {
+        let dev: &device::Device<device::Core<'_>> = intf.as_ref();
+        dev_dbg!(dev, "GV-USB2 disconnected\n");
+    }
+}
+
+/// Write a vendor-specific control register on the GV-USB2 device.
+///
+/// Uses a vendor-type control request (`REQ_WRITE_REG`) to write the
+/// given `value` to the given `reg` address.
+fn write_reg(intf: &usb::Interface<device::Bound>, reg: u16, value: u8) -> Result {
+    let req = usb::ch9::CtrlRequest::new(
+        usb::ch9::RequestType::new(
+            usb::ch9::Direction::Out,
+            usb::ch9::Type::Vendor,
+            usb::ch9::Recipient::Device,
+        ),
+        regs::REQ_WRITE_REG,
+        u16::from(value),
+        reg,
+        0,
+    );
+    let dev: &usb::Device<device::Bound> = intf.as_ref();
+    dev.control_msg(&req, None, Delta::from_millis(1_000))
+        .map(|_| ())
+}
+
+/// Initialize the audio ADC on the GV-USB2.
+///
+/// Configures GPIO direction and output values, disables the AC97 codec,
+/// and enables the I2S interface.
+fn reset_adc(intf: &usb::Interface<device::Bound>) -> Result {
+    // GPIO: bits 4+5 as outputs; SOUND_ENABLE=0 (active), SDA_RESET=1 (inactive)
+    write_reg(intf, regs::GPIO_CTRL + 2, 0x30)?;
+    write_reg(intf, regs::GPIO_CTRL, 0x10)?;
+    // Disable AC97, enable I2S
+    write_reg(intf, regs::AC97_CTRL, 0x00)?;
+    write_reg(intf, regs::I2S_CTRL, 0x01)
+}
+
+/// Completion callback for isochronous audio URBs.
+///
+/// Copies received audio data into the ring buffer and resubmits the URB.
+fn audio_complete(result: usb::UrbResult<'_, AudioState>) {
+    let Ok(urb_data) = result.check_or_resubmit(GFP_ATOMIC) else {
+        return;
+    };
+
+    if let Some(state) = urb_data.context() {
+        let mut ring_guard = state.ring.lock();
+        for desc in urb_data.iso_frame_descs() {
+            if let Ok(data) = urb_data.data_from_iso_packet_desc(desc) {
+                ring_guard.write(data);
+            }
+        }
+    }
+
+    let _ = urb_data.resubmit(GFP_ATOMIC);
+}
+
+/// Create and submit isochronous URBs for audio capture.
+///
+/// URBs are resubmitted continuously by `audio_complete`.
+fn submit_audio_urbs(
+    intf: &usb::Interface<device::Bound>,
+    ep: &usb::HostEndpoint,
+    audio: &Arc<AudioState>,
+) -> Result<[Option<usb::UrbHandle<AudioState, usb::Active>>; NUM_URBS]> {
+    const PACKETS_PER_URB: u32 = 8;
+    const URB_BUF_SIZE: usize = (PACKETS_PER_URB as usize) * (MAX_AUDIO_PACKET_SIZE as usize);
+
+    let dev: &usb::Device<device::Bound> = intf.as_ref();
+    let pipe = usb::Pipe::new_receive_isoc_pipe(dev, ep);
+    let mut urbs = [const { None }; NUM_URBS];
+    for active_urb in urbs.iter_mut().take(NUM_URBS) {
+        let buf = KBox::new([0u8; URB_BUF_SIZE], GFP_KERNEL)?;
+        let urb_handle = usb::Urb::<AudioState>::new_isoc(
+            GFP_KERNEL,
+            intf,
+            pipe,
+            buf,
+            Some(audio.clone()),
+            audio_complete,
+            PACKETS_PER_URB,
+            MAX_AUDIO_PACKET_SIZE,
+            usb::TransferFlag::IsoAsap.into(),
+            i32::from(ep.interval()),
+        )?;
+        active_urb.replace(urb_handle.submit(GFP_KERNEL)?);
+    }
+    Ok(urbs)
+}
+
+/// Attempt to find the isochronous audio IN endpoint on the interface.
+fn find_audio_endpoint(intf: &usb::Interface) -> Result<&usb::HostEndpoint> {
+    for altsetting in intf.altsettings() {
+        for ep in altsetting.endpoints() {
+            if ep.endpoint_dir() == usb::ch9::Direction::In
+                && ep.endpoint_type() == usb::EndpointType::Isoc
+                && ep.endpoint_number() == 4
+                && ep.maxp() == MAX_AUDIO_PACKET_SIZE
+            {
+                return Ok(ep);
+            }
+        }
+    }
+    Err(ENODEV)
+}
diff --git a/drivers/media/usb/gv-usb2/gv_usb2.rs b/drivers/media/usb/gv-usb2/gv_usb2.rs
new file mode 100644
index 000000000000..e42c61c54773
--- /dev/null
+++ b/drivers/media/usb/gv-usb2/gv_usb2.rs
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust GV-USB2 driver.
+
+use crate::driver::GvUsb2Driver;
+
+kernel::module_usb_driver! {
+    type: GvUsb2Driver,
+    name: "gv_usb2",
+    authors: ["Colin Braun"],
+    description: "GV-USB2 Composite-USB Video Capture Device",
+    license: "GPL v2",
+}
+
+mod driver;
+mod regs;
diff --git a/drivers/media/usb/gv-usb2/regs.rs b/drivers/media/usb/gv-usb2/regs.rs
new file mode 100644
index 000000000000..cc96086d5d40
--- /dev/null
+++ b/drivers/media/usb/gv-usb2/regs.rs
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// USB Requests
+
+/// USB request value to read to a register on the STK1150.
+#[allow(dead_code)]
+pub(crate) const REQ_READ_REG: u8 = 0x00;
+
+/// USB request value to write to a register on the STK1150.
+pub(crate) const REQ_WRITE_REG: u8 = 0x01;
+
+// Registers (accessed via REQ_READ_REG and REQ_WRITE_REG)
+
+/// GPIO Control Register.
+///
+/// b31:    EEPROM Disable
+/// b25-16: DIR
+/// b9-0:   VALUE
+pub(crate) const GPIO_CTRL: u16 = 0x0000;
+
+/// Audio Control Register 0.
+pub(crate) const AC97_CTRL: u16 = 0x0500;
+
+/// I2S Control Register.
+pub(crate) const I2S_CTRL: u16 = 0x050C;

-- 
2.54.0


