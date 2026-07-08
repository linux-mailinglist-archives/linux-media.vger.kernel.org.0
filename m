Return-Path: <linux-media+bounces-66979-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id btr6NNtATmrXJgIAu9opvQ
	(envelope-from <linux-media+bounces-66979-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:21:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAF3726417
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:21:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZUgjjI2Z;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66979-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66979-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8762301AC13
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 12:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399AD43CEC0;
	Wed,  8 Jul 2026 12:21:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736E043DA5C
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 12:21:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513294; cv=none; b=l7mpUZKhJv6rSExG9BTPBduUI1C1IHaSPERIYL55DbYym22cP5t+KV5bRbvKUPsZcOL/HURWUe3xRf957o0WttutZTMN3Jb5TOSFNg+vN0Ip0uo3izM2MpZ/az8feeNUzWRe5frFTBv+T2U32Kz+XIc9+a1RO8hJn1xB2pvsqqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513294; c=relaxed/simple;
	bh=VSjJRv5pT9noiuPBktUl4A0jxzg5vhCXHVo8RLXR4wE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N4Rx6RKu0OKdSBewJNibqFh/6PiBlvCEBDNm0pq7ufILLvetoq3xWmFMWQF06E2UVDB72D0/Ak4gBZ7gRkNtGZ/sPleNJ7b3ILVfgpoWY/zVbNqiFRkiiXfxzjJl5CP7g+3IT34DSwvGUCQKerfswjQ7ISd1c+qnvBIgDPYdJ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUgjjI2Z; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc891373e0so5593995ad.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 05:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513293; x=1784118093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bsvd183HUzNrbaQaZyJehydG+OJhqnijLN4x6jt8zdI=;
        b=ZUgjjI2Zs6JAJ/VSMzXvfu3Y/Jp/DygN41pA3qLIdMacBr6WY16kcLnoudc3Vku6K1
         SEzuEst7jqbccgYROQqnx+FhHZEVW7eTcl2J4iR1marYQ4/5scMi7/0OSD0ZdHRDr+8F
         CFNjCtdWqqlBJULcMRubvqIzPbUhzO529/P9pygntyi5wNSVq8paMQX36HaoR41Qmjqy
         UgKzZaF3toK+fWcNJUeK3Vjy+LvBYQHqPt0QyHHPpmqkPIgg9K4Xa9gn9Z40/3cwpkYW
         fR6ubB8RCeefFNH4fwgYFAganaLI0/H0qZo/sBiCRvMltxhtkmu0patg+/qcvv0FYaBX
         uS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513293; x=1784118093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bsvd183HUzNrbaQaZyJehydG+OJhqnijLN4x6jt8zdI=;
        b=Om3P9aDPraOHJPLZF2kF/tzzkyhEShqTzKVxdq7/imNyVgz0AYKJYpHT0WWuhdIFaV
         k2H6n46yi9MXz7NdzWYmrCHKlfQmt9q4jKbOWgKAKSqPkznJ0DE484d55ofWvCwkL8+c
         Jfo5KI5LxR3pkoINliE7Fj3tsPOJq4BBiV2vQkTJkQXGPp2ikm3HAJyjX1Tjj9MrX5a1
         ra+C64A1PmoRK+dpMiHVx5vsjgX7Ad9f0jj5LWVzTJY9f+BjLEs8bzvVOel7Pm/s/yUI
         XvrGOacETrY5j+kNcou3msWBWRAWWFZhCfqrFG3dzE5pU+FuU/ueKt1zIWocgl8GFQoc
         tUzw==
X-Forwarded-Encrypted: i=1; AHgh+Rqr9rHNhCDpo6tCEPYljlEJCH6DhF+jVMq/VZKDSqqH0WZhytilQGABia+K/y/PmQYynAkg3uRseyFcGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPE+vFL54oBygCanDkUE/J0ytrqCPmZgJK2OnDbToUkBwdfR37
	GnvSSvLBJA3mBnaBathB14UQz0qgeRlA/blDdhrGIP9yOOLqjm+I9qrx
X-Gm-Gg: AfdE7cnebKBHMNLby9rLTdpRvbvD/JsKPdEJyI3272twJqlxw+47PVIkr2HTabyvzu3
	+WW6/wlNZugwIpXuCboQLmZXqS+ksbhFMc3XjsLaDNwI7PPlX/LE8OSBrokVHu9yw7ollG+OE3k
	iCs9SWxWImRxb4rnGORtn6ogst2F7MQIRJ+FemvtFJvr3oSqn9TCQt/HUTEYKk9R0Sl5TZMaJFy
	8WOXpTpi7qZ/ryQbfV1az1JLLB4ie1ndm11yJ70MxyZFKUSO86PNvVZ7l0DSnhHcfHAIaLasUeb
	n3Wrkru6cH9JZwIYZNmW9cjrLsenM+Czc2Ad0QwrJeFkv3/73+jDt5mRqpfk47d8fmW5aVuQ3D3
	ox3vHHNCsb3w8l8ky8vrr+RlMwdEQrA3feZ/FQE9nADI+9G80/CLk9UlWX5a9ngwWQMAWamY=
X-Received: by 2002:a17:902:ff8e:b0:2ca:329:3da1 with SMTP id d9443c01a7336-2ccea3ca5eemr24449855ad.16.1783513290120;
        Wed, 08 Jul 2026 05:21:30 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d474sm27620135ad.70.2026.07.08.05.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:21:29 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Eizan Miyamoto <eizan@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: mtk-mdp: unregister VPU watchdog handler
Date: Wed,  8 Jul 2026 20:19:10 +0800
Message-ID: <20260708121910.758166-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66979-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,chromium.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:andrew-ct.chen@mediatek.com,m:mchehab@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:tiffany.lin@mediatek.com,m:yunfei.dong@mediatek.com,m:hverkuil@kernel.org,m:eizan@chromium.org,m:eballetbo@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:lgs201920130244@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FAF3726417

mtk_mdp_probe() registers the MDP reset handler with the VPU watchdog
code and passes the MDP device as the private data.

The handler is stored in the VPU device and can outlive the MDP probe or
remove path. If probe fails after the handler has been registered, or if
the MDP device is removed, the VPU watchdog table can keep a pointer to
an MDP object that is about to be released. A later VPU watchdog reset can
then call mtk_mdp_reset_handler() with a stale pointer and dereference
freed memory while queuing the MDP watchdog work.

Add a VPU watchdog unregister helper and clear the MDP watchdog handler
from both the probe error path and the remove path before dropping the VPU
device reference.

Fixes: ee18fc7b0b95 ("media: mtk-mdp: handle vpu_wdt_reg_handler() errors during probe")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../media/platform/mediatek/mdp/mtk_mdp_core.c    |  2 ++
 drivers/media/platform/mediatek/vpu/mtk_vpu.c     | 15 +++++++++++++++
 drivers/media/platform/mediatek/vpu/mtk_vpu.h     |  2 ++
 3 files changed, 19 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 8432833814f3..5ccb7aa925d9 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -221,6 +221,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	return 0;
 
 err_reg_handler:
+	vpu_wdt_unreg_handler(mdp->vpu_dev, VPU_RST_MDP);
 	platform_device_put(mdp->vpu_dev);
 
 err_vpu_get_dev:
@@ -254,6 +255,7 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+	vpu_wdt_unreg_handler(mdp->vpu_dev, VPU_RST_MDP);
 	platform_device_put(mdp->vpu_dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..5dc50a658c2b 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -437,6 +437,21 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(vpu_wdt_reg_handler);
 
+void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
+{
+	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
+
+	if (!vpu || id >= VPU_RST_MAX)
+		return;
+
+	mutex_lock(&vpu->vpu_mutex);
+	vpu->wdt.handler[id].reset_func = NULL;
+	vpu->wdt.handler[id].priv = NULL;
+	mutex_unlock(&vpu->vpu_mutex);
+}
+EXPORT_SYMBOL_GPL(vpu_wdt_unreg_handler);
+
+
 unsigned int vpu_get_vdec_hw_capa(struct platform_device *pdev)
 {
 	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
index 3951547e9ec5..2ccb481a04cf 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
@@ -141,6 +141,8 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 			void vpu_wdt_reset_func(void *priv),
 			void *priv, enum rst_id id);
 
+void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id);
+
 /**
  * vpu_get_vdec_hw_capa - get video decoder hardware capability
  *
-- 
2.43.0


