Return-Path: <linux-media+bounces-54784-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BfaDuDYqmnmXgEAu9opvQ
	(envelope-from <linux-media+bounces-54784-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:38:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C915C221D9F
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FC653026929
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 13:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4C9304976;
	Fri,  6 Mar 2026 13:37:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6252FE04E;
	Fri,  6 Mar 2026 13:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804225; cv=none; b=jlWGLtuovJKqrUHnBVgVbJiDYWj82/2RdXUz/tXYDHXcv+cxeuaWrjMtq2VesCGFTJ9sMQ3wWNqvDNY+k+WeMhIzhOZcqQCLwlC4K9iF/zlqTODnMkZu8/6K8Y0ZBXmt+SH48xdYCs9PZnaRkTc2K+V4HJdNu8xFrBe+xHs3sd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804225; c=relaxed/simple;
	bh=lqDoB7KMfku/0vKx1ILRlUdtCxtORssmxE6KB556SDo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D4iEhne6rX+lU1G6sUX8Tt/okH24V+VjJ7PutM4mGvoHU5dqhSwoFOqu0MZ3z2R0upRTdlDzP+Y+bZ/C5h8dC9FQmIgGkFAkCwzdHVgmViwuwMUH4o4lJWzejor45YeVUUn+6TsMhLFtcQkorjnt/n35iGzIf7jzbXjdJSkQyeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A387D200107;
	Fri,  6 Mar 2026 14:28:02 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 936D32000ED;
	Fri,  6 Mar 2026 14:28:02 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 2506920270;
	Fri,  6 Mar 2026 14:28:01 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Subject: [PATCH v2 0/9] accel: New driver for NXP's Neutron NPU
Date: Fri, 06 Mar 2026 15:27:17 +0200
Message-Id: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADbWqmkC/2XMyw6CMBCF4Vchs7amF6jRle9hWNAyyCxsyRQbD
 Om7W9m6/E9Ovh0SMmGCW7MDY6ZEMdTQpwb8PIQnChprg5baSq2tCPheOQbhW9OhuY7KXiao74V
 xou2QHn3tmdIa+XPAWf3WfyMrIUVr0XtnnOvkcA/bcvbxBX0p5QtclHlwnAAAAA==
X-Change-ID: 20260226-neutron-c435e39d167f
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772803680; l=3871;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=lqDoB7KMfku/0vKx1ILRlUdtCxtORssmxE6KB556SDo=;
 b=V73PbnYRt98K55aGU8OUY1dj8IbWgXlGFZl2PZsf6CgHZeuSfNzvuj/0xYl/hbV+zvlAGXdWU
 35pD+XnIjslC7+hPa20BGk9IzTbp9DzuaSabrpNmw5xuAjy3fj0ZcOj
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
X-Rspamd-Queue-Id: C915C221D9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54784-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.360];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:mid,nxp.com:email]
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
Changes in v2:
- rebase on newer drm-misc-next 
- dt bindings: clock fixes and renames
- update DTS to match new names
- remove unnecessary fields from neutron_job structure
- fix use of uninitialized variable

- Link to v1: https://lore.kernel.org/r/20260226-neutron-v1-0-46eccb3bb50a@nxp.com

---
Ioana Ciocoi-Radulescu (9):
      drm/gem-dma: Add flag for bidirectional mapping of non-coherent GEM DMA buffers
      accel/neutron: Add documentation for NXP Neutron accelerator driver
      dt-bindings: npu: Add NXP Neutron
      accel/neutron: Add driver for NXP Neutron NPU
      accel/neutron: Add GEM buffer object support
      accel/neutron: Add mailbox support
      accel/neutron: Add job submission IOCTL
      accel/neutron: Add logging support
      arm64: dts: imx95: Add Neutron node

 Documentation/accel/index.rst                      |   1 +
 Documentation/accel/neutron/index.rst              |  12 +
 Documentation/accel/neutron/neutron.rst            | 131 ++++++++
 .../devicetree/bindings/npu/nxp,imx95-neutron.yaml |  96 ++++++
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  28 ++
 drivers/accel/Kconfig                              |   1 +
 drivers/accel/Makefile                             |   3 +-
 drivers/accel/neutron/Kconfig                      |  16 +
 drivers/accel/neutron/Makefile                     |  12 +
 drivers/accel/neutron/neutron_debugfs.c            |  34 ++
 drivers/accel/neutron/neutron_debugfs.h            |  15 +
 drivers/accel/neutron/neutron_device.c             | 239 +++++++++++++
 drivers/accel/neutron/neutron_device.h             | 155 +++++++++
 drivers/accel/neutron/neutron_driver.c             | 262 +++++++++++++++
 drivers/accel/neutron/neutron_driver.h             |  16 +
 drivers/accel/neutron/neutron_gem.c                | 116 +++++++
 drivers/accel/neutron/neutron_gem.h                |  14 +
 drivers/accel/neutron/neutron_job.c                | 372 +++++++++++++++++++++
 drivers/accel/neutron/neutron_job.h                |  43 +++
 drivers/accel/neutron/neutron_mailbox.c            |  47 +++
 drivers/accel/neutron/neutron_mailbox.h            |  42 +++
 drivers/gpu/drm/drm_gem_dma_helper.c               |   6 +-
 include/drm/drm_gem_dma_helper.h                   |   3 +
 include/uapi/drm/neutron_accel.h                   | 130 +++++++
 25 files changed, 1801 insertions(+), 3 deletions(-)
---
base-commit: 6716101ae42949e98ad4b9e71eeba08c055be410
change-id: 20260226-neutron-c435e39d167f

Best regards,
-- 
Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>


