Return-Path: <linux-media+bounces-25827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC97A2D45A
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 08:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A04E61668CD
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 07:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2151AF0A4;
	Sat,  8 Feb 2025 07:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BGp24uGd"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF2014F9E2;
	Sat,  8 Feb 2025 07:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738998406; cv=none; b=LbdFODL+vM46rlXOFx6PgYQ2jA2Sv2lC4/EV4DsMD4/67zIEOb/HungfEQV2u73RbHzZbOE/3qbGXQ4IEu7r5w4OvNz+Q68nLCAQlqXYIBT56/3kOCOdTfEM5HV+Xrp3ljzjLS0ExrineZDS74rXiONIa7dmpYXLTDGVD1wn1vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738998406; c=relaxed/simple;
	bh=8oKx3ZisAmsV5U7yAeHvNNtKTx6gKpCOuBCE2WJwUOc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pJKV7cfujwXaw7B/uyVaGr1QgSpC/fh14QdzTQbkkjk6GuzNUoc0QptbwPcsQAPQW3PJLxAO9kKcn/ZUDUS9meTx7CU8/PZtEgQ13bRaANvHAnBwS7U4uuuLyIQ6PPNGMbwSm4L5seCbwBowthKMo/M1JmsBLBbp6VDMkJDo8gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BGp24uGd; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3ccaa450e5eb11efbd192953cf12861f-20250208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Vrn/T+bP6v+jye0RhHmeyFpoaCMmJ+ry5M5tfkDObHg=;
	b=BGp24uGdVc1w2v2DcUEEfheMSfFx7KLndw/kzoPK2ZyE1vim+M/D+84X1R8Eio5ohn13572dVu8QUQwywJYtfakopXhO0s1phA074EA0OXP0nkuYMiw3rn/vpYFSlmp6zAQtc8g3CfxV5ubNN2yDuJ/5sUQnwT8HswQFlz3Dcyw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:4dec5517-8494-4630-8627-c7b05c7d9d57,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:fbf056ff-c190-4cfe-938d-595d7f10e0dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3ccaa450e5eb11efbd192953cf12861f-20250208
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 458027228; Sat, 08 Feb 2025 15:06:37 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 8 Feb 2025 15:06:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 8 Feb 2025 15:06:34 +0800
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
Subject: [PATCH v7 0/3] media: mediatek: vcodec: support h264 extend vsi
Date: Sat, 8 Feb 2025 15:06:22 +0800
Message-ID: <20250208070633.30862-1-yunfei.dong@mediatek.com>
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
compared with v6:
- fix the coding style for patch 2
- rewrite commit message for patch 2/3

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
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 648 +++++++++++++++---
 2 files changed, 558 insertions(+), 92 deletions(-)

-- 
2.46.0


