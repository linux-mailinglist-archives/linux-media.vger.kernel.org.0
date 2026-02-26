Return-Path: <linux-media+bounces-53503-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAujCAxOoGnvhwQAu9opvQ
	(envelope-from <linux-media+bounces-53503-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:43:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B93401A6D90
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28A1B308193A
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B97528C006;
	Thu, 26 Feb 2026 13:41:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367B836C0BB;
	Thu, 26 Feb 2026 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113266; cv=none; b=OufbdUXEDcmmb4MQy6cJjE0Nc34UIaTdmych26HnvUIlBq7LiflKUYb4f4Z1s1oPGzxMUk+p/O+VA4JyLDg+hHRj00h/hqH+Un2hq8vpQ5lJ1+3fGx2DUs81mOKnD/X9LTCy/PTp3c6SH8sy09DhSrzSHp5q5CuAQAGNhR/n9rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113266; c=relaxed/simple;
	bh=/7MY8hy5jQlEhxj9eGiR1iRl0W6znJ9KfDclM2QxDN8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qXcc3WWmn3s2RGTiSKQg++2EOmyLUrBWlmXnEKfEAU+ZM6x9Z4pMO3tn/rCZV7wzcB6dzi6jKVXvJ6qldNyVpHlr1DSst4akRYZDPb+9Bg2ED0Y7QJun2JjHrIXxL7IUFriKLIZKBhjWKk1BETHF653zu/3oRzXD+vOC+Ww5sUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 05E7A1A14A6;
	Thu, 26 Feb 2026 14:40:58 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EBD211A2549;
	Thu, 26 Feb 2026 14:40:57 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 3F2952035B;
	Thu, 26 Feb 2026 14:40:56 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Subject: [PATCH 0/9] accel: New driver for NXP's Neutron NPU
Date: Thu, 26 Feb 2026 15:40:39 +0200
Message-Id: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFhNoGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMz3bzU0pKi/DzdZBNj01RjyxRDM/M0JaDqgqLUtMwKsEnRsbW1AOD
 Yn/tZAAAA
X-Change-ID: 20260226-neutron-c435e39d167f
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772113256; l=3577;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=/7MY8hy5jQlEhxj9eGiR1iRl0W6znJ9KfDclM2QxDN8=;
 b=XoBoTREGvNXkcj74Qdwpy1rPE9Srk5uacOSO9MTQQEa59XXxIe2u/tWgmnYx+T7BKj7G+iZtI
 ZjQy748HLl7D6BMVVeD4pa/vQ8RKwzMN3ApPcTl7A9vLaek1BrNL4df
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53503-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.992];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: B93401A6D90
X-Rspamd-Action: no action

Introduce a new accel driver for the Neutron Neural Processing Unit
(NPU), along with associated dt-bindings and DTS node.

The first patch extends the GEM DMA helper APIs to allow bidirectional
mapping of non-coherent DMA buffers. While not part of the Neutron
driver, it's a prerequisite allowing us to use the GEM DMA helper.

Neutron is a Neural Processing Unit from NXP, providing machine
learning (ML) acceleration for edge AI applications. Neutron is
integrated on NXP SoCs such as the i.MX95.

The NPU consists of the following:
- RISC-V core running a proprietary firmware
- One or more Neutron cores, representing the main computation
  engine performing ML operations
- Dedicated fast memory (TCM)
- DMA engine that handles data transfers between DDR and TCM

The firmware is closed source and distributed as a binary here [1].

The Neutron software stack also contains a userspace library [1] and
a LiteRT custom delegate [2] that allow integration with standard
LiteRT tools.

[1] https://github.com/nxp-upstream/neutron/tree/upstream
[2] https://github.com/nxp-imx/tflite-neutron-delegate

Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
Ioana Ciocoi-Radulescu (9):
      drm/gem-dma: Add flag for bidirectional mapping of non-coherent GEM DMA buffers
      accel/neutron: Add documentation for NXP Neutron accelerator driver
      dt-bindings: npu: Add bindings for NXP Neutron
      accel/neutron: Add driver for NXP Neutron NPU
      accel/neutron: Add GEM buffer object support
      accel/neutron: Add mailbox support
      accel/neutron: Add job submission IOCTL
      accel/neutron: Add logging support
      arm64: dts: imx95: Add Neutron node

 Documentation/accel/index.rst                      |   1 +
 Documentation/accel/neutron/index.rst              |  12 +
 Documentation/accel/neutron/neutron.rst            | 131 ++++++++
 .../devicetree/bindings/npu/nxp,imx95-neutron.yaml |  95 ++++++
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  28 ++
 drivers/accel/Kconfig                              |   1 +
 drivers/accel/Makefile                             |   3 +-
 drivers/accel/neutron/Kconfig                      |  16 +
 drivers/accel/neutron/Makefile                     |  12 +
 drivers/accel/neutron/neutron_debugfs.c            |  34 ++
 drivers/accel/neutron/neutron_debugfs.h            |  15 +
 drivers/accel/neutron/neutron_device.c             | 239 ++++++++++++++
 drivers/accel/neutron/neutron_device.h             | 158 +++++++++
 drivers/accel/neutron/neutron_driver.c             | 262 +++++++++++++++
 drivers/accel/neutron/neutron_driver.h             |  16 +
 drivers/accel/neutron/neutron_gem.c                | 115 +++++++
 drivers/accel/neutron/neutron_gem.h                |  14 +
 drivers/accel/neutron/neutron_job.c                | 367 +++++++++++++++++++++
 drivers/accel/neutron/neutron_job.h                |  45 +++
 drivers/accel/neutron/neutron_mailbox.c            |  47 +++
 drivers/accel/neutron/neutron_mailbox.h            |  42 +++
 drivers/gpu/drm/drm_gem_dma_helper.c               |   6 +-
 include/drm/drm_gem_dma_helper.h                   |   3 +
 include/uapi/drm/neutron_accel.h                   | 130 ++++++++
 25 files changed, 1799 insertions(+), 3 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260226-neutron-c435e39d167f

Best regards,
-- 
Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>


