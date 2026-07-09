Return-Path: <linux-media+bounces-67090-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +WgKN5oVT2obaQIAu9opvQ
	(envelope-from <linux-media+bounces-67090-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 05:29:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CBB72C4A3
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 05:29:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=qo12LQG4;
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67090-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67090-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4ED10306181F
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 03:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A3E39281D;
	Thu,  9 Jul 2026 03:27:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987852D77E5;
	Thu,  9 Jul 2026 03:27:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783567671; cv=none; b=RI5SlkInJ/ssX5bnWXIHe8IZVZDhstcQQpF2RY456eMEVk4NVTOoIDl4mCVmIMbgGzLpuatyFDJepz4Bm1ROoRYygxEiTYS49XBIq/t97be7qBfJ8V+eWgam17IXKVFPh+WeeE1lIpUlUD9tpBenTJ03AGVya8g/AFrO3bmceyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783567671; c=relaxed/simple;
	bh=oArxJONt05Eo3vIl1q/2tGxr9zINsPL7vlRWosauqko=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WEnr0H3EAui7Glr2KncTuj0UtO/CIXn/CoRA/i0ZmeJwGB+wbxU9gGprwTbDepBlqRzKZaAPKfZ86rrkCfZkoLtGJbVbp052EdQCrhAKVI0ymh/bKIPIPeCZ953XM2sX/Pz7dUXGRfRe7gQmbNozqxj0QFHQvqmQukiPSCHe6UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qo12LQG4; arc=none smtp.client-ip=60.244.123.138
X-UUID: 2036b22e7b4611f1b1788b6acf885367-20260709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=n//DIo26kTWHyp4QnE/oMY3z5Va3Gw4pBY0FjQJiX5A=;
	b=qo12LQG41ikVVI+ki7lY/Uxd5HnFmjxWSPl/897DtlfOvRcuZTCW2nzGCpguP0Ld8dgBYFJwX0ddeO+y3sNazMTqdUD0KrmUEQRn0ouq0gtxihplqA9L8cvGh6+Sln6lcj+nibJ0rkhSEdcIFdjVPB6LuzqtJ411j65BXzxTzEw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:1cda387a-8ec5-4e70-afe4-a43285339902,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:bb3a2158-fac4-43c3-afe2-1defadc905cc,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2036b22e7b4611f1b1788b6acf885367-20260709
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 37846582; Thu, 09 Jul 2026 11:27:34 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 11:27:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 11:27:32 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <nicolas@ndufresne.ca>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH v9 0/3] Mediatek MT8189 JPEG support
Date: Thu, 9 Jul 2026 11:26:53 +0800
Message-ID: <20260709032657.25730-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67090-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[ndufresne.ca,kernel.org,gmail.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nicolas@ndufresne.ca,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:sirius.wang@mediatek.com,m:vince-wl.liu@mediatek.com,m:jh.hsu@mediatek.com,m:jianhua.lin@mediatek.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jianhua.lin@mediatek.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianhua.lin@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mediatek.com:from_mime,mediatek.com:dkim,mediatek.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56CBB72C4A3

This series is based on linux-next tag next-20260707.

This series depends on commit 7560349ee0d9 ("media: mediatek: jpeg:
support 34bits"), which introduced the `support_34bit` field in struct
mtk_jpeg_variant. That commit has already been merged via the media
tree and is present in linux-next as of next-20260707.

Changes compared with v8:
- Patches 1/3 & 2/3 (dt-bindings: decoder & encoder):
  - Expand the description of the `mediatek,larb` property to explicitly
    explain its necessity for accurately describing the hardware topology
    (SMI LARB connection for memory bandwidth arbitration), independent
    of the IOMMU driver's implicit handling.

Changes compared with v7:
- Patches 1/3 (dt-bindings: decoder):
  - In the allOf constraints, only keep maxItems: 1 in the then 
    branch and minItems: 2 in the else branch; remove duplicated
    constraints already defined at the top level

Changes compared with v6:
- Patches 1/3 (dt-bindings: decoder):
  update the existing `allOf` condition for mediatek,mt8189-jpgdec to
  make the 'mediatek,larb' property strictly required for MT8189 SoC.
- Patches 2/3 (dt-bindings: encoder):
  Add an `allOf` condition to enforce that the `mediatek,larb` property
  is strictly required when the compatible string contains
  mediatek,mt8189-jpgenc.

Changes compared with v5:
- Patches 1/3 (dt-bindings: decoder):
  - Drop top-level minItems/maxItems for clock-names per Krzysztof's
    review.
  - Refine allOf block to strictly enforce clock constraints.

Changes compared with v4:
- Refines the device tree bindings for JPEG decoder and encoder.
  - Patches 1/3 (dt-bindings: decoder):
    Moved the standalone compatible string mediatek,mt8189-jpgdec
    into the first oneOf entry along with mt2701 and mt8173, as
    suggested by Rob Herring. This correctly groups all independent
    ICs and removes the redundant items wrapper.
  - Patches 2/3 (dt-bindings: encoder):
    Applied the same logic suggested by Rob Herring to the encoder
    binding. Restructured the compatible property to clearly
    distinguish between the standalone IC (mediatek,mt8189-jpgenc)
    and the ICs that must fallback to mediatek,mtk-jpgenc.

Changes compared with v3:
- The v4 is resending the cover-letter, because the v3 cover-letter was
  not sent successfully.

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

 .../bindings/media/mediatek-jpeg-decoder.yaml | 49 ++++++++++++++++---
 .../bindings/media/mediatek-jpeg-encoder.yaml | 35 ++++++++++---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 +++++++++++++++++
 3 files changed, 114 insertions(+), 14 deletions(-)

-- 
2.45.2


