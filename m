Return-Path: <linux-media+bounces-26065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71405A326AB
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 14:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 927CE161BEE
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 13:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E9720E033;
	Wed, 12 Feb 2025 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KiXRvXjU"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9131D2046B5;
	Wed, 12 Feb 2025 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739365988; cv=none; b=m9mbuUg/fAvFAGJWPnqlpJAlVs54oB8K4dILcyjXXi0YTwpPTvywduibt7VLNgYbkmo7yfkTpCVookeq9GWTarIfceLRsShGgczZP73rA4z/MJstznHMQhX9XuWmlZ2Koqwsrabl9U0FQremgGLMrOQ3lTUKY/V8xTncHhExXFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739365988; c=relaxed/simple;
	bh=fPMRohAWk3guuY2CUGzeVs+TE/Gkhlw0icH5f+tv1X0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H6Jr4+9J7Fa8BpRLdZFWN6vIOlxoaqgRJW5Gw2qBztM9Nu9a4IUqLCR27vpGA27ZpeUijVJpiluAXUItW6vxwfiheQcBzHlIqrbrcxrzoFLZkxL53pZ192ZCrwAql9Aj6btyaDCqHh36i1mopT2LkxXsg9owgH4nU56fgPu0mk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KiXRvXjU; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CDCpfu529545
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 12 Feb 2025 07:12:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739365971;
	bh=sNerRum16Fb0gtFk7RCwq9TToOQ+x4JGAgbKydK6Cok=;
	h=From:To:CC:Subject:Date;
	b=KiXRvXjUmCU29Hx2qn4qcLLTcMLhStuVX+StWkSSgtE4raYdadIWVJGa2kztCW+8Q
	 vxmqQgdOGCw1E6ynFmRIhtJOZUghshT/L0xAco2b/i3K4fJmG8oumTuggdGwnHmSE/
	 a/5zV7WE660+sTvsxLwvqQuFAmepd2yEzYWkF/5o=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CDCpEA090213;
	Wed, 12 Feb 2025 07:12:51 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 07:12:50 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 07:12:51 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CDCkOL050929;
	Wed, 12 Feb 2025 07:12:47 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [RFC PATCH 0/3] Enable support for error detection in CSI2RX
Date: Wed, 12 Feb 2025 18:42:41 +0530
Message-ID: <20250212131244.1397722-1-y-abhilashchandra@ti.com>
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

Logs with interrupt in DT: https://gist.github.com/Yemike-Abhilash-Chandra/58ced4df0158efad6f453b4d96463723
Logs without interrupt in DT: https://gist.github.com/Yemike-Abhilash-Chandra/d807230b2a624b7a38effed89efdd148

Yemike Abhilash Chandra (3):
  dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for
    cdns-csi2rx
  media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add
    support for VIDIOC_LOG_STATUS
  media: ti: j721e-csi2rx: Add support for VIDIOC_LOG_STATUS

 .../bindings/media/cdns,csi2rx.yaml           |  11 ++
 drivers/media/platform/cadence/cdns-csi2rx.c  | 104 +++++++++++++++++-
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   |  10 ++
 3 files changed, 124 insertions(+), 1 deletion(-)

-- 
2.34.1


