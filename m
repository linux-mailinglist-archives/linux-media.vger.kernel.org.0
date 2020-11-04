Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058652A6398
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 12:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729627AbgKDLtq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 06:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729621AbgKDLsj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 06:48:39 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6129C0613D3
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 03:48:39 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id 9so21858333oir.5
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 03:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y7tj6Pzjp8JR2KC8TChsuwytVkVvMR+s47pe2JATvJU=;
        b=MsKU1ybVT4f7H+c6z7o6qDsydeSwBR0uaSOc57E+hYVHLDJKTN1erCWU6QbkCZS2Pe
         2Qfsvh9yqtYza+HWTGTEigZ2QsQHBxni2f+k7TsICC4sKXGNYRkGXo2zAt90spUIoTay
         K+K3/VONsbCUEaM5tL/dR4Psu3Ip7JJ/5Nm7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y7tj6Pzjp8JR2KC8TChsuwytVkVvMR+s47pe2JATvJU=;
        b=MWil/RAgL7BR7X0jNvE7Fklm7JxwWXiiXXNW4zUuJHr8hGUN7dEujbyZv6sluNL+cl
         OiRbMJDX9yXkHT2okqYdVMu2mzsEBb3O/sWOR8X6A8sn3lngSs2vNMk+m+WZzxKiGqkp
         /tOSjPu+QfsGXt5NmBBfug2pZiZjiC5RXQYOPH84G5MIl7t7WXeLTZPDNAoG2/RQ5DBL
         26Sj2H4Sd1UMXiECeWkcjLpi16iLScAAXk2Qlxro0RYbVw+s9y2GOk++eWOHMYYZdQNR
         fCJBPC98FeqCtYFkHkOZctXp65wyS2VkZuQyDa0a5CCAZGFAKmWu4lrFNn9KTjzFj/TS
         /Eyw==
X-Gm-Message-State: AOAM533En+eXb78THRMyxnbl8MUFu5Ss6n9bN4dCeGf48XdA7TzzsvxQ
        KFXHACuTc5KyNsDa5bhcofFs9795M+Y+CA==
X-Google-Smtp-Source: ABdhPJypwoLc/67sjTzMtLlYae56zOtA3XASo5MDWicNFP16joEM2+br6SYEkWtUl7RcDNTEGUZVhw==
X-Received: by 2002:aca:5710:: with SMTP id l16mr2346519oib.24.1604490518714;
        Wed, 04 Nov 2020 03:48:38 -0800 (PST)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id w3sm450552oov.48.2020.11.04.03.48.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 03:48:37 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id c21so6860680oic.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 03:48:37 -0800 (PST)
X-Received: by 2002:aca:d07:: with SMTP id 7mr2193975oin.15.1604490516967;
 Wed, 04 Nov 2020 03:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20201022133753.310506-1-ribalda@chromium.org> <20201022133753.310506-2-ribalda@chromium.org>
 <20201104110937.GH26171@pendragon.ideasonboard.com>
In-Reply-To: <20201104110937.GH26171@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 4 Nov 2020 12:48:25 +0100
X-Gmail-Original-Message-ID: <CANiDSCuCJigJ293pMnXT9wALUn3D2=RTKtzVcrD+Hr+u2uCWPA@mail.gmail.com>
Message-ID: <CANiDSCuCJigJ293pMnXT9wALUn3D2=RTKtzVcrD+Hr+u2uCWPA@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: uvcvideo: Add UVC_CTRL_FLAG_ENTITY_GET_INFO
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 4, 2020 at 12:10 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, Oct 22, 2020 at 03:37:48PM +0200, Ricardo Ribalda wrote:
> > This flag allows controls to get their properties from an entity defined
>
> s/entity defined/entity-defined/
>
> > function instead of via a query to the USB device.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 9 +++++++--
> >  drivers/media/usb/uvc/uvcvideo.h | 3 +++
> >  include/uapi/linux/uvcvideo.h    | 2 ++
> >  3 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index f479d8971dfb..7acdc055613b 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1708,8 +1708,13 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
> >       if (data == NULL)
> >               return -ENOMEM;
> >
> > -     ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id, dev->intfnum,
> > -                          info->selector, data, 1);
> > +     if (ctrl->info.flags & UVC_CTRL_FLAG_ENTITY_GET_INFO)
>
> Do we need the flag, couldn't we use entity->get_info if it is non-null,
> and call uvc_query_ctrl() otherwise ?

The idea behind the flag is to support in the same entity controls
that are uvc_query_ctrl() based
and "entity private functions".

As this moment, there is only the " GPIO entity"  that has has private
functions, and does not require it.

So I can simply remove the flag and add it later (if needed).

Thanks

>
> > +             ret = ctrl->entity->get_info ?
> > +                     ctrl->entity->get_info(ctrl->entity, ctrl->info.selector, data) :
> > +                     -EINVAL;
> > +     else
> > +             ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id, dev->intfnum,
> > +                                  info->selector, data, 1);
> >       if (!ret)
> >               info->flags |= (data[0] & UVC_CONTROL_CAP_GET ?
> >                               UVC_CTRL_FLAG_GET_CUR : 0)
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index a3dfacf069c4..08922d889bb6 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -353,6 +353,9 @@ struct uvc_entity {
> >       u8 bNrInPins;
> >       u8 *baSourceID;
> >
> > +     int (*get_info)(struct uvc_entity *entity, u8 cs, u8 *caps);
> > +     int (*get_cur)(struct uvc_entity *entity, u8 cs, void *data, u16 size);
>
> Looks like the second function should be part of patch 2/6 instead. I
> would however squash 1/6 and 2/6.
>
> > +
> >       unsigned int ncontrols;
> >       struct uvc_control *controls;
> >  };
> > diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
> > index f80f05b3c423..69b636290c31 100644
> > --- a/include/uapi/linux/uvcvideo.h
> > +++ b/include/uapi/linux/uvcvideo.h
> > @@ -30,6 +30,8 @@
> >  #define UVC_CTRL_FLAG_AUTO_UPDATE    (1 << 7)
> >  /* Control supports asynchronous reporting */
> >  #define UVC_CTRL_FLAG_ASYNCHRONOUS   (1 << 8)
> > +/* Entity queries */
> > +#define UVC_CTRL_FLAG_ENTITY_GET_INFO        (1 << 9)
> >
> >  #define UVC_CTRL_FLAG_GET_RANGE \
> >       (UVC_CTRL_FLAG_GET_CUR | UVC_CTRL_FLAG_GET_MIN | \
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
