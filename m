Return-Path: <linux-media+bounces-56940-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPF2JUNhw2m1qQQAu9opvQ
	(envelope-from <linux-media+bounces-56940-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 05:14:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C9731F8E3
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 05:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9677131ED109
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 04:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640882EBB8C;
	Wed, 25 Mar 2026 04:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tHNoZnVz"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228BE2E612E;
	Wed, 25 Mar 2026 04:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774411370; cv=none; b=U9OEej/M049+VROTNqHXeYklNndiQMpdilQ0VAKf1UPr8pEtWNzT0XBvS3KcU4ZXt0kME9ZbMqjZ1jNrtrpvuj7+JxahBZzIFPmKSVmyrE14TdI+sq8gXAnoGPIJQPzJPssuBuMS7xCrD7TUoqBKsEoCmEKIZdEaZG2M3Pp07hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774411370; c=relaxed/simple;
	bh=LrYAbiA1e1CaJu5ldzJ9zBW5T7joVrQ/0y7uH5hCQl0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n8fz/VJTuUHReKPcjY4ZwEv9XyAd9w4HsUtaS6x98OjvLPia1W/HFx4SSV0wvBTcVggdtFo0IPSx9d/0LdNolr1NLo9um1lcALbFn32kp4BqNWhQVaY6DJ3P5yHPTAguAmx6kHITsFJhQ5fYCxIjWDk4FQBRTJfS1DXn4772NoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tHNoZnVz; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 786eeac827ff11f1a39cd589f645bc18-20260325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xdMZjWji9nFqYASzvbuiMFqOqnfzah+ykLjiMoziX6Y=;
	b=tHNoZnVzOtpQLlfyiZ3EE+e1fPTd+DCdnxJ43hO+hW/gi03zPc24P8BX5PJ8P+5WBDaCP78RgqPYZqkVVn6YqbtlqB61n7Fnx03msx1IcUaTW+6x+sG4mobMLe5xWlUlkbTzFKhkjM7Tn2hKYJyx4zpl7hF+071tPpwer7uYQKI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:62044737-3f7c-45c7-9281-e2acb016570c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:f8451ad5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 786eeac827ff11f1a39cd589f645bc18-20260325
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 797751547; Wed, 25 Mar 2026 12:02:41 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 12:02:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 12:02:40 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
	Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH v2 0/2] Remove shift_pa from CMDQ jump functions (series 3/4)
Date: Wed, 25 Mar 2026 12:02:08 +0800
Message-ID: <20260325040239.2112517-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,collabora.com,ndufresne.ca];
	FREEMAIL_CC(0.00)[gmail.com,mediatek.com,chromium.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56940-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason-jh.lin@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:dkim,mediatek.com:mid]
X-Rspamd-Queue-Id: 18C9731F8E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series migrates the MediaTek SoC, DRM, and MDP3 drivers to the new
CMDQ APIs introduced for MT8196.

Series application order:
  1. [Series V2 2/4] Migrate subsystems to new CMDQ APIs (this series)
    - https://lore.kernel.org/all/20260325035836.2110757-1-jason-jh.lin@mediatek.com/
  2. [Series V2 3/4] Remove shift_pa from CMDQ jump functions
  3. [Series V2 4/4] Remove deprecated CMDQ APIs

Please apply this series after the MT8196 GCE support series,
and before the following series.

---

Change in v2:
1. Rebase on linux-next 20260324

---

Jason-JH Lin (2):
  soc: mediatek: mtk-cmdq: Remove shift_pa parameter from
    cmdq_pkt_jump()
  media: platform: mtk-mdp3: Use cmdq_pkt_jump_rel() without shift_pa

 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  2 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  2 --
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 -
 drivers/soc/mediatek/mtk-cmdq-helper.c        |  6 +++---
 include/linux/soc/mediatek/mtk-cmdq.h         | 20 ++++++++-----------
 5 files changed, 12 insertions(+), 19 deletions(-)

-- 
2.43.0


