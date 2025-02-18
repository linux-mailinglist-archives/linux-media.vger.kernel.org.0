Return-Path: <linux-media+bounces-26283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C72ACA39E13
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 14:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70C8C167373
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 13:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2F5269B16;
	Tue, 18 Feb 2025 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Gt4zRKfE"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E291269AE8;
	Tue, 18 Feb 2025 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739886853; cv=none; b=pG7KvzyozsATYI4ldfMlNMy9C7Y8hg+Wx9Bd31jdSWLL1ZjHPvoK6/xJCn5Kzuifx/hh3AbqWUOv9KGo+9FRryCSn9CxBgkK+8JS5xfw2xgAylPKwIZAi76ncxVIwXWemcwMV7feveKRzzbBJlGLwUrHAYgNClKypwlvYmOGMZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739886853; c=relaxed/simple;
	bh=Fqt3nyMfiZx66vWK0/vAEosj9z42b2w1+of9RItKiFk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uiw+DAbd6C4Wt1p9Nqci1ZJACnKQ6OeSQQw5kkXQnUFDWX9iz/yHslpGkkm3/zQDGbq8+yTcmLlzpf6Q3AzWn41lcKowpQaFfW5PJzRNwexY14wTboqP67eywRDxmHaG01ClTOUKUrNefvc7rlEZUPaSxqj3O5JPFABRsge3FgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Gt4zRKfE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739886849;
	bh=Fqt3nyMfiZx66vWK0/vAEosj9z42b2w1+of9RItKiFk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Gt4zRKfE1X1rcoXYE4id2Dg/ypksW1/JQid9qdmjfuSwycMX7r5XH7rpMkagRv1OK
	 qCZSHuJAn/0/BCyNAD4/cKHjiASPrYsmJp0VfDlkolgTLYAsryVXkajWF5NCXcICbJ
	 LF42Cq+6cKL4tZv7xkiaHROJPncxNPWE3Tp+76K4Wubr0t4tFODvhT6z++KVyOHOdA
	 iNTb58ytGoT5k8ZLRHf+IMp9VJTX9MY9WwVKAQV6IMvvxKeAiXqOb5B+9QjP5yBdCc
	 pI+VjXmMjyCdLCZAAqDZXK4K+LhguOWSVMMxxqqu1C0Gz1bLsT5fufWbiMWVfilyPP
	 jir4L0CiVRoQg==
Received: from apertis-1.home (2a01cb088CcA73006086F5f072C6A07A.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C77F517E0657;
	Tue, 18 Feb 2025 14:54:08 +0100 (CET)
Message-ID: <094bfb612d8895d2316d01704d37c853f8f86ae6.camel@collabora.com>
Subject: Re: [PATCH 3/5] dt-bindings: i2c: maxim,max96717: add new properties
From: Julien Massot <julien.massot@collabora.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Date: Tue, 18 Feb 2025 14:54:07 +0100
In-Reply-To: <20250207112958.2571600-4-laurentiu.palcu@oss.nxp.com>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
	 <20250207112958.2571600-4-laurentiu.palcu@oss.nxp.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Laurentiu,

Thanks for your patch

On Fri, 2025-02-07 at 13:29 +0200, Laurentiu Palcu wrote:
> Add 'maxim,override-mode' property to allow the user to toggle the pin
> configured chip operation mode and 'maxim,fsync-config' to configure the
> chip for relaying a frame synchronization signal, received from
> deserializer, to the attached sensor. The latter is needed for
> synchronizing the images in multi-sensor setups.
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
> =C2=A0.../bindings/media/i2c/maxim,max96717.yaml=C2=A0=C2=A0=C2=A0 | 28 +=
++++++++++++++++++
> =C2=A01 file changed, 28 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml
> b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index d1e8ba6e368ec..fae578d55fd4d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -42,10 +42,35 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 number must be in range of [0, 10].
> =C2=A0
> =C2=A0=C2=A0 gpio-controller: true
> +=C2=A0 gpio-reserved-ranges: true
> =C2=A0
> =C2=A0=C2=A0 '#clock-cells':
> =C2=A0=C2=A0=C2=A0=C2=A0 const: 0
> =C2=A0
> +=C2=A0 maxim,override-mode:
> +=C2=A0=C2=A0=C2=A0 description: Toggle the operation mode from the pin c=
onfigured one.
> +=C2=A0=C2=A0=C2=A0 type: boolean
I understand that this property is intended to flip the GMSL link mode betw=
een
pixel and tunnel mode.
What about adding a property 'maxim,tunnel-mode' to the GMSL 'port@1'.
Here the MAX96717 only have one GMSL port but other devices, such as MAX967=
24 can
have 2 GMSL link and may have each link in different mode.

>=20
> +
> +=C2=A0 maxim,fsync-config:
> +=C2=A0=C2=A0=C2=A0 description:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Frame synchronization (FSYNC) is used to =
align images sent from multiple
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sources in surround-view applications and=
 is required for concatenation.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 In FSYNC mode, the deserializer sends a s=
ync signal to each serializer;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the serializers then send the signal to t=
he connected sensor.
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32-array
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: FSYNC RX ID, needs to matc=
h the TX ID configured in the deserializer.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minimum: 0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maximum: 31
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default: 0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Output GPIO pin u=
sed for sending the FSYNC to the sensor. The pin, however, needs
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to be excluded fr=
om the gpiochip using the gpio-reserved-ranges property since
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it will be used e=
xclusively for FSYNC generation.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minimum: 0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maximum: 10
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default: 0
> +

MAX96717 do not have any knowledge of the frame synchronisation, but this d=
evice can forward some
GPIO to/from the deserializer.

GPIO forwarding need some information=20
- The local GPIO number
- The forwarding direction Rx, Tx, Bi-directionnal
- The GPIO ID on the GMSL link (RX_ID/TX_ID)

Can we add a maxim,forward-gpio property reflecting that instead ?

> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> =C2=A0
> @@ -113,6 +138,9 @@ examples:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
#gpio-cells =3D <2>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
#clock-cells =3D <0>;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio-=
reserved-ranges =3D <0 1>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxim=
,fsync-config =3D <0 0>;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
ports {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;

Regards,
--=20
Julien

