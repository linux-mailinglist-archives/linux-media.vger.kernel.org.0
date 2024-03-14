Return-Path: <linux-media+bounces-7066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CACF387BCE5
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 13:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE7111C2150C
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 12:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6DD57861;
	Thu, 14 Mar 2024 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q+RW2pJ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0367850A87
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710419691; cv=none; b=ERydCSRbrE3aQ7CKuyc9U5O5lEkS9uFLxG3wBYzqnceFGAfQAWJWiPKJrbOEUTgySvbCk+4ogdUd4g20/Qb24rcVIQ6ROaUBm55VgBDS3fpkagguzUheexwUoUFNBnQOfWGLQcMqn7S8nQMg+Zm0n5pE1hM2N5+UlPppHbwIrhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710419691; c=relaxed/simple;
	bh=Aujg5jLjALk/2Pu082mFiGg0tdsbfoUKtq4VzcPSqS0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dYyxl88KpZOsOZeF8xEQCFtlDz/aWk+OotxVd7v2oG2MKuNrG+GE7y2JfBIAiRQr/dYFf6zzuMcmNuY9lvIk2Dr+jIbO16AmIjLylswNXuJgmh+s+Trz1jKkkUtn6QE/b9JtSj1hwC2770vPq4KFwK5a9+xFccZmz7Ef0369KRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=q+RW2pJ6; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3a9394d0e1ff11eeb8927bc1f75efef4-20240314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eHIuJ/nH0iB/RhsjqRAMsrFrIjG/9YMTt3fbBIRsxKs=;
	b=q+RW2pJ61E17sCP+ZWC/OhZDA8gHkPzbhgstkDUJ0cCVWus86HnvpvVz+DcyAd2qcCziSNtaB+vuEbrmMgLJ7KaBGigr4TBOUB8H4YKZDWMZeWkhCEWxVMzR+JaBFK9v6QfJkhm2HwffQrIn2dVOD4fRSKB0MeyLWd7HH8WQtuQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:2eca853a-44ba-4db0-bd6c-469121016401,IP:0,U
	RL:0,TC:0,Content:55,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:55
X-CID-META: VersionHash:6f543d0,CLOUDID:f159e5ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:4,EDM:-3,IP:n
	il,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3a9394d0e1ff11eeb8927bc1f75efef4-20240314
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 241252738; Thu, 14 Mar 2024 20:34:41 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Mar 2024 20:34:39 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Mar 2024 20:34:38 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<Longfei.Wang@mediatek.com>, <Yunfei.Dong@mediatek.com>,
	<Andrew-CT.Chen@mediatek.com>, <tiffany.lin@mediatek.com>,
	<irui.wang@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8
Date: Thu, 14 Mar 2024 20:34:13 +0800
Message-ID: <20240314123413.20266-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240314123413.20266-1-irui.wang@mediatek.com>
References: <20240314123413.20266-1-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.800400-8.000000
X-TMASE-MatchedRID: z0n/KGJpTaQV+IhmxVRNsU1Wvi92YKnOgDRlwc+wR6cs/uUAk6xP7Czy
	bVqWyY2NPd2BuXo8g8QZxVlDKxr96FlP3wf1xZicntN+u6tbkNSZqzy8f5BW3KnmJGW3q+DRiG+
	5s00+hQNX9/EkrSinjyN3IaIROO2/2+H97I4DKP5INvy5qHhnBOAAYRasBjMeOTfgsq2649qhox
	xZO1uY4uXgcj2OBStdvM6UQJ6knztqzBBbOgcQm96RwdCD900XfS0Ip2eEHnyTitjWv6+zCEMwc
	8aiviqr2AyqvQSyt/c7AFczfjr/7KAWhRY+pr/oSYmmWatGsUuXlwrUchmuCyG0C216/tCgphmW
	zK9BsVk=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.800400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 039942D76868D0D92066E11643864E3E265698F2FE78722A01D1CC44B61F1AFD2000:8
X-MTK: N

[h264 encoder]
imporve encoder quality

[vp9 decoder]
parse intra only frame uncompressed header

[h264 decoder]
manage decoding dpb list

Release Version: 1.1.8

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131380 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/mediatek/mt8173/vpu_d.bin b/mediatek/mt8173/vpu_d.bin
index e966b49bee57e8cfaa3536174830916cf35b184f..06aa3fb83b4e8d9b6921f7429b66c37744aad4a9 100644
GIT binary patch
delta 550
zcmajZJxBs!7{Kx8)H^LdDzh)UO6|)m4vLDVAc?@uDWSQksiDCkFbZ<5ZfkNl8X`hG
zQV43wrM0$(8VZ`-gogeXwiUkcyZ_z$ymwsb<whx?>{GS3ipW*P45^8zZi;-K$<Nwi
zJ@2~YoxQSYp9XI=+Y`txxmS#NJGXY{GD;63k-CVE1d_O9&!7vf`(?U{jk=v)ug25a
zR}q!(A5e|PK194UOMT8h_0z>CkpSJMLFc(45^|m!{K-!E$jTS3yaHFv%DcY`1>ID{
zv5EbbL;4qIevFfU=D+Va^K)FZId^R;Dd8g3HV5ySKNd4hH#|_G!3!Tc&<Q^R2qJ_o
vbfX7h^df>j^kV>n7(x`o&@qBhj3I_N5*Wt>CNYI+Br$^&W^0+|TyF0h_inlQ

delta 550
zcmajZy-NaN9KiA4-Fc_wOJ!DOubRD?L<CV&kVqgzG(<v^b5nzZn?r+Jr2PX9{s9M9
z2~rKYv=(hq1VLjs1wupL2W%^R;B()*=l9%k)#ppC3fp5^EnDQ;J`b3&$WB=#47Cnf
zPsh51Dk5)Xr|fT7j?1^VW~_@i*{vIW*}fBrH${?I#ReMeZPHZdew*&%py{O2SJ71N
zMa1OmXVjuA?;>uRqaL+Sy)^wG;-h)$SI;exfO>B6Cr81PTA@@cXwd7mg7IA}?pHKX
zPI1xEpnp;GTipLM|9wZzAMx7d+($)A2p9S6a`20}Udpr$xM0G98y@ta7hd?_M*w~3
u#{hyDL<mC|#t6a~MFe9Q#{?!Zg=s_)!wlk>#T@3bfJG#*RL``N+58V|&cV|F

diff --git a/mediatek/mt8173/vpu_p.bin b/mediatek/mt8173/vpu_p.bin
index 55a49ec244539011213928bb66909a3564af703e..b6533596c7484a64f5738fd180fdd87158b23a70 100644
GIT binary patch
delta 10973
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
LHhCLwpnmj!)gSfQ

delta 10312
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
OY!32x-jzKHJ@7w;@g&3m

-- 
2.25.1


