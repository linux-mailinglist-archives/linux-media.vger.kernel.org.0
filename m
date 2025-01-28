Return-Path: <linux-media+bounces-25358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D724A20FD9
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E8861672FF
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 17:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387C81E1C02;
	Tue, 28 Jan 2025 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMrH4c2W"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0741E0B61;
	Tue, 28 Jan 2025 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086836; cv=none; b=QPCNQ+4XIRJ+F73bk7yKJI9wtMOpjLpkHEqD+d3ZiBQFv+4GJ+NumRHRngL7at6W7EufGZerP5q6H2VEI/UkN8JV4Cm+SUASnCztfBK2mbHhImlV3HYOrvrV92F8kguOnaa9tha/ApJMKnRhdm4fLabnDpNiWTDY86WwsfSwXnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086836; c=relaxed/simple;
	bh=XkXmMArbNvvj4vFv48WiqVxvsUM1hSZabdWEqOdwA64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JwKmiUk30TaFKh9FDH4g9ONQDOunrzcv6r/CfGJlZ/yqlrYXp3FEHrwbz9TnhWiU+05CkQXFYcY8+8qBVZz7Fb+R4ZcHopjQZN0cj3js4/vhLMC1d4QsXmiAZbYPlvuZ0HcInNx7shRrNZMJsyIOBNX0HnKgHW9CSZRdK2nZPvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMrH4c2W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE33C4CEE9;
	Tue, 28 Jan 2025 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086836;
	bh=XkXmMArbNvvj4vFv48WiqVxvsUM1hSZabdWEqOdwA64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RMrH4c2WY8Y79VYoYpVN744gyYrnRLrLMtm7mwR7b59YudfNGzWAQS3unyxmU9PfN
	 FEETyjrV8LI8A04P5Y4cAkUePgHDn5ha9z11aWMAuuqeJA/we2odO7R9C2qvOWqzRk
	 OJDhVNQWuwyyVXB7qxDI3xhhZeHJfyCF6e8RP6VF/mY8ZyvIiTfhBmyZ02h9ly/xJS
	 G76kNSKNrxIf09H/TnMlYF9rK7bG893u7lAFWzcWO8HU9SQ1LIokHxNHTpF0xX3C6C
	 3BX8/01bWbv6qCVNTc7U0xz6hZVtlR8Q5c9o3zeF+mUb8ImAc2W0WUDvnfCClEeCQy
	 PdbOshK8uoFOw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.13 05/15] media: bcm2835-unicam: Disable trigger mode operation
Date: Tue, 28 Jan 2025 12:53:36 -0500
Message-Id: <20250128175346.1197097-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128175346.1197097-1-sashal@kernel.org>
References: <20250128175346.1197097-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit

From: Naushir Patuck <naush@raspberrypi.com>

[ Upstream commit 697a252bb2ea414cc1c0b4cf4e3d94a879eaf162 ]

The imx219/imx708 sensors frequently generate a single corrupt frame
(image or embedded data) when the sensor first starts. This can either
be a missing line, or invalid samples within the line. This only occurrs
using the upstream Unicam kernel driver.

Disabling trigger mode elimiates this corruption. Since trigger mode is
a legacy feature copied from the firmware driver and not expected to be
needed, remove it. Tested on the Raspberry Pi cameras and shows no ill
effects.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 3aed0e493c81f..4090a8e477402 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -816,11 +816,6 @@ static irqreturn_t unicam_isr(int irq, void *dev)
 		}
 	}
 
-	if (unicam_reg_read(unicam, UNICAM_ICTL) & UNICAM_FCM) {
-		/* Switch out of trigger mode if selected */
-		unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
-		unicam_reg_write_field(unicam, UNICAM_ICTL, 0, UNICAM_FCM);
-	}
 	return IRQ_HANDLED;
 }
 
@@ -984,8 +979,7 @@ static void unicam_start_rx(struct unicam_device *unicam,
 
 	unicam_reg_write_field(unicam, UNICAM_ANA, 0, UNICAM_DDL);
 
-	/* Always start in trigger frame capture mode (UNICAM_FCM set) */
-	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_FCM | UNICAM_IBOB;
+	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_IBOB;
 	line_int_freq = max(fmt->height >> 2, 128);
 	unicam_set_field(&val, line_int_freq, UNICAM_LCIE_MASK);
 	unicam_reg_write(unicam, UNICAM_ICTL, val);
-- 
2.39.5


