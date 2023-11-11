Return-Path: <linux-media+bounces-117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D887E8C53
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 20:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 752781C208C6
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 19:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BBF1CFAC;
	Sat, 11 Nov 2023 19:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="XLClci90"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7370A1BDED;
	Sat, 11 Nov 2023 19:23:29 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AE4C4;
	Sat, 11 Nov 2023 11:23:28 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 271F21C0071; Sat, 11 Nov 2023 20:23:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1699730607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K6odKY3sY9Zkf6tdtdGxd7vIMwPRzaLEncX/QIk0rXA=;
	b=XLClci90peawuVYrVztZgHTKdYXdm0itTVjUfT1o+gb03zwYRO8sKeZM7Ysqz3xv20JsKu
	gC10dXiq9RGnUBBC4l5p/D3yMyQ+N+l3lmhT6w1JHTEAimIyXCVpEiyRC6bxc4D4nADsnJ
	1B/ta8uCxeE34YaCjjZuP2frK0rBieI=
Date: Sat, 11 Nov 2023 20:23:13 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: media: i2c: add galaxycore,gc2145
 dt-bindings
Message-ID: <ZU/QyrbaeyoV5+ON@duo.ucw.cz>
References: <20231107081345.3172392-1-alain.volmat@foss.st.com>
 <20231107081345.3172392-3-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HEYXTtUT371s7KFw"
Content-Disposition: inline
In-Reply-To: <20231107081345.3172392-3-alain.volmat@foss.st.com>


--HEYXTtUT371s7KFw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Introduction of the Galaxy Core GC2145 XVGA CMOS camera sensor.

> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc214=
5.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> new file mode 100644
> index 000000000000..94d194cf5452
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/galaxycore,gc2145.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Galaxy Core 1/5'' UXGA CMOS Image Sensor
> +
> +maintainers:
> +  - Alain Volmat <alain.volmat@foss.st.com>
> +
> +description:
> +  The Galaxy Core GC2145 is a high quality 2 Mega CMOS image sensor, for=
 mobile

I'd drop "high quality" and add "pixel".

> +  phone camera applications and digital camera products. GC2145 incorpor=
ates a
> +  1616V x 1232H active pixel array, on-chip 10-bit ADC, and image signal
> +  processor. It is programmable through an I2C interface. Image data is =
sent
> +  either through a parallel interface or through MIPI CSI-2.

Short note what the on-board ISP can do might be welcome here.

Best regards,
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--HEYXTtUT371s7KFw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZU/UoQAKCRAw5/Bqldv6
8orDAJwM20frY6IY1jpKX8OIEbZK9e6RLQCZATDMB7pVsZ9YHVBMUlxXBbnOi50=
=I4xG
-----END PGP SIGNATURE-----

--HEYXTtUT371s7KFw--

