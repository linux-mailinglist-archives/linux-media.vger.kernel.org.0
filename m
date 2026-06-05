Return-Path: <linux-media+bounces-63888-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3wKHO7WYImrJagEAu9opvQ
	(envelope-from <linux-media+bounces-63888-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 11:36:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69665646E94
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 11:36:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=BkTGdhpy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63888-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63888-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEF0F3023A41
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 09:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE42F3BF699;
	Fri,  5 Jun 2026 09:35:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E0D3A4F5E;
	Fri,  5 Jun 2026 09:35:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780652143; cv=none; b=GN16CArCwk5qJrA4U07p7EIu8T9W2BmyPmZvSHdAIhiQwTOTwB77OjU2+h0A/72Zabuyqv0jCbOE4X3/QCosQ5XLxYXjV5VaW3t8Lkp3PCFM31vLTlCgbI62CYEprS3XoIb/PSVqZ8OAqj4BEkVqf50+By2GIIkpcvRPhVz2mjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780652143; c=relaxed/simple;
	bh=nO09VhZg7HLB11lLMiUr6sh+81v/cPYvsSsc/nNizx8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U8iQ3Ep7seVBIqn0FnB5tjkmJr3ApMqtuYkcmJ9CKRZLRQ8gHydJYZMv3qCpfbrOjO0ezUUgNZdrh8q7xiwrH6fMRhiIbIA/klz8v1vFVqwNfzQg+o76p26RA+pqBM8IO/HkPnFR9uypUIktsb/lPHYTvbbeTnAKXta50IDP4xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BkTGdhpy; arc=none smtp.client-ip=210.61.82.184
X-UUID: e6cfdb4e60c111f18dc8c9802ae25ab1-20260605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7S10PuVpqSDCEbfsieH240FkICWT3yr53mF/yHr2S3k=;
	b=BkTGdhpyqilCXrnM71WJwy3Z25j2gfW1yyCx/E2VvtCQ/ivEY6+XM5RNB++E+U0dB4eLV9UTZFKQ2Up6KIBydzNUGF3FerhKFMKSQ05MxONiVv7CCb+lGPu3k3RHoRwmLZ8FG3y4e8CbZhE1C26H7drlbVDFZh8zd9ugkZVDCfc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:c4b450b7-8871-4e83-86c5-c032e7d7d4c9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:8daa8503-5b7c-4de7-bc39-cc187eea3c57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|136|836|865|888|898,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e6cfdb4e60c111f18dc8c9802ae25ab1-20260605
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 825854466; Fri, 05 Jun 2026 17:35:34 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Jun 2026 17:35:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 5 Jun 2026 17:35:31 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v7 0/6] Add support for MT8196 video encoder
Date: Fri, 5 Jun 2026 17:35:12 +0800
Message-ID: <20260605093519.13695-1-irui.wang@mediatek.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63888-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil-cisco@xs4all.nl,m:mchehab@kernel.org,m:robh+dt@kernel.org,m:matthias.bgg@gmail.com,m:krzk+dt@kernel.org,m:angelogioacchino.delregno@collabora.com,m:nicolas.dufresne@collabora.com,m:tiffany.lin@mediatek.com,m:kyrie.wu@mediatek.com,m:yunfei.dong@mediatek.com,m:maoguang.meng@mediatek.com,m:longfei.wang@mediatek.com,m:irui.wang@mediatek.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:robh@kernel.org,m:matthiasbgg@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,gmail.com,collabora.com,mediatek.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:mid,mediatek.com:from_mime,mediatek.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69665646E94

This patch series add support for MT8196 video encoder.
patch 1: Add dt-bindings.
patch 2: Add new encoder driver platform data.
patch 3~5: Add a new encoder driver interface for new VCP firmware.
patch 6: Add compatible data.

About adding new driver support, the v4l2-compliance report shows:
"Total for mtk-vcodec-enc device /dev/video3: 47, Succeeded: 46, Failed: 1, Warnings: 0"
The 1 Failed case is not caused by current patch set:
                fail: v4l2-test-controls.cpp(1171): node->codec_mask & STATEFUL_ENCODER
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

This patch set depends on "media: mediatek: vcodec: support video decoder in mt8196"[1]

[1] https://patchwork.linuxtv.org/project/linux-media/list/?series=25981

Change in v7:
 - patch 2: New pdata members for remove if-else device tree parsing statement.
 - Rebase patch onto decoder's patch set.
 - Link to v6: https://patchwork.linuxtv.org/project/linux-media/cover/20260423073345.27402-1-irui.wang@mediatek.com/

Change in v6:
 - Move dt-bindings to patch 1.
 - Rebase patch onto decoder's patch set.
 - Link to v5: https://patchwork.linuxtv.org/project/linux-media/cover/20260302035244.8994-1-irui.wang@mediatek.com/

Change in v5:
 - Rewrite patch5 commit subject.
 - Add else statement in patch5.
 - Link to v4: https://patchwork.linuxtv.org/project/linux-media/list/?series=21757

Change in v4:
 - Rework patch3 commit message.
 - Rework patch5 commit with more details.
 - Rebase patch onto decoder's patch set.
 - Link to v3: https://patchwork.linuxtv.org/project/linux-media/cover/20250814085642.17343-1-kyrie.wu@mediatek.com/

Change in v3:
 - Add venc rc buffer alloc failure error handling.
 - Add mediatek,vcp property definition in dt-bindning.

Change in v2:
 - Add support for VCP encode process.
 - Add MT8196 encoder driver platform data.
 - Rebase encoder patch onto decoder's patch set.
 - Fix some review comments in v1.

Irui Wang (6):
  media: dt-bindings: mediatek,vcodec-encoder: Add MT8196
  media: mediatek: encoder: Add new platform data members
  media: mediatek: encoder: Add a new encoder driver interface
  media: mediatek: encoder: Add support for common firmware interface
  media: mediatek: encoder: Add support for VCP encode process
  media: mediatek: encoder: Add MT8196 encoder compatible data

 .../media/mediatek,vcodec-encoder.yaml        |  22 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |   9 +-
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   1 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |   1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         |   6 +
 .../platform/mediatek/vcodec/encoder/Makefile |   1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  36 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  62 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  23 +-
 .../vcodec/encoder/venc/venc_common_if.c      | 684 ++++++++++++++++++
 .../vcodec/encoder/venc/venc_h264_if.c        |   8 +-
 .../mediatek/vcodec/encoder/venc_drv_if.c     |   3 +-
 .../mediatek/vcodec/encoder/venc_drv_if.h     |  11 +-
 .../mediatek/vcodec/encoder/venc_ipi_msg.h    |  26 +
 .../mediatek/vcodec/encoder/venc_vpu_if.c     |  47 +-
 15 files changed, 869 insertions(+), 71 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c

-- 
2.45.2


