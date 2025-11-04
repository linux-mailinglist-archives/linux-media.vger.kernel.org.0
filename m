Return-Path: <linux-media+bounces-46274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5299C3078D
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 11:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0644F18802A0
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 10:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA62314D08;
	Tue,  4 Nov 2025 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="i+Ef7W2B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2CF314A8A
	for <linux-media@vger.kernel.org>; Tue,  4 Nov 2025 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762251665; cv=none; b=n/cptVZ/Z3tFpPuHRwLneoe0IKIZ4nglyWkCpAONPH5BjF7mWhYSnYw/0cKTeqUgpMZ1G734q8QqC0yAKpgCdOmXeZ2JnZRP/DCcNKD1mPQ1BgqXAbJtag2pfllDErDJTNjFzW8DAMTomT7BYG+pD3CQXIbgWU6avQrEBJ60sg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762251665; c=relaxed/simple;
	bh=5J988xgzUoKhpnIV8wJJmIThAQtBkhT8F7us5dAtIOI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=esjqHvoZbcd3/S+MDPN7mhdGxeBVc/+5qCs7yVDeF6Mobl0+6anMyeoy9LfEdQ4g1YBYpIC85EaOxzw0rUj2dEMVotFenpM6tVY6ccgmKUoI3Sc/kgDm102sD8tImAJzsmU/UET6CVWnB6wu00VYmJEK7dK2zFM+4bEviE7bOYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=i+Ef7W2B; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so968722266b.3
        for <linux-media@vger.kernel.org>; Tue, 04 Nov 2025 02:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1762251661; x=1762856461; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/RFo3UdyJ5uBJavOLzu9OBwxixnA2BpiywkHJoYEzQ=;
        b=i+Ef7W2BajNHzs21IFAtNFyykvGoKg3sW9vTirYNJizgQSaEkLdQxJGQ6VrF19CuwK
         OV7ttoJIDL+1szbTbGBp/wKU5QbpBR18iGndfdGNLDKdY8ftp3Xs/Zda10uClHHIiHOv
         mHQSRYK9vwqIQ+yDmy2MCiTk3cZpoBq7bzD8L+isd+tIkZg8VbCXf3+aw/JeRQeuEDZc
         MMElD66FDHO/GEQUXqABAvAMrT/RStIMdVswU2KYia1BeexFHcy1HmK13fcZG94TReAF
         zJ0AxP8STtZHmt84zMUHcBQmfAjTg0+k/ExKm5kB+fKtZAOMj5i37uO7Bp/L7ILyB9tt
         df9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762251661; x=1762856461;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6/RFo3UdyJ5uBJavOLzu9OBwxixnA2BpiywkHJoYEzQ=;
        b=uAlPptFVvZIeCGp5Z8HqJs5Mk5ngqtZyronXdRnM0H24vov2EQC/LdgNg7MccxRF/S
         dIf2UKSI98XTCVhq0a7GgaFik9obl/LCgQml/+uP8ZkxbPt+3rheHFHTfrSgK2unqU29
         9MSVbvXZn2qdesWd5GrN3hLtsuLNoy4+PQ7qzUFrhsJFvpVS786bQlxaUfvijVlMg8LC
         5BQo/U9t4jjpfk5xBvk47mrc5p79SJOQBVqCWWzdAH3wGgCADdCyICEFC7+SuoIjjCF4
         B5LROY7vlV7LbHKigPrTJsV9CCTBnrryeBJ/TymIgKEzq2q08GKbqUtk0UhPOC8eN11w
         doJw==
X-Forwarded-Encrypted: i=1; AJvYcCV5c5oStz02MmGjn2Bo0qpQ+cl/saW2GoPL7Iijz2XEGVm4ExPpxkRAQ/Dpn0TjWj0U9HLqdrd4/TtHHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5d6bjw7pzO3pEBp24J2lUoQqgj4/jw9wADtjADqKG1IHw4aMl
	BjUF724SIvpudCHt/7aQYm38GkAwvRGW0cOYAqCJz2gFWaAJPGqCOtZP3BkoIQExvHg=
X-Gm-Gg: ASbGncs79keytEwlougGFSG2BHEPcGNBPidh1jlFmzf4V3BKOAEuSjZI4GSLfNppJS8
	dN0x64apR/SQZBg+lcvehZpNsTle8l811uHBP39FLr+nWc02a15bItGbdPR4RvznpD1vP1Mu9Xi
	03NqpOjLcq0uDanqWhHQKEICX9G/Wvu0kGLEMtbFSdvXHcHu99FaAfWkbWfhN9+1/d3pJafHygg
	MPryUvEH3rxWNu3Kucg5RL+84CbmKgRgt1Sxu6Ar7a6M4fYsLz5SJFD1QLj2n/t29aq24dW2Rbj
	r8NEefPsxBqYptYZXAzLPeRsDz2BjftxbdAsPIoHM7GPwhTnc2eGl/t39ykoSaGBHdPyLTW5Otf
	B6gCkZVn3PWaAx8+jD9V8GL3oUF1aya/ozhtvJgYFXA2+cbLOYl8HcmlQ02K9ZNf5iCl7qrkx5g
	o4iVyfUE7clmj8urT0tJrLTFjTYIpZ80lxdqzf99A9sWx6NQ==
X-Google-Smtp-Source: AGHT+IFEjC7oZkjOCH8J2UshvPQf+tsl/dOaxiMblcsbQfzjgzuRO+SX63ddsnmaYogAi/EotKBWQg==
X-Received: by 2002:a17:907:7e8d:b0:b6f:198e:c348 with SMTP id a640c23a62f3a-b7070630cfcmr1768373266b.46.1762251661432;
        Tue, 04 Nov 2025 02:21:01 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d3a378asm170655866b.5.2025.11.04.02.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 02:21:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 11:20:58 +0100
Message-Id: <DDZU2RL00UD8.39GS3LN0SW7YA@fairphone.com>
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Hans Verkuil" <hverkuil@kernel.org>, "Hans
 de Goede" <hansg@kernel.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add Samsung S5KJN1
 image sensor
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251023025356.2421327-1-vladimir.zapolskiy@linaro.org>
 <20251023025356.2421327-2-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251023025356.2421327-2-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

On Thu Oct 23, 2025 at 4:53 AM CEST, Vladimir Zapolskiy wrote:
> Add device tree bindings documentation for Samsung S5KJN1 image sensor.

Awesome that you're working on upstreaming support for this sensor!

This sensor is used for the front camera on the Fairphone 5 so I'll give
it a try sometime soon. So far I've been using my own version of the
driver in my tree.

Some comments below.

>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/i2c/samsung,s5kjn1.yaml    | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s=
5kjn1.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.y=
aml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
> new file mode 100644
> index 000000000000..f0cc0209b5f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjn1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S5KJN1 Image Sensor
> +
> +description:
> +  Samsung S5KJN1 (ISOCELL JN1) image sensor is a 50MP image sensor.
> +  The sensor is controlled over a serial camera control bus protocol,
> +  the widest supported output image frame size is 8160x6144 at 10 frames
> +  per second rate, data output format is RAW10 transferred over 4-lane
> +  MIPI D-PHY interface.
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s5kjn1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: MCLK supply clock.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Active low GPIO connected to RESET pad of the sensor.
> +    maxItems: 1
> +
> +  afvdd-supply:
> +    description: Autofocus voltage supply, 2.8-3.0 volts.

This is not part of the S5KJN1 though? If you have a VCM for the lens of
the S5KJN1, this is a separate DT node?

> +
> +  avdd-supply:
> +    description: Analogue voltage supply, 2.8 volts.

The datasheet calls this VDDA

> +
> +  dovdd-supply:
> +    description: Digital I/O voltage supply, 1.8 volts.

The datasheet calls this VDDIO

> +
> +  dvdd-supply:
> +    description: Digital core voltage supply, 1.05 volts.

The datasheet calls this VDDD

Regards
Luca

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +
> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/gpio/gpio.h>
> +
> +      i2c {
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          camera@56 {
> +              compatible =3D "samsung,s5kjn1";
> +              reg =3D <0x56>;
> +              clocks =3D <&camera_mclk 0>;
> +              assigned-clocks =3D <&camera_mclk 0>;
> +              assigned-clock-rates =3D <24000000>;
> +              reset-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>;
> +              avdd-supply =3D <&vreg_2p8>;
> +              dovdd-supply =3D <&vreg_1p8>;
> +              dvdd-supply =3D <&vreg_1p05>;
> +
> +              port {
> +                  endpoint {
> +                      link-frequencies =3D /bits/ 64 <700000000>;
> +                      remote-endpoint =3D <&mipi_csi2_ep>;
> +                  };
> +              };
> +          };
> +      };
> +...


