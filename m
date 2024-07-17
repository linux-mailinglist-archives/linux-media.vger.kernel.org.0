Return-Path: <linux-media+bounces-15077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C1933D2E
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 14:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1303FB21634
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 12:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AC01802A9;
	Wed, 17 Jul 2024 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QEZmVU0i"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A6317FAC6;
	Wed, 17 Jul 2024 12:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721220883; cv=none; b=lrrKHkmZrU6UArVkbbPBplKNlb3kXApSYgjLcdmddsTfYjOVURrjskkDN/eWLfT6Lkx0pe/7zZl4e7YVJDNEfTOh+hN9+CDozaiF8T/0q9oFqE9IAsEN1lKkpDkPJiYkTZSHdav5GJZPPTpFq7TODVYLPHX+LWjj6KJmc52SvHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721220883; c=relaxed/simple;
	bh=RL2VK9r9CFKKfbpLuivz0zW8yjhuK4aybkS2mX8AhK8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZepL6fRC10ylzq5Z8qE0SO4Kkcz0nG4U0vhoeOph5VOVsjvMrgS4vqjMUCbzW9gB/HZXYnacqbvE9oABWRl6iAn7ngQ/5jCZh1ZN4ia26PRTCQ04VmqrZkjx5WEMyMjjftY8t9DA9rT7/5yf8kPKAmJFt/yMw7LL0jtlRDu5BQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=QEZmVU0i; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b3b10598443b11ef87684b57767b52b1-20240717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Rv5h5Afg1dhXQ63cMre+wMIfyIsc5/TOkQPTstUpFJ0=;
	b=QEZmVU0iVaX6xJ05zvcBQRqy89zvJmyHiH0qhgtNgTVPjj5Uq1YFaX9FVkxd1dRUWlilZXzE0ECCxXnMQA0dj8eGnxrxltc4Kh8wEsF235Vr4TtBzNGrxDUtsoQAurvKN22UBQL1kp46Qz8YneKeShtVzt3ciHzVsInLiXNkWXY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:8e69f4b1-94f8-46a6-a1de-0309d1e190b3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:82aa74d5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b3b10598443b11ef87684b57767b52b1-20240717
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yelian.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 188371037; Wed, 17 Jul 2024 20:54:28 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 Jul 2024 05:54:30 -0700
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 Jul 2024 20:54:29 +0800
From: 20220614094956 created <yelian.wang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yelian Wang
	<yelian.wang@mediatek.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<yaya.chang@mediatek.com>, <teddy.chen@mediatek.com>,
	<hidenorik@chromium.org>
Subject: [PATCH 0/3] media: mediatek: Add support MT8188 AIE
Date: Wed, 17 Jul 2024 20:41:54 +0800
Message-ID: <20240717125426.32660-1-yelian.wang@mediatek.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N

From: Yelian Wang <yelian.wang@mediatek.com>

*** BLURB HERE ***

This patch series add YAML DT binding and V4L2 sub-device driver 
for mediatek MT8188 AIE. AIE is the ISP unit in the SoC，it's used
to detect faces on an image stored in dram. Mainly used for the 
camera's Face Detection function of MT8188.

This series is based on linux-next, tag: next-20240716

Yelian Wang (3):
  media: dt-bindings: add MT8188 AIE
  uapi: linux: add MT8188 AIE
  media: mediatek: add MT8188 AIE driver

 .../bindings/media/mediatek-aie.yaml          |   99 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/aie/Kconfig   |   13 +
 drivers/media/platform/mediatek/aie/Makefile  |    5 +
 drivers/media/platform/mediatek/aie/mtk_aie.h | 1012 +++++
 .../media/platform/mediatek/aie/mtk_aie_53.c  | 2031 +++++++++
 .../media/platform/mediatek/aie/mtk_aie_drv.c | 3613 +++++++++++++++++
 include/uapi/linux/mtk_aie_v4l2_controls.h    |  130 +
 include/uapi/linux/videodev2.h                |    6 +
 10 files changed, 6911 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-aie.yaml
 create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
 create mode 100644 drivers/media/platform/mediatek/aie/Makefile
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_53.c
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
 create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

-- 
2.34.1


