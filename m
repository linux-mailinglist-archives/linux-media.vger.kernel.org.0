Return-Path: <linux-media+bounces-31065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60466A9C99A
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 14:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BAEA9E304C
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826592586CE;
	Fri, 25 Apr 2025 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKcFe9ix"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1056257423;
	Fri, 25 Apr 2025 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585609; cv=none; b=u37Mee3PUa8pXdxPoo7sOut2CLvd75kC1qk03AQkcEAaYZqrk4ScLTcHo8utTHHHZYZ+6goJYSqLdCaT4Mp1rt7lg5fOzCvWJboVrXLDBrQ8vPrc0tUdsq7RjcYqfwP8tN9f6eme5oXPlI8rd6RBqC6p2udkUXZOWBMYyAsILxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585609; c=relaxed/simple;
	bh=VScF1dmz0O+sozzekc2GcqtZnf0Ewh5p9YhXVoJabvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4AHgJKPJ9R/5COuQ3tKg83vcxWSOLPBgSm8pi0nT0Rs4jnvlr/xs+GvasbsabYXT1a7Yr2pcbY9lbwZC3fxwAvzBlQwP+qSpOvVjWaiy4tVKk+N6YCfmMmLj68bg2s7XbU4n37hLm8OgSZ0etbfBUUbjMLesJOvs8tfske775s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKcFe9ix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E52AC4AF09;
	Fri, 25 Apr 2025 12:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745585609;
	bh=VScF1dmz0O+sozzekc2GcqtZnf0Ewh5p9YhXVoJabvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MKcFe9ix/j83MZ4fOJlJrWE6+VmAr+XJfYi3lS16vJ0azXt/OA3e78goN4EKcJ25i
	 xcupZFEQcz0uf/d8XdttsBeQqX0Ff7JcM4LlaE8YbyktLrkyltva380T/G/ytUp0Di
	 9DL7KBt7xz7/W2JJ5J+8dz8Fe+jJ2zHMz3WKDPa2nW617ZCK0Gm9L1O4/Yo7tpyFlV
	 JiDM61q/njRW81BZaufXzQ8g0NroGhIGmaq8GaDRy46JcXJo14ISQK8FewrXEI56jc
	 NJBIzXvHHhL1ZTBpGXCD0BxRiH36+KF6fgsGDcH9S9vLJGYivTXaugZCdXsbTeITtG
	 GnVAIbNRNx3oA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u8IYd-000000007Oc-0Fhr;
	Fri, 25 Apr 2025 14:53:31 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/2] media: ov5675: suppress probe deferral errors
Date: Fri, 25 Apr 2025 14:52:37 +0200
Message-ID: <20250425125238.28346-2-johan+linaro@kernel.org>
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

	ov5675 24-0010: failed to get HW configuration: -517

Drop the (mostly) redundant dev_err() from sensor probe() to suppress
it.

Note that errors during clock and regulator lookup are already correctly
logged using dev_err_probe().

Fixes: 49d9ad719e89 ("media: ov5675: add device-tree support and support runtime PM")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/media/i2c/ov5675.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index c1081deffc2f..e7aec281e9a4 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1295,11 +1295,8 @@ static int ov5675_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ret = ov5675_get_hwcfg(ov5675, &client->dev);
-	if (ret) {
-		dev_err(&client->dev, "failed to get HW configuration: %d",
-			ret);
+	if (ret)
 		return ret;
-	}
 
 	v4l2_i2c_subdev_init(&ov5675->sd, client, &ov5675_subdev_ops);
 
-- 
2.49.0


