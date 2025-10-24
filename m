Return-Path: <linux-media+bounces-45472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A42C0566B
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 253EA1B86880
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1DF30C619;
	Fri, 24 Oct 2025 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fVbycJOr"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD1E30C361;
	Fri, 24 Oct 2025 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761299119; cv=none; b=UkZJrxUKWN2heA4gYCyNNtUa0Q3lildljoKG+RjrvaWc9Cv3mXbflFE/3vbkn66AsDasB8rrWu4sgjZ/1FGp5EE2rE6BKhC6tKP6gcHgIxszrsXe1hGLlpHIQ/tU/rIGZezewh/EYN+jWZ+Yyc0In6MSghpn9p4X5FjYLSn22hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761299119; c=relaxed/simple;
	bh=SaBF8viV0dIiqKCz8Q5Dk0LVBZejZ1Km/cnoN3ewqhU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rQ24Y+xDnWNjwkafRfLyDDRMOGWq6/GXsYeUWPyRlIW2U+x5tY3P27HaTcC3vQlQvm5ItE5bzxLZNWTVJMqx9HffNVl4wvBeRZBftDHEb3xxKniFN5D1ATPvUw+6pVNOzgGRWpVwC8OyF0R+OZikdktfjwll4AjJbtV1LnFP8A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fVbycJOr; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59O9ixPd1866672;
	Fri, 24 Oct 2025 04:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761299099;
	bh=V/FawtRoWikjI/+UOtDM3BRdTJcd7AAkk5EmqHmxR/4=;
	h=From:To:CC:Subject:Date;
	b=fVbycJOreqSI6vPhrGusdh8dmISlKaged+PTl0W842qmgxOJMHPneY/V5+AtYgvSO
	 BKSmJoiCbd2R02EEGWqkwdZkgmFuWqLgQkEJr++TyIpQYUt8dnubuYcPtOmd7HBX7x
	 tFZ4NMImZNwoBzV++eL/8ayOtMSJZd8yAXzk5eWo=
Received: from DLEE207.ent.ti.com (dlee207.ent.ti.com [157.170.170.95])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59O9iwwx3797255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 04:44:58 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 04:44:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 04:44:58 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59O9isvj148409;
	Fri, 24 Oct 2025 04:44:55 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V5 0/4] Add support for TI VIP
Date: Fri, 24 Oct 2025 15:14:48 +0530
Message-ID: <20251024094452.549186-1-y-abhilashchandra@ti.com>
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
Changes in v5:
Krzysztof:
- Drop VIP node's label from the example in DT bindings
- Fix indentation of the example in DT bindings
- Get the phandle args directly through syscon call using syscon_regmap_lookup_by_phandle_args()
- Use devm_platform_ioremap_resource() instead of platform_get_resource() and devm_ioremap_resource()
- Drop struct resource *res from vip shared structure since it is now unused

v4l2-compliance output: https://gist.github.com/Yemike-Abhilash-Chandra/8d68342247da38d6ac59625f8eaf41c2
v4l2-compliance output with -s: https://gist.github.com/Yemike-Abhilash-Chandra/1dfa740a34e0e3d77a315b245e61b9ec
Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/e44c4504d596f24e7c93a4c0b59f5316
DT binding check results: https://gist.github.com/Yemike-Abhilash-Chandra/a7eb1308df2d4a167baeec62bc744335
(No errors related to ti,vip.yaml)

Link for v4: https://lore.kernel.org/linux-media/20251015054010.3594423-1-y-abhilashchandra@ti.com/#t

Dale Farnsworth (2):
  dt-bindings: media: ti: vpe: Add support for Video Input Port
  media: ti: vpe: Add the VIP driver

Yemike Abhilash Chandra (2):
  media: ti: vpe: Re-introduce multi-instance and multi-client support
  media: ti: vpe: Export vpdma_load_firmware() function

 .../devicetree/bindings/media/ti,vip.yaml     |  152 +
 MAINTAINERS                                   |    1 +
 drivers/media/platform/ti/Kconfig             |   13 +
 drivers/media/platform/ti/vpe/Makefile        |    2 +
 drivers/media/platform/ti/vpe/vip.c           | 3731 +++++++++++++++++
 drivers/media/platform/ti/vpe/vip.h           |  717 ++++
 drivers/media/platform/ti/vpe/vpdma.c         |   51 +-
 drivers/media/platform/ti/vpe/vpdma.h         |    6 +
 8 files changed, 4672 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
 create mode 100644 drivers/media/platform/ti/vpe/vip.c
 create mode 100644 drivers/media/platform/ti/vpe/vip.h

-- 
2.34.1


