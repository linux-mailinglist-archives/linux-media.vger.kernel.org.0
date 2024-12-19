Return-Path: <linux-media+bounces-23771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 806B69F7719
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 09:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A4271887CA3
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 08:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15046217661;
	Thu, 19 Dec 2024 08:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k4pvj25q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F57A21639B
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734596326; cv=none; b=fMLws1akJqzxXHUmO06gEYgJtxZGDYJjlrJp8sLF7y42EW7BtIuEeA/U11GhU94OrytLqypfZBEOgIfb9q57H2usw2oOLpZc2QTpibiJUPlDGLEHSSorlE9rQxoP1kpDQct2AjGNmSUzkV1v5L3ndOZpQbeouzVmVTta3Cwl9Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734596326; c=relaxed/simple;
	bh=e3pmWViP70g7Y9xju3ghI4GtzT5vgXe8fQq2xFfvHZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LCsHUtXokP2fwTsMy7ZG3rOMWw8wjPfZ2gWX6UW6glt+zm30NvcY13mslqtya9qnaETG6QjYnK+2iati+g/d5BpAqbjoQXYBZOoQkSeMH2td464P0VXMQEuqoXCoSFyUX8hfUJbVbzGkRQ5qRDm3tOvHrEFyUD6I8rqkUCowl9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k4pvj25q; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-725e71a11f7so1256108b3a.1
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734596324; x=1735201124; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J8JCDHIS1FPtNzCTP8Msc09e5dd6iMN/E7+fWkkygAA=;
        b=k4pvj25qey10uP0qhTSMQl9JzxyM4WqYa0yxNxF5aHyFgKfFmHU/XWYz9Mg8svVxZC
         e7UOEddUAjAVmHxWnC2Lju54ph3wbXSbO2sADao0cs+HLCeHqfZdM71qhFgTjmy0Nlkf
         TTouhIorEU2dF6aD+hK3Rgha513eDzvpIGJR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734596324; x=1735201124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8JCDHIS1FPtNzCTP8Msc09e5dd6iMN/E7+fWkkygAA=;
        b=X7iRcYcO5eT/7IXTlKG1c4S8Ek/JFGLVzSs6DxjP94g7bUr0dxUJKQqHSnvZ0xV9Oq
         L2u5hXsh5z9qIbkNQ62XXU+zThRlYP05MgGxY+ybS+N5byYTXTsyMa87dGCotN2xKbVi
         wUwddzUnTmY63grov5Pv3enk8vjAp+ao+PJGRxJKPYD7269lE81X2wMXURLIZuwqyBEA
         GiD5ys8ckHkAeSjv8f5vDC8z7Bu6tSgM8snZsGfnAYN1q7qVsRZVe78+Jzx/Fz4/zMbL
         MuH+cRxzMYP2dHKsTfDpUCAdJmsUZMCHwhCfO4J5EtCxkVyCgbeSd0jSmR/+f7qujeKw
         Bvdw==
X-Forwarded-Encrypted: i=1; AJvYcCXxg1QVaCF7CPRFLt09BJ4k6UIO3eeFWOMH8gc2+Qq1ESCdITilZk/+0UIshABWlZptx1uFeJF590bZig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTQs72pWsEQdYzIrcST1uuzvCOqmlZukjxirgoow58mgPGTQba
	e53RFeyAY9KQNBx5ZYTt3l+s8rOFyTdLq8LcxV96hHcucxUsSk0ReTvGYgjBTFAqcvNuZa8FkQg
	=
X-Gm-Gg: ASbGncuikY9XZb+Afq+T4q5RDoAYkns0GdF67j9WNT2vBzpSnyZQ++em8XPHQABeefO
	rRMoOx9zw6vX2EO2pza6iXII2COG8kCWGK9VHZIxb8H9xOAks6LgdyFmQRKECO1J+beTAY2EiXK
	J1UPbTQeTtfE6ZiT44EVMZIK6vK50nf1jkGAcrY9Qn/CmSeoi9ubTi4zKT8sVl7QQhCSzOJ/I+i
	VfDMoObeKk2bN+xKyaQnqkbgWlmH3U88ewemFSL3xTEwWlOMpHhgn4KjdSvZBhdXn1MnKC6rv25
	WOZaDouNTGmgJ304L9o=
X-Google-Smtp-Source: AGHT+IHJVvV+5cF5MMIDkRgfbvC8OSm5L7oI/JufUR4VGU93sx8cu/T6UYHC5LFVec6xm7HmsBY0ZA==
X-Received: by 2002:a05:6a20:258c:b0:1e1:b023:6c89 with SMTP id adf61e73a8af0-1e5c6fd3ce4mr3355852637.15.1734596324143;
        Thu, 19 Dec 2024 00:18:44 -0800 (PST)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com. [209.85.216.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e89059b1sm551490a12.86.2024.12.19.00.18.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 00:18:43 -0800 (PST)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso1323844a91.1
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 00:18:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDU/xqIdItQrg2cPFWpEC4dyE4CNBkrrqh2olmtwTrDV0m8eajPD2eM0JUVNeWWFeknUchrDc1lh5Dcw==@vger.kernel.org
X-Received: by 2002:a17:90b:254b:b0:2ee:d9d4:64a8 with SMTP id
 98e67ed59e1d1-2f44336f4femr3863201a91.0.1734596322431; Thu, 19 Dec 2024
 00:18:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org>
 <CANiDSCvL_C5mgGoXz9zWjJA7fXizM751hjm5jadWsRiymTRYsQ@mail.gmail.com> <20241218232838.GG5518@pendragon.ideasonboard.com>
In-Reply-To: <20241218232838.GG5518@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Dec 2024 09:18:30 +0100
X-Gmail-Original-Message-ID: <CANiDSCtyRHgxOkEMYTi56AhoWS7xjskU-BMvGxpeJ=XBNJ=okw@mail.gmail.com>
X-Gm-Features: AbW1kvaWh9yQCz1Z7l_cuUn_dRenbTPMl8IPgYt7gNlD9P4Wp9OnKkZFW-WXvIQ
Message-ID: <CANiDSCtyRHgxOkEMYTi56AhoWS7xjskU-BMvGxpeJ=XBNJ=okw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Filter hw errors while enumerating controls
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Dec 2024 at 00:28, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Dec 18, 2024 at 03:38:34PM +0100, Ricardo Ribalda wrote:
> > On Fri, 13 Dec 2024 at 12:21, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > >
> > > To implement VIDIOC_QUERYCTRL, we need to read from the hardware all the
> > > values that were not cached previously. If that read fails, we used to
> > > report back the error to the user.
> > >
> > > Unfortunately this does not play nice with userspace. When they are
> > > enumerating the contols, the only expect an error when there are no
> > > "next" control.
> > >
> > > This is probably a corner case, and could be handled in userspace, but
> > > both v4l2-ctl and yavta fail to enumerate all the controls if we return
> > > then -EIO during VIDIOC_QUERYCTRL. I suspect that there are tons of
> > > userspace apps handling this wrongly as well.
> >
> > Actually it CANNOT be handled in userspace.
> >
> > If we return anything different than 0, the structure is not copied to
> > userspace:
>
> That could be fixed, we do copy data back to userspace in case of
> failure for some ioctls. I don't think that would be needed though, I
> believe we can either mark controls as broken in the uvcvideo driver
> through quirks, or in a dynamic fashion.

I'd rather not introduce more differences between uvc and the rest of
the drivers.

the ctrl framework only seems to return -EINVAL or 0.


>
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/v4l2-core/v4l2-ioctl.c#n2929
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/v4l2-core/v4l2-ioctl.c#n3490
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

