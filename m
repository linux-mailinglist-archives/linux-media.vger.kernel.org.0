Return-Path: <linux-media+bounces-22876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E63C59E9275
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADA3F18860EF
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 11:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390DC225770;
	Mon,  9 Dec 2024 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eoXzMUnb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EB7223710
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 11:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733743897; cv=none; b=mEYB5092WWdbmjvqQ7uW0W/sTeoAm2G41Ad5fh7KjPc4C/z2kKW0r6d8OH29a1mLVNcDHooF8dRfGubPz+0OBMg1z7m0xSYTu54/970C8WDBgJpzBhQqZh5ZVVUhJCmGM8UliBzxIRMQQrCaUtE2LxkTnxQEDmJebFjfnoUYuYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733743897; c=relaxed/simple;
	bh=hi/gPHGp3GRpPNQ/sIelAR0TJU62VtzESITi0QHtWMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRBQ7u0G+rka08RVK3Z3MW7RdbsHAS9venAvu4mCEUCrWKM0b4T+NmDkFZzNKUQ3C/mGXzQQaVmxCmV5YQxI6aocy2T6zklt8AE2Nvze0twVS5CpatsgQBHud6OksgJ7CbbBdAnGMvNRM8ED+prg17t0Gxl/HZqhQNtXTP1yqNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eoXzMUnb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2164b662090so7179135ad.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 03:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733743894; x=1734348694; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6ym/ckWiJiSsbCHqxkCn87G8/HMB8USxigf1ElOERRM=;
        b=eoXzMUnbclIz5qHetlO56DtOaUEV8U8OXV9Roo+wNti0ligoMobwl8rmDKNWW4+10B
         JsfbdurJHIKn804HhB+NPGSTA46Q9RB5e3pqv8Vu6CKSk6CqyYhNvT2uyhm8+VkHLs10
         TDZ1s1MRwrPNQZQ4U9wWoqZMRSQITr4HrCFic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733743894; x=1734348694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ym/ckWiJiSsbCHqxkCn87G8/HMB8USxigf1ElOERRM=;
        b=Lm2U61vyfJDMxO2vWhnO+9NcfSgs+9ZWvVvrN04hyg1HJuoO01Yy/OzpbSguhkyKiT
         EyaGP8EYpIQ31rasX39yy8J1rJZurgrE4eRDbi6B1TTTBwlWlqfAp2NRVR36pLRwMzJI
         rrW5bE8J3PrfxeKRKISHjjXhYd45/v1NuCjadAVFHV+D0dSazeefpsz0AQ+m/o+WruuT
         GXljDmYP6EPFjuimEzk51iudzFvNBCuVK/SupvoTnDLs4BH2QIq8f4JvMplGzuMIE3JN
         QjJc/GedUFLUAZs4dD64CJNXsS0eDDNe/KV6NvWg2swi+qebgrMxAAmkTs2OvN+ft68V
         r5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXb3YUPLeOVkc81tsBu2TyuDNmug8iBjEXeCkKaF0EtuwROjtSYN8emNTv2f/uSSF01rm/cBIJ590DZ+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMz9IXd74j4bgDiKJQUau4nwPl/4Y7IlETwH4+abKxn+4U45vI
	nk+8h/+ykTeg4ZigKbYo6kt8BDTBnL/gt/LGbQAnH8pSapImqx1LjMDoODNlHKdK0I60JSIyfTY
	=
X-Gm-Gg: ASbGncs6brqOjRFuhILDNkApHOuj4uvwV7gaMusnWHtL2rwnypwMGZVdqli7821H5GW
	nEUaug6YlaOs9g+K5SKe1zQXbMznRJhFCErwzTN9GN8XZF2bTW8wMISQztRwL0zPIYQq5yYxhh1
	vMZs4IGzUK294tthw8aCjhp/qxi3bjxxnyAJSnJHpF6HTjJQXNmKJghcgd5fzPutzKdasRQhtes
	b61vgWdX0XnxrOb4e+8r+QnTjKMPZQgZlTveCS1ld/u/gTw6Fp56JKJ+H2dwHksExW6hjfQ+8JZ
	R7jq87VvjB6PC0z4
X-Google-Smtp-Source: AGHT+IF+GwzI9sYlcpFCRi/kQUOxFswjeIAv2GrO5kZjofNNopXYzwGWLowwhQDWPBi67qcqTQC+FA==
X-Received: by 2002:a17:902:cf11:b0:216:2a5a:89d3 with SMTP id d9443c01a7336-2162a5a8cedmr103670255ad.25.1733743894107;
        Mon, 09 Dec 2024 03:31:34 -0800 (PST)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e5f03csm70792405ad.66.2024.12.09.03.31.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 03:31:32 -0800 (PST)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso2354932a12.3
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 03:31:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlgj+6iwGxamstBiT7bI/MSAdhyhRTXJD9otq6+y1t4/8DDu0k/N7ibP3Nt3fcItxPJwqtcMS8yVwZiQ==@vger.kernel.org
X-Received: by 2002:a17:90b:3f45:b0:2ee:dd79:e046 with SMTP id
 98e67ed59e1d1-2ef69f0b093mr18851318a91.13.1733743892060; Mon, 09 Dec 2024
 03:31:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org>
 <20241203-uvc-fix-async-v6-5-26c867231118@chromium.org> <02a89566-a6f7-4feb-84c3-079795c98a46@redhat.com>
In-Reply-To: <02a89566-a6f7-4feb-84c3-079795c98a46@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 9 Dec 2024 12:31:19 +0100
X-Gmail-Original-Message-ID: <CANiDSCuPM1qeerMUBFx+RfqBD35CcfhQeO5hYVHh-ZeQ-4t9Sw@mail.gmail.com>
X-Gm-Features: AZHOrDl6MbSwc6Ip8YcLcxTT-qOq-bKVsjHj9biGhFd-T_bgQFW7J-G_3ijpnYY
Message-ID: <CANiDSCuPM1qeerMUBFx+RfqBD35CcfhQeO5hYVHh-ZeQ-4t9Sw@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] media: uvcvideo: Flush the control cache when we
 get an event
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 9 Dec 2024 at 12:03, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Ricardo,
>
> On 3-Dec-24 10:20 PM, Ricardo Ribalda wrote:
> > Asynchronous controls trigger an event when they have completed their
> > operation.
> >
> > This can make that the control cached value does not match the value in
> > the device.
> >
> > Let's flush the cache to be on the safe side.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Thank you for your patch.
>
> It seems that you have missed Laurent's reply asking to improve the commit message:
>
> "Conceptually this change looks fine, but the commit message needs to
> explain why this is safe to do without protecting ctrl->loaded with a
> lock."
>
> https://lore.kernel.org/linux-media/20241203203748.GD5196@pendragon.ideasonboard.com/
>
> Or maybe the posting of this v6 and that reply have crossed each other.

In this v6 I moved loaded=0 from uvc_ctrl_status_event_async() to
uvc_ctrl_status_event()

Now setting loaded=0 is just after mutex_lock(&chain->ctrl_mutex);

Do we need a new version?

>
> Either way please post a new version addressing this comment.
>
> Thanks & Regards,
>
> Hans
>
>
>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 3dc9b7a49f64..db29e0e8bfd4 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1622,6 +1622,9 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> >
> >       mutex_lock(&chain->ctrl_mutex);
> >
> > +     /* Flush the control cache, the data might have changed. */
> > +     ctrl->loaded = 0;
> > +
> >       handle = ctrl->handle;
> >       if (handle)
> >               uvc_ctrl_set_handle(handle, ctrl, NULL);
> >
>


-- 
Ricardo Ribalda

