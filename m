Return-Path: <linux-media+bounces-21029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FE99BFF4F
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 08:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32E69B21EA6
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 07:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCA61D3644;
	Thu,  7 Nov 2024 07:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BUp1Dtqw"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF791991D2;
	Thu,  7 Nov 2024 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730965579; cv=none; b=otJSA3zm4Xd7OfpuO2dwoXi+ipUi0oJRgvCCUfWVTsII7c+4I4Cxw3hw1iIFUkdDYONbmc3d5cK6CsBSJg0RZZLXrvC1WwlBRiDCvcV5R2da9QU6caSsrSxxZ5rviNWZupiaifE/kRgISgYX+CwJHIylBL2UxgacXKmhtEk/BA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730965579; c=relaxed/simple;
	bh=r50PAbrNC7wiocLxfAaxrCGdGN3/UU1zQE/uBx5VX6k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PWqSlXtp5PCMwwcTIM9ImsbbElFWcET5aKrVfDDzkzle0ygmP8xlsMYTJRUa5MaCBvbObHELAk+eHvqBlaAx3ACfaFw473x/IdvThl9CPlbe5TWeSRuHbTqY3jesInjdg4xzA0xzdje6AJbIVQKzuCjY3miUrjiPt514lR0uHJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BUp1Dtqw; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 583813e29cdc11efb88477ffae1fc7a5-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SLobudUPRJu3yO+WgY5nbSK+JQEjFbZ/4gXbodXRIpU=;
	b=BUp1DtqwDQpT8ca2Q0oG+7n/29tpLZQ+53q/PkwqX1f1H8v/9GjC0vvnmFZblCsyIQQIIZXKRndIp8TqczwKONl8pW1PBJEtbkbSMYeJi9g+tXazsvTrkCgvYGNUhf8K5LN1AXY3kZxZ/R0d1QO9h8rp0Z19WC6ebY4vhPZzXmQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:bf9cdc94-4533-40b7-8c0c-90c7e6e94248,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:c78bb206-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 583813e29cdc11efb88477ffae1fc7a5-20241107
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1628322629; Thu, 07 Nov 2024 15:46:05 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Nov 2024 15:46:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Nov 2024 15:46:03 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve
 Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 0/6] media: mediatek: vcodec: support h264 extend vsi
Date: Thu, 7 Nov 2024 15:45:54 +0800
Message-ID: <20241107074603.31998-1-yunfei.dong@mediatek.com>
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

The working buffer address start and end are calculated in kernel
side currently, the address end can't be calculated if the driver
only getting the address file handle, not the real physical address.
Need to send the extended vsi to firmware to calculate the address
end.

Re-construct some interface and add configuration to support extend
and non extend driver at the same time. Needn't to parse nal info for
extended architecture.
---
This patch series depends on:
[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20241012064333.27269-1-yunfei.dong@mediatek.com

---
compared with v2:
- squash patch 2/3/4 together
- re-write commit message for patch 1

compared with v1:
- combine some pathes together for patch 2
- re-write patch 4
---
Yunfei Dong (3):
  media: mediatek: vcodec: remove vsi operation in common interface
  media: mediatek: vcodec: support extended h264 decode
  media: mediatek: vcodec: add description for vsi struct

 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 505 +++++++++++++++++-
 2 files changed, 482 insertions(+), 25 deletions(-)

-- 
2.46.0


