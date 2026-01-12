Return-Path: <linux-media+bounces-50482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B69D14219
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 17:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 92253300E8E7
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 16:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9C836A010;
	Mon, 12 Jan 2026 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bH1T5z96"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B28936999B
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768236278; cv=none; b=oWLg40oHQwzP5v8sWR/hssW1E1JCjt9F+yCMleZh49ER0/m+0Vll10lEuT7k1qnKxZRKXfijExscNgD481hzeqmalSbrljkSj2q9jodnf8mBam5wydzqeY6B5ofB0U71BEx7EuzPufTjkngSIoB7eIvZBIbCYxBcrb/mNFx6NMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768236278; c=relaxed/simple;
	bh=15bJV717b3BmCRep7g3f3eqDSXeQzdRiVGChJjyTeQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uURS7K30EZyi7OmY9bnTCDJvTnSPnUZ8zwmTrFLdtNN6V7ZPhre/Bk+cTg75CFRs36B3CMgPYvs4BjMBphYrOvK/rS3Ak+3+/FISOe17IMEvq3UnStXdExapMP2SvcPxQYtvOauJC4FH8kG6PcV2LkkbSCd+5CAFnem11JOf0cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bH1T5z96; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso58015105e9.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 08:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768236273; x=1768841073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cD2W84EqNYwKoDXJN6AUPaelb23t6+j5pqlOt/nW9so=;
        b=bH1T5z96+EQKTkzc7oWa96oLtOaQAGPXrLdTh5cSkS996Fo97FtWnR1kvgFmC+2q2c
         D1i0FIK64uY2AiEZqtLhq3TlBYZoGVA/9VRvfYZeZkXmF15JxrGIcKBM8fA1+6w7Dr9X
         0c87ROpOjeTCAQpYsoBywYqkdMtulPXhV9o5DTigMu+k24P/jDknmWfEM/tJ+Ev7SPhz
         LQVqmoQyKOO2QLkFQ/9e65wiSmdsQ7n+2NBiG98fSaU8ktpvJobQodePyd0Dvhm4hYST
         lk908nc7wt6tRB4f4dPJ3k59nQoeeGK/aKhSFwgyoG1/bWqYKp92v8d6Ex8sk13ooeYm
         vDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768236274; x=1768841074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cD2W84EqNYwKoDXJN6AUPaelb23t6+j5pqlOt/nW9so=;
        b=odxWXp0Nk3iriu3P2sphUXaUOBFtoNjVoopjaeR86eJqIHmz+zjbzPfXbZmRG5z7jU
         Ld+cBFo51BPRv3IPHQ14dcDH59yG2itN2LULATLfsAjesn4rXcm9oiMymU0VcrCLh+uZ
         8n9oJ5AV0VuFlUlpcT1MhR3kouWrc8WEeY+TWLikkatxKLjzCVu9owoH5STy6JIREkOE
         yOrbuXavJpyTYBHX34FABg5K1b2OrfWXVJ94y/nDCikSl0hXg1Q7psaDJz6i+Th9OcXz
         TvDCxbyQ6dH20NKpD5nu7Qg79/AxpJe3xVKW4WRpGtYxLhj/AjTQCDW6srWlK8y82zux
         mrdA==
X-Forwarded-Encrypted: i=1; AJvYcCWb+e4TLeI5sSGa36u3sy2IEedZvjjyp24xfbsoFr8IIxfJippQLxHs84LgSacAagMJIJsa7ovX9cBD6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHeL2tDtCbiv6M563mslnVZTLmuG2oJz2ymkiYA3+lFS92ho80
	SdRhPv4mQAMq/9dqAYYsPN8CaPwEXUfEs1ru8Jx+BrEYCdxKqz6zi7p/t3aNQhXGCjT4Lh4iQ91
	VrpH762vutRtfmJT5vDG12xQ/3m5W620=
X-Gm-Gg: AY/fxX4JeOF41SYuSLyrU4kHlziBlDzpnPdPeDDw+rzFLXs76n5/kiEQkOmJ9Uh4rmj
	IfxdRltAXg7ngH0hKYDXLpvIh1ndXg5hH7rM06TDdRq5LbvTJVR1lAYNU21LJXjcrXSE83tZJ8F
	YnUuZIy6wgtUZrxABf43InM2i9p+tYRz9PAA9HHiiOe4BL1CPL5McYY4Y1o/Pxxmh1GJUVKada7
	7vXlZ5Jl0yQ9w1vXJKhB8Rwk/OeO/AyMa3ElITJZ1HwF+77oAOaBmmeFZAuzAQA5XSyOmc2XIUk
	q6Oi1NcWFE2Ie09iPh05GcqEImJdroi7IfELOuKJxetBRbAAEKks33Y=
X-Google-Smtp-Source: AGHT+IGau+W3RGt608fIO3PobvK9WHuMcah1IGzOIOuD1jKefcV1nFFm2JOlx2I3P0NzrOE0nXKM9dKGfg70UFuX9rs=
X-Received: by 2002:a05:600c:8b0a:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-47d84b0aa97mr211947485e9.4.1768236273225; Mon, 12 Jan 2026
 08:44:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103194554.54313-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251104120141.GC27255@pendragon.ideasonboard.com>
In-Reply-To: <20251104120141.GC27255@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 Jan 2026 16:44:07 +0000
X-Gm-Features: AZwV_Qig6PsppKVhEERX8F-92Y9pCzvropDxY-lGZwStB3z6BiMeRd5H2J_Pg1I
Message-ID: <CA+V-a8sP6o2GUju2ub0q1exiV87zHrkTddvkv8GKR_7wBF+vSA@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,fcp: Allow three
 clocks for RZ/V2N SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Tue, Nov 4, 2025 at 12:01=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, Nov 03, 2025 at 07:45:54PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the FCP DT schema to permit three clock inputs for the RZ/V2N So=
C.
> > The FCP block on this SoC requires three separate clocks, unlike other
> > variants which use only one.
> >
> > Fixes: f42eddf44fbf ("media: dt-bindings: media: renesas,fcp: Document =
RZ/V2N SoC")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > ---
> > Note, there are no current users of the RZ/V2N FCP compatible string in
> > the kernel tree.
> > ---
> >  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
Can you please pick this patch.

Cheers,
Prabhakar

> > diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b=
/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> > index cf92dfe69637..b5eff6fec8a9 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> > @@ -77,6 +77,7 @@ allOf:
> >                - renesas,r9a07g043u-fcpvd
> >                - renesas,r9a07g044-fcpvd
> >                - renesas,r9a07g054-fcpvd
> > +              - renesas,r9a09g056-fcpvd
> >                - renesas,r9a09g057-fcpvd
> >      then:
> >        properties:
>
> --
> Regards,
>
> Laurent Pinchart

