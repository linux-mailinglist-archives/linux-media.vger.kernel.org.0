Return-Path: <linux-media+bounces-23603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8709F4E26
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 15:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F8701889244
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 14:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51F11F6679;
	Tue, 17 Dec 2024 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJMIKtz2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9B61D63D1
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734446765; cv=none; b=tcvxq0Op7u8daJRLfX+vKbu+tOAC2KN+URAAdDxdPpHE8asl3FerBbl/85hZnlcCTmf9ONKCuEBYNxmIwremjZC61btBqLGNdpw6uxau+kC4dEkECJNsYbznDQxvstKSIi/kCzf12WkBxJ+sFcIBN0+ujjpa8uACPlxtKR96vQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734446765; c=relaxed/simple;
	bh=Wu7DTDsbXKmy88tF4m0guPgNq3152M6Y6h8uJO5bUus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYxmzY7kk+z8RD9vwKTBg4l3FGFxU/CrNdv8qorMGYOIlnWdvx40XcVlhJrYerwNpNA03zhyQPSCXd3osevcrPDjmROyDaHs0SJZrXubf5Wi0ysFeqmjO+ZuqWSJxoukOKkjFtIRhpgbpzgICL+G2FHJiYy0zqTEq2ZhmuFU9Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJMIKtz2; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so8994646a12.1
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 06:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734446760; x=1735051560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hSfUOElsXitezjy1dXq8+/6lOhD8rdC7smtAYIUGcHA=;
        b=kJMIKtz2AAkP5EHi59Fdcw0fXSA8fqjwexs0f4uM2Xt7hLnrTDyRP+eDjXz91zEJ4g
         NZyxV4239vyf9BrhIv98eykeBz1Lz6nw0ndrS0Xl+JIsywPn76mtk93LkDW+tf7ZdTjl
         vlJZ5IeNYxmqMzjoPMCyIToYQ5V0+ed5Y0a6GhPQtaZuVY6geqYLo9TdNnmGzZKyLZ8w
         Uad+6rnGerkoNr4K8/m758jc1eOGBTJsyuaJJ+/CGaVa85nZMBG4LIHJL7XyA9VDj9IR
         DFioJAW0gR/h9dURvL6E1lcXuuqehlhQWGNrrQxm/mFPhZOVNAf9bQBbp/WMlENjnmT6
         rC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734446760; x=1735051560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSfUOElsXitezjy1dXq8+/6lOhD8rdC7smtAYIUGcHA=;
        b=ubTojUyX85J6Ac7qW8bXxvuCgRVHp8WUdM/JPvS5kKXheuhWftt+oFl1tLaDRJHngo
         yAxkcaI/xE2xU3nM0eUQdXp5mZBlKb2RXXG/220R8dg0+4X0GYitehzmyzIrUM1a1ym0
         UH0DxWStgCXBlrlUUrYlCVCc/OYv9cUk9I8wpmDLK9R7m5DQNTSf4E4oxC4pCjSslyZ2
         GnJ5NIAOmJOzYYkmcUkM+Lf1+bnipN3ObjfwjT6am+M/EwHHn+MGi6/Q+KsRb0ta92RK
         cuoX2M8Q5AV15t1DB058gy7OOQHVG5kiqBGJScXXoz8F/cUQ982f4HdQApnKSaemKOrd
         yThw==
X-Forwarded-Encrypted: i=1; AJvYcCW2dyLEQ+bfSES1QESQBJHEyHOYKlpZArF29K8WXn3esEDClhX/B9LW6R28QmwnGR4WMCcPpV0WkgAYNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweMX3ZXbEY83MnnSSTUlv8uRnhYiadDTTfDBQuF4fhnBNlt8wn
	CVzMMsMeaKuwNm9+I7LPTAF8hrWoyHlwfmaaNc/wB/ZqcoYvP909fe9z/Azp7N8=
X-Gm-Gg: ASbGncvnjtMW4UkZszc15Tk+uTpeMQ32sOqlIL/dViLJjnL90i5p7qI5BoOcDOzJGYm
	+XWHIXpoAQkrMOoaP8HjEtmhludVYUEPl2KfJmt5yl5yXNoTvnKQuSS5o32QJoGNLtyx+flIGSm
	ddslXsG2Pptk4h/vFx783zR/CLnxkf6xmDJVRYMfcEz+6QPd8qcSikvY+DbVkLOWB6r4V0C8dmB
	hmLgzWAYcnU4JXV29nXN0DA+qw06/DOEoalMG49E9rLRikEReKhy00ym5DN6A==
X-Google-Smtp-Source: AGHT+IGzzQHESDzJMjhdA/lHTWrUTcf6ZxhepUn5ZqiGFAXcmkLz7esuTVIZdpuVBZ35qiTnq0hfNQ==
X-Received: by 2002:a05:6402:4348:b0:5d3:ec6e:64bf with SMTP id 4fb4d7f45d1cf-5d63c3dfee9mr15405316a12.34.1734446759960;
        Tue, 17 Dec 2024 06:45:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ab5109sm4345827a12.16.2024.12.17.06.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:45:59 -0800 (PST)
Date: Tue, 17 Dec 2024 17:45:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-core: balance the refcount in the error path
 of __video_register_device()
Message-ID: <48f2f4b9-2dbb-48a5-a09a-4a247f0c129a@stanley.mountain>
References: <20241214084853.1781426-1-joe@pf.is.s.u-tokyo.ac.jp>
 <7acd1758-1a3b-465a-b8eb-875a2f1cc18f@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7acd1758-1a3b-465a-b8eb-875a2f1cc18f@stanley.mountain>

On Tue, Dec 17, 2024 at 05:32:20PM +0300, Dan Carpenter wrote:
> On Sat, Dec 14, 2024 at 05:48:53PM +0900, Joe Hattori wrote:
> > When the device_register() in __video_register_device() fails, current
> > implementation does not decrement the refcount of the device which was
> > obtained in device_initialize(). Balance the refcount by calling
> > put_device() before jumping to the cleanup label.
> > 
> > This bug was found by an experimental static analysis tool that I am
> > developing.
> > 
> > Fixes: 5bc3cb743bba ("[media] v4l: move v4l2 core into a separate directory")
> > Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> > ---
> >  drivers/media/v4l2-core/v4l2-dev.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > index 5bcaeeba4d09..1e48778cd7de 100644
> > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > @@ -1058,6 +1058,7 @@ int __video_register_device(struct video_device *vdev,
> >  	mutex_lock(&videodev_lock);
> >  	ret = device_register(&vdev->dev);
> >  	if (ret < 0) {
> > +		put_device(&vdev->dev);
> 
> You're very brave.  ;)  I've looked at this before and concluded that it
> was better to leak.
> 
> For example, when this is called from zoran_init_video_device() via
> video_register_device() then the release function is zoran_vdev_release()
> which will free vdev.  So the goto cleanup will have use after frees.
> 
> I don't think there is a way to fix some of this.

I guess the way that vdev is supposed to be freed is that if
video_register_device() fails, then you're supposed to call
video_device_release().  It leaks some kobj debug code probably but
that's not life threatening.

regards,
dan carpenter


