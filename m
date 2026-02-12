Return-Path: <linux-media+bounces-52640-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMxRNAOljWlh5gAAu9opvQ
	(envelope-from <linux-media+bounces-52640-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 11:01:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6828F12C26A
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 11:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D84E301BD91
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 10:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6402E5D17;
	Thu, 12 Feb 2026 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rLcp3mfE"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E5299928;
	Thu, 12 Feb 2026 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890480; cv=none; b=pRGo2ktR34eBlPx0V0qAzvcZMR9AgaC8v85ho3Oj5oV8CVfkP/vExS4xYTIXIZWvxXWUf//OqylRJfmR+9+wKTIMpOdd6vaeUrvWXAX9bFig4pYLMMP/qpx5ZXbvlvl1/tDyKyy378QZxVPpHEWeyM32vtLcRMx+c/GasFNBSXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890480; c=relaxed/simple;
	bh=mqNeCeSmkhIW40z4iEp4CJlfKDpVFlFRa++WISlJQtI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UNApT8BhQTE6NttyS+RdFnjJenPl/QQh2QmHvatSG9iRYBOv7ASDr0VvGJlskGFaYqwqXBzRyEci0NafyWTKWmPH8NS1dXseZJ5w04xobuEzYuHmRGtoWOo8xV3B1SV8lwF7Db4PnzlOyZwiSTTGeOdvlfjiEly+eyHLqP+wul0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=rLcp3mfE; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c3aa211807f911f185319dbc3099e8fb-20260212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=51uReRVE1SRGwH7Hqmx0C40LHPiimOtzbA/5oaXIx1Q=;
	b=rLcp3mfExWFrmxaa79qe7in9E7q31wyLLSC/wf1Zzefby6DYVejkkZemDyfmWx+HQe6byWUY90+JBIjNbR6jrFkYSCrq/tUGo2VcB/wmZP9SIfo2VPvI0ew01ySiFwkoVKS8KPCv8dWRMa3kSPpqIY6TaKNnGba4wWLuvH5p63M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:cca7fc56-6f8f-4125-835b-ca74ef3d2316,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:ab25395b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:2,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c3aa211807f911f185319dbc3099e8fb-20260212
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1445343720; Thu, 12 Feb 2026 18:01:13 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Feb 2026 18:01:12 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Feb 2026 18:01:11 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <sebastian.fricke@collabora.com>, Tiffany
 Lin <tiffany.lin@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 0/6] Add support for MT8196 video encoder
Date: Thu, 12 Feb 2026 18:00:57 +0800
Message-ID: <20260212100104.11863-1-irui.wang@mediatek.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,gmail.com,chromium.org,collabora.com,mediatek.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52640-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mediatek.com:mid,mediatek.com:dkim,linuxtv.org:url]
X-Rspamd-Queue-Id: 6828F12C26A
X-Rspamd-Action: no action

This patch series add support for MT8196 video encoder.
patch 1~3: Add a new encoder driver interface for new VCP firmware.
patch 4~6: Add MT8196 encoder driver platform data.

About adding new driver support, the v4l2-compliance report shows:
"Total for mtk-vcodec-enc device /dev/video3: 47, Succeeded: 46, Failed: 1, Warnings: 0"
The 1 Failed case is not caused by current patch set:
                fail: v4l2-test-controls.cpp(1171): node->codec_mask & STATEFUL_ENCODER
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

This patch set depends on "media: mediatek: vcodec: support video decoder in mt8196"[1]

[1] https://patchwork.linuxtv.org/project/linux-media/list/?series=21718

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
  media: mediatek: encoder: Add a new encoder driver interface
  media: mediatek: encoder: Add support for common firmware interface
  media: mediatek: encoder: Add support for VCP encode process
  media: mediatek: encoder: Add a new platform data member
  dt-bindings: media: mediatek,vcodec-encoder: Add MT8196 with VCP
    support
  media: mediatek: encoder: Add MT8196 encoder compatible data

 .../media/mediatek,vcodec-encoder.yaml        |  19 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  19 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   2 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |   1 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         |   6 +
 .../platform/mediatek/vcodec/encoder/Makefile |   1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  36 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  28 +
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  15 +-
 .../vcodec/encoder/venc/venc_common_if.c      | 683 ++++++++++++++++++
 .../vcodec/encoder/venc/venc_h264_if.c        |   8 +-
 .../mediatek/vcodec/encoder/venc_drv_if.c     |   3 +-
 .../mediatek/vcodec/encoder/venc_drv_if.h     |  11 +-
 .../mediatek/vcodec/encoder/venc_ipi_msg.h    |  26 +
 .../mediatek/vcodec/encoder/venc_vpu_if.c     |  47 +-
 15 files changed, 853 insertions(+), 52 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c

-- 
2.45.2


