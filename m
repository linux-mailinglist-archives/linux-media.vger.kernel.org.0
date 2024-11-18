Return-Path: <linux-media+bounces-21548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BFE9D16E6
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 18:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44D9DB243DE
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 17:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA611C1746;
	Mon, 18 Nov 2024 17:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MVX7hCDT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9EE1A01B3
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 17:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731950208; cv=none; b=T+szQjygaW01Lq+OFK7KYx+rLOFHxBLvhMlWE7byjStPEWE+FbyibaowFRjusptzy/u3r8dNa6+I72OtopnGwojTbxVCwBYFHBRwE53FdguBlXmIs1JdW4lB3tCYMNTxXH0xmEBDF5HY8rtQR/M1eZrFBipk0d2f1bATnkne0YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731950208; c=relaxed/simple;
	bh=kV6pfRr3oUtEv+dKqYa+de7WCNOzSF51LX4T/fVCxt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyJ6kLNxy6qx4jzEcnaNLQZWl46yDX/cNJhlhNT1TbwtmF47fvLWSAWMrmZVXIZxCYwsu0jwbImSV8trybUui7TVsh0P0h5mo1Kn1A1pn7AK6gvBe/fxF/AB/nZ4iLnkbvY5eRFv5ZoJTgT3Gjd3bT2xd1m1bB1MdgJwOYeQ2tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MVX7hCDT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20cf6eea3c0so41773125ad.0
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 09:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731950206; x=1732555006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ki1y1CRvVemx6jfa1qtaoOBkjZCgQXTP4f88zxjQDaw=;
        b=MVX7hCDT6XyQvEKZpPegLweANmd3i1V9moZ4cpP3R8FQcEM6WL0eTovtMe1mWJ6M52
         OrY3t9T9nvcohew0/qpYmK2361TUUaQWhpfl8ZOH7tbaApchRyUBydvlG4V1WTj9XJWf
         4wOza8SAlasi12m0v5X3UQLq7f404MrPhb/qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731950206; x=1732555006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ki1y1CRvVemx6jfa1qtaoOBkjZCgQXTP4f88zxjQDaw=;
        b=GRMBAsmU50r8Y/m0di7tMoPKI6G0KI9O8HHSD+10wgfleP/TkxwqeFeC+sTN/qUhbY
         patm7WWRgMVfCtYi7uyK58MDV7LtN1kZgCur9ypPcdcF8dAUfKJ/sjUHosF0V1t4ooCK
         vmYKPo9lkL1TxdAaXY5nG5lYtHMwa83F6LtQenM+sE3f1o8N1FQwRy+AFrvOPsKrMwLv
         LJEmJ2Ni2Ceew+6uDFlmc25RdaBljc2Hh+vrE8hjptv4zhO9hiPNdqo5Usd+X3cxmW/u
         u59zvKDrYvi5mLv3oiTJAm44jAwNCtEClT3GNQz79zcoP7gIRRdIlD1ODwG/Cmrek2GE
         CYKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpjGhRzqLRk+EOVaQrGs+SlaD3Ygdh0vwQ7LryLthlRuuZI/rNgVs3sK/35opH4+7RLwnPZuC6zWyBSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxdu4aVV6pTBALqgU2jCA40h0rcQt9dpvpggYiAiwQboELvmDW
	ekCQUIW3eoUYgK3fKZHuqKBuz63uamk+fWr4qJVZ9JUkG8j4nmLvv4vgCqtcOuvzloLqv5nQMdg
	=
X-Google-Smtp-Source: AGHT+IHkJcTytjNYdJ4vPPfoN2v6764VyqZQOyxbeKJfwaPOUD0k2T0XRH/Anj9uJaROoL93oemvGA==
X-Received: by 2002:a17:902:cec6:b0:20c:c704:629e with SMTP id d9443c01a7336-211d0eed4b5mr191976315ad.56.1731950206364;
        Mon, 18 Nov 2024 09:16:46 -0800 (PST)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com. [209.85.210.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770ee90dsm6484021b3a.19.2024.11.18.09.16.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 09:16:45 -0800 (PST)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-720c286bcd6so32173b3a.3
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 09:16:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPyAuJw49bZYR09DLUOrTDa+7tDLaNCSTB0zvXL/cWO+5tmIpkvKESItvVd0NFeuoRIY65BiSi2tsjjw==@vger.kernel.org
X-Received: by 2002:a17:90b:4b82:b0:2ea:853b:2761 with SMTP id
 98e67ed59e1d1-2ea853b2895mr3850305a91.37.1731950204454; Mon, 18 Nov 2024
 09:16:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-uvc-readless-v2-0-04d9d51aee56@chromium.org>
 <20241008-uvc-readless-v2-2-04d9d51aee56@chromium.org> <4ce7cac7-6e4a-45b8-8d0e-a8f16a77839f@redhat.com>
In-Reply-To: <4ce7cac7-6e4a-45b8-8d0e-a8f16a77839f@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 18 Nov 2024 18:16:31 +0100
X-Gmail-Original-Message-ID: <CANiDSCu_-sy1XyEAPmoGELbzamO01UdA5-Dj0PCkOBeFUS2hbg@mail.gmail.com>
Message-ID: <CANiDSCu_-sy1XyEAPmoGELbzamO01UdA5-Dj0PCkOBeFUS2hbg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: uvcvideo: Add more logging to uvc_query_ctrl()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 18 Nov 2024 at 17:45, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Ricardo,
>
> Thank you for your patch.
>
> On 8-Oct-24 5:00 PM, Ricardo Ribalda wrote:
> > If we fail to query the ctrl error code there is no information on dmesg
> > or in uvc_dbg. This makes difficult to debug the issue.
> >
> > Print a proper error message when we cannot retrieve the error code from
> > the device.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index f125b3ba50f2..6efbfa609059 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -111,8 +111,12 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >       error = *(u8 *)data;
> >       *(u8 *)data = tmp;
> >
> > -     if (ret != 1)
> > -             return ret < 0 ? ret : -EPIPE;
> > +     if (ret != 1) {
> > +             dev_err(&dev->udev->dev,
> > +                     "Failed to query (%s) UVC error code control %u on unit %u: %d (exp. 1).\n",
> > +                     uvc_query_name(query), cs, unit, ret);
> > +             return ret ? ret : -EPIPE;
>
> Adding error logging is always good, but again please drop the change
> to the return condition and stick with the:
>
>         return ret < 0 ? ret : -EPIPE;
>
> pattern used everywhere.
>
> Also in this case the return condition change really should have
> been in a separate patch since unlike before the success condition
> did not change, so it really is unrelated to adding the error
> logging.

It doesn't really change: __uvc_query_ctrl() in this case can return
1, 0 or a retval.
But I agree, the change does not provide anything (and I did not
mentioned it on the commit msg) let me restore the original return

Thanks

>
> Regards,
>
> Hans
>
>
>


-- 
Ricardo Ribalda

