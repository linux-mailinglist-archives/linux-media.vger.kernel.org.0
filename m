Return-Path: <linux-media+bounces-20610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7629B6E63
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 22:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D33FCB211B2
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 21:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6C021500E;
	Wed, 30 Oct 2024 21:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhaxK59A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF4120E31C;
	Wed, 30 Oct 2024 21:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730322427; cv=none; b=TEfUfxdFlFa/114PySXllj89WIW9m0/KlnGyqmSdleiO7zle9wRjMH3McTvysgT+vuUwvLyoObZPxUaQOz+JlfMs5RgG9bMuDHh2ZW3Ahiv+OX0QGvAXMH8/NwqGStzpFQPBeEHglBTcPrIsggHAMkzM6Kq9sAgUG081+gbPflg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730322427; c=relaxed/simple;
	bh=eSQq1qchd0T6J0SF3pXHyDhEE1tGbRiS7s/DtBWP/wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvCOOUwHjwsKgIKrDqD3UQcfoMEpd5M+gg0Wx4pW/wY2/6HHZE8s7KcXDb19jIHoUdvH1hMGa7uE1pYzY6z7cVBxaFdeQUUb4zkNC0KT5MqvpTu4bLa65BQRS5CdV/xnLBtQWJO4CqOzNf+O/Z3OnnD7YGDysmJC8PN4hHlYXRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhaxK59A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FD7C4CED4;
	Wed, 30 Oct 2024 21:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730322426;
	bh=eSQq1qchd0T6J0SF3pXHyDhEE1tGbRiS7s/DtBWP/wY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dhaxK59AhxUWSGE0qVqR48afMXgNELz0vVSpjGR4GGVZehhyR5hk715A+VP3KTjp7
	 3o6AVCn1Qzv9JVgasdAkgqHmapy4Jy6S7jaZgh6BP9YRV6wPbQfFEhQMH56eRdW3hg
	 Sn7UKbr0AT+r4iXufB5GzkatzRjPt1QcIX3prWrffX24i24m7ZM272aTFKoXDlEzIW
	 CxMCscPM7W3tLVKcevPinFv5EBUDPSTbB9ebX0cZQfXYChhtMtMMTEno1xG3qxWT0Q
	 jAkWBRSk15ZUpOy+iknj13JUwiczhKCCZ7FvI6pnMrrlNdT+WaSjjd5h/tvzh/8FoY
	 S2v3Wi/YNUusQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e3f35268so348240e87.3;
        Wed, 30 Oct 2024 14:07:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOS3LM9i+cPlxxC0/m94Itbg/emD60TDGVVlOYPmxMU0j3q/7NnyAtjRV36QNUFUFeoxonDGGCmTUO@vger.kernel.org, AJvYcCUeBRsz0diR/s0i4O1Z56QKpFr/q29UzgAa+rqPAyS/bclMWFT4jJEB2ZLhsk9UgawDIyilgPxptnBZ@vger.kernel.org, AJvYcCUh5Go6UYxuW1MgIIAB870n1WZ1fU4Y1Z0bcMZdvfZn+CUaQbdF2X6oK+zUP0txRYaJ9wY/HtafUR5PC4M=@vger.kernel.org, AJvYcCUklqXzPjhTrifcYwoX4TVqyrjVHew+aO8UO+OjYQwKsnMtL9cVPSy9lGr6ShZjfSdwtMaHE5A5msFT9+brmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/u1msdA/hwHfYBlWPYcCkfRIFjwu7EgwIYHKtNU1OwGALwIli
	zsVPAmp1kfqgzTryb1/xdDZdfF6ud5X4jJvUCny/3DnTSHq1asbiKLokyRSwFnYLqNKxe83JFEt
	CS08PevjqwN5pqflYt+wWL/sAHw==
X-Google-Smtp-Source: AGHT+IElbE1waZq4jbLbcYT0FxbyU1JsFHf8saya3+ecSWebGEuEuDKE6Vo1Pyz/h0NPpt6XIuuCxB7ZorOOyqFcGRs=
X-Received: by 2002:a05:6512:401a:b0:52b:de5b:1b30 with SMTP id
 2adb3069b0e04-53b3491cb17mr7922635e87.44.1730322424999; Wed, 30 Oct 2024
 14:07:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com> <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
 <a230de8f-a11d-41c1-9bc6-7e06e850b51d@linaro.org> <20241011144129.GA2295617-robh@kernel.org>
 <ca89bbae-193b-4636-b1a6-ff0c9cecae58@linaro.org>
In-Reply-To: <ca89bbae-193b-4636-b1a6-ff0c9cecae58@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 30 Oct 2024 16:06:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKwaT4q-VHqfLXAabdGtKvRtnh7SFiELpyXDGVRRpOoYQ@mail.gmail.com>
Message-ID: <CAL_JsqKwaT4q-VHqfLXAabdGtKvRtnh7SFiELpyXDGVRRpOoYQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Richard Acayan <mailingradian@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 9:20=E2=80=AFAM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Rob.
>
> On 10/11/24 17:41, Rob Herring wrote:
> > On Fri, Oct 11, 2024 at 09:31:06AM +0100, Bryan O'Donoghue wrote:
> >> On 11/10/2024 08:14, Vladimir Zapolskiy wrote:
> >>>
> >>> Two most recently added CAMSS IP descriptions (qcom,sm8250-camss.yaml=
 and
> >>> qcom,sc8280xp-camss.yaml) do implement sorting by reg values, I belie=
ve
> >>> from now on
> >>> it should be assumed that all subsequently added CAMSS IP description=
s
> >>> to follow
> >>> the same established policy.
> >>
> >> My preference is sort by address not sort by name =3D> we sort the dev=
ice
> >> nodes themselves by address so it seems more consistent to sort by add=
ress
> >> inside of the devices too.
> >
> > Strictly speaking, the values of addresses are unknown to the binding,
> > so you can't sort by address. However, if something is truly a single
> > block, then the offsets are probably fixed in order by offset makes
> > sense. But when a block is changed, any rule on sorting may go out
> > the window since we add new regions on the end.
>
> Exactly, and this is an argument why the sorting is a subject to a device
> driver policy, kind of any sorting order is equally bad. Sorting 'reg'
> values by addresses helps to avoid a notorious problem with unit addresse=
s.

What notorious problem?

>
> > This one in particular I have to wonder why csiphy is not a separate
> > node.
>
> There were dicussions about it in the past, and kind of enforced outcome =
of
> the discussions is to keep all CAMSS IP components together under one hug=
e
> plain device tree node. I personally dislike this approach, but obedience
> is the way to get things merged.

Who are you saying would be in the way to get things merged? DT
maintainers? I feel certain I would have pushed for separate blocks,
but I'll defer to people that know the h/w. I can't learn the details
of everyone's h/w. If they get it wrong, it's their problem not mine.

> >> Which means sorting reg by address and irq too.
> >
> > IRQs make little sense to sort IMO.
>
> For all non-reg properties with a present *-names property the sorting
> order should be done by *-names property. Only 'reg' is very special.

No. If you had 'main' and 'error', I'd put 'main' first. If they are
somewhat equal (e.g. rx, tx), then sure, sort them however you like
(assuming no existing binding). The only real rules here are how new
entries should be added (on the end). Otherwise, there is no policy.

Rob

