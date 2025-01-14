Return-Path: <linux-media+bounces-24736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F00A1116D
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 20:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B23EF188AE65
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 19:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26C120C484;
	Tue, 14 Jan 2025 19:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="n7a8GGsF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803D01ADC61;
	Tue, 14 Jan 2025 19:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884074; cv=none; b=No82odQsTMwAaCRT5MUhT7iPQgCJeB1e/6zChxizjxZpObOrrPpfgnSk40BISO8CFjkMt+x9mtA3lVLCtzatZIAriFYZNXc6Rn7ngfYeEQLohQpLFbKen+8OjKFXT9gNkSUDn6yZcadY12v3dKszqUzA62qRROoeFJ1s3CpG7sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884074; c=relaxed/simple;
	bh=hlZhJ7g3QQZCN+8P5EF9JKu80itGKsFRX39r3AsNAqk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eW0fbVmDB8XEmZ9Pj6nsYqq/tmkZ2q9j2QLXDx4qzCnmvwEylAqnbHXOVT1EE1TFFJdROV3PSpsKfsCeF36SWv/mwiyInhqazOo9IoE1n2d8Pum8BaKG9jUX4zdZhsrMOzvAPcFHd5cREkF6S5qqJP9kfBfWlapiq7JwGOcwgT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=n7a8GGsF; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id C32EB4076198;
	Tue, 14 Jan 2025 19:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru C32EB4076198
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1736884068;
	bh=OJW1+XgPm5EvSG2lLNb8OMsGkqLf0gwZ3Ky+GgkrbmE=;
	h=From:To:Cc:Subject:Date:From;
	b=n7a8GGsFgpkh1IyaPzboj6AviQgaFGLUEy8u0Wy8/gLx1mSkOqK75Ywvw0cBtWUUM
	 2OnzXxutK/1x2FF57Erv70Juu39BzLK+T2HjJDmWc2X35r2xnu9rt/s+7bjbEoFTFt
	 dFlW6Nm3YmV50MvJxPWTGxcJdLm+naiGW85ZNc9I=
From: Vitalii Mordan <mordan@ispras.ru>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>,
	lvc-patches@linuxtesting.org
Subject: [PATCH] media: ov772x: remove the unnecessary check for priv->clk
Date: Tue, 14 Jan 2025 22:47:32 +0300
Message-Id: <20250114194732.3513862-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary check in ov772x_power_on(). The resource was either
successfully created during ov772x_probe() or the probe terminated with an
error. Moreover, clk routines do not fail with NULL pointers.

Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/media/i2c/ov772x.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 8a0556e21659..c70d5dfc9da9 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -877,11 +877,9 @@ static int ov772x_power_on(struct ov772x_priv *priv)
 	struct i2c_client *client = v4l2_get_subdevdata(&priv->subdev);
 	int ret;
 
-	if (priv->clk) {
-		ret = clk_prepare_enable(priv->clk);
-		if (ret)
-			return ret;
-	}
+	ret = clk_prepare_enable(priv->clk);
+	if (ret)
+		return ret;
 
 	if (priv->pwdn_gpio) {
 		gpiod_set_value(priv->pwdn_gpio, 1);
-- 
2.25.1


