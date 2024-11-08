Return-Path: <linux-media+bounces-21102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6277A9C14C5
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 04:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 090ABB21D25
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 03:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478B2187FE4;
	Fri,  8 Nov 2024 03:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PiLGer9J"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD2B1BD9FF;
	Fri,  8 Nov 2024 03:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731037232; cv=none; b=ZKmsMvWnMCxGyr9ciEr40nPzDXBw4YsjKpIRrL+HV9DLr/UQUFXw0KKawGvPJnscHJ3DFjgL15RD3MjSuGlBcnUpZKmHzWJqpNk8rOxVgJ+FjOXSCQMLMcV5JTxcyVwuvduV1DmQ9FvjNfGDIOZLtu9/mk8MUnAJVz34dPEJ/3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731037232; c=relaxed/simple;
	bh=s60fPGEH8R0V05l/DCziW5MsVlLy6qqAM5FhxjaJk3k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yg/lM/scRs1qakZsDKoJMWWxjYg7S7owoq0UVUGfn+7mORCY0MSMm0T8bEm71nweX29SUungpKqafbzI+0CclmCKvP7qPriGgIkBLei+5lB6BnlfRO6RYmGUhD3zXrPAyy/i9t4a0WWvrt7Rd9eHUZsPx9mM+lC0srfQ1GrCVEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PiLGer9J; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2f4884a69d8311efb88477ffae1fc7a5-20241108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JWM/VuPToagKQqIrsc4gjKEm7ZO4IRmjdG17CoQzVcc=;
	b=PiLGer9JN+hO3Tj7jS/ZHOXzquxN+mkR/+4qityKeZ4XOXDqeCrtzny7H0549s9uL0iKpKu2yDQ43Rn84W3UmwiTLeNp3aavUxAv5EjMN52ne8s9v9iMN6G/WOH9Pz1it8GY2b44PGbVlFQSwyrzixebkhE1fn1NTc1U85s0ses=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:e44d5991-73fe-4b5d-98ae-ee85cbfd2ceb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:1c7db6ca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 2f4884a69d8311efb88477ffae1fc7a5-20241108
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 38878053; Fri, 08 Nov 2024 11:40:23 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 11:40:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 11:40:20 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, "Steve
 Cho" <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 0/3] media: mediatek: vcodec: support h264 extend vsi
Date: Fri, 8 Nov 2024 11:40:09 +0800
Message-ID: <20241108034019.20064-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.143600-8.000000
X-TMASE-MatchedRID: xDToTJ4Kd/kEQqIqKFLtTpqrexa4CbEQ6Jlwb2gbuk7b6Y+fnTZUL/FN
	etD9U62Q3f0e/BgwI9DivP2ec7HEZY+eiI05y0fpe8FaKRfM2oOy4iyjvVWTohjQD3m2MCf7xsr
	6m7RljBGdwzfIRAoivBG7cCJtaI6lUQBcvRRvU70D2WXLXdz+AUo8jH4wkX2jmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1l3+bAt/YFVR4rnT/tRlwHGh2SN6BF642d5tCcBP/SFSTjsioQY2Q2RyFd
	Nnda6Rv
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.143600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8EE77812E6CE2747C7DAEFC7C09440856B97035CB0053C935682390589EB11722000:8
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
[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20240018033219.19804-1-yunfei.dong@mediatek.com

---
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
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 589 ++++++++++++++++--
 2 files changed, 524 insertions(+), 67 deletions(-)

-- 
2.46.0


