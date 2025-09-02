Return-Path: <linux-media+bounces-41555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1654B3FD26
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EFE3189EB55
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DFE2F548B;
	Tue,  2 Sep 2025 10:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CB6O4h85"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960582F3C0F;
	Tue,  2 Sep 2025 10:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756810641; cv=none; b=VB22kPzUTeUw8ffY4krnRiFEMYALTZ6YCJYhIILNaDUhJ4mXZhLOw7UleVoIr9YWXxgedjMhPzstYGQOS2bplGBwsIP9bfOpTjHmQZ6HToUUMlCoi28cMdZnkl2VLmxADh5OFpVIOdJFvCojS/TQo7HiQWRIgyB1VHCBGq3PaLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756810641; c=relaxed/simple;
	bh=Da119RAHTM+FE+tsIbP6fdyzEjInKl9sHQI9YHygs/4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/4yjgsugR64NQ1TXc3mqXpN7f7+qay+UCGzBO+/8JZF37r+itsUgYj9cGcC2NlnkVj4+5oghinUNI9aPfjykLhhuzs1SKmsCyUMfok+aFYc9A/TD/e6oeNmp/Z6nJIyWFMeiynWm4tHwe9FVlj7GA9qCCSYyF4sUQOuY9eO9jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CB6O4h85; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:480e:e039:1d0b:c5ff:a9e2])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF58078C;
	Tue,  2 Sep 2025 12:56:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756810569;
	bh=Da119RAHTM+FE+tsIbP6fdyzEjInKl9sHQI9YHygs/4=;
	h=From:Subject:Date:To:Cc:From;
	b=CB6O4h85XgE+kgj1JOmQbOA2K+YHBowUd0GbcBzuor64iXFLYDq4IwdmTizSFkUld
	 3l2MhltvIaxz5nLQ7yuj9tAd5CDLVljz3rKN1Mt2lbTggoC7RLf+yP9EmIHTsebYox
	 Jyvhvsr9EAT3tT/IX8n5bknZEHiduy7KMq0vJlOk=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/3] media: Support runtime PM and system sleep for
 TI-CSI2RX
Date: Tue, 02 Sep 2025 16:26:48 +0530
Message-Id: <20250902-ti_csi_pm-v2-0-59a3be199940@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHDNtmgC/23OQQqDMBAF0KtI1o2YIUpaSvEeRSQmYx2KxiZWW
 sS7N+q2yz8M7/+FBfSEgV2ShXmcKZAbYoBTwkynhwdysjEzyCDPACSfqDaB6rHnIFWmGmikzA2
 L/6PHlj67da9i7ihMzn93ehbb9Z8yC55x1SoDZ2wLWdiSLOrghsZpb1Pjelath+7x9Y4Dp6OC9
 RiC3gdekusuK8iFhBwgFQoKoRQX3HPrBm2f2pcTbdwteusPk960VfgAAAA=
X-Change-ID: 20250224-ti_csi_pm-24808b2b445c
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Rishikesh Donadkar <r-donadkar@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2731;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Da119RAHTM+FE+tsIbP6fdyzEjInKl9sHQI9YHygs/4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBots15HAro0crcTEAQIEgaNvcXW1ed+Drx4eBvf
 eCrL7Liqn+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaLbNeQAKCRBD3pH5JJpx
 RdmAEACzApEf3vkbJV7QyvhaI/GBvfGmloNQhnSBSMOgy6lFKEt0RK+gS9hNzzec3vus6y7ixrQ
 CeJHcIIprx5hMTTrIMIrkEk4lOHhln/o4Sb5Eso+n4j9RMHrHP9L3dg4WwzSCJlh6aL2FI1/9BK
 Febx//qrrB9zQIg4fs1fUZwZMu6yuFS5arHdZlNMImohqMDcjcWRDNP54PJblUlmhigPqz12MME
 emb46Sr6NS/kf/Vht2dug27pg0+IpcuYVusszzl8oCgzlCvrVaK0jOXWv0PapuppoIZ7u/DhX2U
 wIBhvXL/YtgIhXCrxBZ1AJtpdGPumaB5YsGrybrkkMrB8xEipZGXp0Z8TmKCxxxNdxyckT883uw
 kA1nefgRGw3Wdsv51PT2QIEZQh9xubIQNM1SSCw/PgSlc8QB79r8qxpuKaSL25SJdmb6V0VqeW4
 xDvXHxkyPyr1gGi0EytysDFr5mpiziuvWZy4o4HrBN9o4F4c8jdp5VnBeDW1gL5jhzpyH9g8rUc
 Ty3Z60iHCSfEn4PVfl+RfWKYWbKdGViwjITWRa9sKPnXxF5eEJv/mdOWRtC6J5T12/GPrGwiHhd
 4TzSDZ61BOHh/cie+eauRwOtUUdsX1m0zDAX6C4hs/7WDeA2QcQfG48LNtQKaDGio/AF8OhC3yj
 ff7sBTWpqSz1wXg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series adds support for runtime power management and system sleep
for the TI (J721E) CSI2RX pipeline. This series is dependent (and only
applies on top of) the streams support series for TI CSI2RX [1].

I have picked PATCH 1/3 from Changhuang's earlier series [2] with
modifications done to apply on top of streams support series [1].

[1] https://lore.kernel.org/linux-media/20250825142522.1826188-1-r-donadkar@ti.com/
[2] https://lore.kernel.org/linux-media/20240718032834.53876-1-changhuang.liang@starfivetech.com/

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Rebase on top of latest media staging + Rishikesh's series for streams
  support for Cadence + TI CSI-RX
- Drop the locking of the queue mutex in the suspend notifier, as that
  prevents the userspace process from freezing if it attempts to queue
  or dequeue buffers after the driver has locked the mutex
- Link to v1: https://lore.kernel.org/r/20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideasonboard.com

---
Changhuang Liang (1):
      media: cadence: csi2rx: Support runtime PM

Jai Luthra (2):
      media: ti: j721e-csi2rx: Support runtime suspend
      media: ti: j721e-csi2rx: Support system suspend using pm_notifier

 drivers/media/platform/cadence/Kconfig             |   1 +
 drivers/media/platform/cadence/cdns-csi2rx.c       | 129 +++++++++------
 drivers/media/platform/ti/Kconfig                  |   1 +
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 183 ++++++++++++++++++++-
 4 files changed, 265 insertions(+), 49 deletions(-)
---
base-commit: 4d8f27b98c631b055fd5bed8274b2ea86093b942
change-id: 20250224-ti_csi_pm-24808b2b445c
prerequisite-message-id: <20250825142522.1826188-1-r-donadkar@ti.com>
prerequisite-patch-id: 724a0c1dc69bb408767dcd30b11cae52ce292e18
prerequisite-patch-id: a593abfdb6ad7c7be81dccc1d993643ff33132f2
prerequisite-patch-id: 8ac81164384969be35fe887bb8ccea1fbaa5c034
prerequisite-patch-id: 1d3b53390d5a9d9f8be30ada646f792044bd2ee7
prerequisite-patch-id: 1fe4eaf476c93ae9e611272be4f4352b66c0d814
prerequisite-patch-id: b950a7c40a1a126cd939eb8b6167b8fd03d9cf8e
prerequisite-patch-id: 4ba15549c4119c14dbedc660615e96ad14a52f80
prerequisite-patch-id: 87272a59ffa04ce0b7046113aa564000a8a928aa
prerequisite-patch-id: cacd13c273f8329873ec87962f5fc2d57cbc1cb4
prerequisite-patch-id: a62d96ee969a9bf19932868a991cf3f4a54fbff6
prerequisite-patch-id: 6df713b0ea9afd867b950d66d26f0db2c8189109
prerequisite-patch-id: d2c609819466d2e180b14d8f1ad73018f994cfc8
prerequisite-patch-id: 0230d8ff6f064566b15a56ad5e49ac0cf94919b6
prerequisite-patch-id: d549b878a1320a57c76bf16776932783b237ebb2

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


