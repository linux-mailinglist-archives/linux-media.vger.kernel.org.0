Return-Path: <linux-media+bounces-29286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDF1A79D25
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 09:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C257B3B678D
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 07:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD9D24166C;
	Thu,  3 Apr 2025 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="R/3FZngU"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A946C249E5;
	Thu,  3 Apr 2025 07:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666017; cv=none; b=aSFn8N0M3Tlw2E7wSg/E+4bKXqmu+WXphqs8QwgMSYDi7FXX4pbTyH8FKwXPn5s39hYMYMM83Esf3O3Wing02/M2FIhUkQfnYHuzDNa7hbKWoW5cg4eT0wibC2ItaFp0Mr0UshMiI37N/F4cs2uVCFZYUDjueB+hDFU91NiiASI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666017; c=relaxed/simple;
	bh=sAohYqDa44TUpoObt6M+7CegBq3d1Hs2006Ma7LYGL0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eVepv89Gz6CA0TP72mBPlgOjc+wX5cDAFoatWc0Wncanscd4UAV5SW/2vP50ji2W50Gw5XUTl3xYpgv5bKjqGuqOkCZxJoqGb0PpXDCEPgqLt8zWxvxKz/T7mBjX3tpzbXGPeN3Lv4h5KuEdeW985RZJ9qj1kpjKBfDNk6YmKF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=R/3FZngU; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: de88a308105e11f08eb9c36241bbb6fb-20250403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UR6N4JLWRXdfl/3tMoPzIXLOxGEekvwVW3c3YQImOkQ=;
	b=R/3FZngUtZ+Zw3jVY/QFWwYgEHvILLfepYDQ8wGLcZm6zJVfL6zDT9b0B8JtVRybA9eBlCN/CfB0Cljdljy+ARlcR/akZrmeqz2YhhlrqKrl2a9+pd71Ju39ePOwYzVf7/+27m0gImJlm3mPuVJj7ZVwcO4M4r6lloOzAXad+DU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a35b4290-cccb-4c8c-b319-6ded469cf89b,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:0ef645f,CLOUDID:17b6a5a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: de88a308105e11f08eb9c36241bbb6fb-20250403
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 819808472; Thu, 03 Apr 2025 15:40:09 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Apr 2025 15:40:08 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Apr 2025 15:40:07 +0800
From: bo.kong <bo.kong@mediatek.com>
To: Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, mtk29348 <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <zhaoyuan.chen@mediatek.com>, <Teddy.Chen@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 0/4] Add AIE driver support for mt8188
Date: Thu, 3 Apr 2025 15:38:32 +0800
Message-ID: <20250403074005.21472-1-bo.kong@mediatek.com>
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

AIE(AI Engine) is one of the units in mt8188 ISP which provides hardware accelerated face detection function, it can detect different sizes of faces in a raw image.

Bo Kong (4):
  media: dt-bindings: add MT8188 AIE
  arm64: dts: mt8188: add aie node
  uapi: linux: add MT8188 AIE
  media: mediatek: add MT8188 AIE driver

 .../bindings/media/mediatek,mt8188-aie.yaml   |   78 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      |   33 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/aie/Kconfig   |   12 +
 drivers/media/platform/mediatek/aie/Makefile  |    5 +
 drivers/media/platform/mediatek/aie/mtk_aie.h |  870 ++++++
 .../media/platform/mediatek/aie/mtk_aie_drv.c | 2398 +++++++++++++++++
 .../platform/mediatek/aie/mtk_aie_v4l2.c      | 1295 +++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    3 +
 include/uapi/linux/mtk_aie_v4l2_controls.h    |  308 +++
 include/uapi/linux/videodev2.h                |    6 +
 12 files changed, 5010 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
 create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
 create mode 100644 drivers/media/platform/mediatek/aie/Makefile
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_v4l2.c
 create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

-- 
2.45.2


