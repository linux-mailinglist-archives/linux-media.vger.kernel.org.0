Return-Path: <linux-media+bounces-26636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB284A3FFE5
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 20:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7785217A58B
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 19:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B5A252907;
	Fri, 21 Feb 2025 19:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KS+Wo2gK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C841EEA56
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 19:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740166854; cv=none; b=LQgAj47lSVc2xAb21qPMR1cdG36QM5v9BkTe1dXwp7m7G6zxrS1XxYnW5meCIxIkSYcimAZBHaIsIUpZKgGCOo/GhkCljdM4/pqR4e25N2ypwg7B5L3VuOY6urg8mXOX1pSMZqyHJEAztYhiCXBfMy6LqQ90CThUeHQLNaqyLkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740166854; c=relaxed/simple;
	bh=qQJGApAF4zrpcJgC+gSQ//5Q6sWe25mMWgMWBK484/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YaSk16P4bJ9Eq3mxqojbQ6JiUEHefrDprGWq1uv0HqrFdgXYy2qMsWlNbIucAmmue01kpzWo69xS+3x+/bwOpJXxZZ13LJWWuiPY6cGPyUSyueHtLcImvChCBojJ3uBF4zEmvtEKF+FtVVV3+S9ynNaNw5mCWXTfvcGN17kkGqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KS+Wo2gK; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e5dab9cd918so3166193276.0
        for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 11:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740166851; x=1740771651; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xPZz9ULchBOM5dOePC40Su2DJgOAZjB9+GW2yfEAxwU=;
        b=KS+Wo2gK922oUsXhmsKb69eUeKWGEqQHieTjNaMlQjJFlZ4+QOr2DNceuD5vo4BeaA
         0AH69cOZdAnUsDzXP/ZTgZer1EJB9j1QhuuRLMIzx1GcBGTJbkXHfnU+bsSAVkxn2n5p
         4ZZ8xA1TXl4nRrnVd6D6KuV5z2T5T/5p0RxaBmzdhTnBMjiCh4V0gUYYnWdiVgONbO4m
         1XrNXV2c2Oe5cUG9sPT1LS+UcFkH8ieG9aF29nN8q1J1fPeEG/uZjzDQsvY0/JUisdvK
         b/MiCMgYPQ6SbqhSZBWG3kovtJGvnEb6d2ltmFDSQP9EyupBz2RWLxTpwdgcMaIKEnC1
         KSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740166851; x=1740771651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPZz9ULchBOM5dOePC40Su2DJgOAZjB9+GW2yfEAxwU=;
        b=bocDsmlI33R8I/cx4rGw6K87rSFqyjZEaV1oMCkd8At/BcQU5ptwcPCik0k1mY1+Ao
         XfNFPsSS5TUFaKUMA5P6RxZtEjrUqoaa1foutm0cyrvW2/pYGP6tbg2zjeNzY/dgazgO
         KpCfckBbDK2xbSNJF9OAoqTA9J0oqQg09kVcHPUdxvbck+MAEIIHZyASqDX6eJ+HemDN
         Fb0wU3kO7WXFDxL58s96tpEaZGBlzCZhT/S0SMLYvuUqOHVtnhqzVpLk351WOtod6fJq
         cNUtbpz+XaQr6KSuCqSmmTZQ3dBh9USMLKBbozoSXGtmVI5PXAT8qMIWAsMO8E1d7meA
         0m3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXK0GYu6fXjBI+dgzDkgu1FIkim7a+0642RjQPO4Gg34UK0rxnVH/MPdbD837NB8OmPwk11qRzIaN5x+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOF4p9kZTBFRodcw6Ka7d02o2W9Nuq145WAvVawyCfI3/QF3rP
	gD67LA+ftvacbEo+NfKIdoT1ot5+ZSVNjYDkzq+xQpGmbkmYE+ylvmEUG/W+aTOiJVYly9x43zY
	QkQngzrAG4mDelQGpMNS9AjYVoD4HuAnaOy22/Q==
X-Gm-Gg: ASbGnctnuiG5eEjYhkmPI4kftDYxSnmNVc71Rk/mGTIlOT/voobzPmMt4kxDtFfoGUM
	6XJY1XJ6UWY8quw8f3/74mF7/pxcgwjgibbwdlvm8T+C3iXEZa+AqElnLyEAxFX+z/c2sP+t6dS
	ye8OJSfkxbglu4il0I0lONTQ++bTWrmoYvsNFJniA=
X-Google-Smtp-Source: AGHT+IEyxCLNRttuo0uDO3VhLlk/R75J1rU5eT1mDBu1NVxB54wKeG/GJCTZVLwmIqDJzx++hZJObrJ3XatjODazKSA=
X-Received: by 2002:a05:6902:1027:b0:e5b:406f:3b02 with SMTP id
 3f1490d57ef6-e5e24883193mr3880649276.12.1740166851619; Fri, 21 Feb 2025
 11:40:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221162358.53913-1-kumarkairiravi@gmail.com>
In-Reply-To: <20250221162358.53913-1-kumarkairiravi@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 21 Feb 2025 19:40:31 +0000
X-Gm-Features: AWEUYZkwZymW5Okm554Xf4g6za5wBxYH1umaXLW234z_TtZ8U78puT_42qtzn2A
Message-ID: <CAPY8ntD6t+=apmNkrmiQZmoxYJ=wzqFAZrgH07xfNvMx0VxLXg@mail.gmail.com>
Subject: Re: [PATCH] staging: vc04_services: Fix function call formatting
To: Ravi Kumar kairi <kumarkairiravi@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-staging@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ravi

On Fri, 21 Feb 2025 at 16:30, Ravi Kumar kairi <kumarkairiravi@gmail.com> wrote:
>
> From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
>
> Adjust function calls to avoid placing an opening parenthesis at
> the end of a line, improving readability and maintaining proper
> kernel coding style.
>
> Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
> ---
>  .../vc04_services/bcm2835-camera/controls.c        | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
> index 6bce45925b..d00d910989 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
> @@ -533,17 +533,15 @@ static int ctrl_set_image_effect(struct bcm2835_mmal_dev *dev,
>
>                 control = &dev->component[COMP_CAMERA]->control;
>
> -               ret = vchiq_mmal_port_parameter_set(
> -                               dev->instance, control,
> -                               MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
> -                               &imagefx, sizeof(imagefx));
> +               ret = vchiq_mmal_port_parameter_set(dev->instance,
> +                                                   control, MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
> +                                                   &imagefx, sizeof(imagefx));

Is there any reason that you haven't moved control up to the previous line?

Media drivers still have a strong preference for a max line length of
80 characters[1]
Your second line is exactly on 100 chars, but can drop down to 92 by
moving control.

[1] https://github.com/torvalds/linux/blob/master/Documentation/driver-api/media/maintainer-entry-profile.rst#coding-style-addendum

>                 if (ret)
>                         goto exit;
>
> -               ret = vchiq_mmal_port_parameter_set(
> -                               dev->instance, control,
> -                               MMAL_PARAMETER_COLOUR_EFFECT,
> -                               &dev->colourfx, sizeof(dev->colourfx));
> +               ret = vchiq_mmal_port_parameter_set(dev->instance,
> +                                                   control, MMAL_PARAMETER_COLOUR_EFFECT,
> +                                                   &dev->colourfx, sizeof(dev->colourfx));

Ditto.
Moving control brings the second line down to 81 chars.

  Dave

>         }
>
>  exit:
> --
> 2.48.1
>
>
> _______________________________________________
> linux-rpi-kernel mailing list
> linux-rpi-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel

