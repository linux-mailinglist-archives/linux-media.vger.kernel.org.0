Return-Path: <linux-media+bounces-29158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8939FA77D94
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 16:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B694D188E563
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 14:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3169E2054F6;
	Tue,  1 Apr 2025 14:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a56vapwE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4E204F66;
	Tue,  1 Apr 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517347; cv=none; b=S+P938EuC/qOZ8OIFp43FuOdqlxP1cPCFTFfp/kU1v7OZJ4SOKlkpP0eGIsnlV6cuF57BPthtLhX9N0pf7I2Z65n+eNgE2L943cK9daJS81ZO0uvOcQMzsf4v8w2Yw5c1e+JQ2Ig180LeVbTNEe/RZo9ytP5sTVRcqpmc6GTNbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517347; c=relaxed/simple;
	bh=QKOvnt4V2j7Ud2WP+3AgBCDY0nLJ/iaswXcqa7b8V6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HePQVzRQvEY4WJN2MUJu6Anyx8yXx77UvgmlQjqSnYzXUdvgV0L1FHxtCVbd/UM4Vv9EDt1nOApYrvX+4qz8ZUfpheU4jLKrx3NiMQ+U/tRUWEga0shWTa91RL3n5TljnEAdqm7UIRvhaKjtTQUt6ifW1bKhyir13nXieGDDKJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a56vapwE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.101] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AC00134F;
	Tue,  1 Apr 2025 16:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743517220;
	bh=QKOvnt4V2j7Ud2WP+3AgBCDY0nLJ/iaswXcqa7b8V6A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a56vapwERJSGzKXbcmM4sFgQoJrjaGW2nOFl+wDWCNr0C84kisM+ezRxrfjcpfqds
	 qkgAgcezytWDlo+eiXoYRnZ4MnTM5+yhwesj32ANVfcJLGMJl2CVCf9f6KV5Hdd7Si
	 j7xBfNELQUEsCNDTSyWSEJQpywu+SnunoqfZYC7w=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Tue, 01 Apr 2025 16:22:03 +0200
Subject: [PATCH v7 3/5] media: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-v4h-iif-v7-3-cc547c0bddd5@ideasonboard.com>
References: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
In-Reply-To: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=QKOvnt4V2j7Ud2WP+3AgBCDY0nLJ/iaswXcqa7b8V6A=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn6/aRG9q5/EcM8ICIspt7+/VkQA7KxmiTlHBXw
 6BvKT/A6vqJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ+v2kQAKCRByNAaPFqFW
 PHpNEACxkkzs+jLN0OnOF055UJKoQBVgHjWTtiEaJf0NZ9s4Ys385YBoWhiG05gjhYBZzozUQif
 h78VuRT36E4x0k86sUNIP8/sJU0NzucJiOuTfKhKWvg3teJ7neUjfakqGvE8owq0xjy6wuUZD9w
 x33cuU6YQSQgGeiArl520OgXY+rcpFMapEy2pOOIZE+b3MNSR2VDFRajBA1supMpG5ystpCH4jh
 tB6WCqOn6pwwkzrlzr7ilYvL/aiDd1tX/wvIxDsuQpHOldjow/WdxUmD0qxf5DptsX/x0SP+wfQ
 K6GCStmzPo6uLXCYgvlQHhwbxIfNcAURi0GnatlroqU99Z22D2q49yCkBtrVg34IqiCCTgkzs2n
 iNzx521PV/c3a3ReNpfnKf1A5yy+38ysGtacIbJgFWVAV+PgpfYMDP8iy3+721Uv1hXi4PxIvwC
 Gf2e0wzkm4XdDjRUwKjKpW0pd4E1j64JHs7+Os2EvMA+8KCkNchcT5rHzY2xylcQmobq3hsuJE2
 fsru1VP52DDWuKY7Nz5Zs6QDaEOZunqC/KI/91JFyBLlFllFKpmo32lh4V8I8ydYK7RRB+BXLmK
 z1hkya+R9m/TWWTAMueg289ARZ2xUIt7JLL0FSvRwuUlBdtpM/8KI/rdiQyONwblnG25bMLs5IB
 sQLHcEhwpJGin8g==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

vsp1_wpf.c calls vsp1_rwpf_init_ctrls() to initialize controls that
are common between RPF and WPF.

However, the vsp1_wpf.c implementation does not check for the function
call return value. Fix this by propagating to the caller the return
value.

While at it, drop a duplicated error message in wpf_init_controls() as
the caller already report it.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v2->v3:
  - New patch
---
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index f176750ccd98..da651a882bbb 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -133,6 +133,7 @@ static int wpf_init_controls(struct vsp1_rwpf *wpf)
 {
 	struct vsp1_device *vsp1 = wpf->entity.vsp1;
 	unsigned int num_flip_ctrls;
+	int ret;
 
 	spin_lock_init(&wpf->flip.lock);
 
@@ -156,7 +157,9 @@ static int wpf_init_controls(struct vsp1_rwpf *wpf)
 		num_flip_ctrls = 0;
 	}
 
-	vsp1_rwpf_init_ctrls(wpf, num_flip_ctrls);
+	ret = vsp1_rwpf_init_ctrls(wpf, num_flip_ctrls);
+	if (ret < 0)
+		return ret;
 
 	if (num_flip_ctrls >= 1) {
 		wpf->flip.ctrls.vflip =
@@ -174,11 +177,8 @@ static int wpf_init_controls(struct vsp1_rwpf *wpf)
 		v4l2_ctrl_cluster(3, &wpf->flip.ctrls.vflip);
 	}
 
-	if (wpf->ctrls.error) {
-		dev_err(vsp1->dev, "wpf%u: failed to initialize controls\n",
-			wpf->entity.index);
+	if (wpf->ctrls.error)
 		return wpf->ctrls.error;
-	}
 
 	return 0;
 }

-- 
2.48.1


