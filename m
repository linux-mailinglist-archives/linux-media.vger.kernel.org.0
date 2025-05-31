Return-Path: <linux-media+bounces-33726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F077FAC9BBB
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 458A917D16B
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0BC18C002;
	Sat, 31 May 2025 16:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLQoWmHF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8158D175D53
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 16:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709131; cv=none; b=YkvkfKSSpSk8Z4gxuhuZaKINExOliXf0pa+kSdgNniWwzAWAyg16CzllgKmCubCkVWgg57dDjDgVHzMSizKT2M2nBeXJSCVC9PKavy4qI89ECgeaIcHESK5W4L8vuHXXTiDUUZwIwgbDRJGCxHUcwuHZk+In5vcKgF7E4nMS6OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709131; c=relaxed/simple;
	bh=OEefwPIAykmQwDwijRLibsprpZb0BzXfAAn/GoAPEAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1HdOtG6r95fOtNsVVme2g/2WUXrvD0xl73a0NYp0qK46mWKruh9IxkalvZYOac+mzSFd6VvmNSIVtUMNR3iWSDo88iJ4Ra/k+3DivOwM/oVX5NWTT6oaMm2s7TkzMmxiOLnXT8zvYRsb2bGen9bOm0qoGsHedvyTe0odSkx7Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLQoWmHF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4509C4CEEE;
	Sat, 31 May 2025 16:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748709131;
	bh=OEefwPIAykmQwDwijRLibsprpZb0BzXfAAn/GoAPEAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NLQoWmHFvzQeA4yp1IDOjRsqZ0jij8jNS4xvsgGf9b21KcfrDz7RpE+Zurh0dC6Wm
	 usW2aWnE+aO27PQ8GR5iqlxVv7tTe1xCl75f7BZzDsY1yEyj6jh7VHfbZhabZruUVg
	 l8HKRYYZTMgpLzOuMOmxoEStfhbCvDblQ6BfWlQJiCsr0pdJfESNQHmdY1/g5pZ79V
	 wmf7JqG/E5Nq31ixCJihMafZt35aXQfY8CdoYtJzVVv2HQjJRvPgjDAxYqaHzlaCv9
	 CJ79RdsD98iqLuMACWt9CM1vced/vTMvvXWdkmfX+f31XUe9GbeNKlS6CegIZqyYP5
	 kWS5hZlmCTAIQ==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 07/12] media: mt9m114: Avoid a reset low spike during probe()
Date: Sat, 31 May 2025 18:31:42 +0200
Message-ID: <20250531163148.83497-8-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531163148.83497-1-hansg@kernel.org>
References: <20250531163148.83497-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt9m114_probe() requests the reset GPIO in output low state:

	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);

and then almost immediately afterwards calls mt9m114_power_on() which does:

		gpiod_set_value(sensor->reset, 1);
		fsleep(duration);
		gpiod_set_value(sensor->reset, 0);

which means that if the reset pin was high before this code runs that
it will very briefly be driven low because of passing GPIOD_OUT_LOW when
requesting the GPIO only to be driven high again possibly directly after
that. Such a very brief driving low of the reset pin may put the chip in
a confused state.

Request the GPIO in high (reset the chip) state instead to avoid this,
turning the initial gpiod_set_value() in mt9m114_power_on() into a no-op.
and the fsleep() ensures that it will stay high long enough to properly
reset the chip.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/mt9m114.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 371e96d9e281..fe30b9ff84ad 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2439,7 +2439,7 @@ static int mt9m114_probe(struct i2c_client *client)
 		}
 	}
 
-	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(sensor->reset)) {
 		ret = PTR_ERR(sensor->reset);
 		dev_err_probe(dev, ret, "Failed to get reset GPIO\n");
-- 
2.49.0


