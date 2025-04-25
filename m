Return-Path: <linux-media+bounces-31064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13261A9C997
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 14:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 273C19C7FCF
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A112580ED;
	Fri, 25 Apr 2025 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUYcf2/n"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66092571B1;
	Fri, 25 Apr 2025 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585609; cv=none; b=qsswBMmNNRCzdEOa/6PubaH1qBDFzdnfv2sDZNmFTo832SjOVEvGA2rLBwc8WXhsjk/BvBJURHyRqneF9oq3iLS0BSj5LCNG0qlwH5RnARBOCfwoa7Ebq2EoESOYjCwydS5J6XNhRM94Jp59nq2eGz/MwoUwTbRoSEK7A0s3AYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585609; c=relaxed/simple;
	bh=DavfpiZtyAiaygJhlYOgeY0PwmeprcdOrPwYCWNgMZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugyXdenKji1+DZQ5sWauL4G9yUtC3aAvc0z5+fYwh8P5X2CHcpLZfZvtXnLfuczQCE2vAWCfFPTwdW5xO7mkdq2e7nXx99c6gLGXDvXw3YId5VcAqptVGYc7nBUNaAgsBKQecZn4R/iQ8uY/xO6S7oT6rcQT2Wh46Wwd2RTryAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUYcf2/n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC2EC4CEED;
	Fri, 25 Apr 2025 12:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745585609;
	bh=DavfpiZtyAiaygJhlYOgeY0PwmeprcdOrPwYCWNgMZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QUYcf2/nuN5bkodzUF90qkzEvrZwd2wSXB9CVcyMPMpQ6NEM0RlhxhUcWWg8WB2Sy
	 qBbdLTmxOMy3GOuOS4Fd9kKIwrIiOB5rcH+F2uziq7JWHWl6xyxBPNqtmaa6AXZGRW
	 5KJsw+10EnI1t9WRB8v3KE8CTJ6d+8wD9O12VpNV+YBKQhb2EFkfvjUOlnGsxJ+RlM
	 o/AGWZ4jsGYhUTBTqw3BHNEMldHvpWrlh6XEPFz++vVTXHa5VvPACdRYpRYwZ6IYiN
	 MZTXc/Us/f3Cc9b5KCI+Ttpyg/pIIvJWQixyES9HjaT5l4S8ff95ZhV1fYtLX7C0nr
	 jjz7KD/QgPgXg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u8IYd-000000007Oe-0fHk;
	Fri, 25 Apr 2025 14:53:31 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/2] media: ov8856: suppress probe deferral errors
Date: Fri, 25 Apr 2025 14:52:38 +0200
Message-ID: <20250425125238.28346-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425125238.28346-1-johan+linaro@kernel.org>
References: <20250425125238.28346-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe deferral should not be logged as an error:

	ov8856 24-0010: failed to get HW configuration: -517

Use dev_err_probe() for the clock lookup and drop the (mostly) redundant
dev_err() from sensor probe() to suppress it.

Note that errors during regulator lookup is already correctly logged
using dev_err_probe().

Fixes: 0c2c7a1e0d69 ("media: ov8856: Add devicetree support")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/media/i2c/ov8856.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index e6704d018248..4b6874d2a104 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2276,8 +2276,8 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856, struct device *dev)
 	if (!is_acpi_node(fwnode)) {
 		ov8856->xvclk = devm_clk_get(dev, "xvclk");
 		if (IS_ERR(ov8856->xvclk)) {
-			dev_err(dev, "could not get xvclk clock (%pe)\n",
-				ov8856->xvclk);
+			dev_err_probe(dev, PTR_ERR(ov8856->xvclk),
+				      "could not get xvclk clock\n");
 			return PTR_ERR(ov8856->xvclk);
 		}
 
@@ -2382,11 +2382,8 @@ static int ov8856_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ret = ov8856_get_hwcfg(ov8856, &client->dev);
-	if (ret) {
-		dev_err(&client->dev, "failed to get HW configuration: %d",
-			ret);
+	if (ret)
 		return ret;
-	}
 
 	v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
 
-- 
2.49.0


