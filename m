Return-Path: <linux-media+bounces-34297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E968AD0EA9
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 19:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D026E3AF489
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 17:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA4B20012B;
	Sat,  7 Jun 2025 17:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6BQaLrB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BF582866;
	Sat,  7 Jun 2025 17:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749315685; cv=none; b=kpbq6lU1aap/As8FCrxG/APyGd4co83swqxcG5MtnHk9v17+gdVWrUCnSXDz1SA9hdigtyP8VtOE3tJaPx8ODVJf+OTQFn0Dv5PkQr9MClVLf02bq/lpTkU8x0nsaANJyfmj8Z8csZRP8jLB4Eovc1M6LWmL36fuDDtOnXO+Xwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749315685; c=relaxed/simple;
	bh=FErgFTQWl8H3HT1zKbY8lysoJhYePPaFVJeTh/hkcRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7ivTsYjoedO6qwvi1ogJVajBjQR41yNs0e7yWo/D12N9HZVm+OwIcodUKgaWa4zJavTUwuEuwdSwa2VWdFrqaoLlsE+2xFMuKJ2v+sp4HGjrVCpE22JkKcvdFYf0SBbKq9jzTc9g6GqGMlM8TKH1rWZanF7LsYefG2gAXmMIHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6BQaLrB; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32ac52f78c1so31084801fa.3;
        Sat, 07 Jun 2025 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749315680; x=1749920480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6WVk+/JB7rAPGcjYfN10L46jlxYRiAfY3gkjwFH4xg=;
        b=V6BQaLrBFqO+MfbeQnbOOVx2H5AiUeJiu1WRWDKGj5K766aSOJvuHmhvZnZwP7kWrb
         EdfGYwHLACw6TPk2mEn1KqlSDhf9iPFGD0fHqyP/stcZWrhtF8kvykEe1dL5Yyu/bBwq
         5Cvw8AenFqrPiRJxpQ8heocMNJnpKvka8HwR2GdMJBgtfjTAkXQI17IVI7gHQ46K1I3l
         On78MX7goLMfCxOO5iifbOq12lTiqojQiVRbA8GjPL6BN91a3ofVEDuAGmDDg26m/+Ew
         P18MqDPffJOvyT7VizlefpN1j4qqTLrYrxjfqDUQ4zVzKQbkynn344ngF1PkzLEMvjpj
         KGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749315680; x=1749920480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6WVk+/JB7rAPGcjYfN10L46jlxYRiAfY3gkjwFH4xg=;
        b=eahDq00v/vd7JCAfWpYUuMnLQOty71FgFM6XEaDhCtRU0DM/V1R9ap+ZkqaZkrs/2Q
         eqBTGa+ovpgCqVX7X1uc6sIm/Dz9lQw/My+d6TxbVgIBg6nCHkKNX/mTD1LB6GdhHitA
         oBZcsWbcNttDJFzhfPpF2u8HnzF5CO6SzEFEjGWAvyAWdYkoamI9vdwr/8Mw8zMiQara
         dAiVgB3WPfGxdYBPv/0lBEp8H5rZZ2Ug+hbEn3w96d8SGSBT0LpbR0JtXDRknGXRwnCN
         J1cuBQO5KPjXyfN81XbqnIluVQPwX2yqNxtVrDehzi8GJL80+f6WGc0eNvCuj917NoXy
         yBlw==
X-Forwarded-Encrypted: i=1; AJvYcCUFj/qx/80y4HTJrW0WZAKyAuewO/puOvezo6Lkb7nvQwG5VrOl+pdgWTWudiAEeFaTXlQB7/6LEFhvv5C0@vger.kernel.org, AJvYcCVM8Jig6wwZrYzfLXo0N13ekQBPjezpG1vdKhDSw4gZJR3iF6jWwBnzFt2TG3v4yXfE5VhpVxSfWqTiO4zZ@vger.kernel.org, AJvYcCW2eqOJ46yTR28SH0cyAioUoDYk2YhAY6hklAdz+XghTbATrx7vM+xeN3YR9+uTOnHgK8sQ3zqxDmyGqUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG2Mh7ch/GtVNqyF1qxVjqCjzs+/Ju7M4ZvKSYFdAGo/44Q198
	YCWK5hKa6gVyYnNTaYRn96QOz85taAQh52JyzLe/YiKIKTrSxLYLSIzyq53enuyayBN7hUy+njE
	672skAERAJIc/ZG0XN/1ikYiDNMee1f6WCOR8
X-Gm-Gg: ASbGnctkJ980kbai9vnwAgK7pHU3lrZuZoBCwuTG9g/Udgd1JYPc1RYKvE6DlYpPoqS
	l9SDwkaFAan1XfD/RIpbYrENpa9CNus8eyf830he9/y3qO+BDtjDbV/4ruiHsEzsxExk6O35R1B
	FwQYezcgmts3FHAqVHWxSUK/jKWRWiUnwX30B64PMx2fjKEF2vz8NggWe/CgcvijqTYhmUzpnmS
	9E=
X-Google-Smtp-Source: AGHT+IFTv+PnCR1FFBFPRRlL4qtVEdUNkKNqxhFRPW5zZOEZxpfo1u8xvtcxJr+p89SlDmyvPhb1WzwAuII8GgFHvgo=
X-Received: by 2002:a05:651c:19a2:b0:32a:6b16:3a27 with SMTP id
 38308e7fff4ca-32adfe1dbf3mr20542471fa.35.1749315679583; Sat, 07 Jun 2025
 10:01:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
 <btmzhyullmggev43b3syp3anxlm6o5mpz2mthaskuyl7kfx5gw@w5gesyaaytkh>
 <CAN5H-g7WLsowjW6CMee5T=W4Lmia9mLWGgX17-mOMjtBo2SwvQ@mail.gmail.com>
 <b9b456bc-beb8-769d-5f9f-e13b8860e659@quicinc.com> <c98ebb32-7207-40b4-90d1-8bac62d54c8f@oss.qualcomm.com>
In-Reply-To: <c98ebb32-7207-40b4-90d1-8bac62d54c8f@oss.qualcomm.com>
From: Arnaud Vrac <rawoul@gmail.com>
Date: Sat, 7 Jun 2025 19:01:07 +0200
X-Gm-Features: AX0GCFstInUACsl9X2b2Lde8y05sK1CuKP_7VX10ft9wYvNQ9qbC30Pa-0LHqoE
Message-ID: <CAN5H-g7uxH2sqxXdzE-BQtLXYgaEg+h7A=9kuKqwdAZEMXp4Zw@mail.gmail.com>
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dikshita Agarwal <quic_dikshita@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Marc Gonzalez <mgonzalez@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 7 juin 2025 =C3=A0 11:36, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> a =C3=A9crit :
>
> On 6/6/25 2:14 PM, Vikash Garodia wrote:
> > Hi,
> >
> > On 6/6/2025 5:29 PM, Arnaud Vrac wrote:
> >> Le dim. 1 juin 2025 =C3=A0 09:46, Dmitry Baryshkov
> >> <dmitry.baryshkov@oss.qualcomm.com> a =C3=A9crit :
> >>>
> >>> On Sat, May 31, 2025 at 02:22:00PM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> Fill in the correct data for the production SKU.
> >>>>
> >>>> Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/media/platform/qcom/venus/core.c | 10 +++++-----
> >>>>  1 file changed, 5 insertions(+), 5 deletions(-)
> >>>>
> >>>
> >>> Verified against msm-4.4
> >>
> >> Hello,
> >>
> >> The current values are based on
> >> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/=
kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
> >> which we've been using in production for many years.
> >
> > I see -v2 updates these to 533/444/.. MHz [1]. If the value changes bas=
ed on
> > board variants, these need to be picked from board DT instead of driver=
 then.
>
> I believe they don't (although there exist some SoCs where fuses determin=
e
> maximum frequency for a given target). We really want to move off of in-d=
river
> freq tables but that is still in progress.
>
> >
> > [1]
> > https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/k=
ernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-v2.dtsi#L1140
>
> Arnaud, as Vikash mentioned, dvfs tables and some other magic values may
> get overriden in socname-v2/-v2.1/v3 etc. I'm not a fan that downstream
> leaves irrelevant information for old revisions in place, instead of
> simply replacing them, but what can I do..
>
> Unless you somehow came into posession of v1 SoCs (which I believe were
> totally internal), your hw has not been stretching its legs fully for
> all this time.
>

Yes, I missed that the values were overridden in the msm8998-v2.dtsi
file, sorry for the confusion.

-Arnaud

