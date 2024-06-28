Return-Path: <linux-media+bounces-14363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D3A91C679
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 21:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7481F24EBA
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 19:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1AC7407D;
	Fri, 28 Jun 2024 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLP3OKRa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7AC42ABB;
	Fri, 28 Jun 2024 19:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719602184; cv=none; b=P0zy0sxAcwjQlhTCh6y21OT2ww1UewCpPs3p9o1DVJ5Qz/0j3K+MmIYT+ps6jKLKV/e/BvpAnUU+m5y/v0qmwJxnh7eFAlP6Mnb6JzwSlpyt9Xz8ryVNyrdjf8WF+JXhEwbHGCX/C1SYINvnkuFu4jORhBL/XK+XSYbzCN7sGjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719602184; c=relaxed/simple;
	bh=lE1e3q04Oaaz0cYIxpbk4qvsN5PFLOvkmeBSPKZLJYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mErGCTTqo4XAsWbPZiYTlVg3tc3kAyJVajS6+GvxSa/ztUtM1YykYHq1tJMDnw7ZZRGuRfXisJ5aIfv0zAVOC/N7sB6+54CMi7jprYipz2vfcNVJ8bfoinZoAnNXkOZ9Sj9dH5JO/mQxzM0UYNHhkmIQQ7XFtYJOIg+wz/zMxDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLP3OKRa; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec6635aa43so9364351fa.1;
        Fri, 28 Jun 2024 12:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719602181; x=1720206981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68M77nW3v8XXRFfDre+5sPrzFR3uc3r0s1ijjg1BMWE=;
        b=GLP3OKRatVKPWT7ZU7QDfnVgQgH889fg0Yq5FVzs7eVlyf2+rEEB5krG92pq6kVEbR
         ZrIr2IAjM/wOUGbQYguLusHbaFeZmm0eJFZJRqf3JMIbzIvE2U/JoTl12u+hjTOQDg9b
         tByFCroXph7vy1wkw1IKuPgWAq5q+ASWscv0fHOAuJqf0pkE9vHbsg1mjK9TL69vQGvS
         OuUK0BrETgMpSZ3DHbn5tSUlKZBO7WiQa9jBTubVyCTDnzegcWKAPZ1GNlP0DOjnq8UT
         AanTEkc6IoxBZPeffyysCo4+EcasTkBEcj4IGtTlbgDrvPmM5m3FI4hMAD8xy4yIlqo5
         tlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719602181; x=1720206981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68M77nW3v8XXRFfDre+5sPrzFR3uc3r0s1ijjg1BMWE=;
        b=HHr7zc2+2eBsjsayLS21J9xFLdjoA6soEz7/svMRexpknh1vs2ge88r3NyVGvZBpTH
         0YyvA/zApHvAygv2YO/Xy2byTOVigHpWRZ8ELHf8TSoAFwtKrfoEZL7hJgzmo3eQcCux
         cSYnd1MzfVLJX3jL1baDLCOOR2rZpZY6jeXeCsXr7uXy7Nk2SCdWpLnwlym95yh3qVl+
         t679ja/Bd21orKtMNYMH4DBRNF4vdq6tvWrOaepmCbAi+mweWdFyvVMX/PfOVys6c6T9
         C/IN7dFhVa1o/Qag9+k9q8O0AblVx6esdh+nn4NmcmJz5XRTl75uHH3jfaJjleSY1itV
         wiBw==
X-Forwarded-Encrypted: i=1; AJvYcCUKlALJtiVnweG+67cAJ1VitN5oMyNCM9Puf+/JCUh2jyuTFB09KlGbhtfCijaMcO56k1AlZ+onTUmUfxBeREYIzC9pMHPWarOvhzYDL0aWkPr4r/98wOKGpbXtQffNEDPRc3eZjCy+k2FkL43w/As1kwZFCA19ss7dhsrZe5725OqOXclUsNKPEgUZV9V5AJY9LZTADGrCNfLfassZtJS7r1jVaQ==
X-Gm-Message-State: AOJu0YxCL7qF/DSSzs63sLmXWjicLY0Z7mgjrZiePwXF/GTGTPZOwD6B
	jhlQt5SKGj6Pg44vxueUTSmu9l3uceAQqn+yGz0zflkBEszDN7xfq265ME6UYUkH1bxQ9ALyrQm
	HQEmuTraEZ3phIOOlN99GDAqNUnM=
X-Google-Smtp-Source: AGHT+IGpN8QxF3pXRib/zfzelzrYeDZIlU5+sMPA5QY5A/ATwRFJOAbsuKBykt1qnJh3PszAFmdg4YmO1wenSRed97w=
X-Received: by 2002:a2e:bc88:0:b0:2ee:4c72:204e with SMTP id
 38308e7fff4ca-2ee4c7223e0mr45904391fa.0.1719602180953; Fri, 28 Jun 2024
 12:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-1-89ece6471431@gmail.com> <c33dde93-2c3a-4a00-93ee-e4de303c9057@kernel.org>
 <CADgMGSvN=uAW7z1dpETGVRewzDG=K2MAtzOkhK7xAcskU_oeZg@mail.gmail.com>
 <0a35f0bd-ceec-487f-b9fd-ae9698b74048@kernel.org> <CADgMGSt9Hu5Ciq=ndMTaVK23Y_ixTVtTuSfy4hJkJooFH2uv9Q@mail.gmail.com>
 <CADgMGSv+x2Z9FsWTHW0auttvpdfNDnOPxiJhXnUaW3yQczN_Ag@mail.gmail.com>
 <a7306019-9f19-4619-875f-e6b71add5607@kernel.org> <CADgMGStvxkaj_LxXLuwEUtm5dPT-MCr6aKp_DKZngHsRPTjmng@mail.gmail.com>
 <7ea5890e-5c74-447c-903c-9d3e9aabb7e4@linaro.org>
In-Reply-To: <7ea5890e-5c74-447c-903c-9d3e9aabb7e4@linaro.org>
From: george chan <gchan9527@gmail.com>
Date: Sat, 29 Jun 2024 03:16:09 +0800
Message-ID: <CADgMGSvyCBAYex7CsxhdayLk7moSOj7g9MrJLvREKAsmm0-CNg@mail.gmail.com>
Subject: Re: [PATCH RFT v3 1/5] dt-bindings: media: camss: Add qcom,sc7180-camss
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 11:40=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 26/06/2024 10:04, george chan wrote:
> > On Wed, Jun 26, 2024 at 4:58=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 26/06/2024 10:38, george chan wrote:
> >>> On Wed, Jun 26, 2024 at 4:17=E2=80=AFPM george chan <gchan9527@gmail.=
com> wrote:
> >>>>
> >>>> On Wed, Jun 26, 2024 at 3:15=E2=80=AFPM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> >>>>> Keep the list in "required:" in the same order as the list in "prop=
erties:".
> >>>>
> >>>> ok gotcha
> >>> btw, i checked  "required:" and "properties:" are aligned, both of
> >>
> >> No, they are not.
> >>
> >> Which is the first entry in "properties"?
> >>
> >> Which is the first entry in "required"?
> >>
> >> Please stop wasting reviewers time by disagreeing on every little piec=
e
> >> of this. The feedback was quite clear but somehow you do not read it a=
nd
> >> respond with some inaccurate statements.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> >
> > Then my apology. I might take a break here. Appreciated if some
> > developer is willing to take over it too.
>
> George are you resending this with Krzysztof's comments addressed ?
>
> I'm trying to figure out what we are targeting for merge.
>
> ---
> bod

Since my phone is EOL, I can't test new patches so I can only give up
from here. My suggestion is to drop this atm and let sc7280 patches
get in early.

