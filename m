Return-Path: <linux-media+bounces-7065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 150C687BCE2
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 13:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 469201C20863
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 12:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8459B5788B;
	Thu, 14 Mar 2024 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HuLE/L1l"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18196535B8
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710419668; cv=none; b=FqCP0PkV7Df7MQ5dCWA3xSHTaLt/PCynWoKEK/gaA5NfoySNoSJGV2KtMmIUx3huDO9QKzlcmHcLiwOUqBfQApEQ6n6CR3mkMQ4DsXfvWFkzlr20casvG074pVg+bUjitUvoh4soW+i8LyBwvH4fHMNYAuG2AYSndKZhrFbsspM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710419668; c=relaxed/simple;
	bh=zw22QE+3ukQLig66MjMKiqYNmeDzgnPcnD0cBd3fK+0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HQxm4A4OcWLr9NNmMP1fRCx4p2QISKDhIoGF6Lz0XmYS7j+ZvWqzPc0qnMNgZJg8EKMUS9RZWQrfT6y4598QbsJitR1kw/xMrGGzZf1kLNA3nYV37xQQstIhVJKwoW/Vnopa2M/IKqtNyK6N/loLOkoh5QvNduNj7fpsq9OQ4NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HuLE/L1l; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2d85dc12e1ff11eeb8927bc1f75efef4-20240314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0KBBL1onSRsP8F7nCOgP7wKfzvhEaVen2DzkFvrrpKg=;
	b=HuLE/L1lX/MJDdXEJTWxorU5GXChLdyLQOPHTx6pYkRgUUhMkVcu7u99MFnt/r/Bhh1/bJiUHxP++k4VOSOVMRVdDQgECJ7KuFMoZxPhIMevLIyC7ayIgzIFSyCB7mHGUUirFaWoxvwrbfbl9rPYwLIk2Qraz0Tgbtn14FzUpsM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:1dedf61e-5f01-48f3-a401-5e72563f225f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:1e738081-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 50,UGT
X-CID-BAS: 50,UGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 2d85dc12e1ff11eeb8927bc1f75efef4-20240314
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1498280453; Thu, 14 Mar 2024 20:34:19 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Mar 2024 20:34:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Mar 2024 20:34:16 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<Longfei.Wang@mediatek.com>, <Yunfei.Dong@mediatek.com>,
	<Andrew-CT.Chen@mediatek.com>, <tiffany.lin@mediatek.com>,
	<irui.wang@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: pull request: linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8
Date: Thu, 14 Mar 2024 20:34:12 +0800
Message-ID: <20240314123413.20266-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.122600-8.000000
X-TMASE-MatchedRID: Zfi8CblT/bykwTZnxyBJ86b8GfRpncAzUXlp1FHYSPWYvYlYOb0cVFPW
	us3yxQNWz6njtD4sDFldkBppXRkyukkjllSXrjtQFEUknJ/kEl5jFT88f69nG/oLR4+zsDTtjoc
	zmuoPCq3uLaTohbTrARkCOy8H3lXqAN3caC3sJSmE5uLIa/M9sGiotolenEk+BRbXnATtZc2Ny7
	f+obnH+UTX7BCxIdUjTjHt7UFpGk7iw6uxviJP8r9tsSiUciBlQ5zsaM5qada/lr1yYih0SzMPw
	dnhe8nZlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.122600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	F047307EB6306AC29730D043E6641621F6A86F4A21EAA8CDDC200DB58A0F756B2000:8
X-MTK: N

Dear linux-firmware maintainers,

The following changes since commit 3b128b6069267b60a46a4074c383183177ee6e6d:

  Merge branch 'mt7921-bt' into 'main' (2024-03-12 11:09:41 +0000)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.1.8.git

for you to fetch changes up to 7132c3a7f031e9b0721cda7ef4741308465707ea:

  linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8 (2024-03-14 20:00:55 +0800)

----------------------------------------------------------------
Irui Wang (1):
      linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131380 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)



