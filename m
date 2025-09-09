Return-Path: <linux-media+bounces-42055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B82DB4A105
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 07:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 052E11BC3878
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 05:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5E82ED84F;
	Tue,  9 Sep 2025 05:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTcn689R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEF642AA9;
	Tue,  9 Sep 2025 05:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757394019; cv=none; b=eOcKHl69KNyfzfwi8pEbcqJG4f6x5fzMmzfFsJx7cjtaL8Uj6qTucjDW8GL3TFYKIc2gfY/iscK4z3kId4B9ytYRaTXhjk+MW+8wga7S+IR9Pl04Lp+CIii03U1VcK7YlAqESwZfMsP5GYTj+AddMp/xzljqHz0jxS8yFH4BnWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757394019; c=relaxed/simple;
	bh=3XIAo2qpHvA4WmYscSECteBG0QYxRHh63STV9gp+gFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8LRlXch2HnVVlNkGMURdi0wvNV9J86CI6EBnRIGGLQ/fdIgBZtYbS0aQSrc+I97EpqVR6/mrrLC1vftcp01MtFFSVGYrxkTMumysTMviU2TNHTTLhMCW9J6Xk7GlXOwyGNC67czJ+6scH2NviKVizuQdLveQJ6x7MJgwdp03oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTcn689R; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3dae49b117bso4479567f8f.1;
        Mon, 08 Sep 2025 22:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757394016; x=1757998816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvWoQumFNTmdVD16AHMfCOQayYv4kB4ZtuuQ9k6C1e0=;
        b=NTcn689RNixfD/f9O232OsLX9/iIYvGdACoF3N3SozZXe6qVPkl153kZGaL1HrOSij
         OmW9QB3EHkNS08C/msWsDSgQLUNfs+RlPtkMpvFPNl/zt+RfRgqKexbtTmAcGmeB1CmN
         GnNqSSIf7+DZQMJQwC8upAA8FeChUv6bGM0f3ULQgvdDg+xL4OVFsHHeEvZXXO+QAi2K
         xHi/Y6hcrymDuf3kfkpYEwCH9wMtersSz9/L+C30cSBJzoGnuytdF8F+rMHf+k0bCCU/
         SrV6PxmOA+nFQ5DS8y9co87pf/skOmQtJ4zKxGv1+MNcqrtHEo6jK0W/YRCBw/xMtWTw
         lcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757394016; x=1757998816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvWoQumFNTmdVD16AHMfCOQayYv4kB4ZtuuQ9k6C1e0=;
        b=UfUmNxZUqCipPyqxASJMQ1P8jpBh1HuSoPJQAjS+5uansjLJJHR2zNqfWd2VF2f18h
         2u9Dk2jISWBj7sUotdMJfNCRJJ8SPD98aKVXxVg1XsdhIIc6w2GLDmBx7UkQk/NukQDs
         NAzxwiA//6GDYNAB6nGGOoGyLmyXG4teCFhqYrim2RdhsomsArk7OUsCzfv+fo7akNpl
         JTSCvrR/6JngU3jQG9Dj+RI8dVeUBuPMnGvUr151it9b0WLCJ15wVps1vHrMyDsPuy3B
         3NGVKL7ctZTk130hF4QBgu5iXsyDCYX1EtPiypD59KOn1IXr49LcPyJzKrIp0+JdFj9e
         VRjw==
X-Forwarded-Encrypted: i=1; AJvYcCUgBuVE9RITNA+PiiFN3RMJ5b7seWA2esPMulrdW5CkDa4qkTwCwLs4nWxspztYGLI8wnZpIi+DI7fpX17u@vger.kernel.org, AJvYcCUk9XQ1Io5d04LXGzSaTK9xEPKzmWH/dApoywjE5Yy6eAqDnU8kpQ3P1FbvhoCfunkCuQpR/+i3ThO0@vger.kernel.org, AJvYcCVUIXCg5MgA7CzjItJY4kyxjo13c6mYP7dr/cC+wV83mNB9QWOMcc8z1/LMO9oYuX8c5ZDetUIPU1bunf0=@vger.kernel.org, AJvYcCW/uWTheNw8lOxi6LWl7FFovZqWj1qc4ygChkcG73TJc8TFicuMzQaIuOAvs4PxgDKw6fzXh6mt4tauBY4=@vger.kernel.org, AJvYcCWBRMxW8U73k2PJe+ezzLNjsnkW1EsrA37KWpVcCg15AHgiB/UY/Gr2fFeB2H/LEOznYmSzKL8O62qJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yysa1/cFw5SzF2/ZN5+4yaYn4jNgOMZyeG3+8xollgVCigrxNYB
	gYtmOGbOBC3VODBiZAjfoFwD8AYJ8o2ptbWxMjlJuo0RuH2NswHgn1ttioOa5XEIW2lynhIVh7z
	byPCl70KcyIsiixQrVLmehUfTpwBoOWI=
X-Gm-Gg: ASbGncsxjf08uRSiOtRSSKoYH+NEm+7+cJgs9PdBBlmLbO6o0540zQ0DC0avO7IlgzC
	jnIXOCvxaIvn9Yqo9OJoQRCirecUmucH1A9avWqyoJrF5EiuL9IHbFnlztgDKGjAnovfWNjIxO+
	7dGxD7hHkTN3srovL8JRAk3t2IeDfoUbxR5lojF9JmIeFrUJmSDAVQvK4ke5abbUna4G5XlLRep
	CTkOyLhRIV1T67t/XY=
X-Google-Smtp-Source: AGHT+IG2zjYHyHxDrSFyGdWaycUP0DnV1hIepEsmw6nSgmsn9ogr9jjPFRCaYQPTy+roxHGLBD5nuBqHvVP9q4sOQgU=
X-Received: by 2002:a05:6000:26ce:b0:3cb:3ca5:870b with SMTP id
 ffacd0b85a97d-3e64c1c2b58mr9289210f8f.44.1757394015848; Mon, 08 Sep 2025
 22:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <20250906135345.241229-13-clamor95@gmail.com>
 <20250909005729.GA2330015-robh@kernel.org>
In-Reply-To: <20250909005729.GA2330015-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 9 Sep 2025 08:00:04 +0300
X-Gm-Features: AS18NWBubeuZYVIrBS9Y3gvos_QkcU48-UEb6DN0-0PA-mnw9dcMiO5insdn20M
Message-ID: <CAPVz0n0PhzjsJSKp9P7amG36V+E_dLFXAgJqtTPx4cfH0m5BXQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/23] dt-bindings: display: tegra: move
 avdd-dsi-csi-supply from VI to CSI
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Osipenko <digetx@gmail.com>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 9 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 03:57 Rob H=
erring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Sep 06, 2025 at 04:53:33PM +0300, Svyatoslav Ryhel wrote:
> > The avdd-dsi-csi-supply is CSI power supply, it has nothing to do with =
VI,
> > like same supply is used with DSI and has nothing to do with DC. Move i=
t
> > to correct place.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml   | 3 ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml | 3 +++
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-vi.yaml
> > index dd67d4162884..bb138277d5e8 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi=
.yaml
> > @@ -75,9 +75,6 @@ properties:
> >    ranges:
> >      maxItems: 1
> >
> > -  avdd-dsi-csi-supply:
> > -    description: DSI/CSI power supply. Must supply 1.2 V.
> > -
> >    vip:
> >      $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra210-csi.yaml
> > index fa07a40d1004..37f6129c9c92 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-c=
si.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-c=
si.yaml
> > @@ -37,6 +37,9 @@ properties:
> >        - const: cile
> >        - const: csi_tpg
> >
> > +  avdd-dsi-csi-supply:
> > +    description: DSI/CSI power supply. Must supply 1.2 V.
>
> On further thought, why does this have 'dsi' in the name at all. If it
> happens to be the same supply for DSI and CSI, that's an SoC integration
> detail. The name here should be local to the module. Perhaps
> 'avdd-supply' is enough? Fine to rename it as you are breaking the ABI
> moving it anyways.
>

Not only this supply is common for DSI and CSI, on all schematics I
have seem so far input for this supply on CSI block is always called
avdd-dsi-csi and supply is named accordingly. This patch aims not to
rename supply, which has correct naming IMHO, but to place it in
correct place - CSI, not VI as it is ATM.

> Rob

