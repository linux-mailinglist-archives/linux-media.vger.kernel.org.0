Return-Path: <linux-media+bounces-26532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C3A3EB14
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 04:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B16A19C5AAE
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 03:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19FF1D7E42;
	Fri, 21 Feb 2025 03:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="S7sTtJ7r"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1DC23A6;
	Fri, 21 Feb 2025 03:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740107426; cv=none; b=u0IKnNLX4FDxggg81U5Hk+JQifn80ztQY/PWSLAPPJ+ZG0irNWIxk23CAUnSoL1/HEWQH0WOMDgHy28emuZSmhOCseDUXiWCVzuo3Su8REgJJMWjEQ1UWRlbUW4pf5loEobXT68fzaP6jq1Lhx8OQntl6ZNvalHCtPyEHvhoBH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740107426; c=relaxed/simple;
	bh=PYPNKspVV6VM+zXQHdw9hvhwh5+E2yUJVrrNGwcaziQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g4EXkM3uesutZRH65qmWO+KjR/7uqk7WDfy5nCHesW1B1VXj33Oulz2fknEtde9tlzEJpMgsIqKQwq1q3ic6kMdOkCUwv/gHYE0XrlExuQVQh+1Rg68+0l0F/CJ5N5tw1gWbjJBZsiQFJqv2jl9LGsfEv94raodDiIL0K6cbs7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=S7sTtJ7r; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 6165ddf0f00111ef8eb9c36241bbb6fb-20250221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=eTvhGN67CDGMIMBF1P9Jd8dvnolQ2SQJqyOz+NNLKsg=;
	b=S7sTtJ7rf+1E3BB+yyyQAr/BkNCrwLzU40ln5lNpts7+NoQU3UNP5ItUFfN55IcWO+CD/qFURNbnVRcipHLNf4mOEsGyw9chQDLjVkG7SqCp+T+pvOsTw9Xt1bzIuNGosjlXfRhX/uE64WUFJww5ahaDkFKeBHJ6BqDg0jsWv5I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:1762eb5e-c289-46d2-b0cb-10704105955a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:a59d1229-e0f8-414e-b8c3-b75c08217be8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6165ddf0f00111ef8eb9c36241bbb6fb-20250221
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 90525754; Fri, 21 Feb 2025 11:10:19 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 21 Feb 2025 11:10:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 21 Feb 2025 11:10:17 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Longfei Wang <longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH 0/2] Add support for MT8196 video encoder
Date: Fri, 21 Feb 2025 11:10:02 +0800
Message-ID: <20250221031004.9050-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This patch series adds support for MT8196 video encoder. The changes
include introducing a new encoder driver interface and add support for the
new encoder driver encoding process.

Irui Wang (2):
  media: mediatek: encoder: Add a new encoder driver interface
  media: mediatek: encoder: Add support for common driver encode process

 .../platform/mediatek/vcodec/encoder/Makefile |   1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   2 +
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |   3 +
 .../vcodec/encoder/venc/venc_common_if.c      | 704 ++++++++++++++++++
 .../mediatek/vcodec/encoder/venc_drv_if.c     |   3 +-
 .../mediatek/vcodec/encoder/venc_drv_if.h     |   3 +
 .../mediatek/vcodec/encoder/venc_ipi_msg.h    |  26 +
 .../mediatek/vcodec/encoder/venc_vpu_if.c     |  37 +-
 8 files changed, 764 insertions(+), 15 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c

-- 
2.46.0


