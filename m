Return-Path: <linux-media+bounces-33731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2431DAC9BC2
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC02F3BA88D
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B625119049A;
	Sat, 31 May 2025 16:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I37jfUPZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245CD17F4F6
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709142; cv=none; b=QNLqWs7iw8Lwuns+rm5U18SeKwsgThtoipbmDnHZ7M9lAIbiWf6G0nXWA3B5P+Fk63I97Ill1pOCt3jubsazPlvUJok+DDlvObQDfrcYFQ8OMF9koLdi7SE+yhV5WftmJvWu592nn4m2ROhyVzSNW/snaXSLLwEb+cQbyDgIh60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709142; c=relaxed/simple;
	bh=wQnubiA8yJ/LWSUmzmGSLc7jr5KqwmUcB4wkxP6AlyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iDo/lH98UeeH7kI2YbRSXvD4ajWnY3sGlrrWeZY0MEf04sdCwAULxQ5lStsbi0pjwF74L7MLZy4SwS5dLw8b0X0brK9UTpYDf44OCxQePldZG1nSFbOgZ5JBlkr4JOQnejz6kxYAnOkjMh+a0oGADf2tD/cUbAoYdTKwsp+oEfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I37jfUPZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0257CC4CEEF;
	Sat, 31 May 2025 16:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748709141;
	bh=wQnubiA8yJ/LWSUmzmGSLc7jr5KqwmUcB4wkxP6AlyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I37jfUPZhBozpakLRdaENcdjadz1y5MKldbRXGPlpp0KNjbO67V2VEIHEABsSbm1b
	 6blqAtIpk2wsQg+QY+YNRAyt4KKSglsSggHiy5J/0p8p4YYMXomo0IWQpnZ7wpHMJm
	 mhFM4F/Z6aY7HGQJ0QvtswaWP7Hmo6RI6wk8S6+oR9dD8QRjQC/uPwkX55FiFfVYS4
	 MyfyPePaYZKUAD7QYDTsXsUuJ/0RGo0IzzFLCSzxn0ECkCyCzRvOHmB61KXBpQWulP
	 TEmEE5WLzfsoFV6jUq8dbx/QuC93dohovNnGMvji/5pePLh8yOydzJ7lYYwH+n7vuN
	 oSYbj0lktCDuQ==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 12/12] media: mt9m114: Add ACPI enumeration support
Date: Sat, 31 May 2025 18:31:47 +0200
Message-ID: <20250531163148.83497-13-hansg@kernel.org>
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

Add support for the mt9m114 sensor being enumerated through ACPI
using the INT33F0 HID as found on the Asus T100TA.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/mt9m114.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 72914c47ec9a..ec56768983e4 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2594,11 +2594,18 @@ static const struct of_device_id mt9m114_of_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
 
+static const struct acpi_device_id mt9m114_acpi_ids[] = {
+	{ "INT33F0" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(acpi, mt9m114_acpi_ids);
+
 static struct i2c_driver mt9m114_driver = {
 	.driver = {
 		.name	= "mt9m114",
 		.pm	= &mt9m114_pm_ops,
 		.of_match_table = mt9m114_of_ids,
+		.acpi_match_table = mt9m114_acpi_ids,
 	},
 	.probe		= mt9m114_probe,
 	.remove		= mt9m114_remove,
-- 
2.49.0


