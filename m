Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2EB3FFE3D
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 12:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235135AbhICKe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 06:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235009AbhICKe5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 06:34:57 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7D4C061575
        for <linux-media@vger.kernel.org>; Fri,  3 Sep 2021 03:33:57 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id b200so6131822iof.13
        for <linux-media@vger.kernel.org>; Fri, 03 Sep 2021 03:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qp3yBEGztW/IVnSK9RLezfX6LccfvbpJN7FvTSFuOOU=;
        b=NF3qbplL9tYzocYNGkzd+qx3v+y1Lyx+n2oo88ai79U82Sc+oJorAwNHZ7D84X6TEJ
         dM5BUGmPz49wrWyIL3iHs5w8DJ9hdinB8f7IsPLSx6hYoHYD1PAymQEy+a45Z8wSL6sI
         XMG4gOEOyjE/NnuSjzTsEyGMmnTPQAsQZq53k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qp3yBEGztW/IVnSK9RLezfX6LccfvbpJN7FvTSFuOOU=;
        b=ZQtxIw/N5bf72eSFf12Yfmk+ID+7sJLEY8qYKyLF3zlL8AQbttWER1VCkPEjmV46O+
         OKa8Go08DBHbBthDTUO1Lw/bnPeZDkWK/Xl8qnMMrMnY+xDeELh6/lFjKfKFeT3gWSyY
         91gCG0f0A/q90Q/Cqsk+v4bT4S0cc1OwOEKVtvQYStX+74ETfyNur+N9TEFkoKBK3ASL
         2HLhb1kaL6pxbpvHfQ+Uyw7x4Vbw2ygMlcawASD8w6hvkTgPGXlrxISAh4RG5lt0rgdk
         EUX33k/XtrsLvPAWKz8gH6rSlnT9aGkGUDzPOf3HKvbHhDEzGZLfIqYJ9r+ZNn2hcgGG
         MosQ==
X-Gm-Message-State: AOAM5328v3C0RsarE6trGdEDhUg3vcko/RcKjqQUsYlfW9AFD1PISLb9
        ivhFkI00qshutt/2sFNMjkgP1m3A8EbXsA==
X-Google-Smtp-Source: ABdhPJyqtsfC+RERW1q9IcQXqXQnQpGZK/YfJjNphnVjejfPMJGXRHg3epF9aplkxg6sytFDvH1W1A==
X-Received: by 2002:a05:6602:584:: with SMTP id v4mr2490263iox.85.1630665237016;
        Fri, 03 Sep 2021 03:33:57 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id a25sm2490830ioq.46.2021.09.03.03.33.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 03:33:56 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id g9so6142881ioq.11
        for <linux-media@vger.kernel.org>; Fri, 03 Sep 2021 03:33:55 -0700 (PDT)
X-Received: by 2002:a6b:8d08:: with SMTP id p8mr2473043iod.150.1630665235439;
 Fri, 03 Sep 2021 03:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210618122923.385938-1-ribalda@chromium.org> <20210618122923.385938-14-ribalda@chromium.org>
 <20210903121057.7279d964@coco.lan>
In-Reply-To: <20210903121057.7279d964@coco.lan>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 3 Sep 2021 12:33:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCtZ8RbsR0_jwWbRiMayum2Q4+1wj=PQgC8Vu2boJeihng@mail.gmail.com>
Message-ID: <CANiDSCtZ8RbsR0_jwWbRiMayum2Q4+1wj=PQgC8Vu2boJeihng@mail.gmail.com>
Subject: Re: [PATCH v10 13/21] media: uvcvideo: Use control names from framework
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro

On Fri, 3 Sept 2021 at 12:11, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> Em Fri, 18 Jun 2021 14:29:15 +0200
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
>
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 9cdd30eff495..28ccaa8b9e42 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -40,7 +40,13 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
> >               return -ENOMEM;
> >
> >       map->id = xmap->id;
> > -     memcpy(map->name, xmap->name, sizeof(map->name));
> > +     /* Non standard control id. */
> > +     if (v4l2_ctrl_get_name(map->id) == NULL) {
> > +             map->name = kmemdup(xmap->name, sizeof(xmap->name),
> > +                                 GFP_KERNEL);
>
> Where are you de-allocating it at driver removal/unbind?

It is also in this patch:

@@ -2462,6 +2448,7 @@ static void uvc_ctrl_cleanup_mappings(struct
uvc_device *dev,
        list_for_each_entry_safe(mapping, nm, &ctrl->info.mappings, list) {
                list_del(&mapping->list);
                kfree(mapping->menu_info);
+               kfree(mapping->name);
                kfree(mapping);
        }
 }

If there is a standard name mapping->name will be NULL, but kfree
checks for that.

Thanks


>
>
> Thanks,
> Mauro



-- 
Ricardo Ribalda
