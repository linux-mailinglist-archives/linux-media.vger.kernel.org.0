Return-Path: <linux-media+bounces-12976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83398904850
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 03:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 988CA1C22EFE
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 01:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C354696;
	Wed, 12 Jun 2024 01:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iSb0nmpb"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EA7391;
	Wed, 12 Jun 2024 01:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718155294; cv=none; b=jjEiYnVO5U9hMhl2jzIL4cRbIjuQju6ZNAKMA5l1O46jw0sNX4StYhti/cz2RL3uAg0dzqM/pHtLMjED/f0ug9EAXEf5CWESz/UqsR4YSOlhDxz/ge8dk2MB04z+g6Pt5hOL7l6mTJRPdNH400Kg539Zth7DlU18IMwybLI2d74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718155294; c=relaxed/simple;
	bh=QGO5DNB1ktBaq18MrT3YSf2fdBgNWF96qt+lNFGXEjs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZDiXeQONM0ombjl5oDh4TU9okRbPogBOUD+/OI46uxHki9yTWqwsIZ8DtildmTWP6dZNHlKnT7MN6RceXZVJFl7QwR194KKbe73qUQRwDWyuYA3Occ8eN62p+lUThtvNeLBH6tfGjtWeaO2S9y5hDhc/Cxi362KbQosCaG0jsJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iSb0nmpb; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 16d67b2e285a11efa22eafcdcd04c131-20240612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GoDbejxUQ5CH3/w/X+WKXRuM50NCUjo+XMdENx3Q9sc=;
	b=iSb0nmpbzwz+qwAH2d9XJwIcH3JbYsdkwv77GMJft1Br5dpug4R4lKiZMAOSI8FB9LcrUnSAKvCNgZmA/lpyMBeXQJ6dCkff59JvsDX/hOg/+q/8pV9gogXMxMVCWOtWgmCjjsf8dYsf9KNtqtGUhtP8i2O1i7OS5tBHe1jU+Vw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:ef24ff04-c1ce-4d88-b794-01e9fe46a064,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:f6157988-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 16d67b2e285a11efa22eafcdcd04c131-20240612
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 560014558; Wed, 12 Jun 2024 09:21:26 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 12 Jun 2024 09:21:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 12 Jun 2024 09:21:22 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Zhi Mao <zhi.mao@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Heiko Stuebner
	<heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, "Mehdi
 Djait" <mehdi.djait@bootlin.com>, Andy Shevchenko
	<andy.shevchenko@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <shengnan.wang@mediatek.com>,
	<yaya.chang@mediatek.com>, <yunkec@chromium.org>, <10572168@qq.com>
Subject: [PATCH v3 3/3] MAINTAINERS: Add entry for GT97xx VCM driver
Date: Wed, 12 Jun 2024 09:20:19 +0800
Message-ID: <20240612012019.19078-4-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240612012019.19078-1-zhi.mao@mediatek.com>
References: <20240612012019.19078-1-zhi.mao@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.740300-8.000000
X-TMASE-MatchedRID: GIpmbigRs3Y9S3IiQd+eNQPZZctd3P4BFuNF4lJG6xtGL0g1nVmkYTcG
	i0cOVVasRcK0DrBkisuAMuqetGVetksDkkP3zIjqavP8b9lJtWr6C0ePs7A07fH8XRQwShO7Ayk
	Qe1sIa0XYNwoFzR6TfCnyQECDq3YS+cAQf7nhiHEBxwmF6nT2v0FNSQkI9yjefYyfbAjKfD6cXr
	SpsbyZea6edyNz+tV1oydMlEjRcid9fBQSbWi4PMsNjEULX/uufoZ02Tg1aYA=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.740300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	BBF44A3C6038B97E8327B33B45543D43F4733C587BBDE6740BD7819DB45B6D542000:8
X-MTK: N

Add maintainer entry for GT97xx VCM driver

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 670b8201973b..d12694c743ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9328,6 +9328,13 @@ F:	Documentation/filesystems/gfs2*
 F:	fs/gfs2/
 F:	include/uapi/linux/gfs2_ondisk.h
 
+GIANTEC GT9769 LENS VOICE COIL DRIVER
+M:	Zhi Mao <zhi.mao@mediatek.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
+F:	drivers/media/i2c/gt97xx.c
+
 GIGABYTE WATERFORCE SENSOR DRIVER
 M:	Aleksa Savic <savicaleksa83@gmail.com>
 L:	linux-hwmon@vger.kernel.org
@@ -23590,6 +23597,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/ak*
 F:	drivers/media/i2c/dw*
+F:	drivers/media/i2c/gt*
 F:	drivers/media/i2c/lm*
 
 V4L2 CAMERA SENSOR DRIVERS
-- 
2.25.1


