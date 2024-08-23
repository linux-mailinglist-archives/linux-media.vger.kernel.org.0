Return-Path: <linux-media+bounces-16680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32B95D879
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 23:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D69A1C2191F
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 21:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1601917DA;
	Fri, 23 Aug 2024 21:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="Ga1rBetl"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8CD1C8FBC;
	Fri, 23 Aug 2024 21:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724448716; cv=pass; b=o4O1KIHo1CPrbdI5P1K+B9dTdYYuwvkDzCcfe0+cHjE8G6nVUX/puW8/TDB4V/Sr/bHihQhYX0esYVaG1AFz4HdxVTfpHtqwFNGCERDrqA0hAAjzxslM3P2rycs5cCjtzplI3inGRNeWOqH8oo7/zmURhz4a17+IAj7XWwk6+8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724448716; c=relaxed/simple;
	bh=Bo6rQzkZtS3x3e4JPLfvWkMk8vfJdNw3tSqb/DecZE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=poazaoyscg81X3rsoBnR/NZ3hoYUd5Zu6kUGIpeH65pcdgX9T9rlPtQJKgYkebaAJpxrmBor1eQzLu5Id/8D9BHZjN4mkkPUZB/brlKXI8JFuk6+3hs8N4hI344MJjgidAek+F5SetK+QMhyDY/nSOjuVbxyuxX/UTQbfHVFfMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=Ga1rBetl; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: angelogioacchino.delregno@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724448703; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DDQQRYhhiCJGa3UUoM7LJWgJ8tuzXpfaQnsXeBG8Uo733fPrsYIqg5Qp0MDIqENVlDpR/oKD4W4J6A+FrYLKNYo/fneHg9ic6NanxqEI85YG1nf5r9lxz8DMDgkffDaAZMNm2QDnVxuCy9ZERpcGfuPjLClOrlg1qtjFLDig/VA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724448703; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bghG0Z8WKTUpCr2IR0n/BuI53Cd5ntTMy8ZyoEuZYcs=; 
	b=kE9VEII0s0o3G0t3sERmqizCAR6ToobopklZb/SZ/rJHBqrXzcaSpmox0BPUiIuFCRHeLFG+EOrLbWSyzZQW6AN9mZP+TfuV2Sh7cVopBrqwxicsRFlTQgTjQ05x2xsyj3ee6zOQjqODTP/5nt+J+SoyVm3OT2l2bVmzqnikL0k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724448703;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=bghG0Z8WKTUpCr2IR0n/BuI53Cd5ntTMy8ZyoEuZYcs=;
	b=Ga1rBetlEZVoSEzxsmjSO/OCtfcBeNwUjffIADkql65TyuOw9pAMusOzD7i+ySLj
	wGAw/FevS8+1dIJW99ffXbDJE6VzDyr14hEl66caZcyJ83/U43DlHwg0kLVNxsn8tS7
	Tng6Xpd/++YodL0tA0rgN1QC5D2a16SI5SPzPlC0=
Received: by mx.zohomail.com with SMTPS id 1724448702562223.08283998342017;
	Fri, 23 Aug 2024 14:31:42 -0700 (PDT)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 23 Aug 2024 17:31:24 -0400
Subject: [PATCH 4/4] media: platform: mtk-mdp3: Remove mask parameter from
 MM_REG_POLL macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240823-mdp3-comp-cleanups-v1-4-1f8c1395ecd3@collabora.com>
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.1
X-ZohoMailClient: External

Just like was done with MM_REG_WRITE, remove the mask from the
MM_REG_POLL macro, leaving MM_REG_POLL_MASK to be used when a mask is
required, and update the call sites accordingly. In this case, all calls
require a mask, so MM_REG_POLL remains unused, but at least this makes
the MM_REG_POLL macros consistent with the MM_REG_WRITE ones.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c |  8 ++++----
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h | 13 +++++--------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index beb29ad0b048..683c066ed975 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -78,7 +78,7 @@ static int init_rdma(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 
 	/* Reset RDMA */
 	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_RESET, BIT(0), BIT(0));
-	MM_REG_POLL(cmd, subsys_id, base, MDP_RDMA_MON_STA_1, BIT(8), BIT(8));
+	MM_REG_POLL_MASK(cmd, subsys_id, base, MDP_RDMA_MON_STA_1, BIT(8), BIT(8));
 	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_RESET, 0x0, BIT(0));
 	return 0;
 }
@@ -634,14 +634,14 @@ static int init_wrot(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 
 	/* Reset WROT */
 	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_SOFT_RST, BIT(0), BIT(0));
-	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, BIT(0), BIT(0));
+	MM_REG_POLL_MASK(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, BIT(0), BIT(0));
 
 	/* Reset setting */
 	if (CFG_CHECK(MT8195, p_id))
 		MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL, 0x0);
 
 	MM_REG_WRITE_MASK(cmd, subsys_id, base, VIDO_SOFT_RST, 0x0, BIT(0));
-	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, 0x0, BIT(0));
+	MM_REG_POLL_MASK(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, 0x0, BIT(0));
 	return 0;
 }
 
@@ -871,7 +871,7 @@ static int init_wdma(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 
 	/* Reset WDMA */
 	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_RST, BIT(0), BIT(0));
-	MM_REG_POLL(cmd, subsys_id, base, WDMA_FLOW_CTRL_DBG, BIT(0), BIT(0));
+	MM_REG_POLL_MASK(cmd, subsys_id, base, WDMA_FLOW_CTRL_DBG, BIT(0), BIT(0));
 	MM_REG_WRITE_MASK(cmd, subsys_id, base, WDMA_RST, 0x0, BIT(0));
 	return 0;
 }
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 902006d7c4ba..681906c16419 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -53,16 +53,13 @@ do {								\
 do {								\
 	typeof(_mask) (_m) = (_mask);				\
 	cmdq_pkt_poll_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val), (_m));			\
+		(base) + (ofst), (val),				\
+		(((_m) & (ofst##_MASK)) == (ofst##_MASK)) ?	\
+			(0xffffffff) : (_m));			\
 } while (0)
 
-#define MM_REG_POLL(cmd, id, base, ofst, val, mask)		\
-do {								\
-	typeof(mask) (m) = (mask);				\
-	MM_REG_POLL_MASK((cmd), id, base, ofst, val,		\
-		(((m) & (ofst##_MASK)) == (ofst##_MASK)) ?	\
-			(0xffffffff) : (m));			\
-} while (0)
+#define MM_REG_POLL(cmd, id, base, ofst, val)			\
+	cmdq_pkt_poll(&((cmd)->pkt), id, (base) + (ofst), (val))
 
 enum mtk_mdp_comp_id {
 	MDP_COMP_NONE = -1,	/* Invalid engine */

-- 
2.46.0


