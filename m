Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6292A763036
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 10:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233358AbjGZIqO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 04:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233355AbjGZIpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 04:45:47 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D692D56
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 01:38:11 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7656652da3cso495169485a.1
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 01:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690360691; x=1690965491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=74wyanum3tMY6hDx3TZatyjXXaq/omZ9n0t0OUBylr4=;
        b=G+rQKya9hRJ1KrTW7HkUV7t9ZVQya6/gkmn8HuwfCSiy1lM+Z4u2AL6fEnWGXB0yag
         feFPkPAhP26iAGresrKu0OMAibMERZTok69c0gVpMZJgW1/oQerJFhYam7sj+FgdW4Me
         CX5fAlGN/scLlT3Q3B8Qerc+mf8ltS38DMSjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690360691; x=1690965491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74wyanum3tMY6hDx3TZatyjXXaq/omZ9n0t0OUBylr4=;
        b=GGrEi6ayWwcUIXza2wyOuujevugXYU4WaBCwmABNEa5uBosWu7aMYYIbbIlQH4Qq9Z
         tjIxS5ON5aLmbFwXK/g1A+qZP1Cwclmo52HmP59DDe+ZKzZ6Xh+R03kZDkeAFwNzcmbE
         JnJVJsSo1BkSjZ/2cn+1rV1pmIMU+jmtqMEjTwBS9V7gUuGV26TytTSlBge/zfKsnF7Q
         ye1RX8AmSiJ/Nhw6kg1oWQZZuP5YleqUyKF5LCjopFu48TV8UlBk5xe8+qwmmquqzOLK
         O8Tt05KVfziG7MXWYV/NKntm66YfiGmPgyin7ApFG61kyFSLfNltHAR3amknz9FVtOW6
         YNcw==
X-Gm-Message-State: ABy/qLaeXxaMrevtJyJkYkBkzYO5KymM3zJMnb/J/4nhPKV65mm4Fxul
        JzawJGkWosRMuMXDSc0JgJZYBT/hrFMXmekbMqpv6Q==
X-Google-Smtp-Source: APBJJlFPWxxz5UYCNKbrorGqzAZWNTLWA20XBBXd3Kd6YzeLIaVBFQ5nY+oCz7nxjLrfK1loV3cGAw==
X-Received: by 2002:ad4:53c1:0:b0:63c:fd89:f045 with SMTP id k1-20020ad453c1000000b0063cfd89f045mr1241885qvv.54.1690360691083;
        Wed, 26 Jul 2023 01:38:11 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id s17-20020a0ca611000000b0063d1aa446e2sm963928qva.59.2023.07.26.01.37.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 01:37:37 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-63d0228d32bso18744016d6.2
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 01:37:30 -0700 (PDT)
X-Received: by 2002:a0c:c684:0:b0:63c:da03:1c12 with SMTP id
 d4-20020a0cc684000000b0063cda031c12mr975386qvj.60.1690360649449; Wed, 26 Jul
 2023 01:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230717-uvc-oob-v2-1-c7745a8d5847@chromium.org>
 <20230725213451.GU31069@pendragon.ideasonboard.com> <CANiDSCttkqows7PZS823Jpk-CqK9Gz2rujF_R4SPDi=wcPJ2LA@mail.gmail.com>
 <20230726080753.GX31069@pendragon.ideasonboard.com>
In-Reply-To: <20230726080753.GX31069@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 26 Jul 2023 10:37:17 +0200
X-Gmail-Original-Message-ID: <CANiDSCsfmpi3N8hqC7XxYMg_6Zrf=QROjj-JwgzavPBzhW0NPw@mail.gmail.com>
Message-ID: <CANiDSCsfmpi3N8hqC7XxYMg_6Zrf=QROjj-JwgzavPBzhW0NPw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix OOB read
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        stable@kernel.org, Zubin Mithra <zsm@chromium.org>,
        =?UTF-8?Q?Kai_Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>,
        Thorsten Leemhuis <linux@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Wed, 26 Jul 2023 at 10:07, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> (CC'ing Kai and Thorsten who have added the check to checkpatch)
>
> On Wed, Jul 26, 2023 at 08:24:50AM +0200, Ricardo Ribalda wrote:
> > On Tue, 25 Jul 2023 at 23:34, Laurent Pinchart wrote:
> > > On Thu, Jul 20, 2023 at 05:46:54PM +0000, Ricardo Ribalda wrote:
> > > > If the index provided by the user is bigger than the mask size, we might do an
> > > > out of bound read.
> > > >
> > > > CC: stable@kernel.org
> > > > Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
> > > > Reported-by: Zubin Mithra <zsm@chromium.org>
> > >
> > > checkpatch now requests a Reported-by tag to be immediately followed by
> > > a Closes tag that contains the URL to the report. Could you please
> > > provide that ?
> >
> > I saw that, but the URL is kind of private:
> >
> > Closes: http://issuetracker.google.com/issues/289975230
>
> Ah :-S I wonder if we should drop the Reported-by tag then ?
>
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > > Avoid reading index >= 31
> > > > ---
> > > > Changes in v2:
> > > > - Use BITS_PER_TYPE instead of 32 (thanks Sergey).
> > > > - Add Reported-by tag.
> > > > - Link to v1: https://lore.kernel.org/r/20230717-uvc-oob-v1-1-f5b9b4aba3b4@chromium.org
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > index 5e9d3da862dd..e59a463c2761 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -1402,6 +1402,9 @@ int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
> > > >       query_menu->id = id;
> > > >       query_menu->index = index;
> > > >
> > > > +     if (index >= BITS_PER_TYPE(mapping->menu_mask))
> > > > +             return -EINVAL;
> > > > +
> > >
> > > I'd move this a few lines up, before setting query_menu.
> >
> > SGTM, I just wanted to clear all the fields to mimic the other error
> > paths of the function.
>
> I'm fine with that too if you prefer.

Your call. I prefer my version, but I am of course biased :P

>
> > > With those minor changes,
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > There's no need for a v3, I can handle the changes locally, but I need
> > > the URL for the Closes tag.
> > >
> > > >       ret = mutex_lock_interruptible(&chain->ctrl_mutex);
> > > >       if (ret < 0)
> > > >               return -ERESTARTSYS;
> > > >
> > > > ---
> > > > base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
> > > > change-id: 20230717-uvc-oob-4b0148a00417
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
