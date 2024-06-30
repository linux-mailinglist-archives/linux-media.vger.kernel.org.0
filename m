Return-Path: <linux-media+bounces-14409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6D491D024
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 08:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40393B21487
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 06:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ED1381D4;
	Sun, 30 Jun 2024 06:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FYCjnyYa"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA402110F;
	Sun, 30 Jun 2024 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719728214; cv=none; b=gMH3nNgNAzWGmFZPtFMGzGk2/co8iQfY1IDIkYLcxjq5i1avIKob4Btgw26wHDmSMeyYKb3HE3kxerfxEd/aYa3mxyxF8/WsTyoScalud3rQuK0MVL9QXssFqlfn5bP1rwjlK2/lMG39BtUTL7JhE8cKofk4C6lZvLeEcBM3IDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719728214; c=relaxed/simple;
	bh=wI703h9blYfT73BZcvvlCXmTTlLsD7MEKLp+YVNzR88=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=BBoTP+ozXosX11V0iPnvF73jWJZN0wnImzSi7oyVrFBAfbr/fIFGxbY9LqHSd5YXLcZrlsXjPR38LTWceUU6E4vKAFb+UFnUpGcED6MG2Y5vGpd/3fB/qwLqUmDpzmoPgHfCLNpszfisVq52a2xdiTJTv7+2eG7+4gRoC717rIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FYCjnyYa; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1719728177; x=1720332977; i=markus.elfring@web.de;
	bh=yaPGlmSSlSwV2OA6Z5CKm5JEUoBuUODSJdv3TgTtAvE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FYCjnyYaOX6r3KW1Niv4fAHwzEhwOFFsyZGqZMB2d3ZM5q61hp1KXNWuOdAAM7Rl
	 ZQPth0DV/+0suy1mgE8LovZgN5+eUwM/QRziKCXxOgH7wuRg/ZRV/kEdnqA6hQxhT
	 nnxewl+/icjqDXrfg3s2Qn1FnIXDDX7LeVvRebectoz2QrJsOoGC7EO4V+uHE5lXH
	 FsBU5iKZGAJTjZxc+q5yrcD7UgVoSz6droxKNgf1Uf2+vqaXT0bPT3xWo/euodklA
	 Pwz+YLWYirkikY/gVgSzNvVV9W/mJw29BXGjgomTV4xh7TFAhAP/QpvCjURQGE6QR
	 aItAV7Lz1olcpeGwHg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N62yY-1sLKzQ3eEC-00vYgL; Sun, 30
 Jun 2024 08:16:16 +0200
Message-ID: <a805ace8-6777-4616-b3ef-b475d1b71114@web.de>
Date: Sun, 30 Jun 2024 08:15:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Spencer Hill <shill@d3engineering.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240628-imx728-driver-v2-2-80efa6774286@d3engineering.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for Sony IMX728
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240628-imx728-driver-v2-2-80efa6774286@d3engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8ukpPKLP1qBUjh0XKXvid+M9uAstTi+O0j7VU3zQO3ZxDWkDbzY
 vlEs5hCjFuI0L71xhLjlEaMentoihEutCGhfzYZBezIvuqlGma+Xu6+S78r024dGgHd2d83
 3dEtcFUk6PlMzUuWb1aloaKs1CwXE5BkiOMhGzjyElfF+w57D6cgyWmKCRaefsDhG9yKIpi
 xLo1H21lWY5Sqk6RTel3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9oRHGze6iUs=;p1vkF1ut/d5zdOiymfoZh+KUREL
 2nIPKEwhNRN3yothl+3JFjhE7k/mgB9Gzsk6wuH63nZE5Z8+ecYzFK4KE5h5J6PYL4c2mS7Nj
 RtvG+s57M3DGiKYIldF66AzY+lY6KnLhc2extYEyNmTqnjaPWnUSbN19bFc1CLB67PqnE70rG
 bGJ/XV950HK0xOilgqPSE66qWufN6zreu4pl+iSpdbrX7+UZirFa7DpQi7GbKUTS4n8imEYB/
 7FsN3ZKXgfHD4Km+8adQ63hWWq3QEPlw5GPRSeBMDWVbbXcpdd44+7ZDsHlavXhAYli1PaSla
 MJuamf1ke+HWBf75Ck1YRytRLhhbACFklFI1O0wJ5brS1t+DzzmWj0gMq7w338NFW5kJcBPUR
 zvayhxQbOgkRABzvL9C/15tK7hkqAr/Q3I9lAAtfuDWfEo8PUs9poOa1dzN3Z6xMQrGIuWGPz
 Xlome4uj/yfO4QfHXGwQKeefKt3RqZuWj9QImYCAJwc3+XalOBUGbeIaf5ocWj3xekzViobMh
 Ln5d4dVhVftczpE+CSxYtSd435Iui8tVE+R38PqXaAuCWe7fSd5Q9+LF45jSz6yurpYQnJ9yp
 /fB2kbv4TbhZDW6GlCroS5bcJsh9w3L0JXjpTzYvnOioI2vFT9RxNJncE07l55cbAe4tkWHNp
 H3/6rpO/WsEU8j0tzZrgP/wq68sj8acWXTRmgORg+9OUfqYhdnDyELhEKIQodMaVRt/kTga/f
 I21W2MhiIpeIjZq63L52sWZVmbuDyoHNL6NokgCBn67/zRdYRokLLjTJBISYF3vydDdxgOdLQ
 qcIW3gaWpL+MBCE9YkHpALgWvgQrB5+P2o3ESm5dVzopA=

=E2=80=A6
> +++ b/drivers/media/i2c/imx728.c
> @@ -0,0 +1,4660 @@
=E2=80=A6
> +static int imx728_set_fmt(struct v4l2_subdev *sd,
> +                         struct v4l2_subdev_state *state,
> +                         struct v4l2_subdev_format *fmt)
> +{
=E2=80=A6
> +       mutex_lock(&imx728->lock);
> +
> +       fmt->format.field =3D V4L2_FIELD_NONE;
=E2=80=A6
> +       *format =3D fmt->format;
> +
> +done:
> +       mutex_unlock(&imx728->lock);
> +
> +       return ret;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&imx728->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc5/source/include/linux/mutex.h#L1=
96

Regards,
Markus

