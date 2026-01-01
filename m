Return-Path: <linux-media+bounces-49811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A74C7CECB95
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 02:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD6A23009F6E
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 01:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2012580D7;
	Thu,  1 Jan 2026 01:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIIzPNN9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D7E257843
	for <linux-media@vger.kernel.org>; Thu,  1 Jan 2026 01:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767229896; cv=none; b=FEQr8JIwN2O5n/jSssS/1LYqp1dkO7zZgnbWsV4Hkl4/Poiu1VDqJ+ScFJPkm8QnAfzej3XpA1V9/RSaPopdtwQ2lkBQJ3e9X3lR+cYChF48PRcqsIn+1bqWqjsEis8EVV1340fsbAmd7oE47TOwMZkW6V3trCfmXUvH+e+1g1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767229896; c=relaxed/simple;
	bh=wrvBn2Cb5pEJaS2QGL5+vX9AkK1kpGmBRXKoJSlKo70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkLFfBQZBG70TfQ2miOTFJzNFBi0qp91R99u7Y2P92ea5LB8vamGLXqfM2r9DkzKTjDZvlfIqc+WJyiNP6cdtOfwg780D4d8GafcYLybC85RDjFCXANlAZdK3YjoaqaND4OHSXxU36oGHuBoFvyTJFlKDu7Vukzfnftvk3DpcfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIIzPNN9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0c20ee83dso142803585ad.2
        for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 17:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767229891; x=1767834691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrvBn2Cb5pEJaS2QGL5+vX9AkK1kpGmBRXKoJSlKo70=;
        b=UIIzPNN9uA82NpjzgnMRd3IhP+039Z9XcWq2uNA2KUexXxNvsYWGiDiK7/xhdf7ted
         YyikrD3b6H2NjOcde44iU+pPDhY91FOdjCN508Oe4svQLC67AH+iaE5W0J3HpxVR9MQM
         VcXDakD20IdZAAC/l5Qj5GsjMt8dnmg2rxt09IDt5I+OoNXqiWd3blZT43SFNJ+6W2Ba
         7Sc/BLLfJO1BGTiNXZD7RKlx8fQ1Dz8OX+GW/kPNvZEPAxckV92l43gip7F0cyLxQo5L
         9n+fQBcoZs7DcBdxwS+E21uiAl+ZHLrQ6z7C8Nh9wqvtXHK2lssWvxZf4pue+qnpEWty
         qevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767229891; x=1767834691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wrvBn2Cb5pEJaS2QGL5+vX9AkK1kpGmBRXKoJSlKo70=;
        b=dWq/RLW8Hs9CR7Bw08MliT2tCkx2X3xZBIUBuS46xormBxyXgZWvgp/5vboGRuOWUI
         BV5w8RE73Vl6x9gugUzWHQPqEb5DhJpqAs43hv3AgVUumbIR+17/n9vwYI25ugduXZ5J
         iKv6T1GYIx9NqvE4r5deRrbS/NuVpbpIBVxln2bPw8BmKLaZ1QAFPD7Dnrdvq+rryJqd
         y2uynHsGoteMWu88cdEjUGmNpUe+1Py5hujx/QgfkHGNgLjBgfF1DsAr2puEbbP5CGiO
         0iy1CIjqGc+0JRpjtMC6TSCvnROZGXxsSB3ZzG9IXP7snVEbZI3e8GQztEnRAQg9p5pu
         kVEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDoXUKEm/7Rjx0r3OzU2JtWi6XRQBcEiZMgkDBNww1P1nW/Fez4rwhn1rDJGhZROKQZoTXKfK6/icaXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwl7Q9PGH0Encj+pPoSQd4i6OLyRvrPLsC1c8iPeoGuYbs6FJF
	Oq10933RoQgKEdQ7IdELxXLulFWkgmPR5CcVuW0gw5PRgVOrWSYvaFzwZYQdGn+fBQA+s103Oa9
	YJ/Bt1AkXugscUCdk9NetgooFI9U/xTA=
X-Gm-Gg: AY/fxX7obE1PP1RVu6KnJHii7Q/iP6R5MNDSbEPW3Z2gSWRr7bCigxs1ed0FZpEznlE
	e8fG4NbdEnxlnrIAf6Z/LFpyi3nGiWC4J+4rfQGhDlCwsXr/sejZAbrRtxfODHvJo2EGUGpSJOl
	b2VJnevPJvNv1oPbntnZCqoJUBwamNRT8qgxM+KUiYmTIWkgd0hnRDnbdoBTsDbsTzUBPkjh/c5
	fQWJpef1/wPi57YV56+TCJvheXcDNaZ6pDCxHIQeyvyzqVtiny2kZ83NQ+GlzMmu31YkMsoTZiS
	grZoW/Di/msF6S/g9evDav3gphTgFg==
X-Google-Smtp-Source: AGHT+IFgbETw4WCz4lGizZ9ORGlqq7N2Kr3YhqcRtu3OuwQnaBq43l6T1GmZ8vUU5wK0JhXYukueCyBkpsZLNW96jUU=
X-Received: by 2002:a17:902:ccc3:b0:2a0:97d2:a25d with SMTP id
 d9443c01a7336-2a2f2426c84mr428613015ad.15.1767229890772; Wed, 31 Dec 2025
 17:11:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120084926.18620-1-opensource206@gmail.com>
 <832f4621-53af-465a-a5e9-f7d65a082481@linuxfoundation.org>
 <CAKPKb8-qyqMmp6c9OnO+AapRRJyE8ygtQUyuUqK8+C0LvMTYTg@mail.gmail.com>
 <CAKPKb8-8ctSewOwBk7fFUMVnb-F_gXnyXS8gd9xJ-fpnW1_ZYA@mail.gmail.com>
 <b5240bd1-eee7-47fd-be70-88435519b12a@linuxfoundation.org>
 <CAKPKb8-VW3C8c-BmwLEWdLXZ8LVuH_MDMdVzzFs6O8QWmpDeuA@mail.gmail.com>
 <CAKPKb8_PGYUStAovWjWG8XxabjB5WuT7kQ3qxT3NuYSKihgDDA@mail.gmail.com> <754a344f-4759-4b94-aae5-41e1ce6b7e2f@linuxfoundation.org>
In-Reply-To: <754a344f-4759-4b94-aae5-41e1ce6b7e2f@linuxfoundation.org>
From: opensource india <opensource206@gmail.com>
Date: Thu, 1 Jan 2026 06:41:20 +0530
X-Gm-Features: AQt7F2qn5Q1Y1T0v2QCHNtguTKYcfhhMzppO98TepVpzw2ByhbW6va1IU_mK19M
Message-ID: <CAKPKb8-hd72r2-11xo6EaN33FfAZ7KFLt59kiwE8UCQKgW+z4Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: vimc: add RGB/YUV input entity and improve
 pipeline support
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: kieran.bingham@ideasonboard.com, mchehab@kernel.org, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuah

On Thu, Jan 1, 2026 at 2:13=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.or=
g> wrote:
>
> On 12/29/25 09:04, opensource india wrote:
> > Hi Shuah,
> >
> > On Tue, Dec 16, 2025 at 8:27=E2=80=AFAM opensource india
> > <opensource206@gmail.com> wrote:
> >>
> >> On Tue, Dec 16, 2025 at 12:40=E2=80=AFAM Shuah Khan <skhan@linuxfounda=
tion.org> wrote:
> >>
> >>>>>
> >>>>> Hi Kieran and Hans,
> >>>>> can you please review?
> >>>>
> >>>> Hi team, can someone please review?
> >>>
> >>> I will send these up in my pull request to Mauro - it might be
> >>> later in December of early January.
> >>>
> >>> thanks,
> >>> -- Shuah
> >>>
> >>
> >> Thank you so much Shuah
> >
> > able to pick my changes?
>
> I applied them to vimc branch a while back.
>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?=
h=3Dvimc
>
> thanks,
> -- Shuah
>

Thank you so much

