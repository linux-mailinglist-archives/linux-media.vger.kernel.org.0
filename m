Return-Path: <linux-media+bounces-14674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C0E928534
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 11:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8BA1286C02
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 09:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE801474CB;
	Fri,  5 Jul 2024 09:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="adsGhKVp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6F8146A8D
	for <linux-media@vger.kernel.org>; Fri,  5 Jul 2024 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720172142; cv=none; b=nqppiUGBtZTd4d15x9rzG97yp5XsgIwilKHblMM2Z5heb7ocfjdqpx/4rjx8Lof6OuIeWXMR2tS4rMx3AkRpzsVm1EHyVBsfTyXT21TttzhzkwyHpfLROiWJBLbVecw0eW4KKty2tQ1n3lq5gh/HkGYjXvRxoW0eF09VCxcyuIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720172142; c=relaxed/simple;
	bh=Em2aKYy3Oa1sxSVaR3TmaoDOdqW2oPw+brnPviGu67A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWfdKhqM3uNx+z1+Vhn8Af77aiffXV6Bda9Vm9vcDFDPmycyFp6ChEww/jmjYHUUTOZMULd1bsRMwOnknPae/MKW6DkdniA8woceBg2zruXYiDly1qO5+0kLJV20kKiV4jXEqQtYilagGMaI7KkfbtWBwubDJMEoH4OFR9iLX7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=adsGhKVp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a724958f118so171315766b.0
        for <linux-media@vger.kernel.org>; Fri, 05 Jul 2024 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720172139; x=1720776939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euAXj9/Zbt00wQcV3hScVKSy3ue4FmA12Ai4cuOhm7U=;
        b=adsGhKVpWD3IrLFez17W8HzMG5+M0WKXUsQ5XQrMsZwe3MN4oWCDIppAIBP2ysripn
         vImKgi18UrfWod+gI7d0ykhlJk2ah2CA1oLv4/WiCPlN2hyUwU7zV3512cOVOfnzTRWC
         cVOdLT0vhUSUXdBAPsNHiZOFcxbyqqpXFJyojDaYEMy63FyxVb/vN26bWZvfELxtMglW
         KTf55mXFVAzYCPCMvunLafBUA2E3Hrw/TGiFSUeNsY5ImjTvXn3OSplHpQFuWUHdvQid
         6QPgirKkIkxlhgV2YK1O4dMWDMYY7JSJ2fbkmflPsArRc22QZKsFKSm3KIHrUhCTAO7e
         LqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720172139; x=1720776939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euAXj9/Zbt00wQcV3hScVKSy3ue4FmA12Ai4cuOhm7U=;
        b=h1U6itkqbGurrTLxum4ZfzQsqMfyh5kvQjuog3QB0ZABXViodWVqSnKlYrTyFAmlSb
         ffXDkF7f0XyuDzL9FFe3YSb6aDHxoaML7qs2BoN6wE/w3JCeQLNbw3Km1jluXYTfCpWm
         xjMlACdjnZxSuFC3RW0yrrC3zmwGCKFlw+6XGzmtMyDolW37rYWEfexgcsk405CQ/raN
         fFNlJz9ChI7/71bHHf4jq66obuMMz+ieQ76JOhvPmfSteNghFMN6HepLyalGD8ptSzfV
         zTzF7s/jgs/pT41PTWMRnc5Sp+fJL6/NRkqouSIsb/MCJGpEk2OWF0uk6d1yytFGiiNh
         TkkA==
X-Forwarded-Encrypted: i=1; AJvYcCUGiZnDulNB9d26WK3ZY2rOWGrqtRCLn9cRwT3uoXMzRYvteOMGteyEnlRwSuuyhjshOcwvddQv34mCggTVnZQa7SSj3kZ+JCiGC/4=
X-Gm-Message-State: AOJu0Yz7/HitXapvLjzylMFAefxjkpBUbXfu7wv+8DWTVojyb5IHNZdI
	NM6GSxzLBIeqWfcp4Du+csDxLqFbOEO74SMU41MmTEWQpq2+9sUwky2GqupIw/Isva29AhiOtCR
	9G2QPcp+oYOC2K1e6q09vnpF7jCI2gt7jZeXYxQ==
X-Google-Smtp-Source: AGHT+IGJ8iQG2g8TrtDd3sj0/x1DvXY35ku2dMQviXNSW15txgM1PC4YZj/0UcvfS0C7PajOhp6AWzvAGJwxJW/rsBM=
X-Received: by 2002:a17:906:578b:b0:a72:b803:a1ac with SMTP id
 a640c23a62f3a-a77ba70a6f6mr243833466b.56.1720172138772; Fri, 05 Jul 2024
 02:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-1-bfccccc5ec21@baylibre.com>
 <20240704-catcall-stubbly-9258b056e42e@spud> <CAEHHSvb6Y8g_KCmu0bK__EP2TyPhf8i-ctMNfOGdyMUUGoKQVw@mail.gmail.com>
 <20240705-riding-overtime-642faba3dbbf@wendy>
In-Reply-To: <20240705-riding-overtime-642faba3dbbf@wendy>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 5 Jul 2024 11:35:27 +0200
Message-ID: <CAEHHSvZad9sSo+ubKdgwvdzjVz7mf9gqL551J+n831q+uoJOSA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: media: add mediatek ISP3.0 sensor interface
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Andy Hsieh <andy.hsieh@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 5 juil. 2024 =C3=A0 11:24, Conor Dooley
<conor.dooley@microchip.com> a =C3=A9crit :
>
> On Fri, Jul 05, 2024 at 09:50:59AM +0200, Julien Stephan wrote:
> > Le jeu. 4 juil. 2024 =C3=A0 18:27, Conor Dooley <conor@kernel.org> a =
=C3=A9crit :
> > >
> > > On Thu, Jul 04, 2024 at 03:36:40PM +0200, Julien Stephan wrote:
> > > > From: Louis Kuo <louis.kuo@mediatek.com>
> > > >
> > > > This adds the bindings, for the mediatek ISP3.0 SENINF module embed=
ded in
> > > > some Mediatek SoC, such as the mt8365
> > > >
> > > > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > > > Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
> > > > Link: https://lore.kernel.org/r/20230807094940.329165-2-jstephan@ba=
ylibre.com
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > >
> > > I'm really confused by the link tag here. At first glance this looked
> > > like you were sending out something that had been applied by Laurent,
> > > given the Link, Rb and SoB from him. Why does he have a SoB on this
> > > patch? What did Phi-Bang Nguyen do with this patch, and should they h=
ave
> > > a Co-developed-by tag?
> >
> > I was not using b4 for the previous revisions of this series, so maybe
> > I messed something up here :(
>
> b4 am has an option to add a link to a patch you apply from the mailing
> list (-l, --add-link) but you should not be using that as a contributor.
> In this case, that link provides no value and is just confusing.
>
> > About Phi-Bang, this series has been in our internal tree for a long
> > time, and Phi-Bang has his SoB on it, so I kept it.
> >
> > About Laurent's tags, they were already on v4. But maybe it was an
> > error ? Should I remove them?
>
> They were also on v1. Did Laurent write part of these bindings, and
> should he have a Co-developed-by?
>

Got it! I understood where I messed up :)
I'll remove the link and add the Co-developed-by tag of Laurent

> > > > +additionalProperties: false
> > > > +
> > > > +if:
> > > > +  properties:
> > > > +    compatible:
> > > > +      contains:
> > > > +        const: mediatek,mt8365-seninf
> > >
> > > The binding supports only a single compatible, why is this complexity
> > > required? I don't see other devices being added in this series.
> >
> > Right. The idea is that the number of PHYs depends on the SoC. In the
> > previous revision of the series,
> > the number of PHYs was not fixed, and Krzysztof asked me to fix it by
> > SoC. So I wanted to make it clear
> > that the number of PHYs depends on SoC but maybe I don't need that
> > complexity for that?
> >
> > Is something like the following enough? And if complexity is added
> > later if some other SoC are added?
>
> Yes, that looks reasonable to me. Adding conditional stuff can be done
> iff another soc re-uses the binding.

Will do in the next series.
Thank you for your  feedback on this!

Cheers
Julien
>
> Thanks,
> Conor.
>
> >     phys:
> >       minItems: 2
> >       maxItems: 2
> >       description:
> >         phandle to the PHYs connected to CSI0/A, CSI1, CSI0B
> >
> >     phy-names:
> >       description:
> >         list of PHYs names
> >       minItems: 2
> >       maxItems: 2
> >       items:
> >         type: string
> >         enum:
> >           - csi0
> >           - csi1
> >           - csi0b
> >       uniqueItems: true

