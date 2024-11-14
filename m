Return-Path: <linux-media+bounces-21437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 348E49C933E
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 21:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BD34B237FE
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1810C1ABEDF;
	Thu, 14 Nov 2024 20:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IpTT6Wju"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1095318C930
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 20:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731616121; cv=none; b=NsK1TfcrEPUoRITqKA7c2hUOWiKGwclABxy3qJdyIDyeqiJtI2bUHDvue+RW/9cTM9OuMSc4+xuwCshjMMrD0ShybNGjOXfFFXFr66qrIvXofMxi2Z9dzyRr/PNe+U9OPMEavvT39nIZNWSlUgk6fi/qWkzQ55Xk66tWMThkLvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731616121; c=relaxed/simple;
	bh=w1u4Uyb/SQOcpw1mSQ6P4Uwc6enMvc/XYLFFajv2k1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DE8SFfRiX0t3DGBNW3dm6n+a/Ypdqr8PX16SSVATukUuTBZZDrc2DY295LPvTYZ5r+G8Ydaq8lZXsJLGDOYM2JGdF69l7LiLIIfzCJw/c4apAH/q9D+xxqozxfRJeKaESxYKwMZ992FzSf+tv4aQlaVc9mix10RbEORT/EvKkgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IpTT6Wju; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20cb7139d9dso12108245ad.1
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 12:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731616119; x=1732220919; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AkkLbiFPwWQ3xXOH74J4v3WAHG7SRFPdjEarBusMciQ=;
        b=IpTT6WjuHtWPd5RTZqe5JNEXBm1sfIt/iVbc5A5jtIjKuSJ5NYn0IGFWjf5ow4TPxq
         SwaFszwr/dwDMPph34/Hlj8BjnjyIbnwmZEpBs2rrppNKlSinuUc/hHwmh+yzKeOXbkM
         qSTafQ+zL5OJpzT5Fkxzm9kDIaHj0GRr7WbSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731616119; x=1732220919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkkLbiFPwWQ3xXOH74J4v3WAHG7SRFPdjEarBusMciQ=;
        b=uiXYee9M+F8+//etofFCjO/qpm3gYJcCavejYQDwAUlCvMLGI6hoWRGW++mp0oJOf6
         h3/lzCiZZp4k55ExOW9nZi/WPP7DGg8/QtQAHmVFdroOfv8WlkcmmMPvA0XhNS9DxJWL
         GLJT55dUWb0xQ9C1OobJhUggOJiPWPmj6HKLcgXFWLeua/VKzHLQ5dY6DnAtTUAFeGzE
         6xQQKd2mPRiI21cSOq9hKFpzLRI+rYtm7YHGvSVdcF4E4xPxPcy+3WY7xv+M3vHdLl14
         Tyaw4lhCvGO9idafB9jBN8vcIInXdfwIf82Z11nMbYl/36cGTgbGNpjSwpZAoVAIjO/C
         N32w==
X-Forwarded-Encrypted: i=1; AJvYcCXCMfFLduqtBptS5td3+Fd6Lem4Vb6FPRKVCW9UmTCGQEOStsT2eJtUXlqm3bcVNyjTdnO3VtujRQXi/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza9U9kpYL+ijYFmoukUgxxr53YIk8k8m3wqv+RIggwgd0BZsP1
	rLDXZQI2kM4yiCrlVktq2ffYmaGoI1fQvmHDoVwPZLfTAe6eWqbXosuUG0bPSKmFgT1xmJtUCw8
	=
X-Google-Smtp-Source: AGHT+IF3vZFfnP18WYFuIaYJYETkqWjHfXu3iaU0WsAYlCGaybZWsUKMd6a6VDusbCizg04hltKLIA==
X-Received: by 2002:a17:902:e842:b0:20c:9326:559 with SMTP id d9443c01a7336-211d0d8598emr2104755ad.29.1731616119186;
        Thu, 14 Nov 2024 12:28:39 -0800 (PST)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0ecafebsm355195ad.105.2024.11.14.12.28.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 12:28:37 -0800 (PST)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7f45ab88e7fso820295a12.1
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 12:28:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXcfH+2mQ3YGgSp/CcCN9J1BqkAR0lE6sOn3gGjNCxspNMHkYPbaTzsjj/GJaTPIUGjBby7viKu0caRg==@vger.kernel.org
X-Received: by 2002:a05:6a21:6d9c:b0:1cf:3677:1c4a with SMTP id
 adf61e73a8af0-1dc90b308ffmr73503637.16.1731616117054; Thu, 14 Nov 2024
 12:28:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org> <ac8ea4ed606cbc7dfb15057babc29e49a152ef01.camel@irl.hu>
 <CANiDSCuZTYDsQ3yCpFV_rhbQ+vFGJnsuU-jXwOacxZVbbzEPfw@mail.gmail.com> <5ffafb0d059f09c814692e7c33a7ce35ce9b0169.camel@irl.hu>
In-Reply-To: <5ffafb0d059f09c814692e7c33a7ce35ce9b0169.camel@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 21:28:24 +0100
X-Gmail-Original-Message-ID: <CANiDSCvP5eVuSGMi3R4eAkY2-ou=nqrTS1dnAv0Odbcq5UHa+w@mail.gmail.com>
Message-ID: <CANiDSCvP5eVuSGMi3R4eAkY2-ou=nqrTS1dnAv0Odbcq5UHa+w@mail.gmail.com>
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
To: Gergo Koteles <soyer@irl.hu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ricardo Ribalda <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi

On Thu, 14 Nov 2024 at 21:16, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Ricardo,
>
> On Thu, 2024-11-14 at 21:03 +0100, Ricardo Ribalda wrote:
> > Hi Gergo
> >
> > Sorry, I forgot to reply to your comment in v14.
> >
> > On Thu, 14 Nov 2024 at 20:53, Gergo Koteles <soyer@irl.hu> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > On Thu, 2024-11-14 at 19:10 +0000, Ricardo Ribalda wrote:
> > > >
> > > > +     },
> > > > +     {
> > > > +             .id             = V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> > > > +             .entity         = UVC_GUID_UVC_CAMERA,
> > > > +             .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
> > > > +             .size           = 16,
> > > > +             .offset         = 64,
> > > > +             .v4l2_type      = V4L2_CTRL_TYPE_BITMASK,
> > > > +             .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
> > > > +             .name           = "Region Of Interest Auto Controls",
> > > > +     },
> > > >  };
> > > >
> > >
> > > Wouldn't be better to use 8 V4L2_CTRL_TYPE_BOOLEAN controls for this?
> >
> > If I create 8 Booleans, they will always be shown in the device. And
> > the user will not have a way to know which values are available and
> > which are not.
> >
> > We will also fail the v4l2-compliance test, because there will be up
> > to 7 boolean controls that will not be able to be set to 1, eventhough
> > they are writable.
> >
>
> And can't it be that only those returned by GET_MAX be added?
>
> ```
> The bmAutoControls bitmask determines which, if any, on board features
> should track to the region of interest. To detect if a device supports
> a particular Auto Control, use GET_MAX which returns a mask indicating
> all supported Auto Controls.
> ```
>
> Sorry for the misunderstanding, I just don't quite understand.

I guess we could, but we would have to make a big change in the way
the controls are probed today. uvc does not use the control framework.

What will be the benefit of using 8 controls?
- Applications still have to know what those controls do, they should
not rely on the control name.
- Changing from lets say AUTO_EXPOSURE to AUTO_FOCUS, will require to
send at least 2 controls via v4l2_s_ext_control... I think it is more
practical and less prone to errrors to send just one control

If the number of autos were unknown, then having multiple controls
could be a good idea, but they are part of the uvc standard and
unlikely to be changed.


Thanks!
>
> Thanks,
>
> Gergo



-- 
Ricardo Ribalda

