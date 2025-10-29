Return-Path: <linux-media+bounces-45931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D584DC1974B
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 10:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6E1E9581904
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 09:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0F332D444;
	Wed, 29 Oct 2025 09:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EgiLtjcH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB24C328605
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 09:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730657; cv=none; b=qfCKSG5WsFQce32aNI/WQCzXEKz8Vhmg4+9CmFgeEuy4FZ3Efthk6XaDj+n/ywn4YGS9YD1z8t/uo4QuKbtkfQO9Gl32DJc/1YveUjRvjxGLc1RWcuQMXg+7fiP0Y0IdWdiHlGowITZxWvViKzYqtDW60JkSdDhIcWQfbBn8Fcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730657; c=relaxed/simple;
	bh=FMEPEFiPB6Tfj0snxhV61QxQKg2vsfRJZoiB0EQX/vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UC2kbxR5HfowfFHTXq2OC2BZpwVf9FVHog6znRYsMcWiM+duIuz521ISryZSzLBiclCFqUW0aek1z22GMFdks2MnWxwZVdsCJ2FHxp8dNCx7UTC6LSx6I926Mw51WKpbtk5QLCPA+L2TO9D9lVMQowlsEVZEfir//RHd7ki2biI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EgiLtjcH; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-378d65d8184so26665461fa.0
        for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 02:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761730653; x=1762335453; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zW33KXxYmEIaVqGmGYPO0/yFieFjDmROYj6eA8owy0k=;
        b=EgiLtjcH2jswEcvd8eJqXtyqMFVYWiL3+sTBFLcc/aOkYAfDYiTGVIsXU9GTEFg+OW
         7xLMkh9jzln49C016UEGHw4r4HV+5QyXWWKMjBPBM3hZztWrUirXD7wfFt9evqke6KIr
         d+SrirUW/uc7dhqxh7IK2ysBBN+Yt3aBLLJic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730653; x=1762335453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zW33KXxYmEIaVqGmGYPO0/yFieFjDmROYj6eA8owy0k=;
        b=lCWMbZbOgFbU7AToBlDHOVXivittkq4ckHocaYqVXZsdc1Z17fPKTe/Dx3eBF5f1P5
         PXTDAv7f0JFeWmfR4F4INrfSIMPvh+8IpnrTkrrADASqKcWe9sc4CnElQ/gK4sUgKd9T
         oCLRwNZdP4CXQkKij49czuH6aYYngypJ2gNbWYhtFpw0K9LKWYd97kE6S7j9B7Ngz00l
         Aexgk8BzfSltYgyEF0T34hvLkboMFOCmOgJtUFuAg7rQ5XdHVq+LdTwIyvGoc3/c3kL3
         27TqVxu+7pt4l/l4/B/utp5Mxj5oa6PEKFeXPwG9k6VmPuEx6kzMpsywYdS3Uua4SzjM
         2nxA==
X-Forwarded-Encrypted: i=1; AJvYcCU4uGMyCARlJeA3/+azhRGQ/PzWjmKePChxR1+shIT/r6fbgm4Fhp6Gn6SlWwwEb4i+WzVC2b6mlXHBmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY9MKWG1aDnFW5GrTiEQsXODOuqFi3kjV8i5EyIosFbA8/0jPj
	58dT1cvgvTZ17jZM51NyfAkVR9xj7uHrCNLcbEZN/F388qHOVDSvqUrzoRmM7uaqcwApnxDeRB6
	baoY=
X-Gm-Gg: ASbGncs29o8yH2xbbKmkYCkEa6osOsVlINse8VgbHlXMzoWfQznHyzfHoaIFJ++jDhA
	JIl/0pEaDMi/vStiz7Yrpa+YRB+CL0g57aU6yHLfOjEiIOiRaCqtYouvR3izZBIUs7NmUxgRxNO
	3hZddonAeBu5ro+SISYlB4dnpOYieBSu5/vxTcEHSIzd0HyYPjl00fkXCY6UpxsfNZpAdN6T1t2
	lG7X/XqNGZCvgzw7AVva9DAL3v3phUJqnl57AvqyV827KX+Ig6kQXFMh4pd2w4mC2zsubxE2guh
	fY6cysaxxsvIjq4vmkcmFWZl64n5osHBzTCBcJsC4gytwZAD1/5QJPkOEC5KJd2Z8JG/EGT+Tvo
	a9nzGUe3hY+ouLQQ3IrurkFRmWHaayCH205hhH6Yt2BtFzK4zWjXgO2GNKHSnAu+5E5V7JVSJJc
	nzUTNrxjqD9f/TeEWhYZF7rXIYgNv4F1/9BBagRg==
X-Google-Smtp-Source: AGHT+IGSFkhNqIFw4D/yQnQeN7KdJP7LJEjCw1CceKhDCFM7Yz+vO/AquYq2T9pZM0RN8eiom+EwdA==
X-Received: by 2002:a2e:a5c3:0:b0:360:c716:2666 with SMTP id 38308e7fff4ca-37a023fa773mr8248501fa.30.1761730653499;
        Wed, 29 Oct 2025 02:37:33 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09213fsm32387071fa.1.2025.10.29.02.37.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:37:33 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59390875930so1232246e87.1
        for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 02:37:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW013rWcpLSXKX0SVqSy1Yoeg6aowfvqGnaSaWp+O2KkM103BSZtMdjgr3iJKXXt/vXp2VwdOUbzZ6m7Q==@vger.kernel.org
X-Received: by 2002:a05:6512:308c:b0:592:fcad:4a11 with SMTP id
 2adb3069b0e04-59412862548mr801493e87.7.1761730652345; Wed, 29 Oct 2025
 02:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028-uvc-fix-v1-1-dfcc504ff8e2@chromium.org> <968fc56f-268f-4b2d-8f99-01fa886b524e@kernel.org>
In-Reply-To: <968fc56f-268f-4b2d-8f99-01fa886b524e@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 29 Oct 2025 10:37:18 +0100
X-Gmail-Original-Message-ID: <CANiDSCtjitQqziDnGbAcxHNSqkp78w74OTvqz=tijgZ3KxoSnQ@mail.gmail.com>
X-Gm-Features: AWmQ_bn1SJ89ZW-fHDRYAwEyIsipoy4MrPRroChHPrtgMUX4tFK8YLQRrWfR7ew
Message-ID: <CANiDSCtjitQqziDnGbAcxHNSqkp78w74OTvqz=tijgZ3KxoSnQ@mail.gmail.com>
Subject: Re: [PATCH v4l-utils] v4l2-compliance: Fix test for UVC USER controls
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Wed, 29 Oct 2025 at 10:10, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> On 28/10/2025 18:45, Ricardo Ribalda wrote:
> > v4l2-compliance only supports priv_user_controls which id starts from
> > CID_PRIV_BASE and are contiguous; or compound controls. This is not
> > enough for UVC:
> >
> > The UVC driver exposes two controls V4L2_CID_UVC_REGION_OF_INTEREST_RECT
> > and V4L2_CID_UVC_REGION_OF_INTEREST_AUTO and reserve space for 62 more.
> >
> > Make v4l2-compliance aware of them.
> >
> > With this patch the following v4l2-compliance is fixed:
> >
> > fail: v4l2-test-controls.cpp(326): expected 1 private controls, got 0
> >   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  utils/v4l2-compliance/v4l2-test-controls.cpp | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> > index e4925ca3977b5b87a6a8e9ad5794847fa7009e50..6f645c4f9aca94a4ef586b11d6fd11268f1bf195 100644
> > --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> > +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> > @@ -316,6 +316,22 @@ int testQueryExtControls(struct node *node)
> >               priv_user_controls++;
> >       }
> >
> > +     for (id = V4L2_CID_USER_UVC_BASE; id < V4L2_CID_USER_UVC_BASE + 64; id++) {
> > +             memset(&qctrl, 0xff, sizeof(qctrl));
> > +             qctrl.id = id;
> > +             ret = doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qctrl);
> > +             if (ret && ret != EINVAL)
> > +                     return fail("invalid query_ext_ctrl return code (%d)\n", ret);
> > +             if (ret)
> > +                     continue;
> > +             if (qctrl.id != id)
> > +                     return fail("qctrl.id (%08x) != id (%08x)\n", qctrl.id, id);
> > +             if (checkQCtrl(node, qctrl))
> > +                     return fail("invalid control %08x\n", qctrl.id);
> > +             if (qctrl.type < V4L2_CTRL_COMPOUND_TYPES)
> > +                     priv_user_controls++;
> > +     }
> > +
>
> Ah, no, this is wrong.
>
> So a long, long time ago there were only standard integer type controls and driver
> private controls. The latter started at V4L2_CID_PRIVATE_BASE.
>
> The problem with that was that different drivers supported controls with the same
> ID (V4L2_CID_PRIVATE_BASE + offset), but very different meaning.
>
> When I created the control framework, I defined that drivers should use ranges of
> controls IDs instead ensuring that control IDs would always be unique. Those are
> reserved in v4l2-controls.h, in the case of UVC they start at V4L2_CID_USER_UVC_BASE.
> And you can enumerate them using V4L2_CTRL_FLAG_NEXT_CTRL.
>
> But to preserve backwards compatibility with existing applications that do not support
> V4L2_CTRL_FLAG_NEXT_CTRL, the control framework maps those private ranges to
> V4L2_CID_PRIVATE_BASE. See find_private_ref in drivers/media/v4l2-core/v4l2-ctrls-core.c.
> This will just find the nth driver private user control that is not a compound control.
>
> Drivers don't need to do anything, it's all done by the control framework.
>
> In the case of UVC there is one such control: V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
>
> So v4l2-compliance expects that when querying controls from V4L2_CID_PRIVATE_BASE
> onwards, it will see one control with ID V4L2_CID_PRIVATE_BASE.
>
> But it doesn't, since UVC doesn't support this backwards compatibility code.
>
> There are two options: UVC can support this old way of working as well, or
> v4l2-compliance skips this check for uvc. I'm inclined to just skip it for uvc.
>
> This patch should do this:

Thanks for the detailed explanation.

What about landing your proposal and then I start to work to fix uvc
to support V4L2_CID_PRIVATE_BASE ?
After I add support for V4L2_CID_PRIVATE_BASE we will revert your quirk.

If we go that path. Do I need to resend a v2 with your code?

Thanks!

>
> [PATCH] v4l2-compliance: skip V4L2_CID_PRIVATE_BASE check for UVC
>
> UVC doesn't support V4L2_CID_PRIVATE_BASE, so skip the check.
>
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> index e4925ca3..73a6a3be 100644
> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> @@ -321,6 +321,9 @@ int testQueryExtControls(struct node *node)
>         if (user_controls != user_controls_check)
>                 return fail("expected %d user controls, got %d\n",
>                         user_controls_check, user_controls);
> +       /* UVC doesn't support V4L2_CID_PRIVATE_BASE */
> +       if (is_uvcvideo)
> +               priv_user_controls_check = 0;
>         if (priv_user_controls != priv_user_controls_check)
>                 return fail("expected %d private controls, got %d\n",
>                         priv_user_controls_check, priv_user_controls);
>
>
> Regards,
>
>         Hans
>
> >       if (priv_user_controls + user_controls && node->controls.empty())
> >               return fail("does not support V4L2_CTRL_FLAG_NEXT_CTRL\n");
> >       if (user_controls != user_controls_check)
> >
> > ---
> > base-commit: 796dc550a682e8f65fe6457cd5fec5ee123f39aa
> > change-id: 20251028-uvc-fix-a8ce84e198f4
> >
> > Best regards,
>


-- 
Ricardo Ribalda

