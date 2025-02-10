Return-Path: <linux-media+bounces-25872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 855A0A2E642
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07331164F52
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 08:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F8A1BEF90;
	Mon, 10 Feb 2025 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="cYiEAE7t"
X-Original-To: linux-media@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624FF1BD9FA
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175690; cv=none; b=UWgHCt/H8TbdB4zMUWsGalO04MGRLi89lxoDmEDdu1jXp27m+jqtErY1owOKrbJlJsxrszbrEcGfJs48j2LaTj4z/r1hUo7EwXHzqUsLJdhejndXEER5idwvhTV9AeWBIys6xYnHb0I8Rs2bSMMPUFrJhq/OqiXc3Qt+D69HEwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175690; c=relaxed/simple;
	bh=aXBVOhTcAS0juVanJzYNC9/sNyXD79Srm/3EYvO4HX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I2dEBywDKCNEwKy2Sf8XOmME3d0qECEI5ahw2WwfIuIp3auR/9u6qAWiq1Yz+b+xlz8JHiZA4ZLAzabz1UrxGWT1K8+odmC6Lbgf61AAw84JmZ/9VyBq3aI7dRgqouaQ5U0lG5Zvy5WtJos22zmbBzR5Zc+GGjtzmrN+I4MDx8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=cYiEAE7t; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1739175686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMPspReONBF5sJhVHTUN14XLSKQUNMx2wupSgm08Nx8=;
	b=cYiEAE7teIhehz9EBC3z4j2Okd0/87ACa6gX/09Aw0MLr345kcjyJDfL5twaC0WNt2yUbS
	5APzNk4bVjDpOwTNRQU5TVrxbpwoEO/gpuaL+JJqazA37m6nYmH7ef9hBqBd74dsyh7uUt
	jKhSmMjvn647XuJcM+zOqMZd0bAhDo9dDcjk4sVa6uoqmUxl706qgbTKlpiH544D45grao
	LE8joDVlycOn0FlWhTuCdQ9vaV7UPz+0SqwlsAeKZF49TXaWmWW1C9X0JmPbkjIkIEjkn8
	YsMXDnZr1vLV30Tqh3OAFN1O4Vwk9XNFPED5PRkwSXfqwnYj5MIAaovlkHWSfA==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] media: i2c: dw9719: add an of_match_table
Date: Mon, 10 Feb 2025 05:19:17 -0300
Message-ID: <20250210082035.8670-3-val@packett.cool>
In-Reply-To: <20250210082035.8670-1-val@packett.cool>
References: <20250210082035.8670-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Allow this driver to be used from device trees using the
dongwoon,dw9719 OFW compatible string.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/media/i2c/dw9719.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index c626ed845928..b6859cfd216c 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -331,6 +331,12 @@ static const struct i2c_device_id dw9719_id_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
 
+static const struct of_device_id dw9719_of_table[] = {
+	{ .compatible = "dongwoon,dw9719" },
+	{ { 0 } }
+};
+MODULE_DEVICE_TABLE(of, dw9719_of_table);
+
 static DEFINE_RUNTIME_DEV_PM_OPS(dw9719_pm_ops, dw9719_suspend, dw9719_resume,
 				 NULL);
 
@@ -338,6 +344,7 @@ static struct i2c_driver dw9719_i2c_driver = {
 	.driver = {
 		.name = "dw9719",
 		.pm = pm_sleep_ptr(&dw9719_pm_ops),
+		.of_match_table = dw9719_of_table,
 	},
 	.probe = dw9719_probe,
 	.remove = dw9719_remove,
-- 
2.48.1


