Return-Path: <linux-media+bounces-22561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1516C9E2CF1
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 21:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9805283875
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 20:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC91A205E07;
	Tue,  3 Dec 2024 20:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjAb3HnD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C42E2500D3;
	Tue,  3 Dec 2024 20:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733257335; cv=none; b=uxXadb98UdF8IkyUE4yJYjiW53fozaQMnvN8Ory1Hz4NSD1vd7ohOpAApICL3u6vMe7e9lN6Wxphd4oIzY3a20JgccJT/h6rQEwal4iHNrz0kOc1gLHAbYkSDBHYhBNN2Qh7CScmAKEGWUR/BZF4UqpGkb91F0hXej6xexIZOWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733257335; c=relaxed/simple;
	bh=Sxi5znYxUP0UQHfoEwAVGT8OLLm0PJLiAgjwzuzzVFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axuvxMqaJjxWD5CDhDe68On9zcPJocQm0ZVcCL+scUQu+PKqq0ZNunrCxJ8ias8BkqVEm146IfzeEJeTRXXHVi7vkuP52e5mhOIV7IZoypXBtDlHKdo5tKER3OobX/SP0i92JB44e/7wMyJS/YIn1PRtqZdIdM17a/AwHTnhQ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjAb3HnD; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4668978858aso41595011cf.0;
        Tue, 03 Dec 2024 12:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733257332; x=1733862132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtDaLebm7vDIYp1YKWMPydQGkMzApAsOlbbc618I72c=;
        b=XjAb3HnDiLZNGcfHz4oVmAKHAX7PlR7XNXEdmD5Ao3fc3X8kQ15Eebkk/h+DVHYVsy
         PH3xO+GLQ9A/+eRkDN/nalNgVtXUOvKOQVetLPM6BmSR744jde9VduHLFOCDIccCi8wV
         O9axayaxCpQnLYCqZPa/drp/0RAjgNTCer5Aaj35kXu+i+Ay/67gtxzwq6Av+SBnOOqv
         AOADuk0WC26cEjFJVC95h6rYtpfetEHZRZfUSTxcSBJXIAKN6ncJ44+IB8VhjEz5J7hm
         mEogFtt4HrBiMiTC6PU7bVGq6fGDKmEfPKRs1Pgzq8h2mfgISjUpY7gb7jwnWVV3A0Mu
         H+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733257332; x=1733862132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtDaLebm7vDIYp1YKWMPydQGkMzApAsOlbbc618I72c=;
        b=Oas2GRfYZykKdhtXncBOPcZWlnlNGt+sIzu4CZ4iRazce7CUW6FNTwWrGjeqbUXxTw
         t8b4+MskYrHTFLfg1DVXIfvrbX2ljX0Aal+txVbSE/q2qhtFj2kRz+LNSvwuwbusVXag
         w3jgeKH5wFbWr0R5APKN9JaK6doMSWcUnP1+psBL4zOmvpi2/GL9wFzQ6GPhSTekY8e4
         wt1WwpOVxBvAj6Rv9IXSfdYgF5u9ZR7pZEKMAv/lpkLUrTc4H+c2n0T3HkgqZ0T/RIUM
         WS3/I0nHYv1gSQN5HXvDhWdxdMa8T1hCAWhfX+x0iJ9HHwAaD/l5two8CFkDfacrRmGZ
         lOyA==
X-Forwarded-Encrypted: i=1; AJvYcCUPGYDZsK+VGAQj0XtDzK16Z09ZhgxkeQa0imNbgB2OAWa3BioH7DLRYBtUncDD3tpxesg0xqI9hX1EDo8=@vger.kernel.org, AJvYcCWjcdRzT5Oj3kaYLuYFWR4TU+uGhKqZsi0w/XZtGfysW0FE8xVVuINbG+8ogWxMe7931662PtSFLvOfR1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0zID+/4iXIG+2AjY5QwZYLKDi90249xjdbPuNgMwbto39OLeO
	lZ/IfW+2st9A97pKFyArPxOb55oJZYCEiBorCauN1N+koXhrb3/TGt7+7OkfI+rvowfGUPgOiu5
	rqJi/J0cLx/GD72INzvOnciqkh50=
X-Gm-Gg: ASbGncusXl3AaQ3toOnVSDyxhC/9gTdENLBzJZTNflt89tJ8QDrYNZ+9rbcz7UPLF/B
	3hFlzHWVbQ+Kf8BRaIXkZ9Dx1yZNs9Xlc
X-Google-Smtp-Source: AGHT+IGWhJBAhMOwv6y+Q9Ivu4+z0fkek9ZyRdpVrOExnOki61wjJGgx6H1YWOFMLiZ5QmF1tJkyfJWKQaHl4PO0Fgs=
X-Received: by 2002:a05:622a:104:b0:466:a179:d3aa with SMTP id
 d75a77b69052e-4670c3ac945mr49543411cf.34.1733257332291; Tue, 03 Dec 2024
 12:22:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121202506.37602-1-jiashengjiangcool@gmail.com> <a285cdf6-2a58-412f-9751-1b6f9e3edeaf@xs4all.nl>
In-Reply-To: <a285cdf6-2a58-412f-9751-1b6f9e3edeaf@xs4all.nl>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Tue, 3 Dec 2024 15:22:01 -0500
Message-ID: <CANeGvZXZAHJX=tE=4s8CxfzDioUU8_T6Agt9NEz_BOLQF8js3w@mail.gmail.com>
Subject: Re: [PATCH] media: marvell: Add check for clk_enable()
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: mchehab@kernel.org, andrzejtp2010@gmail.com, allen.lkml@gmail.com, 
	neil.armstrong@linaro.org, quic_jjohnson@quicinc.com, lkundrak@v3.sk, 
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Dec 3, 2024 at 2:14=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> Hi Jiasheng,
>
> On 21/11/2024 21:25, Jiasheng Jiang wrote:
> > Add check for the return value of clk_enable() to gurantee the success.
> >
> > Fixes: 81a409bfd551 ("media: marvell-ccic: provide a clock for the sens=
or")
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> >  drivers/media/platform/marvell/mcam-core.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media=
/platform/marvell/mcam-core.c
> > index 9ec01228f907..47023e701e12 100644
> > --- a/drivers/media/platform/marvell/mcam-core.c
> > +++ b/drivers/media/platform/marvell/mcam-core.c
> > @@ -935,7 +935,9 @@ static int mclk_enable(struct clk_hw *hw)
> >       ret =3D pm_runtime_resume_and_get(cam->dev);
> >       if (ret < 0)
> >               return ret;
> > -     clk_enable(cam->clk[0]);
> > +     ret =3D clk_enable(cam->clk[0]);
> > +     if (ret)
> > +             return ret;
>
> If clk_enable returns an error, doesn't this also require a call to pm_ru=
ntime_put() to
> balance the pm_runtime_resume_and_get() call?

Thanks. I will submit a v2 to add error handling.

-Jiasheng

> Regards,
>
>         Hans
>
> >       mcam_reg_write(cam, REG_CLKCTRL, (mclk_src << 29) | mclk_div);
> >       mcam_ctlr_power_up(cam);
> >
>

