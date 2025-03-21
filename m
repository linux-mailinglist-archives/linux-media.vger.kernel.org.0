Return-Path: <linux-media+bounces-28576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F056A6BE8C
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29F21481C22
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 15:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FAA22CBE9;
	Fri, 21 Mar 2025 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Sv8SZQDw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB1122B5A8;
	Fri, 21 Mar 2025 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742571952; cv=none; b=dJ5z2E7pxf4JqPJdXrZsZbdpY8SsNF6G++Zd3xMEyMonvvmrrZoyDAjGqRKLHGU+qyeJbfjtKIDsEOVD63p4RM0w/nVDHyqsKlVLemDzt+dDjimG7fG3+7Qoj4KmP0jcTqGiO7ziDIGwlaoE6jh/YPDbProbmH0nAgaHMNhBO0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742571952; c=relaxed/simple;
	bh=QKOvnt4V2j7Ud2WP+3AgBCDY0nLJ/iaswXcqa7b8V6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EUVG4ix/Q+e4sSiVq19vO57G39dRYP8YgB5EReZza4Rc+VbzE9fN/2hAzQ/9jTl6AXHW7MGLwh5klOS7zr617cGIeH3XbK+LeQAZ9jlIm7sdW3RPzRA4LKzOGjIygWH7NYR//Y+k/0mIovqtn65RcUVyEIobe8BegIK1xSKcJNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Sv8SZQDw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.109] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE68214AC;
	Fri, 21 Mar 2025 16:43:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742571840;
	bh=QKOvnt4V2j7Ud2WP+3AgBCDY0nLJ/iaswXcqa7b8V6A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Sv8SZQDwTOg8cQ65ZGI0MPdK0QX4csl9oDyIFaO6EeWvxji9pjeMk43vTLv+L9TCC
	 9lWQgAejhLn2gSuJCQOAtsHwTKddV/ifqbdTun7DPBuumIesIPic0lgKU+XXNveH4B
	 iNNDADzM3P8Z4mJjO/BOBrDw7GbU9K5ohI8GGOss=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Fri, 21 Mar 2025 16:45:36 +0100
Subject: [PATCH v6 4/7] media: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-v4h-iif-v6-4-361e9043026a@ideasonboard.com>
References: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
In-Reply-To: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn3YmkRznniXxQ9+2XPV6tviYiTVWpu2gTMZzmb
 FZ8gxg/2AOJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ92JpAAKCRByNAaPFqFW
 PKMyEADDGoZ3jWjOQgSYqKSUf19KAKgSaCiZjpCFIhJR4Mtgwq+28fOe819yZ6quqDXYt3e0bKX
 unhUyr02l8fwwA2s8u5Plej9n3giR7oA6Tn44G3dbS+pCdy65MgZdouRKPf/j1Co5s55l0+TfQ+
 Q50fuQNMpbKL3s+6FqSaXlPSytT1ag2hqIO+86MvtMqgT4alBN22CIcMTJ/W/oL1Qd12n0GeKX7
 7bA0shruuCVGS4wJrtozfcRTqZWFy8SbeoubBuc/FA8JqeRxEXaQI55JA8/WYcTBWcx5NBcPd3M
 gFkiNm3fsx+rlghsqOmbi1YxF3EzivzrXezZosrIgCFnr+WNdWxjKWFOJPgWEZr0uBZwlMA2hU6
 JprIVTaeI1r2PSK4ZVvuP65pyGQtRHA0zEq80KqM7NEHfzFQMsJa011PMfVhNBd7VxpPvIXVF56
 wfghvKMKRjHhDAyKJ3s2RTnF1yavifoP1iOSiruD6ce2Ht+TcAkD/kG/IGqHfiSrTc2layujh21
 427P1jf6JAhXq33zNJIkxZ4U8Hk4uGnzeM8g6HVGg65eRrYNrLiNHBEgG0tmX++x4fEdOplcXQn
 qGxD3EhnUlB/ggQYTa8Stqx0MpJVTAZ25fUL4Dk1UqQPx8Nj96C3IQAHIVqJ3XFhZ1MtiVGBYoZ
 nQuNBXMmv3V9pxg==
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


