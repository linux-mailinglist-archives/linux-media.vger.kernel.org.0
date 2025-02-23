Return-Path: <linux-media+bounces-26744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 178DCA411C7
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 22:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0DAD17193F
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 21:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F112623F41F;
	Sun, 23 Feb 2025 21:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahgQa99s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F6417557C;
	Sun, 23 Feb 2025 21:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740344478; cv=none; b=SS+gwjR/h9qrBd413xfd4mwinlguIDd2GmLuXJGtQtB7/ouRGxUWd9IITyzSSRnGvJJf+GVl5yqFy1D19mJxrTxkU98UIvi8mFHgxKjfoslyq3rOIFLlgsXXnXsPyYKyT9PDeTjVDQs8hKEe2NkaHYKNY2eMDKwGNm97FCoBWbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740344478; c=relaxed/simple;
	bh=zxDj2fMxASfile2VSEvaIkvEUTivWYo6gCp+AN1CUXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5qpDtZiJ9GtOJEeA9eLIHBZrKyMd2NMTvMKgjjE6v6znef5l9BNbrFpMzaA4XLzT03Fb0xZc0jfYXBPXZ505eDMaa9Q8KbgDSOkJK12oI/U7mwspJKtyLnAvKuB74xcxbVF+RgAhv3xN8FnEcOXpHsxZOwgteToQEbIP+RFsaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahgQa99s; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-520847ad493so2432362e0c.1;
        Sun, 23 Feb 2025 13:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740344474; x=1740949274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQFtjdjOafiEADQBRaOFiwZXhMhhdTmto/Ox+YmLxwU=;
        b=ahgQa99si8JWEbiLhIsF/DQOHcX2F0cLLRqrUGbstWWmlWpsFoCjibx0ABXvNs0JyO
         38U8XWDHegWhh59q/KnhxBvGrjrjjhJhBu/6VVNG3QUTV2WxWI11Q3cWh+L8p56Voy5Y
         QU8qhL05RumW1rcthx7wfEjmUlZ3L9GnWtlAdhi7S9+Zdxrawwe3AnMz6PE5SRLqOlbR
         zscDFmwv2tXxfwZ1CAJc0kvMhuOIKZ6NCpHRRS3l+DoTA3KvAzyS/BxZk969pu1Q/woM
         HUzn6n82+IituOCUeHdhhWimeAjZptvSIjp/8/H/dI3hiTC+OX+cxO8BtEnkr7hSDDTY
         DylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740344474; x=1740949274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQFtjdjOafiEADQBRaOFiwZXhMhhdTmto/Ox+YmLxwU=;
        b=kuFX/NQAesUrXrflJjnt9i0PLGBcZeJ+w2wuFOtOT238FLmSKcKYRO+kIX6rw7BYz/
         tuT8lx3XGOWUybAH2VCsDyG7I00b3Ti/E1gKBHIDqsupGlzEt4NnvTaIelsX7tpPgf5Y
         Uwq+FYDa5pskiaBS9ZbsbwTUA37eDN9fq1d51cKsdneMv20zVPA0pf7WUPryL05yOffb
         cps5RjUD9N5qelW31s6kQ5QzMXP6GLs906SaXvT3jcrmoMKnYQuEHnBbrf7jh0WY1iyV
         4Y2rwhcTGiOEncW9k+fg15Ng6b3qnUxnsbbkePqlzY2YX1Bb5h2gQ9OKOT3bVSg+u3T1
         Bolw==
X-Forwarded-Encrypted: i=1; AJvYcCUOoU4XXUzzKuCi8fJ+JBPEhtv+AjaZQBPPbP0QDp4liW7HCNzn/B88L0GQhvV6Z0TiZNtC1IcgeYtzDTrmKikjRDE=@vger.kernel.org, AJvYcCUfyeTYyxFJUtK0AXZ2j0YhOM4lzhmiutXLYQXwOebv9jUvPwY9xccYOfwdFqBpB9f0noEHr9uq1S2aYdXs@vger.kernel.org, AJvYcCVpPOBSIWozikfUDj5Md5zK5Fpky3eGKzAGfHgtnS/gfbcVnioIhjOXeJvpi1vyhCaFiqFeCHQvJD0NtBA=@vger.kernel.org, AJvYcCXAHuu0+QiZhX7Ecmr14jQXFAyk/BgD5qfBCGAiagMSSDybegZo1tQk3cfow8mJ2fOw1G0M2ed9OHdM@vger.kernel.org
X-Gm-Message-State: AOJu0YxiwU6SEuOp7WFehs29YWGS3nU+KWHPbwzgsJCZKZ+M1Rle0ZXP
	2gxZmXvBIVkGTDX65CvISiZ0ExK7X9hnyX8aGhQ/nYtEusnkJV8J5VbAyl/9V3ofNco7jxqTDlw
	YGXSV7mkk+Fd6n1ObLfPIrWQwiOo=
X-Gm-Gg: ASbGncuxnB5UrGT361g/AWoyJ4giFhgRYa5CkMAsq0RDm5OcbTXOqFJs/WUVop4G+Ar
	ZQxvRv4RFG1yaeF1ul/HWSCzUfu1/pTpyORgqSCzGfobATWeu8IaxEHZkQ8HXB55mORIde86BYS
	AxcDHOlMr5DEIcMIaFErGWZpornJxm3wPgKqHB0NGj
X-Google-Smtp-Source: AGHT+IGGSgWgKy5WW99WAENAza8J4ZWa9eJzFmSviURjSTaRn+3xQPj1VdmieaqQCtFH39TDjkQ1IId4jQnrpaPdKZM=
X-Received: by 2002:a05:6122:a0e:b0:51d:e9c0:e607 with SMTP id
 71dfb90a1353d-521efb6ab4dmr5397075e0c.4.1740344474500; Sun, 23 Feb 2025
 13:01:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-2-tommaso.merciai.xr@bp.renesas.com> <20250223180855.GD15078@pendragon.ideasonboard.com>
In-Reply-To: <20250223180855.GD15078@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 23 Feb 2025 21:00:48 +0000
X-Gm-Features: AWEUYZkuKNFGv4VxbUbng-xGmcA_vIWOXkfKKMt9iFhMwaTfha_zvkFTCE_Ccro
Message-ID: <CA+V-a8vfipunwOoe0=dfP6XMjQUW2OrpqBsy+j_ZVu1AAc55WA@mail.gmail.com>
Subject: Re: [PATCH v2 01/18] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/V2H(P) SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Laurent,

Thank you for the review.

On Sun, Feb 23, 2025 at 6:09=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Tommaso,
>
> Thank you for the patch.
>
> On Fri, Feb 21, 2025 at 04:55:15PM +0100, Tommaso Merciai wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> > found on the Renesas RZ/G2L SoC, with the following differences:
> > - A different D-PHY
> > - Additional registers for the MIPI CSI-2 link
> > - Only two clocks
> >
> > Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P=
)
> > SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > Changes since v1:
> >  - Dropped empty line as suggested by LPinchart
> >  - Fixed minItems into else conditional block as suggested by RHerring
> >
> >  .../bindings/media/renesas,rzg2l-csi2.yaml    | 59 ++++++++++++++-----
> >  1 file changed, 44 insertions(+), 15 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2=
.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > index 7faa12fecd5b..1d7784e8af16 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > @@ -17,12 +17,14 @@ description:
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - renesas,r9a07g043-csi2       # RZ/G2UL
> > -          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
> > -          - renesas,r9a07g054-csi2       # RZ/V2L
> > -      - const: renesas,rzg2l-csi2
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a07g043-csi2 # RZ/G2UL
> > +              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
> > +              - renesas,r9a07g054-csi2 # RZ/V2L
> > +          - const: renesas,rzg2l-csi2
> > +      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
> >
> >    reg:
> >      maxItems: 1
> > @@ -31,16 +33,24 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    items:
> > -      - description: Internal clock for connecting CRU and MIPI
> > -      - description: CRU Main clock
> > -      - description: CRU Register access clock
> > +    oneOf:
> > +      - items:
> > +          - description: Internal clock for connecting CRU and MIPI
> > +          - description: CRU Main clock
> > +          - description: CRU Register access clock
> > +      - items:
> > +          - description: CRU Main clock
> > +          - description: CRU Register access clock
> >
> >    clock-names:
> > -    items:
> > -      - const: system
> > -      - const: video
> > -      - const: apb
> > +    oneOf:
> > +      - items:
> > +          - const: system
> > +          - const: video
> > +          - const: apb
> > +      - items:
> > +          - const: video
> > +          - const: apb
> >
> >    power-domains:
> >      maxItems: 1
> > @@ -48,7 +58,7 @@ properties:
> >    resets:
> >      items:
> >        - description: CRU_PRESETN reset terminal
> > -      - description: CRU_CMN_RSTB reset terminal
> > +      - description: CRU_CMN_RSTB reset terminal or D-PHY reset
>
> I'd mention which SoCs these apply to:
>
>       - description:
>           CRU_CMN_RSTB reset terminal (all but RZ/V2H) or D-PHY reset (RZ=
/V2H)
>
Maybe RZ/V2H(P).

Cheers,
Prabhakar

