Return-Path: <linux-media+bounces-34575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C1AD6847
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 08:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9950E170ABC
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 06:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A89021171D;
	Thu, 12 Jun 2025 06:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="BVqcTbb7"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8586A2F4325;
	Thu, 12 Jun 2025 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749711259; cv=none; b=OLdAqEAXSig0U7aK8qYXEe0pw7d2vDkRcdEaNnjh1iuDfw96DtsidOz/3Zx3UWipuskRNXNk+tjC3S90ElZvCp5lDTqlIRG4yKgcNykOUqMfo2FQMyqCQCFYld9DfBuG0Ge9MMAeU4MqpC3lzeHZlm6s0kfoaJ8TZg9mZfgMqYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749711259; c=relaxed/simple;
	bh=abOkBWJGlLGt8B6Uxene1xzpp8AN59b8XJc9hJfjlf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eP4DtUyxPRz5FfQIYpcWLvLsoW4mgEAkQrkTTyl5jlQ3h8LlhyljU470fEPBejLB/56V0upC0PVvL7X6OR2hc3QG5h7ct/Z2RS8/jnfyLGc1vvHBkeJfz6l2JuelpkHVkU5u8Kh1b1E5dPxMoigVPJnctGVUX24RVd7QTsNbcXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=BVqcTbb7; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vRObdDN3QzY2W/qwTV0fHN32ShwflGcphDsUHMARNFo=; b=BVqcTbb7B2uLKpsYnNbLx7pq1z
	rqztQy5g7dG6p3Tu0AzRtWe3qLwv6QY1CmonYuk9fwWDBg5xo1rJSz3QFMYNpDCiiMfDi9mIkin4x
	NNAXxd/jdvGciJXpB2VniLBPVS3suy16iFmDsJARWNBBtprPw3zJEEEQBKwY6+nbx7S8=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:59918 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uPbpF-003wuh-LP; Thu, 12 Jun 2025 08:54:13 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Thu, 12 Jun 2025 08:54:10 +0200
Subject: [PATCH 1/3] media: dw9714: coding style fixes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-dw9714-v1-1-1a2d6d682829@emfend.at>
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
 
 Content preview:  Besides minor fixes, this series mainly adds support for the
    powerdown pin. Note: I already sent a single patch for power down pin support,
    but since more things have changed and this has become a series, I've decided
    to start it with V1. 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 Local_hs1_NotHoststar  Sender is not from hoststar.ch|de|com
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment

Just some minor coding style fixes reported by checkpatch.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/dw9714.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
index 2ddd7daa79e28a2cde915b4173fa27e60d5a2b57..1392cddab738ce38efa18b2b9bd7821bddaa0626 100644
--- a/drivers/media/i2c/dw9714.c
+++ b/drivers/media/i2c/dw9714.c
@@ -144,7 +144,7 @@ static int dw9714_probe(struct i2c_client *client)
 
 	dw9714_dev = devm_kzalloc(&client->dev, sizeof(*dw9714_dev),
 				  GFP_KERNEL);
-	if (dw9714_dev == NULL)
+	if (!dw9714_dev)
 		return -ENOMEM;
 
 	dw9714_dev->vcc = devm_regulator_get(&client->dev, "vcc");
@@ -247,7 +247,7 @@ static int __maybe_unused dw9714_vcm_suspend(struct device *dev)
  * The lens position is gradually moved in units of DW9714_CTRL_STEPS,
  * to make the movements smoothly.
  */
-static int  __maybe_unused dw9714_vcm_resume(struct device *dev)
+static int __maybe_unused dw9714_vcm_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
@@ -271,7 +271,7 @@ static int  __maybe_unused dw9714_vcm_resume(struct device *dev)
 				       DW9714_VAL(val, DW9714_DEFAULT_S));
 		if (ret)
 			dev_err_ratelimited(dev, "%s I2C failure: %d",
-						__func__, ret);
+					    __func__, ret);
 		usleep_range(DW9714_CTRL_DELAY_US, DW9714_CTRL_DELAY_US + 10);
 	}
 

-- 
2.34.1


