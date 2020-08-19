Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D5824A879
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 23:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgHSV1O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 17:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbgHSV1I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 17:27:08 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419EEC061757;
        Wed, 19 Aug 2020 14:27:08 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id z3so14406ilh.3;
        Wed, 19 Aug 2020 14:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MRA2y2Rc3TNgmf0EPNyuX2jexuAJTmfYlCYdqUjzR5s=;
        b=afydlD/UDkiT1FrB2cVck24DWjkDau6bOedyxgqXyMAGc+9I6GDuT0drtfUqm2cNza
         Uz5jDPRu1SIKSiAYvzrwbZfJxaWBU1sTXIZRbksyD4T9Lr2l2n5LodTbFXJfQvRsmRLo
         rTr8e4d9ybaz9Sp8hqITCGU0NTtS6rtmmxJoHchCiG5iNuAKFR/9/D1m6XlLO1fO3R+e
         JwH7xdga44+RiOPIttXVAN7TRnkWToe1r7HRF3D4AllV0xujVmRnim9A3yvLpNNV9fHX
         TmuWFWh4YZO5yAExm4yT+zd2GkN38pVHPMIHOinidLzrdFPTBMHTNwOzGa6Np7M9JC/e
         C1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MRA2y2Rc3TNgmf0EPNyuX2jexuAJTmfYlCYdqUjzR5s=;
        b=q8HnO36UbkGteQCfzLVaQmWhuaCdhbFV41eOslMjHBbB8U+uF+qHVL3iH1IXDfspHf
         tQj9+DI+Fgx1EVkYIWyskfiiXz2M3/v+qZYyxgAW6/VUqqOibBnBJe3g9DUuUUapDVgd
         zAZL9vAviMBsLmH1lsjv8M26UrelccAmj7aXS9j66XlDgGSHHuMj5kWyNjE0pgxlBzqb
         i3PfxTCA9z/YggJfHrY4wEySP5D9q1hOPk+S/TwQmT8LN8w483DdbQuRhpmM4yZJL7J4
         /yVRNH/FG0SFPrX/P9CxZ3Tghks3H1zd+ynLEo9tiehCa5AJDRXSSURoqpGOQDqC0NH3
         ur1A==
X-Gm-Message-State: AOAM530R5qaV1hFcjKyUraP1x29C1kAL0YLqvK6dw+PQ16T4oN8tGD2V
        aV6+E1yFQobOTVycolWXJmJgvvWKq8zwNNfeTso=
X-Google-Smtp-Source: ABdhPJwTDgsGMpO3juMoJfOjTKlIpm6+o0QYVMQ0p3cVJCwuiJHzZhvJEAkrDF5iaZCBJ316lKH6pgoXKz42JqAL3Uw=
X-Received: by 2002:a92:8550:: with SMTP id f77mr23142957ilh.129.1597872426998;
 Wed, 19 Aug 2020 14:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200816064901.977682-1-ztong0001@gmail.com> <75b8354b-362a-0215-8038-45bd68be7de5@xs4all.nl>
In-Reply-To: <75b8354b-362a-0215-8038-45bd68be7de5@xs4all.nl>
From:   Tong Zhang <ztong0001@gmail.com>
Date:   Wed, 19 Aug 2020 17:26:56 -0400
Message-ID: <CAA5qM4A8oyemT3+B+07KcnvxH274aEzJ+kLd=uB=0dqGFgv+EA@mail.gmail.com>
Subject: Re: [PATCH] media: pvrusb2: fix parsing error
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, isely@pobox.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
I just made another patch as suggested, I think I need some more work
on the commit log.
Please take a look and let me know -
Thanks,
- Tong

On Wed, Aug 19, 2020 at 10:38 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Tong,
>
> On 16/08/2020 08:49, Tong Zhang wrote:
> > pvr2_std_str_to_id() returns 0 on failure and 1 on success,
> > however the caller is checking failure case using <0
> >
> > Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> > ---
> >  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > index 1cfb7cf64131..db5aa66c1936 100644
> > --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > @@ -867,7 +867,8 @@ static int ctrl_std_sym_to_val(struct pvr2_ctrl *cptr,
> >       int ret;
> >       v4l2_std_id id;
> >       ret = pvr2_std_str_to_id(&id,bufPtr,bufSize);
> > -     if (ret < 0) return ret;
> > +     if (ret == 0)
> > +             return ret;
>
> But now you return 0 instead of an error when pvr2_std_str_to_id failed.
>
> Just do this:
>
>         if (!pvr2_std_str_to_id(&id,bufPtr,bufSize))
>                 return -EINVAL;
>
> And you can drop the ret variable as well since that's no longer needed.
>
> Regards,
>
>         Hans
>
> >       if (mskp) *mskp = id;
> >       if (valp) *valp = id;
> >       return 0;
> >
>
