Return-Path: <linux-media+bounces-17400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF74968F15
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AE7D1C22366
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97B9205E25;
	Mon,  2 Sep 2024 21:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kieS5xAq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2F11A4E6C;
	Mon,  2 Sep 2024 21:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725311001; cv=none; b=b+EEbfDXzoRNW+UsNdWO8YK2MKGEcaAafAGE1VvU1NxikqXSzgSMPdRIcWeqLUxuCHqxyYaRlRJHy/M7V7hmnGXqK0AO1xXsE4ibM5A5JFJ9iwaVJrCqDxHz0sAlRsmJ0irC/NuNxaYYz3so40q5k23CMwe08LVsCTnOt9VZUwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725311001; c=relaxed/simple;
	bh=lW3L5CKB1oq8Zcf3wKEXswTMk5kZdnv4UW68BtX3nzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uj52JUUQXx/FLtmP+k88p8AITuxm95bvXsc23JxaZqGhtQTTZLx7Ydg2K8uOI/Vr12+Ednpt9ADNaMQnz8xeegtqWWA4XpgsjCzCCvUa+E3F9dtYPYhVE1Z16t5lv3ZkGmL8ZUb48rK/JHLDV7MPpxMtEwVP5EbXbk3yFyghNUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kieS5xAq; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f43de7ad5eso59399481fa.1;
        Mon, 02 Sep 2024 14:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725310998; x=1725915798; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1tTJDVFsykwelGtaYjBYv2TZV/t0faWkcIiWiqfjTc=;
        b=kieS5xAqbM1h3rO2ugDgKorg6f91oyjiv0PnjMo5xnedhStyP7EgxDvYypUr0I/hST
         ZRdn3UxWuMyaV5dLof1+f2G6Cxpr1FX+8/APXhUMfAbN4QzF3bcBXioTHlweKRtNpQLB
         +ZefM63qX+diTC/0/WpY0Wc2Oo/22t8iDppYIPcNyowVEEMY7VCJFhNiVvnsAodqt2dO
         L1BYuXlnmfZBmq8QG4rR3704C+j8ef898GqssE/Tf5tUtwNGSwSQxJbaL9TIB4pIRPsR
         xRpSEOs038SOhjGu8O5JfEWH2mAUVP9rXx/Dnh58FomkeZsJPpIKYLUky94bNvaNzMPe
         S2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725310998; x=1725915798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1tTJDVFsykwelGtaYjBYv2TZV/t0faWkcIiWiqfjTc=;
        b=mL65m8LqdTjcQlwILrV07CeG13jg1cuRa3JbdWz8YYCs0voLgU/HRR09ttD2vczOIG
         i1cwFW4fg7y0ihzTPsB7iWDeqHwWHkLb5kYw5GRI0AyA/IQY8zoNaFh2rifBn7GHQwqu
         8BKn+8xMUraXRtujijcvYyYbXgcgVUl+1mANn2KVMXxbC6SUbGYy4FZAUN1coNt7yZre
         9v3x9tNdWvJF4PvmoEWP1QRS4lMIKksmscCBYtOq4hmUquZXkNHZ6TIQEDkHhKeZivCb
         PWyBJOf4v+AyLF64DmOE31RxwSJar0ejVjsHPrpbANYmIMi5J0FHQ16L2DKTSxgH+gaT
         lrPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7QilC4A8Ci5NdjQqT2swKmDj/gzujqHFtsbeZEJ1gog9fxFlwZ+BJS0oSRN+WIytCHa5CAB5amw/3l4o=@vger.kernel.org, AJvYcCXQI+T+t5ZucMW5Uaon3owZC+XEyTIYkUFXOo66v9Z9zuHCJgwYWYM0c36XecRZHkJ1g9FP2h9Ty8HARaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YygvdjvPMII/SnVl/Uxs5HHrSzJMnuuh75GrATWNBl+v76CfTRW
	qhDERIybXgqpkiGA8yRgFDY9BrWEHp3qNJzVR0y6QEHz/q49iwxjRI/PcR11Wi4qjgkiDbTXzjv
	cK7fv002/VUeHzqG8ns4bv0jUgkc=
X-Google-Smtp-Source: AGHT+IEHvI2NFPqZUXb7j82Apr1b7fxkp7URsrBFAvelcoXN16epsx+rrEhxUsqQ07soil7oj6wH0iwCv7FK+/QrPgM=
X-Received: by 2002:a05:651c:1991:b0:2f1:922f:874a with SMTP id
 38308e7fff4ca-2f626564f62mr61758261fa.14.1725310997377; Mon, 02 Sep 2024
 14:03:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-5-b32a12799fed@skidata.com> <20240902200004.GR1995@pendragon.ideasonboard.com>
In-Reply-To: <20240902200004.GR1995@pendragon.ideasonboard.com>
From: Benjamin Bara <bbara93@gmail.com>
Date: Mon, 2 Sep 2024 23:03:06 +0200
Message-ID: <CAJpcXm7OYMn+TJNhHiO6z19ipfxat=YcH-iCvto_zW5omi8=ew@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] media: i2c: imx290: Avoid communication during probe()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent!

On Mon, 2 Sept 2024 at 22:00, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Sep 02, 2024 at 05:57:30PM +0200, bbara93@gmail.com wrote:
> > From: Benjamin Bara <benjamin.bara@skidata.com>
> >
> > As we don't know the mode during probe(), it doesn't make sense to
> > update the sensors' registers with assumptions. Avoid the communication
> > in this case.
>
> That doesn't seem right. I think you can fix the problem by
> moving initialization of the controls at probe time after the device
> gets runtime-suspended. Please try it, and if it doesn't work, let's
> figure out why.

Will do for the next iteration.

Thanks & kind regards
Benjamin

> > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > ---
> > Changes since v2:
> > - new
> > ---
> >  drivers/media/i2c/imx290.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index ece4d66001f5..9610e9fd2059 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -769,6 +769,10 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> >       if (!pm_runtime_get_if_in_use(imx290->dev))
> >               return 0;
> >
> > +     /* V4L2 controls values will be applied only when mode is known */
> > +     if (imx290->current_mode == &imx290_mode_off)
> > +             return 0;
> > +
> >       state = v4l2_subdev_get_locked_active_state(&imx290->sd);
> >       format = v4l2_subdev_state_get_format(state, 0);
> >
>
> --
> Regards,
>
> Laurent Pinchart

