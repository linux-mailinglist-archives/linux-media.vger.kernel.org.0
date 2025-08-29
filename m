Return-Path: <linux-media+bounces-41322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AF0B3B6EC
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 11:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C38121C28219
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 09:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846382FE067;
	Fri, 29 Aug 2025 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sYlbdGoo"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728791684AC;
	Fri, 29 Aug 2025 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459059; cv=none; b=bGFlSeccfkpbjdGRiDm1bYuvv1ERjFetZ7pW9u7wYkEsgSpzjMwURNLFo2vFNTq6tqTTXReR9K/4XWMVBxl40shZlEIQ+xB/TR6ibmL6N34JBzPI32P6o2bicHqyOj5ueTPG6t/HTA9Q867rbcQJE+sUVGviQHB+6n6m2Css0Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459059; c=relaxed/simple;
	bh=0zFOfOS8VWz0Uwdb54X+dKeXTwOIGoQsTzZ4La6KrUA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ionkCSUrdbuzpfSE46t1OsrAsm/Twwte7bZFL18XPZeh56kltxAl+bEdVilGL4XmIaUXDfQCA5IvHYVkDRkhHJNAIN6bKjJbJqG4mM08mIHyajAXMWqmdd1oPzzz42n6u0Z975+JsO+AKu1mvhV8FFWpqwpwDDylh/zp7P+P0xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=sYlbdGoo; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: fcb22d5884b811f0bd5779446731db89-20250829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=336PQw3uXU0Znvz55zA6oLPN4hF7V2cSCNRDMtsX4HE=;
	b=sYlbdGooXVEnJzNKjh5LXZjQUkeWJNSTFxfHzje2cwgR8vwblCj8hlKReDqtM0CCIttIeqSNbzUsg7B9aUfaX7zyT7fluccozABLU8wCekZ/t9dKk9IeU+AD0AX1dgtcQdxdemzneyFxjeWchc++md6pLADtWT5aaAZoV0qwuZo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:5eba1d9f-8b72-4f08-af5a-ecfbb7617157,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:8737fe6b-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fcb22d5884b811f0bd5779446731db89-20250829
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1952749229; Fri, 29 Aug 2025 17:17:29 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 29 Aug 2025 17:17:27 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 29 Aug 2025 17:17:27 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jassi Brar
	<jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	Paul-PL Chen <paul-pl.chen@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, Zhenxing Qin <zhenxing.qin@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>, Jarried
 Lin <jarried.lin@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH v2 0/3] Fix sleeping function called from invalid context
Date: Fri, 29 Aug 2025 17:15:57 +0800
Message-ID: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

We found that there is a spin_lock_irqsave protection in msg_submit()
of mailbox.c and it is in the atomic context.
So when the mailbox controller driver calls pm_runtime_get_sync() in
mbox_chan_ops->send_data(), it will get this BUG report.
"BUG: sleeping function called from invalid context at drivers/base/power/runtime.c:1164"

Additionally, pm_runtime_put_autosuspend() should be invoked from the
GCE IRQ handler to ensure the hardware has actually completed its work.

To resolve these issues, remove the pm_runtime calls from
cmdq_mbox_send_data() and delegate power management responsibilities
to the client driver.
---
Changes in v2:
- Move pm_runtmie APIs from cmdq driver to client drivers.
- Move pm_runtime_put_autosuspend to GCE irq callback function.
- Link to v1: https://lore.kernel.org/r/20240614040133.24967-1-jason-jh.lin@mediatek.com
---
Jason-JH Lin (3):
  mailbox: mtk-cmdq: Remove pm_runtime APIs from cmdq_mbox_send_data()
  drm/mediatek: Add pm_runtime support for GCE power control
  media: platform: mtk-mdp3: Add pm_runtime support for GCE power
    control

 drivers/gpu/drm/mediatek/mtk_crtc.c                  |  7 +++++++
 drivers/mailbox/mtk-cmdq-mailbox.c                   | 12 +-----------
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 11 +++++++++++
 3 files changed, 19 insertions(+), 11 deletions(-)

-- 
2.43.0


