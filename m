Return-Path: <linux-media+bounces-26421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A14F8A3D1A5
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 08:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1CF23BC16F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 07:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854311E4928;
	Thu, 20 Feb 2025 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="N3ej72+O"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73370157A6B;
	Thu, 20 Feb 2025 07:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740034883; cv=none; b=AU83OdxN6FpIE2gLPjLIXhcJrjBscnQo0ZDbjsadqCHpKYiKHLxhx3saaLfhgTZEsjehC3mFr41n00iouRs+R3WsmfjquxHpVdps7dLPhmKF8pNbde5RD/EleP6FKDGYKucu4Cm/HNpPiUK4mhQp37EX4/yTs3eH1dPoSJ3GcR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740034883; c=relaxed/simple;
	bh=26eFTRZNda2g/l0fm5nsuNjO8hSgHFfk2fxuVdVq0Tw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qQEwoQk6Uui8i17EJqpoTAXAC4cjywtsm+Pn3NhIyV4NywUnb09rBXKqdP6dowptIXQjOaXNKPRq5o2cXFoU8rLNRvfBWwrNp1MBnrlKE/avUtDrQEzHOJQ4R2Ycm6F0QhZ6zRs0uHWeNOMfnRFN/axFhGT8cS2opSi26I7q0UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=N3ej72+O; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7b282760ef5811ef8eb9c36241bbb6fb-20250220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DkG/UtvUD1vBAFGouo8/8ihRmf6ROZf+6eSQ45AQQnA=;
	b=N3ej72+OLCobJlZYGvkdnZZowyFJwoNEd6q2T6DmNgL/IO6cA2Sim7eW8IXN/H/Y0qQW+P9HU9oHjOsFssyfOBNURGkU2TBOGBSJEyQmfGwY8JNTsaylcnJda+aIswH2QF//LN41YdFTBAq0bpekhNZAWz24d6pgAlIj2q8Zgfk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:ca8ba0b9-548a-4f0d-af05-c64bb62d9203,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:cda55bb5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7b282760ef5811ef8eb9c36241bbb6fb-20250220
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1151868900; Thu, 20 Feb 2025 15:01:17 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 20 Feb 2025 15:01:16 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 20 Feb 2025 15:01:15 +0800
From: bo.kong <bo.kong@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor
 Dooley <conor+dt@kernel.org>, mtk29348 <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<zhaoyuan.chen@mediatek.com>, <teddy.chen@mediatek.com>
Subject: [PATCH v4 0/4] Add MTK AIE Driver For MT8188
Date: Thu, 20 Feb 2025 14:59:49 +0800
Message-ID: <20250220070114.15015-1-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Bo Kong <Bo.Kong@mediatek.com>

AIE(AI Engine) is one of the units in mt8188 ISP which
provides hardware accelerated face detection function,
it can detect different sizes of faces in a raw image.

Bo Kong (4):
  media: dt-bindings: add MT8188 AIE
  arm64: dts: mt8188: add aie node
  uapi: linux: add MT8188 AIE
  media: mediatek: add MT8188 AIE driver

 .../bindings/media/mediatek,mt8188-aie.yaml   |   90 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      |   33 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/aie/Kconfig   |   12 +
 drivers/media/platform/mediatek/aie/Makefile  |    5 +
 drivers/media/platform/mediatek/aie/mtk_aie.h | 1181 +++++++++
 .../media/platform/mediatek/aie/mtk_aie_53.c  | 1300 ++++++++++
 .../media/platform/mediatek/aie/mtk_aie_drv.c | 2309 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    3 +
 include/uapi/linux/mtk_aie_v4l2_controls.h    |  134 +
 include/uapi/linux/videodev2.h                |    6 +
 12 files changed, 5075 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
 create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
 create mode 100644 drivers/media/platform/mediatek/aie/Makefile
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_53.c
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
 create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

-- 
2.45.2


