Return-Path: <linux-media+bounces-56824-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFDID3xNwmnvbAQAu9opvQ
	(envelope-from <linux-media+bounces-56824-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:38:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BAB304C6D
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5E2C31E0191
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E313B961F;
	Tue, 24 Mar 2026 08:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YZehMhlI"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85761386568;
	Tue, 24 Mar 2026 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340514; cv=none; b=eQTBPpH/iF7fIHWjyUrF75zZI+wvC4oRFgcFcbQgxJys1jSGjmdTtNhQT1H7gtsWrU4nQ8ZUkuFLuBAvENX5AafT5KWi2sgKWx+JaTMu9oj58R3uS7O6wKeBjbtCWhvldEzzG2FftGIpzQ1urBNxe1YsTBiD82Ti5QgUtmpj6yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340514; c=relaxed/simple;
	bh=kLbn6CpeCLlcUGQJtvkc4TtsFrF3ow6aFa6JcCqKc14=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SX+YWMp7nabaFXYCz340iKc5AyOvgLV/8mJUQL/MlsDUC+La/Xk3CQT7GHefaRDwijCWU8OOmFKS3mJKooCIcoJVGvJAw65/LoaeI9xFEIBdDtSkBZiDP9THgd5Ji51Ta/+bcbsIb1NFdO447kOEmJbGuT4Nsebd/xLYibLtOJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YZehMhlI; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7d81eab0275a11f1a39cd589f645bc18-20260324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LKXbwPKaenlaIt9A1BwOx+fSLPnB8ta5mrz3U1z0gts=;
	b=YZehMhlIck4HMyD6prRHckgPndqe5O2PAWgGYX4kLIootLsJuWA5+Mgi2LpW0Q/h9+h+sZMu3xDnRs7wvmg8TTvodxRGf2iy2m1fvpCb19ryoAInt8zUO4hvxw5XZOmFBC6jD4xStPg1/5QAP/12/90ZwxF4IXBiukRu7j0p+eg=;
X-CID-CACHE: Type:Local,Time:202603241609+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b3780c08-b22a-466f-9133-47948d5b9556,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:bce9a18e-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|110|836|888|898,TC:0,Content:-7|
	-6|0|14|51,EDM:-3,IP:nil,URL:1,File:6|81|127|130,RT:0,Bulk:nil,QS:nil,BEC:
	-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7d81eab0275a11f1a39cd589f645bc18-20260324
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 917805723; Tue, 24 Mar 2026 16:21:43 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 24 Mar 2026 16:21:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 24 Mar 2026 16:21:41 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <nicolas@ndufresne.ca>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>
Subject:
Date: Tue, 24 Mar 2026 16:21:38 +0800
Message-ID: <20260324082141.31292-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	EMPTY_SUBJECT(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56824-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ndufresne.ca,kernel.org,gmail.com,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[jianhua.lin@mediatek.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mediatek.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D3BAB304C6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jianhua Lin <jianhua.lin@mediatek.com>
Date: Mon, 23 Mar 2026 16:12:30 +0800
Subject: [PATCH v3 0/3] Mediatek MT8189 JPEG support

This series is based on tag: next-20260320, linux-next/master

Changes compared with v2:
- Dropped the dts patch (arm64: dts: mt8188: update JPEG encoder/decoder
  compatible) as it belongs to a different tree/series.
- Patches 1/3 (dt-bindings: decoder):
  - Changed the MT8189 compatible to be a standalone `const` instead of
    an `enum`.
  - Added an `allOf` block with conditional checks to enforce the single
    clock ("jpgdec") requirement for MT8189, while preserving the
    two-clock requirement for older SoCs.
  - Updated commit message to reflect the schema structure changes and
    hardware differences.
- Patches 2/3 (dt-bindings: encoder):
  - Changed the MT8189 compatible to be a standalone `const` instead of
    an `enum` inside the `items` list, as it does not fallback to
    "mediatek,mtk-jpgenc" due to 34-bit IOVA requirements.
  - Updated commit message to explain the standalone compatible design.
- Patches 3/3 (media: mediatek: jpeg):
  - Refined commit message for better clarity regarding 34-bit IOVA and
    single clock configuration.

Changes compared with v1:
- Patches 1/4:
  - Updating commit message
- Patches 2/4, 3/4: 
  - Updating commit message
  - Adjusted property descriptions acorrding to hardware requirements
  - Improved formatting for better readability and consistency
- Patches 4/4:
  - Updating commit message

Jianhua Lin (3):
  dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible
    string
  dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible
    string
  media: mediatek: jpeg: add compatible for MT8189 SoC

 .../bindings/media/mediatek-jpeg-decoder.yaml | 39 +++++++++++++---
 .../bindings/media/mediatek-jpeg-encoder.yaml | 20 ++++++---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 +++++++++++++++++++
 3 files changed, 91 insertions(+), 12 deletions(-)

-- 
2.45.2


