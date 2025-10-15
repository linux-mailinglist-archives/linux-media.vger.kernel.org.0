Return-Path: <linux-media+bounces-44510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A9735BDC9D7
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 923064F02DC
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 05:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FEF304BC9;
	Wed, 15 Oct 2025 05:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yzIs9BKU"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2AC303A1B;
	Wed, 15 Oct 2025 05:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760506844; cv=none; b=C0rZF2tpTw25Ak92CBH8CLqooRmVyhpTHdCjbcalLf0ZWXzMVqzkrc8Hp16/YGtOhMLdJzGVZqX+zQ+dzPwHMATsWAk1wooCiZNmXFRoBwbXbb+Hq4LAySVQZrCM1xiEinKj4KP/WxAN9EGJ7AN6OZWW/JuTA5QRx7MQptbwlSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760506844; c=relaxed/simple;
	bh=fNcJHdFUZ2WHsns0BrvYXh6fbYDf9V5bj+AJd42kL+s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NLN8KMT3u8LqbL6PK4PuExYGP360z4uJoWuLCS8nSnKjDfWHzikUWu4AeKbcFHrKIBY8Fzc0IFUsMLnJUnOmxToZvolBw3icyV8hRYwLiGd9gVi2i3r+peHBVTS7IscYNdQM//KN2DGSPzX0K5CORn4zActUlG6TYbHOz9z3LhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yzIs9BKU; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59F5eLWE1325957;
	Wed, 15 Oct 2025 00:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760506821;
	bh=zBlcndI1ax3fVVRbbDl9BtSJkNKQA+sz61J803UVK0s=;
	h=From:To:CC:Subject:Date;
	b=yzIs9BKUZs1xOvpvQLyVYuW1DhBIfpkb4qcIjXyTa5leFOqfAERGNm/ogYsI3oHiu
	 dkrg9INAUxwsaDJ7QfXHFqgYOcfBuSBO+34f4RYN97w8BDnLO2lpMZ40z9VGwj7/Hl
	 fZf2lpnmSOwImd2wXf5wSfRhwpLAJniJp7ujsBUE=
Received: from DFLE207.ent.ti.com (dfle207.ent.ti.com [10.64.6.65])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59F5eLvL994478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 00:40:21 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 00:40:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 00:40:20 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59F5eGdm1402458;
	Wed, 15 Oct 2025 00:40:17 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V4 0/4] Add support for TI VIP
Date: Wed, 15 Oct 2025 11:10:06 +0530
Message-ID: <20251015054010.3594423-1-y-abhilashchandra@ti.com>
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

This patch series adds support for the TI VIP. VIP stands for Video
Input Port, it can be found on devices such as DRA7xx and provides
a parallel interface to a video source such as a sensor or TV decoder. 

Each VIP can support two inputs (slices) and a SoC can be configured
with a variable number of VIP's. Each slice can support two ports
each connected to its own sub-device.

Changelog:
Changes in v4:
Krzysztof:
- Squash patches 1,2,3 of v3 into patch 1 of v4
- Fix title in DT binding
- Drop configuration parameters from DT binding
- Remove redundant remote-endpoint in DT binding
- Have one contiguous address space as defined by TRM.
- Make example complete by adding endpoints to all VIP instances
- Since we now have one contiguous address space, declare offsets
  of scalar, color space converter and vpdma in vip.h
- Also change the driver to use these offsets instead of
  using sc.c and csc.c libraries
- Since we now have one contiguous address space, we cannot use
  VPDMA helpers. Hence export vpdma_load_firmware() to load
  VPDMA firmware (Patch 2/4)

v4l2-compliance output: https://gist.github.com/Yemike-Abhilash-Chandra/0abe023164a3086f9e72603e531433a8
v4l2-compliance output with -s: https://gist.github.com/Yemike-Abhilash-Chandra/55c808f7341ae3bb4846b137533910c2
Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/a607e1def40224aa4ecfb08e988bbd19
DT binding check results: https://gist.github.com/Yemike-Abhilash-Chandra/ba101033c9374f03977c1d946bfda4a2
(No errors related to ti,vip.yaml)

Link for v3: https://lore.kernel.org/all/20250909080718.1381758-1-y-abhilashchandra@ti.com/

Dale Farnsworth (2):
  dt-bindings: media: ti: vpe: Add support for Video Input Port
  media: ti: vpe: Add the VIP driver

Yemike Abhilash Chandra (2):
  media: ti: vpe: Re-introduce multi-instance and multi-client support
  media: ti: vpe: Export vpdma_load_firmware() function

 .../devicetree/bindings/media/ti,vip.yaml     |  149 +
 MAINTAINERS                                   |    1 +
 drivers/media/platform/ti/Kconfig             |   13 +
 drivers/media/platform/ti/vpe/Makefile        |    2 +
 drivers/media/platform/ti/vpe/vip.c           | 3742 +++++++++++++++++
 drivers/media/platform/ti/vpe/vip.h           |  721 ++++
 drivers/media/platform/ti/vpe/vpdma.c         |   51 +-
 drivers/media/platform/ti/vpe/vpdma.h         |    6 +
 8 files changed, 4684 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
 create mode 100644 drivers/media/platform/ti/vpe/vip.c
 create mode 100644 drivers/media/platform/ti/vpe/vip.h

-- 
2.34.1


