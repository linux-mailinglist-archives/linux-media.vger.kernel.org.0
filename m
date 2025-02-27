Return-Path: <linux-media+bounces-27136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B9BA477D3
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 09:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 456CE1884D4B
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 08:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514CD22686B;
	Thu, 27 Feb 2025 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rB7E+GNN"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC556226173;
	Thu, 27 Feb 2025 08:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740644989; cv=none; b=nwA7MxpA4Es5ctHLaB5BJz1N8pkTqmi3NtKO2THRd4Wi1XWibA5vy2XzbUQaXTqOAVXDusLgWQEoovdHQVIRhoxL/Bi38B7m90oH3yTlVXjePkXuub9Ru6VWiA4gG/dT8xtFkp5QQ0fmvPapIv2g3erVkT0DU1BfY6ZLwnnGs0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740644989; c=relaxed/simple;
	bh=PYz+vvdw1fGtZ/dpomEfL+SybfCEj77FvEKezxyAS0U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i191ewiGvBQNKOObPkKaiLpcSHRBT0ATlTtfi5qSHo3LKJeGFN2oHyU2nDaxSuZ3hgb0vaagpe5+XDMs/+mGO78SAzMUBH0hm0w5sIwSOuqtGYGGHk9mUnvDmSSxFI4J+rlU8nHMUPfZZDKHu9AfwEiYf2NjKzJa6YeAQ+h204k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rB7E+GNN; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51R8TR632301049
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 27 Feb 2025 02:29:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740644967;
	bh=jA3LWpnF+QDRXRLUJiRLpxUgIqTtKySbVUY6UcZRcC4=;
	h=From:To:CC:Subject:Date;
	b=rB7E+GNNanTEUS1S1dTsf5wwk6zCsGo+GqhNdthmcTW1jBXO0/XQLWcyZfCTCIkjV
	 f0VzX1wkF39jMjNXwp2KIQvYxe333kaHDP8cpqn5Y0g8UJTqF4r5wVpYnrUo0uYnf+
	 eUWtJVRlSR9f9pTj0WowyiOb/MIAjCJyHdWCSGjU=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51R8TR9i094433;
	Thu, 27 Feb 2025 02:29:27 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Feb 2025 02:29:26 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Feb 2025 02:29:26 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51R8TMOc057599;
	Thu, 27 Feb 2025 02:29:23 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH v4 0/2] Enable support for error detection in CSI2RX
Date: Thu, 27 Feb 2025 13:59:18 +0530
Message-ID: <20250227082920.744908-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This patch series enables the csi2rx_err_irq interrupt to record any errors
that occur during streaming. It also adds support for the VIDIOC_LOG_STATUS
ioctl, which outputs the current device status to the kernel log.

The IRQ handler records any errors encountered during streaming.
Additionally, VIDIOC_LOG_STATUS can be invoked from user space to retrieve
the latest status.

Changelog:

Changes in v4:
- Add flexibility in DT bindings
- Drop the ACK from Krzysztof, since there is change in bindings
- Use dev_name(&pdev->dev) while requesting the IRQ handler
- Fix minor issues such as avoiding magic numbers, splitting long lines
  of code and removing extra spaces
- Make some minor changes in the commit messages.

The major update is about adding flexibilty in the bindings, since this
driver is shared by multiple vendors. The detailed discussion regarding
this can be found here [1].
[1]: https://lore.kernel.org/all/3fzkpcdjsthw5lbajxp6zyiyejo45rcgt3gwjfu2bub3v3acpa@kow5blexev5u/


Changes in v3:
- Address Krzysztof's review comment to drop minItems from the bindings.
- Collect Acked-by from Krzysztof.
- Address Jai's review comment to enable FIFO overflow bits in the mask 
  only for the source pads that have an active remote.
- Drop TI-specific interrupt and have support for only two interrupts 
  that are common across all vendors.
- Address Changhuang's review to use pdev directly to get the interrupt.
- Set the interrupt mask register only if the interrupt is defined in the DT.

V3: https://lore.kernel.org/all/20250221120337.3920874-1-y-abhilashchandra@ti.com/

Yemike Abhilash Chandra (2):
  dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for
    cdns-csi2rx
  media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add
    support for VIDIOC_LOG_STATUS

 .../bindings/media/cdns,csi2rx.yaml           |  10 ++
 drivers/media/platform/cadence/cdns-csi2rx.c  | 129 ++++++++++++++++++
 2 files changed, 139 insertions(+)

-- 
2.34.1


