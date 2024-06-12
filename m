Return-Path: <linux-media+bounces-12981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1069048E8
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 04:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B86C28A094
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 02:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76204374FF;
	Wed, 12 Jun 2024 02:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NNg8hq08"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A9C358A7;
	Wed, 12 Jun 2024 02:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718158732; cv=none; b=SKAURKNhb01BHHFruApSP66yvL9RlfkBscdqusP8pF+epKIzIs34cnCIRKq72Rby3BxAoUnIVOYTD0nyMkJF2seZxdlqkmoOUCTGjCs2CcV8y1vcvFGdzBpPtjrA51ICpsw75CTlbQKIjj1skb40Xce/jSftKnHMvB/o/TktxfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718158732; c=relaxed/simple;
	bh=2gaQYTlguDDwN4sitnCXfPezlN4Bdl/D19D4f/B3npE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gg2dVp60mbIKhYXk8gXerE5DCo9ghwRQlsWmR1rAWKDLRKLN8hRJy1RqGeJHvF0L6Qgtmx1ZRa2eUM6bjK7EiJ6OeLpZPu7rfcjVyxNwmoGXWzmwar7gEDv9fa+p+eEZKX0L2/wRdoYE2v5X1P5w0XuQ+pDr3OJkob46LnCVkaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NNg8hq08; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 18127fb2286211efa54bbfbb386b949c-20240612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=j/wXqkzzy2SlwKd6heFLfKMstvbXUScnINPuxHJrhxw=;
	b=NNg8hq08lyJpSm/OrxOJ9KetkSIbVC164uyVNl6Ek/5K+MkPRvwZr9W3T+P2f+CRvwgf/UGgQMBaxkxgxXQ+Iuy9uDDIU2NabiiW3gSXTGZmme/jcECzHUlcfNotKRuq4nRIrwMgcqB+cM+eOwGwNdyXC28X4C6b6T5Ty/1GDCI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:b9b60ef8-eabb-427e-96b8-ad3ab1e9483e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:ec487744-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 18127fb2286211efa54bbfbb386b949c-20240612
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 893022605; Wed, 12 Jun 2024 10:18:44 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Jun 2024 19:18:43 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 12 Jun 2024 10:18:42 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: <mchehab@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <sakari.ailus@linux.intel.com>
CC: <laurent.pinchart@ideasonboard.com>, <shengnan.wang@mediatek.com>,
	<yaya.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yunkec@chromium.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jacopo.mondi@ideasonboard.com>,
	<zhi.mao@mediatek.com>, <10572168@qq.com>, <hverkuil-cisco@xs4all.nl>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <macromorgan@hotmail.com>,
	<linus.walleij@linaro.org>, <hdegoede@redhat.com>,
	<tomi.valkeinen@ideasonboard.com>, <gerald.loacker@wolfvision.net>,
	<andy.shevchenko@gmail.com>, <bingbu.cao@intel.com>,
	<dan.scally@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v9 3/3] MAINTAINERS: Add entry for GC08A3 image sensor
Date: Wed, 12 Jun 2024 10:18:00 +0800
Message-ID: <20240612021800.19512-4-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240612021800.19512-1-zhi.mao@mediatek.com>
References: <20240612021800.19512-1-zhi.mao@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add maintainer entry for GC08A3 image sensor

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 670b8201973b..4d4c23bb19c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9123,6 +9123,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
 F:	drivers/media/i2c/gc0308.c
 
+GALAXYCORE GC08A3 CAMERA SENSOR DRIVER
+M:	Zhi Mao <zhi.mao@mediatek.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
+F:	drivers/media/i2c/gc08a3.c
+
 GALAXYCORE GC2145 SENSOR DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	linux-media@vger.kernel.org
-- 
2.25.1


