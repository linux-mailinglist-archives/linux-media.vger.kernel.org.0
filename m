Return-Path: <linux-media+bounces-26210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A5A383D6
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 14:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B100A3A6CBF
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 13:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D90621CA17;
	Mon, 17 Feb 2025 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BRSpZbcy"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF6421C180;
	Mon, 17 Feb 2025 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797236; cv=none; b=kpy2XX95KGNQ0t5hKrptN9XL5LEiEGQSOt/GUOK4QPBb9Sz6+uIUOiwHTO66WIkDf79pF6iB9MGjFUDE6IkRgDefdaprLDiJ6SwHSUO5XVLvOh4fEtVfXTI0AmvMa9X2ssktYISNT+O6GlBb9kGLgyQ5pGPVEg3WR/WfwmosLb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797236; c=relaxed/simple;
	bh=LaU7PgRal3vyeYiORGinKefrlg9KOh1cTwQ2BsiRs24=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oAxJXkHVZDbTIL0keZZMv7nbMkpfmYQSfgWrP2joAODR27jlQuI2sTkRi+SExMsgelLVllXWkQEEK0/oO9U87GXIZxpw1OFjomTdt0E+jrH4wOCWgHcL9Yc8DcWmJUE1GdY/1cIkXEXNIe8KF78er3WK4LfuIicdLqbyWQ82BhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BRSpZbcy; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51HD0KBI1355358
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 07:00:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739797220;
	bh=J2HYyvasZCADPfSQPuqiL0PeVC/rs8L2xMJZCLQVjLI=;
	h=From:To:CC:Subject:Date;
	b=BRSpZbcy8HAkFDFjKZerrarznEnjiv2Dh1PRJxoaLk0WlrmE6XqqOGOI2q2ztwcRR
	 D9B6htW5Y0NS3nOwKDDm4+OcdXOu1i2Qnjs1k15wUJzdpGtkBhe3ptc72cvT+Jx/3H
	 Bx6hnqB+MvuJyLis3URoiEWnlz6CtQMpt5U8T14s=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51HD0K5n119600
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Feb 2025 07:00:20 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Feb 2025 07:00:20 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Feb 2025 07:00:20 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51HD0Ffr072350;
	Mon, 17 Feb 2025 07:00:16 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH v2 0/2]  Enable support for error detection in CSI2RX
Date: Mon, 17 Feb 2025 18:30:11 +0530
Message-ID: <20250217130013.2802293-1-y-abhilashchandra@ti.com>
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
Changes in v2:
- Address Krzysztof's review comment to remove flexibility while adding
  interrupts.
- Address Jai's review comment to drop support VIDIOC_LOG_STATUS on a
  video node.
- Address Jai's review comment to get interrupt at probe instead of
  start_stream.
- Address Jai's review comment to change dev_warn to dev_dbg when there
  is no interrupt defined in DT.

V1: https://lore.kernel.org/all/20250212131244.1397722-1-y-abhilashchandra@ti.com/

Logs with interrupt in DT: https://gist.github.com/Yemike-Abhilash-Chandra/fb887bda738da91ea2a24690cd7b0818
Logs without interrupt in DT: https://gist.github.com/Yemike-Abhilash-Chandra/18347df18041e43b78e9738263d77aa9


Yemike Abhilash Chandra (2):
  dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for
    cdns-csi2rx
  media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add
    support for VIDIOC_LOG_STATUS

 .../bindings/media/cdns,csi2rx.yaml           |  10 ++
 drivers/media/platform/cadence/cdns-csi2rx.c  | 102 +++++++++++++++++-
 2 files changed, 111 insertions(+), 1 deletion(-)

-- 
2.34.1


