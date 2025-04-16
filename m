Return-Path: <linux-media+bounces-30334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0629AA8B8C5
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77F535A0620
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9CA24A05F;
	Wed, 16 Apr 2025 12:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pNHGyjYj"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFA0209F5D;
	Wed, 16 Apr 2025 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744806009; cv=none; b=frYp2PRq5ZH4KTcDlCRDOFSbr7dy1L9NI3RHpwNj/HiY8Ajbrxr7MUd4ha71+sAsdv8NmeU6LxTMJTby5mHKdQpGLa0sEM02qFiS9XsMo7qcomLL7tTdR21t4dAFik06CbkvtDXw33fueve9y1zXdS5GyNRw6H8M56WpvwEoNlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744806009; c=relaxed/simple;
	bh=9kOXqnLn12fR+e7mI3igDZzbywXMms7JQFjAgUCaKXQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tICpxiJqbF3fKSuAlmMOGpQ4pdW5g+Oii85jIUm1WBBqdScqUXcPEeUEiJobNn7zepdpOFKjBFvOH8ybxk15ONgY5mMDSMmrICm5nwxOE2CrsCbd8mH8qjbadlxVFq+kT5pWp1Kix1wcZeI7ZOYThYfp++tyzNl2GtKycOqBnOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pNHGyjYj; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53GCJnIU333471
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744805989;
	bh=UQv4+93vl9xff0SMC+JPqe3BKlcjq2OfzB8qyDmKXo0=;
	h=From:To:CC:Subject:Date;
	b=pNHGyjYjZcSvACAY+F/V/yQWN4xE5UXWuhq+AHfJ22thGGbYTrcu4cEEkmHUGxnlY
	 rpWeR3MaaGykecuwBHUPq/AFz6D+iTX+CBl40CJWldllt0LSZP+CDSs9vTx6yqQlv8
	 Am4abtN4dbMipnDI+Y4DexrC7cPsDFOqib/RpUa0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53GCJnw8017592
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 07:19:49 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 07:19:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 07:19:48 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53GCJiEs016254;
	Wed, 16 Apr 2025 07:19:45 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH v6 0/2] Enable support for error detection in CSI2RX
Date: Wed, 16 Apr 2025 17:49:36 +0530
Message-ID: <20250416121938.346435-1-y-abhilashchandra@ti.com>
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
Changes in v6:
- Although the interrupt mask is configured only for cdns-csi2rx source pads
  with active remote connections, the IRQ handler currently records all events
  regardless of whether they are enabled in the mask. Since the events are not
  mutually exclusive, a stream overflow event for a pad without an active remote
  can be recorded if it occurs in parallel with any event enabled in the mask.
  To avoid this, update the handler to record only those events that are explicitly
  enabled in the mask, preventing unnecessary logging for pads without an active
  remote connection.
- Drop the Reviewed-by and Tested-by tags from Jai and Changhuang, as this
  version introduces a minor change in the IRQ handling logic.

v5: https://lore.kernel.org/all/20250228114030.1028443-1-y-abhilashchandra@ti.com/

Yemike Abhilash Chandra (2):
  dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for
    cdns-csi2rx
  media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add
    support for VIDIOC_LOG_STATUS

 .../bindings/media/cdns,csi2rx.yaml           |   8 ++
 drivers/media/platform/cadence/cdns-csi2rx.c  | 131 ++++++++++++++++++
 2 files changed, 139 insertions(+)

-- 
2.34.1


