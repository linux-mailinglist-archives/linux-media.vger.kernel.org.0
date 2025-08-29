Return-Path: <linux-media+bounces-41298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3727B3B394
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 08:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BC131C855F7
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 06:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194B9257854;
	Fri, 29 Aug 2025 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nn09N6k9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB4F25394A;
	Fri, 29 Aug 2025 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756449765; cv=none; b=dVSEYuppMYh0nj7nP2/AxQkqVI2hWC9G7nMnr6poMS0zMccky3yLhmrDUrB93/hk/tJCmtY6TWYpTVRMCwUD7b4IKb8SGWmnIIXTtk2sT5w8/SFSNub0x2hLhdlDKvKYNifaTBJagsVVUT0kYUZWd3HstKcrKY79zrgRlhxGkgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756449765; c=relaxed/simple;
	bh=kVuD7W376c6FrZNyHaO5XNEGImOvvlZo36DWNaRRpy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbmgXf/z41UNBUOp6L14IIS9SChQRWsxJVGlJMK4lFX9qQQK7y9PxI3mqQdFYCERIq49pklWnHhbr50JNySf9glzQKhR7Em21HqPNJQgMNaXav/P9nJcgVQfNlhvhSmRpCl/Cc9xQb1YzLZrKfGDSGHY3XOXveHh+nAk+MW45Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nn09N6k9; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c73d3ebff0so1313410f8f.1;
        Thu, 28 Aug 2025 23:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756449762; x=1757054562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWSNy/JRqLkLoJxnOEcFDdNep+6HQzRpiS/0aFPTMrQ=;
        b=nn09N6k9F65ztBjTgb/lbslL/gqROChSuBduyEO8+2QuOo2nCmo1/QWvZ10eqI2f3g
         TGcr0lhl/shkmLgn0e/b7gTVFJDMHRTUSzDGGBoouMv0lLyCMVn885ZkBfD7PHVzL2An
         PMytXSjkR6XPfN3jKa2lFYIbQOUmZUOeMZ6rHWGICS/nD98V8/Pe8P+0aTmPvT6bUP5h
         mQGRyELKKQZPlNUhFsdBcM56bAnawdQdVKxfIf+okq7ETHd+nVRdWn+rEkuxqdEHomNo
         XUEbTWs/cuxluCXhXIKUOJPi9yv0kow6p6XL20x5Ne8TGEDd9sRgnaYkCsNsxu4W4pgI
         43bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756449762; x=1757054562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWSNy/JRqLkLoJxnOEcFDdNep+6HQzRpiS/0aFPTMrQ=;
        b=q/5HB/8zFNZyan0nZVrrOqINm5ZxRLV3PPfm4JGIFmkJKKfER8J/jOpgwMtzOcnZnw
         m6IrbG5no/FLCTZHBrCMYO1A9NxxpUWAZ0g1+BjTjrOo1ZHkq4kFAeuk8n3Y/Wc5PzAg
         kpEcAH2iuoNhEfgRkDYpzdhyBe6B9ju7HDuMKccz2+yI/8dSz4ZJSdrdYqVZKm9qYwWU
         yO4bmnjCAjamA34Apby3J1NlP4L7JJNWES4BRtoTHQ4OdsmOsCwdX5wqVQTfrXLP4PdM
         nUKtsgAhzdwwz9vtUyj/zrWX5F6NEgO5SYqEVr3oC7hKH6sVKrLDjmpJscKDUq+cCnS3
         gA2A==
X-Forwarded-Encrypted: i=1; AJvYcCVY3Re4VRlUdqzMEf+WVWiGtiDg1sbvEOvB9/Xk7iy7NpU4lXljHqDpDQtmYDSxV6v/4+jwAknrZD5gViw=@vger.kernel.org, AJvYcCWBcYxjAYth3k4XUcfmAxUpFs07oxkGrKAwDuETGdJ1jOP+JEh7AsC9o1UC/FE729sH11obiAMxOu5W@vger.kernel.org, AJvYcCWRhrR8fDTYq4jsA8hrhl5LaBt7qPwyBSVVzYHt/BpCW/4I0m/6b2SYAiwYDdCIvToe1pDOTsDe9gFpK4k=@vger.kernel.org, AJvYcCWYyRiS1JL410XTZR4o4caRv8yCynQuO2XaPuzRkz+F1NCQyEId1USrnamSFZaikZgbdBeedyEGyESG@vger.kernel.org, AJvYcCXJT1LVJ3BrKiqh9/H2YJspa74b97yt5aQi08i7pbRe3TO3WYOEdWu9x177iuHOUiMxTu4zOtmUAOjrfDb4@vger.kernel.org
X-Gm-Message-State: AOJu0YyhGSASguC2Wr65cRGHpnXAgR12xoppRt1VLfp9bSRsSDY28Xc5
	vteKpraYCw1z9HsGrSiEevOE82RNJXuWDXwtb3ZPn8cnfVek6zp3y2PdLTGyOJAzQzBfs5yBQ/L
	VUm0KozQnUoXvcbmRdEl6E5c2BVb/mqs=
X-Gm-Gg: ASbGnctyNqH95wps2pe36QSrlkdtHOXLgK/X89/6kWEHUPxFzngxNnc+DWZBmgz3U3V
	sWWkdDV1QiZbQaAHfIunztuwUVEKL+FgbVANZ2ofbmA3FQHFbesWhw22O9gJGO96qNUiM7lofBH
	THLiwVf9SZw+dPYh0BWWq41LaNhHUHEAwcZ4QE/hDzfFYZzOFTckSoiF/H0MgN7v+i21SFq90W4
	tscYTm/
X-Google-Smtp-Source: AGHT+IHjRL9sOfRC6KlJXM91TuBldUFCTWN+6IKyuNVfAGqivuS+QA4CO7lbMYhZ/89R1DWqkhTaNLnSJ6XXeiMAmew=
X-Received: by 2002:a05:6000:40ca:b0:3d0:c6bf:60c6 with SMTP id
 ffacd0b85a97d-3d0c6bf6478mr507752f8f.13.1756449761912; Thu, 28 Aug 2025
 23:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-5-clamor95@gmail.com>
 <20250819202722.GA1264491-robh@kernel.org>
In-Reply-To: <20250819202722.GA1264491-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 Aug 2025 09:42:30 +0300
X-Gm-Features: Ac12FXxicf5syu3ZrQDe1liim-jpvbuNbb6FjdElmnqfyMSBMVU7aVm-Nae8-uI
Message-ID: <CAPVz0n1CN_rXu6EvgiMBeCvpOK6Ep96pax+naRha-=9THBifZQ@mail.gmail.com>
Subject: Re: [PATCH v1 04/19] dt-bindings: display: tegra: document Tegra30 VIP
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, linux-media@vger.kernel.org, 
	linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 19 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 23:2=
7 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Aug 19, 2025 at 03:16:16PM +0300, Svyatoslav Ryhel wrote:
> > Parallel VI interface found in Tegra30 is exactly the same as Tegra20 h=
as.
>
> That's not what the compatible schema says. 'exactly the same' implies a
> fallback to whatever it is exactly the same as.
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml    | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a20-vip.yaml
> > index 14294edb8d8c..39e9b3297dbd 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi=
p.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi=
p.yaml
> > @@ -13,6 +13,7 @@ properties:
> >    compatible:
> >      enum:
> >        - nvidia,tegra20-vip
> > +      - nvidia,tegra30-vip
> >

Rob, may I use this:

properties:
  compatible:
    one0f:
      - const: nvidia,tegra20-vip
      - items:
          - const: nvidia,tegra30-vip
          - const: nvidia,tegra20-vip

Among all Tegra SoC only 2 have VIP support Tegra20 and Tegra30.
Tegra30 is backwards compatible with Tegra20 so we can use fallback.
There should be no new generation added to this schema.

OR should I use enum?

properties:
  compatible:
      one0f:
        - enum:
          - nvidia,tegra20-vip

        - items:
          - const: nvidia,tegra30-vip
          - const: nvidia,tegra20-vip

> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> > --
> > 2.48.1
> >

