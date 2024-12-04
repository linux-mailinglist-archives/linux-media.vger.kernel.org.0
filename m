Return-Path: <linux-media+bounces-22606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAC69E3872
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C89C2B38F6A
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BB11F759E;
	Wed,  4 Dec 2024 11:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qRiXfGCI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32E81F707A;
	Wed,  4 Dec 2024 11:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310370; cv=none; b=tl/KNurscG35kEWd8fJTAngLi+wco+BYSwz16SkiXCq5dKSw2dtYfhgFCXbPQ0DqiNnJigGgfAl5JPx0+A/Fu6tGaGFmfplAh8VmdkH7a/OHVEAvg3NejtyTTh2qCSYL2QWEeckwD0zvvp87VChqFk0Bdt+/4g5t4yAUpcQ+Ubg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310370; c=relaxed/simple;
	bh=F4Yp+U6nA046A4kQeZWpOFa99vdkMkgLtGHd/gDDUno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KhHG32nYcAwgs7I3ImcQTamVU6nVQXqWjf38KpKdVNxsZ1f2IoqDvhQb0024rN+5llwLqU5SLJsPjJMplajxxDEWffBK1UHKtdvE/WHZMChNkdAqG7V1CR7sjukVHvxwLvqeQRV9Rvmp6yzJse3rGkMsdR1VOju/UJtk7JnLO/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qRiXfGCI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0241BD04;
	Wed,  4 Dec 2024 12:05:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310325;
	bh=F4Yp+U6nA046A4kQeZWpOFa99vdkMkgLtGHd/gDDUno=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qRiXfGCI/q05wx4tfn+K5MNWhdCr+jSKK4lNilxn/mWxlszW+lquCMbmHElFnU9Yn
	 8Dig7++Un4TO40H5p+UvTjDsLlvOaPdA0cSFdT4ypW5yL+sHk+/gajVXtyVTmLJGr6
	 EZiHJKxBgFJ1xRZd73pq1IqFGe5VbkkL3bDizmBA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:29 +0200
Subject: [PATCH v3 15/15] media: i2c: ds90ub960: Fix shadowing of local
 variables
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-15-a933c109b323@ideasonboard.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
In-Reply-To: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2197;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=F4Yp+U6nA046A4kQeZWpOFa99vdkMkgLtGHd/gDDUno=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeHDsGS6sHdQ72vklvrsxC57Lnab+5ZACq/P
 1kt/QdpRSCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3hwAKCRD6PaqMvJYe
 9b2tEACXUh+aYh0Kri5QlXdTZYTUo6aFoWFS4VnOZUhHtws+f2TNq6aR+y/ebtfIOFrL14BB3dP
 O8/1eHAu2wOFRWtQFRy43cCaNSl/QoQ7S0UjomoOqhJ3YlsfiWfy5uay2QXk4mLh2wluRoodPjb
 DLSxnqofabLXfgF8YsfEuevO8UGaAMUS5WAjRWbf8+lRIKvC0ijbphwme1jZHHQVTnbDTxI2dQi
 eM+xh0a4q/BJK5fgF1TPN3R8at2diVbIhubMl6vZPMRA7OES93rfnROY8aEaOcpZzXXcfLu5ktH
 OF+wuJJM2LcLAYazqB9vaRQFBElIEw1wIAPJyP1zicETjwA+Cf5ne6X+M4jM2J28HgwcqSEFvEu
 Q+FMcoYKu3MpWwds+jKLdtiIRCx4aAc+ZpboWbJLaXzxSNf0ZjoTDMFhgp3UpiZsC5zvVYQhZLq
 NoF5Mtw56GPMjSoeDxt+lM+yc5bDSeB71ceLlDJ5z7A9gvAgKlT66Yu23Zocm5JYoNXc3oT7Yia
 M98EtCAbMAGVXoSMT/Hm8x0zQ3iMS1qGhrioivuzYtVPsPT6eb0U0MUKJxob3dbfUcL2NVzuU2G
 G8SAwh8hnoqcpOP+Li8UFtXLdCzni/d/S1RpJ1RobiCEGSr8sJ+lCmseLNAF387UtrSXZIlFxvH
 zK2liPQ8VDofmHg==
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


