Return-Path: <linux-media+bounces-14256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0CB91A807
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD7401C21695
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE1B1946AF;
	Thu, 27 Jun 2024 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="NDwTwesO";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rvaSSrED"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92E9194147
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719495492; cv=none; b=Sj/vwfKiNjCCl9dLEoznArMF7NvI636dkPJAicQCrcYpyhCgplu2YAcvvTRu8pX8be+QrIOT+2l4WPVeGMi/TI0PLl2qEHdG6RKCtlvAA/xds7md+8ihSfO9EE4gSIcsf/LsU198skvToVw2Hqammb6MtvCji2zLFiGQCVGOiXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719495492; c=relaxed/simple;
	bh=p/VbpKn4GFG8SJ6cLr04a7JZLlOOUf/37Q1GDHWG4kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IBUbz5SVfKzud3Iwjb0keP3gjH4qsyJMbdiIO1YujnXc61PJve/Gy77ANvKsNy6TTrmZ+CvKIICFVAJECWVlgroXQn+SALqBsKf807wASLFdlNNpd3GmbMjJoz3eNF9Vb2CdMVp2tvfIyZ/OOb4Oce35WJjlN7k8lmieYe9hE30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=NDwTwesO; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rvaSSrED reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1719495489; x=1751031489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YHeJWKnlMZKhe1Tuh7lyLkHqSSPcgc9Vf17Yh4X9jPc=;
  b=NDwTwesOOD89JWaWsRje4v6y6NuqZenq7QjLmh5k/mur89ZsaaBYVQE2
   UUjvZ9+BfQ8lyvE+ayPy+C0Z8PMQXoK2ECF8vIFlmMAlBPc0GpnP4MISy
   mq4VQMq3GJ8lo5ejDBLCswv0z+ST7CQdfhuSJqkvu9WgAdrQg8sOx4goo
   mEsZegiPzOx/DLvKKq9VIxyu0q8U4HsKVs2QQCBfD+RFofCIfTrDuFQ6c
   E1nS93PlIdfRGJC/KwA1DReKCMyRaE5WjXTPbSHZ1dovPjll/rQ8/OWmd
   saSr4UwczaUr4GEdRg3+KKyS0nW3JUGKlAVohBokU1wxTq0QmlHij686r
   w==;
X-CSE-ConnectionGUID: eZ5Kd8XlSnOH2BhCdJm22A==
X-CSE-MsgGUID: lJkB/+iVQwekBx9sazAddQ==
X-IronPort-AV: E=Sophos;i="6.09,166,1716242400"; 
   d="scan'208";a="37626346"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Jun 2024 15:38:06 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0E011646D6;
	Thu, 27 Jun 2024 15:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1719495482;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YHeJWKnlMZKhe1Tuh7lyLkHqSSPcgc9Vf17Yh4X9jPc=;
	b=rvaSSrEDQffWRg0tGhHNJJu9CHkNJTKQXpWwQ3fVvSAvlGPQU9MfCLtC1IazFtWbx2GLRc
	/3vUNhESC4lsny4L3fa/YNwRe+A9ocGz6/ky7oxkNSCNwXX/s6myHT8CsvNSiRpSTo72GF
	e2I3X/g5fcunZa96tM08r+UrTTx8zPsTX6k1qgpEj1TSX1/J3Uv/7QyogkGNXz7soK3d1d
	4jd8RIMAv39W/TDH/vDKIPXQsJPgXJpTVIUoX4bnvDc9XRtEio6rO3nvKd8JhjbamTgNgD
	waIc1vG0JklTL18CwIejmjBjFfkvE43qniUFCQqJfMwhK2Z2N173FVPERwZ3wg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Spencer Hill <shill@d3engineering.com>
Cc: Spencer Hill <shill@d3engineering.com>
Subject: Re: [PATCH 2/2] media: dt-bindings: Add Sony IMX728
Date: Thu, 27 Jun 2024 15:38:03 +0200
Message-ID: <2981208.VdNmn5OnKV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240626211529.2068473-3-shill@d3engineering.com>
References: <20240626211529.2068473-1-shill@d3engineering.com> <20240626211529.2068473-3-shill@d3engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Spencer,

thanks for the patch.

Am Mittwoch, 26. Juni 2024, 23:15:29 CEST schrieb Spencer Hill:
> Add bindings for Sony IMX728.
>=20
> Signed-off-by: Spencer Hill <shill@d3engineering.com>
> ---
>  .../bindings/media/i2c/sony,imx728.yaml       | 78 +++++++++++++++++++
>  MAINTAINERS                                   |  9 +++
>  2 files changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx7=
28.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> new file mode 100644
> index 000000000000..613042ab5abe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx728.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX728 Camera Sensor
> +
> +maintainers:
> +  - Spencer Hill <shill@d3engineering.com>
> +
> +description: |-
> +  Sony IMX728 camera sensor.

Are there some more information? Like max resolution, image format, bpp, fr=
amerate, etc.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - sony,imx728
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: inck

Are there any restrictions about frequency? Like a specific set of
frequencies?

> +
> +  xclr-gpios:

reset-gpios, see sony.imx290.yaml

> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the XCLR (System Reset) pin.

No voltage supplies?

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: ../video-interfaces.yaml#
> +        unevaluatedProperties: false

Which data-lane configuration is allowed? 4 lanes only? or 2 lanes?

Best regards,
Alexander

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        clock-frequency =3D <400000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        camera@1a {
> +            compatible =3D "sony,imx728";
> +            reg =3D <0x1a>;
> +
> +            clocks =3D <&fixed_clock>;
> +            clock-names =3D "inck";
> +
> +            xclr-gpios =3D <&gpio4 17 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                camera1: endpoint {
> +                    remote-endpoint =3D <&vin1a_ep>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef6be9d95143..34fde35eb0bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20589,6 +20589,15 @@ T:     git git://linuxtv.org/media_tree.git
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:     drivers/media/i2c/imx415.c
>=20
> +SONY IMX728 SENSOR DRIVER
> +M:     Spencer Hill <shill@d3engineering.com>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +T:     git git://linuxtv.org/media_tree.git
> +F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> +F:     drivers/media/i2c/imx728.c
> +F:     drivers/media/i2c/imx728.h
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:     Maxim Levitsky <maximlevitsky@gmail.com>
>  M:     Alex Dubov <oakad@yahoo.com>
> --
> 2.40.1
>=20
> Please be aware that this email includes email addresses outside of the o=
rganization.
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



