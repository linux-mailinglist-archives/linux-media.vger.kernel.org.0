Return-Path: <linux-media+bounces-43495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D94BBBB0E08
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C148B1947BAF
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAFB30F7FC;
	Wed,  1 Oct 2025 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyzts3bU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60A0303A02;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330200; cv=none; b=eZGZ+Jgxk+/ZHNRulFy6RDA1bC9oeW0V+HWHt4LUbjHg5tbitUYglo4LVYGeTZgwWRBGc+dTVGRXLIZx6HOn3Q7ilMEh3E7lJlW8mrND/qijPlikS5Nx/WcDsZgHQUKYHxUIs1qAgkiynvasnpdWjC7MZn+pwvJ9js6keQG4YC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330200; c=relaxed/simple;
	bh=tgVIMdwcdbqiKQ9uBnktU+KN5sWdbtd2DlFPZEaPvyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSIbiE1tV5tslDv+e1PHiSDy+ReoA706BOUXgDbDpP85FylKaLZUXxrZCblqbAvLd/hvi9vkpFNXPg0LnNH4uG27OSPziGwxNtgt8+rrIH3CV89CKhT3RYgoqE/26kL4z7vdlOT6mH1edjQtcpFduTat4varJgV+h+fCA2vzCIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyzts3bU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E2EC2BCB7;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=tgVIMdwcdbqiKQ9uBnktU+KN5sWdbtd2DlFPZEaPvyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fyzts3bUWNDwxVctfF+5gyym6E06gbkVeZBTfKHEfcWC4YJfFoD6t7Cy6SjOFit5k
	 eTEjk3rmGgWp7lM8t+U7v9ZV8VbtHHF6sg74S4x/DrWf8P+gjjd4pUfYjXSuUGvnq4
	 e20o9/viaJLeB9KtavYvAQBqXXXgWg7pUvWPXx8RTOEmAwZ0liEnOphb7tNIKzyoIK
	 GMLqeXrYwnSiTu5sovLIwiGTahIlKXzCXf8ZNK46eSKumMd6n8kFPkcsExT1pteRHF
	 GvsOJxo3UbYP9mEY/PMSNlI0EQ4vuBZg6fCNsq/qwlOqsklRsULz3Ui73yQApp5D1D
	 kAHZbl5z9suBQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLIu-267v;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Dan Scally <djrscally@gmail.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Keke Li <keke.li@amlogic.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Yong Zhi <yong.zhi@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 14/23] docs: media: add missing c namespace to V4L headers
Date: Wed,  1 Oct 2025 16:49:37 +0200
Message-ID: <b69fc5bd43da7d326b9f4720df59388088c64065.1759329363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759329363.git.mchehab+huawei@kernel.org>
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Media references belong to V4L namespace. Fix a lot of broken
links when including videodev2.h and probably fixing several
other broken cross-references between different files inside
media docs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/app-pri.rst                | 1 +
 Documentation/userspace-api/media/v4l/audio.rst                  | 1 +
 Documentation/userspace-api/media/v4l/biblio.rst                 | 1 +
 Documentation/userspace-api/media/v4l/capture-example.rst        | 1 +
 Documentation/userspace-api/media/v4l/capture.c.rst              | 1 +
 Documentation/userspace-api/media/v4l/colorspaces-defs.rst       | 1 +
 Documentation/userspace-api/media/v4l/colorspaces-details.rst    | 1 +
 Documentation/userspace-api/media/v4l/colorspaces.rst            | 1 +
 Documentation/userspace-api/media/v4l/common-defs.rst            | 1 +
 Documentation/userspace-api/media/v4l/common.rst                 | 1 +
 Documentation/userspace-api/media/v4l/compat.rst                 | 1 +
 Documentation/userspace-api/media/v4l/control.rst                | 1 +
 Documentation/userspace-api/media/v4l/crop.rst                   | 1 +
 Documentation/userspace-api/media/v4l/depth-formats.rst          | 1 +
 Documentation/userspace-api/media/v4l/dev-decoder.rst            | 1 +
 Documentation/userspace-api/media/v4l/dev-encoder.rst            | 1 +
 Documentation/userspace-api/media/v4l/dev-event.rst              | 1 +
 Documentation/userspace-api/media/v4l/dev-mem2mem.rst            | 1 +
 Documentation/userspace-api/media/v4l/dev-meta.rst               | 1 +
 Documentation/userspace-api/media/v4l/dev-osd.rst                | 1 +
 Documentation/userspace-api/media/v4l/dev-overlay.rst            | 1 +
 Documentation/userspace-api/media/v4l/dev-radio.rst              | 1 +
 Documentation/userspace-api/media/v4l/dev-sdr.rst                | 1 +
 Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst  | 1 +
 Documentation/userspace-api/media/v4l/dev-subdev.rst             | 1 +
 Documentation/userspace-api/media/v4l/dev-touch.rst              | 1 +
 Documentation/userspace-api/media/v4l/devices.rst                | 1 +
 Documentation/userspace-api/media/v4l/dv-timings.rst             | 1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst       | 1 +
 .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst        | 1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst        | 1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst  | 1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-detect.rst       | 1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-dv.rst           | 1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst        | 1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst        | 1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst        | 1 +
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst          | 1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst | 1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-jpeg.rst         | 1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-rf-tuner.rst     | 1 +
 Documentation/userspace-api/media/v4l/extended-controls.rst      | 1 +
 Documentation/userspace-api/media/v4l/field-order.rst            | 1 +
 Documentation/userspace-api/media/v4l/fourcc.rst                 | 1 +
 Documentation/userspace-api/media/v4l/hsv-formats.rst            | 1 +
 Documentation/userspace-api/media/v4l/libv4l.rst                 | 1 +
 Documentation/userspace-api/media/v4l/meta-formats.rst           | 1 +
 Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst         | 1 +
 Documentation/userspace-api/media/v4l/metafmt-d4xx.rst           | 1 +
 Documentation/userspace-api/media/v4l/metafmt-generic.rst        | 1 +
 Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst     | 1 +
 Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst        | 1 +
 Documentation/userspace-api/media/v4l/metafmt-pisp-fe.rst        | 1 +
 Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst         | 1 +
 Documentation/userspace-api/media/v4l/metafmt-uvc.rst            | 1 +
 Documentation/userspace-api/media/v4l/metafmt-vivid.rst          | 1 +
 Documentation/userspace-api/media/v4l/metafmt-vsp1-hgo.rst       | 1 +
 Documentation/userspace-api/media/v4l/metafmt-vsp1-hgt.rst       | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-bayer.rst           | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-cnf4.rst            | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst      | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-indexed.rst         | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-intro.rst           | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-inzi.rst            | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-m420.rst            | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-packed-hsv.rst      | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst      | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst        | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-rgb.rst             | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-sdr-cs08.rst        | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-sdr-cs14le.rst      | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-sdr-cu08.rst        | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-sdr-cu16le.rst      | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu16be.rst     | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu18be.rst     | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu20be.rst     | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-sdr-ru12le.rst      | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst    | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-srggb10.rst         | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-srggb10alaw8.rst    | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-srggb10dpcm8.rst    | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-srggb10p.rst        | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-srggb12.rst         | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst        | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-srggb14.rst         | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst        | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst         | 1 +
 .../userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst          | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst          | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-tch-td08.rst        | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-tch-td16.rst        | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-tch-tu08.rst        | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-tch-tu16.rst        | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-uv8.rst             | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst     | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst            | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-y12i.rst            | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-y16i.rst            | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-y8i.rst             | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst        | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst      | 1 +
 Documentation/userspace-api/media/v4l/pixfmt-z16.rst             | 1 +
 Documentation/userspace-api/media/v4l/pixfmt.rst                 | 1 +
 Documentation/userspace-api/media/v4l/planar-apis.rst            | 1 +
 Documentation/userspace-api/media/v4l/querycap.rst               | 1 +
 Documentation/userspace-api/media/v4l/sdr-formats.rst            | 1 +
 .../userspace-api/media/v4l/selection-api-configuration.rst      | 1 +
 Documentation/userspace-api/media/v4l/selection-api-examples.rst | 1 +
 Documentation/userspace-api/media/v4l/selection-api-intro.rst    | 1 +
 Documentation/userspace-api/media/v4l/selection-api-targets.rst  | 1 +
 .../userspace-api/media/v4l/selection-api-vs-crop-api.rst        | 1 +
 Documentation/userspace-api/media/v4l/selection-api.rst          | 1 +
 Documentation/userspace-api/media/v4l/selections-common.rst      | 1 +
 Documentation/userspace-api/media/v4l/standard.rst               | 1 +
 Documentation/userspace-api/media/v4l/subdev-formats.rst         | 1 +
 Documentation/userspace-api/media/v4l/tch-formats.rst            | 1 +
 Documentation/userspace-api/media/v4l/tuner.rst                  | 1 +
 Documentation/userspace-api/media/v4l/user-func.rst              | 1 +
 Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst   | 1 +
 Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst | 1 +
 Documentation/userspace-api/media/v4l/v4l2.rst                   | 1 +
 Documentation/userspace-api/media/v4l/v4l2grab-example.rst       | 1 +
 Documentation/userspace-api/media/v4l/v4l2grab.c.rst             | 1 +
 Documentation/userspace-api/media/v4l/video.rst                  | 1 +
 Documentation/userspace-api/media/v4l/videodev.rst               | 1 +
 Documentation/userspace-api/media/v4l/yuv-formats.rst            | 1 +
 126 files changed, 126 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/app-pri.rst b/Documentation/userspace-api/media/v4l/app-pri.rst
index 626a42f2e138..47d96cd64525 100644
--- a/Documentation/userspace-api/media/v4l/app-pri.rst
+++ b/Documentation/userspace-api/media/v4l/app-pri.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _app-pri:
 
diff --git a/Documentation/userspace-api/media/v4l/audio.rst b/Documentation/userspace-api/media/v4l/audio.rst
index 17f0b1c89908..3b424440e478 100644
--- a/Documentation/userspace-api/media/v4l/audio.rst
+++ b/Documentation/userspace-api/media/v4l/audio.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _audio:
 
diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
index 856acf6a890c..9721247e66ef 100644
--- a/Documentation/userspace-api/media/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 **********
 References
diff --git a/Documentation/userspace-api/media/v4l/capture-example.rst b/Documentation/userspace-api/media/v4l/capture-example.rst
index 25891320b7ad..f018a654f59c 100644
--- a/Documentation/userspace-api/media/v4l/capture-example.rst
+++ b/Documentation/userspace-api/media/v4l/capture-example.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _capture-example:
 
diff --git a/Documentation/userspace-api/media/v4l/capture.c.rst b/Documentation/userspace-api/media/v4l/capture.c.rst
index 349541b1dac0..aae17e1e844a 100644
--- a/Documentation/userspace-api/media/v4l/capture.c.rst
+++ b/Documentation/userspace-api/media/v4l/capture.c.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 file: media/v4l/capture.c
 =========================
diff --git a/Documentation/userspace-api/media/v4l/colorspaces-defs.rst b/Documentation/userspace-api/media/v4l/colorspaces-defs.rst
index fe9f8aa8ab9d..0b40e735f3bf 100644
--- a/Documentation/userspace-api/media/v4l/colorspaces-defs.rst
+++ b/Documentation/userspace-api/media/v4l/colorspaces-defs.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 ****************************
 Defining Colorspaces in V4L2
diff --git a/Documentation/userspace-api/media/v4l/colorspaces-details.rst b/Documentation/userspace-api/media/v4l/colorspaces-details.rst
index 26a4ace42ca5..f29b0e3978bc 100644
--- a/Documentation/userspace-api/media/v4l/colorspaces-details.rst
+++ b/Documentation/userspace-api/media/v4l/colorspaces-details.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 ********************************
 Detailed Colorspace Descriptions
diff --git a/Documentation/userspace-api/media/v4l/colorspaces.rst b/Documentation/userspace-api/media/v4l/colorspaces.rst
index 2aa0dda4fd01..11954d7cf999 100644
--- a/Documentation/userspace-api/media/v4l/colorspaces.rst
+++ b/Documentation/userspace-api/media/v4l/colorspaces.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _colorspaces:
 
diff --git a/Documentation/userspace-api/media/v4l/common-defs.rst b/Documentation/userspace-api/media/v4l/common-defs.rst
index 6ae42ac7ddb7..329ba6ec760b 100644
--- a/Documentation/userspace-api/media/v4l/common-defs.rst
+++ b/Documentation/userspace-api/media/v4l/common-defs.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _common-defs:
 
diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
index ea0435182e44..507c35fec8ce 100644
--- a/Documentation/userspace-api/media/v4l/common.rst
+++ b/Documentation/userspace-api/media/v4l/common.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _common:
 
diff --git a/Documentation/userspace-api/media/v4l/compat.rst b/Documentation/userspace-api/media/v4l/compat.rst
index b63b8392dec6..f766ea89f9ff 100644
--- a/Documentation/userspace-api/media/v4l/compat.rst
+++ b/Documentation/userspace-api/media/v4l/compat.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _compat:
 
diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
index 9253cc946f02..19372bb32c4b 100644
--- a/Documentation/userspace-api/media/v4l/control.rst
+++ b/Documentation/userspace-api/media/v4l/control.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _control:
 
diff --git a/Documentation/userspace-api/media/v4l/crop.rst b/Documentation/userspace-api/media/v4l/crop.rst
index 3fe185e25ccf..c5f389aca275 100644
--- a/Documentation/userspace-api/media/v4l/crop.rst
+++ b/Documentation/userspace-api/media/v4l/crop.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _crop:
 
diff --git a/Documentation/userspace-api/media/v4l/depth-formats.rst b/Documentation/userspace-api/media/v4l/depth-formats.rst
index b4f3fc229c85..bd61064d51d3 100644
--- a/Documentation/userspace-api/media/v4l/depth-formats.rst
+++ b/Documentation/userspace-api/media/v4l/depth-formats.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _depth-formats:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
index ef8e8cf31f90..eb662ced0ab4 100644
--- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
+.. c:namespace:: V4L
 
 .. _decoder:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
index 6c523c69bdce..cdad276d00bc 100644
--- a/Documentation/userspace-api/media/v4l/dev-encoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _encoder:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-event.rst b/Documentation/userspace-api/media/v4l/dev-event.rst
index f34f9cf6ce6c..f61d774f0153 100644
--- a/Documentation/userspace-api/media/v4l/dev-event.rst
+++ b/Documentation/userspace-api/media/v4l/dev-event.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _event:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-mem2mem.rst b/Documentation/userspace-api/media/v4l/dev-mem2mem.rst
index 7041bb3d5b8d..6058eeaefca4 100644
--- a/Documentation/userspace-api/media/v4l/dev-mem2mem.rst
+++ b/Documentation/userspace-api/media/v4l/dev-mem2mem.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _mem2mem:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-meta.rst b/Documentation/userspace-api/media/v4l/dev-meta.rst
index 5eee9ab60395..da706d01b808 100644
--- a/Documentation/userspace-api/media/v4l/dev-meta.rst
+++ b/Documentation/userspace-api/media/v4l/dev-meta.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _metadata:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-osd.rst b/Documentation/userspace-api/media/v4l/dev-osd.rst
index 8e4be9129e75..f37450b1b631 100644
--- a/Documentation/userspace-api/media/v4l/dev-osd.rst
+++ b/Documentation/userspace-api/media/v4l/dev-osd.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _osd:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-overlay.rst b/Documentation/userspace-api/media/v4l/dev-overlay.rst
index d52977120b41..b7f4302eee6e 100644
--- a/Documentation/userspace-api/media/v4l/dev-overlay.rst
+++ b/Documentation/userspace-api/media/v4l/dev-overlay.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _overlay:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-radio.rst b/Documentation/userspace-api/media/v4l/dev-radio.rst
index 284ce96a1637..843a2151f470 100644
--- a/Documentation/userspace-api/media/v4l/dev-radio.rst
+++ b/Documentation/userspace-api/media/v4l/dev-radio.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _radio:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-sdr.rst b/Documentation/userspace-api/media/v4l/dev-sdr.rst
index dfdeddbca41f..99907adc0628 100644
--- a/Documentation/userspace-api/media/v4l/dev-sdr.rst
+++ b/Documentation/userspace-api/media/v4l/dev-sdr.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _sdr:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
index 35ed05f2695e..e311f0c13272 100644
--- a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
+.. c:namespace:: V4L
 
 .. _stateless_decoder:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 161b43f1ce66..d1ad0a2e0cfc 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _subdev:
 
diff --git a/Documentation/userspace-api/media/v4l/dev-touch.rst b/Documentation/userspace-api/media/v4l/dev-touch.rst
index a71b9def5d58..808957cd9afc 100644
--- a/Documentation/userspace-api/media/v4l/dev-touch.rst
+++ b/Documentation/userspace-api/media/v4l/dev-touch.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _touch:
 
diff --git a/Documentation/userspace-api/media/v4l/devices.rst b/Documentation/userspace-api/media/v4l/devices.rst
index 8bfbad65a9d4..d4790b9ef81a 100644
--- a/Documentation/userspace-api/media/v4l/devices.rst
+++ b/Documentation/userspace-api/media/v4l/devices.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _devices:
 
diff --git a/Documentation/userspace-api/media/v4l/dv-timings.rst b/Documentation/userspace-api/media/v4l/dv-timings.rst
index 4b19bcb4bd80..9f117c82df1b 100644
--- a/Documentation/userspace-api/media/v4l/dv-timings.rst
+++ b/Documentation/userspace-api/media/v4l/dv-timings.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _dv-timings:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index cdc515c60468..b4daa7e28dc0 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _camera-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 0da635691fdc..497ae74379f6 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _codec-stateless-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 4a379bd9e3fb..c8890cb5e00a 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _codec-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
index 1e7265155715..38a4136d7220 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _colorimetry-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-detect.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-detect.rst
index 312c4fa94dc3..ee2b7e37c1d9 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-detect.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-detect.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _detect-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-dv.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-dv.rst
index d2794e03ac6d..5918dde83efb 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-dv.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-dv.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _dv-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
index d22c5efb806a..bd024ab461a4 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _flash-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
index ccd439e9e0e3..b7284768f7ea 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _fm-rx-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
index cb40cf4cc3ec..7143a4c08f78 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _fm-tx-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index 27803dca8d3e..6d516f041ca2 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _image-process-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 71f23f131f97..f9c0b7ad3b4e 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _image-source-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-jpeg.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-jpeg.rst
index 522095c08469..b114650bca5b 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-jpeg.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-jpeg.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _jpeg-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-rf-tuner.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-rf-tuner.rst
index 8a6f9f0373ff..f50802a1c4d4 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-rf-tuner.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-rf-tuner.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _rf-tuner-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/extended-controls.rst b/Documentation/userspace-api/media/v4l/extended-controls.rst
index 44fcd67f20bf..5fe71da6afc0 100644
--- a/Documentation/userspace-api/media/v4l/extended-controls.rst
+++ b/Documentation/userspace-api/media/v4l/extended-controls.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _extended-controls:
 
diff --git a/Documentation/userspace-api/media/v4l/field-order.rst b/Documentation/userspace-api/media/v4l/field-order.rst
index 9a0ed8fc550f..2a01852513b3 100644
--- a/Documentation/userspace-api/media/v4l/field-order.rst
+++ b/Documentation/userspace-api/media/v4l/field-order.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _field-order:
 
diff --git a/Documentation/userspace-api/media/v4l/fourcc.rst b/Documentation/userspace-api/media/v4l/fourcc.rst
index d3482c40da62..5cea7008814f 100644
--- a/Documentation/userspace-api/media/v4l/fourcc.rst
+++ b/Documentation/userspace-api/media/v4l/fourcc.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
+.. c:namespace:: V4L
 
 Guidelines for Video4Linux pixel format 4CCs
 ============================================
diff --git a/Documentation/userspace-api/media/v4l/hsv-formats.rst b/Documentation/userspace-api/media/v4l/hsv-formats.rst
index d810c914b673..f0731de6f038 100644
--- a/Documentation/userspace-api/media/v4l/hsv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/hsv-formats.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _hsv-formats:
 
diff --git a/Documentation/userspace-api/media/v4l/libv4l.rst b/Documentation/userspace-api/media/v4l/libv4l.rst
index f446dd2d01ac..ce7a0400891c 100644
--- a/Documentation/userspace-api/media/v4l/libv4l.rst
+++ b/Documentation/userspace-api/media/v4l/libv4l.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _libv4l:
 
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 0de80328c36b..d9868ee88a07 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _meta-formats:
 
diff --git a/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
index 449b45c2ec24..24359601ae25 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+.. c:namespace:: V4L
 
 .. _v4l2-meta-fmt-c3isp-stats:
 .. _v4l2-meta-fmt-c3isp-params:
diff --git a/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
index 0686413b16b2..d716170bb795 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-meta-fmt-d4xx:
 
diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
index 78ab56b21682..c5c1abe568bc 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 ********************************************************************************************************************************************************************************************************************************************************************************
 V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O')
diff --git a/Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst b/Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst
index 84d81dd7a7b5..c11d17e5a286 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-meta-fmt-params:
 .. _v4l2-meta-fmt-stat-3a:
diff --git a/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst b/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
index 3281fe366c86..e230177910f4 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
+.. c:namespace:: V4L
 
 .. _v4l2-meta-fmt-rpi-be-cfg:
 
diff --git a/Documentation/userspace-api/media/v4l/metafmt-pisp-fe.rst b/Documentation/userspace-api/media/v4l/metafmt-pisp-fe.rst
index fddeada83e4a..a2aa5c4c2920 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-pisp-fe.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-pisp-fe.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
+.. c:namespace:: V4L
 
 .. _v4l2-meta-fmt-rpi-fe-cfg:
 
diff --git a/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst b/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
index 959f6bde8695..d3c899b0150b 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
+.. c:namespace:: V4L
 
 .. _v4l2-meta-fmt-rk-isp1-stat-3a:
 
diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 4c05e9e54683..c4ae2f13e7f7 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-meta-fmt-uvc:
 
diff --git a/Documentation/userspace-api/media/v4l/metafmt-vivid.rst b/Documentation/userspace-api/media/v4l/metafmt-vivid.rst
index 7173e2c3e245..94f28736dc80 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-vivid.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-vivid.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-meta-fmt-vivid:
 
diff --git a/Documentation/userspace-api/media/v4l/metafmt-vsp1-hgo.rst b/Documentation/userspace-api/media/v4l/metafmt-vsp1-hgo.rst
index 8d886feb180c..70357899a5f0 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-vsp1-hgo.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-vsp1-hgo.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-meta-fmt-vsp1-hgo:
 
diff --git a/Documentation/userspace-api/media/v4l/metafmt-vsp1-hgt.rst b/Documentation/userspace-api/media/v4l/metafmt-vsp1-hgt.rst
index d8830ff605de..4a1575a9e728 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-vsp1-hgt.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-vsp1-hgt.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-meta-fmt-vsp1-hgt:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
index b5ca501842b0..8b4e413177f5 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _pixfmt-bayer:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-cnf4.rst b/Documentation/userspace-api/media/v4l/pixfmt-cnf4.rst
index 8f469290c304..4e3e9c5f4387 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-cnf4.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-cnf4.rst
@@ -1,4 +1,5 @@
 .. -*- coding: utf-8; mode: rst -*-
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-CNF4:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 806ed73ac474..c7efb0465db6 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 ******************
 Compressed Formats
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-indexed.rst b/Documentation/userspace-api/media/v4l/pixfmt-indexed.rst
index 5bd4a47c5854..08d698ebdd64 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-indexed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-indexed.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _pixfmt-indexed:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-intro.rst b/Documentation/userspace-api/media/v4l/pixfmt-intro.rst
index 14239ee826bf..00c1b7b0e907 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-intro.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-intro.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 **********************
 Standard Image Formats
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-inzi.rst b/Documentation/userspace-api/media/v4l/pixfmt-inzi.rst
index 3115c8f6a842..0af3a303a7f0 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-inzi.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-inzi.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-INZI:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-m420.rst b/Documentation/userspace-api/media/v4l/pixfmt-m420.rst
index c01a949e7c11..f44a6c5eaddf 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-m420.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-m420.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-M420:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-hsv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-hsv.rst
index dd89860f50e0..d1cab3c632f1 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-hsv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-hsv.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _packed-hsv:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
index 9f111ed594d2..ae7d88ae1c3d 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _packed-yuv:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index ac52485252d9..1cf6c59f4bc4 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _pixfmt-reserved:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index 5ed4d62df909..cf6760bb6109 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _pixfmt-rgb:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-sdr-cs08.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cs08.rst
index bd6ee6111de4..b2dda90409d9 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-sdr-cs08.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cs08.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-sdr-fmt-cs8:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-sdr-cs14le.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cs14le.rst
index ea21b288d357..df8b4b22ebce 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-sdr-cs14le.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cs14le.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-SDR-FMT-CS14LE:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-sdr-cu08.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cu08.rst
index 45fce09d85ff..86accef8f9f4 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-sdr-cu08.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cu08.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-sdr-fmt-cu8:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-sdr-cu16le.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cu16le.rst
index 7f4242f8da6f..13d8c86e9b1d 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-sdr-cu16le.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-cu16le.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-SDR-FMT-CU16LE:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu16be.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu16be.rst
index a4d4b70ece63..9c4908d57a25 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu16be.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu16be.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-SDR-FMT-PCU16BE:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu18be.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu18be.rst
index 3db690bd683a..56c3f2aee0a4 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu18be.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu18be.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-SDR-FMT-PCU18BE:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu20be.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu20be.rst
index 485343cdf150..1992ee5dd2bc 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu20be.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu20be.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-SDR-FMT-PCU20BE:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-sdr-ru12le.rst b/Documentation/userspace-api/media/v4l/pixfmt-sdr-ru12le.rst
index 2ad4706bfc7a..3b2a94e64bcd 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-sdr-ru12le.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-sdr-ru12le.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-SDR-FMT-RU12LE:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
index 3322b0600f1d..de4720dba48a 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-pix-fmt-ipu3-sbggr10:
 .. _v4l2-pix-fmt-ipu3-sgbrg10:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb10.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb10.rst
index a66414ab4291..6b4950ad54e0 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb10.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb10.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-SRGGB10:
 .. _v4l2-pix-fmt-sbggr10:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb10alaw8.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb10alaw8.rst
index a5ae1f099e68..42176c437ebe 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb10alaw8.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb10alaw8.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-SBGGR10ALAW8:
 .. _v4l2-pix-fmt-sgbrg10alaw8:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb10dpcm8.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb10dpcm8.rst
index f0544c6f4580..dac580181562 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb10dpcm8.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb10dpcm8.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-SBGGR10DPCM8:
 .. _v4l2-pix-fmt-sgbrg10dpcm8:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb10p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb10p.rst
index fd5feb415531..af91f12c24e8 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb10p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb10p.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-SRGGB10P:
 .. _v4l2-pix-fmt-sbggr10p:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb12.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb12.rst
index 15c34e1e4835..2b3212ef732f 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb12.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb12.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-SRGGB12:
 .. _v4l2-pix-fmt-sbggr12:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
index 8c03aedcc00e..cffb3dfc338a 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-SRGGB12P:
 .. _v4l2-pix-fmt-sbggr12p:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb14.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb14.rst
index 4f5120a6c678..7a3552c045a3 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb14.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb14.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-SRGGB14:
 .. _v4l2-pix-fmt-sbggr14:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
index f4f53d7dbdeb..330197aded11 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-SRGGB14P:
 .. _v4l2-pix-fmt-sbggr14p:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst
index 2f2f1ef430d9..dab222f49522 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-SRGGB16:
 .. _v4l2-pix-fmt-sbggr16:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst
index 5a82a15559d6..7a55a3c7c9f6 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-pix-fmt-pisp-comp1-rggb:
 .. _v4l2-pix-fmt-pisp-comp1-grbg:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst
index 02061c5a9778..4cb263a6ea26 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-SRGGB8:
 .. _v4l2-pix-fmt-sbggr8:
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-tch-td08.rst b/Documentation/userspace-api/media/v4l/pixfmt-tch-td08.rst
index ec89f43c60ec..37b03da07cf4 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-tch-td08.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-tch-td08.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-TCH-FMT-DELTA-TD08:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-tch-td16.rst b/Documentation/userspace-api/media/v4l/pixfmt-tch-td16.rst
index 7b59a6424243..66d3d7041550 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-tch-td16.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-tch-td16.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-TCH-FMT-DELTA-TD16:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-tch-tu08.rst b/Documentation/userspace-api/media/v4l/pixfmt-tch-tu08.rst
index 63c5264b8668..b10bb7bad025 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-tch-tu08.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-tch-tu08.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-TCH-FMT-TU08:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-tch-tu16.rst b/Documentation/userspace-api/media/v4l/pixfmt-tch-tu16.rst
index ade618a037a8..889298d010a1 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-tch-tu16.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-tch-tu16.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-TCH-FMT-TU16:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-uv8.rst b/Documentation/userspace-api/media/v4l/pixfmt-uv8.rst
index ff1d73ef5dba..8fa97b57ad75 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-uv8.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-uv8.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-UV8:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst b/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
index ad4da988c3a3..7069b2a6b0b1 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 ******************************
 Multi-planar format structures
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst b/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
index 9c423ffe02f9..995267741a26 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 ******************************
 Single-planar format structure
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y12i.rst b/Documentation/userspace-api/media/v4l/pixfmt-y12i.rst
index d9b539381d74..b4223ce3506c 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-y12i.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y12i.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-Y12I:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst b/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
index 74ba9e910a38..51f216f24e41 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-Y16I:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y8i.rst b/Documentation/userspace-api/media/v4l/pixfmt-y8i.rst
index 770ed4749c14..c5a3648d37e5 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-y8i.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y8i.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-Y8I:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
index 74df19be91f6..99bcc6d385b7 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _yuv-luma-only:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 6e4f399f1f88..0631919bd667 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. planar-yuv:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-z16.rst b/Documentation/userspace-api/media/v4l/pixfmt-z16.rst
index 54a8cd723d1a..3ab8844d2e6f 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-z16.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-z16.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _V4L2-PIX-FMT-Z16:
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
index 11dab4a90630..71b29267488f 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _pixfmt:
 
diff --git a/Documentation/userspace-api/media/v4l/planar-apis.rst b/Documentation/userspace-api/media/v4l/planar-apis.rst
index 9207ce4283df..075754f0e423 100644
--- a/Documentation/userspace-api/media/v4l/planar-apis.rst
+++ b/Documentation/userspace-api/media/v4l/planar-apis.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _planar-apis:
 
diff --git a/Documentation/userspace-api/media/v4l/querycap.rst b/Documentation/userspace-api/media/v4l/querycap.rst
index 15a90271af45..c96f7654c870 100644
--- a/Documentation/userspace-api/media/v4l/querycap.rst
+++ b/Documentation/userspace-api/media/v4l/querycap.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _querycap:
 
diff --git a/Documentation/userspace-api/media/v4l/sdr-formats.rst b/Documentation/userspace-api/media/v4l/sdr-formats.rst
index d8bdfdb56911..df76b7d2aaf2 100644
--- a/Documentation/userspace-api/media/v4l/sdr-formats.rst
+++ b/Documentation/userspace-api/media/v4l/sdr-formats.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _sdr-formats:
 
diff --git a/Documentation/userspace-api/media/v4l/selection-api-configuration.rst b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
index fee49bf1a1c0..978c401f4252 100644
--- a/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 *************
 Configuration
diff --git a/Documentation/userspace-api/media/v4l/selection-api-examples.rst b/Documentation/userspace-api/media/v4l/selection-api-examples.rst
index 5f8e8a1f59d7..3cf7c067f20f 100644
--- a/Documentation/userspace-api/media/v4l/selection-api-examples.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-examples.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 ********
 Examples
diff --git a/Documentation/userspace-api/media/v4l/selection-api-intro.rst b/Documentation/userspace-api/media/v4l/selection-api-intro.rst
index 6534854ae9f7..817e660ce016 100644
--- a/Documentation/userspace-api/media/v4l/selection-api-intro.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-intro.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 ************
 Introduction
diff --git a/Documentation/userspace-api/media/v4l/selection-api-targets.rst b/Documentation/userspace-api/media/v4l/selection-api-targets.rst
index 50fdadd5b307..e1aaaa3a7123 100644
--- a/Documentation/userspace-api/media/v4l/selection-api-targets.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-targets.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 *****************
 Selection targets
diff --git a/Documentation/userspace-api/media/v4l/selection-api-vs-crop-api.rst b/Documentation/userspace-api/media/v4l/selection-api-vs-crop-api.rst
index f57b9180012c..0c0d66a0cfe6 100644
--- a/Documentation/userspace-api/media/v4l/selection-api-vs-crop-api.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-vs-crop-api.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _selection-vs-crop:
 
diff --git a/Documentation/userspace-api/media/v4l/selection-api.rst b/Documentation/userspace-api/media/v4l/selection-api.rst
index 0360743746dc..1320eb632272 100644
--- a/Documentation/userspace-api/media/v4l/selection-api.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _selection-api:
 
diff --git a/Documentation/userspace-api/media/v4l/selections-common.rst b/Documentation/userspace-api/media/v4l/selections-common.rst
index 322b39cf0eba..e08da7a9b599 100644
--- a/Documentation/userspace-api/media/v4l/selections-common.rst
+++ b/Documentation/userspace-api/media/v4l/selections-common.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-selections-common:
 
diff --git a/Documentation/userspace-api/media/v4l/standard.rst b/Documentation/userspace-api/media/v4l/standard.rst
index 1f6678325da9..53818e37db5f 100644
--- a/Documentation/userspace-api/media/v4l/standard.rst
+++ b/Documentation/userspace-api/media/v4l/standard.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _standard:
 
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 2a94371448dc..1904390df830 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-mbus-format:
 
diff --git a/Documentation/userspace-api/media/v4l/tch-formats.rst b/Documentation/userspace-api/media/v4l/tch-formats.rst
index 8c941ff9e200..a382d1c20eb3 100644
--- a/Documentation/userspace-api/media/v4l/tch-formats.rst
+++ b/Documentation/userspace-api/media/v4l/tch-formats.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _tch-formats:
 
diff --git a/Documentation/userspace-api/media/v4l/tuner.rst b/Documentation/userspace-api/media/v4l/tuner.rst
index e2c53c3abdc6..c82f68d2f900 100644
--- a/Documentation/userspace-api/media/v4l/tuner.rst
+++ b/Documentation/userspace-api/media/v4l/tuner.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _tuner:
 
diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
index 6f661138801c..5fc95c792408 100644
--- a/Documentation/userspace-api/media/v4l/user-func.rst
+++ b/Documentation/userspace-api/media/v4l/user-func.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _user-func:
 
diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst
index 1cb1531c1e52..6aa00b613148 100644
--- a/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-selection-flags:
 
diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
index b46bae984f35..e9fd4b4bad42 100644
--- a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2-selection-targets:
 
diff --git a/Documentation/userspace-api/media/v4l/v4l2.rst b/Documentation/userspace-api/media/v4l/v4l2.rst
index cf8ae56a008c..caa41b14dfdc 100644
--- a/Documentation/userspace-api/media/v4l/v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 .. include:: <isonum.txt>
 
 .. _v4l2spec:
diff --git a/Documentation/userspace-api/media/v4l/v4l2grab-example.rst b/Documentation/userspace-api/media/v4l/v4l2grab-example.rst
index b323be42c580..b2472d4b0e3f 100644
--- a/Documentation/userspace-api/media/v4l/v4l2grab-example.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2grab-example.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _v4l2grab-example:
 
diff --git a/Documentation/userspace-api/media/v4l/v4l2grab.c.rst b/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
index 1a55e3617ea8..c958db1e0211 100644
--- a/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 file: media/v4l/v4l2grab.c
 ==========================
diff --git a/Documentation/userspace-api/media/v4l/video.rst b/Documentation/userspace-api/media/v4l/video.rst
index f8f69a57602c..25cb854c1101 100644
--- a/Documentation/userspace-api/media/v4l/video.rst
+++ b/Documentation/userspace-api/media/v4l/video.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _video:
 
diff --git a/Documentation/userspace-api/media/v4l/videodev.rst b/Documentation/userspace-api/media/v4l/videodev.rst
index 64be44716494..0b71a60928fb 100644
--- a/Documentation/userspace-api/media/v4l/videodev.rst
+++ b/Documentation/userspace-api/media/v4l/videodev.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _videodev:
 
diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
index 78ee406d7647..c5ef408470a5 100644
--- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _yuv-formats:
 
-- 
2.51.0


