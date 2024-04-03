Return-Path: <linux-media+bounces-8589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1126B897A3A
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 22:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB57F28641D
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 20:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D5815665A;
	Wed,  3 Apr 2024 20:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="njFUKIJG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C654D1E493
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 20:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712177163; cv=none; b=KQ+/a+2stQERNvdyuVzOcl1zcRaeQxLeTMw6fq9crxk8uuiHJjd3sazXMr+ZQHlbpvIbEHs5fhSUEQ4jnxnT3FdyFFckc5rfNZCU+TKZnx9kwSmUw92AR9NZrhwPTHRZkYi1zHWPjh90paqsJkY0mZq4SKnP21GxQy1CL4PptIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712177163; c=relaxed/simple;
	bh=5qSG2aA7zP86uqE7QONcq5Fa+fMoEGvSuBVv5RvKfgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndkiPI7d1dAW0lu9bD47O/LAUovIUU3iNrTS2bbYN2+ozLF4Si/iIFq7V14q3usvwy8jb/CAWkbVaD7deNWaCWSsuvP88IJ1U1Sc/J/2gIwkklevVtMyYGA//SSTT2kd5gL6+m2qQKioYMlg5bx20X7csiv/6SPtPQd+SrHXQNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=njFUKIJG; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56c197d042fso270280a12.0
        for <linux-media@vger.kernel.org>; Wed, 03 Apr 2024 13:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712177157; x=1712781957; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=itlV3Ei52sbNGGLJPwsBC3H98Sks2mSob1+Tdb5KXBg=;
        b=njFUKIJGIalc2XIpeE5TB7u+0LgeWwz80KvzMKeOUZCAJL69eU85F4tS9NC8gJsnbT
         0BnndwAr4VfKlOKaHWBYpHcn9DrSO3OEtdMds32WWDAgMrhXMMATBefGtvpVLMdzAo2r
         +GpfjHRuf9iSVt0YywSHTkCShlc+j4IOwjg7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712177157; x=1712781957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itlV3Ei52sbNGGLJPwsBC3H98Sks2mSob1+Tdb5KXBg=;
        b=Lxvb8uq0OFBD3beZnOsWD9Pc4lm1BBHxgxx81UdHYohD+1wcrPHfm29QF9dsW8IUqs
         RvEsqn5CM1l1jAldxPWmWIgbffkQGn17ZynNuFVFjRiwbMRERM6Kbtvp6BoY9Qj8I8oQ
         ZKQgdjbXxsxY4cu89dOyRMwzqzZnzfov2ShNoQJuzIwTuwBXnLia0+exXpTI5nukY5kf
         QsTFSgxgX3cgn0eMG1d9ZxBSJ6Gy86SL7VCXqpxWRyTVWZkIIMJ3Kd0udPo1dHUfeweA
         bU2y7L8O8IHcjoek5N7Vh06KO/jWBUJjRe5dT23BIBHL1LkTdNujdJkgzpWspaqDn9ku
         T/uw==
X-Forwarded-Encrypted: i=1; AJvYcCUtMGtOK6vqzvqxz0BCqg5qru2LHiZxN5dDYX8krLcE2WbLpxjCVu2NPO0BntKeWjohlWQCDbTWBsXyH5sxoit7ffVkWlw/tGfEK4A=
X-Gm-Message-State: AOJu0YyU5oks/3Ky2tDHld2Uc//drqCCdXlD0Grd5J96pDMK7qQknw5L
	LDiRJOcWtH8KQ0TncpEZ2SUbxVCqniYhmsKjHf5/A93N+8fseoc4YlqyahCVJ+0Msi1XcduQF1j
	j6Q==
X-Google-Smtp-Source: AGHT+IFZgiFsoCeqIQ7M3EHNJ81JZ9Rtw1x55AKQR7yElVsE1kf6wIBxIL7V6iz5ncnGCrbVI+xGBQ==
X-Received: by 2002:a50:9e24:0:b0:56b:fd17:3522 with SMTP id z33-20020a509e24000000b0056bfd173522mr309140ede.14.1712177156073;
        Wed, 03 Apr 2024 13:45:56 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id g28-20020a056402321c00b0056c1c2b851esm8383335eda.0.2024.04.03.13.45.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 13:45:55 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3439ce73766so112568f8f.2
        for <linux-media@vger.kernel.org>; Wed, 03 Apr 2024 13:45:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsw0RxVx1nP/TjDCqCTL/DKq9/i6fLe/k4BzfDGHyVnRALwyGqGjVHNDxHYA3pJ0s3MhcLoZHL6QBz0XY4egdgibPOlwsGznl+pao=
X-Received: by 2002:a05:6000:190:b0:33e:cf4d:c581 with SMTP id
 p16-20020a056000019000b0033ecf4dc581mr421503wrx.41.1712177155304; Wed, 03 Apr
 2024 13:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-uvc-fix-relative-ptz-speed-v1-0-624c9267f745@securitylive.com>
 <20240403-uvc-fix-relative-ptz-speed-v1-2-624c9267f745@securitylive.com>
In-Reply-To: <20240403-uvc-fix-relative-ptz-speed-v1-2-624c9267f745@securitylive.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 3 Apr 2024 22:45:42 +0200
X-Gmail-Original-Message-ID: <CANiDSCvfFuQSa5j7Zs-skXmPGTHRtGVH3moA8w=AG1BF1m=dLw@mail.gmail.com>
Message-ID: <CANiDSCvfFuQSa5j7Zs-skXmPGTHRtGVH3moA8w=AG1BF1m=dLw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: uvcvideo: UVC minimum relative pan/tilt/zoom
 speed fix
To: johnebgood@securitylive.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linh.tp.vu@gmail.com, soyer@irl.hu
Content-Type: text/plain; charset="UTF-8"

Hi John

Can you squash all the patches in one and resend as v3?

When you send a new version of your patch, you want to send it as PATCHvX

b4 should do this automatically for you:

- just go to the original branch
git checkout b4/uvc-relative-ptz-speed-fix

- then edit the change with something like
git rebase -i

- then edit the cover to describe the changelog with
b4 prep --edit-cover

-then submit
b4 submit

I will comment on your 2/2... but it should be squashed into your 1/2

Thanks!


On Wed, 3 Apr 2024 at 21:58, John Bauer via B4 Relay
<devnull+johnebgood.securitylive.com@kernel.org> wrote:
>
> From: John Bauer <johnebgood@securitylive.com>
>
> Made recommended changes from Ricardo. I explored the case where
> the minimum could be > 0 but less than the maximum. If this were
> to occur the range of -maximum to maximum would still apply correctly
> however there would be a range from -min to min that would possibly
> not apply. It would be possible to capture the probed minimum and
> check against that when setting the controls.
>
> Signed-off-by: John Bauer <johnebgood@securitylive.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index b389ab3ee05d..04300a782c81 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1322,6 +1322,10 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>                 break;
>         }
>
> +       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
> +               v4l2_ctrl->maximum = mapping->get(mapping, UVC_GET_MAX,
> +                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> +
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
>                 switch (v4l2_ctrl->id) {
>                 case V4L2_CID_ZOOM_CONTINUOUS:
> @@ -1332,8 +1336,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>                          * value cannot be probed so it becomes the additive
>                          * inverse of maximum.
>                          */
> -                       v4l2_ctrl->minimum = -1 * mapping->get(mapping, UVC_GET_MAX,
> -                                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> +                       v4l2_ctrl->minimum = -v4l2_ctrl->maximum;
>                         break;
>                 default:
>                         v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
> @@ -1342,10 +1345,6 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>                 }
>         }
>
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
> -               v4l2_ctrl->maximum = mapping->get(mapping, UVC_GET_MAX,
> -                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> -
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
>                 v4l2_ctrl->step = mapping->get(mapping, UVC_GET_RES,
>                                   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> @@ -1940,7 +1939,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                 case V4L2_CID_ZOOM_CONTINUOUS:
>                 case V4L2_CID_PAN_SPEED:
>                 case V4L2_CID_TILT_SPEED:
> -                       min = max * -1;
> +                       min = -max;
>                 default:
>                         break;
>                 }
>
> --
> 2.34.1
>
>


--
Ricardo Ribalda

