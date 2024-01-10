Return-Path: <linux-media+bounces-3450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AB88297C1
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 11:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA21F1C21AA7
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 10:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E57840C0F;
	Wed, 10 Jan 2024 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="nWGDH7Ps"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA7C405C6;
	Wed, 10 Jan 2024 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1704883278; x=1736419278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FbLsEIlNyd6GX/XHjNWJGR1uo9EGedSeA4OcmYymtTk=;
  b=nWGDH7PsAXxQueTkUkLBFYLrFb1iMOfylv/HXzgMt10CcHb3WBgrp4mV
   JE1mniLDQb2ovaeSsBKs/6GqKWs4asG58ns3gfdbHYXBozmDqPJuwiohT
   PAycwlWYCn5/zJC4NhzSxP7oz9weaYWV1cQtFv66E15Zel3+XEwW5q2kY
   x0y5I2KooQSt9iYls7espcpIPNf3VRGFE1+yq8QoyvyeJkQTwWUVyPiZ4
   Djx16q2uIJV0A+3mFFhM0ruk8TOmnyaLxU3mxJqgG5kj5h5tFoaNeBaaZ
   TAosYWyGmDwIujeJHgsnwJzKkXSgYtqdLL6igZeAhdYASSTDfkDrKRg8R
   A==;
X-IronPort-AV: E=Sophos;i="6.04,184,1695679200"; 
   d="scan'208";a="34826129"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jan 2024 11:41:15 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 661BB280075;
	Wed, 10 Jan 2024 11:41:15 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] dt-bindings: media: imx-jpeg: Document slot property
Date: Wed, 10 Jan 2024 11:41:15 +0100
Message-ID: <3286392.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <bbb1875b-7980-46aa-80b4-dbaf2a2d5755@linaro.org>
References: <20240110094604.472701-1-alexander.stein@ew.tq-group.com> <bbb1875b-7980-46aa-80b4-dbaf2a2d5755@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Mittwoch, 10. Januar 2024, 11:17:42 CET schrieb Krzysztof Kozlowski:
> ********************
> Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie wi=
ssen,
> dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten Sie
> die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk weiter.
> Attention external email: Open attachments and links only if you know that
> they are from a secure source and are safe. In doubt forward the email to
> the IT-Helpdesk to check it. ********************
>=20
> On 10/01/2024 10:46, Alexander Stein wrote:
> > There are 4 slots available in the IP, which the driver may use.
> > This property lists which slots can be used. In reference to commit
> > 53ebeea50599 ("media: imx-jpeg: Support to assign slot for
> > encoder/decoder") only slot 0 can be used on imx8qxp.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >=20
> >  .../devicetree/bindings/media/nxp,imx8-jpeg.yaml       | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
> > b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml index
> > 07fef1e723f20..5122c7cff8e73 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
> >=20
> > @@ -54,6 +54,14 @@ properties:
> >      minItems: 2               # Wrapper and 1 slot
> >      maxItems: 5               # Wrapper and 4 slots
> >=20
> > +  slot:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
>=20
> NAK for documenting something post factum.
>=20
> https://lore.kernel.org/all/9b853b5f-b3e6-4aea-b99a-51a490a29f9d@linaro.o=
rg/
>=20
> https://lore.kernel.org/all/cover.1697597713.git.ming.qian@nxp.com/

Ah, thanks. I was not aware of that discussion. I'll wait for v6 then.

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



