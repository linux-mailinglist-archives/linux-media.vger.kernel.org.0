Return-Path: <linux-media+bounces-20768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EF29BADFC
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 09:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 392831F22BA2
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 08:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A111AA7A5;
	Mon,  4 Nov 2024 08:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OMLzA/Oj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0855D189F48
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 08:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730708677; cv=none; b=jkOHLKRWfoocJABxFl2SdLso+/ZqZCWci1RjMI2hneoH/fvPm2HG2GYlYMqRvIjfCcpK5gCuozEni0gxjGjXqrAtcM+9htFyDac3UZvzQqNZrlmEnfA0vhcAvwZ/alCXgWpdCwvgYjKSxXZJ8Iwsx5+EqJi75fiUuGAWA9P6n4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730708677; c=relaxed/simple;
	bh=lc9kLc9MyPZHbwppXpopzUSobi4oLoI2ezZ2k/zgt24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oop+6ZQjDfC9qt37ofUk1BQq6Afm7UM7ka0JPkcC+PSfaPzW8qE7DyPij6AMqRS1jbeQM4lsXFJVGWOACvLqYxfky/6fRkndPfROx4w8Akx4kPnVkCFI02/UVv1gUBZGNGw8Xl7o1Qia6zOMxwN2n4acXfmMBpGwI/VlMEMBInw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OMLzA/Oj; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20ca388d242so37354045ad.2
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 00:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730708675; x=1731313475; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uRKNkWKURd1sDW8gZ3R3OM9Inh/3Ren2hd6xj5sygFQ=;
        b=OMLzA/OjoQmBzQg1Q7FP8BQE9ZlhzMqd0wNQZ/qOWwEKomzfbKZ2ZnuAIAzZ1SsWjH
         H+blokBstkkC54zyfo0cruw615PNrgsBCz+TmJN4VKPLuo+5ZIVQvI7LjYxFuWhUuNJl
         Tja0E14K/njiCqAYN4uqbrwAsRRTQps2CS+LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730708675; x=1731313475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRKNkWKURd1sDW8gZ3R3OM9Inh/3Ren2hd6xj5sygFQ=;
        b=D/9hPru80ouhr0uQxigFxzp9y+eZ3Cnp/Eop0rCCCnC+Nc8E8wtzvS0lQIp81wPoM7
         Gm03bwMoaJ5uP7pQeXg9CMaxoGvH13coHmtX7/6tHB8UnR68h8fjFewciHrdkPLH0xnh
         MKpLsGAkKfgpCaj4jTK392tM7B6SlPl0JooLp0565Dw23GzOgvl+GOjlWWfSAvu69fmd
         zn2D7wtSO0P2ddtOo8tvXlAHLhWtF8EUVj0nYwa9X86GeU9hegZ7kR13qkjvW9aNm6HG
         t+JC8CnrWV4XVx3LEb90zY5BUfuEEEHUaLbWrX7OiTZqAe8EC00ZKqJL8wsCqHXei3yG
         RV5w==
X-Forwarded-Encrypted: i=1; AJvYcCXOkr3AiSwjy0f9yE6vPuHBGPS1/Lxu0DbYFuPgWnF9gyqcEj+kMKLv5Ce5Ho1iUZmU4MA87HFf6gbhPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0YiCqqq1J3VYAjomnV/r1xZMx4N0SbmNS19z/Suf6LPeqluq
	6RiVlAMfODXC7EuhxstDg4tpW53Gj1rEFhsLWbA/KrpMyk6J4NA2UIRfJSSQTBZ2EhvbpgQX1qs
	=
X-Google-Smtp-Source: AGHT+IHjmBzOjUm/sBuMhuZbTf3WvPL765H20BllaxShztZd0ONtrijGNwww6sdvZoAZWcMOD49WHg==
X-Received: by 2002:a17:902:e74d:b0:20c:7898:a8f4 with SMTP id d9443c01a7336-2111b0276a1mr149272375ad.60.1730708675078;
        Mon, 04 Nov 2024 00:24:35 -0800 (PST)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com. [209.85.214.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d39a2sm56937625ad.241.2024.11.04.00.24.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 00:24:33 -0800 (PST)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20ce5e3b116so29380615ad.1
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 00:24:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPMV1drIXTuf18jIk2mxYu/h3VzMvRfzKBVbaLcxeB4OqxXL3uNQAkQaMshb+ipzI/OcjafulYoyAMEg==@vger.kernel.org
X-Received: by 2002:a17:90b:2d84:b0:2c8:65cf:e820 with SMTP id
 98e67ed59e1d1-2e94c298d3dmr17254693a91.2.1730708672989; Mon, 04 Nov 2024
 00:24:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCuPfmV-0KLrdnvVojvtLR=OsFUzLNhnqM1m_ytvzjoNOw@mail.gmail.com>
 <ZyJB4Kxn3Gm79_MH@valkosipuli.retiisi.eu> <CANiDSCvGTGo+O14Z=pL=CaZo-9DrzVJ-JwD5GG0Z=cJDTcUG4w@mail.gmail.com>
 <CANiDSCvMyp-13=4DUbau-2K5F2kURy3Mgvf-ZQxSqoAJ3yU93g@mail.gmail.com> <ZyKmjq0PnjwzS46z@valkosipuli.retiisi.eu>
In-Reply-To: <ZyKmjq0PnjwzS46z@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 4 Nov 2024 09:24:21 +0100
X-Gmail-Original-Message-ID: <CANiDSCvfakWvnZovm=t3Kwc2GXYtzym03cEfaYdzbFuqt7qhVQ@mail.gmail.com>
Message-ID: <CANiDSCvfakWvnZovm=t3Kwc2GXYtzym03cEfaYdzbFuqt7qhVQ@mail.gmail.com>
Subject: Re: UVC: Privacy gpio as subdevice
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Yunke Cao <yunkec@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

Done, posted as
https://patchwork.linuxtv.org/project/linux-media/list/?series=13893

and it is tested :)

On Wed, 30 Oct 2024 at 22:35, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> On Wed, Oct 30, 2024 at 09:47:17PM +0100, Ricardo Ribalda wrote:
> > Hi Sakari
> >
> > On Wed, 30 Oct 2024 at 16:04, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > >
> > > Hi Sakari
> > >
> > > On Wed, 30 Oct 2024 at 15:25, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > > >
> > > > Hi Ricardo,
> > > >
> > > > On Wed, Oct 30, 2024 at 02:03:18PM +0100, Ricardo Ribalda wrote:
> > > > > Hi Hans (de Goede, but others are welcome as well :) )
> > > > >
> > > > > Some notebooks have a button to disable the camera (not to be mistaken
> > > > > with the mechanical cover). This is a standard GPIO linked to the
> > > > > camera via the ACPI table.
> > > > >
> > > > > 4 years ago we added support for this button in UVC via the Privacy control.
> > > > > This has two issues:
> > > > > - If the camera has its own privacy control, it will be masked
> > > > > - We need to power-up the camera to read the privacy control gpio.
> > > > >
> > > > > We tried to fix the power-up issues implementing "granular power
> > > > > saving" but it has been more complicated than anticipated....
> > > > >
> > > > > Last year, we proposed a patchset to implement the privacy gpio as a
> > > > > subdevice https://lore.kernel.org/linux-media/20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org/
> > > > >
> > > > > I think it is a pretty clean solution and makes sense to use a
> > > > > subdevice for something that is a sub device of the camera :).
> > > > >
> > > > > Before moving forward, Laurent and I would like to hear your opinion.
> > > >
> > > > I remember we discussed this and I wasn't very enthusiastic about the
> > > > proposal but thinking about it again, there are situations where this is
> > > > the only feasible solution, including on raw cameras with a privacy GPIO,
> > > > besides the first issue you brought up above.
> > > >
> > > > Regarding the second one, why would you need to power on the camera to get
> > > > the GPIO's value?
> > >
> > > In order to read the control, you need to open the device, and once
> > > you open the device the device is powered up:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_v4l2.c#n621
> > >
> > > In a perfect world it would only be powered up during streamon(), but
> > > uvc is a complicated monster:
> > > - We have delayed controls
> > > - We have buttons
> > > If we only power up the device during streamon those things would not
> > > work properly.
> > >
> > > I think I have a solution for delayed controls...assuming the device
> > > implements the standard properly.
> > > I have no solution to support buttons :(. Luckily not that many
> > > cameras have that today
> > >
> > > Regards!
> > >
> > >
> > > >
> > > > I'll review the set.
> >
> > If you have time to review something, please take a look instead at:
> > https://gitlab.freedesktop.org/linux-media/users/ribalda/-/tree/uvc-subdevice?ref_type=heads
> >
> > Once I test that on real hardware is what I plan to send to the ML.
> >
> > It has support for the ancillary link and it is a bit cleaner.
>
> Could you post that to the list, with a note it's not been tested?
>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

