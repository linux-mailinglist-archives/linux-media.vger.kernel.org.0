Return-Path: <linux-media+bounces-21435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B739B9C92DA
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 21:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DF3DB235A3
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D0E1AB51F;
	Thu, 14 Nov 2024 20:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="enVg3Di9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918281A76B7
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731614608; cv=none; b=axNF4xRhJiquRpEhpTF2XGZ//aUkYEW9qWujc01k6e23uGdMiJdGSknIbdnQlAm8ucCU89F4Jv18fBbJ+7lOXBVH++lY6w7y+2oauxG4xjhd4GNXS7BZSiuukbdit2dMLVEIWmO+1zsP5MeHMaJXvqDf+s33vusw0ogyDl1wP7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731614608; c=relaxed/simple;
	bh=uN4TYUcdBvZnUKjVY+38/YVjBDOaPDFntj12jx6Dl7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EuLU1Z26h1mXWesn5ncT2x7d4XoPBmP5ccXbZ1LtY6HKZrLJmC4IMH+11271FpzcdMtKmQG+d4eWpjOjgpmL818qMSs6+h249TJ6YLqDoFBcna1e+cms1bgo6PbqOvivd2clDD1eVi4rMKZ6C3WpUHjdZNZ2nVlYUH4KsGoaf5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=enVg3Di9; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so1013358a12.0
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 12:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731614606; x=1732219406; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LcJAM+PKYkMOtdwiCS7fBXkCHNwR9hFBAB9pRay23v4=;
        b=enVg3Di9saLevlCEnwuwkB7F72a5vUVWmt9RF2vfehsnBMVRp984iZR6kHINZCpFxJ
         J+R09vhGSf/oxcSBjUnmXyhcCGErI+yULZ4jEI9xUcH+AohUSgWJvVKj8V0kfIDzelbU
         /YPpKn6nVSLd5ctLZ3eMJZBaWc7Sgb4c5/L7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731614606; x=1732219406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcJAM+PKYkMOtdwiCS7fBXkCHNwR9hFBAB9pRay23v4=;
        b=olApsGxFjzvE5AiFzQQXzVOdtmry/6ZoSsEzfgZMgftV3z9FyCINsCO7XClwO+3ds8
         RRyWpaK70pZoHfmckfBqZGebuBzjsFGdpdiZN01LMZ+OEI3aZ03FucwWgKI74BkTSray
         6/199w9HsCGDpyVT4A2TvJiKhb0a0v6gclFydBYMCFN6jRnZPjpbeLD/sVq3eNGvCW7n
         4MxkvjMcHQwBGsCl4gf616o/MNuVmY9GsfDgf8p89OjebLGwyp9Hpn6Cbi6NfVI0GARi
         3S+y5VbfhHvWCNDmbrPOXT6sI1z3+8mK6s5JxDRLiRfaXAUEZ44CfpDSBsPt88+A+X7L
         Be1A==
X-Forwarded-Encrypted: i=1; AJvYcCWqLcQAsKOm9V4NUIzaVWFT40sRMUWhARqUxwqnUqHM5/QuwDYEYTpu8ZEOMDcQ98+VlFgC+a6Tx5F53g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu/x6P202g043ivEFVK/0Jml34Is3/sys7d4MLS1tfq1bxFvwe
	+RRQ0TJGAPtjFcRO2DGOQEw53V2XaUp6+c1f7RFpbdYXW2djXHQRSeR0Wh1XRLri2nWiLmzc0bA
	=
X-Google-Smtp-Source: AGHT+IHxqk/LMMk0OlsKi+BUFqx7qKsib1qA6aXaj4qN+0A+T415wpsop1nB8RO9uzYPjtloWeChpw==
X-Received: by 2002:a17:90b:3eca:b0:2e2:ef25:ed35 with SMTP id 98e67ed59e1d1-2ea151f44eamr296082a91.0.1731614605023;
        Thu, 14 Nov 2024 12:03:25 -0800 (PST)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea12c84027sm339704a91.24.2024.11.14.12.03.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 12:03:24 -0800 (PST)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2e6a1042dso864551a91.2
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 12:03:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOGLl7XGgNktQcAZpfCX/2Ax2FAlF5ge3Uob5Tub8XNc26ZzB+UzKBiqU+moIcglxDbwrQ8hwn8wG+zQ==@vger.kernel.org
X-Received: by 2002:a17:90b:3ec1:b0:2ea:1463:ee2d with SMTP id
 98e67ed59e1d1-2ea15582c39mr209304a91.33.1731614600666; Thu, 14 Nov 2024
 12:03:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org> <ac8ea4ed606cbc7dfb15057babc29e49a152ef01.camel@irl.hu>
In-Reply-To: <ac8ea4ed606cbc7dfb15057babc29e49a152ef01.camel@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 21:03:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCuZTYDsQ3yCpFV_rhbQ+vFGJnsuU-jXwOacxZVbbzEPfw@mail.gmail.com>
Message-ID: <CANiDSCuZTYDsQ3yCpFV_rhbQ+vFGJnsuU-jXwOacxZVbbzEPfw@mail.gmail.com>
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
To: Gergo Koteles <soyer@irl.hu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ricardo Ribalda <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Gergo

Sorry, I forgot to reply to your comment in v14.

On Thu, 14 Nov 2024 at 20:53, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Ricardo,
>
> On Thu, 2024-11-14 at 19:10 +0000, Ricardo Ribalda wrote:
> >
> > +     },
> > +     {
> > +             .id             = V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> > +             .entity         = UVC_GUID_UVC_CAMERA,
> > +             .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
> > +             .size           = 16,
> > +             .offset         = 64,
> > +             .v4l2_type      = V4L2_CTRL_TYPE_BITMASK,
> > +             .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
> > +             .name           = "Region Of Interest Auto Controls",
> > +     },
> >  };
> >
>
> Wouldn't be better to use 8 V4L2_CTRL_TYPE_BOOLEAN controls for this?

If I create 8 Booleans, they will always be shown in the device. And
the user will not have a way to know which values are available and
which are not.

We will also fail the v4l2-compliance test, because there will be up
to 7 boolean controls that will not be able to be set to 1, eventhough
they are writable.

Thanks for the prompt review.
>
> Thanks,
> Gergo
>



--
Ricardo Ribalda

