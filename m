Return-Path: <linux-media+bounces-22598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E989E3853
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A39B916152E
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F141C8FA8;
	Wed,  4 Dec 2024 11:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="INwXpIBI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9921B393E;
	Wed,  4 Dec 2024 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310358; cv=none; b=KzvbPXkZavyeEZeNJx159IewrHrhWuqfWsd1bOUr4LCuyWCkeNwUwRmnptXQyhN+tujgA8shbmlBAGN7NrOgDE9YpOE7WNB/G5qP/bXG9qcU/H1Bd5ClutvO99CGRE8ZeQKflwjgiHWqwckVCpkvlpcJ7bpFSmJfWXAlH77B764=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310358; c=relaxed/simple;
	bh=4OfPIQt0zMS+sz9kFlchXcDE+D5zy5L6pKGSTiX11uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qnLsOFH9kMKLrAJV3i5wpQt1lASIKRbAZNAxn+mLIj9EZB+BI47Tkr+73/+gnJO6l8ObexuVym5NqCbKrcTLzv9bN994asn0C8hHoDVA7FkU5GLga/R6io5bYZhuLE3PwyR1PqhV1pLL/7rloM8adaEtw7xz5Wunz6tQfSuWPT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=INwXpIBI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44A271777;
	Wed,  4 Dec 2024 12:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310320;
	bh=4OfPIQt0zMS+sz9kFlchXcDE+D5zy5L6pKGSTiX11uc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=INwXpIBIRikan0T1ICrWbAWo4xasR94LAFzD/WGnN/QlDwpcESDs8xkTFOc9BvA66
	 p9/1vq+m9xbuOybgg5W5Iys3wsaMwudae5YZUUTkaRoZ6vxs/0jbZtloAUkX3M0Izn
	 ybdayYbadPuOKxY0YrmG3L+KiYCkqTndkhxeeMF8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:21 +0200
Subject: [PATCH v3 07/15] media: i2c: ds90ub960: Add support for I2C_RX_ID
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-7-a933c109b323@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2244;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=4OfPIQt0zMS+sz9kFlchXcDE+D5zy5L6pKGSTiX11uc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeEiFf3PjGLBuQ4lsVQaagvN8Vu/ebGcss/T
 Rnn0lDaALaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3hAAKCRD6PaqMvJYe
 9ewtD/4g15gNdEVwJl3JnbXkNENE5Y48iozJgeLBnKW0OQQeeADmWldGQPh44gfvcQRwtu19uL0
 SkNGBXTi/kvguryzJHvBD40EPr6Z1EafZPCpmrXdayJE+HwidW4JNxmncSkqLNUt09SOAAQHhk0
 Oe+TlhNriBGCHN2ArQ4PKIM+tgVIgEPhMMmYd9FXYnyY+ZjK4bj7vCZbVduzTFV+mNt0DH7+K9e
 yrpsgFxObAeT1xEtTq+89oyTWPRovXGfzRM/8U2ZomLwbecaDL9YcQhHT9/G+MBVknBopK9foTz
 shuyhSVrNa1GRYHxH7fB2RjcnrTGLm2EyUUzo7vw+xD7n8hOke74SuC6dOXUD/q3GGzVTEJL4nD
 OcsGNpgAeOV8W6YlnXsNTuALkXFSLBB0v9k8qJBX3D9TRIOXrPm4sa/HxvHUjOetk83aiH5T6JF
 pgXot9gjSwy9S9zFTdcpkQVbrAv3k5UMUFIzuSTzaxvxWnwfQ7rfog/S4s1bZ5qManhhzrW/CVe
 H3ksSJqhCNOKMEdlsOdfcHOaxqPjNfw3kO0TVzudNhn/bmcSe1P1V81w/4orbRPt+vDWiXkzrtO
 d1nttWvNI1K0pOh8d02mZs/TGTQBbxH7R586K1INdEQwFGBRy+E5rjs3Rk74sWQHCEq6FnPEvd8
 lGqRv/4W0mXyzUA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Normally the driver accesses both the RX and the TX port registers via a
paging mechanism: one register is used to select the page (i.e. the
port), which dictates the port used when accessing the port specific
registers.

The downside to this is that while debugging it's almost impossible to
access the port specific registers from the userspace, as the driver can
change the page at any moment.

The hardware supports another access mechanism: using the I2C_RX_ID
registers (one for each RX port), i2c addresses can be chosen which,
when accessed, will always use the specific port's registers, skipping
the paging mechanism.

The support is only for the RX port, but it has proven very handy while
debugging and testing. So let's add the code for this, but hide it
behind a disabled define.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 98d815526341..03938def6ae9 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -55,6 +55,15 @@
 
 #define MHZ(v) ((u32)((v) * 1000000U))
 
+/*
+ * If this is defined, the i2c addresses from UB960_DEBUG_I2C_RX_ID to
+ * UB960_DEBUG_I2C_RX_ID + 3 can be used to access the paged RX port registers
+ * directly.
+ *
+ * Only for debug purposes.
+ */
+/* #define UB960_DEBUG_I2C_RX_ID	0x40 */
+
 #define UB960_POLL_TIME_MS	500
 
 #define UB960_MAX_RX_NPORTS	4
@@ -351,7 +360,7 @@
 #define UB960_SR_FPD3_RX_ID(n)			(0xf0 + (n))
 #define UB960_SR_FPD3_RX_ID_LEN			6
 
-#define UB960_SR_I2C_RX_ID(n)			(0xf8 + (n)) /* < UB960_FPD_RX_NPORTS */
+#define UB960_SR_I2C_RX_ID(n)			(0xf8 + (n))
 
 #define UB9702_SR_REFCLK_FREQ			0x3d
 
@@ -4001,6 +4010,12 @@ static int ub960_probe(struct i2c_client *client)
 	schedule_delayed_work(&priv->poll_work,
 			      msecs_to_jiffies(UB960_POLL_TIME_MS));
 
+#ifdef UB960_DEBUG_I2C_RX_ID
+	for (unsigned int i = 0; i < 4; i++)
+		ub960_write(priv, UB960_SR_I2C_RX_ID(i),
+			    (UB960_DEBUG_I2C_RX_ID + i) << 1);
+#endif
+
 	return 0;
 
 err_free_sers:

-- 
2.43.0


