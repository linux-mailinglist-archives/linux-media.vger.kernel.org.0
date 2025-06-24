Return-Path: <linux-media+bounces-35834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6764BAE7076
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 22:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D067717D74D
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A9F2EA47D;
	Tue, 24 Jun 2025 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKhFX2cO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20055170826
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750796128; cv=none; b=sg7RF1DU4HE9H9LU1h2l8haQuwwfdwUvIrIyyzksj8dVzsarWchMPs0XDHaMLg2UNhxj2khwbbWQ9La1udunJFuQSSTjckDBuWryo/DEt3CZXrqk/j7gI+RyhREVetzRIP/9psISJ6QL/k599CCwGwdowcIb+DSdUjY7AWjAA4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750796128; c=relaxed/simple;
	bh=tgFOP9xg0bsBES9P/YB72xm0Ih1n29+9F0fHmJIz6Y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBAYYkylUVPQ7aIOWS4K43JVDepOd3altOcURBlCcEV0RqVe7AJzQ2PjPviKJEN59ABgKFEY/59XUHspfElyfLUFmYTKrOh1Utme2yvnjp+ZyOdf1EM9ebtawaQ81o2RfgnvnaKDjcBQgHaZ2ahrnvnlaDp5Nney/S4rQ10sbf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKhFX2cO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d3f72391so52374085e9.3
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 13:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750796124; x=1751400924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BENinX+LAZkF8hnXZpL5JMpibB61vUCX8E+GdJqaI78=;
        b=JKhFX2cOldraINM/VM6ssJBfpBGxIQcXO5pUI2I8JaKiPESDdJnGVX0k/89Nr3mPSY
         WCuPvwXcUcG7x5koE58v6ZO/Cb7YKxgz8sPsIKFh0b5OpesdsS+ElYYnU2DgY4T8Ww5O
         FRyR6b4HVSJNezXAiV353DGRH7XpTHMSDcS98VC/7UBzjcyCKBUHRSn6c4oqqGNc+kYQ
         l4SxNPf/SLaePavI4EYApfaShtRGiq+tQNFCohEroINY6IgW9fxIxkZxxKqxJ+g00b+h
         WSxmN8+7zSwCdREFr4dFVs0jsrLyU1ciK8g43J7UjzJMjhbMQZ1pu0oEwBwJ6Oep6dfv
         4qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750796124; x=1751400924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BENinX+LAZkF8hnXZpL5JMpibB61vUCX8E+GdJqaI78=;
        b=wStWC15q9SH10hW2FSGbCOWamvnRGgdYhUIbcwrulE4XlukHmuQg9vuwZdHq8Dgzoc
         7g9E+HFqfzOmMMDCO2PuqABPU1IXIxQPLbhBvGgKTs9pMz9bXZNw8Yy9VtpIcooevplc
         3qq4Kb2/Mx7P33rRzbrXydkUkXWuk1sUeJMI8rYzL+T1rRA3BUHj6BbEyF6vD8C6KFrO
         Kry2GAFwwYn0K0cmuGHvCo2lSXQigT/DaRjjzuubmPyqkT0eBq3kIgLNVeLg0Vw0gVVF
         7GB7QZ/hc23qPTuoupvRm3Ty3CFjI4ou7PvlYVf1DVqscoGS+ctaSqgMFxtDzz0bozev
         dFGg==
X-Gm-Message-State: AOJu0Yxweej5P3zZE3U0VT+vJb9vxjXYrhcuxmoAnOhXUeowx7R0Xlz4
	uXRPQPTSWSJ0s8Biz1LOeG3YNGNSSprj4oMMhE7g+fV79WFrw3IVXrSGOq515tGjLwOJQO0/0AX
	DuyO81cJxwhSJqcSPG1PZOIxYZpmzkVc=
X-Gm-Gg: ASbGncsFLbRKkn7fvfQgUHJWdKTuuFEu4Almh2WPznBbtYA4wkY6Orwjc7eDYEB3q2o
	UQCnAFrqAT9pOm2hYwg22tLZotyO/jaUCv+9VDy8T4e2R8SVL2ZtdBMn7p7V+sut6q4McPTSmP6
	VkmcdouOoKo56KH7OiAfn3xLjrfl01KT5l4FmYdbuKQNufFw==
X-Google-Smtp-Source: AGHT+IFE2Hl7/JLPgSRrt4LMYVo8OfrXxBpEFDjZH97X5dBde3O/d+b6Yz8vOG16FevlrXGtzLDk4Y+HNuGMf7w681k=
X-Received: by 2002:a05:600c:b95:b0:43c:f8fe:dd82 with SMTP id
 5b1f17b1804b1-45381ae2520mr3387875e9.18.1750796124275; Tue, 24 Jun 2025
 13:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com> <20250619204712.16099-5-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250619204712.16099-5-laurent.pinchart@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Jun 2025 21:14:56 +0100
X-Gm-Features: Ac12FXyJYnVoCjqr9YTggj20NrjWlEKWfzPy1rChtiT9Y_cAne6HmxSO-bVmfHg
Message-ID: <CA+V-a8tGgycM7nsrLBuf8WEaPkiEj-r8qOFa_Ec4myLSga-0Eg@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: i2c: ds90ub960: Drop check on number of active routes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hans@jjverkuil.nl>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:48=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The subdev core now limits the number of active routes to
> V4L2_FRAME_DESC_ENTRY_MAX. Drop the duplicated check in the ds90ub960
> driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/ds90ub960.c | 8 --------
>  1 file changed, 8 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.=
c
> index 5dde8452739b..967e580890ea 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -2773,14 +2773,6 @@ static int _ub960_set_routing(struct v4l2_subdev *=
sd,
>         };
>         int ret;
>
> -       /*
> -        * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, unt=
il
> -        * frame desc is made dynamically allocated.
> -        */
> -
> -       if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> -               return -E2BIG;
> -
>         ret =3D v4l2_subdev_routing_validate(sd, routing,
>                                            V4L2_SUBDEV_ROUTING_ONLY_1_TO_=
1 |
>                                            V4L2_SUBDEV_ROUTING_NO_SINK_ST=
REAM_MIX);
> --
> Regards,
>
> Laurent Pinchart
>
>

