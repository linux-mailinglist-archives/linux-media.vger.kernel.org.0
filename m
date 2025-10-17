Return-Path: <linux-media+bounces-44797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E34C9BE6827
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 07:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD1794E5699
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 05:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC09F30DEBF;
	Fri, 17 Oct 2025 05:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUSE9sTO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C99D1C862E;
	Fri, 17 Oct 2025 05:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760680697; cv=none; b=nihGuG6NtVs2PdTq2G7OSGWzFtZBRpwccgOE7LLiofC2+YJ35qmtFX1bDf8NysiGfGf8oL7Z4jfdQFAojRoJlCGcXScBj661TnSLF9Nh0mTw0oeNAL5k2CkfRbB1TAO2YRanrtxgAMuPPu8zyfnirfx+6ffhNCyuXbewumsofWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760680697; c=relaxed/simple;
	bh=cTmwKSoqOEd/Lnhdk3mDeZtjBj5ydGFnJ6HadMug0IY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hKcuHmsJgDg+sAy68m5A9djynKkgZ6GP1SM40jy2+IKebCHEFNHV8MoXxNRebJjbgyzBfZJnFW9muhC9rq+Rjx99tsxMRZskAxwoappaBF4Qm9rth08phJEtW+RpHg95DQqWV1eqGYDBMyR0w0VZ5BLjTWpLOhWgNxLi7nXfQao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUSE9sTO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88150C4CEE7;
	Fri, 17 Oct 2025 05:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760680695;
	bh=cTmwKSoqOEd/Lnhdk3mDeZtjBj5ydGFnJ6HadMug0IY=;
	h=From:To:Cc:Subject:Date:From;
	b=SUSE9sTOG8yy52ucL+RRpKcOjlxuVURKh36E0yyCxUcHOyXtRcNXGdAIgfdr+yynV
	 I5qXPxiFczz/vxkahoqJBcBN4T6IoCGwC56/LWMNycFbResCBHtOsNia2bsc39Qc5Q
	 6ZPs/eSIjacviqQaCdJ5yy9NESr2F2TjZ+xqd4eqSZxqL6Lmqg0pDZSfachndGqqdq
	 52YAluf08EGWdbyltDfC86gZe7Xs79cAZ+CCnHsckZZT6erAHLYkBsu8+3YIq0xlWw
	 C+gJQe5dw+yzGNq5165EY5bdbA124aRLlIGzcgOsQWWczlHXZikW2IJVInLTrdLOHN
	 i9IO/eL9EBI2Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v9dTm-0000000025x-0A7O;
	Fri, 17 Oct 2025 07:58:18 +0200
From: Johan Hovold <johan@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan ODonoghue" <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] media: venus: drop bogus probe deferrals
Date: Fri, 17 Oct 2025 07:58:09 +0200
Message-ID: <20251017055809.8037-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The encoder and decoder platform devices are registered by the venus
driver as children of the venus device, but even if someone were to mess
this up no amount of probe deferring is going to conjure up a parent.

Relatedly, the venus driver sets its driver data before registering the
child devices and if this ever breaks we want to learn about it by
failing probe.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 5 +----
 drivers/media/platform/qcom/venus/venc.c | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 55c27345b7d8..2d822ad86dce 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1778,12 +1778,9 @@ static int vdec_probe(struct platform_device *pdev)
 	struct venus_core *core;
 	int ret;
 
-	if (!dev->parent)
-		return -EPROBE_DEFER;
-
 	core = dev_get_drvdata(dev->parent);
 	if (!core)
-		return -EPROBE_DEFER;
+		return -EINVAL;
 
 	platform_set_drvdata(pdev, core);
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index fba07557a399..f1abd2bdce6b 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1560,12 +1560,9 @@ static int venc_probe(struct platform_device *pdev)
 	struct venus_core *core;
 	int ret;
 
-	if (!dev->parent)
-		return -EPROBE_DEFER;
-
 	core = dev_get_drvdata(dev->parent);
 	if (!core)
-		return -EPROBE_DEFER;
+		return -EINVAL;
 
 	platform_set_drvdata(pdev, core);
 
-- 
2.49.1


