Return-Path: <linux-media+bounces-44792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1C1BE6706
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 07:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 580124F5CBF
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 05:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C19430DEA3;
	Fri, 17 Oct 2025 05:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q9WgIkhg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F4C4400;
	Fri, 17 Oct 2025 05:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760679224; cv=none; b=OXkwtLGQBfx0EjtANkXvX/YjZMjjL76k1cFoTRhrMC8j9J5IqOgI7cYA6hqUAryI55O/NqUkVAbTj811Hv1y/LxoE70g5DaS0qqH/m6dAj2j84/khfunyxG1mLurhljF/f2R94/VBH6LYTkijAmZNSn9JQNeqWCf0JmEypBW0tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760679224; c=relaxed/simple;
	bh=yGSP3nG/ASsQyFln3D+1z2G66QfNgEM0X9v346OTRx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vp8umo1cW0wERKLLWMVAEFmFJdQP9saaXEAWwhRzD6pEavorvdRlyfCxt5KxR2vVmbAdTGH0Mo94j5lugOdz4bhllzbOVQZd3GLPiV2pMwkHfgmewgj3aCKZcuIFXueDeKJoDt9/W6XBp7UqWSjAhDWyu/02CSPvAZptPX0KfDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q9WgIkhg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1399AC4CEE7;
	Fri, 17 Oct 2025 05:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760679224;
	bh=yGSP3nG/ASsQyFln3D+1z2G66QfNgEM0X9v346OTRx8=;
	h=From:To:Cc:Subject:Date:From;
	b=q9WgIkhg8VNZHW/T5yScuOSY7K3fn72tFUl8k4mte68ZfsW4VS+adBqOtLZBwQfCB
	 15HMC/LxfPeTbJwmFlYJJf9Rn2yrQmrbeJ3l1x6YvJg8RK2c0Ff4aLc/xXufqk1P7q
	 pW7YE/G4gs9iqV3UMFQ5A1VLfTJqkJFripVIJTwyhGbw7MbDVvWgdpkZeYaX8QmEkp
	 O7OwQFEGGpLFYDBN5k49KID4SpDog8bGPW8XSWDMRepIwWn0E4U8/rvsEwxjjkYWO8
	 No/ouyTKdaBZLf7hF58y/+FYmMyfkxd9aP0KD2fyHc9VffteAy4md5js/BQOk+ebWI
	 Hk8W46h8BwXcQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v9d61-000000001cZ-3Zzm;
	Fri, 17 Oct 2025 07:33:46 +0200
From: Johan Hovold <johan@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] media: vpif_capture: fix section mismatch
Date: Fri, 17 Oct 2025 07:33:20 +0200
Message-ID: <20251017053321.6156-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Platform drivers can be probed after their init sections have been
discarded (e.g. on probe deferral or manual rebind through sysfs) so the
probe function must not live in init.

Note that commit ffa1b391c61b ("V4L/DVB: vpif_cap/disp: Removed section
mismatch warning") incorrectly suppressed the modpost warning.

Fixes: ffa1b391c61b ("V4L/DVB: vpif_cap/disp: Removed section mismatch warning")
Fixes: 6ffefff5a9e7 ("V4L/DVB (12906c): V4L : vpif capture driver for DM6467")
Cc: stable@vger.kernel.org	# 2.6.32
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/ti/davinci/vpif_capture.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index d053972888d1..243c6196b024 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1600,7 +1600,7 @@ vpif_capture_get_pdata(struct platform_device *pdev,
  * This creates device entries by register itself to the V4L2 driver and
  * initializes fields of each channel objects
  */
-static __init int vpif_probe(struct platform_device *pdev)
+static int vpif_probe(struct platform_device *pdev)
 {
 	struct vpif_subdev_info *subdevdata;
 	struct i2c_adapter *i2c_adap;
@@ -1807,7 +1807,7 @@ static int vpif_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(vpif_pm_ops, vpif_suspend, vpif_resume);
 
-static __refdata struct platform_driver vpif_driver = {
+static struct platform_driver vpif_driver = {
 	.driver	= {
 		.name	= VPIF_DRIVER_NAME,
 		.pm	= &vpif_pm_ops,
-- 
2.49.1


