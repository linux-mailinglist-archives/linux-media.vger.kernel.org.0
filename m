Return-Path: <linux-media+bounces-45743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA5AC134B4
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59321583806
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDC323D2B2;
	Tue, 28 Oct 2025 07:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wf8NHudd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9465270EAB;
	Tue, 28 Oct 2025 07:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636507; cv=none; b=TtUzh91N7g0aj0VJa5zndTPfn3YWtCOLC1EWu7s8ALEk9LBA5Ee6nEVZe2xMkm2JxCVT6FM+HRq1ZHOtH93oO12HdCHE91WrfZmiiL6s1spF8o8gZaooPeXcVoaSEvcfqG3pOz+lvbtKyaHHo/+sjjcqfL/iJ3gLdcG6Dx3YHoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636507; c=relaxed/simple;
	bh=y2/5q2c963HrAKPoNqekg85MiTjudgkhnTO49szxG1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kK0RcUg/GxL5ZAr/5Fulw+7y43Ohsl2piYJOvFwgfmu/0khAEr6+BrCv/sOH0ZrBpP5uNJLEraGdfPk09vMkpMdCQ+YG1xvbrRX1Obl8zYhOfVNcFa3txGa0bLga8fPk1XwNsHeIDTCkPYLQMglwVhH34wi9SSIO1qziK5IF50A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wf8NHudd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0808A16CD;
	Tue, 28 Oct 2025 08:26:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761636395;
	bh=y2/5q2c963HrAKPoNqekg85MiTjudgkhnTO49szxG1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wf8NHuddwsskBOuBNq1kMr5xdgtBGpo1TLCz4NinctEwz3K3pIdvGWEnjHkSPmF2S
	 RPpp/WIbHyg7WZqVoX9A1Ip4k0vWlY9J+Nel1IFvY5mRVZpCf7Ms1eftyvcSC1TERz
	 rRIvT9vfXXt76v/mKagoZCCCeXj9Yn9JyNDOEniw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 28 Oct 2025 12:57:16 +0530
Subject: [PATCH 05/13] media: i2c: ov5647: Sensor should report RAW color
 space
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-rpi-ov5647-v1-5-098413454f5e@ideasonboard.com>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
In-Reply-To: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=UxmCaD46HmJQuUVO8AEj5Rqgfb7dYdy3dtfPYb6H5qI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAHBuDpoXdhukx7/xQxGDhkhxz4OSK9x/kzL+M
 bg7m3+L78WJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQBwbgAKCRBD3pH5JJpx
 RQ5AEACfnCEJMYZgqnLfdXP4Q3qrreuyBk9IRT9P1xQNtLbGo+sgqvZgXSOMz5+WvaXlsKhkfzD
 6h2sKot0ofkeKLV/9b9/o/GJzsISgJvjlsmJxeOoNt2tY7Z3OdYt50pHzS9G7RnWiHJGt+8c/vG
 HesDbKtYmXaRTBmJZ7U1nd14Ps/2Mg+bdK5vY5FnRCYemYaJlhlTHLxH+9ZPEr4jURzR2cqO0Ho
 P/bIXdO+zSlNBCBRKQrOGo9SfJHsNSTmcm1DYMqMP46j0v0KqhZ+cObPWsvrRWYxeU5olccX1CB
 vq+MR+u+3bxEixIRwItzADV9pYWSce+5bfUWS6NRxJ+r6dJ4m1oW1QbfQTa0Wo/mJx/IuY1+Kp8
 YLV+sh5Y4++6tsD1/2gKdDl+piw2AIUv/A96asicLzX7TsUtRVxi5ltOaGQi+CPny9okWQ7Cc56
 s36G5tJIcISrubt5PWqQqsBjl8ArJxCWBbiWyBW5dJ/qMpkpTDXcezwaB1cDxNZy0Mser27dFdL
 1RbwRu0LP28F2iFzFvwfwbXfdsCitlqSOvVvlitXj8SDlCmC3EpKqyakFY9bVmZXUH3OPrPdt1G
 AC1bl3qVBPdXg9EuuIVP6E66Xw7QrgjVD5aucgYy9jY2ABq11f+vpDPkgv4dfg0/yhW0wrysxRP
 M7tlxY48jXLUTrA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

As this sensor captures RAW bayer frames, the colorspace should be
V4L2_COLORSPACE_RAW instead of SRGB.

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 8f11b5cbdc1658019e1340e641c7e6f398bff503..977b878b0d4b8cd5f39f510ebd8b33c9163f7da2 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -508,7 +508,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 2592,
 			.height		= 1944
@@ -529,7 +529,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 1920,
 			.height		= 1080
@@ -550,7 +550,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 1296,
 			.height		= 972
@@ -571,7 +571,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 640,
 			.height		= 480

-- 
2.51.0


