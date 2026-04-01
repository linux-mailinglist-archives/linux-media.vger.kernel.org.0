Return-Path: <linux-media+bounces-57848-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN3JA/HszGk/XwYAu9opvQ
	(envelope-from <linux-media+bounces-57848-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:01:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F3537824C
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C225307C0FF
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 09:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC6E3C140F;
	Wed,  1 Apr 2026 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I11Ud/2f"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9BD3C342A;
	Wed,  1 Apr 2026 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036744; cv=none; b=HjnDHm783S+bBYNaL73Nyo3FUVBmNmC40d1oUaoTOsJdQvi6DFPsJZwd8lRjfFPPFnGFVxm77UZMIS09xhWyBzC6KFSQ7+4fOZkTqr0YBuW5dkbCOTnzqb58cLAYmoge6Oy6pqZaDuZluXeUOv7VdfHUYq9lf1QFdZHb3vSrX4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036744; c=relaxed/simple;
	bh=d59Vvq+IUOLgliXQPlQq76Luy0alKaQ2aX44NWQeWlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g7x02ReYkLu73r18gzzRksmGHcb2VQCT5mzx2yYx0xTgd7JirdHVAuAqwxJ/5RYSYZtUrVLekTdlR0BGlWDxBz8zTPVDrcLsByhheia5HdITq++Atr/2yE4428yv3GI949DVzwZz1+1+D4Yv1EO+ptx76eJ/wkcw0hiFohtN2Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I11Ud/2f; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775036740;
	bh=d59Vvq+IUOLgliXQPlQq76Luy0alKaQ2aX44NWQeWlI=;
	h=From:Date:Subject:To:Cc:From;
	b=I11Ud/2f41YKWZ8Om2tBAC/Ek+BcmwXc69hq0zcuK3AEQtpNge8HAsnizflFJPxkA
	 96VXJxsQW1h9wAiuUMORZ5H6BCTRZPMuvMJ0GYOUI1iaBMEWMdn9JYowgE3Lbgkyf1
	 U5dkcJXayM9y9b9uuzcAMGDk/GA1KLdDw6F9zRqcfgG5uC2JSb3g3CMELdrNoknDmi
	 DE2PTX+5p/yZUqdigz6SiJcNa9qF8bEIMzKO1h2BCjRKAy2ziO8vsWlNQFlVkodrW1
	 8HHrxNQD4pLHbHH1kXOVUybUFqlTdZB4ran93ZSahgoivKnB6kHnSe52NqP2RkOIt2
	 /eCtF3A0Vz/xQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74FBB17E759A;
	Wed,  1 Apr 2026 11:45:39 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Apr 2026 11:44:15 +0200
Subject: [PATCH] media: mtk-jpeg: cancel workqueue on release for supported
 platforms only
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-mtk-jpeg-release-issue-v1-1-2271a1779340@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN2w6CMBBEf6XZZzdpizf4FcJDhRVXbcFuMSSEf
 7fC45nJmVlAKDIJVGqBSF8WHkIGc1DQPlzoCbnLDFbbsz5qgz698DlSj5He5CT3IhNhdy2tKS/
 a2ZOGLI+R7jxvw3Wzc6TPlPfTHsLtL7eD95wqFWhOuH0UhYFmXX/AAkBxmQAAAA==
X-Change-ID: 20260401-mtk-jpeg-release-issue-d8921970a250
To: Bin Liu <bin.liu@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775036739; l=2803;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=d59Vvq+IUOLgliXQPlQq76Luy0alKaQ2aX44NWQeWlI=;
 b=fYdV0Isw9rPolpF51EkIAXenhPIyyvue9pwR6ZLlxJqtdB2oY7GFZ4+8ZOP6y1rO9Mi5feQJK
 CiH4s6Oug6GCXdBXrCtsPrA0+M4tPQk+yWcCnZoZ0TLfmKwQxUZusJM
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57848-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,zju.edu.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[louisalexis.eyraud@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38F3537824C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since a recent fix the mtk_jpeg_release function cancels any pending
or running work present in the driver workqueue using
cancel_work_sync function.
Currently, only the multicore based variants use this workqueue and they
have the jpeg_worker platform data field initialized with a workqueue
callback function. For the others, this field value remain NULL by
default.
The cancel_work_sync function is unconditionally called in
mtk_jpeg_release function, even for the variants that do not use the
workqueue. This call generates a WARN_ON print in __flush_work because
the workqueue callback function presence check fails in __flush_work
function (used by cancel_work_sync).

So, to avoid these warnings, call cancel_work_sync only if a workqueue
callback is defined in platform data.

Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release path due to uncancelled work")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Patch to fix the following warning that occurs on boards such as
Mediatek Genio 510-EVK:
```
WARNING: kernel/workqueue.c:4291 at __flush_work+0x320/0x340, CPU#1:
  v4l_id/409
...
Call trace:
 __flush_work+0x320/0x340 (P)
 cancel_work_sync+0x6c/0x9c
 mtk_jpeg_release+0x2c/0x84 [mtk_jpeg]
 v4l2_release+0x8c/0xe8 [videodev]
 __fput+0xcc/0x2e0
 fput_close_sync+0x40/0x100
 __arm64_sys_close+0x38/0x7c
 invoke_syscall+0x54/0x10c
 el0_svc_common.constprop.0+0xc0/0xe0
 do_el0_svc+0x1c/0x34
 el0_svc+0x34/0x108
 el0t_64_sync_handler+0xa0/0xf0
 el0t_64_sync+0x198/0x19c
---[ end trace 0000000000000000 ]---
```

It is based on linux-next (tag next-20260331) and has been tested on
Mediatek Genio 510-EVK (mt8390) and 1200-EVK (mt8395) boards.
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 8c684756d5fc2524da3a67f67f0fdda894b676fc..d147ec48308110ae8520662e182dc0445447d8d0 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1202,7 +1202,8 @@ static int mtk_jpeg_release(struct file *file)
 	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
-	cancel_work_sync(&ctx->jpeg_work);
+	if (jpeg->variant->jpeg_worker)
+		cancel_work_sync(&ctx->jpeg_work);
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);

---
base-commit: e5da3eef8dadab4e98b228725ca8948edd9d601f
change-id: 20260401-mtk-jpeg-release-issue-d8921970a250

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


