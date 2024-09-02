Return-Path: <linux-media+bounces-17397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 887F4968EB8
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 22:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2F702838A0
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 20:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D6A1A4E9B;
	Mon,  2 Sep 2024 20:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huLuF6DR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763291A4E98;
	Mon,  2 Sep 2024 20:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725307554; cv=none; b=f+nuD0o/+Gq/LBEANur04tPif520xkFSQVAyd6isTlPSGvxGp6UbJ0zRRe926xbsBC5UpLLFWKi8pN1/Tu3S2SGgfzuJcX+XgTv+TmKzna2BZrA5CKBBMuCg0HxWA2MK6ztJ3EMYG49GCA9k+G6uNr9xsRRD5oRE/U92i0zdtSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725307554; c=relaxed/simple;
	bh=oR13/D3osFw2mOoOD8uvTfX3ErfCXm//ENYkudour6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TFzha7NtxYz1xCYnp0PpMJ6pSd2I5DLTBEVgJAimLK6Gq2AHHzmpassKzd1Egmg20irl7dtoWmDkbvjz6Syua+nyZhgV91yFnJnM+bmoU+KLpXmufmCbsPefdQ/j6bpws5Qz4+cNd3Ku2YBBnKjchO/rh6YuXugPIX0IXl7RedI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huLuF6DR; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f4f5dbd93bso44196571fa.2;
        Mon, 02 Sep 2024 13:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725307550; x=1725912350; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q1mW6olJn60s1knsqJRVYp6yvfzwTFLjzO+ob7YZepU=;
        b=huLuF6DR4FqL7iZ8c9uDuaEQEfR4TosGqZXLCeSXjyPf5gNrXZna8EMH46+4QsAIQj
         jfoEhWxxLBBQmG5Zu3G5ObL0ljs+a1+m77hfFI0DKWx0phbq1zpHF+2kRGe6F1UGrFki
         HFa4u6pWlbvruqRN+0KT8c1mymr6gwGpTrTeF8Ul8i6Cw6T8pGXuruvyJiloHvrhe9b8
         EfNNJVmA58UF0L9wpu/7UH75hmLU3KcZ5rjInhgEgjbxZ6EHP1wiuO3973RnlQ3hjvQz
         qNlQaFGm+SbaMJwAwmRKuKBI7cMEPchsyquDK9aN8DML2+dKlCyWWvIFN9JYVt1RWqPB
         UMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725307550; x=1725912350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1mW6olJn60s1knsqJRVYp6yvfzwTFLjzO+ob7YZepU=;
        b=dnNA61PB94KQQ3YsL4a6Bm6s7glFloHlz4aq6TdE7saOqLjyQuNa8DPwwWWHfZSGDS
         1PY0sVI+lQRDTQX8GSoVE+pimV0/7PBtI3UR7eCFgBqIxAGqCRulPXOSRRMv8XkdKsjZ
         tHpuTZP3zzNrpoI5SS4wXI3YoRFWF3Wa17x3R4DKvEe+mRs2UO9fl2aiHOP0AV+iRJhV
         OxXGFSNHg7BzzXrLgUv+o4GtEG/NXEzi/yaA79WgqjHmulq3P8/YgB5Y4+2x0mtoJSJ9
         QttbutVBnV5oE78oCBWobDJz07Wjz2Ka2usblcEny9wX+Hk7hbEK5IWPEGqLnX2gZIY4
         Xc9g==
X-Forwarded-Encrypted: i=1; AJvYcCVuO7jklFpNVlve6q3ngGryKJMeaIC3I6VVdTPYlxMPdiF0Y7fsoi0C20jCK0z/aYCJ02lqRcQ/fYbWVvM=@vger.kernel.org, AJvYcCX4FKxH26tRFfIVHcajRDcj79n1E+VxYtFIsm5B03Q0+qHF3MO7aIhTuWAOZDDcvpJnyjVVYbT/hDZw2Wc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqtMt2mYYoFhX2rQzqrqmPoypt5F2+QOxR1Ri89vPUakOlcDs1
	JyaHPOn4E6Ym0MxFES33PgttZ0EIy1INZyBMysg7QqDLxzymwU5Qr2P3HCmV/Gq0Nmb5Pfv6pgN
	T9678OsxfkAs5zcZss4R+cbNyEf8=
X-Google-Smtp-Source: AGHT+IHl4Jxvx9eY7X6klAx3lC8h7fPnmPOLwSEJJVuY9hCAeqjoRXSY7FY3okLBiJ5BwDy9D3rGBsnFjPynQ9cBcnA=
X-Received: by 2002:a05:651c:1548:b0:2ef:2d3a:e70a with SMTP id
 38308e7fff4ca-2f636a1372amr30029691fa.18.1725307550193; Mon, 02 Sep 2024
 13:05:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-1-b32a12799fed@skidata.com> <20240902195529.GP1995@pendragon.ideasonboard.com>
In-Reply-To: <20240902195529.GP1995@pendragon.ideasonboard.com>
From: Benjamin Bara <bbara93@gmail.com>
Date: Mon, 2 Sep 2024 22:05:39 +0200
Message-ID: <CAJpcXm5uNU7AbLe9BeWa7HT=48evPcM2U+K0qVa6a4MAAEkiOw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] media: i2c: imx290: Define standby mode values
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent!

Thanks for your feedback!

On Mon, 2 Sept 2024 at 21:56, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Sep 02, 2024 at 05:57:26PM +0200, bbara93@gmail.com wrote:
> > From: Benjamin Bara <benjamin.bara@skidata.com>
> >
> > The imx290 datasheet states that the IMX290_STANDBY register has two
> > values: 0 for operating and 1 for standby. Define and use them.
> >
> > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > ---
> > Changes since v2:
> > - new, split out from the previous 1/2
> > ---
> >  drivers/media/i2c/imx290.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 4150e6e4b9a6..1c97f9650eb4 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -29,6 +29,8 @@
> >  #include <media/v4l2-subdev.h>
> >
> >  #define IMX290_STANDBY                                       CCI_REG8(0x3000)
> > +#define IMX290_STANDBY_OPERATING                     0x00
> > +#define IMX290_STANDBY_STANDBY                               BIT(0)
>
> The convention, for single-bit fields, is to define a macro to describe
> the bit, but not a macro to describe the bit not being set.
>
> >  #define IMX290_REGHOLD                                       CCI_REG8(0x3001)
> >  #define IMX290_XMSTA                                 CCI_REG8(0x3002)
> >  #define IMX290_ADBIT                                 CCI_REG8(0x3005)
> > @@ -1016,7 +1018,8 @@ static int imx290_start_streaming(struct imx290 *imx290,
> >               return ret;
> >       }
> >
> > -     cci_write(imx290->regmap, IMX290_STANDBY, 0x00, &ret);
> > +     cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_OPERATING,
> > +               &ret);
>
> I would thus rather drop this change.
>
> >
> >       msleep(30);
> >
> > @@ -1029,7 +1032,7 @@ static int imx290_stop_streaming(struct imx290 *imx290)
> >  {
> >       int ret = 0;
> >
> > -     cci_write(imx290->regmap, IMX290_STANDBY, 0x01, &ret);
> > +     cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_STANDBY, &ret);
>
> And keep this one.
>
> >
> >       msleep(30);
> >

Thanks, will do in the next version.

Kind regards
Benjamin

>
> --
> Regards,
>
> Laurent Pinchart

