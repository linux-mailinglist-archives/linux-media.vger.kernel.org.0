Return-Path: <linux-media+bounces-28411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5BDA6728D
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 12:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7E1D1737CB
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 11:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542A220AF80;
	Tue, 18 Mar 2025 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B7xxXYsD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A9320B21D;
	Tue, 18 Mar 2025 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742296957; cv=none; b=Xfn1V1gBoTdDT+jTl75vdxOKFqEPzkv/0GJnbBK5x+OPSYTthkBTSdek+gIG0xd2eiL0q8mTa1yuep+f5gJZTm+m4UJDPafbo3iC43Z8Yi/uRycb/D0rkw7dQJZuSYKCVgYSDH7vjXfrMRUl9p/d+7MCUve3hkMY2hsEII9qAu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742296957; c=relaxed/simple;
	bh=RvfpMdjio+jNXatPfiV1crfd0LQ+0MrPkEiQbAWzgwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1H37VoHL7YREedUBMI/noK2lT9Stx5uxGET0K8MWWV+7zX/TUNX96bUAJymMHo+uXInwl/PQ607b0+h/fTXaF+aMO/MbmMVVOQD4dBQByteFqIBUTdNIxFdPWmtUDmbW1suEHAGfn6jx5t0i2DJ0o2jlDY/B9/Mn5/TkFs+TT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B7xxXYsD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E19661586;
	Tue, 18 Mar 2025 12:20:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742296840;
	bh=RvfpMdjio+jNXatPfiV1crfd0LQ+0MrPkEiQbAWzgwE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B7xxXYsDHmxBFApSnrHwV3GD8DUkMvIWqPbomLV8jR9J9zKrI2d839LxRHUkFhnct
	 cAsTOm7WA+oYngNNR8Vm0JwAJxUf/b/a/SFJ7jzl4Qtq2rSI9vR0BIzyBzwnCl1Dhi
	 rYJrhs2y+fpjup3NS0fJeugv4v0VeLBJH3d7AeG0=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Tue, 18 Mar 2025 12:21:23 +0100
Subject: [PATCH v4 4/7] media: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-v4h-iif-v4-4-10ed4c41c195@ideasonboard.com>
References: <20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com>
In-Reply-To: <20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2Vdq7b5fkqm6tqNGP6eOIi4qxbdLXYQ7SQp/W
 3ZUUeUwmfCJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9lXagAKCRByNAaPFqFW
 PNXGD/4ojXzg7KNoZuVL7V6glqbUN5ZStsV5vdGGHsUkTyTVDnenxvcaRO91Bt1DPyi69qSg9xv
 +r+FfxvCGdlvv7VztRY8Tm6SZpUHLWygR7XDCLNDL318z1lG557aTGKSmEHQHTC1evJVKbwH0G6
 vpowDGZd/qKplhXrcIGCNEW+ZAd13UnEgNdAbJisorZNKG2Jj6B9AbISGoP815WjhYGSQbTcKcM
 hAtxoWtIRDD7qjTRGdRY3aiTIqEdHLsByK2GguZKqG4QMARASE9MjvkYyrWMqf2DOLwzAExknTx
 WKoeYDekNCrbOSO++g7FQdxSQooCzpXHEFYDOuvRAY7REZP9sfTd7hdJNd3enc2j83HL0BhQ+vx
 yE7jCmNN1WuiVb/PITuTK/FhsbKfkb5/SdWQ4cu5ifhnhAVP6ZD2MkXqa30aZlVznWNZU5slDpG
 6GLRdUkxm9Y4jgpnLkHWur0gvHcd3igUgM7+YbNKQ6O2gM2rHsN7zOxt0+dS+HnC5yoyEknnJkl
 xpDjTjxibz54iJ8u6aMk2GS6cFKFzpOQlrKV1eWBxUsupanpJdKM+0Sf6Cd8o0L//kMweVIB0gk
 p9/kj69M/E7lKyqUOVYKibRCrf8D4aWt+xi/7Pf1iusL1CbQzNZa+bM9GVzV8RDZUTrfSVY3mGS
 ZrIkX7DhozM0VDA==
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


