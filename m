Return-Path: <linux-media+bounces-26573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A29A3F3BA
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 13:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AEAB424162
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 12:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9399120ADCA;
	Fri, 21 Feb 2025 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="itZNQzEJ"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541711F3FE2;
	Fri, 21 Feb 2025 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740139440; cv=none; b=AcbDyLXqNSrivrp1pAmfbynNPmv+9lkMZvzKSW4lZ+5F9NgUnpCBvYWiuDycuCn4N1IAtLGviKhS+UR4nBZa9OqFnfbsR23aSRm03Eru/l+jRhxUPnRJIEmzFYn6TD5cVVEHeosjmZekILIta05yzEPTaEaXrPcw4XbdKbSh6fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740139440; c=relaxed/simple;
	bh=EWuGtEAVdo89vLGIJkk0lU+TxfWmCRisqmm9zC7355w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=foOGcmeZAGx85yIFY23EYkPyXNQWGwkA8CviI4ODE+kzYeKAjefUp5fdCMm7rV9HveutIM+xWLHdhduD590XBNgTc6/7J02Dpr60VZsMgZAeB86C9i3I9V9KnEOH77pLi15zrqC2aEAyzvJp5t+qgPGzkrG8ZHtR+ilpsXI7igU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=itZNQzEJ; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51LC3iDC293312
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 06:03:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740139424;
	bh=Bd1aWt5Tc3SPCkHKoWgLrJwWvXX7IDdI48En4MOA5HQ=;
	h=From:To:CC:Subject:Date;
	b=itZNQzEJZzcABo7Vi3NhWXgmwy0MCIJbMVBLlOQwWIslMrzBBvg5qYisfpJ2Aepes
	 D2ZLQ3puapxxULFrIhSyy0VuGLKn6fp+akUgAa/kTSuvcAVQgJBM8wsxIy7tcAgeGJ
	 PzMFmjsUNSe+GH3hClVnbEY8lvAvQds4pJAsKTM0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51LC3iWI093977
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Feb 2025 06:03:44 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Feb 2025 06:03:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Feb 2025 06:03:43 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51LC3d4n046967;
	Fri, 21 Feb 2025 06:03:40 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH v3 0/2] Enable support for error detection in CSI2RX
Date: Fri, 21 Feb 2025 17:33:35 +0530
Message-ID: <20250221120337.3920874-1-y-abhilashchandra@ti.com>
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
Changes in v3:
- Address Krzysztof's review comment to drop minItems from the bindings.
- Collect Acked-by from Krzysztof.
- Address Jai's review comment to enable FIFO overflow bits in the mask 
  only for the source pads that have an active remote.
- Drop TI-specific interrupt and have support for only two interrupts 
  that are common across all vendors.
- Address Changhuang's review to use pdev directly to get the interrupt.
- Set the interrupt mask register only if the interrupt is defined in the DT.

V1: https://lore.kernel.org/all/20250217130013.2802293-1-y-abhilashchandra@ti.com/

Logs with interrupt in DT: https://gist.github.com/Yemike-Abhilash-Chandra/5bd2dfb4219686ddf389e94d563a2ab1
Logs without interrupt in DT: https://gist.github.com/Yemike-Abhilash-Chandra/31d8c840b5a4f677fde88373defed2cb 


Yemike Abhilash Chandra (2):
  dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for
    cdns-csi2rx
  media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add
    support for VIDIOC_LOG_STATUS

 .../bindings/media/cdns,csi2rx.yaml           |   8 ++
 drivers/media/platform/cadence/cdns-csi2rx.c  | 125 ++++++++++++++++++
 2 files changed, 133 insertions(+)

-- 
2.34.1


