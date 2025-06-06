Return-Path: <linux-media+bounces-34229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BC0AD0191
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 13:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B21A2189D0CE
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B75288504;
	Fri,  6 Jun 2025 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUbkvwqP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC762874FA;
	Fri,  6 Jun 2025 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211179; cv=none; b=HDhQ7sNB4BYrqsrNiuhIaZCZRABsmcogTylB2P26hY0WTgn1nF5KvjS0moklGnzCj4RqIpA9OEothlJoi2j6jnNhY8jatt1Az4SMpfe0JaPYj3bDJo27rsZqGiNutYefj70hUDH3cmE8+r2K4iLW9F3dPuwmom3h+p4NSGj623w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211179; c=relaxed/simple;
	bh=fLyP1nJgU2iKVNH8e+jPqTnC6CYKC0rB5Q0uu/GtYng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIkAC5nMW1/bCGyM8IqKasPCipEjUQ9D+7nDYAdY0+UMweWZU2Vmp+oCLhgUBSTh6qDNTc/oz0RiuLdzbFGCXA7Uyb4bKWMFelj5P7vSm5XVzZIhqms+JwdqzxlImcIKF9tmwB6ZGqxPPGAGQmaYcLwSvs3hUUNI1uIfBtYV+Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUbkvwqP; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32a61af11ffso21451481fa.1;
        Fri, 06 Jun 2025 04:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749211176; x=1749815976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RBKB3/9EuqkeSqFD8CRon1Zsx+X5s6ybMaqEFvORUg=;
        b=DUbkvwqPoAd2yKYqVb/Wnsr7MPFB04HpOePGZ3CRkL7OLVXULU7CCbx9nIT0t1MG2R
         mOABZBAqSHoZOt/Q9308/123W04+2Msgzpe8j6n2eq/RE4AzrKgW+0CjPOWa9V7fRr2g
         7uPuLnPiYwBy9D+XKzIWsyBvAQhtbqlSyOOkIU+JTsPKjX2Nj9cBg6HjWaepgIyt8h9F
         n7qeluF2TKhJUPFhDvAjz50CZGjZp6sKz/a0hLxRBhbgrMuzbGQxdaCXRzKoB7e0KoGp
         BclMrp/BZSmfmgkKegw2+9wWv2ohF9yHMfnnAO/fDV6avPMWSt6J9dLa3eW3BtpXjf8z
         Pm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749211176; x=1749815976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RBKB3/9EuqkeSqFD8CRon1Zsx+X5s6ybMaqEFvORUg=;
        b=WROxm7KjDsWTNdAZjXdXj0gVyx5zeyg3lQirA2Qqbh7WWq+Kq+ymy3JeDwsQfFqGRQ
         jjkdr2Mo0+2BQTxsXhBHWoUGXffv3LJ0oSOnXtdd0SRK98cSiRyOaAnupCBolhRH0EQY
         7HVeFl/M9BBj+tjdQ+vN7bxfkYxHDYGO5B2pHOYNWOfudLHC77tR1l+uXnhop0mZGQ+7
         D7c7wGhg8FJjiaWOqnC8XlBUHlv7eaDUkp28/kZW77vqGa8SbDObv8FmwmIrZb6xG1So
         foSTWBXnM728RXV2yNA4asYllfT+ihwBoCYVVF4WHBJsRfrSaijDC3wnfUgl6+SdJeHK
         xJtA==
X-Forwarded-Encrypted: i=1; AJvYcCUvGIPkmGecfJyYiblaepOyZmFpZh24PlNJektOjuzcmqJ7Mn0TqECbyy3N7eUTruoP3gM19K0Kkg/QXA4=@vger.kernel.org, AJvYcCVlK/C3Sd+L8ApGZ7ctOizD9KcQI5g0WLosCz7yezBerfg2IFK2ML1Vuhaisb5eet5gRe/sbPjT5inlWLV1@vger.kernel.org, AJvYcCWsNhWXgiSYKhX23OfpcOypk86UsyqxB/Rc0AXQyKczb+WXaNq72d2KRkXNbkIOJ2bg+2pbN6OyPdF++0TT@vger.kernel.org
X-Gm-Message-State: AOJu0YwQgVAwbjrxGweLDpY7Luc8jGOd+npKA2JIsp76T7I6/RIHGERW
	SRmp9rAhrPHmlwf4klShL5udpW13CgKR86cadxF29LASSdVRdjlQ6Y9UA8/dc0oIAnb7jRlPKhX
	oV7uA4RjKA3pjJY2MyWzOwJgMzwYDHF4=
X-Gm-Gg: ASbGncsuTEguhf1xbLLRNsgyQK3U3P6Vag2oSe1wZ3NA4Og98Tb8brk5uaLND7Jf1Y5
	Ct1OQpwVlhD0lm+vojVtG1fk3Ek3Y0GGBKlL3T1WAFJVznIZisq7hMDm4nVHjXgsHBQLoxrndJA
	iO9HbmI7F4rP+KO+C8HhB5hYmnQzN9NQ==
X-Google-Smtp-Source: AGHT+IEyOHac18JRsxQCDC33nCW0intiyA9mvI/PE8BZZlcm+WphqtwKX7kfZnMd/x1fvrki/mIzxhujOWzkyQ0xq1o=
X-Received: by 2002:a2e:be0e:0:b0:326:cf84:63c4 with SMTP id
 38308e7fff4ca-32ae0021b08mr9121671fa.1.1749211175876; Fri, 06 Jun 2025
 04:59:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com> <btmzhyullmggev43b3syp3anxlm6o5mpz2mthaskuyl7kfx5gw@w5gesyaaytkh>
In-Reply-To: <btmzhyullmggev43b3syp3anxlm6o5mpz2mthaskuyl7kfx5gw@w5gesyaaytkh>
From: Arnaud Vrac <rawoul@gmail.com>
Date: Fri, 6 Jun 2025 13:59:23 +0200
X-Gm-Features: AX0GCFsrvG8NbZd4C_wPfiA0MO9Yh-Z4gplq5hfZ8xBg7i6J3bFVaxj1uRtBKGs
Message-ID: <CAN5H-g7WLsowjW6CMee5T=W4Lmia9mLWGgX17-mOMjtBo2SwvQ@mail.gmail.com>
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Dikshita Agarwal <quic_dikshita@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Marc Gonzalez <mgonzalez@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 1 juin 2025 =C3=A0 09:46, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> a =C3=A9crit :
>
> On Sat, May 31, 2025 at 02:22:00PM +0200, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > Fill in the correct data for the production SKU.
> >
> > Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/core.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
>
> Verified against msm-4.4

Hello,

The current values are based on
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kerne=
l.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
which we've been using in production for many years.

-Arnaud

