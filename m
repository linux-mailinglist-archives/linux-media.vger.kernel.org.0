Return-Path: <linux-media+bounces-34774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9FAD9169
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ED4E3BBC96
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9511F3D58;
	Fri, 13 Jun 2025 15:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Txl590uO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GPGfdYnC"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CF21F30A9;
	Fri, 13 Jun 2025 15:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828919; cv=none; b=J+RqsvkWSaVkaezXQK+tQzMMtySHsTtWco6xvrVtGpOQHRdbhraY4pbJ9C+yKO9zsHspMANPvGuY7L5d4omf0O43u3DsiEkmhSW3yL4MHgkMs2Wn+zM+SMW2fwDkI/07wdCt/ujI8oOcY4y6KXC8DX1PUimjy36cR/H/lpPu57Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828919; c=relaxed/simple;
	bh=xe79QVbdFx6cjhYsWBerDdq1osK5Hp1LdbhOfeWw2Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsvBRkK3Bf12Pw3vBTpuS/pJbsfd7RRappuPIZHwQTsL/Fp+h7btdFM756uK/SqUNDvkSyIWvjpa8m/mmvXfxO3Q9KBIAfsSCURaqoJbqwWpoYSczITw0tGD+TRwSo9jBigJCAAQ9TIf0MEWQGlcZrzq/ZUBCljJcGFIpTwzWcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Txl590uO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GPGfdYnC; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 951BE1140135;
	Fri, 13 Jun 2025 11:35:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 13 Jun 2025 11:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749828916;
	 x=1749915316; bh=FJQolD3WQS3NQaF8vMGGArqPxPLkX8f2tM0RdQJDsWA=; b=
	Txl590uO4Qx66AUmADDnx376SaejQdJdTPULaz9EePwXMtu9xtxxS7A8T3NgnA80
	p32+Ds141B+aXaUJ4XncoHxUtDVop9AvZPsi42tVeAxPD1j0HZUDKXG25EwDQEwW
	u8dlK7MfxJoPrgdDfuWrpXyeP2dQOV5kYFE2sVX4cXB95Okrev8unzARjTcir+pc
	+OkbpTO9KZieNS4ExGNZABctaTDkjOgsxV9GtIEw14dSKMGC71wU7zNkLOf2orSH
	MaQ+2aoZ6/dugkUqfI89U5VW1gcGIvhViKwAyx2ptbH5U7beSLN5AksU0QaFb6Uy
	D4ZXR0Z1TKRsI2nBTxNUEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749828916; x=
	1749915316; bh=FJQolD3WQS3NQaF8vMGGArqPxPLkX8f2tM0RdQJDsWA=; b=G
	PGfdYnCpzunpzJ7I5JM1CVd+f6IxJu94F6QZrxfgeW/vOVfHGWoLT5FwsKF5Cite
	pdss1Lk1l0VZA/lgqHKWlSBVtr2i2vZZRkN498iTKyBTbGitUdVhTltIEWZucLyx
	W+VxfYOmIogbzOzesgV16Dgiq0gcYrEhh+fXVI3wsCnAUfbnomW27PpqvxRO0dxr
	B7Sq/xaSy57vDyU12pCKDqzsbITy8acLT1AVEY8gkMUbFGiZtO1kzgVODXQoMG3d
	LvBkh6z0DDUfsQeEIXdrNuPHK+SwmEMuXyR7FpWRpAtaD0wh5GzcvgvCAOZ+qQ1j
	B/6VCXDA+1DZaELr03VQA==
X-ME-Sender: <xms:NEVMaFNiZIxSVplXXF-v518veABzbw49GpZiuBfjLKfa9KXpJ6qBag>
    <xme:NEVMaH-Ljt37LJom-1t4UN-BlM7wzgPgIcK4Jiak63fVGGsIDZLwtIa5y5EwrFQMM
    kGsmDjvBz6hVAOLzLU>
X-ME-Received: <xmr:NEVMaETXeRnBmop8XQ-puFDFwzpAEckJBt8XHluy9SaqAXLsjp9n9UnO-0VwytdKB6GFIt-P09oFomNp5eBSo1tm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurh
    gvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthht
    oheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:NEVMaBss2__Esq9RoAtFlqZ3SeOl-rtDoWe0gggirpeR6DyzNytOaw>
    <xmx:NEVMaNfNGSlI713BHX3QowUOCAPbsBF1TNQP-rx7RX99Oouc3WLMRg>
    <xmx:NEVMaN1qBmS4qgYqOQHRn0ohD7mhFXWCr8PqaNCL_H2mq3a6gu4JqQ>
    <xmx:NEVMaJ-fF_e0ToNM1ZGxbHjlw2IbH_15Vu7c8eGGSBClMEti_hXQUg>
    <xmx:NEVMaE_90rEQPH-7-SbkhI4jsQmsjj_WSpoTFwmqvEf9iXPZFZXcZ5YF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:35:16 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 04/13] media: rcar-vin: Use error labels in probe
Date: Fri, 13 Jun 2025 17:34:25 +0200
Message-ID: <20250613153434.2001800-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prepare for more failed probe conditions that needs cleanup by
converting the error path to use labels.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v5
- New in v6
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 73d713868391..59751ec23a15 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1405,15 +1405,18 @@ static int rcar_vin_probe(struct platform_device *pdev)
 			vin->scaler = vin->info->scaler;
 	}
 
-	if (ret) {
-		rvin_dma_unregister(vin);
-		return ret;
-	}
+	if (ret)
+		goto err_dma;
 
 	pm_suspend_ignore_children(&pdev->dev, true);
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
+
+err_dma:
+	rvin_dma_unregister(vin);
+
+	return ret;
 }
 
 static void rcar_vin_remove(struct platform_device *pdev)
-- 
2.49.0


