Return-Path: <linux-media+bounces-14145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C71B917857
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 07:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D9BB1C21DF4
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 05:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFFD14A61B;
	Wed, 26 Jun 2024 05:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gowTIA0W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D1714B957;
	Wed, 26 Jun 2024 05:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719380999; cv=none; b=eUbriafvv85cX0Ni98UUlkXmZKKvGb89bDVYUQnKMVbROVGdg5xviRltgLNoIhL/mSCOf0JeOZxVy/9pZgwl6WaokYmM21bVfn6o4LjvrP8SRr0vR9PtMtYtpwOBsLNXeKLbUs+2wnPsAv5NYdPFWyW11vefY6SsUx1yqSZ7W6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719380999; c=relaxed/simple;
	bh=v5K9W0GO9PpzxtYq7caERQlS2z7z7pdua1mzI8qQKIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/lMmE4ukCqZrBgMnLT0+5C6plcSCcZg4vWEMGGwqIGvE3NzvmItlB3WSc0BknhkbEsBq5557wcYXja0DAKWyTHphoRvVEXArSvPlgDeOpJ4gg/T086wksVGEJYlYWt2vqKaVMhs33HRoXBFZOBVF/+vpAffg8oxzPzlscsw5gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gowTIA0W; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec50a5e230so46345271fa.0;
        Tue, 25 Jun 2024 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719380996; x=1719985796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5K9W0GO9PpzxtYq7caERQlS2z7z7pdua1mzI8qQKIg=;
        b=gowTIA0WVyMYoRD4Lndnyyfwe1yyPFnQ5xMqu856aE5cUzDskO84Ib2EMrYmpoFV4+
         nlGNIMP6wHs4X1teK9AJ/Qm4nQIyRxQ8Eds5/hEFaawM0AjwFBs5Kvg0pOxCFS2rVRya
         CUPsBBobIve8i0Yos++CWCWIbYIUPJoVjVs0ze1mj8H8ErumqKZowy9xIzYQstOxitLO
         VxdVuGtvoFAyEf49uOYLeOs3eFYHhq4P1b4shPb6lmg9UJe6z9XEZDbKqyWNVrQF28L1
         uLS5rA4kmhA+qvkU+VEbtCHOFBYFC9ydh61u+uOZyr6N6SUqTu7ig+K5OC2XM1pgzvG4
         hspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719380996; x=1719985796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5K9W0GO9PpzxtYq7caERQlS2z7z7pdua1mzI8qQKIg=;
        b=FHQlQItxBDFwThmb4EZdMnbcTCfiv9VPeqY380Go7Gxw8fqzNw9szxFmtqPFzFI2Nv
         MNZNzyFyIQBtJCf+bduTuqSe4/6fb/mB1t2pm4Oa2S1xIPQCrfXeO7ddHiMYdpKvy//f
         +A39fnhy+ruvGArYJPJ1kPL0CZg+AWbzbVmFaLJtEfO6TyKmHhIfS2J6fR6g7rNsRoRg
         h6EjxLPH6j8C36ExuEJCZDV8zrzFgrE+6bgov8/qCvQLUrhmyVzLkaDq7K0c2GQ+8XLs
         Qfm5c96QNmvcM5hsoiA3SKlf+cvfXph15r8/vD9WhTAIg3q8XuDGdNCSZXJ2WgH4RbQ2
         Xo2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSTc2TwOdRLl/mwdnJ1KIf8ltpjFFFMw0AYFonjp79hTa0VoH/mPulNzGkrrNoFvpdb9lko/9h7AtAz89EHUjQ/9sX+4pBdUZRxAnvA7e4pg5z6WUtVGikw3B6uBf8dAHjynK8U+N4oooceAWl1ME2m1I2ADToSe6KZ4uibapxypHcIwkiCzSB0VjlojfH7RNH8/1j0feAhRS6sUwJ+lhvnC+yNw==
X-Gm-Message-State: AOJu0YycfRzdUzJnDBI/yBb+2WGLhzywnL/GOrorFa0RHhE3GQhuL7sl
	vZZpD5zjQomUuBZVf9JV1W9i8ayB4oiTDd1TLRUA7nmSReAK6Dq7Qg1cC0TVCQoyv28VyxqDbdL
	5uKuNp7BHTyE85SD3EjtOMliU7bl0wx/m
X-Google-Smtp-Source: AGHT+IHqPmoNHc/D6CitRQRrrwA72PsfsO3G0YCKPJaaFQm8Pb0gFDwLXSmWJ6pDvgH5ty5s6ZH5XOcaJ8l9Q9r4Q+A=
X-Received: by 2002:a05:651c:158:b0:2ec:55b5:ed51 with SMTP id
 38308e7fff4ca-2ec5b269428mr53995721fa.9.1719380995389; Tue, 25 Jun 2024
 22:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <4d2f4a52-826e-44be-b242-55b50708692d@linaro.org> <CADgMGSt2sRecrrYrG3t4RtgGn8QJzr1N+iRSWFKQVPgA6Pk8tw@mail.gmail.com>
 <a06505c7-fd8e-4135-94d3-d05d9b4dc90d@linaro.org> <74215bff-933b-4d11-be2f-c1d5b5788f9e@linaro.org>
In-Reply-To: <74215bff-933b-4d11-be2f-c1d5b5788f9e@linaro.org>
From: george chan <gchan9527@gmail.com>
Date: Wed, 26 Jun 2024 13:49:42 +0800
Message-ID: <CADgMGStpV1XZCKavw8pgW+ReTCaDZ+_52367HvWOGHLPfb0pYw@mail.gmail.com>
Subject: Re: [PATCH RFT v3 0/5] Add sc7180 camss subsys support
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 7:44=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 25/06/2024 17:57, Konrad Dybcio wrote:
> > On 24.06.2024 5:03 PM, george chan wrote:
> >> On Mon, Jun 24, 2024 at 9:50=E2=80=AFPM Bryan O'Donoghue
> >> <bryan.odonoghue@linaro.org> wrote:
> >>>
> >>> On 24/06/2024 13:13, George Chan via B4 Relay wrote:
> >>>> - Add RFT tag to all patches, since no tested-by at all.
> >>>
> >>> Have you not tested this updated series ?
> >>>
> >>> ---
> >>> bod
> >>
> >> Do you wanna add my tested-by too? It just feels weird to add my
> >> tested-by that way.
> >
> > "RFT" means "I didn't actually test this" or "please provide more testi=
ng",
> > not "there have not been tested-by's from others"
> >
> > Konrad
>
> Exactly, RFT says to me "someone else needs to add testing here".
>

gotcha.

> In your next drop with the changes and RBs please drop RFT - unless you
> want someone else to test it for you.
>

If the test result on sm7125 is convincing then I have no problem.

> I don't think that's required right now since the set seems
> straight-forward enough and TBH the bit of 7180 hardware I have sits in
> a box unopened and will likely stay that way for the next few months at
> least.
>
> I think your example video is proof enough the thing works ;)
Nice to hear.
>
> ---
> bod

