Return-Path: <linux-media+bounces-34365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C6AD2537
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 19:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEA427A5B36
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 17:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F29721ABD5;
	Mon,  9 Jun 2025 17:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7yieRrC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8348C218ADD;
	Mon,  9 Jun 2025 17:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749491642; cv=none; b=iJu3GFN2JfAlV3xdyJsbc9G8K8WwKt1E+3R3el+2uPFp9VCvF7acM/VG3CdtxSrZjHcRO0TrJz/BcnsjVzdnekel1ZSrcLaH//B1JHSzBxB7+DoJQ25+FbAIfJZmxPWNbR7EhKfvQbdJDl46PApHUY5WIrpWpXcwoYYQHTtFDD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749491642; c=relaxed/simple;
	bh=kelMJff8wJTREpM7rMjD4HeqtY7kzJoHJJ0/eCsUp2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uG7vKWzpRavGFosmkPFsfnake/S2290a4e/c/xRrd+2OJklef51OuIVvnUrBXLaBEebGOFv46QH+3RPqNCl9qCfagJp6eex1Xm1Z5heRxCArowHe1VfZoxzWpLTGPwEoBsg3hNxPUKrw9jLPdzQ0TNW/hwCuRfDAwVSBQCGYD1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7yieRrC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso3990947b3a.1;
        Mon, 09 Jun 2025 10:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749491641; x=1750096441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLavl1OFNqOjRx3CGhPlhwLyCUU3nUM8v4tmbP82xPE=;
        b=H7yieRrCDcOBS/SynV0iq3UaLVq6wWzz/jQ9BNWPdEIL+H8O0bWPOeqWX2nWg/S2qd
         rzppJlb9ZQWRaBCN0NA2TjdtZGafnwZ4YhlidSbpclwopaL73wzF3KRU1Scdl5X+xaAa
         2qCf+PGI9vOvB0E8Iu/2yNWuRvS4gQVeXk/8cf2RH1QunBM6jczeY0wVbAca6QQaMcXl
         67+z3Mm1yFpZ/5Wzy6zHSZHbgv10gJ7zvGkyCL5SD7NXBHFfx2z+abzj+hNjae+OXLUw
         d+jQlZ6kpO4fs1Max8BLxugcoZbPXF9gsNfzE4eCx4OKOI9dilDjnAj1buWwoZEIIic4
         ZgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749491641; x=1750096441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLavl1OFNqOjRx3CGhPlhwLyCUU3nUM8v4tmbP82xPE=;
        b=jS5BDyFhI+vzeJPQrFzCKMsJWygcZseiC/9Ub9W5hLXlLjJMVLyd7W1c93a73WNS8o
         FuOATjWuVXXwEO8rr7HKYYM/Jf+RhaRAKHvBeYCdvxgiiMywpUUvsn17HHH7xM+AYoHs
         hM/WIsCaiUmsQv7N5dXDIY+mUZZI/IJqpGI3vBZ2n/8VXaboM6iyaCZiX6RBgdirL1R8
         2F0UAMi64+fK+/OjXL4XEyQzIj4DeYNAi0QeYojl1YkmCmhsHXgoVLpjYYzmnZinA3a+
         VTOCGYf76nQRW8vjfO9+LkCSgP2HRADx7xeZ7gEUrkD1o7igA7yvDxcVLNbkPazmfLj6
         NZFg==
X-Forwarded-Encrypted: i=1; AJvYcCU13RXINPm9TmFFcUECQUQvFl3/72RCy9rdImQpTFb5ua4nsce753dJ7ViV6zP6PyeAMgWCryPmqXNJHxg=@vger.kernel.org, AJvYcCXYB4G9P6zNa9KRSmBptZJ3gGU+TJ0V/3gzY08SFdoGncwl0r8W63/OQdtMgEKJAmWxc3h4j31618x5@vger.kernel.org
X-Gm-Message-State: AOJu0YwMUQxv6Z+EmlSgqLFqrQNhM40ZC7KlNWDvI8uWXdVJzdF27Lby
	lLxkk+7T+7cAQcm0iqDsOaz2hQs+3w5fLghDi7WrItbNbzVNK8U6Gq9Qf3I4/vdeD372ohaaEbF
	OaL3oQJXHkUHdf2m/z3MqoMMuEu66Q0s=
X-Gm-Gg: ASbGncuwq4ysgB15NzHQj7IqLPjBTS5mZbPrTVkcbgMMEckczrE6WElE2+CEFpRwexr
	YVjGUH3u+4Bx4WMveBbf/JFLbrRhaFGe0GPHrfhNHLuEfq592i6y1NwyzkKlxI1+LYTI9W64eT1
	pDUvIHIop1mwhtK1Ejr2/MnAkR74+eiHJj
X-Google-Smtp-Source: AGHT+IEg36qltC0WMS5rKcmC0QOu1qYNMycbO+ypdNoe6gLAt9s6BqjElaf2ITKT7TIBRdwePFzwfXD7EdQ4aFq7nQQ=
X-Received: by 2002:a05:6a00:c88:b0:73d:fdd9:a55 with SMTP id
 d2e1a72fcca58-7485ea7097emr499919b3a.8.1749491640678; Mon, 09 Jun 2025
 10:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com> <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
In-Reply-To: <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 9 Jun 2025 12:53:48 -0500
X-Gm-Features: AX0GCFvBSlGjJP6_gYPY5G8LHDwywJVn2yc0aoIQdRQOd7fdU_ZaLDtXpMwt8Ck
Message-ID: <CAHCN7xJjR1zZXeJAvkXmdNYroP6Jm6TLjHjnPUOF4z7yaL7EFw@mail.gmail.com>
Subject: Re: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add
 fsl,num-channels property
To: Frank Li <Frank.li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Isaac Scott <isaac.scott@ideasonboard.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 10:32=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Jun 09, 2025 at 02:58:38AM +0300, Laurent Pinchart wrote:
> > The CSI-2 receiver can be instantiated with up to four output channels.
> > This is an integration-specific property, specify the number of
> > instantiated channels through a new fsl,num-channels property. The
> > property is optional, and defaults to 1 as only one channel is currentl=
y
> > supported by drivers.
> >
> > The only known SoC to have more than one channel is the i.MX8MP. As the
> > binding examples do not cover that SoC, don't update them.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.=
yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > index db4889bf881e..41ad5b84eaeb 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > @@ -68,6 +68,13 @@ properties:
> >      default: 166000000
> >      deprecated: true
> >
> > +  fsl,num-channels:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Number of output channels
> > +    minimum: 1
> > +    maximum: 4
> > +    default: 1
> > +
>
> Look like it is fixed value for each compabiable string, So it is not
> suitable for adding new property. It should be in driver data of each
> compatible strings.
>
> I met similar case before. DT team generally don't agree on add such
> property, unless there are two instances in the same chip, which have
> difference channel number.

If the DT changes are rejected, can the number of channels be added to
the data structure inside mipi_csis_of_match?  We have compatibles for
8mm and imx7.  If we add an imx8mp compatible we could add a reference
to the number of channels.

adam
>
> Frank
>
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
> >
>

