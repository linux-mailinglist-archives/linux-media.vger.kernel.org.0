Return-Path: <linux-media+bounces-19309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5B3996835
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 13:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A293D1C20CC4
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 11:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBA1191F66;
	Wed,  9 Oct 2024 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HSOPaN3S"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C189F1C6BE;
	Wed,  9 Oct 2024 11:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472571; cv=none; b=ggKgipN/IzDeMFoqG7/LTc2ZJDWX7yT4Jwl1KoKuNlj0ex7UDLK9to6vTqSn8C6c7zmRHq5uMl9eJC5XVRwBDznxgLNirLY2i6B1hubcWnqri3SG1j7SLR72Y+dWQJ3GIsQUrsHm9wHZ2s1QEYeY3Xy/LMCN1ObXnEboawWfmhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472571; c=relaxed/simple;
	bh=5ynCkb7KI8rVXQ1EVFqvg+XEXi0qpuDi3gDPzXlm50I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RP3/auE09WfiAUCTAbUv37p7UyAipdnDWwtteIXAYXyp1BwJ5AaLK4RG6lbWcSSqXYDs1Ai/TX+RL8s7ytuHMDAU8bPhFfd/jiVe0RCTztfyilQEYY52BMr8e+3ILJZCAtqLBGWE+MLR+VBcj2aQI2hXbFhkObEdTa93PH0fBXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HSOPaN3S; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: de15759a862f11ef88ecadb115cee93b-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WDQk23QF8GeWnYzaw3f6RwMziRHPmdE4gatkybBRKwQ=;
	b=HSOPaN3SFs1YZO/73Ww4v2lBtRPJx+4YdOJjjH4an8Op2MLDjSFoCQpLfkjYfzU9HSYcCKX2C6PY2DQvEstRopeDm6Oi8ivHYGfdffKjo/iv9koE19jGfRaR3kCmFeDdQcxZlT1fEqucHWBkVRd4PfBzA9OPBWGZOkY61X24TzM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:14c99a62-7d1c-4dfd-b57c-8794b384e1d7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:b7a48926-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: de15759a862f11ef88ecadb115cee93b-20241009
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <shu-hsiang.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1338231174; Wed, 09 Oct 2024 19:16:01 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 19:15:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 19:15:59 +0800
From: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Christian Konig <christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<yaya.chang@mediatek.com>, <teddy.chen@mediatek.com>,
	<hidenorik@chromium.org>, <yunkec@chromium.org>, <shun-yi.wang@mediatek.com>,
	Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
Subject: [PATCH v1 00/10] Add MediaTek ISP7 camera system driver
Date: Wed, 9 Oct 2024 19:15:41 +0800
Message-ID: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.819300-8.000000
X-TMASE-MatchedRID: /6tHgHEL3iGAaBshbPhdTBWCVBr+Ay98vhf/zJ92tsPdyIjG+fPOFe5n
	np6b8PTveXq1+k2LDlqtCrdXtF3Jjy4UUq9htJ320C5BWPk1/EG0GxL+/GCnQ1wpnAAvAwazxca
	mCHrGUIj+ZF6Oacqo2yQP4QGuRJMzRbwaQX0OEahH+PTjR9EWkl+iEcKpKdpuNSweOixQAJJHdE
	c8dOyw1Vl+Hk3Iw2bEgDLqnrRlXrZ8nn9tnqel2MprJP8FBOIaqdk2nO+ebu9vQfhO+XsKpRGKW
	WkeCBsRDfaaTTjjxxjC7y1r1oW8QA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.819300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A293CE762DBA9DA2202B574D5BDF1F45F28941944CEBC2497E35940D4614489A2000:8

Based on linux-next/master, tag: next-20241008

The patch set adds the MediaTek ISP7.x camera system hardware driver.

This driver sets up ISP hardware, handles interrupts, and initializes
V4L2 device nodes and functions. Moreover, implement V4L2 standard
video driver that utilizes media framework APIs. It also connects
the sensors and ISP, bridging with the seninf interface. Communicate
with SCP co-processor to compose ISP registers in the firmware.

These patches include CSI received data from sensors, sensor interface
bridge, raw/YUV image pre-processing, ISP utility and ISP control parts.

Thank you for reviewing these patches.

Shu-hsiang Yang (10):
  dt-bindings: media: mediatek: add camsys device
  media: platform: mediatek: add seninf controller
  media: platform: mediatek: add isp_7x seninf unit
  media: platform: mediatek: add isp_7x cam-raw unit
  media: platform: mediatek: add isp_7x camsys unit
  media: platform: mediatek: add isp_7x utility
  media: platform: mediatek: add isp_7x video ops
  media: platform: mediatek: add isp_7x state ctrl
  media: platform: mediatek: add isp_7x build config
  uapi: linux: add mediatek isp_7x camsys user api

 .../media/mediatek/mediatek,cam-raw.yaml      |  169 +
 .../media/mediatek/mediatek,cam-yuv.yaml      |  148 +
 .../media/mediatek/mediatek,camisp.yaml       |   71 +
 .../media/mediatek/mediatek,seninf-core.yaml  |  106 +
 .../media/mediatek/mediatek,seninf.yaml       |   88 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    2 +
 drivers/media/platform/mediatek/isp/Kconfig   |   21 +
 .../platform/mediatek/isp/isp_7x/Makefile     |    7 +
 .../mediatek/isp/isp_7x/camsys/Makefile       |   16 +
 .../isp_7x/camsys/kd_imgsensor_define_v4l2.h  |   87 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c | 1797 ++++++
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h |  140 +
 .../isp/isp_7x/camsys/mtk_cam-debug.c         | 1271 ++++
 .../isp/isp_7x/camsys/mtk_cam-debug.h         |  273 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-defs.h |  168 +
 .../isp/isp_7x/camsys/mtk_cam-dmadbg.h        |  721 +++
 .../isp/isp_7x/camsys/mtk_cam-feature.c       |   40 +
 .../isp/isp_7x/camsys/mtk_cam-feature.h       |   26 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h  |   87 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h  |  233 +
 .../isp/isp_7x/camsys/mtk_cam-meta-mt8188.h   | 2436 ++++++++
 .../isp/isp_7x/camsys/mtk_cam-plat-util.c     |  207 +
 .../isp/isp_7x/camsys/mtk_cam-plat-util.h     |   16 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.c |  393 ++
 .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.h |   28 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.c  | 5359 +++++++++++++++++
 .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.h  |  325 +
 .../isp/isp_7x/camsys/mtk_cam-raw_debug.c     |  403 ++
 .../isp/isp_7x/camsys/mtk_cam-raw_debug.h     |   39 +
 .../isp/isp_7x/camsys/mtk_cam-regs-mt8188.h   |  382 ++
 .../isp/isp_7x/camsys/mtk_cam-seninf-def.h    |  193 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-drv.c    | 1741 ++++++
 .../isp/isp_7x/camsys/mtk_cam-seninf-drv.h    |   16 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-hw.h     |  120 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-if.h     |   28 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-regs.h   |   40 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-route.c  |  356 ++
 .../isp/isp_7x/camsys/mtk_cam-seninf-route.h  |   23 +
 .../isp/isp_7x/camsys/mtk_cam-seninf.h        |  170 +
 .../isp/isp_7x/camsys/mtk_cam-timesync.c      |  125 +
 .../isp/isp_7x/camsys/mtk_cam-timesync.h      |   12 +
 .../isp/isp_7x/camsys/mtk_cam-ufbc-def.h      |   59 +
 .../isp/isp_7x/camsys/mtk_cam-video.c         | 1817 ++++++
 .../isp/isp_7x/camsys/mtk_cam-video.h         |  224 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam.c      | 4168 +++++++++++++
 .../mediatek/isp/isp_7x/camsys/mtk_cam.h      |  733 +++
 .../isp_7x/camsys/mtk_camera-v4l2-controls.h  |   65 +
 .../isp_7x/camsys/mtk_csi_phy_2_0/Makefile    |    5 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h   |  911 +++
 .../mtk_cam-seninf-csi0-cphy.h                |   69 +
 .../mtk_cam-seninf-csi0-dphy.h                |  139 +
 .../mtk_cam-seninf-hw_phy_2_0.c               | 2879 +++++++++
 .../mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h  |  257 +
 .../mtk_cam-seninf-seninf1-csi2.h             |  415 ++
 .../mtk_cam-seninf-seninf1-mux.h              |  147 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h  |   47 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h      |   49 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h |   99 +
 include/uapi/linux/mtkisp_camsys.h            |  227 +
 60 files changed, 30194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,cam-yuv.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,seninf-core.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,seninf.yaml
 create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_imgsensor_define_v4l2.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-defs.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-dmadbg.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-feature.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-feature.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-meta-mt8188.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-regs-mt8188.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-def.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-hw.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-if.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-regs.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-timesync.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-timesync.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ufbc-def.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_camera-v4l2-controls.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h
 create mode 100644 include/uapi/linux/mtkisp_camsys.h

-- 
2.18.0


