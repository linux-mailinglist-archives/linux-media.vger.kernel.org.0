Return-Path: <linux-media+bounces-19088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E5A99050D
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 15:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C09284D9D
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 13:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B20215F57;
	Fri,  4 Oct 2024 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="COdlk9UB"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBA92139C6;
	Fri,  4 Oct 2024 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050236; cv=none; b=OE8mp12gCC6SPZhx2P1ID2Ii7yhEX/Oo6WHJviSijuoCr6CEwwVwTrmttAJPbwQgdQNEYUn8UNNaPq4rmUGIIjZBRdAsUmdw0cYJNU2Uc6HvYvwWTZzA5YHuWGNMdWyEp3Oc+KAU6J06cnVq4vUFlYIUh+2O4szfCey+kUJRAwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050236; c=relaxed/simple;
	bh=7Hwq9uEJINWh6lbq0eDSkjI/LwWpxKdFjo1dFmCmg70=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Lh0oChPKuqovZUeT+au20NctxE5QzgTBIAYLCV6uhwAS6bw7UnMz57YnHjNJnD7hSJbfx/Q+mMV0RDknzDlAeItcYkLfQxiW11Q0MgMYFQtCIicqSaT2PDNZeSqX8t0XDvP3Y8z+jkqQaV7gCqCVb1FqxWZH9ID/rFkplpUWVCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=COdlk9UB; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728050209; x=1728655009; i=markus.elfring@web.de;
	bh=l5sBalEVeHVqU+tztsDZkdHezcT8/Y4LuI15YAud/Os=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=COdlk9UBKuCaUvN8clv+FF4S1THVbAJVqWB2QPda56DLfiExkrEEV3YXwSBlszS8
	 cyvkQjedLlpKoTRmW5jNCcuYvapidFV3QR63Ie6xHybvmVh61mHIjkP6oGgAPZYVt
	 9c9x9KuTBrgITV4twZSTlEsZzwLIowJVSDnkIlCgKngpdsJ3KBjkRoH4706QriDe5
	 CrePkqpy4471HXcIzvv+q5vzvbIymU4ay7aWsLDMtITNc4VVtwudGk1pHSUNL6+99
	 1ACB5JD3eSIKk9ySyUJgBkkCshQk7Evi8cly/P0cbISptAlAzi76DCah5i1JG8TD3
	 SzfFny4QSQkyCRbIxQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKuKF-1sbU7g1DCv-00JJaN; Fri, 04
 Oct 2024 15:56:49 +0200
Message-ID: <5d8222c5-d564-4e27-9a85-ec4a526e84f8@web.de>
Date: Fri, 4 Oct 2024 15:56:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Peter Griffin <peter.griffin@linaro.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] media: c8sectpfe: Call of_node_put(i2c_bus) only once in
 c8sectpfe_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+QCmwZmgCaEV2v9LZCjjGJaghSVTSAFn4GQRGdBCM9HPGmzrnAE
 Lcb0ITz5R+EmIIdpN813CxVRkg9rEs4rJj5QfVKUDzyVC0xUoeTpb5ZUmPFowDwCD86gcQN
 3D+EVcUyEqJ1jyRRdS9PmFc6wvHSUAQjGc2K1KSm9HFjwekFdsQxZqBjMvd4DZn9mew7iOX
 tuPcpy+p7rU5mGdoyxx9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:29mHHnh0jhA=;z6wggkJyybQu1vD86KEzN9mdlr8
 XjiZLv7SDj+hTW2IAtItSG0mfxETpxsAF/fPdld+Lnv/Kr7Gdp340FB7Q/Co9oUYRNmgvZndJ
 WhWZq8ICA5j+QUrXL1Qm5AMV82ETLRV7aZ9SRNrm4tcQ3CqcmVT8KM2aqky+3VuG2mhbwa1mj
 d9BxiVsmTyzGrUoam8ZbwFIBaFRuOuz+TP4BZu0ERcEAZWpwhr0V4DTTr+JJPl6kDdpueGmb2
 2B3Fmb0Rcb3CoNg7FegMIROggaKA5HybxuPryDiz2d+d6W6sGUMBQAdGtHXCL1sLu6VYRhshU
 G8xjxkOjJILfCNP6u6uIE1HZRjNZP7sLV4WbKEIL/ahrrxRRG05YLi/zKA/W4VRDC/gGf7B3k
 uGdYm/JOF3a36aUYzUCaWvnmnLncr8SUl4UIze9OPSYan8ZL1C3sSoik63Hi82/IMxAkyM+LB
 laPtlpzek5cm23EZ+3A/FfjqSuTbUaDrovRgWLydEXFrocKHOp8YBXRcG5YNlHb6MW/nZmxju
 yDvK7YyPV8BSX4szIs9sgh5aDbszp66CohurHr4BZV507rwlVJtqg3aRTYHDH8wQdjqxENdoX
 XpdDQr2wugfyCHIQChrUJFSdBG90tBzukuZH37+2g+Mh3iAUE++MVUG43J/bzMNhfgufX7/Jy
 d/3sZJxObfIL07opdp1mNivSu7Jo8jiq05PQunXjaNr9LHe8AjHQmB8fDIOGVUw8AyK8tFkin
 jbrbWHP/ceV24LF+P6nWU5e2LgDBkyJop6oJ0gsOaByJ2uSvI+vKMnVit5TnDuqXbir+tzorf
 aWhhbgXbpWa4szLljX4G17ng==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 4 Oct 2024 15:50:15 +0200

An of_node_put(i2c_bus) call was immediately used after a pointer check
for an of_find_i2c_adapter_by_node() call in this function implementation.
Thus call such a function only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/dr=
ivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index 67d3d6e50d2e..ed3a107965cc 100644
=2D-- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -797,13 +797,12 @@ static int c8sectpfe_probe(struct platform_device *p=
dev)
 		}
 		tsin->i2c_adapter =3D
 			of_find_i2c_adapter_by_node(i2c_bus);
+		of_node_put(i2c_bus);
 		if (!tsin->i2c_adapter) {
 			dev_err(&pdev->dev, "No i2c adapter found\n");
-			of_node_put(i2c_bus);
 			ret =3D -ENODEV;
 			goto err_node_put;
 		}
-		of_node_put(i2c_bus);

 		/* Acquire reset GPIO and activate it */
 		tsin->rst_gpio =3D devm_fwnode_gpiod_get(dev,
=2D-
2.46.1


