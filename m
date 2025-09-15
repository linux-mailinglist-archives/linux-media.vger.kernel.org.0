Return-Path: <linux-media+bounces-42533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7456AB574B9
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 11:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00834189E82D
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 09:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161212F6581;
	Mon, 15 Sep 2025 09:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IrVxG8fh"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299242F3C2B;
	Mon, 15 Sep 2025 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757928019; cv=none; b=KrYJCAwaQ8PsXHv6uMYQAq4biyPU1KIe5uTLbYTWiu7/PIKXddU05fd8bpIm8Q7eq1Tx8j6eOIQAZJqbkNv8zzEdovkvQVrHpvcbDpPl4rJXcT+I/R5QUelsKjr4Z3/JpmkJpavyrJSbdUVJSqK7I29BzJzoRASlrtb43sOrmwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757928019; c=relaxed/simple;
	bh=lrs+gaC/iCxZllKb8NGtMd926GgvT1TaLgwxAzZYc6w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=einhWfytAviCl+Kk/g4+bBfoN7nmZ21quFNUxTPi3NvoQJxgG78X9CVdSB1a9GqvGMhabTFqDFntDS8AJqiuvXRsl70IEdbZUoyhh006na8IEwUyfP+zRQC1WDWOzeXMvv4D2F2aV205InbAgSQgly2vUz81/WXAp92JkOD4V+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IrVxG8fh; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2c7f199c921511f0b33aeb1e7f16c2b6-20250915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1le3np0jp2M0puYyEjMNuuOO7xrsTjp7HZKSsbnNKHk=;
	b=IrVxG8fhruEPK1AT5HnCr4srmmx1UkvZpCuc/xgSJ2wntMHdTOJio9+G/jTnzp/2NVI22qXw32aGH3CVFHLigqJjY2hDiYYhf5jaqdaPK2FChUDTMPEsaX0chiaiYDSsRJ94cxFslhxkE0DwTONULJAXJAoaDXDzvXoxtbUkO/A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:73610fbe-eb28-40c3-8b5e-80d78e040fe1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:59ac4ff8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2c7f199c921511f0b33aeb1e7f16c2b6-20250915
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1423529524; Mon, 15 Sep 2025 17:20:08 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 15 Sep 2025 17:20:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 15 Sep 2025 17:20:05 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v3 0/8] Enable video decoder & encoder for MT8189
Date: Mon, 15 Sep 2025 17:19:50 +0800
Message-ID: <20250915091958.31509-1-kyrie.wu@mediatek.com>
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

This series have the follow changing:
Firstly add mt8189 video decoder compatible, profile and level to support
MT8189 kernel driver.
Secondly fix some bugs, including vp 4K profile2 and media device node
number bug.
Lastly, add mt8189 video encoder compatible.

This series has been tested with MT8189 tast test.
Encoding and decoding worked for this chip.

Patches 1-2 Add decoder compatible.
Patches 3 Add profile and level supporting.
Patches 4 Add core-only VP9 decoding supporting.
Patches 5-6 fix some bugs.
Patches 7-8 Adds encoder compatible.

---
H264 test results:
./fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -j1 -t 90
     JVT-AVC_V1       94/135

v4l2-compliance test results:
Compliance test for mtk-vcodec-enc device /dev/video2:
Total for mtk-vcodec-enc device /dev/video2: 47, Succeeded: 46, Failed: 1, Warnings: 0
Compliance test for mtk-vcodec-dec device /dev/video3:
Total for mtk-vcodec-dec device /dev/video3: 48, Succeeded: 48, Failed: 0, Warnings: 0

scp upstream link:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250811015922.32680-1-huayu.zong@mediatek.com/

Changes compared with v1:
--add H264 fluster test results
--reorder compatible string for dt-bindings

Changes compared with v1:
--add v4l2-compliance test results
--add scp upstream link
--add HW difference discriptions for dt-bindings commit messages

This series patches dependent on:
[1]
https://patchwork.linuxtv.org/project/linux-media/cover/20250510075357.11761-1-yunfei.dong@mediatek.com/
[2]
https://patchwork.linuxtv.org/project/linux-media/cover/20250528063633.14054-1-irui.wang@mediatek.com/

Kyrie Wu (8):
  dt-bindings: media: mediatek: decoder: Add MT8189
    mediatek,vcodec-decoder
  media: mediatek: vcodec: add decoder compatible to support MT8189
  media: mediatek: vcodec: add profile and level supporting for MT8189
  media: mediatek: vcodec: Add core-only VP9 decoding support for MT8189
  media: mediatek: vcodec: fix vp9 4096x2176 fail for profile2
  media: mediatek: vcodec: fix media device node number
  dt-bindings: media: Add MT8189 mediatek,vcodec-encoder
  media: mediatek: encoder: Add MT8189 encoder compatible data

 .../media/mediatek,vcodec-encoder.yaml        |  2 ++
 .../media/mediatek,vcodec-subdev-decoder.yaml |  1 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  9 +++++-
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  1 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c |  4 +++
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 32 ++++++++++++-------
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       | 14 ++++++++
 7 files changed, 50 insertions(+), 13 deletions(-)

-- 
2.45.2


