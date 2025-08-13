Return-Path: <linux-media+bounces-39739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C45B241BA
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 08:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78DE63AA765
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 06:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832722D3737;
	Wed, 13 Aug 2025 06:38:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DB42D3220;
	Wed, 13 Aug 2025 06:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755067104; cv=none; b=KfBnN//mJKNwhM7+Fgb3MwqGX7dtBnFhuOVGxA2qHFF0OygCAC5gGzs6OuVQDbQlXxS873bPtBTQGRdMJF4GpNfWA7p3ig7EguOxZlVia6F/S7YXt0h/HHYQvKv3PlT67Tf4oRl0z+TQYZ/qjVkt86zItS4YDBw2O7tDDHmad7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755067104; c=relaxed/simple;
	bh=NlaZC1vsg/3EvL4u3fWp4og70gDFoZCZIHdYTf1ff9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QINQm/+R42VCniuuVpBDLzJyD/26d+gytI7ZibTyymrEvs81Ho/fy+zV27myuiQS1p9mPkUMzBugPZKxPZPf/AifqnimY0Lurha/X38axJ+CXtKZSfF75OSDUHEgFEbK7bO5dOIQ6up0kMDN7XsELwsL1XJSJnQR2hP2OzsC/9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61568fbed16so9849058a12.3;
        Tue, 12 Aug 2025 23:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755067101; x=1755671901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hANsG9cDZ8y0uwjnNV/4yPX2jp2bM/vF9ssenK54Q3g=;
        b=CBPCUSviIuMT5j+kj2m61Lcg0oxSxzT5bMLWc+geZjKokyLpAIWGqh8AcPVZWqlnvl
         Z2Ig7oLBvAkfiza6oydmE9jZHfqHfO7MY/PnQZSCbCMaDrt/MLY0N7YfJaYrlgk99DRg
         vQioWVy2wgYgDCnFWQ+MCu2mQVPQhohLcMPoZgdg2f2gQmcRX/3X4SSX9QxIYHFUs8ZK
         WkY65WSxqCpHMdX3GGZZvNnHFIOHp5qIwAaDznenjBXZSTN6qpnVTOvg0BjoQKAu1NI4
         pY+P4eQKBkIyKgtWNoFn/ZocekigRp650c0RIpDJvupPmCrXWr65ouO7IaymVhJSgguu
         EQzg==
X-Forwarded-Encrypted: i=1; AJvYcCV6golCLnZ4bKo15rjevADvZYhnqlxNWogzgLsWpRSRUbxQWbjHdYdCjf6cowZ/jrJWo4qAZZ/xR5Nt@vger.kernel.org, AJvYcCVM/hdPvDpaoIDVo5xHPv8pGNWvjccHYDU4HxovfrF1PvRm9a1cJKdgkero/1aNobvvw2UxGT8mqto+U7k=@vger.kernel.org, AJvYcCX57xvRfKZ/8YOZ2bXkteW2BubuY68TVIC/CdCy40dAQJMv0IEzi5fKyeoBR9te89NqSgSoUjKWJ9zHxmdM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw20u2p0g91ZaVyiazXUSODYgWl5oTneon2fSL2Lqe8PbIZGQ11
	YUbdXWzX3R5e4TwrUykUj8DqJVZNIQYrK6MwXZSpdI8WUiSoi6vdeXFn8wwTQA9HM5g=
X-Gm-Gg: ASbGncsw6Jn323Wqc6vTeQyZGiYxk7z2TLRvXcV+21f7+0gpccSmX0HvLXo/zmppFP9
	podnYAkGp8h/D+Nev4g87i4whIR8zDFWo3N/3XvR0zmem5v/Pi6qq1Iq+BsoTr5qcvX05hRR6Dq
	E531Us85QEydi8fuadvahvy+93yENh/9AziLBHIOq6ovfXT6b2Skz8xwC84L5Y/PaPuj2sO2DtB
	A/Y/GN/8P5XAz4RnRe0iSrYcJUvwxaCF0vP1JKq295XOS3TPDpP17sVT1IVIdN2/Lq4Nwr9jnmu
	UeWv3tYXik8iICBtORKFh8dtrR7+h1FOtge/bJcxQHPFeMlDiOgKLW/uwZTfU5G+qsuyNkyvhQ7
	sdR8R4jIdZyg9ZtJ/x1Wc+wXN/2Doeo5dg2mP/DhJzwBHi8jgandQOW2eBw==
X-Google-Smtp-Source: AGHT+IFgrcpGLwy1D4Ab6xWE5L9jJ2olv+s4GNqUG3YfEdp6MbWv+JTYO29SqKMXRBr9ujxBm6QZNw==
X-Received: by 2002:a17:907:72d4:b0:ae3:4f99:a5a5 with SMTP id a640c23a62f3a-afca4cc8debmr162755666b.6.1755067100225;
        Tue, 12 Aug 2025 23:38:20 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af9247845edsm2278268966b.46.2025.08.12.23.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 23:38:19 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso11430361a12.1;
        Tue, 12 Aug 2025 23:38:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV03C5hMh+xzh9W7SJRbabUWZl0ZcZHXBrq0jqK8dWyPI1HNJ/hzq2Hi8XvL9SCfglP4NJ01BxQWyfUUCp0@vger.kernel.org, AJvYcCW42IawvgX5YFj0c/Qjn+v/vDgfpyjpyjxpqYubVFmZhG8p2ULX1NjjSy9k/Hq8QEitZvT1F9c//3dtCY8=@vger.kernel.org, AJvYcCXWQSNKkIuUubfO23fgTtKQ8206N/2258bJnmEU/jbmJrRlp1X++tkyvF94qnkXBQQmG6mBiShWCJa4@vger.kernel.org
X-Received: by 2002:a05:6402:35d5:b0:618:6a75:75a0 with SMTP id
 4fb4d7f45d1cf-6186b4b1ed4mr1626683a12.0.1755067099429; Tue, 12 Aug 2025
 23:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka> <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
 <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org> <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
 <e695c61a-e183-4eea-a7f6-1b2861b2129f@kernel.org> <20250812095543.GJ30054@pendragon.ideasonboard.com>
 <CAFoNnrzWot_Bf=YZFac1GkZgOOnJycwpidvwL93p3p-C-zn8BA@mail.gmail.com> <6d6dc9e6-751f-4079-b21e-2e3461885b03@kernel.org>
In-Reply-To: <6d6dc9e6-751f-4079-b21e-2e3461885b03@kernel.org>
From: Will Whang <will@willwhang.com>
Date: Tue, 12 Aug 2025 23:38:08 -0700
X-Gmail-Original-Message-ID: <CAFoNnrwoRbtvTHHnjarDTKEHnQMaMDERPKi_vnYym3n8tVpzOA@mail.gmail.com>
X-Gm-Features: Ac12FXzzLLrmw8gIl8Z6rXDfhueeMgmWZqS1-9wCIvFbO51xu2pnx-aLX2I9B8Q
Message-ID: <CAFoNnrwoRbtvTHHnjarDTKEHnQMaMDERPKi_vnYym3n8tVpzOA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 11:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 13/08/2025 06:30, Will Whang wrote:
> > On Tue, Aug 12, 2025 at 2:56=E2=80=AFAM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> On Tue, Aug 12, 2025 at 08:47:12AM +0200, Krzysztof Kozlowski wrote:
> >>> On 12/08/2025 08:31, Will Whang wrote:
> >>>> On Mon, Aug 11, 2025 at 11:23=E2=80=AFPM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> >>>>> On 12/08/2025 04:47, Will Whang wrote:
> >>>>>> On Mon, Aug 11, 2025 at 1:01=E2=80=AFAM Krzysztof Kozlowski <krzk@=
kernel.org> wrote:
> >>>>>>> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> >>>>>>>> +description:
> >>>>>>>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> >>>>>>>> +
> >>>>>>>> +properties:
> >>>>>>>> +  compatible:
> >>>>>>>> +    enum:
> >>>>>>>> +      - sony,imx585
> >>>>>>>> +      - sony,imx585-mono
> >>>>>>>
> >>>>>>> I don't understand this second compatible. Is this different hard=
ware?
> >>>>>>> Can you point me to "mono" datasheet?
> >>>>>>>
> >>>>>>> Your description should explain this. Commit msg as well, instead=
 of
> >>>>>>> speaking about driver (in fact drop all driver related comments).
> >>>>>>>
> >>>>>> Mono version of this sensor is basically just removing the bayer
> >>>>>> filter, so the sensor itself actually doesn't know if it is color =
or
> >>>>>> mono and from my knowledge there are no registers programmed in th=
e
> >>>>>> factory that will show the variant and model number. (That is why =
when
> >>>>>> the driver probing it only test blacklevel register because there =
are
> >>>>>> no ID registers)
> >>>>>> Originally in V1 patch I've made the switch between color and mono=
 in
> >>>>>> dtoverlay config but reviewer comments is to move it to compatible
> >>>>>> string and not property.(https://lore.kernel.org/linux-media/20250=
703175121.GA17709@pendragon.ideasonboard.com/)
> >>>>>
> >>>>> You only partially answer and judging by mentioning driver below:
> >>>>>
> >>>>>> In this case, what would you recommend?
> >>>>>>
> >>>>>> compatible:
> >>>>>>   enum:
> >>>>>>     - sony,imx585
> >>>>>>     - sony,imx585-mono
> >>>>>>   description: IMX585 has two variants, color and mono which the
> >>>>>> driver supports both.
> >>>>>
> >>>>> ... I still have doubts that you really understand what I am asking=
. Is
> >>>>> this one device or two different devices?
> >>>>
> >>>> One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQ=
J1
> >>>> (Color). Silicon-wise the difference is just with or without bayer
> >>>> filter.
> >>>
> >>> Then I would propose to use sony,imx585-aamj1 and -aaqj1 with short
> >>> explanation either in comment or description about difference in RGB
> >>> mosaic filter.
> >>
> >> Works for me. We could possibly omit the "j1" suffix too.
> >>
> > My thinking is that imx585 and imx585-mono are easier to comprehend
> > than IMX585-AAM and IMX585-AAQ.
> > Because in dtoverlay for the users/me they will have to know what is
> > the exact name instead of easy to remember name.
> >
> > dtoverlay=3Dimx585-aam
> > is not as nice as
> > dtoverlay=3Dimx585-mono
>
> I have datasheet for AAQ, so how above is easier for me to figure out
> which compatible I am using?
>
I propose this:

compatible:
  enum:
    - sony,imx585
    - sony,imx585-mono
    - sony,imx585-AAQJ1
    - sony,imx585-AAMJ1

  description: IMX585 has two variants, color (IMX585-AAQ) and mono
(IMX585-AAM) which
the driver supports both.

Description is there for a reason, dtoverlay has description also. See
sony,imx296.yaml as an example.
If you are looking at AAQ you know it is a color sensor and all the
color sensors from sony can be used with imx+three numbers in the
current list.
This is following the established convention.

> >
> > which is what it does, a mono variant of the sensor.
> >
> > I really don't understand the standard for compatible string naming
> > here, is there something I missed? Is it required to use the full name
> > of the sensor parts number as a compatible string?
>
> It's not part number. You have there different models. We don't add
> prose to compatibles, but use device or model names.
>
> Best regards,
> Krzysztof

