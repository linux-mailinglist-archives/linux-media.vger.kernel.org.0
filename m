Return-Path: <linux-media+bounces-38537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ABBB13823
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 638041894F17
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAFF267B19;
	Mon, 28 Jul 2025 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNtbhlW+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B4622173F
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695864; cv=none; b=aQeVp2I6c1pMtXRZqaFsc+WzfVakiuGjqH3JgvvCjQfKc+LWWUjDvGwPfymJ0dpaH2ygs3zMFsx4KeF4MC5bECTv1nLPxMb1FrFNiV4A5pMj6EQajSpSTQSnKdQJG5z8XIVyGgyTKF3VIedWMVTeBymsNM5gCpKKK/gsU9TXagQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695864; c=relaxed/simple;
	bh=WdKqxd9r8ni+RR4LRneWtcTUZIYQJGoIyVgPDmVmzPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XogOiVP3q5+XKjmEa2nyM8lQg1lA1rs/YxCkQ6n5A3u+5CkpSSXhI89m3n807V5DI+iA9FJoVtjRTRzkVDBYFhdyq7X2r+6gFDIC70DWSYrzL2CbgDpV+Ti6eO4iEbzFnih02kRJ4TCK1V2el3oV8dcIAdsNbEIUdrS7VSrilsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNtbhlW+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BF6C4CEFB;
	Mon, 28 Jul 2025 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753695863;
	bh=WdKqxd9r8ni+RR4LRneWtcTUZIYQJGoIyVgPDmVmzPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KNtbhlW+aat8SxGQVpa7eFDsXKd8t7jnI4KJMgBdCvhplje2JwSOy4mbVlzEoyMhO
	 4c+WDGqcDgbb6d77kfDgFMaDBIZZvojocOxz0yuLCnZNpZYon23ZKDA6EIIIKH/Scf
	 L4aMQcrrKRJ7SCAnFkHVb7pasNdrnGsxbVgsPTg3vLztWMli4rc3k5DEQj7dioJZjB
	 RxeYuuNnodaXSotTdCd9IiuEmzDdJxTS57rHezOwbhRYDcd6uGjKy95lwqs7jJ9tyD
	 2rFrjtaCmp9j8A7G9IKeoQYdfPbP8CA2ACBf6XHsoaI1O9s1uFw5GuAv26H1FfWTfX
	 bjbuhovaGBoYA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH 2/8] Documentation: media: update Hans Verkuil's email address
Date: Mon, 28 Jul 2025 11:41:51 +0200
Message-ID: <01d59a8da58b2f28dc9f86b30728b9ef7e02a44b.1753695717.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753695717.git.hverkuil+cisco@kernel.org>
References: <cover.1753695717.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@xs4all.nl>

Replace hverkuil-cisco@xs4all.nl by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
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


