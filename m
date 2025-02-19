Return-Path: <linux-media+bounces-26404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82489A3C6C6
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 18:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F6331881D35
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 17:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CB4214800;
	Wed, 19 Feb 2025 17:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Ls6dW2V6"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCF11FECAE;
	Wed, 19 Feb 2025 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739987574; cv=none; b=ZpsR6rB2/qP9oOA0Mt7SMC7H4MdYZkEQqnyokBG+Fi308hK/EoyecZTlDE4uqdrElSk9pu0TKWZ8cCNek6C45PrbjvLm+sFKopkg79+OEGqYlt84MOTbSuXSGAesy+N1FoOreuWCUjrfAsyLjRzC/86YWYFglfAE9/DjsI/tx6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739987574; c=relaxed/simple;
	bh=dlmR4Na0OX/qKkccPY4vem3xExkWHBIdlfSNvg2r00g=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=XEgHa+YR1yG5YuLnHYiOQaOuDoL/ShIl1Fn54kABgTismeowt3A8yBkpLjXeZugpCuMVlgZ0fXhHgbTR1K/DM2dQRdsw38qwHItt1IpsJG6IpCDYgZnubBnKjv8s5hNnRQcbi9KuzsMibteGvIv4+t636lqD4XYCnc4/aROUOWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Ls6dW2V6; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739987519; x=1740592319; i=markus.elfring@web.de;
	bh=2GFYDHqlQzpJl9rL6j0rWVOfQYmcKGDAiJjmIMqNelc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ls6dW2V6JhYAwKGdHgNr/DTHAWjJwlQtCquFJT2nKaDxW63cQO2iesbwNIF6O2KU
	 h+qFPye0rWU9F4QJpcdy3Ts8TgkjDCyoEDFJOEhIclyUYD2C+ASKBxsvjv9YYgtgg
	 o7NUpTaChyQpJLl1unnJiNxJZg40gdpjL/24NHpi3Y8hgHIvsdzLpNjCucxN5c600
	 2npkcTUTGfHhb2ZY2mNafQniwFHAZMfm4YiXQv/3doE2hIUykkoJtD5fPMfk3SozG
	 Tqswrfd0wvMLtRewFipCtbIMX8whVvnQoQsvL+8kRI4lKy38OkxJZZBt5jvnvZIeX
	 yeLOEHpRbUWcWCPyvQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.10]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCGSU-1tbUZ30T2o-00EK2P; Wed, 19
 Feb 2025 18:51:59 +0100
Message-ID: <c929975d-6928-4161-b062-64636a4f278e@web.de>
Date: Wed, 19 Feb 2025 18:51:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sebastian LaVine <slavine@d3embedded.com>,
 Stuart Burtner <sburtner@d3embedded.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel@pengutronix.de,
 Abel Vesa <abel.vesa@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>,
 Julien Massot <julien.massot@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Spencer Hill <shill@d3engineering.com>, Tero Kristo <kristo@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>, Vaishnav Achath
 <vaishnav.a@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Will Deacon <will@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>
References: <20250212195656.69528-3-slavine@d3embedded.com>
Subject: Re: [PATCH 2/4] media: i2c: Add driver for Sony IMX728
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250212195656.69528-3-slavine@d3embedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UWazyhhgLJErNLDk5cBHjE48IdmfMZl8bvuL5WGtFrLv7QPsGnV
 xjhR0feAbp68V6Z3PT/3/ImwcTznMRu9DAvUPD6DCggY0RbYRSY14gzXfxMaC+EuFD8AXmW
 B0D2Joi7xZMmkZvzIU4foa3mUl8raYFA/0nlrHD0vjV9T8qDORZBB1aXaf6XANrszKwUIN6
 v+rFLWtUXoW68aPdcecog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lPNuBB8wTIQ=;iBOV+TkYE/qZL4SzQiFuEJC5f3Z
 tITcdP7QCl52zwd+QpvMmDFB4zEfWKmFcWiijEKOFYMHJ3WCeFpE8s2+cMqywIUAPLfy/h8Rb
 KgdOFeFxjh1vnEeNjFB6sdTNdajlUVi7O2pST6N43G2fE5GEtwqB+CJ3Vhdvldnbkp5Vx7SFQ
 4hIOLQn9cDVj3JhvogOh8dFfLFq6kqzsSZ27XWMzJOoNPh9s2cKl2czqywDb8RfIF0liYIrgK
 FuJK/ExanfdV2omcDTTnwJEzxWL6v4CdVxChCR1UyHPisF5UL6umEYaI7mgJ5WK56FFBvXORB
 kCYCJQIwfJA85p33j8uRvvRxrGzQMC2NdDMlaUQm86Jj697ohFvVw4LCHzdC3mB+z+ljPCx3E
 hOqrTAsxmG+W+A6rvc0HG8CctPsUiomTQQacTXGMQXgrOO7qzDq7yPaQlG5cUqYZoSu2HXTRh
 VbE1ygM6VzsgHuOr1RUBVCX1BTkT7uR+fhiyZ+MkdUG3K9r9h/Wdx/zDBbVVBbgoqF0rVVVnV
 /Gbp49BgrwCrhK3UhdXaQ7fzqSfUt5/mcOK5hIENzfIMmAdkADg18h9loJBmLm1HlJ/maaM5u
 STe0CAGjQai498NGHY8pQvGoJswriXRBvhyca/NLka7IsXheqgZeEkV+k4ObGxStK8McJ7FYF
 Hmil4pmIcDJos8LU6xWcQXx8mNzi69u/M/MFtXAiF53d7ELxoNzIAlFrB5JSIVFUUXsRwe/8L
 d6cs6QOlAuds9cfAp5JjlTYXYifGUomc0hct9Lcxc8N9YPkQOVXF51j/vku3xh2CzSXiQWjQs
 etEXrJyJjifpTzmuFFXtYKrrXRVK0ArVq29OH/8JYYxEiPqXWtZH667tjb23sfPnWIOtDqnb5
 mCMX8zGzowpd7VKElSowTEcGC2/xoWXstOIbhMzTo3PhN/k7Ka1CLMPBkX8Bi2/JjMKjEOGS4
 gEZY7M7XFk6jyDalb2MsqFTrF45FWEvlztm3umru5dQA7dRl24B4+RWtiogreiaeTCTsA42jl
 6lZE6NThPiKp955LeGXd1exxpUymWGFvPZ5mz5X/DSPO0pf6N+71srsQd62OwuHP6YlNusRb1
 4MWIwjNECl9pbOZ5dZ5ag6Z7QhuFS+wozJkgi36tpA2HX/uxZCsI7SqZ58cCjS9Jt8QZ4FRtx
 Q+OIRAXIFtuSEFMH0zOF4fo5XiQ4qTczKTwcEHeqk/Iq/5RGIxLWJGYsaS8xvyYd0blIUsSGU
 nyqTs720/yeYI+3X86RiS44fJaQ9aFzPCwkv48nBaiXVtXEsS8c2o6aDr0osUwYIfIaYar8h1
 N3tU+nE3mg3fkhe6YvJAwKJZIgXA1UG1uFsMwdK9oiNjcJQSsx/h3OBQ8ygkFEYgbaNZWPHyJ
 1XRAQStkyXq60TUULOAYf5oxcvPtPe0vf/Jmr/at5qE0y2sqvmeU3Ra2g6AdIvcaDH/QwYqYL
 cuIgYfa6Wqlv498T/zfjVg5kujRU=

> Adds a driver for the Sony IMX728 image sensor.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc3#n94


=E2=80=A6
> +++ b/drivers/media/i2c/imx728.c
> @@ -0,0 +1,9655 @@
=E2=80=A6
> +static int imx728_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +       struct imx728 *imx728 =3D to_imx728(sd);
> +       int ret;
> +
> +       mutex_lock(&imx728->lock);
=E2=80=A6
> +       __v4l2_ctrl_grab(imx728->ctrl.v_flip, enable);
> +
> +       mutex_unlock(&imx728->lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&imx728->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.14-rc3/source/include/linux/mutex.h#L2=
01

Regards,
Markus

