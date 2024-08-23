Return-Path: <linux-media+bounces-16678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D7E95D877
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 23:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10EB8B22E01
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 21:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661FC1C86F1;
	Fri, 23 Aug 2024 21:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="LvD3C93z"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE5413B5B6;
	Fri, 23 Aug 2024 21:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724448712; cv=pass; b=Q69Y5+/IKYXf7l6DLLn+vP9QzFRVf5SHhe+ojiv6syIeFfICnWTzbHlBRhdFY6bNHT0ibhaCUKr5g1j7Aztf+LjSWmiHWgyfAXwbQfxFjyDroB6wcZmrLQ3V2Mt0qk/e4GRptSJg091Mc3S8A2oHOteaTKwgm7B7Icwdx+PM5fE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724448712; c=relaxed/simple;
	bh=YqTPbgaA5eZ1nhKC0woyE//cSqM+PYTGXlROAJBRxn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JficnCNYkyz4cFBdyQQloABRbyw8g3LvKkb82005NxE7vYQfQFm7fX0d+elaTDZrdzaAApeccInV4PU6RzVrNAs/nP+8E9RoMhDF7N7AdhGDrJ0yofRRr3OzoiEUz7kRn5ZQEKiY3r8ADGmwIim9xatbCYXtZK6bXFZ+6lIesEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=LvD3C93z; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: angelogioacchino.delregno@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724448699; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bc3Y1MAMdL+bJFRNLbhh5euirsEVbGfLEuczVIOxaaZtHNKsoJcSrfeqQtMKBMur7gxYOnqisz2zgfvCN/eMaQxwDz/Pep/ZZHvSkd6ndOVhDb3Plo2GWSOkF06DkqkpHp0LcoLzECXsXvunfxgwyB85BzFbajf5OwA3d11Y79w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724448699; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vQfV5/7F8iCB8hgaB5SKkH1VV5uYwJvQlWEsE/ftnPk=; 
	b=XxH5E5NPuP0vkvkD1b6IX0fP/nBnEY786/CNVusmqBiqM2ZZ63LnxmbAbNJGEkHFmI2qRvUA7ekfBeADGXt9+IIyNjdLmtuKysZp4BZ2eIHdo0y+kHE6IxQfvzya9awsECrRDqGo1dN++Bo8T1WGH3ShnrAm1lAs6MlX8op81o4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724448699;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vQfV5/7F8iCB8hgaB5SKkH1VV5uYwJvQlWEsE/ftnPk=;
	b=LvD3C93zfuQxcENbtnK/RwA4Ri78vdFp4E1aZ2LnRl5/NE2aVaNtHXcj4jSZD0Q4
	ccU8e5uv2zxaCl2H6OniKuo3ODVC/ejNjgXTToMFJ5gF/1Gb0jqvp+QY2YH2rAjyDui
	OHNRm80rrh1cIAZvyV+mTyQp4ULHkAfqTOf7XePA=
Received: by mx.zohomail.com with SMTPS id 1724448699135452.7212113854729;
	Fri, 23 Aug 2024 14:31:39 -0700 (PDT)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 23 Aug 2024 17:31:21 -0400
Subject: [PATCH 1/4] media: platform: mtk-mdp3: Use cmdq_pkt_write when no
 mask is needed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240823-mdp3-comp-cleanups-v1-1-1f8c1395ecd3@collabora.com>
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

cmdq_pkt_write_mask() boils down to a cmdq_pkt_write() when the mask is
0xFFFFFFFF. Call cmdq_pkt_write() directly in those cases to simplify
the code.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index ea2ea119dd2a..90658a22a525 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -325,8 +325,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	/* Enable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    set->value, 0xFFFFFFFF);
+		cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, set->value);
 	}
 	/* Config sub-frame information */
 	for (index = (num_comp - 1); index >= 0; index--) {
@@ -381,8 +380,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	/* Disable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    0, 0xFFFFFFFF);
+		cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, 0);
 	}
 
 	return 0;

-- 
2.46.0


