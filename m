Return-Path: <linux-media+bounces-14157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A65FF917B20
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 10:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7F911C24558
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 08:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BF0167DB9;
	Wed, 26 Jun 2024 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRGZL1rb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3145213B78F;
	Wed, 26 Jun 2024 08:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719391143; cv=none; b=s5LaJnsutxwKDeO9J9qfl/C7cqIVTHzCYbkqGrI3wS/KEYMX/DMquQJlbbey8cEwPHF9lQVDYVM7xe0txQcp9eoJp6biKXyy2/pGGPyQdjde3MHchmER3Jhjvc8rZX1iwHfiC4j/1n5xTr/DVYr9UmIEPBfAUzX3IcaZEfRgqbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719391143; c=relaxed/simple;
	bh=eQ7DYSWRsKYuWOqaM71snLYfv7LNhzAnFyoiCIARR44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTkP/+rB7VsZRqnn8Am+1z6vHySeX8zwudOzrNJWrOdeAr6Y1t+h1R3NlFDij0zp2Ct65SB0Z/xG3VrHuc32ulPHDRJb83H42PmjTs1swGQlx6GaoZqAvF8gEjvscXfPQcUA7jP5QVm/7el2t0nUdljTr9Nf8G6OaWvO84q3xt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRGZL1rb; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ebe0a81dc8so84903921fa.2;
        Wed, 26 Jun 2024 01:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719391140; x=1719995940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGLAE0d0WBAYFA6fR6mw4wvQZZ2LgjwEPVknt+snP7o=;
        b=PRGZL1rbAc2f+l1SmG+B/xGH9gsjKg2wtSQqFWqStPihuF3fzOu5hqvALEar1j87Ul
         gm2GzxaG1447zHVCoMUnSF3V3FB97xeQhNevmodSUQYBcqYWgMFnHPndpeEMqeG/4QqM
         kuRbtvO0Vv72jxLqGM2KegxiGuRBk+PpDyWaaeE12JS7xyPNGIdi+SPU0mgGAX6QL7qw
         nPlF4GaIq7wp0yD0ZKArzy6o2MFAbzRf/jmmCDhCg26IiMIueNR/tOIwLecJP+QAzCKw
         851z5xchiezbcIc+0QS/b539ci9so3dbZ3phl9vHW27GasEnIeZaWhew05madzKnYwYc
         Eh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719391140; x=1719995940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGLAE0d0WBAYFA6fR6mw4wvQZZ2LgjwEPVknt+snP7o=;
        b=bXf8vIW+g/TgrXbgZAJ8Q2xCD9hMcHwP3ZZXKsaT1KPe99Dh6qbAeJ36q1R+YcrIYt
         BAH/tk241HXh9IsAp74nUQ9pKAl32Q3B8hfctAA/oTa+cwAQPEDGmGQPR8uRUZHcnYD5
         4K1f1rXbGUSsp1XTmxHGwZAVroDd9kK6NOTzT/0+43bEkEXdRXMcG+YfzxcPO2rfNPBx
         Q/p1aUFs7px9gEhKGxqeCzcxNO6o0ySrokNU5tdL7rAPdueajsnyZoaVsLpwmZMTbWIW
         7KoXgKaiw6mK2BLnzddg8F3VIm5YaGYWOuq2tK1jedAgu5MaMuUUUGUSjpaTxYI1WQX/
         tr2w==
X-Forwarded-Encrypted: i=1; AJvYcCWtD9n+qpRU8LjHvuVRijwCHzcal6b/E27un+1zsscNOKUHtzAQQMo/m9Jk43dLpX4sWJ66JP/D8QpIxzMPM8MAd7WoulLSQkt2Lvs6T3fu5jqw2a8qIBkWobmEs9SGYBHHmRKceYzzxQsMAM8DiBiDpXKKv/3eUYWIO9we7Jto4AKwxbPEH+AI1k1KPPM4CU35GXfyM9C43Qf/c2eIqZkMwdViEA==
X-Gm-Message-State: AOJu0YyrBlb9Lk2DrQdWZZD0o1lsT9sd7AY9nTlYFxhNNxw1nP0vNmpg
	rJBBWsqXG1xlBZXmfYWMBjvRckchYseGW67hdU4B4yKEt7QlmUgjq9iaJvWNaZadxUdShRspgLg
	svMws8r07OrvNtCRSBWsx2KvgQ3U=
X-Google-Smtp-Source: AGHT+IFmzqdhWA4H/PFBpAsMCQ7oBjaNqKmMkRUMmk/443vBy5nciueE4td8WvvWnEiPZVl/uR6rjE5UTFEojjBaap8=
X-Received: by 2002:a2e:7a0a:0:b0:2ec:63f:fe91 with SMTP id
 38308e7fff4ca-2ec5b357921mr68729601fa.38.1719391140191; Wed, 26 Jun 2024
 01:39:00 -0700 (PDT)
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
In-Reply-To: <CADgMGSt9Hu5Ciq=ndMTaVK23Y_ixTVtTuSfy4hJkJooFH2uv9Q@mail.gmail.com>
From: george chan <gchan9527@gmail.com>
Date: Wed, 26 Jun 2024 16:38:48 +0800
Message-ID: <CADgMGSv+x2Z9FsWTHW0auttvpdfNDnOPxiJhXnUaW3yQczN_Ag@mail.gmail.com>
Subject: Re: [PATCH RFT v3 1/5] dt-bindings: media: camss: Add qcom,sc7180-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 4:17=E2=80=AFPM george chan <gchan9527@gmail.com> w=
rote:
>
> On Wed, Jun 26, 2024 at 3:15=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> > Keep the list in "required:" in the same order as the list in "properti=
es:".
>
> ok gotcha
btw, i checked  "required:" and "properties:" are aligned, both of
them are in ascending order. I am wondering if you are talking about
two things, 1st one is to align both property, and 2nd is having the
ordering like below. Plz confirm.

required:
  - compatible
  - reg
  - reg-names
  - interrupt-names
  - interrupts
  - clock-names
  - clocks
  - iommus
  - power-domains
  - power-domain-names
  - vdda-phy-supply
  - vdda-pll-supply

> > >> BTW, I asked for subject to keep only one, first "media" prefix:
> > >>         "Subject: just one media (first). "
> > >> but you kept the second "media".
> > >
> > > Sorry I can't get it. Could you choose one?
> > >
> > > _ORIGINAL_
> > > dt-bindings: media: camss: Add qcom,sc7180-camss
> >
> > No, original was different. Go back to your first posting. I asked to
> > remove one media and keep only one - the first. I did not ask to
> > re-shuffle the prefixes.
> Yes, let me sum it up
>
> v1 title is w.r.t
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240222-b4-cams=
s-sc8280xp-v6-1-0e0e6a2f8962@linaro.org/
> then extra "camss" pre-fix keyword and "binding" post-fix is not needed.
> v2 wrongly remove all prefixes and correctly removed post-fix
> v3 added correct prefix, removed redundancy "camss" prefixes but
> changelog still refer to old sc8280xp style
>
> The title now should be fine. So I will modify the changelog only.
>
> So there are 2 todo items as above. Other than above, all review items
> are addressed. Plz confirm.

