Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3DF44D52E
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 11:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232974AbhKKKnj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 05:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbhKKKng (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 05:43:36 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69056C061208
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 02:40:45 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso8247843ots.6
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 02:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WYwaEKCKS/S+KMPpSUbw1eQf1s6zmuCQeeq0EOP0iO4=;
        b=ekthIOhoS2xnKonG7qe/GeGCK1yMfkJMn5ZfAHVnzhUmcPwObSvfStqHXw4Zji6X9v
         fVemDQ7rZkbOsWQLfINsi0xQjWuGYZ+IHA817H2i4651BmV5TQXHXzOhfOOH3zry1ms5
         vAhmm2mnPSKRC6XLsvzZiBw1AR0nvKDp75puA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WYwaEKCKS/S+KMPpSUbw1eQf1s6zmuCQeeq0EOP0iO4=;
        b=UCXvYCXeu92VaPFBePh3tOrpFSUVQmBizSQj8J3UWKmJ+mMqNarqygzYphhJr97YG8
         NMj9LtMLPJHRWbNw7upJkkZ5JBU7/SK3XX60qFalvu3UBrU0vCozugw0v0p4rwp22gxR
         TG1ktWXLznt6EiQgwxjjf3LozbXWBfCvuq3QT5kGbgLv1BNSX1+QDSQvXKpVmc1s0BIr
         Rgfwsvl+zYu8Y760rzKIfwQ+eU7ZKNa0VjzORpgVdlZoo+ZWl8q+ZD6uhNCwWwKPg+0P
         VAeCNv1ZryCcfBc0sU80YjinHhXZQ0ewx1J4+So7r6QUaXHHiO4Sa7pHlvUR7StwDq8m
         g8/A==
X-Gm-Message-State: AOAM530yx+uM45AynJ0qlOwxaPeM4HVcyE2wiR1dYwlngVGD8TX6YAQj
        W8en8N7fdm5BiDnB/6u3b2qu22yTmIoSGA==
X-Google-Smtp-Source: ABdhPJze9osLrC8kxXGApf4ao5rRyRbdj4KC0kxwP1uCf9tsOHdLDlCoi+q5GPsWANDTahYUXlY3iA==
X-Received: by 2002:a05:6830:25d6:: with SMTP id d22mr5298006otu.87.1636627244941;
        Thu, 11 Nov 2021 02:40:44 -0800 (PST)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id m7sm606854oih.58.2021.11.11.02.40.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 02:40:44 -0800 (PST)
Received: by mail-oo1-f51.google.com with SMTP id v19-20020a4a2453000000b002bb88bfb594so1748352oov.4
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 02:40:44 -0800 (PST)
X-Received: by 2002:a4a:5a45:: with SMTP id v66mr3659908ooa.26.1636627243818;
 Thu, 11 Nov 2021 02:40:43 -0800 (PST)
MIME-Version: 1.0
References: <95f3fd02313ff41d6808b8e1f20e0c582f46edc8.1636617903.git.christophe.jaillet@wanadoo.fr>
 <20211111103303.GQ2001@kadam>
In-Reply-To: <20211111103303.GQ2001@kadam>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 11 Nov 2021 11:40:32 +0100
X-Gmail-Original-Message-ID: <CANiDSCvuk1M2C0HuErXnRcVAj6VgFESaPGPFes2OxC9Qtx5P5A@mail.gmail.com>
Message-ID: <CANiDSCvuk1M2C0HuErXnRcVAj6VgFESaPGPFes2OxC9Qtx5P5A@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix a memory leak in an error handling
 path of 'uvc_ioctl_ctrl_map()'
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I belive this is also addressed by this patch that is under review:

https://patchwork.linuxtv.org/project/linux-media/patch/20211008120914.69175-1-ribalda@chromium.org/

On Thu, 11 Nov 2021 at 11:33, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Nov 11, 2021 at 09:06:11AM +0100, Christophe JAILLET wrote:
> > If 'map->name' can't be allocated, 'map' must be released before returning.
> >
> > Fixes: 70fa906d6fce ("media: uvcvideo: Use control names from framework")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index f4e4aff8ddf7..5aa76a9a6080 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -44,8 +44,10 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
> >       if (v4l2_ctrl_get_name(map->id) == NULL) {
> >               map->name = kmemdup(xmap->name, sizeof(xmap->name),
> >                                   GFP_KERNEL);
> > -             if (!map->name)
> > +             if (!map->name) {
> > +                     kfree(map);
> >                       return -ENOMEM;
> > +             }
>
> Your patch is fine but there is a second issue.  The error handling
> should free "map->name" as well.  The problem is that this function
> frees everything on the success path at all, but freeing map->name on
> the success path will lead to a crash so you have to do something
> weird like:
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index f4e4aff8ddf7..953a5cbf7945 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -90,6 +90,9 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>         ret = uvc_ctrl_add_mapping(chain, map);
>
>         kfree(map->menu_info);
> +free_name:
> +       if (ret)
> +               kfree(map->name);
>  free_map:
>         kfree(map);
>
>


-- 
Ricardo Ribalda
