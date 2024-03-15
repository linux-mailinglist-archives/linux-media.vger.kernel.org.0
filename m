Return-Path: <linux-media+bounces-7097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842987C83B
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 05:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DEC41F2224D
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 04:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B11DDA1;
	Fri, 15 Mar 2024 04:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bHI4I+0W"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F85D63AC
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 04:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710475872; cv=none; b=ryKU9GVl5KVx539LwtREFvMh0Rx+4Ucleet0GsLRDBycWCjLwS4ruAGvr5EDm8FIKIHRzsg8tgPmUM1jaStfDIGIGc2P1RLHygIDaEoiBQP4SjeJLxF6h44bM+oCw07S01RCAuq1pjxjYGHELkzv4kCK+zT8SDIcJDn4AKZvmcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710475872; c=relaxed/simple;
	bh=qV3E6ltyAb050KOu5oIC6kxVOn3/E9t1yAyt6Zmry7k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RdHpyMWV2KZ4tUE5X3FE1eeSSS4mwPTeHe0A6dwW87uCaytUOU1ZQN/nMV4c7ideTCXGmWTE3cAbjKJlRf5ecaIuu1lCa+cLEGFrxeh1RwkGpCmoEta4W4BjY4Rivwh7OU8AikLLpLxC6axtgVCgftMkDasB9xMdtUXkvzUo2v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bHI4I+0W; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0acdad8ee28211eeb8927bc1f75efef4-20240315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=PlqOaih2uAz/fZ7QnBrX7slnDt1y0lkGyDguQclX9xE=;
	b=bHI4I+0WAq9iJbOziiGa6KueZhBxLXIMsbovXpzCuamzfriPwnvYX6rBuPw6YQ9YRFUDsEW6GNQ2eMaXJqcnz8FwRktUbdqO7QTHOgCiV4OcJ6oZl9J3B5O4phNCGgLjIo2Gc5gX8jlHfblWUJB22tjfAKDvXcbkIB90GCKxbCw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:ba4230aa-7081-4461-827e-354a60ba0d7d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:f05a0785-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 50,UGT
X-CID-BAS: 50,UGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0acdad8ee28211eeb8927bc1f75efef4-20240315
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 187788050; Fri, 15 Mar 2024 12:11:04 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Mar 2024 12:11:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Mar 2024 12:11:03 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<Longfei.Wang@mediatek.com>, <Yunfei.Dong@mediatek.com>,
	<Andrew-CT.Chen@mediatek.com>, <tiffany.lin@mediatek.com>,
	<irui.wang@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: pull request: linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8 
Date: Fri, 15 Mar 2024 12:10:27 +0800
Message-ID: <20240315041028.25273-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Dear linux-firmware maintainers,

The following changes since commit 3b128b6069267b60a46a4074c383183177ee6e6d:

  Merge branch 'mt7921-bt' into 'main' (2024-03-12 11:09:41 +0000)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.1.8.git v1.1.8

for you to fetch changes up to 38684ddd81f16e9c5cd41c83a3937649bab43413:

  linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8 (2024-03-15 11:55:58 +0800)

----------------------------------------------------------------
Irui Wang (1):
      linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131380 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)



