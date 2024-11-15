Return-Path: <linux-media+bounces-21456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F0E9CDA64
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 09:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0EF61F22BE5
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 08:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9182118BC19;
	Fri, 15 Nov 2024 08:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W+Jgzrfw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED911632E7
	for <linux-media@vger.kernel.org>; Fri, 15 Nov 2024 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731658951; cv=none; b=TyGiEyWNG/zJceDZC68vpiK+3BPEX1xOXLaf3+g48X/Z1FI4Kw8dcdvyIp2uYD9shHBticmvC941NvV/JPVPfP4y7xroKi/I+f+ytQi3ZDlLFpVnCymY/PiLtIvxYvZXfzmzjGvfjdGwDt1bgHUvd1OOiMYWF2yvWND4FKSWo04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731658951; c=relaxed/simple;
	bh=XrYcG7CkZQFQ6ItjoZVP6vkcDAjf0xymGHuaxaV44cY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvV0gy7b73ypMvI14deLvccNTJQOnUhVMNLQuSheV8HsNMl1A7cP5FQK329026bpZZfSI9n1j/S3ovEF/JuR2YTVCbdEdIDQAAEIB2r0471Cl2nWsb+phKLEx8GCHEPRNRATuY77EL96THcqoS80Tya93Z6eKFjINws2r8W9ulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W+Jgzrfw; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7181eb9ad46so695888a34.1
        for <linux-media@vger.kernel.org>; Fri, 15 Nov 2024 00:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731658948; x=1732263748; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TV7adEbpnn1somxbEqgtIIMz6UdxFY1Td/kW9+T6GWo=;
        b=W+JgzrfwoU5mczkDUFn8BX+T5u9rBSZGLZ5LCzqUNLrTr9NUFClG4lsq2e/94wrxjt
         h0B1JB+vLykUt/NeLGFUcVY8mQqPltfZN4yEUp86ZLs8bK7y9D0A94uieslDZ03a1qTO
         8VnDA3Yt/c6zB6YTql9mB3ImoztlaNCuGXo7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731658948; x=1732263748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TV7adEbpnn1somxbEqgtIIMz6UdxFY1Td/kW9+T6GWo=;
        b=DoeA5EmMBqn7tviyVMbEdKtWp7X/lS76etpxnkTohKZuD0L/5oLdbQ8uX5r038GLZ0
         7mAEkwACb0Mj7yq6cgU63UmSu2G3I9/sFI8SQzJnNbBaLIqmsQoV1oMO+HF6IrlovHcy
         iyv627PId3E6Ms0s7jDCW7ffSoJgkcs/NrF4nuhptgb3hJIniGEr3RvU7ivFsPrfPEUM
         yt7mgS3AhKeUuSe4iUKVDZ3kTFdIzC0FcIdKN9EUWGWCpWlV9fi9KzqOzuBkHEHXouq2
         gF46iaDAOW5qFXlnsNGVWvoiIre2Xi4mdPJH7bkJ/oJIAWM70KPS12tLyQk47k3c8nfA
         uALg==
X-Forwarded-Encrypted: i=1; AJvYcCUwtt6zMhTSWBz+YJApSR/6USr46KDxMaf53EUYQ9g1oxea5xlzgiT1mabhzNHVUvL7/vx1y55eY1OPkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw17IHDyJ11JXXquyC9ksaJT9zSzCeCzmpPvA+EVNATzidZ439B
	p+SEdZJGtxLUzfBpQ2Pqkb0ZvqT3aMxmxQ/0zuIjP2mlji8KmuSEaKFEf9V4i0vFyDSOfnYahAs
	=
X-Google-Smtp-Source: AGHT+IEvG4HW9s7fKbix5i1la8btTYaakKP1kQQXbmZB1eh1qIEeDPfVKZc/UzcaIu8uzSl7tDDUag==
X-Received: by 2002:a05:6830:6e0f:b0:719:cc74:dfd9 with SMTP id 46e09a7af769-71a778f1246mr2466855a34.3.1731658948252;
        Fri, 15 Nov 2024 00:22:28 -0800 (PST)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com. [209.85.210.175])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1c176a5sm790818a12.3.2024.11.15.00.22.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 00:22:25 -0800 (PST)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-720c2db824eso1415017b3a.0
        for <linux-media@vger.kernel.org>; Fri, 15 Nov 2024 00:22:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/hhWtId0Zymsa1/d9Y65cqNAC2caT2xtuveNsX1xMkMdZMZqrhCELA03JNF+HgqWDKr0bX6rTyMvX8Q==@vger.kernel.org
X-Received: by 2002:a05:6a00:3a1f:b0:71e:692e:7afb with SMTP id
 d2e1a72fcca58-72476b72b62mr2596445b3a.5.1731658944813; Fri, 15 Nov 2024
 00:22:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org> <ac8ea4ed606cbc7dfb15057babc29e49a152ef01.camel@irl.hu>
 <CANiDSCuZTYDsQ3yCpFV_rhbQ+vFGJnsuU-jXwOacxZVbbzEPfw@mail.gmail.com>
 <5ffafb0d059f09c814692e7c33a7ce35ce9b0169.camel@irl.hu> <CANiDSCvP5eVuSGMi3R4eAkY2-ou=nqrTS1dnAv0Odbcq5UHa+w@mail.gmail.com>
 <c4c6e3a2e5313a9bafec31343407e60b2ea9ff44.camel@irl.hu>
In-Reply-To: <c4c6e3a2e5313a9bafec31343407e60b2ea9ff44.camel@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 15 Nov 2024 09:22:12 +0100
X-Gmail-Original-Message-ID: <CANiDSCvGeCHaw2xfZg__UU=fVCWADSQiMw8od5ofBesWjF-7tA@mail.gmail.com>
Message-ID: <CANiDSCvGeCHaw2xfZg__UU=fVCWADSQiMw8od5ofBesWjF-7tA@mail.gmail.com>
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
To: Gergo Koteles <soyer@irl.hu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ricardo Ribalda <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Nov 2024 at 01:04, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Ricardo,
>
> On Thu, 2024-11-14 at 21:28 +0100, Ricardo Ribalda wrote:
> > Hi
> >
> > On Thu, 14 Nov 2024 at 21:16, Gergo Koteles <soyer@irl.hu> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > On Thu, 2024-11-14 at 21:03 +0100, Ricardo Ribalda wrote:
> > > > Hi Gergo
> > > >
> > > > Sorry, I forgot to reply to your comment in v14.
> > > >
> > > > On Thu, 14 Nov 2024 at 20:53, Gergo Koteles <soyer@irl.hu> wrote:
> > > > >
> > > > > Hi Ricardo,
> > > > >
> > > > > On Thu, 2024-11-14 at 19:10 +0000, Ricardo Ribalda wrote:
> > > > > >
> > > > > > +     },
> > > > > > +     {
> > > > > > +             .id             = V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> > > > > > +             .entity         = UVC_GUID_UVC_CAMERA,
> > > > > > +             .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
> > > > > > +             .size           = 16,
> > > > > > +             .offset         = 64,
> > > > > > +             .v4l2_type      = V4L2_CTRL_TYPE_BITMASK,
> > > > > > +             .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
> > > > > > +             .name           = "Region Of Interest Auto Controls",
> > > > > > +     },
> > > > > >  };
> > > > > >
> > > > >
> > > > > Wouldn't be better to use 8 V4L2_CTRL_TYPE_BOOLEAN controls for this?
> > > >
> > > > If I create 8 Booleans, they will always be shown in the device. And
> > > > the user will not have a way to know which values are available and
> > > > which are not.
> > > >
> > > > We will also fail the v4l2-compliance test, because there will be up
> > > > to 7 boolean controls that will not be able to be set to 1, eventhough
> > > > they are writable.
> > > >
> > >
> > > And can't it be that only those returned by GET_MAX be added?
> > >
> > > ```
> > > The bmAutoControls bitmask determines which, if any, on board features
> > > should track to the region of interest. To detect if a device supports
> > > a particular Auto Control, use GET_MAX which returns a mask indicating
> > > all supported Auto Controls.
> > > ```
> > >
> > > Sorry for the misunderstanding, I just don't quite understand.
> >
> > I guess we could, but we would have to make a big change in the way
> > the controls are probed today. uvc does not use the control framework.
> >
> > What will be the benefit of using 8 controls?
> > - Applications still have to know what those controls do, they should
> > not rely on the control name.
>
> Applications like v4l2-ctl are not aware of every controls, work by
> control type, and let the user decide what to do, based on the name.
>
> To avoid having to know each bitmask type control, they need to be able
> to query which bit means what and what to display to the user.
>
> Could VIDIOC_QUERYMENU be supplemented with this?

I believe that violates compliance. VIDIOC_QUERYMENU should only be
used on menus.
https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-test-controls.cpp?h=v4l-utils-1.28.1#n143

>
>
> > - Changing from lets say AUTO_EXPOSURE to AUTO_FOCUS, will require to
> > send at least 2 controls via v4l2_s_ext_control... I think it is more
> > practical and less prone to errrors to send just one control
> >
>
> Yes, that could be a good reason.
>
> Thanks,
> Gergo
>
>


-- 
Ricardo Ribalda

