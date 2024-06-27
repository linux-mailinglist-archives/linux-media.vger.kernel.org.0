Return-Path: <linux-media+bounces-14242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C5591A777
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90751282AD9
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079701891D8;
	Thu, 27 Jun 2024 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ebmsRCjZ"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C855C18755A;
	Thu, 27 Jun 2024 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493843; cv=none; b=eMIQxSWpz1IEVQ01ZhNqYOp/Wosw1vETy09vguX/yNwvHBS8gaNtloAuQ77loPt7v1EbsQq5mxxBKALRFECBQUEfADSMPmhCfy8oELuext0O7/8gg92OIA3W0mMFEBB9qmpgPXUbxnOLGaByJR7hAcNOBeCJlZ5oJya9q6X5BI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493843; c=relaxed/simple;
	bh=d/dE21M/qcT0o8h8zEfeZGZ5ojzXnFzZ3wcWijq5zVI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=NTNOI5mwDuC1+8kfMVrtc/BZoN79VQJNPgaoPQfTUdoeaAuYvfnEz4z2wMY7CAYjAEnOB94YzgbGPNpsGKZH8cirDV9sJdVeDAn/QT8Y49mVZXmldGtAiQU2Nd6yXoXHL6Opu5RbkFrBPAeiIvRHxTPViYvzyqxN8KNnx7JwrbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ebmsRCjZ; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAPF2024313;
	Thu, 27 Jun 2024 08:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719493825;
	bh=nVLO8Lf5+Q64obBl7khRpJS2urQEzLuDJd3WPiVC3F0=;
	h=From:Subject:Date:To:CC;
	b=ebmsRCjZUceRDkLxKyxirmg1PpGMg3TgY3W7TEQaHKYZpCE8QsjSenegMlSz3RSGz
	 Ka6ESTs47I/z3HuD4OHJqugINWLJDWx+h6Ulj6R0En8eACn43cCZXQ083hVoq5aHuM
	 Vv9A1f45bFHk5ncoFkMxEmyEQscWyEJmcAJsve3o=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RDAPas095606
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 08:10:25 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 08:10:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 08:10:24 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RDANCV038366;
	Thu, 27 Jun 2024 08:10:24 -0500
From: Jai Luthra <j-luthra@ti.com>
Subject: [PATCH v2 00/13] media: cadence,ti: CSI2RX Multistream Support
Date: Thu, 27 Jun 2024 18:39:55 +0530
Message-ID: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKNkfWYC/1XMQQ6CMBCF4auQWVvTDgTUlfcwLFqYyiSWkrYSD
 endrSQuXP6Ted8GkQJThEu1QaCVI/u5BB4qGCY930nwWBpQYiMRlXDPR+KYAmknrDG6tZaaTtd
 QFksgy69du/Wlp/Low3vHV/W9/hz8c1YlpFCnuqPxrFoic018HLyDPuf8ARvOHdyjAAAA
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2975; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=d/dE21M/qcT0o8h8zEfeZGZ5ojzXnFzZ3wcWijq5zVI=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmfWSoPPOF7nOAMBe6Fb/GXTXvDTTdG5qRGFNjq
 qbewBRU+7eJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZn1kqAAKCRBD3pH5JJpx
 RfWUD/9X2ur34ScgVPkX4LGhKz9/padjTrJdTzYTtyto094E5RgyhuM8iyeZ6hKNq8WmYWOSzQD
 u7oh41cSPIGVh0xN+HlXstraajV58EvkVCvEfZHD8TvZI0czJS9yuQhjyLL1o95vefrTLRcwIaE
 FEsn8R4YklRX9567Y8D9/DJ4paG6nAh0CTETTDtWgXuDeT95powE6J9yRCNgLlixy0fjkOeJf/c
 CLUB9CMJUuja/2UkoVNV7CM0QisXrd0g+T73DsBBVhYMbvm0oK2a09wNKpM0z1jCVEBcxBFyq+N
 DWrRdiDTkbGGFnRQWsCdSIg2tQlbyMkAiOL027d+LZW4+0K1vGwdJ4Sf+sBgiGvidlZPTCOCOs6
 77WwT7q25IdzmK4tPqmSgQTN1DJ3z7AFVA4qojf1OUyq9wDWinvfvzSvtPZu0xH1z1GnONAaNWv
 H55iIxsSAvarRuYRAQMwXdIkye/jYd/GtyRUnzKcWNQLmj1yfAhhw65ehVBdraxDls0FEXBcthK
 RO0w02XvdSXpZIiXoAiBjMCfU5U+EuzhkGjHicrgMmsdRpl2rlBEqVIhuYSv/GlI7qgfTKh3OR8
 FMqHqTT9nxnBinfiPI4NqZ3M6qTkSoTkuPfd/dbUF8KgY0Bq4cqvKz6+6Puq0tfzwUbBvxxv4R6
 FzNi3sUrTlpCPrQ==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

This series adds multi-stream support for Cadence CSI2RX and TI CSI2RX
Shim drivers.

PATCH 1:	Runtime Power Management for Cadence CSI2RX
PATCH 2-7:	Support multiple DMA contexts/video nodes in TI CSI2RX
PATCH 8-9:	Use get_frame_desc to propagate virtual channel information
		across Cadence and TI CSI-RX subdevs
PATCH 10-12:	Use new multi-stream APIs across the drivers to support
		multiplexed cameras from sources like UB960 (FPDLink)
PATCH 13:	Optimize stream on by submitting all queued buffers to DMA

This applies on top of today's linux-next (next-20240626)
(also tested rebase with media_stage.git master)

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
Changes in v2:

- Change the multi-camera capture architecture to be similar to that of
  Tomi's RPi5 FE series, where the driver will wait for userspace to
  start streaming on all "actively routed" video nodes before starting
  streaming on the source. This simplifies things a lot from the HW
  perspective, which might run into deadlocks due to a shared FIFO
  between multiple DMA channels.

- Drop a few fixes that were posted separately and are already merged
- Fix dtschema warnings reported by Rob on [02/13]
- Fix warnings for uninitialized `used_vc` variable in cdns-csi2rx.c
- Return -EBUSY if someone updates routes for j721e-csi2rx subdev while
  streaming
- Only allow single-streams to be routed to the source pads (linked to
  video nodes) of the j721e-csi2rx device
- Squash the patches marked "SQUASH" in the v1 RFC series

- Link to RFC (v1):
  https://lore.kernel.org/r/20240222-multistream-v1-0-1837ed916eeb@ti.com

---
Jai Luthra (8):
      dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
      media: ti: j721e-csi2rx: separate out device and context
      media: ti: j721e-csi2rx: add a subdev for the core device
      media: ti: j721e-csi2rx: add support for processing virtual channels
      media: cadence: csi2rx: Use new enable stream APIs
      media: cadence: csi2rx: Enable multi-stream support
      media: ti: j721e-csi2rx: add multistream support
      media: ti: j721e-csi2rx: Submit all available buffers

Jayshri Pawar (1):
      media: cadence: csi2rx: Support runtime PM

Pratyush Yadav (4):
      media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
      media: ti: j721e-csi2rx: allocate DMA channel based on context index
      media: ti: j721e-csi2rx: get number of contexts from device tree
      media: cadence: csi2rx: add get_frame_desc wrapper

 .../bindings/media/ti,j721e-csi2rx-shim.yaml       |  39 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       | 440 +++++++++--
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 879 ++++++++++++++++-----
 3 files changed, 1071 insertions(+), 287 deletions(-)
---
base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
change-id: 20240221-multistream-fbba6ffe47a3

Best regards,
-- 
Jai Luthra <j-luthra@ti.com>


