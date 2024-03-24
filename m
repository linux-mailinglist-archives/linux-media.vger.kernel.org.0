Return-Path: <linux-media+bounces-7690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B18887D82
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 17:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9A961F21335
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 16:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910911865B;
	Sun, 24 Mar 2024 16:01:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C070B6FB5
	for <linux-media@vger.kernel.org>; Sun, 24 Mar 2024 16:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711296067; cv=none; b=mPIcJcyANBnhfAiRDVCRx3TwL6a57dnqi7zf+e3oyTCdFSkeKaAcBFbho2CdBT2BDCf1N4NVGP9TCzIINQmSy5l1PYf7xhEusMMn7rcAzVhh4S+RyECOYDKoxr8TJUCNPKccEvPZSNzK/jcOnVH9aeoeaCvT4xp8EmKUCoM+6cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711296067; c=relaxed/simple;
	bh=EhTKRWbXqspf1kKoBsfNHR0DsB3m5Pshc4bCERyI3jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T0+PrphwneVKWKDoFxPN57lDuh5u6fmncoe3SIj5xSgH58JxB//oRAK78s86hmlzC2txlLQP6o5TWzEyTMiRhdzNL2fYnZubirs9APbRg42GUGkOYMtXxGok9eqYoO+WHNnzSmxO/CBPxkxe8y641DnK3vR2WfZq33rNYbPqOTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1roQHE-00089K-TB; Sun, 24 Mar 2024 17:00:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1roQHD-008FTy-81; Sun, 24 Mar 2024 17:00:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1roQHD-00AShw-0V;
	Sun, 24 Mar 2024 17:00:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Pavel Machek <pavel@ucw.cz>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: linux-media@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] media: i2c: et8ek8: Don't strip remove function when driver is builtin
Date: Sun, 24 Mar 2024 17:00:44 +0100
Message-ID: <20240324160045.238647-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1690; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EhTKRWbXqspf1kKoBsfNHR0DsB3m5Pshc4bCERyI3jg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmAE4tkgaDLIgukUiIe93ELbkGRd42Rv4FoT+zC jLvcwFPHZWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZgBOLQAKCRCPgPtYfRL+ ThLzCACwcntg/ltst45uxMd8CuOO4EdO9O5xHAC/De2gyEw8GI8XI1hBeGZbU58liGxWV7FNBsU EoUmCvl9953SvqeFn9/lGkoThc6/7WLXXlRLb6Z5xr6LRQR027F4Ms5rfcFTbA/vl6yiM66hTuq KIMyA+f8h/RqRP5wqBXN0FK+UM5LQs9eiXr1Q9bjjx9q2eLOTx8oIjDnE5ti85DxHioKWMVnw8P BqwoGrbPoCIdFklKnEUI0F3HTOAZssE/n8m/wPohGi2cB2Yq0yzAvr52UftDF2mlw/62517tdyr p0FYhGbbpC6O18Q9GxqwPnSPhLfzzE0xXkB1RClBuibb1cqA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Using __exit for the remove function results in the remove callback
being discarded with CONFIG_VIDEO_ET8EK8=y. When such a device gets
unbound (e.g. using sysfs or hotplug), the driver is just removed
without the cleanup being performed. This results in resource leaks. Fix
it by compiling in the remove callback unconditionally.

This also fixes a W=1 modpost warning:

	WARNING: modpost: drivers/media/i2c/et8ek8/et8ek8: section mismatch in reference: et8ek8_i2c_driver+0x10 (section: .data) -> et8ek8_remove (section: .exit.text)

Fixes: c5254e72b8ed ("[media] media: Driver for Toshiba et8ek8 5MP sensor")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index f548b1bb75fb..e932d25ca7b3 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1475,7 +1475,7 @@ static int et8ek8_probe(struct i2c_client *client)
 	return ret;
 }
 
-static void __exit et8ek8_remove(struct i2c_client *client)
+static void et8ek8_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
@@ -1517,7 +1517,7 @@ static struct i2c_driver et8ek8_i2c_driver = {
 		.of_match_table	= et8ek8_of_table,
 	},
 	.probe		= et8ek8_probe,
-	.remove		= __exit_p(et8ek8_remove),
+	.remove		= et8ek8_remove,
 	.id_table	= et8ek8_id_table,
 };
 

base-commit: 70293240c5ce675a67bfc48f419b093023b862b3
-- 
2.43.0


