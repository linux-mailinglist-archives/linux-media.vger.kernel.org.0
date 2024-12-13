Return-Path: <linux-media+bounces-23364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF49F0815
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 10:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02D1E1883A07
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 09:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6531B3937;
	Fri, 13 Dec 2024 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="g7OhLdu5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8E81B21A6
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734082754; cv=none; b=dvfSfmw4a2z42cXVCxvJfGQn6X6+ugfF4UV5wMg2a8zP3iLg8DFG10C4JfmIOgM9HRZOv6gck36GnmiAT6lO1RTmwbmk7uaF0tb5Z83zGCmTy7TSdFNIvcHa921c6YS8oEo4WFiAw8TOqgDmdSwEVtLiHTwVi92HwC9l0YGMpas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734082754; c=relaxed/simple;
	bh=2dVHZNzyurcrnKSHioCNBqidibj8sEypNo67w3dWXbg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aSvGum89aXuQwi5idVRlAiezdAd4nbhQzPKPUYNW42EZv0+sxkZH1MJ41rQ2L4xwqwNS/UPzCts3MtMQVrtppnd96McCsCoaeLgoedDzhRZ0S2xdLjBzG1XHlrSzMdyWNh/V4rX8RPr+kKboK7gTHeF2QOpkQG23ABW8mSfxuv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=g7OhLdu5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385ed7f6605so781552f8f.3
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 01:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734082750; x=1734687550; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4JqniyrUVA29zrwSIJYAdkpKjXdhEDlx602bvtZzJU=;
        b=g7OhLdu5JF+wOJRljRkKcUYiMoR2IphW/B1mYJJOudFHF873xfXgc8Ie1n92m4ruDu
         No7Ue6P3NIBv6exHD3+X6G6DFCLtjg9fpJFrVugbuz5y7p2e2+bbgcltBv/m2Maagpo9
         y2pd4FunZqFaWEj+PlSbXvkpys8Anfe2vaazOSsrMJo6qQvyRKZfUNkVSKwzZ+6kdhJo
         1dMgGdish7xXxQPwvaHm4dkLzogun6AX3+7QzRg7iQiTXdEKz2XQJ8gGbqbqKfMA7Q+r
         oKIlkOcoBcPWf+LjwMIb5NiX2a00zY+awCASDakCDGilNmDU65shrr9/vCVQw4yVXWH6
         2D7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734082750; x=1734687550;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t4JqniyrUVA29zrwSIJYAdkpKjXdhEDlx602bvtZzJU=;
        b=jYscqeUsW593QUmKatjCLXSi+uRIMr4wMFPI/v0LscWWHcXFKtnyYWxxlhzO7oEIiJ
         o1DK2ck77IcsW0CfJtY7p45AVqdq09Agy3NwT1wbg2+D2zZsl53oZ123NXeUso36+xQd
         e+y1JiUqmswkfaqeTns/VVytlF0wLn3Ma8wDYO+P8aBEy1LcPu3M2ds7ArGgGrOLCRk8
         nc52uK+sDg73fPN1T5wcu2lxfjbr6A5UjtX5qxqNhR/82HTLDIt0PuemvOYkbbr/fzR5
         IRNgKMRpMtPg86laziJQDpxhs9Op+L1AfwIQV6LbJslxqzpWaEM9NqbGTUfQcP5pPlWo
         L+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDUOuuh9YWu245wlY1Wqgi2TjIxZwJSAfltXBL2D9oqhmAVDBozVlPWdeqdtq0pqWf9pNMEm7rRl0SQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKHkq0ACDuErU+FA7MvVQHZ7owhQ3bcXc4rJc2Z+pE8sF3s2TY
	qWAJGjneLA4vdVxIb4pRtv9A+trcjuGY3irYVxuB5a/KLLxCx+STzLiOpYZOHTE=
X-Gm-Gg: ASbGncsZnLomd/vWpS7fHIc11Wp6dGsyOZ1kOJKTOGWsBW2VBp1RyjcTya8MddndnZT
	F5QRkpW6GZYrxTNManLzEAzh9yeyWwvek6IlC/CgxVYzmReQvfGt4BN3mJFi1pmnfP74CEl5LuL
	PdMI0goZfWYkYfCak3rd2c5kW6SY+ooW/faouztYa9GCsg5Q/BJVLDAOFngxliO284aZ3yik+WC
	z6spVtr7hrIiTxYkLFa6pn0ZsWdbpn5dCepJ8oNDcctU+wN+17wRAxK2MOLAYorgrfwtEEaedw1
	HyAIfgHpjR+3TQcwHri5YO8N+g==
X-Google-Smtp-Source: AGHT+IH/9u8CkqVlx6cHHLvAJS9uDAoxtK09++pI/aUoVOp3EvdqqeNkdS8a6S0cwyVHTzYjlA51+A==
X-Received: by 2002:a05:6000:4609:b0:386:39fd:5ec with SMTP id ffacd0b85a97d-3888e0c15c4mr1424272f8f.57.1734082749648;
        Fri, 13 Dec 2024 01:39:09 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c5c98sm6495726f8f.58.2024.12.13.01.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 01:39:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Dec 2024 10:39:08 +0100
Message-Id: <D6AH15BCVPCD.Y8CO9YRUJZ3W@fairphone.com>
Cc: "Robert Foss" <rfoss@kernel.org>, "Todor Tomov" <todor.too@gmail.com>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Barnabas Czeman" <barnabas.czeman@mainlining.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@somainline.org>, "Caleb Connolly"
 <caleb.connolly@linaro.org>, "David Heidelberg" <david@ixit.cz>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] media: dt-bindings: media: camss: Restrict bus-type
 property
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <20241209-camss-dphy-v1-1-5f1b6f25ed92@fairphone.com>
 <nqggstwkytqxpxy3iuhkl6tup5elf45lqi3qlgyv6eaizvnfdr@2uy57umdzqfa>
In-Reply-To: <nqggstwkytqxpxy3iuhkl6tup5elf45lqi3qlgyv6eaizvnfdr@2uy57umdzqfa>

On Fri Dec 13, 2024 at 10:34 AM CET, Krzysztof Kozlowski wrote:
> On Mon, Dec 09, 2024 at 01:01:05PM +0100, Luca Weiss wrote:
> > The CSIPHY of Qualcomm SoCs support both D-PHY and C-PHY standards for
> > CSI-2, but not any others so restrict the bus-type property describing
> > this to the supported values.
> >=20
> > The only exception here is MSM8916 which only supports D-PHY. C-PHY was
> > introduced with newer SoCs.
> >=20
> > Do note, that currently the Linux driver only supports D-PHY.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  .../bindings/media/qcom,msm8916-camss.yaml         |  8 ++++++
> >  .../bindings/media/qcom,msm8953-camss.yaml         | 15 +++++++++++
> >  .../bindings/media/qcom,msm8996-camss.yaml         | 20 ++++++++++++++=
+
> >  .../bindings/media/qcom,sc8280xp-camss.yaml        | 20 ++++++++++++++=
+
> >  .../bindings/media/qcom,sdm660-camss.yaml          | 20 ++++++++++++++=
+
> >  .../bindings/media/qcom,sdm845-camss.yaml          | 20 ++++++++++++++=
+
> >  .../bindings/media/qcom,sm8250-camss.yaml          | 30 ++++++++++++++=
++++++++
> >  7 files changed, 133 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss=
.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> > index 9cc0a968a401836814560c1af3ee84d946500b4f..3de2a3d2b5b761106975aab=
65ff614b2ef579ef5 100644
> > --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> > +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> > @@ -94,6 +94,10 @@ properties:
> >                  minItems: 1
> >                  maxItems: 4
> > =20
> > +              bus-type:
> > +                enum:
> > +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> > +
> >              required:
> >                - data-lanes
> > =20
> > @@ -113,6 +117,10 @@ properties:
> >                  minItems: 1
> >                  maxItems: 4
> > =20
> > +              bus-type:
> > +                enum:
> > +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> > +
> >              required:
> >                - data-lanes
> > =20
> > diff --git a/Documentation/devicetree/bindings/media/qcom,msm8953-camss=
.yaml b/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
> > index 8856fba385b1123d748199b46c5009c97700ad9b..6d776b0ca71140c0816b246=
dbaf41ef376205bba 100644
> > --- a/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
> > +++ b/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
> > @@ -112,6 +112,11 @@ properties:
> >                  minItems: 1
> >                  maxItems: 4
> > =20
> > +              bus-type:
> > +                enum:
> > +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>
> Just 1
>
> > +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>
> Just 4
>
> The type and meaning is already stated by video-interfaces and the
> binding headers.

This is actually something I find rather curious why this is not done
more obvious, e.g. there's basically no link that a '4' is
MEDIA_BUS_TYPE_CSI2_DPHY from dt-bindings/media/video-interfaces.h

video-interfaces.yaml only states "- 4 # MIPI CSI-2 D-PHY" and it's then
the users excercise to find MEDIA_BUS_TYPE_CSI2_DPHY for that.

Regards
Luca

>
> Anyway:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof


