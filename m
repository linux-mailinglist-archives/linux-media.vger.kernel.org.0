Return-Path: <linux-media+bounces-14304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 559FD91B6C6
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 08:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A2EBB218CB
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 06:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DED1487B1;
	Fri, 28 Jun 2024 06:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="mR0cifh7";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nytYzce6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068021CF8A
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 06:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719555128; cv=none; b=mISgPAX1eEgg5Vf1Q42ZQ6dTnMurgSrnDsOxh1NvFKKIQA43sQ/m+oo4Y8mCwoz4BIQrWq5+wRajlDuXS6hPW5NU182H/gxuSWRWRnwGmwJke8YWrNr7ZLdWa1YJObFeKwcWcEGcpaysMnzGpfPmnIJfmTmL3o/FILBJjnca8kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719555128; c=relaxed/simple;
	bh=TLhzuP1XM65Ek+M0eIyzDoIatacL+Tt65nsA2BcdHyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNHhDL6msCszkVmh3BN1UuDYTr0/hIpznuS/152hD8G+oA+IRNxaOVK/ApwyLXUU6iBSAg9umk2ZK358tFjb5zfd9qNRru1mSshJcQi5bv8jNimuXci9MueKON5KvjDdohXB+FQNh61OrqFbxKUO0VFtI7nEemTPH7ei4dkKKt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=mR0cifh7; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=nytYzce6 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1719555124; x=1751091124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zitbaLICi65z0aqjj1UWwMEmVAlxFUlT4rG1XyogLXU=;
  b=mR0cifh7gQNTPyyZ775zbK610t87ydWKQwQETOvHK3Iv6NhryUnb5Q5/
   QKOSZ9Wpq44JP/Be9+dgEfEeEB5ILqsYp5DM/zSqY/9+kKTV017XNAEwY
   iNgfN5N/VewCWF7sF1ZMEfGBu22xnkuR1yDaZABSd7A5ojZeLojlMIgjY
   rzM902ttSKPVgd3wQxewUa/Jw199Gu9Io22pgktkM81eKrBJXaSds2FG3
   4xSpsCip0XX6TCXxq27JNrdP/UIMpkgRJi2kkodZJKZLTLCBieMdeMSlC
   CwDKZd5hh7GtrOWzZVXALDeTJXLZeQUb2DHyg3ZLgH7fft2UsLxN0x6mm
   Q==;
X-CSE-ConnectionGUID: CAlrTdlJRKC2LtY7/F0nfQ==
X-CSE-MsgGUID: jU4a8uwPTM+/C2ueWvpidw==
X-IronPort-AV: E=Sophos;i="6.09,168,1716242400"; 
   d="scan'208";a="37636540"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Jun 2024 08:12:01 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9ED4170E70;
	Fri, 28 Jun 2024 08:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1719555117;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zitbaLICi65z0aqjj1UWwMEmVAlxFUlT4rG1XyogLXU=;
	b=nytYzce6V48sNYLr90gtgESBqlcTZFFacbVmbEqb1InTCCGlz1mk1JSLgfTBznp4/IKeYm
	JukTswSNdNpsaNeWQphZDp9sd4qfnghmzjCRZfqIv7Ttb9Eb/pA2Nb6lrAP683RMjVzg/b
	HHt97y50pzaJevrfPQ3GkCShFKh5hHj4TCG9qW1XDg0TI8CQmw3fsFwuMuznfE86LwsW58
	jB3/m0047u+wn9LA6fLkYpBqDmv/+PrzQGb3ihs07Rd3BXPvq4Qq1tt4BuEY8K9ty/fp/c
	iq0qT8yE8KA+PhES0Mym0al7IliImtWRR8pus9lM+h7dQIRb8OtzZsHcRcxD4g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Spencer Hill <shill@d3engineering.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, shill@d3engineering.com
Subject: Re: [PATCH 2/2] media: dt-bindings: Add Sony IMX728
Date: Fri, 28 Jun 2024 08:11:59 +0200
Message-ID: <2867459.Y6S9NjorxK@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Zn2icWuizo0WMvxc@D3418SH-L.d3.local>
References: <20240626211529.2068473-1-shill@d3engineering.com> <2981208.VdNmn5OnKV@steina-w> <Zn2icWuizo0WMvxc@D3418SH-L.d3.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

I noticed you missed at least DT bindings maintainer in Cc.
Please use scripts/get_maintainer.pl to get the To/Cc list.

Am Donnerstag, 27. Juni 2024, 19:33:37 CEST schrieb Spencer Hill:
> On Thu, Jun 27, 2024 at 03:38:03PM +0200, Alexander Stein wrote:
> > Hi Spencer,
> >
> > thanks for the patch.
> >
> > Am Mittwoch, 26. Juni 2024, 23:15:29 CEST schrieb Spencer Hill:
> > > Add bindings for Sony IMX728.
> > >
> > > Signed-off-by: Spencer Hill <shill@d3engineering.com>
> > > ---
> > >  .../bindings/media/i2c/sony,imx728.yaml       | 78 +++++++++++++++++=
++
> > >  MAINTAINERS                                   |  9 +++
> > >  2 files changed, 87 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,=
imx728.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx728.=
yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> > > new file mode 100644
> > > index 000000000000..613042ab5abe
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> > > @@ -0,0 +1,78 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/sony,imx728.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sony IMX728 Camera Sensor
> > > +
> > > +maintainers:
> > > +  - Spencer Hill <shill@d3engineering.com>
> > > +
> > > +description: |-
> > > +  Sony IMX728 camera sensor.
> >
> > Are there some more information? Like max resolution, image format, bpp=
, framerate, etc.
> >
>=20
> I will add some more descriptive information about the sensor. Should
> information that is only relevant to the driver be included here? Or
> should I just describe the sensor? For example, the sensor supports a
> significant number of different modes, however only a single one is
> implemented in the driver at the moment, should I list the possible
> modes, or just the supported ones?

Bindings are independent from implementations, DT bindings maintainer will
tell you ;-)

Take a look at Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
to get an idea.

> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - sony,imx728
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    const: inck
> >
> > Are there any restrictions about frequency? Like a specific set of
> > frequencies?
> >
>=20
> The sensor must be between 18MHz and 30MHz, I will add this to the
> description.
>=20
> > > +
> > > +  xclr-gpios:
> >
> > reset-gpios, see sony.imx290.yaml
> >
>=20
> I will rename this here and in the driver.
>=20
> > > +    maxItems: 1
> > > +    description:
> > > +      Specifier for the GPIO connected to the XCLR (System Reset) pi=
n.
> >
> > No voltage supplies?
> >
>=20
> I will add these.
>=20
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/properties/port
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: ../video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> >
> > Which data-lane configuration is allowed? 4 lanes only? or 2 lanes?
> >
> > Best regards,
> > Alexander
> >
>=20
> The sensor supports both 4 and 2 lane modes, though only 4 is
> implemented at the moment.

Again, driver implementation doesn't matter here. If the hardware (!)
supports both modes, then list it here accordingly.

Thanks and best regards,
Alexander

> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    i2c {
> > > +        clock-frequency =3D <400000>;
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        camera@1a {
> > > +            compatible =3D "sony,imx728";
> > > +            reg =3D <0x1a>;
> > > +
> > > +            clocks =3D <&fixed_clock>;
> > > +            clock-names =3D "inck";
> > > +
> > > +            xclr-gpios =3D <&gpio4 17 GPIO_ACTIVE_LOW>;
> > > +
> > > +            port {
> > > +                camera1: endpoint {
> > > +                    remote-endpoint =3D <&vin1a_ep>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index ef6be9d95143..34fde35eb0bd 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -20589,6 +20589,15 @@ T:     git git://linuxtv.org/media_tree.git
> > >  F:     Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> > >  F:     drivers/media/i2c/imx415.c
> > >
> > > +SONY IMX728 SENSOR DRIVER
> > > +M:     Spencer Hill <shill@d3engineering.com>
> > > +L:     linux-media@vger.kernel.org
> > > +S:     Maintained
> > > +T:     git git://linuxtv.org/media_tree.git
> > > +F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> > > +F:     drivers/media/i2c/imx728.c
> > > +F:     drivers/media/i2c/imx728.h
> > > +
> > >  SONY MEMORYSTICK SUBSYSTEM
> > >  M:     Maxim Levitsky <maximlevitsky@gmail.com>
> > >  M:     Alex Dubov <oakad@yahoo.com>
> > > --
> > > 2.40.1
> > >
> > > Please be aware that this email includes email addresses outside of t=
he organization.
> > >
> > >
> >
> >
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/
> >
> >
> Please be aware that this email includes email addresses outside of the o=
rganization.
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



