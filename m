Return-Path: <linux-media+bounces-8789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C2989AAC4
	for <lists+linux-media@lfdr.de>; Sat,  6 Apr 2024 14:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CCF9B21A14
	for <lists+linux-media@lfdr.de>; Sat,  6 Apr 2024 12:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B312869B;
	Sat,  6 Apr 2024 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FQwcFkdh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA94CE546
	for <linux-media@vger.kernel.org>; Sat,  6 Apr 2024 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712406905; cv=none; b=sPHx0/ho7n2xI4MIn9nH8AK2oI+hcDADRRuP7T0z6CqX+DpU6wnAXeuLURdbwPEvoyPy+u4uaBypfUUqwCIe0WhdG9TGc9PXnTjMSTYmTBBpOljDbwHpUPeBTB5N3tvI2Ff2n4eBARzub7oDWG+QdggNSF2izREEmIO1avB5yec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712406905; c=relaxed/simple;
	bh=PgLZGgbB7pRKcZwxAPWD0reZVU0kuTBEcd0XZ3D/oLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMnxfOHwcEfRbNfYmn1ozYVBqG5npVjPkKn/XTmYrHGBxE3PiIbWQxehdlu8SMT6VzCvHcXEUxIin5yKoB/+z2ii8Nm9cf4bsE4iSkxDUYDKRVCr4nv1TQpi6RsuyrL9YKwdVC3VEoQQKwWvOV3LFPX6xInR1N6kW0DeIbDUAsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FQwcFkdh; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516a01c8490so3596066e87.1
        for <linux-media@vger.kernel.org>; Sat, 06 Apr 2024 05:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712406902; x=1713011702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTqfNfgVvG17SQS+nQW1vZDRZtnVmPZ2TWsdgazdFrU=;
        b=FQwcFkdhZl/IRyJhRDwsTpIePDLvYS5L3vDmc9UenebWufnuuaEXgYwYRgRNez+2Oy
         bBoQ3Us99v4h6XnHAHmFyyuajb/JSmC32Om1dcWR/Y0Y73s98o9m6fyehpiRaYgWnXxj
         udDD+4FNis/4sbTc/aD24CNPTea7Ljin7oCME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712406902; x=1713011702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTqfNfgVvG17SQS+nQW1vZDRZtnVmPZ2TWsdgazdFrU=;
        b=Ku9EBSpa+Q3+cHwk300m55b4MCKY6wBNnkEy8nRKB1sF8Z98qFJQovpRZJj7abSCRA
         7+Rzyq8BIGEoa5W59bOB106faTfXwVlVm0iI4N6sfZ4Oo6H13AhNtfYj7UUZShuNka8Q
         5L4OOBlrY2SB3Zy7Xhi230b65zOK1+lHtNOwaqwBQlmnpssKw62/nyEg8rFszTYG0MZ1
         t6U9cOfAGcV53gJk6PTbypzbUORspKH0mggS3gpNphbj3WsjKceNqB8oVPemOOPQJ1Th
         DtqyqfK5Z0Nokqir9ULJ5N1u9Z0+X1FcN+3j0PQBzsj+55sxCWnIXEZStuMirQNfleB/
         8adw==
X-Gm-Message-State: AOJu0YyGIh9mOdeWRtntKHuAUadh9HFe3FAT9flv/D4Al6wJbJNZGMMb
	2x1Ws1mz/EaI2hoMjLh7oyt3q03PeiOlR1skkDSA0/wR7Ak/IQdkTN9OBnjRFgrCKAUq+Li17g2
	ydp44YEW5yeAhHoioQ+9UKfKcBZY+Gn1TV6uv
X-Google-Smtp-Source: AGHT+IEjjE3vFi++fITR5aaazmRVDY9+fuTG8XTxfg5Si9NGnH25rGqyqTwDAJwfMDkr02ArkyUma3rIJ5o7kLr7a6s=
X-Received: by 2002:a19:f019:0:b0:514:b4c7:9f5c with SMTP id
 p25-20020a19f019000000b00514b4c79f5cmr1592215lfc.9.1712406901679; Sat, 06 Apr
 2024 05:35:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl> <bb4d3cf1-03a1-42f0-82c7-5421d9af28cc@xs4all.nl>
In-Reply-To: <bb4d3cf1-03a1-42f0-82c7-5421d9af28cc@xs4all.nl>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Sat, 6 Apr 2024 20:34:50 +0800
Message-ID: <CAGXv+5EnB6uvo8vr0pXNRARzWy-j8ssqKbvwUUJjeaAdfH_cag@mail.gmail.com>
Subject: Re: [ANN] Media Summit 2024: where to hold it?
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	"stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 6, 2024 at 5:34=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> Hi all,
>
> Based on the responses it is clear that Vienna is the winner here.
>
> However nice Montreal is, it is simply not an option for several key
> developers.
>
> I contacted the Linux Foundation to see if we can get a meeting room
> co-located with the Open Source Summit Europe/ELC. I am aiming for
> 16 or 17 September.
>
> When I know more I will post an announcement with more info and a request
> for topics.
>
> Thank you all for your quick replies!

Sorry for the late reply. I'm replying on behalf of the ChromeOS V4L2
video team, whom I had been supporting previously. They'd prefer Montreal,
though they will try to send one person to attend regardless of the
location.


ChenYu



> Regards,
>
>         Hans
>
> On 04/04/2024 09:29, Hans Verkuil wrote:
> > Hi all,
> >
> > Normally we like to have a one day Media Summit meeting co-located with
> > the Embedded Linux Conference Europe, however there isn't one this year=
.
> > Instead of organizing an ELC both in North America and in Europe each
> > year, the Linux Foundation switched to alternating between NA and Europ=
e,
> > and this year it is in North America.
> >
> > The problem is that most media subsystem developers are based in Europe
> > for some strange reason.
> >
> > So we have to make a choice this year: we can co-locate with the gStrea=
mer
> > and XDC conference in Montreal, Canada on October 7 or 8, or we can
> > organize a meeting somewhere in Europe ourselves. One possibility is
> > to try and co-locate with the Open Source Summit Europe/LPC conferences
> > in Vienna, Austria in the week of September 16-20. Another is just to
> > organize something ourselves somewhere in Europe. But that's a last res=
ort,
> > co-locating with a conference is generally more appealing for people.
> >
> > The advantage of picking Montreal is that the gStreamer conference is
> > more applicable to the work we do, and we can get a meeting room there
> > free of charge. Besides, I've never been to Montreal :-)
> >
> > But can we get enough of the core media maintainers there? There is no
> > point otherwise. I suspect that the same company travel constraints tha=
t
> > were present last year are still in force this year.
> >
> > If we pick Vienna instead (assuming we can get a meeting room for a dec=
ent
> > price), would that work better?
> >
> > So if you are a core media maintainer, or an active media developer int=
erested
> > in joining a Media Summit, please let me know if:
> >
> > 1) Montreal, October 7 or 8, works for me!
> > 2) Vienna, one day in the period September 16-20, works for me!
> >
> > Please respond asap, I'd like to get a clear picture soon, ideally by t=
he end
> > of next week.
> >
> > Regards,
> >
> >       Hans
> >
>
>

