Return-Path: <linux-media+bounces-12945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2E5903A67
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 13:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9495E2823D5
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 11:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F6017E8FF;
	Tue, 11 Jun 2024 11:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="K+Zj4GOg"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6D617C7AC;
	Tue, 11 Jun 2024 11:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105623; cv=none; b=cN8n8/6TT7K4APGFlYuATLrTGC0xzoNad1EABf/c3M7GYqVdr1ZcPA1nVXjDk3dfoinmXD2zADGxGLLDGd1vI4DGYtXm+v946JocoENK5Fw251IpikBKWUbZIx8adtOtATws/mf0/sj7AyMiuHAasNEyhkLxmceJs5bOUxPGRiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105623; c=relaxed/simple;
	bh=D6h8suar11xPB0FrH/F05ttsqUU+G73L2TAnTHfQmJA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yc/AXf9uIqA167569oiMRZlh5yGQkBsOd71WLJ4/qBhZoNtTv1R/X//yo1MqgNFLfwONb6DSQQpVO6Ndk6SOtfN/rTLnIztBh4i9kvJSzlw/o8Q7Qv5GUMFSxaLibIUaUVHwENtnRxnW8FaarDB/Kah7TzkTnZ8vWK8b0lpmgSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=K+Zj4GOg; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 710a1df427e611efa22eafcdcd04c131-20240611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=odidsYKFNVPwoPZeuKLhmMjo6dD/t+Ya5VuaW/USSyw=;
	b=K+Zj4GOgVQLKpM6/pYq5y53N/HdmAVVb5pu+ktRJsKfwpLL9LEwiptarObuurdY7Bsq264iX0/j8X3CsddiuN1dHbCOtZDKr/bNQgZEJiv+keYMUVDgVTSA1uFDtJG8IkFUPgxBn72/A6CxD4+pdkCic1MwWOSGmSl6f1j+Bs5Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:98728c98-22b3-4ec0-a5e4-311dfa595e6b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:9fb17144-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 710a1df427e611efa22eafcdcd04c131-20240611
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1607741829; Tue, 11 Jun 2024 19:33:36 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Jun 2024 19:33:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 11 Jun 2024 19:33:33 +0800
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
Subject: [PATCH v6 3/3] MAINTAINERS: Add entry for GC05A2 image sensor
Date: Tue, 11 Jun 2024 19:32:36 +0800
Message-ID: <20240611113236.16513-4-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611113236.16513-1-zhi.mao@mediatek.com>
References: <20240611113236.16513-1-zhi.mao@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.764800-8.000000
X-TMASE-MatchedRID: tiRXYRqWr+sdj9vNGYhpkXQEQEU5OIefuLwbhNl9B5VGL0g1nVmkYRjS
	B882BUr04vM1YF6AJbZhyT3WNjppUtAtbEEX0MxBxEHRux+uk8hxKpvEGAbTDnaEDltNXAnsGXk
	LrB+QCm7jnpH1O45dt9GxjIkiEK4ZwKlgfBAw2Q0vVyYD5nMvFacRpB3EvrqB4YNztYRtwhMsSl
	KSeKhiLBz+PhojlLUuev0YPTN868QBqq+/+aGCsUu0bcffALXE
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.764800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 972F0991760AB7426964D2043339D7C12B4EC9A237A18656E5AA894AA95034802000:8
X-MTK: N

Add maintain entry for GC05A2 image sensor

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 670b8201973b..81fb1dedb1bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9123,6 +9123,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
 F:	drivers/media/i2c/gc0308.c
 
+GALAXYCORE GC05a2 CAMERA SENSOR DRIVER
+M:	Zhi Mao <zhi.mao@mediatek.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
+F:	drivers/media/i2c/gc05a2.c
+
 GALAXYCORE GC2145 SENSOR DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	linux-media@vger.kernel.org
-- 
2.25.1


