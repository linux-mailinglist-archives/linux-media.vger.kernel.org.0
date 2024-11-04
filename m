Return-Path: <linux-media+bounces-20763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4EA9BAD6B
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 08:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40D741C2100B
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 07:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4EA1917C4;
	Mon,  4 Nov 2024 07:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BGmUGZve"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3363E171E70;
	Mon,  4 Nov 2024 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730706505; cv=none; b=BIfx8mJC3PiNqx+0kcuP4cmqUv+YkWVnYfCA5CE+3EH0eohPuNqi+kIce1DLED696U2eyyM8A2nb7uNxZzT9g+9RT1+0HQV3p+X+60wCmSoj7gI7rOyopU4KYAa7Hti6ZHTORuvvdhMnLt+wBwq4pJpOHbW2qnG1bETjS+pt4IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730706505; c=relaxed/simple;
	bh=lIE2kYZAcfccRQOGzfpt1usumoHzGDS1Bwy7k9LLV+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r8xjUQoeMzPunTvt86KoZ54h0U4P+Si2US+E6j21Kgue0UvtmK83X6ne+ube5skA+3cWwef1FMcfgOSVFqkJelAdX3DYc8NS2g12IAgpfOfXtPAfuaBj4pKimtyf7Ae3lTVy3/+9nESvh8ckQrgJiIMRV9BnrIQd9f57RlqUg/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BGmUGZve; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5216122E;
	Mon,  4 Nov 2024 08:48:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730706488;
	bh=lIE2kYZAcfccRQOGzfpt1usumoHzGDS1Bwy7k9LLV+E=;
	h=From:Date:Subject:To:Cc:From;
	b=BGmUGZveLZQN2MpLF618g5rb5aAiPbO8bw6s4OPz3c6iYyzxCxVZj49vdBsHxe9nK
	 /TkAEaDpajkRocAuxaZ60q+ceOtboaANMFoBTwFPt1GAZm/d8sxI4tRtg0L8I9XgQc
	 Hyfr8vKtS6YvIsswuoR4DtMkzSruw3JoDX1rKE0s=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 04 Nov 2024 09:47:54 +0200
Subject: [PATCH v2] media: raspberrypi: cfe: Fix mapping of dmabuf buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241104-rp1-cfe-fixes-seg-size-v2-1-2afd9f6f9fac@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIACl8KGcC/4WNQQ6CMBBFr0K6dkyngkRX3sOwGNoBZiElHUNU0
 rtbuYDL9/Pf/5tRTsJqrtVmEq+iEucC7lAZP9E8MkgobJx1NaJFSAuCHxgGebGC8ggqH4a+tSd
 7CdTW5EyRl8R7o7j3rvAk+ozpvf+s+Ev/Tq4ICJbIDy5Qc+bmJoFJ49xHSuHo48N0OecvgjVO7
 8MAAAA=
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=lIE2kYZAcfccRQOGzfpt1usumoHzGDS1Bwy7k9LLV+E=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnKHw5Vu8U1vmF8yEBEzPMGHgPaEVEwdvzzIApt
 /MP+Y9gKpmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZyh8OQAKCRD6PaqMvJYe
 9XcID/oCe7Uv2FXQrwj4bGBwcq9WWXRU9MVexVilLDXe8nzSBB73N6+QCNtpWKNSo7pRDBGush0
 a5bI/js3YbnwNwf+aEt9ZUwmcQTuR8KDycf+o+y/hUrCq8k8N1aczqcdmOYbbBncB7rS7jdF0IP
 tCOYLb4gTsgBNpq15bBFUyeCfASxt9qIa+zpq9Rrx4kJhMlR//Bls5gTZT6JWkIoENS9s/Se2j2
 tz0BQV0rwC2Q4m+xz6Wnp9zoKHwr0Y3Xy10t+Q11zu5nzqT3AlHBWsHeUKLUNQEPdnTYqhHgi55
 +hFOuG82gt/e1ved8pBqy9wp38GrihDvxrg1XWNYEtHCvDK0hRiayJtxo1rHvEd9aarTEYVMSVI
 UlluKC13oSnp3uI2wnMLqVFxzbFKORlC5dlgKoo3xBdT/AHlDqoLcU0cEH3goGsaCxCadxzNUZD
 PyUZ13WuEnux+XSRg4oCyfgAlyR/ZZxjEpvef+XPm5i16S/VeS0Fim7WyXl84Ug8DXulrSJ/NeF
 cXeNFbovzuhZaiLb04We+Q0AZmjDAiexeYY59AIFOZRb4ckPMsRs3SLo522i3GLXcsaUOewcHeJ
 YNvE25ecHZijTngKZ78tI2cc6KNDg6d9IN8q1Rj0TfieSeGXtksr4fACog+qlLys1zA64QqEtMt
 OXs3uQgsczK+47A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

When using buffers from DRM, DMA-API gives a warning about: "mapping sg
segment longer than device claims to support [len=307200] [max=65536]"

Add a call to vb2_dma_contig_set_max_seg_size() to tell the DMA-API
about the supported segment size (which is UINT_MAX).

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- Drop the error print, as vb2_dma_contig_set_max_seg_size() already
  prints one.
- Link to v1: https://lore.kernel.org/r/20241101-rp1-cfe-fixes-seg-size-v1-1-0aacf2da56e5@ideasonboard.com
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index da9e1a1e4d0d..e808c80cd37c 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -2341,6 +2341,10 @@ static int cfe_probe(struct platform_device *pdev)
 		goto err_cfe_put;
 	}
 
+	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, UINT_MAX);
+	if (ret)
+		goto err_cfe_put;
+
 	/* TODO: Enable clock only when running. */
 	cfe->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(cfe->clk))

---
base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
change-id: 20241101-rp1-cfe-fixes-seg-size-b70309da74a2

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


