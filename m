Return-Path: <linux-media+bounces-66983-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8OW0G9ZGTmotKAIAu9opvQ
	(envelope-from <linux-media+bounces-66983-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:47:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9767266EE
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:47:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=h3H2Td5p;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66983-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66983-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A929302D518
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 12:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE95744E044;
	Wed,  8 Jul 2026 12:42:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB2A44212E
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 12:42:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514571; cv=none; b=TMTOydCJa3v+cpG94bjyl4MkZfZHfpSyk3td74rY3NbW/lxkNQGeoMd97C3rLX3wAfFLusbqjO5j1G2TxCNbMlNBcO4AWhgPgs1ajDNkRRpUhxAQEdW/XZBi9B03nr8PtlEQIFAIroWr7UGoZgF5Jc60YvzJyKD1j7paR93rw+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514571; c=relaxed/simple;
	bh=4Q7/tbUDulKiSLcXZsYlVZ442AGYNyingp0ky/+PJA0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=GlCxVqIniUxaOgvXTyTC8AzvP+7vVUWzHu7/7s/7KtIwDZRzIKdchkS2S7CM9TIygnNsDBznzZpecnX3brNnKd0aeBId7fTSTAqkv7LwBaJzxN0Ncu7VehpNGiRQjZNR1zQ5DNePBBKKeoKa/Lb7cYavnELQFdU1S9H+wPkdy5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3H2Td5p; arc=none smtp.client-ip=209.85.210.179
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845ea8924a2so639628b3a.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783514569; x=1784119369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeTFZKGeXcKtdGzHWtUv5E1DeHN3B2mS7xb47BxMxw0=;
        b=h3H2Td5pJOhyeG0DiSBuRwdEnm0VRWzIdBd1I7OmjBoWz5kieaY5ZVeZIVcqR4g1nX
         yv3A8+bv3Ug9rQuAni7MMP2gEFX3WzWLq48enaGq/f6FMtXSFLaNfCF3cjO3OnpizkhE
         7Gp2pJmRCNOYoAC3fGdJEqDuBGE7hgSBJ/koubZEcFluxY4cfX8QcaWxEFRQb/rczjdX
         Cm1QHQ6pXaXRFlhijQ0I6wqqRB9WecktRkbHZN335wQti+PubYMm65BFNA8tzuUjwQaF
         14+9gQ32s5Y+i3xriQUdAb6lB0TsYdNZ8U0OSkVTYe3u2Q1mMCBA5nYKCPk6C6DzziOv
         c0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514569; x=1784119369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeTFZKGeXcKtdGzHWtUv5E1DeHN3B2mS7xb47BxMxw0=;
        b=fffLkSOvl+x7ZEzQEQblGgw75i2qqiSX6VkowlW/pUaMkkGDaRRUowlJPbYk/DT8oL
         bKPLGuuPWFluTBmO7QSSfY1K5R8A9dmB9PLnMCTbcmL/0Iok7/u6kiApVxXARaGXn8/i
         BePatesK+ojfjOfXffX338Z/slvPDzllLjU8CQiOYI5qDmUrtO4ujPScp9QQagzkb8wD
         D/ffRVCkesb5NrOi/ccosBoV9j3MAOPjg0pBX+62+zkQ0jPTTNw83la/Sz4EERts9G2z
         t7F7ibMw9kF64aFQ/l0AhcIiODy8XddFz+UzprGDv7GWdB4uN83vUWcVeQb17Nwwc/E9
         TpaA==
X-Forwarded-Encrypted: i=1; AHgh+RqNdKGFir8pA7/F1j/4Z04nlTVtz8QDNDR7Pqnbo1PFpGJvIl8HDqcCFlzkOYDS2Ec/MAIOk4hUoU+yRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgzcRcQ4bhCwWTIcuKrFPTQdd+oAiezJPosLpMUBj+/auKNg3H
	Y/sa031CecUuO4nEJwIzDmUn28zMi2wnu4Ab1w4kYsc4ALdQzFUBfyEq
X-Gm-Gg: AfdE7cnDyzTvSfyw2l43bHZJkYaNShVvxGm39/HsRoE5CljOgiC6OezQ4bT7s1z80Tg
	jxwEaEGE26ijCDMfPQBXBw7rPL3nIZcsQGX13rkaVNzRWvsZOXygvWUq6CEPga7S/VaL9LwCai5
	GQ4CymoE6/Nw55L+ADxMa+iiRdxB05SjwD7D6dDXARnKRvZl5M3hAJm7CAaXnwALRA5ZZA2/rX/
	uT4jNqhfev69xVU55xFQuq80qH7kQgOPB01lhTqFmIxktLup6jEpNWBD87U8+ajTLFGSi5yIa+e
	LtN1xATfiTmqTyD3ohQQP5iAy9HpTs6JJv36SuZFqdhfufDDslXtW70mMQh1JlJwTbExVoegQQB
	oknhVWRshOMN6IIv13vMC8C0GXo/2EYWVTi0wSDe9UlVyebpLtfjl59Nv7/Ke8UvTHUWr1vNHGZ
	NBLA==
X-Received: by 2002:a05:6a00:3021:b0:847:8b1d:22fe with SMTP id d2e1a72fcca58-8484341100bmr2523607b3a.50.1783514568759;
        Wed, 08 Jul 2026 05:42:48 -0700 (PDT)
Received: from lgs.. ([101.36.106.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c2casm6963729b3a.43.2026.07.08.05.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:42:48 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: unregister VPU watchdog handler
Date: Wed,  8 Jul 2026 20:42:35 +0800
Message-ID: <20260708124235.763036-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66983-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:mchehab@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:nicolas.dufresne@collabora.com,m:hverkuil+cisco@kernel.org,m:tfiga@chromium.org,m:lgs201920130244@gmail.com,m:wenst@chromium.org,m:haoxiang_li2024@163.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,chromium.org,163.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D9767266EE

mtk_vcodec_fw_vpu_init() registers a VPU watchdog reset handler and
passes the vcodec device as the private data.

The handler is stored in the VPU device and can outlive the vcodec
device. If firmware initialization fails after the handler has been
registered, or if the vcodec device is later removed, the VPU watchdog
table can keep a pointer to a vcodec device that is about to be released.
A later VPU watchdog reset can then call the reset handler with a stale
pointer and dereference freed memory while walking the vcodec context
list.

Add a VPU watchdog unregister helper and clear the vcodec watchdog
handler from both the firmware initialization failure path and the VPU
firmware release path before dropping the VPU device reference.

Fixes: 01abf5fbb081 ("media: mediatek: vcodec: separate struct 'mtk_vcodec_ctx'")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c    |  4 ++++
 drivers/media/platform/mediatek/vpu/mtk_vpu.c     | 15 +++++++++++++++
 drivers/media/platform/mediatek/vpu/mtk_vpu.h     |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index 3632037f78f5..c79a78c371ea 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -40,6 +40,9 @@ static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
 
 static void mtk_vcodec_vpu_release(struct mtk_vcodec_fw *fw)
 {
+	vpu_wdt_unreg_handler(fw->pdev,
+			      fw->fw_use == ENCODER ? VPU_RST_ENC :
+				       VPU_RST_DEC);
 	put_device(&fw->pdev->dev);
 }
 
@@ -120,6 +123,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
 	if (!fw) {
+		vpu_wdt_unreg_handler(fw_pdev, rst_id);
 		put_device(&fw_pdev->dev);
 		return ERR_PTR(-ENOMEM);
 	}
diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..f59f45fecc75 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -437,6 +437,21 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(vpu_wdt_reg_handler);
 
++void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
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


