Return-Path: <linux-media+bounces-44793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD41BE670C
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 07:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ACA844F501E
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 05:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3FC30DEC0;
	Fri, 17 Oct 2025 05:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t25hmaD0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9D34204E;
	Fri, 17 Oct 2025 05:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760679224; cv=none; b=NYrjIVGrZQrdTmPLWXIuC+nJAP1adIucsbydK+sAMQpyXryduGz1E2OOHMcXzsp70m7hjUOkxBE79zf6K0kFPlS4WaudqHxTlvZCl43Rh4OoCmlpFSe5G1FQzBZwdQjonA1PbhFblk/COxbfU2IqR30oXYH+D6jauZ3cBz2TJ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760679224; c=relaxed/simple;
	bh=T2E1D/MphmPrw6rHbqjf0FzJ6PvczskJKEsyhPn579o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVedmTYrEl8CtngSOQ7MsTZzR0E6QzRgl9uOj2PRzchRWcjI8zKgoCXxaBvj/6UyBbNZsuhKir5N838A9Ug8EG6m5LqetCZHWdwSrV6nECJHrDnUZ0MdKQN0e0iFDdoMr/vHYCRY+Xhad0OWpon8/TvERVmesYtuWXGegzVe33k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t25hmaD0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E48BC113D0;
	Fri, 17 Oct 2025 05:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760679224;
	bh=T2E1D/MphmPrw6rHbqjf0FzJ6PvczskJKEsyhPn579o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t25hmaD0wrlF8mvbR4esGGegxuhQA9Irby4jqcxFwekCMjglXgI690eoESyDAuQbT
	 Ay4XoX/GZ4bUH+kFZwEgYE4Fd1qapptd8DJFivPBaW1ZPYKf5btxLi8F1CcuC2MGr6
	 ORB8FgRKE9EN3ZTber2W4knF8Aax6VlPEhkbh0gbhJ+oJgyEsPX07PXp7B+RZfDCRK
	 tbseuo2uUMv9bX9qA5nr+vOGD6aHCqQSzIISwPgM90vlkzdT8RfYFZ1rTwAxu/yhc6
	 W9/VBafcgmRetcsdSpbNVpYHoaX+cRa70EOgbOB0d2GAQ4BH0fhBDpatoiA2EyBJD+
	 XfyrbsMgX07Eg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v9d62-000000001cb-2oTY;
	Fri, 17 Oct 2025 07:33:46 +0200
From: Johan Hovold <johan@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] media: vpif_display: fix section mismatch
Date: Fri, 17 Oct 2025 07:33:21 +0200
Message-ID: <20251017053321.6156-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251017053321.6156-1-johan@kernel.org>
References: <20251017053321.6156-1-johan@kernel.org>
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
Fixes: e7332e3a552f ("V4L/DVB (12176): davinci/vpif_display: Add VPIF display driver")
Cc: stable@vger.kernel.org	# 2.6.32
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/ti/davinci/vpif_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/media/platform/ti/davinci/vpif_display.c
index 70c89549f4b6..1e7815e9f8e0 100644
--- a/drivers/media/platform/ti/davinci/vpif_display.c
+++ b/drivers/media/platform/ti/davinci/vpif_display.c
@@ -1214,7 +1214,7 @@ static int vpif_probe_complete(void)
  * vpif_probe: This function creates device entries by register itself to the
  * V4L2 driver and initializes fields of each channel objects
  */
-static __init int vpif_probe(struct platform_device *pdev)
+static int vpif_probe(struct platform_device *pdev)
 {
 	struct vpif_subdev_info *subdevdata;
 	struct i2c_adapter *i2c_adap;
@@ -1390,7 +1390,7 @@ static int vpif_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(vpif_pm_ops, vpif_suspend, vpif_resume);
 
-static __refdata struct platform_driver vpif_driver = {
+static struct platform_driver vpif_driver = {
 	.driver	= {
 			.name	= VPIF_DRIVER_NAME,
 			.pm	= &vpif_pm_ops,
-- 
2.49.1


