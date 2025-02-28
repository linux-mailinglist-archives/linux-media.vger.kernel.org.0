Return-Path: <linux-media+bounces-27220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 167F9A4986A
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 12:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0718189812F
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 11:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8B7261579;
	Fri, 28 Feb 2025 11:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oWfwCY7X"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B641E23E34B;
	Fri, 28 Feb 2025 11:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740742844; cv=none; b=jVQSec3rgtKhxPkx48C/MEuHU4dI9BBlPPjXwMyMDw0q0oEe44Q3sM3KMwTCUmtuQHRPgvcDNT/TUsytCx9OuNh5HBj/Ti5xDNOW+MfCguI/78wCNBr6vX0WkhFe47gVhJnCHPo3tbJhmtC6t4utSoTQLnWU/Wwgm9aCMrGO/OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740742844; c=relaxed/simple;
	bh=GdzzEaMY8hJGji6WgdmdXSRKuU2vPcoW1UjAUIqq0co=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ffcHOXD72Kr5F12dVBtC8Opj26bQ+v7H5mYDIHkCg4E1Y6xzqAx+izrlbdLZDsPT6Km5uNKiqY1kpVwxK+l0shs9OEpJJwnbWgbJtgLw+6ORRIcliJKOb7EuL36TeJcu5RwgRqgt13QzqfgLD6WMmV1Re+ITyFg0GTULcniBgvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oWfwCY7X; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51SBebiO2038428
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Feb 2025 05:40:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740742837;
	bh=udkoYAEo2ErsvjiRJ0X+33Wo/yFdnK8RfaUDxzV7MhI=;
	h=From:To:CC:Subject:Date;
	b=oWfwCY7XT8mCABEi8MpoHi20MelmgzACIdxApkUpJVm3Ryzqa6aL6em0VY9VrnrRI
	 YRdBslM3d+TO0zXQWLfCQZkv1Vb9EkVpAexB2IpukUqj+qJE9VKq+Wxjt9m+3wdXDe
	 BFuVWytjFiUta4DjFhgRTt/e4UlwK/J4vAWz1FJM=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51SBebxT024310
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Feb 2025 05:40:37 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Feb 2025 05:40:37 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Feb 2025 05:40:37 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51SBeWfb060249;
	Fri, 28 Feb 2025 05:40:33 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH v5 0/2] Enable support for error detection in CSI2RX
Date: Fri, 28 Feb 2025 17:10:28 +0530
Message-ID: <20250228114030.1028443-1-y-abhilashchandra@ti.com>
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

Changes in v5:
- Make two interrupts non-optional
- Take back the ACK from Krzysztof since we are reverting to
  older bindings

v4: https://lore.kernel.org/all/20250227082920.744908-1-y-abhilashchandra@ti.com/


Yemike Abhilash Chandra (2):
  dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for
    cdns-csi2rx
  media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add
    support for VIDIOC_LOG_STATUS

 .../bindings/media/cdns,csi2rx.yaml           |   8 ++
 drivers/media/platform/cadence/cdns-csi2rx.c  | 129 ++++++++++++++++++
 2 files changed, 137 insertions(+)

-- 
2.34.1


