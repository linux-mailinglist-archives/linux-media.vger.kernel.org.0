Return-Path: <linux-media+bounces-38546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D53B13861
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BE6C3BE0B7
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146B4259CBE;
	Mon, 28 Jul 2025 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPKnxZ1y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF46259C83
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753696111; cv=none; b=ZZEw+erEISumpMOAwm2oVIutEXLvWhczccKsD0tsaOQRxqlkQSJ1PsmaSWZHTFU6p4Ob4Mb1C3jkKdDRp3bWP3VDWbANo8LGGGZwIvdlwEIKdYLWQZha2yRcKRm4Cq8mdu41GWagydPpfY/yiTpT1N5Ni0IkM+z1DN36xKgSI5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753696111; c=relaxed/simple;
	bh=bFbUQsXi0/2b29Z/jK1G4rem75gPPJesKKTocD6vJYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QtXEhM5j+yfGJpQGznChJOpKUMUK8O112G6/t7pVJT4LnKvIBmorUUAtcerTOevjSZGU27liLn8FxtPVq++gziHNUhZxk9zKTv5WspvuTbw7A3oAvKHdx1Y0r+HgojvAk5mH2jLvhgRkmJOa+WBZ9jmXPtYBAZuP0T8Qs+fsxgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPKnxZ1y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811B5C4CEF8;
	Mon, 28 Jul 2025 09:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753696111;
	bh=bFbUQsXi0/2b29Z/jK1G4rem75gPPJesKKTocD6vJYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DPKnxZ1ys737KiHUb+VWKbtlp3DS/GdcA0p5Uzo/pwObG0J7/LpTH0xm2w312dUlU
	 AiZZnqyiTXFsffPCfUMlBekArafKXtW1CZbyKPdAn7FAkxfBD7wwkd411k7HHPlcOI
	 bBPVGjFh4V21h3uySA0ZODyoeH1ehf37B3Eq7N+qrxM4ouNxQLP/P3t0fXFeINrfYH
	 3L8t8iA5zlOPCz0qJ9lp8AI+xCsH8X+4+0AnzEttTnmKuk2vo2tgSOpARvIwESxcqE
	 iJYPEwgqvAsA+IUwbOksfjM4L5wVVw13lItbT9ZD3fvxsCRAto5ex83LBuSQfYLHd1
	 93IMbiTPbyBIg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCHv2 2/8] Documentation: media: update Hans Verkuil's email address
Date: Mon, 28 Jul 2025 11:46:57 +0200
Message-ID: <c761177f590bc1b9a06547bdf4326563636dbfe5.1753696022.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753696022.git.hverkuil+cisco@kernel.org>
References: <cover.1753696022.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@kernel.org>

Replace hverkuil-cisco@xs4all.nl by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil@kernel.org>
---
 Documentation/ABI/testing/debugfs-cec-error-inj                 | 2 +-
 Documentation/devicetree/bindings/media/cec/cec-gpio.yaml       | 2 +-
 .../devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml      | 2 +-
 Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml    | 2 +-
 Documentation/userspace-api/media/cec/cec-api.rst               | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/debugfs-cec-error-inj b/Documentation/ABI/testing/debugfs-cec-error-inj
index 8debcb08a3b5..c512f71bba8e 100644
--- a/Documentation/ABI/testing/debugfs-cec-error-inj
+++ b/Documentation/ABI/testing/debugfs-cec-error-inj
@@ -1,6 +1,6 @@
 What:		/sys/kernel/debug/cec/*/error-inj
 Date:		March 2018
-Contact:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
+Contact:	Hans Verkuil <hverkuil@kernel.org>
 Description:
 
 The CEC Framework allows for CEC error injection commands through
diff --git a/Documentation/devicetree/bindings/media/cec/cec-gpio.yaml b/Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
index 64d7ec057672..582c6c9cae48 100644
--- a/Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
+++ b/Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: HDMI CEC GPIO
 
 maintainers:
-  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
+  - Hans Verkuil <hverkuil@kernel.org>
 
 description: |
   The HDMI CEC GPIO module supports CEC implementations where the CEC line is
diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
index 4b46aa755ccd..6ef545b1d622 100644
--- a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NVIDIA Tegra HDMI CEC
 
 maintainers:
-  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
+  - Hans Verkuil <hverkuil@kernel.org>
 
 allOf:
   - $ref: cec-common.yaml#
diff --git a/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
index 6c403003cdda..2dc2829d42a0 100644
--- a/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Analog Devices ADV7604/10/11/12 video decoder with HDMI receiver
 
 maintainers:
-  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
+  - Hans Verkuil <hverkuil@kernel.org>
 
 description:
   The ADV7604 and ADV7610/11/12 are multiformat video decoders with
diff --git a/Documentation/userspace-api/media/cec/cec-api.rst b/Documentation/userspace-api/media/cec/cec-api.rst
index 578303d484f3..594f0ec420a2 100644
--- a/Documentation/userspace-api/media/cec/cec-api.rst
+++ b/Documentation/userspace-api/media/cec/cec-api.rst
@@ -26,7 +26,7 @@ Revision and Copyright
 **********************
 Authors:
 
-- Verkuil, Hans <hverkuil-cisco@xs4all.nl>
+- Verkuil, Hans <hverkuil@kernel.org>
 
  - Initial version.
 
-- 
2.47.2


