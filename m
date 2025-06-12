Return-Path: <linux-media+bounces-34574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D58A6AD6848
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 08:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C0641898950
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 06:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C57620F078;
	Thu, 12 Jun 2025 06:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="iQWp9/ya"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859081F419A;
	Thu, 12 Jun 2025 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749711259; cv=none; b=abGOiI++gEgjVWhy+MuBPNDDchpDFQl2eUqsBreVy+15GYI40urNrCShHzRCZLisk6adBu6K9GG5IV725PiI5FtIO+vqR3iCcVCP8j9V13KODfbfJB53VvKmGvLAWwBWZvbExynZy72jUAdzVztk5O840FoOKGCQGAWBBeE4qt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749711259; c=relaxed/simple;
	bh=shvm3JSe1YLteXq1Iq05JnBx+znmHne5CKADCDUG+M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GUs+TjhPRSJP0PaRCg4roeNSniWa90c7yJhZCXKl9wLmxbTdQCpUpWf0D1GFXfvxi60CrDUTzjuKiqJJWvREH7AvWQP63xhlkxitgQcQtexWqMj9sRdCTbk8Do9fKZFEL8E14C/dlzgqdKqOpBl/0K5/f1onEe3bsgjHSHFnSrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=iQWp9/ya; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GHOXo2JErjFm80UUzfcS2rg1o0GmPsZ/2xPfv1KLyuY=; b=iQWp9/yaldM/wVqIkJ0rIbjJU3
	RLWwU/m9Sa8gG5p8RjShnvFGZa+TnNcR/V1ifLMxWH76v+2X10xmiyMf2C9dt+zzTtTZdLky1F5wX
	zTydPovT+RkpxWJpNYOhD/QH5XjrrmocdgtbD/ELona3hGSSpD9G7GOwA5khXwF5Vq40=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:59918 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uPbpG-003wuh-52; Thu, 12 Jun 2025 08:54:14 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Thu, 12 Jun 2025 08:54:11 +0200
Subject: [PATCH 2/3] media: dw9714: move power sequences to dedicated
 functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-dw9714-v1-2-1a2d6d682829@emfend.at>
References: <20250612-dw9714-v1-0-1a2d6d682829@emfend.at>
In-Reply-To: <20250612-dw9714-v1-0-1a2d6d682829@emfend.at>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Just some minor coding style fixes reported by checkpatch.
    Signed-off-by: Matthias Fend <matthias.fend@emfend.at> --- drivers/media/i2c/dw9714.c
    | 6 +++--- 1 file changed, 3 insertions(+), 3 deletions(-) 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 Local_hs1_NotHoststar  Sender is not from hoststar.ch|de|com
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment

Move the power-up and power-down sequences to their own functions. This is
a preparation for the upcoming powerdown pin support.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/dw9714.c | 44 +++++++++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
index 1392cddab738ce38efa18b2b9bd7821bddaa0626..2abd4fb5e7c0f02ab96bf8fa5f557941187920a3 100644
--- a/drivers/media/i2c/dw9714.c
+++ b/drivers/media/i2c/dw9714.c
@@ -137,6 +137,24 @@ static int dw9714_init_controls(struct dw9714_device *dev_vcm)
 	return hdl->error;
 }
 
+static int dw9714_power_up(struct dw9714_device *dw9714_dev)
+{
+	int ret;
+
+	ret = regulator_enable(dw9714_dev->vcc);
+	if (ret)
+		return ret;
+
+	usleep_range(1000, 2000);
+
+	return 0;
+}
+
+static int dw9714_power_down(struct dw9714_device *dw9714_dev)
+{
+	return regulator_disable(dw9714_dev->vcc);
+}
+
 static int dw9714_probe(struct i2c_client *client)
 {
 	struct dw9714_device *dw9714_dev;
@@ -151,13 +169,10 @@ static int dw9714_probe(struct i2c_client *client)
 	if (IS_ERR(dw9714_dev->vcc))
 		return PTR_ERR(dw9714_dev->vcc);
 
-	rval = regulator_enable(dw9714_dev->vcc);
-	if (rval < 0) {
-		dev_err(&client->dev, "failed to enable vcc: %d\n", rval);
-		return rval;
-	}
-
-	usleep_range(1000, 2000);
+	rval = dw9714_power_up(dw9714_dev);
+	if (rval)
+		return dev_err_probe(&client->dev, rval,
+				     "failed to power up: %d\n", rval);
 
 	v4l2_i2c_subdev_init(&dw9714_dev->sd, client, &dw9714_ops);
 	dw9714_dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
@@ -185,7 +200,7 @@ static int dw9714_probe(struct i2c_client *client)
 	return 0;
 
 err_cleanup:
-	regulator_disable(dw9714_dev->vcc);
+	dw9714_power_down(dw9714_dev);
 	v4l2_ctrl_handler_free(&dw9714_dev->ctrls_vcm);
 	media_entity_cleanup(&dw9714_dev->sd.entity);
 
@@ -200,10 +215,10 @@ static void dw9714_remove(struct i2c_client *client)
 
 	pm_runtime_disable(&client->dev);
 	if (!pm_runtime_status_suspended(&client->dev)) {
-		ret = regulator_disable(dw9714_dev->vcc);
+		ret = dw9714_power_down(dw9714_dev);
 		if (ret) {
 			dev_err(&client->dev,
-				"Failed to disable vcc: %d\n", ret);
+				"Failed to power down: %d\n", ret);
 		}
 	}
 	pm_runtime_set_suspended(&client->dev);
@@ -234,9 +249,9 @@ static int __maybe_unused dw9714_vcm_suspend(struct device *dev)
 		usleep_range(DW9714_CTRL_DELAY_US, DW9714_CTRL_DELAY_US + 10);
 	}
 
-	ret = regulator_disable(dw9714_dev->vcc);
+	ret = dw9714_power_down(dw9714_dev);
 	if (ret)
-		dev_err(dev, "Failed to disable vcc: %d\n", ret);
+		dev_err(dev, "Failed to power down: %d\n", ret);
 
 	return ret;
 }
@@ -257,12 +272,11 @@ static int __maybe_unused dw9714_vcm_resume(struct device *dev)
 	if (pm_runtime_suspended(&client->dev))
 		return 0;
 
-	ret = regulator_enable(dw9714_dev->vcc);
+	ret = dw9714_power_up(dw9714_dev);
 	if (ret) {
-		dev_err(dev, "Failed to enable vcc: %d\n", ret);
+		dev_err(dev, "Failed to power up: %d\n", ret);
 		return ret;
 	}
-	usleep_range(1000, 2000);
 
 	for (val = dw9714_dev->current_val % DW9714_CTRL_STEPS;
 	     val < dw9714_dev->current_val + DW9714_CTRL_STEPS - 1;

-- 
2.34.1


