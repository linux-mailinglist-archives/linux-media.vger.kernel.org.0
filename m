Return-Path: <linux-media+bounces-28358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C93FA64D8B
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39F973A68F7
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FCD23C375;
	Mon, 17 Mar 2025 11:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YChffNKs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2D023A58D;
	Mon, 17 Mar 2025 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212664; cv=none; b=A2P0aHkXVyj6EK0dyJVqk49b2x7jT96JI8ysuPnUkBwFxr5ub7Hfi7bINOhPkL+2OVgx7S/SGBZM3cnUnwsJINV8mFeD1Mwz7KT2QN88+7JzjtTgXo6tFVslbz++rbcE9OYUsiO27XZindlJtqTZsRrSOInOosGCCdCEC+h87dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212664; c=relaxed/simple;
	bh=RvfpMdjio+jNXatPfiV1crfd0LQ+0MrPkEiQbAWzgwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=daBoaTriokPv+5qDNQIuGxOV2tee+BKjhG6JKKEEB01rb8OB+8O3t3QsbQTxNAl/RhA1d4koLURTCLbeAj2p22Hz58rmqKsWCBuDC1OgIETon8QXprHuBu7OXa3gzbDUgRQSCx8lV9EvGzPfBCAsFsEBtv/9PpVJsN/WoBw+9qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YChffNKs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC743132B;
	Mon, 17 Mar 2025 12:55:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742212548;
	bh=RvfpMdjio+jNXatPfiV1crfd0LQ+0MrPkEiQbAWzgwE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YChffNKsVzcMED99XBBWMawPq0bnJ1b7JkHEfvW/mYqLD7GCF4oeREjySklNCrZf8
	 ai+XO8C/dts5GbvzVXPmr7F3+AoqrIh4PvSguJiC5tibiPkAB3Y2MeRn7ePKbGP5oY
	 PPde+17XRGMNilYKh8VZv2nRF8/gy6B3E0tjhln0=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 17 Mar 2025 12:56:42 +0100
Subject: [PATCH v3 4/7] media: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-v4h-iif-v3-4-63aab8982b50@ideasonboard.com>
References: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
In-Reply-To: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=RvfpMdjio+jNXatPfiV1crfd0LQ+0MrPkEiQbAWzgwE=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2A4lWDRYm0NzveckWfxrtFfCqV/zcKrsZBnEa
 0EPs06CzdaJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9gOJQAKCRByNAaPFqFW
 PAtWEACWAu2OWrAbsgG7fYrX/FWOGWEXUfi5/D+CZWTqxa7jsWq7bANXFXPI23NNROdd+Fts2cF
 kqJzpMfS9YmOOxv9G6VK1zW7Dox+O8TG1C48FhrH3DNbKVsAnWi53ZO++adsEQhb716nSUTsrK/
 wljiRqkR+toThYGtDQjPRhaRpEWnI+742UrN1npurTgRZcnVh3BPMPavvOlIbSpZiwQSP5YJjDj
 sbWmDc4EBDQJBy01scpdhhXOObTGDtYb4Ch47+kJQApKrBfTmX442FgBb9J8iUa7EqHPBTR1wxL
 alga/iblbs8E7iOAtWLOO65PxaVgkeJEu3CV2sVviQL7SAB5oIC1/Ul9cNP/semeHygWvaa5+Kc
 HCGnex+/AZ5UXIBQvnfZ0KemnOeV2LNEK4liBGbOqptzu6k71/PZtJWZk0cwj8CKENR8yAOFk7j
 sdR1fq6nujuHBMqX+jz0XuYzBwPJBxQVou2yvW5BslFwG/Xns7Div4nHwEyoYxgbLJIaxPSqd/4
 WciVMiuA/quXLUOSp2Ho0d+1/uaZ22FB0r8c1BoSqs8SO2QLzdKHwqeodjKMG6W7Yg1au0XgJ++
 o8eFUv/PvnATsr88rCjM4ja5Y97bJZJ4C4T+wSQ23LEeI+nxtHEwjcIcOlo9MYJ8WrESL4SdpzX
 mO6IY3fYT5QVThA==
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

---
v2->v3:
  - New patch
---
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index f176750ccd9847fdb8d51f7f51a6bd5092b70197..da651a882bbb7e4d58f2dfea9dcea60a41f4f79c 100644
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


