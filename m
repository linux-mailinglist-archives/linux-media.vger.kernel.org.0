Return-Path: <linux-media+bounces-21467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 848449CFC76
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 04:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42E28284F21
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 03:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0562190696;
	Sat, 16 Nov 2024 03:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YSYVq0FP"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCF9632;
	Sat, 16 Nov 2024 03:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731726992; cv=none; b=IgkUiqBCNCiwtUkNu3oE3HPnk2gzXM/5+/v+tY9u61z1d29z4Rax35jF8K6x8PXSGg3gqq8zZZhlIdozP7HcT4EliAkVSQTNS7uRiy63KDP/tF/31Mb0/eyGlQd7QnXpOcj11Kj4xfcrAxxHzco/7NOgl3dl6HdBJIw5vF+rjnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731726992; c=relaxed/simple;
	bh=hOxXksgjwvpAF45MYWF5ld9gw3VzqXvpn6U6tZTPFFE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BbpgJgOeEPPLU+5AQymslyQPeeWE4T9bygYL5RsZguw44woo7lfT5oS8maxg7RKvS5TdMjskSufqEU0haTYPEqazXqaBf5SwsA6BwEFQvmNKBYZhVBudZidDMR12CpoPywH4wxdIZa5eBKE5CKWRkdgxG0d8j59iiDI8zTGdZH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YSYVq0FP; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2632b6e2a3c911ef99858b75a2457dd9-20241116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jyE1TmMPT0e6QcpIdQiLG7N3lYLomH/9k2iReYPekIE=;
	b=YSYVq0FP8+iJZsp+zxJLadZ9nkS4vHd0e06eZ30oYTQhSQFNk2fRVgMI6bcc5AapXCgxQY2ZOVNQZX473rcJ8DsqRmZ7t1znGlpz+zhRzInXXN0I0YYEnL8C2+rvXsLp1i0VUMbAxT5HWP5AAVFYVzHTRSHMl4gDm/5bYL0laEc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43,REQID:b0519973-355f-4b1d-8333-a85d5ca32243,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ce19b8a,CLOUDID:78162a07-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2632b6e2a3c911ef99858b75a2457dd9-20241116
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1517512920; Sat, 16 Nov 2024 11:16:19 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 16 Nov 2024 11:16:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 16 Nov 2024 11:16:17 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 0/3] media: mediatek: vcodec: support h264 extend vsi
Date: Sat, 16 Nov 2024 11:16:09 +0800
Message-ID: <20241116031616.15656-1-yunfei.dong@mediatek.com>
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
compared with v5:
- add some parameters comment for patch 2

compared with v4:
- rebase this patch series with latest vcodec driver

compared with v3:
- change code logic with callback to decode for patch 2

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
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 593 ++++++++++++++++--
 2 files changed, 528 insertions(+), 67 deletions(-)

-- 
2.46.0


