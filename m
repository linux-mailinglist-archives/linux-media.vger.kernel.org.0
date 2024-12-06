Return-Path: <linux-media+bounces-22789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2997D9E68E0
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E21818864AB
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7741FF7BA;
	Fri,  6 Dec 2024 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C1pg17Ch"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E940D1FF600;
	Fri,  6 Dec 2024 08:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473661; cv=none; b=lipEqW1PXftukI+zijwr1Vk5+Qm8KfEZJ1FbfutKclKWKj/2q1PHgycmdZJt2X3FBjkfRvqVF9knmKai8476z2BUZzKPYD3byoHKGSlPE8gcL8Hb0z+Kbc1uSUUfIpyJmEIOdFLNPZkF4M7g99U+5j6eFRYIW/p6GsP9Ez+6mdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473661; c=relaxed/simple;
	bh=tx1oR0yR9dSW0a0oGSanl5R1iFOs2cxUamF2IuKTL/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cflOSnhL94P2mJFR6UyLaHP7XNDDmqdCsBijBdxBeyPWBzkqsN3DgZ2H9o6zqJDokQg0TXx1Bju7YCSaFWK3GBToY1KqL2EgjALeYilQXV1CtpK+WYbYBo3AP4nNUMH9njcHEtCO35dm19qSnN2p6nS9laxvzoWmUpApnpbreE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C1pg17Ch; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 899AB1E0A;
	Fri,  6 Dec 2024 09:26:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473614;
	bh=tx1oR0yR9dSW0a0oGSanl5R1iFOs2cxUamF2IuKTL/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C1pg17ChMDvDv/8x3PF73bGq3GyVmKHSI7upAtkOJzKLfWtWppgf6KmlqHkaBWMOF
	 cxmbookeVvBEh2GSMcTGOYgl+B9CicfvKQCRkrCx7jFbuL8gxQORP/oQ6RnbGqcYce
	 TEtxG6KR4BKjOrsc9dnWXf3BQz1myDPdeBZfTpEo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:51 +0200
Subject: [PATCH v4 15/15] media: i2c: ds90ub960: Fix shadowing of local
 variables
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-15-466786eec7cc@ideasonboard.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2252;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=tx1oR0yR9dSW0a0oGSanl5R1iFOs2cxUamF2IuKTL/M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVg3gEkXUWeTendUfq+hXJSRPFKXvlOyKm7g
 VIpDzVrU6yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1YAAKCRD6PaqMvJYe
 9cwgD/9819hQ26U7+CZcZxmSY7BvOlbVNJ7t1dKJHLxktalGLzaUd+b/16y2VXGjqLpJcFGXXGf
 JgGHTLdRHJNvB0suatsRPvef+UX2DEON88KNN5TYRX1bwFfJDaoPR946YiCSu32FvTtLQrPkn3W
 XZ61pfz3IIyCIh+Xi1incrvWH68c/FgTkeVRx8rIapIqN4uQuRIk50U1318tvxt56JB85i5M2Bj
 3DIiYUqd4UpiND2IbWwcYdoRY7TNypEBw7f/Jmwb3PY1JLZcQxdNrfXu6l06g7N4OPZHNaMH3BO
 HOp/eS/23DiKB5itVmiXI5BMPhKiRgh4l77gkQ9vJYoss4qoIBE1EfU2T+2upoKcPJ14ivpjZkD
 KrJfhYJGjCnQ4j2bG+YIN72hLYM9v38fLzbQU1f7hVSVnsLqbqi5nLLULf5z+vxdNTyK2medrze
 SjXRmJRfVvORBjwjGbStJ42A9DjEI80bxZDRMyN65Bqdp4CbFLRDTolXgIrr3e665pgKzpohu5u
 NkoyKvNIg5/Yjw/uT2z2eC1Wq8gD1iFZLM3V8yOyrmfGC9G2xd10wCG3tc6kt+DmHihUJznl8sE
 tYKWiKA4Fip4caJePOw+bNLfu5F1GvVGgQvn0HBRmNCImuIJbmqfETMdM+SUGryjNP/tlgyVq1f
 GApgVOPdHzhC6iQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Fix a few cases where a local shadows a previously declared local of the
same name.

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 0db4fc980912..4cd31b1acf14 100644
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


