Return-Path: <linux-media+bounces-36223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE065AED124
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19F0E7A1323
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D81523FC52;
	Sun, 29 Jun 2025 20:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EySSYTMq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731A323D283
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230620; cv=none; b=W6r0st8NTfK7zi2hi8Mvcf3m37bl+kViK3/+c1R0pY2a5HvEoD/VBzxAE9e2xy5N/NgOze2MIRKrYNSuvShRoOmraMcRMrSX9vuPAy1ylY5Ej+nWR02pd8+rYMIWleRcqka1eYL7LDwkAtdsQJlWJeJu5LxHCy5PXmMCYyUeuBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230620; c=relaxed/simple;
	bh=XdpW0kAYXJ/3lbcee8WaElpqFwz3qRCuZ4NcxlWvR08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhIkKGPPdipY5zoZNNew4KtaJUJzKUubsNBKDFyzNEKF7bx045+ddzcNKJmOWFh3tRUqk7IfR9MdnnCcijYPbQqMx8B1oRe4x3C5ssPJu2uS8dZIdef7XViuKHzqx4X07uTU/FmpSBK7+gzX2HZt6hylqu3cGE2VmscMPv1XrsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EySSYTMq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1932DC4CEEB;
	Sun, 29 Jun 2025 20:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230620;
	bh=XdpW0kAYXJ/3lbcee8WaElpqFwz3qRCuZ4NcxlWvR08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EySSYTMqUKdnfUU8lk53wu1Ign0+L1F5D7F07swqjs4CHnlwxAD+yO/9+Nvb6se+R
	 ZCnF4UrUwDA5ehWdAiNCQecp9pCtaGZwnZKnpkAr92GCPuG3RsOdAOzVCbqbYGiywW
	 V+WlV5ELcPtAVWcdz9BA2yR40qkK+g4pJDtfRQj2k2WysJHBTN18LX5x5I+yCpMR5a
	 lOlwzKqYVLced7g4/JU7rXIruaWAxGJehloTAbf1yQ+GaWR7Ad/eHv1RMSq3/jqvUO
	 yh65U2GoR50dxN/bGSNBMW7GZ9x2nQAd6+mpwEXITGJxOkwEGDnq1C1r4lzw9C5Z2Z
	 TfFpyBALWKUTg==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 15/15] media: mt9m114: Add ACPI enumeration support
Date: Sun, 29 Jun 2025 22:56:25 +0200
Message-ID: <20250629205626.68341-16-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250629205626.68341-1-hansg@kernel.org>
References: <20250629205626.68341-1-hansg@kernel.org>
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
index 5e759a23e6cc..710c9a870458 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2643,11 +2643,18 @@ static const struct of_device_id mt9m114_of_ids[] = {
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


