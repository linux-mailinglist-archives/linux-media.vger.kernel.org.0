Return-Path: <linux-media+bounces-7392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC17880DDB
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 09:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7ABA283649
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 08:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A5B3B2A1;
	Wed, 20 Mar 2024 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MrNRFhKI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC40F3985A
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 08:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710924695; cv=none; b=QkxqRhOApXPx1MJXSjAVODH5nnXNGZX45vNZolkJcr0eNVZsMMkQQI2dclw3W/8sbLMCfxWXefk7WMC4p457zTNOzmw/RPoqkSbtYgDFdCYluFY/oF6ko1M91yLVfyi/jx0IefmvWxMOuxq8/D8R6mp9MIRBN+NFfAU9A1l5OyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710924695; c=relaxed/simple;
	bh=4fd1zmbuBjJCarH+myUoDkVe8GZxjxI1yQiK5tJX+FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sK9xP14xGNPNuVjuHJuL4TjqW6KzOnnv7i3zpk2forDY4AJ0d00JB8tUFHeV/FRqX7XqGDbUYEuZJhjqBHWDkJNcsmy2+EV6gRKV4/27YlkCGyZXINwYWJjbZ5p57kPFbAbZGgHWXvKW2mWwRe7iGZ0Vy/21diJBSCdTFdSK87A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MrNRFhKI; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60a0579a955so77546757b3.3
        for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1710924693; x=1711529493; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eJU0O/BFTc3zZqI0qHLQ8I7updnuUUZkqUj3e31JFso=;
        b=MrNRFhKIYxa8NThkiByC4hWNMWn2bXlDervnqKeGQliI5QcLv6jJkXmjAEPpE54qUy
         VbfTieTMHzZHhVsCclfW1hcvHh2auQM2ieqcoA/uMcTiuSXC2sLm9PScVUS0y8eYLIeG
         M6G4Cpyfx3x03MsUAAKK+sLMtSgBbkdhSccEUZ2wYzoxPg9RTLLvl/5rqEaHuyPGnZwA
         abZSzmUp/4fX2NGspHB4YR6CCQdAd+Cs3UTIlbEV9rE4XWTeINC7iCpkAlcv3KM1+1tn
         xI92Cqy/4mxSueGf4LJHX+/HqjMFr19vAkF7XJ7ySXBppO4EuH/ZUCwDm9lCSxviSppX
         hanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710924693; x=1711529493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJU0O/BFTc3zZqI0qHLQ8I7updnuUUZkqUj3e31JFso=;
        b=CPi7ilD5PoNUsm4hKc9uauSbTMyetBxY1a5WnSKL2ewHRAdPtctTQ5sU6UnDY2ecRs
         gJL6c9Mr72PdPDFbvpVnbhSX+SM1FSl9lXbnHqKLW4YGDZUkFWk9npbmCOaqDnhBxac4
         /vWxJf4aEHM7fBw4cpS7YGlwQfslcKUszVNxC+94OMcwSqJFoKnjoSru5I0FBjcKj6NX
         dSavRl+L8nn9RcFrF3ZmMARROkZvhnc1ohoskk9JR4YHRzYuYbDU3mD2WV7+fRUmKuAt
         40HGSO16CK+xNTxv4VTXqQEsuly/mEfsjg+fZLUN3N1XCYGuNcoKCstNBq+tt6YQAqRg
         FEQw==
X-Forwarded-Encrypted: i=1; AJvYcCX80KzIf1f1G7jIf6ex7B4XZoAeq4j98UDkzo9fCvDfJ/PI1HrToCreiUKUskWBKT9p+AGDDn+LOp03XRHKYOqoncDXRVm2r6odRUs=
X-Gm-Message-State: AOJu0YyTN+aznOFg+1/ntU251Ieh/CVAu5LtKFp5XcngfjDFTdA3NO5N
	pfMaeKM2eJ6jiGTle1NDEIVsIGTQchx+RvajJEl7n3rQEYP9x8d7m4mB6C0R/T8OCQDmqpvYfVb
	1HfejEhEbPiiGnKmalrmSScDVmMxUpx0KoSY7EA==
X-Google-Smtp-Source: AGHT+IFJBkbVijduDWGHvYd98RR5/rzGAinhbBufwUINaZiEA4PnEXrEkBl497e8zYOLnQ6k/jitrwdE7DPy1r79onk=
X-Received: by 2002:a0d:e657:0:b0:610:d86e:954d with SMTP id
 p84-20020a0de657000000b00610d86e954dmr5086956ywe.34.1710924692900; Wed, 20
 Mar 2024 01:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-rp1-cfe-v1-0-ac6d960ff22d@ideasonboard.com>
 <20240318-rp1-cfe-v1-2-ac6d960ff22d@ideasonboard.com> <eb854c43-1e92-4c19-bfd3-1bde94924319@linaro.org>
 <f97faeb9-8a6b-47c6-9317-daca88257802@ideasonboard.com> <30430e0e-70de-4831-97ad-974e350a2e54@ideasonboard.com>
 <5ca1d005-1beb-47ec-943a-9358ae3c6704@linaro.org> <CAEmqJPp7uGYe993L+ujth2mfRy66s8-S9FNxPY7vwkrboDq9yg@mail.gmail.com>
 <89d459dd-cc8c-4780-a56a-809e24343e69@linaro.org> <CAEmqJPrLP3j37Kcj0mX23x00p=gWuxZPNSUTRGNkcEqsUJ2MjQ@mail.gmail.com>
 <9d238cd6-0e11-4775-bc00-7df50f0a6638@linaro.org> <CAEmqJPoVFRUBRnuvRaeWg6vxDaNMzdFzgj2_Gi5bxh5nacdmDw@mail.gmail.com>
 <0401eb0f-0172-4371-9a16-f51b6b885b55@ideasonboard.com> <CAEmqJPohq1Y11uwBWdGGX3B1vPLEK9_A7OQC=-k+bHcdk3n=mQ@mail.gmail.com>
 <b95fb19d-1c22-45b2-8b87-78e56d17ae8e@ideasonboard.com>
In-Reply-To: <b95fb19d-1c22-45b2-8b87-78e56d17ae8e@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Wed, 20 Mar 2024 08:50:56 +0000
Message-ID: <CAEmqJPoBA4PrbvoGHtiah1B=C7WO+MODUUY0qr0ZdF2eWEB3TA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: media: Add bindings for raspberrypi,rp1-cfe
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 17:05, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 19/03/2024 17:32, Naushir Patuck wrote:
> > On Tue, 19 Mar 2024 at 14:03, Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >>
> >> On 19/03/2024 15:05, Naushir Patuck wrote:
> >>> On Tue, 19 Mar 2024 at 13:02, Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 19/03/2024 13:57, Naushir Patuck wrote:
> >>>>>>>>
> >>>>>>>> See writing bindings. Compatibles should be SoC specific. In some cases
> >>>>>>>> generic fallbacks make sense, in some note. But don't just choose
> >>>>>>>> "generic fallback" because you want. Provide rationale.
> >>>>>>>
> >>>>>>> If the compatible is SoC specific, I suppose "raspberrypi,rp1-cfe"
> >>>>>>> would be the correct string.
> >>>>>>
> >>>>>> Sure, but then please think what if rp1 is on Rpi6, called exactly the
> >>>>>> same (rp1), with some minor differences? Could it be?
> >>>>>
> >>>>> Yes, this is definitely possible.  In such cases, I would expect the
> >>>>> hardware to have a version register that would be queried by the
> >>>>> driver to adjust for minor differences, and the compatible string
> >>>>> remains the same.  Does that seem reasonable?
> >>>>
> >>>> The "would expect" is concerning. The register(s) must be there already,
> >>>> with proper value.
> >>>>
> >>>
> >>> A version register already exists in the current hardware, so we will
> >>> update it to identify future hardware revisions.
> >>
> >> But that's a version register for the FE block, not for the whole
> >> module, right? Are you suggesting that you'll make sure the FE version
> >> will be changed every time anything in the bigger CFE block is changed,
> >> and thus the FE version would also reflect the whole CFE version?
> >
> > Yes, we will update the FE versioning when either CSI2 / FE blocks are updated.
> >
> >>
> >> Can there be versions without the FE block, with just the CSI-2 parts?
> >
> > There is no version register just in the CSI2 block in isolation, so
> > this is not possible.
>
> I meant could there be a future RPx with only the CSI-2 parts on it, no
> FE? In which case we would not have any register for the version. But
> then, that would be a rather big change, so a different compatible
> string would be in order.
>
> So, while it's not exactly a perfect version register, I think it will
> work fine, assuming the HW people will actually increase the version
> also for changes outside FE.
>
> >>
> >> Also, I'm still wondering about the RP1 part there in the compatible
> >> string. Is it necessary? The CFE is located in the RP1 co-processor, but
> >> is that relevant?
> >>
> >> Is there a versioning for the whole RP1 chip? Maybe it's going to the
> >> wrong direction if we use the board/SoC for this compatible name, as
> >> it's actually the RP1 where the CFE is located in, not the SoC.
> >>
> >
> > I don't really know the conversion required to answer this one.
> > Logically CFE is on RP1, so it makes sense to me to have "rp1" in the
> > string, but I will follow the judgment of the maintainers.
>
> Well, my thinking here was that if we have a register from which to read
> the version, and Raspberry Pi would create a new co-processor, RP2, with
> the same CFE. Would we then have "raspberrypi,rp1-cfe" and
> "raspberrypi,rp2-cfe", even if there are no changes? Or would a plain
> "raspberrypi,cfe" do for both?
>
> In other words, if we don't need the "rp1" for versioning purposes,
> should it then be dropped?

I agree with the above, you've convinced me that "raspberrypi,cfe"
might be the more appropriate string, or a convincing argument for
that to be a fallback string.

Naush

>
> On the other hand, maybe it is safer to just keep the "rp1" there anyway...
>
>   Tomi
>

