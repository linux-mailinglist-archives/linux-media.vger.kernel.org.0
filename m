Return-Path: <linux-media+bounces-21850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B702E9D64AD
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 20:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 374A5B23982
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 19:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240281DFE21;
	Fri, 22 Nov 2024 19:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVt2wrpp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEA316131A;
	Fri, 22 Nov 2024 19:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732304843; cv=none; b=ryWIgrnCeDfv3ji7QbkWXkAqRIKCioBjXFoxZQQQj+XxvNDoRQbEv+FHYwmayCBHu+IWH/waG8F/dbP7M/fUaEdsgr/njku0t3NMaEDfkxe6ltJ0fENeuD7UJaphVcucFuaUrVXQO/5Y1k33NDxGPmI86h1gb2AaHkQ/2JGWd5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732304843; c=relaxed/simple;
	bh=VmUZcQ/YyvYC/VoDkXXN1i7MprXd09YdHPXEbOttVYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNx+IP4M67+ve2U9NOHYlM+QqvhsbO8EW6WEnuNdAR9nnC5SLWNHu/w1h3u557X7U0Ui0kZezbM0grW9ybmOW7iZ/wdKknJwRa0uixj9zQN0OFXpmxxFcwGhwQehplwGh/TuOEXtGkTDWHAcU7TX185I3sQH04yLhJbJNMvBXpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVt2wrpp; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5ebc0dbc566so1245848eaf.3;
        Fri, 22 Nov 2024 11:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732304841; x=1732909641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+NleAF5wnamCsArGsGIgVjUTeRQdwurqWtviiq9uEg=;
        b=mVt2wrppZgX3JvlSDRpbPdT/v83lvjFJ5PPapuLsLhY2LddXGDMyeATZ+isvX9Oj9C
         UewzS/lb6jkc+t7h7EEYxMUFgzwCtCB2GhsON2UNlp5X9D9pKWEsabnAtUp7r/XU7vD1
         FZLM76M0kRm4vHA811z7i38KikLpJojKRupCOgsAZoYBrKkUiSAPAX6oEmmHyv2+h+qK
         wv2GfzoWYFgJvhQ/H0+L5xdSSWCgVS+sC4838FHey0fD3T3x9kJbcV146XFbEPztPiFj
         MflfldhWGaazhdN4BrcsxJApZAj+d/yGV9uLlT/x8zb3EVuiSfou9JzQySbMwLCh5VIy
         K+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732304841; x=1732909641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+NleAF5wnamCsArGsGIgVjUTeRQdwurqWtviiq9uEg=;
        b=d0lTXZjYLjcgFbriX6Cf+o2Y/7nquImvbtp05a+3MZ0SXSKlz5u7q7BxCA1CCAYR+K
         3nA3DrLXSgWfmLTIHaNI6Tlovggx0jp+aybiK+Ok8QCqLArefvdFOS0qtEac90VbZWbk
         ysm2v/BuUiyKydOJuooQ2WLxKKHMnyxDD+I9wNd1dlkUi0xs7br0prqcy5lrI3/KXGkT
         ozLt3buFHj4jKRz9UT90eNYA7He72coQmgzsd6IG1sas6O6N6o13S9Sx2dJxSu6ZPIX1
         6+UCgO3yfiS/6E4QL6rwvPk5+ALxfuiC1EEFBPw+HoyRA+00CntTkmLx+hg8aKQlqsgg
         N9yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVjkSjaXa+s1zhjQUOcHkV9ZJ+4l/f1Mg1iywXvc17gzelRba7GsYu/GlHK7JbZ5GcS7h7HVpV4oWgJEQ=@vger.kernel.org, AJvYcCUZ4AI2HgSXVhJtvaYAIkUPCiSY03qoNpoNFL1OF6C5JGcWy5cyTKWVdKz0gbKIcqlzMCtqPV0cbyJYrqaDrEIrYOo=@vger.kernel.org, AJvYcCWZXa9hygv2oiKQuERZjtL55wBe+ZrYtag8j27wi/3l+bnJH7joJNqklo3ERuA3t6aOcypA5ht/nq62c2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww1xUQ91Nv2O37tx3g2zhkGBDAS7rZwFV5GgSXELLySLbDjvDf
	BvF8M3WJghVYXNSsGjRDFZuggTaQ3I2gPmCUcbavyY7f2oqMA4vkuleCxrnfWvqs2zgECcxiBuD
	2cTFgLci7y/Y4p18bczoYffkNl/E=
X-Gm-Gg: ASbGncvYFuZTSGdzcgAx3E1kbn7+1uA0KFghba+cstD+vJ/7T4DVnf6IARbHFDh2Aob
	pF/BxKFpb/ClyQhVWHZvMnNApLZDzi52m
X-Google-Smtp-Source: AGHT+IEM0Bxq7iO/4ObNr+q9HZYS7UVWQqiLqcaiN0ov8+bJQgLI2Pu6S3I1iEtPK/kuQrcgZ/eJXlxS95mx8EIDIDM=
X-Received: by 2002:a05:6358:98a8:b0:1c6:99d:b832 with SMTP id
 e5c5f4694b2df-1ca7971277dmr431218655d.8.1732304841232; Fri, 22 Nov 2024
 11:47:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121210543.8190-1-jiashengjiangcool@gmail.com>
 <20241121210543.8190-2-jiashengjiangcool@gmail.com> <b3ef3855-f95f-43ad-9a2a-3803c1f00046@kernel.org>
In-Reply-To: <b3ef3855-f95f-43ad-9a2a-3803c1f00046@kernel.org>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Fri, 22 Nov 2024 14:47:10 -0500
Message-ID: <CANeGvZVg1uxkBNGyHvcnNP1D_Uq8gaZuTzqhB8S8u9PjyLTMrg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: mipi-csis: Add check for clk_enable()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sylvester.nawrocki@gmail.com, mchehab@kernel.org, dron0gus@gmail.com, 
	tomasz.figa@gmail.com, alim.akhtar@samsung.com, kyungmin.park@samsung.com, 
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, Nov 22, 2024 at 2:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 21/11/2024 22:05, Jiasheng Jiang wrote:
> > Add check for the return value of clk_enable() to gurantee the success.
> >
> > Fixes: b5f1220d587d ("[media] v4l: Add v4l2 subdev driver for S5P/EXYNO=
S4 MIPI-CSI receivers")
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> >  drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/dr=
ivers/media/platform/samsung/exynos4-is/mipi-csis.c
> > index 63f3eecdd7e6..d1c938065475 100644
> > --- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> > +++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> > @@ -940,7 +940,9 @@ static int s5pcsis_pm_resume(struct device *dev, bo=
ol runtime)
> >                                              state->supplies);
> >                       goto unlock;
> >               }
> > -             clk_enable(state->clock[CSIS_CLK_GATE]);
> > +             ret =3D clk_enable(state->clock[CSIS_CLK_GATE]);
> > +             if (ret)
> > +                     goto unlock;
>
> You should unwind the work done, so power off the phy and disble regulato=
rs.

Thank you for your advice. I will submit a v2 patch.
Additionally, I noticed a redundant space before the label "unlock," so I w=
ill
remove it as well.

-Jiasheng

