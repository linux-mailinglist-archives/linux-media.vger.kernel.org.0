Return-Path: <linux-media+bounces-45037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39729BF14A1
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 14:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 637753E5AF3
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A2223BD02;
	Mon, 20 Oct 2025 12:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="rUNR66Ii"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC8C27462;
	Mon, 20 Oct 2025 12:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963913; cv=none; b=IgMiJPervn8tl4/wZNQtimMv1uFBk08ecaDss/G4wuGZ7FXFmI5XU/U7+z42Yg+Yl9YJZclyc4tkgjK06g/RqxmatXNY2FLSgu8ZHGOSvytvBidlHvuptr+ZQLtxI/Tu/YLbaCeYS7M7ZfUxBjfdE4UY0u9swGx9Kru8hsvC6uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963913; c=relaxed/simple;
	bh=S8+GFXL40Yc79OaYevO9BwJGoi26KNevBi9Yw4xOLYI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=XeCGRfgMbL6q/cThiVg6M7LwdvKQvSByrC4QJuTuPCCQ5Y0yNcoMk2HTdIzx3te3VKVyAlLahMdFnYuETdqqU5u2Bq2jmo0pRqTjvON8qE92UIGOnJhDVaM/kGNs+SwxmRPYXv61RTXi+PQ10oIOVk02cC00Kh51i6UV2DV71e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=rUNR66Ii; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760963890; x=1761568690; i=markus.elfring@web.de;
	bh=CH2GarSYPAyylhLNYS6SaVXCuKXda9zNFyl6FGQP4mQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rUNR66IiHTChgUeKz2UT01vuRwgIkPolH1ReRZr9BXesnWxxlMmdd1f+C9RqFVBN
	 hxJOqyyFNNsgOIxBjXtldwPNnh0XNQH0UXYtMjLJ29pzoNBvPCzsr9h8T/8j8rga1
	 x+7RSuWXCDJNkVjyCe5UxAOIejlKSylRszETDr7+ZbjRq/UxP/6ra/ldamljtWytq
	 OJ2TEyATu2Zwt+MzNk72cIQWwpLnY2t1IqNlXbbDC52iSOBky9TjWsEXfcpJ7VEo3
	 sX9qPLMaVCi5sGkMGBAA31DiDJJwC+Yg/jZI7t6SHy+2x712/ENUsfCdoHtABTn3c
	 Xmiu82RgND6UgA3qDA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.235]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MrOhx-1uNAZx0taZ-00eb0v; Mon, 20
 Oct 2025 14:38:10 +0200
Message-ID: <b462b48a-eaf3-4324-86cf-ca45c1a74a69@web.de>
Date: Mon, 20 Oct 2025 14:38:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Alain Volmat
 <alain.volmat@foss.st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] media: stm32: csi: Omit two variable reassignments in
 stm32_csi_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G45M7ZjjO1Q4oUE+g2c3rEP1/MH4XJVSkDeXs4wjOdD3vyRqPRT
 Ed6+AwL4akBT61p7sKSm3/GJ+ESwbsT5Pm6bHgEe/cwmAOeWc9QCiFJPvCZr4ivESwbWGO7
 sxP1oumKXTF44fbAX3+gGfVvrdb0CAANB/ZQLJVaFXWeELDwnnhaPKFY5wirYM7LtpBarWF
 EAfsL2JOdCaVWdRdpb6Dg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:n9JaN4fn6GA=;4qLs33JsOYYj1ha7EceMxwrJg8k
 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
 iMZkg==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 20 Oct 2025 14:30:06 +0200

An error code was assigned to a variable and checked accordingly.
This value was passed to a dev_err_probe() call in an if branch.
This function is documented in the way that the same value is returned.
Thus delete two redundant variable reassignments.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/media/platform/st/stm32/stm32-csi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/p=
latform/st/stm32/stm32-csi.c
index fd2b6dfbd44c..a997b34a73d7 100644
=2D-- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -1033,8 +1033,7 @@ static int stm32_csi_probe(struct platform_device *p=
dev)
=20
 	ret =3D reset_control_assert(rstc);
 	if (ret) {
-		ret =3D dev_err_probe(&pdev->dev, ret,
-				    "Failed to assert the reset line\n");
+		dev_err_probe(&pdev->dev, ret, "Failed to assert the reset line\n");
 		goto err_cleanup;
 	}
=20
@@ -1042,8 +1041,7 @@ static int stm32_csi_probe(struct platform_device *p=
dev)
=20
 	ret =3D reset_control_deassert(rstc);
 	if (ret) {
-		ret =3D dev_err_probe(&pdev->dev, ret,
-				    "Failed to deassert the reset line\n");
+		dev_err_probe(&pdev->dev, ret, "Failed to deassert the reset line\n");
 		goto err_cleanup;
 	}
=20
=2D-=20
2.51.1


