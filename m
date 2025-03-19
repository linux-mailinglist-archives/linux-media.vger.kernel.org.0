Return-Path: <linux-media+bounces-28475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 842DBA68BB2
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D214188B3FC
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 11:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CFC2566D7;
	Wed, 19 Mar 2025 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q0Qp8zF6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321EF2561AB;
	Wed, 19 Mar 2025 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742383714; cv=none; b=EvBMoClvpdS/w97PVfz/Aqja8v8fy8ehqvVJdf9Pv3I7zKFc/AN1IhFIVDSWOphZ/jR9bdm1ETxg47wSPaCLEB4afMEweFD3HTshv0vXmeO3ZYigY4MZbVLFhyLzBcLf6dN5CnmJwc0JiYYDBDO7haOeH5o3zXXS9xxs2fKfc0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742383714; c=relaxed/simple;
	bh=RvfpMdjio+jNXatPfiV1crfd0LQ+0MrPkEiQbAWzgwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IaDfP+VujBIYF/gKhl+4prVrSdj+NZbZN8NpBbn/bSkImL6Mcxv13sPI43LqffUT4Y/brChebirPAtD9Je97RstPi4UglpzSf7fbQs7YyntpxelQsPznxh09fEDBRRtQj7ARo4fMESS8oJkyAcyqCr/whR3vDxWYzsy8DVg4RQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q0Qp8zF6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3EFA1116;
	Wed, 19 Mar 2025 12:26:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742383604;
	bh=RvfpMdjio+jNXatPfiV1crfd0LQ+0MrPkEiQbAWzgwE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q0Qp8zF6mmbUf4fJ7sXo3jAKt9qCQbzgMfx8sg+A/Ijb+uGLVW2bgBXvTz5gOsalu
	 3SIr/heoKyqwUneOtlAW4E1Wf3Pleqjb3uRFHtQj9s9RvLG/h6XHjf9Zo1iXGzVFxX
	 01pUWXjXThOKWIcaRb7Nk/lMICS/VcVCXxOF+g4o=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Wed, 19 Mar 2025 12:28:17 +0100
Subject: [PATCH v5 4/7] media: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-v4h-iif-v5-4-0a10456d792c@ideasonboard.com>
References: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
In-Reply-To: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2qpWKjIZPindBbfu5WNCEfajMVBpHkR9twCqH
 JQIbUeoS6CJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9qqVgAKCRByNAaPFqFW
 PKSPEACORwwFpmfTEPRFsFFYzewFFjNIbPzcATgu7kiNuEq1LzurgN4dlZuY7FSiD0wXoMSwBrw
 syQGB+ZxWLfg/+BgJ8BWBW9jyvvK4Oq2fO0Oq/B9veCOV1JN7f9izdCxksACShpiNFilzg8IeQd
 7HzTCHcrHw43qAfsB1eQyxLumezgP1zzWH17lRK9obhUMHDIb4kO20a96F8sF1BfModzrt1ZVOF
 3l0YkbVLRWt0z7vqn+CxG4ODIwESWBGY/N/hQZUu/1EpnZl+Hx2RDcm5gkT7rgp+vDibdMVRalb
 gJh2Osbn9RHmWlznpM+Gs1MkadFZ7i8z5kc9AMUPyYpbJi9k9RrCg9h79tWV1CVQ6sjSTg9iUO7
 Tm9VU1PaoR/Ctt5MZCfQ6gj6iR+6Vhb659GjGpl1C68zjM1vg61SW6qDRWqsACvB+WT9ULna3Df
 52rFLOTort+Ai5B583Lw6E7b0oO3edLBaHiMklzU3eLRX3reJ2vHmqxwe4cPqWC2rAjzFMlJsk1
 TFK2h4xj1mdu2n3dfDsc9BGCEe4Zn3445xOttJRHkYbgdZQXvZtfclAKgmbnuEK4K2Rmxf8Li/P
 x8SE/g1rcATM1xkpSQMKL/Af1IBQ8M4g9I6g8j8EjWcJ/TJLU3S9HVQueYLM3xtpslRHw5unVA9
 u5VJvGr4XO8mT0A==
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


