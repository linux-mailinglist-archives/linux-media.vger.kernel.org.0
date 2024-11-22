Return-Path: <linux-media+bounces-21778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C79C59D5820
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 03:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4986AB2491D
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 02:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B1A1531DC;
	Fri, 22 Nov 2024 02:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OPvmP5J7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E5010E5;
	Fri, 22 Nov 2024 02:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732241632; cv=none; b=gu7ErzMB8rnwHFUbkr3eB0sEa+5Zfu5iQyg/xxBv2fcCJ3xdAB4oTotx11pqA4g+JkSechWsfCUl/w+YAbMX8MFLu+q6lFcTIU6PZRUcE26qDkwh49J9UhPSKrH8J834rg/FY+Y8XTyzUBpgpu+f7/o1pLucO+w52pXS0wAo9NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732241632; c=relaxed/simple;
	bh=Tshp1VSudz/9+uuLxamlDu/mrC4xz1+24/cWzjsTeVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tw3q3JFdU/g3VZ1Y2OfdU/oed23wMJ7kNPQoipoBMkMzvl2HeCnRSaZC3cPWhrDhgFaNfmrfpH8uKI2JlPghLkre4uxy+z7eg2cQoQZnSgRrrcRhbScvjBR3J9yfyhJMZvQh135+MAwQ2ZdUuPgHTycp8R7o+kY4OZwHnubcCEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OPvmP5J7; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.149.162] (254C1A9C.nat.pool.telekom.hu [37.76.26.156])
	by mail.mainlining.org (Postfix) with ESMTPSA id 3F92CE47FC;
	Fri, 22 Nov 2024 02:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1732241223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+hmkiy8omPB2EdZa01IevKdy88dtQJxmZlf0j7vvpIE=;
	b=OPvmP5J7l6/7Pank6xbxe/Ys9px4yZ5mzYxujfrR8d1YQTTiiv5qrdu8n/pbya5YMyz6oT
	6B24yhYy+wlA94OzcsohLqBSAzdOSBJ0+ySlLg8B+kTLgsuRnS5+iA7qaxZqBclBmwmohK
	WvUl27Z7sws10IQl+H0sc9eqcNrnh57MWdY2DkasbH+Cur5TIEX2cjBhbsJCHGIxJKOdWC
	xCyIF0BYwiUHhTbopwebT2+HW8OyPjeJx/fSefpCwEcn/XUPFYV9fnfv7haez53ChyEU85
	kjPRSCpKP58rzjYjklUydcq8b7mp500k1SdUV2OVWct57a7UwaYDoL/Gq6AaLQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 22 Nov 2024 03:06:34 +0100
Subject: [PATCH] media: qcom: camss: fix VFE pm domain off
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241122-vfe_pm_domain_off-v1-1-81d18f56563d@mainlining.org>
X-B4-Tracking: v=1; b=H4sIACnnP2cC/x3MQQqAIBBA0avErBNUNKOrRIjkWLNIQyEC8e5Jy
 7f4v0LBTFhgGSpkfKhQih1iHGA/XTyQke8GyaUSQkr2BLT3ZX26HEWbQmC7NpzPqJWYDPTuzhj
 o/Z/r1toHZllLHmMAAAA=
X-Change-ID: 20241122-vfe_pm_domain_off-c57008e54167
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732241223; l=1067;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=Tshp1VSudz/9+uuLxamlDu/mrC4xz1+24/cWzjsTeVA=;
 b=ARrxBQ1f/CmkuNh+Nx3LQIlK/ga/oe/o6y3s3wY4/3e281n5YWcuTIHtC3oYTcPGx8rXMI5Bo
 BBcO64FaN4QCzTetGYUuRJ+y9/rMlYxtqKlVEcYnxuaXayqtywQ6I21
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Fix NULL pointer check before device_link_del
is called.

Fixes: eb73facec2c2 ("media: qcom: camss: Use common VFE pm_domain_on/pm_domain_off where applicable")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 80a62ba11295042802cbaec617fb87c492ea6a55..1bf1473331f63b9ab106d21ea263c84d851c8a31 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -595,7 +595,7 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
  */
 void vfe_pm_domain_off(struct vfe_device *vfe)
 {
-	if (!vfe->genpd)
+	if (!vfe->genpd_link)
 		return;
 
 	device_link_del(vfe->genpd_link);

---
base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
change-id: 20241122-vfe_pm_domain_off-c57008e54167

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


