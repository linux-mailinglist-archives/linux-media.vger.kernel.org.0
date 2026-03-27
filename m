Return-Path: <linux-media+bounces-57378-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MRYFUgEx2m5RgUAu9opvQ
	(envelope-from <linux-media+bounces-57378-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:27:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB33C34BF59
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60C6230532BF
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B143939AE;
	Fri, 27 Mar 2026 22:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nK6TKJuM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D2A34A788
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 22:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774650437; cv=none; b=puAjzf5fh04G+YL80wQXoi2rMPUO/RlXHV0LRpdMh7Lznh8w30yZCfmJcvHWc/ol+KyG5iRuuELutDG0yTlWpbYvsAA/LztYwYn6c7w+q3QaD0fyM6NBhYgs/nd/C6yWerqhFianA8DdEVz/o29DrBbxrEWHazF/orwIP81Yjqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774650437; c=relaxed/simple;
	bh=N2ffpG7GT211fQ5zkji6w7hKk/MOkCjKg7KQvmCllI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WvdEhZqKNrZ5LxU2J4wjGInDLQtNhpGv+mTpUDCjqiCmTJh2rxuppq7o/dQOS2dQJ21HjQ6/52cK08Z/6OPDLQ5f+76nM9a92Ze3faRQfphQKULfh7g5BG/tUb79okr3alCHB3l7wFUeD4Wje5DBxSLhJ+1ISyiQZ+eKo+XKvaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nK6TKJuM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so24304555e9.1
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774650434; x=1775255234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k97b44HDmjZh/vldQtsPrUOt0HFv7cy3dp+8tuieXWA=;
        b=nK6TKJuMX3SIbX6QbK/E74YzfyLwo5IxPeF94yKCqFmWgxrIs+hpykPsfbosJHXfFY
         8kOS3dVj996dqxTHWuTC69s06+aw0jqr2/ZpwLh7BollSDfAxOVFlof/fJ2bjY7eokop
         FxgEdlMwnG67Le2pfAvLOkpvNdNQuUQPBB8Itx6T5Nzt2zo18I6AdE6w37ARWBBNulIu
         8FY2DJyAFEMqX3r+SMvrOBaftthcLg2nv/km66iSO3MxPupSkqa/VhcrvrXoJzr2eiJp
         oBMwcuY4KCD1bDaQQZxd6qdts25X/Z9IkkIeToV13+Bid86Hd4Szuxxw4fXmhSK/53p5
         1C4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774650434; x=1775255234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k97b44HDmjZh/vldQtsPrUOt0HFv7cy3dp+8tuieXWA=;
        b=WkG/Q3plTZHqn8w+lnQifuI2LDd+o+rYo3RoCR7b+t+m/QxkGRYt4bWXW4UJCbzUXP
         hpVimIytFS7d6YVgA1TEkZliXC6oXmgwO1qSHrmkqylkYIxwFqrcH2Px2hPbZ/IWeyBY
         Jo+FT0KPGCobkiwUk0djGRVvZZEoqPynehMik2o99y07KxB1Yfy2IHH8s4ZtBeprjEBA
         +GrLhkiNNBxK7LmXV2j+IIJqbcIgdrO5NunRQyAoOFsGrr1G2zVlP7nFwTq7C/i23Si0
         NU8kCP2gw4I64/cvGvOQKjXLfZMY8lrkE+Rf+l5mb6Vx/CZmmmeTWFLt2JH9Rve06j36
         TCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1+ERI1Mwp/WZNVNzbvGQ8XQv4Xp1udg9okGK2qMcFYw8QF5QjCPC7dcBQMfI1e6NmrkYByTy7glZzZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVdDMrW/zA/mvtKH8noPX2xbwbhZg8iFhRgFgfJLC1yEZTk5JA
	Fwd/2n7WLbBOQE+p4RniG7C0uu2ZUL6qA9D0SeOGjVYGQJxbWWzRLZU5
X-Gm-Gg: ATEYQzzc7noHWqdawUbzJrjW3GynyLi2XVtuKGo2A6yD5w04ppneLaHRbXqs0kvOTwB
	qlUUSZT0bySz9CKsV1Xo51NzMIkfLfC1LcQWGi4FA1r6DmSbosjCkAKe7LRndwdsHJSpxcWjb39
	/pPEGSECyGEcHpv3Olb5EZd8/cxmH6w4x2k13YxAHRznk+LNYRFqwLgN+DhX/J8qszbYFzAxJTW
	jSafniGrSMQSPQfh/0HFPU1G0ykrPomxQT5cs29v75HYmCmrw1fKg37e4IxLNeS0qxAnYy8KjNz
	RLmtZvHKe7XoY+aIRY7BlwFuUxD0dPzz2+iCJo8AOTrd7V5Q+cX7/tDjXhBZLK2H7hVkkw17wet
	nIMgvD6Hh2ZCAf+p/kNWf9/vtmEUFCUZhX2JyhjumWhkNNP+AMt/I21exvHo6BeJWWCXX2BYfuj
	jvygpBOxJ+h7K3BnJ3DtPlut+5U3auvvJhhl3ywAA0kwOpz7oO7JXr3LpbhUzatDiU+EvCe7D3B
	bMEBEH+ECD6
X-Received: by 2002:a05:600c:45cd:b0:486:fbc4:8fe2 with SMTP id 5b1f17b1804b1-4872912dd2bmr59529345e9.15.1774650433771;
        Fri, 27 Mar 2026 15:27:13 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873062ec9bsm10062655e9.7.2026.03.27.15.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:27:13 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	jacopo@jmondi.org,
	aisheng.dong@nxp.com,
	guoniu.zhou@nxp.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: nxp: imx8-isi: fix memory leaks in probe error paths and remove
Date: Fri, 27 Mar 2026 22:27:11 +0000
Message-ID: <20260327222711.268132-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57378-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,jmondi.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB33C34BF59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
frees it on any probe failure path or in mxc_isi_remove(), leaking the
allocation on every failed probe and every normal unbind.

Additionally, when mxc_isi_pipe_init() fails partway through the
channel loop or when mxc_isi_v4l2_init() fails, the already initialized
pipes are not cleaned up — their media entities and mutexes are leaked.

Fix both by adding kfree(isi->pipes) to all probe error paths and to
mxc_isi_remove(), and cleaning up already-initialized pipes in the
err_xbar error path.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISP Channel driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 4bf8570e1b9e..ab32c5b6ac9c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -490,33 +490,43 @@ static int mxc_isi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
-	if (isi->num_clks < 0)
+	if (isi->num_clks < 0) {
+		kfree(isi->pipes);
 		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
+	}
 
 	isi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(isi->regs))
+	if (IS_ERR(isi->regs)) {
+		kfree(isi->pipes);
 		return dev_err_probe(dev, PTR_ERR(isi->regs),
 				     "Failed to get ISI register map\n");
+	}
 
 	if (isi->pdata->gasket_ops) {
 		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
 							      "fsl,blk-ctrl");
-		if (IS_ERR(isi->gasket))
+		if (IS_ERR(isi->gasket)) {
+			kfree(isi->pipes);
 			return dev_err_probe(dev, PTR_ERR(isi->gasket),
 					     "failed to get gasket\n");
+		}
 	}
 
 	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
 	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
 
 	ret = devm_pm_runtime_enable(dev);
-	if (ret)
+	if (ret) {
+		kfree(isi->pipes);
 		return ret;
+	}
 
 	ret = mxc_isi_crossbar_init(isi);
-	if (ret)
+	if (ret) {
+		kfree(isi->pipes);
 		return dev_err_probe(dev, ret,
 				     "Failed to initialize crossbar\n");
+	}
 
 	for (i = 0; i < isi->pdata->num_channels; ++i) {
 		ret = mxc_isi_pipe_init(isi, i);
@@ -538,7 +548,10 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	return 0;
 
 err_xbar:
+	while (i--)
+		mxc_isi_pipe_cleanup(&isi->pipes[i]);
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
+	kfree(isi->pipes);
 
 	return ret;
 }
@@ -556,6 +569,7 @@ static void mxc_isi_remove(struct platform_device *pdev)
 		mxc_isi_pipe_cleanup(pipe);
 	}
 
+	kfree(isi->pipes);
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
 	mxc_isi_v4l2_cleanup(isi);
 }
-- 
2.53.0


