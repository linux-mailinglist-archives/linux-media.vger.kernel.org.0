Return-Path: <linux-media+bounces-56935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A1SLJBdw2m1qQQAu9opvQ
	(envelope-from <linux-media+bounces-56935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 04:59:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC8731F57E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 04:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8C15305807D
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 03:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498FC2EDD62;
	Wed, 25 Mar 2026 03:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="I63Zx87a"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812CF2D5950;
	Wed, 25 Mar 2026 03:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774411132; cv=none; b=Jf2xNLYJK5dUOuR0ohs8E/s+4yq27LvCxHBp0GzmtCBQpJM8fnoUk7P8x4NI3x3Zxzf/fGC9y9Co8tchKIHOYVNjolnVg03v862+GkpzFj4CRaJWEHAbfPQsUR+uOZyUK2DL/s/BxIeWthyNEYo0TQMeh0KSDyMM3kKf9M/ZIpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774411132; c=relaxed/simple;
	bh=pBYi0QyxZkUhIoE/ZkcJ4VYYr593hQwCZVyAWSQz6TQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Htu/+f5Awb9/PJabVfI9biXr6ZD9zWWenOAid9MxQYiLsjDX2IzJjp/0aJDJL/rqcTj+eeTMs5G7uj6WXR/WrnFQEbdjzlHO7dL6Vk3thuAfvOR9OqQCj5Pzn601l1LMcRfmoQi4ZK8wml26bfzQycHPwTK8xpxga3uvv7sChr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=I63Zx87a; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ebd2cf1c27fe11f1a02d4725871ece0b-20260325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=D+YQ3c1JxIPYJ6rQ2JZt6TXgpTOOwn4ufLcw8yJ1Rec=;
	b=I63Zx87aDFNeZwSnUgv0knTcb6E4dj23SDMjK2hxEw8JUTJ+XUHS2ehqeWLZjhLnSNrwIp/GtQf1fYKHn0LBIdlcaegyBhkuqEFHLxRiDWJ6WrDGPKaQ1EPZW1dXDSCoxT2AZJGIUzq1E+RGigLuQOVJjB6Psbzj7vDOsiUKczE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1c38b843-ec1d-4d82-9e6d-6c0073fce575,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:a53faa8e-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ebd2cf1c27fe11f1a02d4725871ece0b-20260325
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1502807647; Wed, 25 Mar 2026 11:58:45 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 11:58:44 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Mar 2026 11:58:44 +0800
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
Subject: [PATCH v2 4/5] media: platform: mtk-mdp3: Refactor CMDQ writes for CMDQ API change
Date: Wed, 25 Mar 2026 11:57:41 +0800
Message-ID: <20260325035836.2110757-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
References: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,collabora.com,ndufresne.ca];
	FREEMAIL_CC(0.00)[gmail.com,mediatek.com,chromium.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56935-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:dkim,mediatek.com:email,mediatek.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7CC8731F57E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update CMDQ register writes to use subsys-aware APIs,
cmdq_pkt_write_subsys() and cmdq_pkt_write_mask_subsys().
This conforms to recent CMDQ API changes that split access by
subsys ID support.

Since all current MDP SoCs support subsys ID, and future MDP
deployments will not run on SoCs without subsys ID, only
subsys-specific API calls are needed. No logic for non-subsys ID
hardware is required.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 4 ++--
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index d30a05782ab9..8dff981f6720 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -321,7 +321,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	/* Enable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, set->value);
+		cmdq_pkt_write_subsys(&cmd->pkt, set->subsys_id, set->reg, set->reg, set->value);
 	}
 	/* Config sub-frame information */
 	for (index = (num_comp - 1); index >= 0; index--) {
@@ -376,7 +376,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	/* Disable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, 0);
+		cmdq_pkt_write_subsys(&cmd->pkt, set->subsys_id, set->reg, set->reg, 0);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 681906c16419..c6fc180950f2 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -12,14 +12,14 @@
 #define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask)	\
 do {								\
 	typeof(mask) (m) = (mask);				\
-	cmdq_pkt_write_mask(&((cmd)->pkt), id, (base) + (ofst),	\
-			    (val),				\
+	cmdq_pkt_write_mask_subsys(&((cmd)->pkt), (id), (base),	\
+				   (base) + (ofst), (val),	\
 		(((m) & (ofst##_MASK)) == (ofst##_MASK)) ?	\
 			(0xffffffff) : (m));			\
 } while (0)
 
 #define MM_REG_WRITE(cmd, id, base, ofst, val)			\
-	cmdq_pkt_write(&((cmd)->pkt), id, (base) + (ofst), (val))
+	cmdq_pkt_write_subsys(&((cmd)->pkt), (id), (base), (base) + (ofst), (val))
 
 #define MM_REG_WAIT(cmd, evt)					\
 do {								\
-- 
2.43.0


