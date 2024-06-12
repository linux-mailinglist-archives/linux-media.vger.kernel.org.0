Return-Path: <linux-media+bounces-12973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E66904847
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 03:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7CD71F243FA
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 01:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7034A12;
	Wed, 12 Jun 2024 01:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dhhfKCQS"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD7F4A0A;
	Wed, 12 Jun 2024 01:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718155238; cv=none; b=hJJgSZDjDt89ibhLavt4GkHydPqmZM6bkljkPZgvrAIgLIvHjR31DJtiuc94mwwYo4K0zgtFzV77Lv5324OTo23qL5M+RNZmvQGvZ6MvrkKa/vaKvguBrxU39Q6Hv5G8onJsN+t3OLEfDHjJge0/WRYm5N99Y2NgMEDX6LOOdaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718155238; c=relaxed/simple;
	bh=UFCfQ0hrhFG/Vxf7U9u47frkRuW4P5y2nTaEQJReSsA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AJCiIu731DXUb7xGFJTG1558RWgbLG9H9TtvEzMA8dUGui8fF6i1oZqG7zOC1Wrz4iD0fgwmgLvjWb44uwJx4SoIF5plQPScnAKEz4mCEQ/LBpz1JlEsVkiuz0uc/P0wBjy8CwMoj9nEAsbILFG5HadrkKSTayy02Hv3rV1qmvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=dhhfKCQS; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f63dabc6285911efa54bbfbb386b949c-20240612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=204HJCc8S6y1MsmDodpJho9HqhzErabCckCS1J9ulx8=;
	b=dhhfKCQSHK8ikh1VwEwQv1layrNwulIxekQhXLsOwldNIWW/1u23bQv/27HlNvzlahxE0Dy14ucwb392bu29OyKmlXiFPdwVVU1bcScshQSqmStGKPQmYEtRGxTX+2sS7Ll8ttowq9cASLH5KgevQYepl0DUKVLUyksdGfNRP4Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:0d94837d-31ff-4ef6-9ed2-945d9baca99b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:393d96e,CLOUDID:63f7df93-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: f63dabc6285911efa54bbfbb386b949c-20240612
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 15499936; Wed, 12 Jun 2024 09:20:32 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 12 Jun 2024 09:20:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 12 Jun 2024 09:20:29 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Zhi Mao <zhi.mao@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Heiko Stuebner
	<heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, Mehdi
 Djait <mehdi.djait@bootlin.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bingbu Cao <bingbu.cao@intel.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<shengnan.wang@mediatek.com>, <yaya.chang@mediatek.com>,
	<yunkec@chromium.org>, <10572168@qq.com>
Subject: [PATCH v3 0/3] media: i2c: Add support for GT97xx VCM
Date: Wed, 12 Jun 2024 09:20:16 +0800
Message-ID: <20240612012019.19078-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This series add YAML DT binding and V4L2 sub-device driver for Giantec's GT9768&GT9769.
GT9768&GT9769 is a 10-bit DAC with 100mA output current sink capability, designed
for voice coil motor(VCM) with I2C control bus.

This driver supports:
 - support pm runtime function for suspend/resume
 - support camera lens focus position by V4L2_CID_FOCUS_ABSOLUTE CMD
 - used in camera features on ChromeOS application

Previous versions of this patch-set can be found here:
v2:https://lore.kernel.org/all/20240427012613.6621-1-zhi.mao@mediatek.com/
v1:https://lore.kernel.org/all/20240420011840.23148-1-zhi.mao@mediatek.com/
v0:https://lore.kernel.org/all/20240410104002.1197-1-zhi.mao@mediatek.com/

This series is based on linux-next, tag: next-20240611
Changes in v3:
- Add maintainer entry for GT97xx VCM driver

Thanks

Zhi Mao (3):
  media: dt-bindings: i2c: add Giantec GT97xx VCM
  media: i2c: Add GT97xx VCM driver
  MAINTAINERS: Add entry for GT97xx VCM driver

 .../bindings/media/i2c/giantec,gt9769.yaml    |  55 +++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  13 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/gt97xx.c                    | 436 ++++++++++++++++++
 5 files changed, 513 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
 create mode 100644 drivers/media/i2c/gt97xx.c

-- 
2.25.1



