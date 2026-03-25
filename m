Return-Path: <linux-media+bounces-56943-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNcvCJlfw2m1qQQAu9opvQ
	(envelope-from <linux-media+bounces-56943-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 05:07:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE4831F794
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 05:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 041CC305D0FA
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 04:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17B82F2914;
	Wed, 25 Mar 2026 04:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GknNOrM1"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673BF2D5950;
	Wed, 25 Mar 2026 04:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774411507; cv=none; b=bmHfCOas2v2F3ni1xZz22j4lThUfCE5QVdxydvKgxntlvt/NhnUEB1j6YSFnUyL43KkfjSFL641Sndx8eMGX0okl9r+vjWl+0JMrbk9Naojnm2ydcE8X38vC5u/VbPoCpCiYZS+rWA0g7ouEnIEZIl1qKIcyF7t3Xv6G4et6YOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774411507; c=relaxed/simple;
	bh=OKAC+vqoPH4G4aFuN7LdkobqRd8Cvd2aSwcL3g/1kHw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cS3+YK8MsslVw4cajjQJv6TZ/cfP8e8a3LqvfBUKRlVzsG0qG3Rfb3dX/2eSQmUpmy8jBP24WVmkZV31ACW5R2Sd41K/QznHcjQXb+4aMIJp6jrzwJibKWtr5UZIKoATYiQFuZYuM7CiG8XZOSwYwoHkB+FQegIh5PFbPfAqMhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GknNOrM1; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cacf79ae27ff11f1a39cd589f645bc18-20260325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=e+46r3Yi/z7wZ4y5BUiRO0AV6aK9RmoAXly/Gf3gLZg=;
	b=GknNOrM1WVH+zUhPgRMOX9OHxDCZmt5AJlWp72qjMqM8lMMYsdZ9E8/r5WHG34rtSih99l84zDPbfilcoeYOX3ipP+emGJwji3fHZcMPuLUM0y61hQgeRCw9L7KDGUVGbniLWGqyjZOhqO3+j1THSCnI1QhKNoZCi3VFnNCnrfU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:866c456c-2c52-4560-9edf-e935aa5e08ed,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:e7bac3a,CLOUDID:414c1ad5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	3|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cacf79ae27ff11f1a39cd589f645bc18-20260325
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 165407874; Wed, 25 Mar 2026 12:04:59 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 12:04:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 12:04:58 +0800
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
Subject: [PATCH v2 3/3] mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()
Date: Wed, 25 Mar 2026 12:04:22 +0800
Message-ID: <20260325040457.2113120-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260325040457.2113120-1-jason-jh.lin@mediatek.com>
References: <20260325040457.2113120-1-jason-jh.lin@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,collabora.com,ndufresne.ca];
	FREEMAIL_CC(0.00)[gmail.com,mediatek.com,chromium.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56943-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,mediatek.com:dkim,mediatek.com:email,mediatek.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BDE4831F794
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since the mailbox driver data can be obtained using cmdq_get_mbox_priv()
and all CMDQ users have transitioned to cmdq_get_mbox_priv(),
cmdq_get_shift_pa() can be removed.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       |  8 --------
 include/linux/mailbox/mtk-cmdq-mailbox.h | 12 ------------
 2 files changed, 20 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index d7c6b38888a3..f463f443e834 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -123,14 +123,6 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
 }
 EXPORT_SYMBOL(cmdq_get_mbox_priv);
 
-u8 cmdq_get_shift_pa(struct mbox_chan *chan)
-{
-	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
-
-	return cmdq->pdata->shift;
-}
-EXPORT_SYMBOL(cmdq_get_shift_pa);
-
 static void cmdq_vm_init(struct cmdq *cmdq)
 {
 	int i;
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 07c1bfbdb8c4..a42b44d5fd49 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -96,16 +96,4 @@ struct cmdq_pkt {
  */
 void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv);
 
-/**
- * cmdq_get_shift_pa() - get the shift bits of physical address
- * @chan: mailbox channel
- *
- * GCE can only fetch the command buffer address from a 32-bit register.
- * Some SOCs support more than 32-bit command buffer address for GCE, which
- * requires some shift bits to make the address fit into the 32-bit register.
- *
- * Return: the shift bits of physical address
- */
-u8 cmdq_get_shift_pa(struct mbox_chan *chan);
-
 #endif /* __MTK_CMDQ_MAILBOX_H__ */
-- 
2.43.0


