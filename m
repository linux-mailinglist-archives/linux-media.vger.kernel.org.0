Return-Path: <linux-media+bounces-5413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B32985A0FA
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 11:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D461F1F25746
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 10:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECCD288D9;
	Mon, 19 Feb 2024 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bptmoBWB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E125625
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708338501; cv=none; b=EJzI1V6Wu4IUHC8YQnCGQ/V+u9AH2c5pOqMtqqkxVRdP7ZYAp14FZwO+kNrVD8MVvWiKse8alaHDpj4kwUzAfCf6Vlt5vUq+c471FZZ/bVd5CI0isOgQgEBCLADFAinSTvF+7aRHDLUq9mQZdFur27WhXIKl0NHTT6QipzQFgLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708338501; c=relaxed/simple;
	bh=iYEBmJAiZbDHquX5J9zr+Y0/ZXalcfLXS+y4zzeLWyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZuXFbR/Lj4+Z/0iyU3l/4kRH9anR1qkREWUjiIZ+bf6tgv19b1oGpYHGHS0xL1dXtEDnxRdhH9hXJk0TUP8Ucg+X+LtfMFiYfvLUsY4gnP3ecHNsCXlrGf89NyAxZCR+lVdRWSsV8MZilSEN8xEUKTNS3YBOYYgPtwoTtDoSxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bptmoBWB; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-785d93d3f08so332390185a.2
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 02:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708338499; x=1708943299; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b6mgSrluIqEO45OZ9CPAhxzFHqfPHFQOqZgtTo0EQsQ=;
        b=bptmoBWBGk/sQeSf+XImIluL/QL+g4/z1Za/QRHZS6ZO5SzVOoOWosWHb3VD6fkhAf
         BAwz2ivSeX3mUWvKHjxh2XcszJV1ikzvVgkalVafcoOJ/KT//XSBwGnKCB/LjuVJwQJk
         hzOi9KlMKtveDme0wLezJQgXTnqe90Bv9CjV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708338499; x=1708943299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6mgSrluIqEO45OZ9CPAhxzFHqfPHFQOqZgtTo0EQsQ=;
        b=VLvX6rfT2dzjGLx1Vs7JO1yRA/DOn1gicWwhN2N/lofbDa/HvbZnZwjWfy8BRmBM/I
         zbYgf3jEBuExzIuQkTsO0kFz5sY0/jnCms77MbanxnORrhSaEJbBXOMgP2g7qUdkHYdq
         CPCcmo04goCbn9oQ3dWZigs7pq4pfr86yS6ygvYxxejVPcjXjSouVJiEJ79rDqwEk83/
         Dxzm8X8vSPYVVbpNZSNqlgrK3A8D96wHqOvwkn0oC8zpba1ezyR64Wicl258za1lDE9H
         DR5Isk+YdAhWRDyoi78JLYAKxFxB9PQhvKEmLVAEQ/mZyfIAfhr7d7ItBf+YMGz/BLRE
         G7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+k53GUhPgK91Z7tT5mUAB+4ZeJkCt+8XWk2yy/cSiavTWewSoAVmpKQxKx75frXPNxzL0TWcxw8ldzf2BEzkjlCjlcLMNCYytUIU=
X-Gm-Message-State: AOJu0Yykve5Eb4Yzo3X01hmf+U8wEXA/0m2VyHqKTbh/xHXbmNks3k1t
	zTSbCbmEpBLJdhMIHKqf+PKDW7aOu+7mPxtShf3Y6EFiJ/Bk092ljl3ykt634lqdHEX/Uo0cY+I
	=
X-Google-Smtp-Source: AGHT+IGt3LyrlNgtUp9gHZGGU06hJ/4oic/W79OH9o+T/KbM06eCAFonNs2oerorrF7yEEeeQzM86g==
X-Received: by 2002:a05:620a:2187:b0:787:1571:1ff3 with SMTP id g7-20020a05620a218700b0078715711ff3mr12168291qka.47.1708338498796;
        Mon, 19 Feb 2024 02:28:18 -0800 (PST)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id sq3-20020a05620a4ac300b007872d50caf5sm2333392qkn.19.2024.02.19.02.28.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 02:28:18 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-68f54a65ae2so6825916d6.0
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 02:28:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzAGcj/bPYkViIQUWSVBrBTR3YAiGGeZPGNef8nHy43hIr10QHzVqEhILxmdzAUjmGupV4k6WVtAiGnMDbvPvfWdTLDiVF0dOUz68=
X-Received: by 2002:a0c:971a:0:b0:68f:4d2d:3f34 with SMTP id
 k26-20020a0c971a000000b0068f4d2d3f34mr6594470qvd.39.1708338497675; Mon, 19
 Feb 2024 02:28:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220920-resend-hwtimestamp-v9-0-55a89f46f6be@chromium.org>
 <20220920-resend-hwtimestamp-v9-1-55a89f46f6be@chromium.org> <20240212225940.GA19316@pendragon.ideasonboard.com>
In-Reply-To: <20240212225940.GA19316@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 19 Feb 2024 11:28:03 +0100
X-Gmail-Original-Message-ID: <CANiDSCuoskaERyyzuLen+ReGHBNnOrFducbWYAvFQ6HfbUCPcg@mail.gmail.com>
Message-ID: <CANiDSCuoskaERyyzuLen+ReGHBNnOrFducbWYAvFQ6HfbUCPcg@mail.gmail.com>
Subject: Re: [PATCH v9 1/6] media: uvcvideo: Fix negative modulus calculation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 12 Feb 2024 at 23:59, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Wed, Mar 15, 2023 at 02:30:12PM +0100, Ricardo Ribalda wrote:
> > If head is 0, last will be addressing the index 0 instead of clock->size
> > -1. Luckily clock->head is unsiged, otherwise it would be addressing
> > 0xffffffff.
>
> I'm not following you. In the expression
>
>         (clock->head - 1) % clock->size
>
> clock->head is an unsigned int, and 1 as a signed int, so the result of
> the subtraction is promoted to an unsigned int. When clock->head is 0, the expression evaluates to
>
>         0xffffffff % clock->size
>
> clock->size is a power of two (hardcoded to 32 at the moment), so the
> expression evaluates to 31, as intended.
>
> Am I missing something ?

Take a look to: https://godbolt.org/z/xYeqTx6ba

The expression only works because the size is a power of two. In this
set I am allowing sizes that are not powers of two.

Regards!




>
> > Nontheless, this is not the intented behaviour and should be fixed.
> >
> > Fixes: 66847ef013cc ("[media] uvcvideo: Add UVC timestamps support")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index d4b023d4de7c..4ff4ab4471fe 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -732,7 +732,7 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
> >               goto done;
> >
> >       first = &clock->samples[clock->head];
> > -     last = &clock->samples[(clock->head - 1) % clock->size];
> > +     last = &clock->samples[(clock->head - 1 + clock->size) % clock->size];
> >
> >       /* First step, PTS to SOF conversion. */
> >       delta_stc = buf->pts - (1UL << 31);
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

