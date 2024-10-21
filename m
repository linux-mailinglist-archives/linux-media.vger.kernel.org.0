Return-Path: <linux-media+bounces-19997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1222E9A6F01
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 18:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5AF62842B2
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 16:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181D81D0174;
	Mon, 21 Oct 2024 16:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1KtfWm4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CBE1CB535;
	Mon, 21 Oct 2024 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729526662; cv=none; b=XTmiT6wRPdVUUhtlG69UfSN9wDLKyecCs2/lAKMLydQ06iqfM0TzsE/RTgyyIYz+7guAlW1mqorzt/lVEqvD7qy8gmZ1wgR8lwWN+sOfRML7c9wlo+TedU4oIv297E+vKDxgeUvNqvEMtr8TSY44H/wScrK+jROt23L1mUdrufU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729526662; c=relaxed/simple;
	bh=TJh/DD/sfJgskbjJKAccoygie3yLsjjKsgBPtkfXTus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rduFHNqO18PR4yuUNDADkFPy8PyMm6Fd8/KY09nnYD0BbExvKPYQ4rjK3LMHMuYYF04Mpl43+BMKvchwXpuo1vZ+FikEwszdRFqUKh8swy3TOLjeEyCEvixCJPMC2aHZ30aSgh64GHnv8Lk/LFxxpgSUn+Zl7kSiYMAfF0lE6e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1KtfWm4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F13C4CECD;
	Mon, 21 Oct 2024 16:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729526660;
	bh=TJh/DD/sfJgskbjJKAccoygie3yLsjjKsgBPtkfXTus=;
	h=From:Date:Subject:To:Cc:From;
	b=Q1KtfWm4+hf6dSHS8s6VVmODdTYta8dKUbMxhqfJvs/6iLyf6Yu4v87wHj9mv+Rgf
	 d49geA3ugWnB6Wwu6bZpu69UZjTS2LAZ5fGrt2CMQNNT7HpmJwLhUeK3ryl9ndXf+N
	 KacJTveyyl3YYRYf2N18J1KPOCkZQswnGUTr1lWjxA29yKqyZKoiOO9y8H42H18pjE
	 ZUGJQ/5OrI+ihDaEBOwja7z7dbP+2POHTm3/BoN5p9ityxh0ijrsBhATf3Xv2byROr
	 4Yf8qMp3ecpXPOosBhcqGSIb8BprdScRbJQwQg63R/dAGTAV1Pi67f8WfL4kRCTVZa
	 xMIqLtu8AVkAA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 21 Oct 2024 09:04:15 -0700
Subject: [PATCH] media: dvbdev: Avoid using uninitialized ret in
 dvb_register_device()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-dvbdev-fix-uninitialized-return-v1-1-a704945f20e5@kernel.org>
X-B4-Tracking: v=1; b=H4sIAH57FmcC/x2NwQrCMBAFf6Xs2YUmFC3+SvEQ3RddKGvZtEEs/
 XeDx4FhZqcCVxS6djs5qhZ9W4Nw6ujxSvYEqzSm2Mch9DGw1LugctYPb6amq6ZZvxB2rJsbn5G
 HMF4kp5yoVRZHc/+H6XYcP+05qgtxAAAA
X-Change-ID: 20241021-dvbdev-fix-uninitialized-return-6ef4187dfafa
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489; i=nathan@kernel.org;
 h=from:subject:message-id; bh=TJh/DD/sfJgskbjJKAccoygie3yLsjjKsgBPtkfXTus=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOli1S0/O2WXncv6+1yBjfNd0/TF3X9mCdfuZ9j5w1Di7
 6XLc4tnd5SyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJWD1nZFh1QLOxeaKigvyX
 vffNfpx9xvPu0tMPLqorL8+7wbbL2NKY4X/QBlWjMAPlNyl3axOeRhXtON0Q8HHpOsOdcRVLT1/
 JXssMAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When CONFIG_DVB_DYNAMIC_MINORS is not enabled, clang warns (or errors
with CONFIG_WERROR=y):

  drivers/media/dvb-core/dvbdev.c:554:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    554 |                 return ret;
        |                        ^~~

Use the return code -EINVAL directly, like the CONFIG_DVB_DYNAMIC_MINORS
block does.

Fixes: 972e63e895ab ("media: dvbdev: prevent the risk of out of memory access")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202410201717.ULWWdJv8-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/media/dvb-core/dvbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 14f323fbada719f717fb7fe9f6f2a3ce81e609a3..5bb36be911f615afa1f3a7a13f974b67b3216edd 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -551,7 +551,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		kfree(dvbdev);
 		*pdvbdev = NULL;
 		mutex_unlock(&dvbdev_register_lock);
-		return ret;
+		return -EINVAL;
 	}
 #endif
 	dvbdev->minor = minor;

---
base-commit: ba9cf6b430433e57bfc8072364e944b7c0eca2a4
change-id: 20241021-dvbdev-fix-uninitialized-return-6ef4187dfafa

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


