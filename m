Return-Path: <linux-media+bounces-20938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AD59BCECD
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 15:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CDD11F2332F
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 14:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA571D89E4;
	Tue,  5 Nov 2024 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tqggkqyh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364621D5AB2
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730815976; cv=none; b=V4VuZb4xsz4kjqi8ci1yxAOJe4nC341E9VnbTiUd+YMEHpQICBHukxzzr0WfG0bSONH7S5E9WfDN8xzXI82GwUnfXq7xTBKyvzz/T8GYARW+5ZbVDdAiHCRzXzbbT0FQWApCeetAPkGhhfndPw9i9hYIuw2U69UxpGC36p1zoBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730815976; c=relaxed/simple;
	bh=hUkwBIFaHgKGdSZE77G6VlJhtFjXldaYVov83tYixZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+DKdGLMRrRtzzA6ki79VdS4ZgKCMTuKBSGw6Y4tmvRMuySYe3rYJHwmhb0RVxqrqijwKnmb6h0lNEBmIvSfGwP2D/kXyqyB9jqS8NcNrvmLPNKIjADnCONuHrx3GNVtgJzC6bpVil6LELKQW9GtcYPnLb0POlccE5j3X9CDyug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tqggkqyh; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7205b6f51f3so4626968b3a.1
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730815974; x=1731420774; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d8Xdl2YqDUk9A0/HsJ2W90hRe4mWgrUkpYm3OC0EsMw=;
        b=TqggkqyhI7QV/dnUyCrjrCEmelGh2pfLJ1qiy1mlco7/ydp+5HqBQXMP1+uABxbRNa
         R2VSi0ZCxhcgZ46DAhQNJI+hCot7pG6X6yBlxK1bT4gAin0uCddH0HPIZRQaTa8eSrKl
         CbK4V/n+eQxDU/q5wG/ve3bv01flz6njhXwms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730815974; x=1731420774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8Xdl2YqDUk9A0/HsJ2W90hRe4mWgrUkpYm3OC0EsMw=;
        b=XRPAIXGZIFS4KcsZ1QF1ccmswqoBTBWM8877pOx6E+P0J23Bdzw/Ev3Q2c7L2NjY9H
         7dT806M0Ai5/lzYPsHn2r/NYuydyvrey217ZTp+gnbHB8voCOVAIY/4IHgK5W70zTyAl
         CquI4llM0DgZfXy7KHeXbeRffhkQ3XOp2wXkvfKwTyASDXZrP98TfUL0L5Gk8m7TNwxD
         19bmJxskRJRVlrHxAFMUrKuKRw8l6oLp7woJJT7wRHELHdG4vfrmfN74GtutFGPbtAig
         d5WA9GJiy1H0S+6y8MP2GagSR6gMRyZZ7dH1u1TQWeWVTdwfFg13R2RFZ6BA61nGqkTX
         puZg==
X-Forwarded-Encrypted: i=1; AJvYcCXXc86sX/8bLhpXyVXAJne7rYNTq8mRg2qmy5sv52UtOQtHDqO2MIoLOYlAI8Yf/QNPy46lwoBBqYYXKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze6bqgDGKrWFBT6hDWUG/XRw5GrIN57O/zkixS4FZkLhMiM6nd
	HKfWTzd78Hd516nwkwwWFQFOjLhDmAi8064TquGVzBaiPOXUK7PScrjmsZv5or/sr1+BHQ0Rl9w
	=
X-Google-Smtp-Source: AGHT+IEbkRGFXDkPOqkyuOlFM/sb7jXJzc5astHbrsHY/m7TZy3zvyTOUBMr9QQkliniSsKD2AODPA==
X-Received: by 2002:a05:6a00:22c5:b0:71e:e3:608 with SMTP id d2e1a72fcca58-720c99bb6e5mr21645273b3a.26.1730815974079;
        Tue, 05 Nov 2024 06:12:54 -0800 (PST)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc315606sm9635102b3a.192.2024.11.05.06.12.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 06:12:53 -0800 (PST)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7f3e30a43f1so1116051a12.1
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 06:12:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVL0KQh99ic5vTyj76IXjNqn2KumMn1Atenjj3Ogz4nm72QySeOs3hwdWeq2VY1gsHleyTjaS5IQaYfbA==@vger.kernel.org
X-Received: by 2002:a17:90b:2803:b0:2e0:7560:9338 with SMTP id
 98e67ed59e1d1-2e94c517581mr23012661a91.25.1730815972500; Tue, 05 Nov 2024
 06:12:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105-uvc-crashrmmod-v4-0-410e548f097a@chromium.org>
In-Reply-To: <20241105-uvc-crashrmmod-v4-0-410e548f097a@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 5 Nov 2024 15:12:39 +0100
X-Gmail-Original-Message-ID: <CANiDSCvC1T40ozrjsEfTQnnvE83YeSbELaO04027FR=FkpwD7A@mail.gmail.com>
Message-ID: <CANiDSCvC1T40ozrjsEfTQnnvE83YeSbELaO04027FR=FkpwD7A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] uvc: Fix OOPs after rmmod if gpio unit is used
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	stable@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi

Please ignore this version. I screwed it up when I prepared the set.

Sorry about that

On Tue, 5 Nov 2024 at 15:06, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v4: Thanks Laurent.
> - Remove refcounted cleaup to support devres.
> - Link to v3: https://lore.kernel.org/r/20241105-uvc-crashrmmod-v3-1-c0959c8906d3@chromium.org
>
> Changes in v3: Thanks Sakari.
> - Rename variable to initialized.
> - Other CodeStyle.
> - Link to v2: https://lore.kernel.org/r/20241105-uvc-crashrmmod-v2-1-547ce6a6962e@chromium.org
>
> Changes in v2: Thanks to Laurent.
> - The main structure is not allocated with devres so there is a small
>   period of time where we can get an irq with the structure free. Do not
>   use devres for the IRQ.
> - Link to v1: https://lore.kernel.org/r/20241031-uvc-crashrmmod-v1-1-059fe593b1e6@chromium.org
>
> ---
> Ricardo Ribalda (2):
>       media: uvcvideo: Remove refcounted cleanup
>       media: uvcvideo: Fix crash during unbind if gpio unit is in use
>
>  drivers/media/usb/uvc/uvc_driver.c | 30 ++++++++----------------------
>  drivers/media/usb/uvc/uvcvideo.h   |  1 -
>  2 files changed, 8 insertions(+), 23 deletions(-)
> ---
> base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
> change-id: 20241031-uvc-crashrmmod-666de3fc9141
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>
>


-- 
Ricardo Ribalda

