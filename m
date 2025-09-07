Return-Path: <linux-media+bounces-41920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2717B47A1B
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 11:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0EFD189C450
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 09:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB4D2222AA;
	Sun,  7 Sep 2025 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uni4au8D"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2612121254D;
	Sun,  7 Sep 2025 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757237776; cv=none; b=k3UggmzwuEp5R2aiKNj5EZtJXeutBNIbRCJQ9UWmufPsIKeDs+3BUBfHDEYj86i0fr5LrGymD/fTPiVlNiRCLiMyHYIDIEJdmkHx+A6Om9uB9WaQAX4ew15Bj83XN3WtjamTWNADk9D1J+eqTRci+Rj3qi62A2TQvZgzPxBw72c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757237776; c=relaxed/simple;
	bh=QQHQ7F8xeSucHQ7sZpV7atEPORzeB0OK/F4PiyQdNGI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FlR2JwCQI+PCPyFIvB5ARyPk3UN3q8zkMM4tnxGQHzmGTg2zuxFtkb5aITBk3XzaiOB2BQXu88e5VMwIa+x3g80LgVF1RwYjS3KIVagDRd9cTDPu/CQ4U1jOliUtIDUtWOl/xl4vDWX0uh4LYzDKffkhgUspy5KxLqjx7Nt4/Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=uni4au8D; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 11d461088bce11f0bd5779446731db89-20250907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tBu1bs4aRFXXM2hwyueRO+bUFFMnZxfxSLLqElKyz0E=;
	b=uni4au8DUwwhf1STbU8f9ZWOZAor2fRvhQuGLjnGQbvCTATzNRmXoZzNoO8X+/YwljlhmHzaaUXd+NQILT0Cl01u7wh5UFNbQ1JlbpBWY5q03eUU4MH2w1b+6gHHGH1+9DDGdaO9Lv4NfnWMECaqcpJwEX4Vx1d1Izta1H7REWQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:c3a469f9-de29-4f8c-b258-224dfbd3559f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:dc420ca9-24df-464e-9c88-e53ab7cf7153,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 11d461088bce11f0bd5779446731db89-20250907
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 603471486; Sun, 07 Sep 2025 17:36:02 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 7 Sep 2025 17:36:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 7 Sep 2025 17:35:58 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Qianfeng Rong <rongqianfeng@vivo.com>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
	<longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 0/2] initialize vcodec scalar variable
Date: Sun, 7 Sep 2025 17:35:55 +0800
Message-ID: <20250907093557.8008-1-irui.wang@mediatek.com>
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

Initialize vcodec structures:
patch 1 add missing initialization to fix the encoder's UNINIT checker
issue.

patch 2 converts memset() to = { } for other vcodec structures.

Changes in v3:
 - Converts memset() to = { }
 - Combined with Qianfeng's patch as v3
 - Link to v2: https://patchwork.linuxtv.org/project/linux-media/patch/20250715081547.18076-1-irui.wang@mediatek.com/
 - Link to Qianfeng's v1: https://patchwork.linuxtv.org/project/linux-media/patch/20250803135514.118892-1-rongqianfeng@vivo.com/

Changes in v2:
 - Add Fixes tag, update commit message
 - Remove unnecessary memset
 - Move memset to before the first usage


Irui Wang (1):
  media: mediatek: encoder: Fix uninitialized scalar variable issue

Qianfeng Rong (1):
  media: mediatek: vcodec: use = { } instead of memset()

 .../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c    |  3 +--
 .../mediatek/vcodec/decoder/vdec_vpu_if.c         | 12 ++++--------
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c      | 12 +++++-------
 .../mediatek/vcodec/encoder/venc_vpu_if.c         | 15 +++++----------
 4 files changed, 15 insertions(+), 27 deletions(-)

-- 
2.45.2


