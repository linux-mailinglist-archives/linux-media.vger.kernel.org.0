Return-Path: <linux-media+bounces-51596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC9GNU0meGl7oQEAu9opvQ
	(envelope-from <linux-media+bounces-51596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 03:43:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5061C8F1A6
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 03:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6579D301E942
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 02:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7155B2DB7B2;
	Tue, 27 Jan 2026 02:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mzZTzeJ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB982D7BF;
	Tue, 27 Jan 2026 02:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769481789; cv=none; b=sXVvQigGRpMQ7ia4AsNsD+GtS4AYcZBy6/hh/2kNQ7Cj+EhbISqUrUBcyDVibHQyhgQt5GUCHtA2XddTze9PJVdRldaG6Ty6U49q/Q7Vvuwy8+mFEpQlvFAOCRCz4E1vtvkrGKxJ6KET7M4MPJZzROrcevB8K6OEneC54nfonLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769481789; c=relaxed/simple;
	bh=b37d1/C0Ls6eN0N+ASzSK8CJw0sfOAqMvrqtQLCCSeY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gizzTmbJyhHdkZ4qi1WWRqVJw2LfkAvYRekW8Q4uldb0SlNFa1jOZUL4MWk5kS3qpL7ksRxKhY7UvehstJKdXqIghL5bp0xFKGmw9YJ7CjhxY5RKyCXVXxJdbG1DF09yqZY+xvYnnf91E3n3350M2ZdFPouhE9yZqKT7sh//QFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=mzZTzeJ5; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e633f52efb2911f0b7fc4fdb8733b2bc-20260127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6PBVDfDmY0sQUXiIsLsBjL/r8yVY5YCylH5TFAYY8HY=;
	b=mzZTzeJ5uCbxtj8+Wndx65IeOjIznRgMIkTvXH6nVm5X1E5YaviU1hhsoaC7Ai3ELhjI6/6GFNSkzsS+KP/RacW772UndYrg2OTcHxnAy99cbLLgHvdb9K7W7kaIE2otWNXRRd9ELEObcamciWf3OR8nW9a6Gzaz1Sx8khXZr+Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:bf51e171-1aaa-4084-ad29-6f458fe02cbf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:7d0c985a-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e633f52efb2911f0b7fc4fdb8733b2bc-20260127
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1110007247; Tue, 27 Jan 2026 10:43:02 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 27 Jan 2026 10:43:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 27 Jan 2026 10:42:59 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v7 00/10] Enable video decoder & encoder for MT8189
Date: Tue, 27 Jan 2026 10:42:37 +0800
Message-ID: <20260127024248.18406-1-kyrie.wu@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,xs4all.nl,chromium.org,arndb.de,vger.kernel.org,lists.infradead.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,mediatek.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51596-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kyrie.wu@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:mid,mediatek.com:dkim]
X-Rspamd-Queue-Id: 5061C8F1A6
X-Rspamd-Action: no action

This series have the follow changing:
Firstly add mt8189 video decoder compatible, profile and level to support
MT8189 kernel driver.
Secondly fix some bugs, including vp 4K profile2 and media device node
number bug.
Lastly, add mt8189 video encoder compatible.

This series has been tested with MT8189 tast test.
Encoding and decoding worked for this chip.

Patches 1-3 Add decoder compatible.
Patches 4-5 Add profile and level supporting.
Patches 6 Add VP9 4K probability size supporting.
Patches 7-8 fix some bugs.
Patches 9-10 Adds encoder compatible.

---
H264 test results:
./fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -j2 -t 90
    JVT-AVC_V1	Ran 96/135 tests successfully

VP9 test results:
./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0 -j2 -t 90
	VP9-TEST-VECTORS	Ran 276/305 tests successfully

v4l2-compliance test results:
Compliance test for mtk-vcodec-enc device /dev/video2:
Total for mtk-vcodec-enc device /dev/video2: 47, Succeeded: 46, Failed: 1, Warnings: 0
Compliance test for mtk-vcodec-dec device /dev/video3:
Total for mtk-vcodec-dec device /dev/video3: 48, Succeeded: 48, Failed: 0, Warnings: 0

scp upstream link:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250811015922.32680-1-huayu.zong@mediatek.com/
dtsi upstream link:
https://lore.kernel.org/linux-mediatek/20251030134541.784011-12-jh.hsu@mediatek.com/T/#m847e35de0a5b18fac0ca0624a8559d84964ad5c7

Changes compared with v6:
--refactor the patches of set compatible data, profile and level
--add reviewer to commit messages
--fix commit message errors

Changes compared with v5:
--move default decoder parameters to compatible data structure
--add reviewer to commit messages
--Rebased on top of the latest media tree

Changes compared with v4:
--update H264 & vp9 fluster test results
--update vp9 single core decoder prob size setting and commit messages

Changes compared with v3:
--add reviewer to commit messages
--Rebased on top of the latest media tree

Changes compared with v2:
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
https://patchwork.linuxtv.org/project/linux-media/cover/20250814085642.17343-1-kyrie.wu@mediatek.com/

Kyrie Wu (10):
  dt-bindings: media: mediatek: decoder: Add MT8189
    mediatek,vcodec-decoder
  media: mediatek: decoder: Add a new platform data member
  media: mediatek: vcodec: add decoder compatible to support MT8189
  media: mediatek: vcodec: Refactor Decoder profile & level Handling
  media: mediatek: vcodec: Add Decoder profile & level Initialization
  media: mediatek: vcodec: Add VP9 Probability Size Configuration
  media: mediatek: vcodec: Fix vp9 4096x2176 fail for profile2
  media: mediatek: vcodec: Fix media device node number
  dt-bindings: media: Add MT8189 mediatek,vcodec-encoder
  media: mediatek: encoder: Add MT8189 encoder compatible data

 .../media/mediatek,vcodec-encoder.yaml        |   2 +
 .../media/mediatek,vcodec-subdev-decoder.yaml |   5 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.h  |   6 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  42 +--
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  33 ++-
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |   2 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  14 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 251 ++++++++++++------
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  14 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  14 +
 10 files changed, 261 insertions(+), 122 deletions(-)

-- 
2.45.2


