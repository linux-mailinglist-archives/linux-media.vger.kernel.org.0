Return-Path: <linux-media+bounces-7321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 932BD8800C3
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 16:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 219051F25501
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 15:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DF8657D1;
	Tue, 19 Mar 2024 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cwE2LFFu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980DD1F608
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710862402; cv=none; b=m8J5uYnoONQS3/lywJK8tM3Fxse10vasplFtHWTQ9r2fCdnWhJT3tGH2KLKFVHlxCpaHvZNY73T2aPX6IWMy7cmNnYIezYCtg111uwHapOqBv/MH9s0sR2d80j7KNRqbxqAqAD/wBZ+eIlJlob5rb2+U/nWsI8s9f9gr+gMhZ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710862402; c=relaxed/simple;
	bh=ffYzVDG9o2d4Inux2RMjI5RcJfyUEQNu+VWdtawt5Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFlP1SIudVdnMDrYO9gd3tioRmUxVbJbME1WSfnISSM3fzRpYtF2uEIgkpIsT941dOHxisNhor5o1C9+ams1LX/uY6VxRKRkA7GR13x+bSdFJop4g77HDfA0a+kI5QQTOLaI84QtX2VgUY7iWSIpjPzgzqepMSd4pE7cqP/mzAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=cwE2LFFu; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so6174184276.0
        for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1710862399; x=1711467199; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/qkT1BSLXtm7Ui9psZT6c58sokU5nKf8DvB6owS3uMM=;
        b=cwE2LFFuXNvZ5QL1hq1A7VcvwJ6/wX37CkQYjqd6rL9hsbDattRnkHPNbS9P9KY5AL
         UGxR+fm9vUyOIPTL6JfF2qbVSlwfd04o6PxyJ/v+Lq3fAsoYTT1wfknk5u1YjCvoZDYE
         2IJxeTgPuFAQ+VGN9qxurhPltLAVTqgP2K7Mo11qh/BcDIgBdVaINqk/T/3rXOB3YDyf
         suhvJf2h+WoCoDoTMa4JB689lkgUYbypG3Hq3K8yGjf/H8yEkWTFhBZflVWdN6FZHrJ9
         EvFh7x7o/fPp2Jz+ze+ck3rTjNnXjvioOPIPn6QVHbyCevYSAaB84S59knj8harDSF7V
         bEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710862399; x=1711467199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qkT1BSLXtm7Ui9psZT6c58sokU5nKf8DvB6owS3uMM=;
        b=UwKzqAXjCd7LUuUUI6fD5FQWaTG97mJvyLTPsQZ0DLKXQSJVpYhx4mGPNC5RbHl/zt
         7rj5DWUnjDaDiEypjW4lstf0jvIKSLoAf/YcsHPmGZzX35kfkQJ2L1JZpw7PozmlhK8N
         yGk863RTVMKqIHoawKYWIa2vrDixK0W+awoCMd3U41Jug0uZ3eR/Cxe7F/cOIyr9o+f5
         BRb8/8luizfxR/OXNfke7q+sgEBhA0YkiYmREHwREjjbpDMMaZLQ3phykC7CtV/fpdHl
         AAKvyQ+MKzO21aMhuKUgK7+YeBdPOsODmfK1LUYXoTxh5RSlnsE3vyZRyuEOR8IMnXtG
         hWVA==
X-Forwarded-Encrypted: i=1; AJvYcCXB+w3bAVtMEBHUz6Ha7Z9TLrEK59Oh1K9/uib8hWJz8Gs8ccW2pZz+/R5J6CvUwZuY4bD2xy69UptApIrOgvmana0bwnZHPB5gyTw=
X-Gm-Message-State: AOJu0YzwycNyY5b04546v+D2l3ERJGq9Qd8zG/AD2Pq1vekuB135qxQu
	krup8/pL3viIjTAa156oa5vmSAX4sO7cIZAHr+Lczk+z1chaRkZF22ef98lBb+awl0j+YLggRKn
	aEhec615p54Kyym2orsqSrZI0eQDMq0VuRVLaLw==
X-Google-Smtp-Source: AGHT+IGdsKwjo27jf/mVHnJeZ38jf8S7PnKqAA6w6OF0EEszHnFiWyU5Y8GmCdeA8p3QsQboCoxoqiYTvaDFu7apWRU=
X-Received: by 2002:a25:848c:0:b0:dcf:9aeb:73af with SMTP id
 v12-20020a25848c000000b00dcf9aeb73afmr1701785ybk.2.1710862399689; Tue, 19 Mar
 2024 08:33:19 -0700 (PDT)
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
 <0401eb0f-0172-4371-9a16-f51b6b885b55@ideasonboard.com>
In-Reply-To: <0401eb0f-0172-4371-9a16-f51b6b885b55@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Tue, 19 Mar 2024 15:32:43 +0000
Message-ID: <CAEmqJPohq1Y11uwBWdGGX3B1vPLEK9_A7OQC=-k+bHcdk3n=mQ@mail.gmail.com>
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

On Tue, 19 Mar 2024 at 14:03, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 19/03/2024 15:05, Naushir Patuck wrote:
> > On Tue, 19 Mar 2024 at 13:02, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 19/03/2024 13:57, Naushir Patuck wrote:
> >>>>>>
> >>>>>> See writing bindings. Compatibles should be SoC specific. In some cases
> >>>>>> generic fallbacks make sense, in some note. But don't just choose
> >>>>>> "generic fallback" because you want. Provide rationale.
> >>>>>
> >>>>> If the compatible is SoC specific, I suppose "raspberrypi,rp1-cfe"
> >>>>> would be the correct string.
> >>>>
> >>>> Sure, but then please think what if rp1 is on Rpi6, called exactly the
> >>>> same (rp1), with some minor differences? Could it be?
> >>>
> >>> Yes, this is definitely possible.  In such cases, I would expect the
> >>> hardware to have a version register that would be queried by the
> >>> driver to adjust for minor differences, and the compatible string
> >>> remains the same.  Does that seem reasonable?
> >>
> >> The "would expect" is concerning. The register(s) must be there already,
> >> with proper value.
> >>
> >
> > A version register already exists in the current hardware, so we will
> > update it to identify future hardware revisions.
>
> But that's a version register for the FE block, not for the whole
> module, right? Are you suggesting that you'll make sure the FE version
> will be changed every time anything in the bigger CFE block is changed,
> and thus the FE version would also reflect the whole CFE version?

Yes, we will update the FE versioning when either CSI2 / FE blocks are updated.

>
> Can there be versions without the FE block, with just the CSI-2 parts?

There is no version register just in the CSI2 block in isolation, so
this is not possible.

>
> Also, I'm still wondering about the RP1 part there in the compatible
> string. Is it necessary? The CFE is located in the RP1 co-processor, but
> is that relevant?
>
> Is there a versioning for the whole RP1 chip? Maybe it's going to the
> wrong direction if we use the board/SoC for this compatible name, as
> it's actually the RP1 where the CFE is located in, not the SoC.
>

I don't really know the conversion required to answer this one.
Logically CFE is on RP1, so it makes sense to me to have "rp1" in the
string, but I will follow the judgment of the maintainers.

Regards,
Naush

