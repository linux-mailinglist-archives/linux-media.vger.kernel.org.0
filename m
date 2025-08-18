Return-Path: <linux-media+bounces-40081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EC3B2992E
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30BA42057F4
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 05:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3602D2749CE;
	Mon, 18 Aug 2025 05:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="L9hkX4pJ"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4442274653;
	Mon, 18 Aug 2025 05:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755496353; cv=pass; b=N9yh9BuGXoyLyFjHMOY+8boyiNGKa+OwZPQs5I1nPIJ6L0XhS6b6hBdUd8VQbbNk/8QCeyCTr3zcD2xiNXk54XC8dNviVYDXa2loe1IIQ1xdjS668mkh2NzS7BSmPUz0vujVi7h5dM0lIpfFD4yZyKuiswmVa8DcNYKgS/fhU8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755496353; c=relaxed/simple;
	bh=2mC6huSFMyjKGY4Vs5To1W/7YJ7ioSWozaHjI30bZoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3ZNy0+5ufQdvPI64/C1T3u7Isq2UhL9WNN6sLjFEOyHEmeuV96ThU06GCEcUwIAh1ji0g0NJf3P0Ywhin0iZxi1CwzEMWjMyDe9EicIy5mz/IgwtGtnnRCwCHCPp16Bbfk+Dc8/wZ4sZqY5OUOhjPE/iUXgV+aPh89H1EQ7L7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=L9hkX4pJ; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755496323; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lPdPAkwp6kzlNYjZBQKF/+tZBemZKJqPA6ntJ9QVPogNmwArMrAcF1tcUXHEKwV9ZrxXt+4mhowKw8UlDzQ1MAdn78usFpkgO4PLtAxiav6q0qjyvqSHEeUc1JHdF8A+CCZW7jqh6aLJUg70ce0qzO0rVpy73vcHKLQrjoPT+qM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755496323; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=43OVXWZOAxCG43vn60JKBBXKXOTNgzmdXhw4qNDpMFY=; 
	b=nSX7YXysXwn0lzPXVv0SELLCOOn0UYJyDE2AhiMyI7R9XfHgMTBpcxbP8YgdR9+SRgQ3qkUaibfcMvR9Lwhcv1l+//BIRYzxrkc2nhjxbqKab2w+x1Pos4XJ/zxVp6zf6buVp30PmDFPMXjoU5uqJcvKHQgeKPL9UnA91TJNwDM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755496323;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=43OVXWZOAxCG43vn60JKBBXKXOTNgzmdXhw4qNDpMFY=;
	b=L9hkX4pJDmhw4LYLZ0BF9jh0P09/A0sBLrWRGjamIjhulY0irhki4XJpt/WrcxU+
	fFzV1GXm5IFoNiYrYlKKIPDrgWwZbp7YbEDGSJFSd+jNnrX0iVtu4eTfcvO4hswX+TO
	/PWwH6/v94+CFUi239/c8riyp9GNcMbKJ9nJnV/M=
Received: by mx.zohomail.com with SMTPS id 1755496320579535.6656496966112;
	Sun, 17 Aug 2025 22:52:00 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 18 Aug 2025 02:49:53 -0300
Subject: [PATCH 7/7] rust: samples: add the v4l2 sample driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-v4l2-v1-7-6887e772aac2@collabora.com>
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
In-Reply-To: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 kernel@collabora.com, linux-media@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

This driver is the only user of the v4l2 abstractions at the moment. It
serves as a means to validate the abstractions by proving that the
device is actually registered as /dev/videoX, and it can be opened and
queried by v4l2-ctl, while also serving as a display of the current v4l2
support in Rust, as well as a blueprint for more elaborate Rust v4l2
drivers in the future.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 MAINTAINERS                      |   1 +
 samples/rust/Kconfig             |  11 +++
 samples/rust/Makefile            |   1 +
 samples/rust/rust_driver_v4l2.rs | 145 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 158 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6fc5d57950e474d73d5d65271a0394efc5a8960b..14521bc0585503992da582f2cee361666985e39f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15440,6 +15440,7 @@ L:	linux-media@vger.kernel.org
 L:	rust-for-linux@vger.kernel.org
 S:	Supported
 F:	rust/media
+F:	sample/rust/rust_driver_v4l2.rs
 
 MEDIATEK BLUETOOTH DRIVER
 M:	Sean Wang <sean.wang@mediatek.com>
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 7f7371a004ee0a8f67dca99c836596709a70c4fa..64422acf1e9da9d05f904e14fd423b3b4aef173a 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -105,6 +105,17 @@ config SAMPLE_RUST_DRIVER_AUXILIARY
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_V4L2
+	tristate "Video4Linux2 driver"
+	depends on MEDIA_SUPPORT && VIDEO_DEV
+	help
+	  This option builds the Rust V4L2 driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_driver_v4l2.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_HOSTPROGS
 	bool "Host programs"
 	help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index bd2faad63b4f3befe7d1ed5139fe25c7a8b6d7f6..57e21f0373938bb70b4cb400ea550010895b4c94 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_V4L2)		+= rust_driver_v4l2.o
 obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
 
 rust_print-y := rust_print_main.o rust_print_events.o
diff --git a/samples/rust/rust_driver_v4l2.rs b/samples/rust/rust_driver_v4l2.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a3ef98a613f2fed9e8589f0761ce7e43029c02b6
--- /dev/null
+++ b/samples/rust/rust_driver_v4l2.rs
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-copyrightText: Copyright (C) 2025 Collabora Ltd.
+
+//! Rust V4L2 sample driver.
+//!
+//! This sample demonstrates how to:
+//! - Register a V4L2 device (struct v4l2_device),
+//! - Register a video node (struct video_device) using the Rust V4L2
+//!   abstractions,
+//! - Implement support for a V4L2 ioctl in a driver.
+//!
+//! It implements only `VIDIOC_QUERYCAP` and minimal open/close handling.
+
+use kernel::{
+    c_str,
+    device::Core,
+    media::v4l2::{
+        self,
+        caps::{self, DeviceCaps},
+        video,
+    },
+    of, platform,
+    prelude::*,
+    types::ARef,
+    ThisModule,
+};
+
+/// The private data associated with the V4L2 device.
+#[pin_data]
+struct Data {}
+
+/// The private data associated with a V4L2 device node, i.e. `struct
+/// video_device`.
+#[pin_data]
+struct VideoData {}
+
+/// The private data associated with a V4L2 file, i.e. `struct v4l2_fh`.
+#[pin_data]
+struct File {}
+
+impl v4l2::file::DriverFile for File {
+    type Driver = SampleDriver;
+
+    const MODULE: &'static ThisModule = &THIS_MODULE;
+
+    fn open(_vdev: &v4l2::video::Device<Self::Driver>) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {})
+    }
+}
+
+struct SampleDriver {
+    _pdev: ARef<platform::Device>,
+    _v4l2_reg: v4l2::device::Registration<Self>,
+    video_reg: video::Registration<Self>,
+}
+
+impl v4l2::device::Driver for SampleDriver {
+    type Data = Data;
+}
+
+#[vtable]
+impl video::Driver for SampleDriver {
+    type Data = VideoData;
+    type File = File;
+
+    const NODE_TYPE: video::NodeType = video::NodeType::Video;
+    const DIRECTION: video::Direction = video::Direction::Rx;
+    const NAME: &'static CStr = c_str!("rv4l2");
+    const CAPS: DeviceCaps = caps::device_caps::VIDEO_CAPTURE;
+
+    fn querycap(
+        _file: &v4l2::file::File<Self::File>,
+        _data: &<Self as video::Driver>::Data,
+        cap: &mut caps::Capabilities,
+    ) -> Result {
+        cap.set_driver(c_str!("rv4l2"))?;
+        cap.set_card(c_str!("rv4l2"))?;
+        cap.set_bus_info(c_str!("platform:rv4l2"))?;
+
+        cap.set_device_caps(Self::CAPS);
+        Ok(())
+    }
+}
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <SampleDriver as platform::Driver>::IdInfo,
+    [(of::DeviceId::new(c_str!("test, rust-v4l2")), ())]
+);
+
+impl platform::Driver for SampleDriver {
+    type IdInfo = ();
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(
+        pdev: &platform::Device<Core>,
+        _info: Option<&Self::IdInfo>,
+    ) -> Result<Pin<KBox<Self>>> {
+        let dev = pdev.as_ref();
+
+        let v4l2_reg =
+            v4l2::device::Registration::<Self>::new(dev, try_pin_init!(Data {}), GFP_KERNEL)?;
+
+        let video_reg = video::Registration::<Self>::new(
+            v4l2_reg.device(),
+            try_pin_init!(VideoData {}),
+            GFP_KERNEL,
+        )?;
+
+        let this = KBox::new(
+            Self {
+                _pdev: pdev.into(),
+                _v4l2_reg: v4l2_reg,
+                video_reg,
+            },
+            GFP_KERNEL,
+        )?;
+
+        dev_info!(
+            dev,
+            "Registered /dev/video{}\n",
+            this.video_reg.device().num()
+        );
+        Ok(this.into())
+    }
+
+    fn unbind(pdev: &platform::Device<Core>, _this: Pin<&Self>) {
+        dev_info!(pdev.as_ref(), "Unbinding Rust V4L2 sample driver\n");
+    }
+}
+
+impl Drop for SampleDriver {
+    fn drop(&mut self) {
+        dev_dbg!(self._pdev.as_ref(), "Rust V4L2 sample driver removed\n");
+    }
+}
+
+kernel::module_platform_driver! {
+    type: SampleDriver,
+    name: "rust_driver_v4l2",
+    authors: ["Daniel Almeida"],
+    description: "Rust V4L2 sample video driver",
+    license: "GPL v2",
+}

-- 
2.50.1


