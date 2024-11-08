Return-Path: <linux-media+bounces-21139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 386FF9C1955
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC87828554D
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10751EBA06;
	Fri,  8 Nov 2024 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rt0yVxLR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD981EABA2;
	Fri,  8 Nov 2024 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058542; cv=none; b=cV7dwxRoVuV4652k8B4kYZYNm9o9G1ukDNvhYLrgqj43UCOImLE/TZCOqCAGU2R7roGRGYtbLGTozRZ+qlWMh39SIo1oOVYnNwKt6PgoQq1MUCqoDXRCCfwMnc3aHIubp1zmI32LIY4Ew6mHDWyg3tkzAkEH4wB+lZlcfBHQ+SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058542; c=relaxed/simple;
	bh=F4Yp+U6nA046A4kQeZWpOFa99vdkMkgLtGHd/gDDUno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JHS2DpSid5POWaRBBmVB7Z5bs9BIv4rMJG/UeO+39IGqt9wZJd7ihe5dD4qSyplRqTJCSqhZkgG3RGlAibE2YXKSErS6ZhohKT9MxiEt9zJBEzNQuq0OqcPxMN1sDTddAefGvd6VRiEkp6uTS98L6PvCGGoTTXeH4YmHMRWI12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rt0yVxLR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C650FD21;
	Fri,  8 Nov 2024 10:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058515;
	bh=F4Yp+U6nA046A4kQeZWpOFa99vdkMkgLtGHd/gDDUno=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rt0yVxLRZaMWnBsgzCwAJqrH/Fdb7lfeAo0tYrqxwDOrN6ew3ylCh2QOI1RmWPvhf
	 RAVIDjO3OOfXrYROHOHIRGI2ayN8gXlZyg5zAsYJogf6WDIxlc7TDW3jFSFQD/EO3z
	 vkymBYwMQRLVW4zsUZy4nYnbpWZbeolsntUcYqLc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:59 +0200
Subject: [PATCH v2 15/15] media: i2c: ds90ub960: Fix shadowing of local
 variables
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-15-c7db3b2ad89f@ideasonboard.com>
References: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
In-Reply-To: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2197;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=F4Yp+U6nA046A4kQeZWpOFa99vdkMkgLtGHd/gDDUno=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtSeueJWCH95YIyUx2Y4TEs1qV169c7HYUSo
 aemv9/fQgKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bUgAKCRD6PaqMvJYe
 9XnyEAClaoTP9wTfeiEAMJ9L7atuJnChduzSWS0skBD4qOapfQXpUA9mMqLDkFGERZZWqNb8t0M
 bRUFg+RQrrdB/dRsk+Q/5hcENKLUDeblvma47RO6Swu8yXIgwPk1ymN0k/sIwjslsSaoHTw7Omf
 c63wzdwrqZ5hcxwCIEM2zBpHeHpAo1sbzNvlb6eT+LyLfZgBg6GOLYySxqj6GQtDksQML2Z5EoV
 WAnIAl+zAHyo+nOO3dL+1gHr9FP5byK+UtgtAXVrV7x0l8nx8QkVKdMq6gEMrhCGGLvGXwyzMkL
 NlvEvmwfhjSOaoZTQyTztuK7NFavtN+byGqf27+wRcDMqJnll/LigTEGH3Bp89VJlvfF9HRDoe0
 cp+rwHH6niBXwRS97WL4vkMCuqec5p+UdsYxabzeZg6Vdf42QtEhL3W2tc4b3W0Fxmulp0RgGc9
 K7f/65wUSZ4F9tVRe0FVrD5HWFMrVA3imD1PgjzbaM/dZxEKb0+aJI7aRHxHGtaqOkmOVBp3kYL
 T9xzwsQ5xqfw/Zj9Ov3HahBWFB0uetHX5fhFSvbzg5rvx6gklf6WYbXGgP2htNb1hhGdt22mjtc
 bSpIMWhvEy72riFhcpbKxW3Q79Eb/SHo3aX8bTWr09DflTouj7hGRgv+7viy/7AXZR6xWS4W9IM
 e9kmeSjZt6PebMA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Fix a few cases where a local shadows a previously declared local of the
same name.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 1dc10b2ba1f1..a9afada7bdc1 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2449,7 +2449,6 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 	} rx_data[UB960_MAX_RX_NPORTS] = {};
 	u8 vc_map[UB960_MAX_RX_NPORTS] = {};
 	struct v4l2_subdev_route *route;
-	unsigned int nport;
 	int ret;
 
 	ret = ub960_validate_stream_vcs(priv);
@@ -2519,7 +2518,8 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 	 */
 	fwd_ctl = GENMASK(7, 4);
 
-	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
+	for (unsigned int nport = 0; nport < priv->hw_data->num_rxports;
+	     nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
 		u8 vc = vc_map[nport];
 
@@ -3041,14 +3041,13 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 	struct device *dev = &priv->client->dev;
 	struct v4l2_subdev_state *state;
 	unsigned int nport;
-	unsigned int i;
 	u16 v16 = 0;
 	u8 v = 0;
 	u8 id[UB960_SR_FPD3_RX_ID_LEN];
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	for (i = 0; i < sizeof(id); i++)
+	for (unsigned int i = 0; i < sizeof(id); i++)
 		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
 
 	dev_info(dev, "ID '%.*s'\n", (int)sizeof(id), id);
@@ -3082,7 +3081,6 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
-		unsigned int i;
 
 		dev_info(dev, "RX %u\n", nport);
 
@@ -3121,7 +3119,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 			ub960_log_status_ub960_sp_eq(priv, nport);
 
 		/* GPIOs */
-		for (i = 0; i < UB960_NUM_BC_GPIOS; i++) {
+		for (unsigned int i = 0; i < UB960_NUM_BC_GPIOS; i++) {
 			u8 ctl_reg;
 			u8 ctl_shift;
 

-- 
2.43.0


