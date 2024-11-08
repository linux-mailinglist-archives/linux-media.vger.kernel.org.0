Return-Path: <linux-media+bounces-21126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D85189C1939
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EBB8B258F7
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265291E1059;
	Fri,  8 Nov 2024 09:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MsHVzlU5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EC01E2854;
	Fri,  8 Nov 2024 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058522; cv=none; b=n+mU4zik9NrrP7e4qsRiA4rY4x8KH5gEt8HzcaXLXUB8hSyIEtsTKFLH5aOLth96ii+3CkGi70H4pyJn55Re7e5V6c9capGA6OO+GL+DxXjnhHKaTsyyg54AHK61uOW6RlyHZoD+cHYjzHfnev+WVQ+2Gqt3pWqp/BeoXDL0kjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058522; c=relaxed/simple;
	bh=dW1qzALQAuTsR/DlBA4YNdLa29WamlEcXrtjr7uIUrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ge3Jup9/wV6UW50YlATFR30/5dHrkbkfwztxQ0cMvRTA6z60CC38gR1c4seS8Ur+092mGz+QAkJwoyTQhqumQBsYckrUNeCuDMVcMY+uJCDZy4N46pPWZ9VaKz8xVEU3l+L6innGtCE+UCr2Ne1iHkR1E8HyvMEv9WgVyPQOgcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MsHVzlU5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3725DBC0;
	Fri,  8 Nov 2024 10:35:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058507;
	bh=dW1qzALQAuTsR/DlBA4YNdLa29WamlEcXrtjr7uIUrY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MsHVzlU5B+5R0xbZC/LtsXygJ1drzUI5Sa7zj0/+ZPcLVeZhVmMFKfvw/XLvP+tuI
	 WbyWvQkuP9GYo6WT6FLA5AREgv3ggP501bGTcojusE012NWizOsGXWtEgRzsRzQeyZ
	 9P7Z43dgKJp7BWiCHZjbaU6PSGs5jIHzoLwc52fI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:46 +0200
Subject: [PATCH v2 02/15] media: i2c: ds90ub960: Fix UB9702 refclk register
 access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-2-c7db3b2ad89f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dW1qzALQAuTsR/DlBA4YNdLa29WamlEcXrtjr7uIUrY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtN+AmjAKjva+Jd/Oa47ZN1511HAuIKt3jJ5
 0QjfeqVw+iJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bTQAKCRD6PaqMvJYe
 9dtrEACsDQ2vAoP18i0GIK9vKNY7r3wYO6tDtqtV7nisgNP6jz/U4wXbeO7cnPsYmr8HjqWzPDE
 renjseDPTvBCJNqQptqviko77vUiauBlSHaQtXMFzN518Lym+Wr1WxCuC4llLfqEeayVyPVUsHA
 N52uFZElnpEi6FwG1JM+DmVUsrIwE9b/LIfHDlzVU8nHJGiOjyoQzGaXtOCMnbn9YyEs8+4w4N5
 tc3lMdYbxA3OoXMcewk7u0mCaAXj+0BKeQ15go3P8rivZZ7+JdMqRoNviBGPwG/AbUcxK2Kdfna
 u75xo18/wd85hSM/W1uPLCKraXaktZZ5tJa+8huPbN05oNFCaQc5spsZ5Q+ari8u5/xGe/MdIHg
 I93YYxfTXNefQNKKGs5UjIYBVi7omqiFtzIncq1rMWLTIqh9uXYomrhEZq8WnipjFm7kP27y4Ss
 6OnkKUdrLwGbDRh1T3z/pjAvDxu8LOmJO2omMDo6TNpSdtZ5xFfb2C+0QyvRu9ZH7INFhD44Emz
 4VOOpiKw4N/AG0BSsXYgXYUQQgRa47oCRddezyT2uvrSElihRzJwle20lD1FB0jOP+lyef7sKVI
 cZHKutZLqP21PR3J8xyd+52Mq+czD4ZupV7LuO8y2z/q40ko0rvLre2oEUPfMCPGPQlR77PjnfP
 Ev02NEMN+Tp1I/g==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

UB9702 has the refclk freq register at a different offset than UB960,
but the code uses the UB960's offset for both chips. Fix this.

The refclk freq is only used for a debug print, so there's no functional
change here.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
---
 drivers/media/i2c/ds90ub960.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ffe5f25f8647..b1e848678218 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -352,6 +352,8 @@
 
 #define UB960_SR_I2C_RX_ID(n)			(0xf8 + (n)) /* < UB960_FPD_RX_NPORTS */
 
+#define UB9702_SR_REFCLK_FREQ			0x3d
+
 /* Indirect register blocks */
 #define UB960_IND_TARGET_PAT_GEN		0x00
 #define UB960_IND_TARGET_RX_ANA(n)		(0x01 + (n))
@@ -3837,7 +3839,10 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	if (ret)
 		goto err_pd_gpio;
 
-	ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq);
+	if (priv->hw_data->is_ub9702)
+		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq);
+	else
+		ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq);
 	if (ret)
 		goto err_pd_gpio;
 

-- 
2.43.0


