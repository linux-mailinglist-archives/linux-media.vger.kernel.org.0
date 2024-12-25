Return-Path: <linux-media+bounces-24055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9EF9FC454
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 10:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7183318831CA
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 09:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AE11885AD;
	Wed, 25 Dec 2024 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gW+ZrIYz"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41240146A9F;
	Wed, 25 Dec 2024 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735117292; cv=none; b=KsIlNFtYlWV3sapX0HFHY+tgTp8jR1PYjVMakoEd+3SCIElEC44BeLcnEwRD3Lc14n2hAtvT9zWa8YlLryAzqk5rR7bm/kvDySasPj7Ezk6qhRnsMKEeaqH7WQJOa5QFXjtfGC2/49f0myC/2i000X7v4hRT9fpmchxYcEn4HX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735117292; c=relaxed/simple;
	bh=bFI1sjozKcSlaYaJAVWWTOBBxAMWGgKZ/acQ9BR30sI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HFLqyA58pCn7etnTJ3UMI6l53rQ+MYZ+AACSXs6EFlpKL0DWCbXeH3EyM8+aS54Hm02+LItdpqc5c38ZT0PhikvwsjYvtQyrxP0ZJPiBne/CtosKFY2XHbNf7OmeiBytHVn/QLTNxCUs/50HFP4MnrfGyeHsLhjdDGfpcqqcfwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gW+ZrIYz; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cca57278c29e11efbd192953cf12861f-20241225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TXZXNw/CVhdjctS/rmk4J5s1TQ/EXWSUdcZULpsQrKY=;
	b=gW+ZrIYzz1C1B21vglW9hAd+h/YPYs8TXe0cQaJ14IHw3LN/17VX3ThXmua5W4JqMNZ3mYymYGrWoluPAG6H0Ow7GxgO5RVu04ui0bqIW1J9+Qv3FO7jNnTsBIAliaPTayzz8zOauFUy9i2DwaWzU4/isgEIs+FNyYwsJ4JcpZU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:81ba5839-90df-4058-a5d6-afc3e5f636c4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:890ed818-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cca57278c29e11efbd192953cf12861f-20241225
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 88483694; Wed, 25 Dec 2024 17:01:16 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Dec 2024 17:01:15 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Dec 2024 17:01:14 +0800
From: bo.kong <bo.kong@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>
CC: <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 0/4] Add AIE Driver
Date: Wed, 25 Dec 2024 17:00:19 +0800
Message-ID: <20241225090113.17027-1-bo.kong@mediatek.com>
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

AIE(AI Engine) is one of the units in mt8188 ISP which provides
hardware accelerated face detection function.

Bo Kong (4):
  arm64: dts: mt8188: add aie node
  media: dt-bindings: add MT8188 AIE
  media: mediatek: add MT8188 AIE driver
  uapi: linux: add MT8188 AIE

 .../bindings/media/mediatek,mt8188-aie.yaml   |   97 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      |   33 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/aie/Kconfig   |   41 +
 drivers/media/platform/mediatek/aie/Makefile  |    8 +
 drivers/media/platform/mediatek/aie/mtk_aie.h |  950 +++++
 .../media/platform/mediatek/aie/mtk_aie_53.c  | 1398 +++++++
 .../media/platform/mediatek/aie/mtk_aie_drv.c | 3545 +++++++++++++++++
 include/uapi/linux/mtk_aie_v4l2_controls.h    |  132 +
 include/uapi/linux/videodev2.h                |    6 +
 11 files changed, 6212 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
 create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
 create mode 100644 drivers/media/platform/mediatek/aie/Makefile
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_53.c
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
 create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

-- 
2.45.2


