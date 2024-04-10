Return-Path: <linux-media+bounces-9004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5779489F073
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 13:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88FE21C21DF5
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 11:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EA41598E1;
	Wed, 10 Apr 2024 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VVpmsGNk"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6342837B
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712747674; cv=none; b=spz7OEauv1n7wd4FP+eO3ely3RMUkRlI8u2NvT+3Cqfqsehl55+JVM/JmMHSfi66R7gWpTZk0U8YIV21fVoQlLSP6cV6a6e12LfSe6xk8LSOw9fFbSmPLJrJENshmiO4ZB7AqMDBZj10hUw3Z0/eaisowuwWuLiU6yFmdloUwio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712747674; c=relaxed/simple;
	bh=ErNPG/b8cdlMk2AHLkfMjsFKULHHbUnwMF3BBXeU8J8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uGFtR+VQEekzgE3qEDdBkwPqE8yrYLxOXCSx7ALNjsZgHXQElNfaDq6A+C4GBNvR5j9wzWJQY/+Y1O/ZThDEq5oTiEfiq83IyC0tgtOFiTjpsgfOMJYK1Nlu/G31sylFdYk9nmz4IQT64lKcowhLekFNbRsP7kM3laRk8TMVbQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VVpmsGNk; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7df0db0cf72b11ee935d6952f98a51a9-20240410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=k2vJZvzXPWAch/3DrDdHKVno+X2M7Z03bzv0+J14OPA=;
	b=VVpmsGNkpprCLcHsYuxZaAF2IP1m2K2dfGLZvaRabzwWfS6oF3/F2lvf4pmF7ysa5e85gaDX7GQbdTrLk4Xsc1+/JqJJ6UU9Co5gpI6uJqwhH80CQdJ2YvCA+rSBCgk3xy5nKZhEGRNMP/7oFMPROrH1NO86sFHmDupTbONj2O4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:00f2367f-d7a7-4b9a-9614-fa7b5f49da77,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:2011c0fa-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 50,UGT
X-CID-BAS: 50,UGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7df0db0cf72b11ee935d6952f98a51a9-20240410
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1302845419; Wed, 10 Apr 2024 19:14:26 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Apr 2024 19:14:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Apr 2024 19:14:18 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<Longfei.Wang@mediatek.com>, <Yunfei.Dong@mediatek.com>,
	<Andrew-CT.Chen@mediatek.com>, <tiffany.lin@mediatek.com>,
	<irui.wang@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: pull request: linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.9 
Date: Wed, 10 Apr 2024 19:14:15 +0800
Message-ID: <20240410111416.2204-1-irui.wang@mediatek.com>
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
X-TMASE-MatchedRID: lT3Pays+ayfPOb61tmLEGoSvKOGqLLPK/kqO2xYqX5aqG/oAv7EtlT3O
	m/10wG4m94kvTNM1tWePFrrIuZSCCl/ag3kgZsCOngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AFYF3qW3Je6+5hOxoM3JPyDViork/Gnty5YDTpkwiF+IbKEF54avyFSFjGYDTSgk1Ilyt
	ehiG+vxvLpWv+Ui6RSioz9IaWL7lI2eTwdZT29r4SVUZZHNLr+RgV6Hsqyx11QaONuZ6Jr4g9k3
	l8EaYIcovpDXVQHzIN+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.122600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	F31CA27B66CB61F2B24F8A3F80638668CD75F6C8AB4F1C27A8621BFD9E74AACF2000:8
X-MTK: N

Dear linux-firmware maintainers,

The following changes since commit 1addd7dca2d953a5484c3e3c08dbd7dc253058dd:

  Merge branch 'rtw' into 'main' (2024-04-09 12:30:28 +0000)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.1.9.git v1.1.9

for you to fetch changes up to c81f094c847d934c0ffe0870fa5cf861c62e3451:

  linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.9 (2024-04-10 18:36:10 +0800)

----------------------------------------------------------------
Irui Wang (1):
      linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.9

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131380 -> 131380 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)



