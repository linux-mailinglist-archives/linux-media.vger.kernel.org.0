Return-Path: <linux-media+bounces-40867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BD9B336D1
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 08:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C66A6178817
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 06:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3982A2877C7;
	Mon, 25 Aug 2025 06:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2RBKLyq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928AF2877F4
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 06:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756104788; cv=none; b=OGXpdQkguKmrBu17ywzEMvo0vTtq+I2ySqgtikDFQgH9vjt6wY3NXt484xqvT79a5R+Iye26vc8uPjvpq4K+Kq6tqzPtyP6+xVbVHGg781Cr8av5bEDxp/aPo4Hev2EGZ/eIAX/NRQN0DPhN7Uy9hQf/MPmNKhwoM2HNvPV7mdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756104788; c=relaxed/simple;
	bh=bFbUQsXi0/2b29Z/jK1G4rem75gPPJesKKTocD6vJYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbP7kvTtibqXbWMubO8kVyDOA6JjpRHyFGyEmWGZQyYz/JeVi2R8/4UjOlHFeJS7E1RGud2loCQY8q9iFm4HQVS35OJLl7WC7u6RaL505JoAVzwLcjF20PCsnaCH9Bs43dYxAOXZJbbsTJ8vQPAHmTFCYsNIvL4a869TvQzM8+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2RBKLyq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34149C4CEED;
	Mon, 25 Aug 2025 06:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756104788;
	bh=bFbUQsXi0/2b29Z/jK1G4rem75gPPJesKKTocD6vJYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c2RBKLyqGnjcdf/tEqz/2FqF4C/VBxTxGrNhArovSOlSuYZBQDFhsFTJlmUir6+ZM
	 WrtuMq8QpGXDkSxt5uprpboUX+GvQkHb8BljLF9ZEE/qzTCWn6qGozUSJL5UgwGx9Q
	 BRdmfJClr2U0yYZ24dv5VWsvpZUcV3FkoTTEvJFVKsCqPv3j1R+licUdno45wNgd6D
	 4PHPoHpwt1UD3Bq6Aw9orwfByfOBkgaswU/YlAiNQUzSvwRfJBwVx4Y65/7qLDts9a
	 PmjvrVN6Fp1nQZNxHCK9ScpxelbiwtOiuVQ5MJx1DbUBIbcZx6IlQcVfUMJqDwv2Jt
	 00nqc2In4MF9Q==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH 2/8] Documentation: media: update Hans Verkuil's email address
Date: Mon, 25 Aug 2025 08:51:49 +0200
Message-ID: <d1e10d860cce9a732ebe9d8ad714e1927b5a0c1a.1756104715.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1756104715.git.hverkuil+cisco@kernel.org>
References: <cover.1756104715.git.hverkuil+cisco@kernel.org>
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


