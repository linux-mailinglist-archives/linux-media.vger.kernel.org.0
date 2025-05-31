Return-Path: <linux-media+bounces-33734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D650EAC9C69
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 21:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F2789E1AC8
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 19:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933B41A23A2;
	Sat, 31 May 2025 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h189i8ts"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0090E12F5A5
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 19:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748718348; cv=none; b=H75WLDZiIAuPvpD9Z0173eWA8HfdUEuVeIVfGMyXcTBLn4bfelNTQ6wDXOGHf+3M4mmdVuBY+MpYh46FfLpI+mOLFLGr7ULbRyG67OihfucUmv0+XVl4717crNSKevDW9EavOthGVRU3qXoJtfNZTGVIAMDIxIAS7aPRGvhb4sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748718348; c=relaxed/simple;
	bh=NJxGEEqwVUy5+P3xBlsdxuhfnXnZJv09UJtoUr64rak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeuXEAMpOxoh3MQ5BCB7TTdCT+RMAVaRyoMU3uGuO80rsB67Z1DkQAznvT6nA5O2c9YeDnRnjFpum72k9u6wPArS5iRgHvQdne53obpYlGZ55npJkVBKUKngkCIdduteOCRxxcYY8mU+Ny/s9uNL8EgExT/unsDHQSrh7cYVR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h189i8ts; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7234DC4CEF1;
	Sat, 31 May 2025 19:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748718347;
	bh=NJxGEEqwVUy5+P3xBlsdxuhfnXnZJv09UJtoUr64rak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h189i8tsHm+6AYBlhFyg42H5lvGwaWMF9uAdICglCIxrgHP1P8Per80LZXzg/v/sA
	 Nl99VPG28WDo56zjYagd5ZMTbFfJYMHMFFaCoz0rApAFy6VZpeb3sKHI0IZmn5WCuI
	 MVoy3zAeFzIzzVaUU0sY5/fkaX+WvlBDlyUPyt8AHcTYuJYgDI/48g/KWxF0fQfVOq
	 hwSFY/RaOGvRMn1lFJXwaRkr+83eydD0WCgO/HwtnCaBp39lOBdKTOYCoq/qzwXcJv
	 N3PF6I4sEePyPRimUN27uTk6Y4QOaM8T4nYnJr7sH/xY+TKI/40MwEFLmncMdAIYAy
	 UCLGefyy6R2hQ==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: hi556: Fix reset GPIO timings
Date: Sat, 31 May 2025 21:05:33 +0200
Message-ID: <20250531190534.94684-2-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531190534.94684-1-hansg@kernel.org>
References: <20250531190534.94684-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

probe() requests the reset GPIO to be set to high when getting it.
Immeditately after this hi556_resume() is called and sets the GPIO low.

If the GPIO was low before requesting it this will result in the GPIO
only very briefly spiking high and the sensor not being properly reset.
The same problem also happens on back to back runtime suspend + resume.

Fix this by adding a sleep of 2 ms in hi556_resume() before setting
the GPIO low (if there is a reset GPIO).

The final sleep is kept unconditional, because if there is e.g. no reset
GPIO but a controllable clock then the sensor also needs some time after
enabling the clock.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/hi556.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index aed258211b8a..d3cc65b67855 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1321,7 +1321,12 @@ static int hi556_resume(struct device *dev)
 		return ret;
 	}
 
-	gpiod_set_value_cansleep(hi556->reset_gpio, 0);
+	if (hi556->reset_gpio) {
+		/* Assert reset for at least 2ms on back to back off-on */
+		usleep_range(2000, 2200);
+		gpiod_set_value_cansleep(hi556->reset_gpio, 0);
+	}
+
 	usleep_range(5000, 5500);
 	return 0;
 }
-- 
2.49.0


