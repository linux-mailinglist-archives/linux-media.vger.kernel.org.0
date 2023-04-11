Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5666DDA9A
	for <lists+linux-media@lfdr.de>; Tue, 11 Apr 2023 14:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjDKMRP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Apr 2023 08:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjDKMRO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Apr 2023 08:17:14 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1FB1A2
        for <linux-media@vger.kernel.org>; Tue, 11 Apr 2023 05:17:14 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id o2so7628043plg.4
        for <linux-media@vger.kernel.org>; Tue, 11 Apr 2023 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681215433; x=1683807433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw6PqzG6tN+gJZF2vp8mnC8V38zVasvKXmv3BeRQmUw=;
        b=YcQRknhJyvQ8I8Eeife8EJNFYcH6szLtmLSXvLmMZZncwL34JGXXTDFsP9binVVaxw
         z9EnMXuA/IARgEDZvra33FFN06pw7he/ZjuwpLzPPAuXsLOfl3xddZ3tyMZZzobt4Jnw
         2e00LUbqpCKjRjCeB9vblEFkZxtwG8jnTl4qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681215433; x=1683807433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jw6PqzG6tN+gJZF2vp8mnC8V38zVasvKXmv3BeRQmUw=;
        b=OCnrIeOFuNwoBFyosF8eqOdei3NwRpu6ie5hW/D8dmHwgAGPAnNekeZd0QJgnpKzH2
         pklsBuzJHeBRAuo0HzHRACfC0h+tIV1FQ9+0J+9GM/eVgksxgIRj9fgK7tKDclAJrKvv
         X6suZZ12MKbVyax44nk/CrCJ6WwPw5k14yL1/51V4uVDEj3trJg7A5gF8N/9cQ4SEFa7
         fXZXXSY4huHlSN7cvMxVRQW9IsgQjRugyWTdVZcaENpFbiChOWDzXlI8dSmcfL/yBXGd
         eAmFbryb5Q60WIDlS+3QnLGhpsWLjoCnjNCBUEVPNUBzHogDBhqwC7jnEVXmtTljZDFe
         8mjg==
X-Gm-Message-State: AAQBX9fGTpVosURGmcAtiYRmDXc17UNTDJperP8TbZI59PAf0sCBLb5B
        TjPDiEYZMcJqxE/Z3MjlinR0U9kWyzx4Ln3vF0E=
X-Google-Smtp-Source: AKy350ZN6M3+PQQFD1yoo5cY7Zw6T+5Aj5KSv37nnnXTKIh8xnzbCIxNYsy8j93ey821pdkBvFvTTg==
X-Received: by 2002:a17:90b:1650:b0:246:b9e3:aab5 with SMTP id il16-20020a17090b165000b00246b9e3aab5mr5727448pjb.21.1681215433200;
        Tue, 11 Apr 2023 05:17:13 -0700 (PDT)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com. [209.85.214.182])
        by smtp.gmail.com with ESMTPSA id lr1-20020a17090b4b8100b00246cfdb570asm1794563pjb.27.2023.04.11.05.17.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 05:17:12 -0700 (PDT)
Received: by mail-pl1-f182.google.com with SMTP id kh6so6058303plb.0
        for <linux-media@vger.kernel.org>; Tue, 11 Apr 2023 05:17:12 -0700 (PDT)
X-Received: by 2002:a17:90a:94c6:b0:244:9b8f:c3bf with SMTP id
 j6-20020a17090a94c600b002449b8fc3bfmr3284326pjw.7.1681215431866; Tue, 11 Apr
 2023 05:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl> <e66fceb5-6621-54bb-cffb-66889941cf17@leemhuis.info>
In-Reply-To: <e66fceb5-6621-54bb-cffb-66889941cf17@leemhuis.info>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 11 Apr 2023 14:17:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCs9sTG0pUy3jZiz8JzVArMbRaZ5j7psb-_iCqi2R1NyDg@mail.gmail.com>
Message-ID: <CANiDSCs9sTG0pUy3jZiz8JzVArMbRaZ5j7psb-_iCqi2R1NyDg@mail.gmail.com>
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown pixelformats
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        regressions@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thorsten

On Tue, 11 Apr 2023 at 13:51, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 29.03.23 14:28, Hans Verkuil wrote:
> > If the fcc is 0 (indicating an unknown GUID format), then fill in the
> > description field in ENUM_FMT. Otherwise the V4L2 core will WARN.
> >
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
>
> Thx for working on this.
>
> Would be good to have Reported-by and Link tags for any reports about
> the issue; I'm aware of the following two, maybe there were more:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=217252
> https://bugzilla.redhat.com/show_bug.cgi?id=2180107
>
> And a Cc: <stable@vger.kernel.org> # 5.15.x would likely be good as
> well, as the culprit was backported.
>
> But I write for a different reason: how urgent is this fix? Is this
> "just" fixing a kernel warning, or do users notice this as some apps
> crash? The bugzilla.redhat.com ticket's subject indicates it's the
> latter; and I think I saw someone else mentioning that this leads to
> crashes, but maybe I'm mixing things up.

I think it only a crash if panic_on_warn is enabled.

>
> Because if this fixes a crash, it afaics would be good to get this fixed
> rather sooner than later in mainline, so that it can be fixed in stable
> as well.
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
>
> > ---
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 7aefa76a42b3..2f1ced1212cd 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
> >               } else {
> >                       dev_info(&streaming->intf->dev,
> >                                "Unknown video format %pUl\n", &buffer[5]);
> > +                     snprintf(format->name, sizeof(format->name), "%pUl\n",
> > +                              &buffer[5]);
> > +
> >                       format->fcc = 0;
> >               }
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 35453f81c1d9..fc6f9e7d8506 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> >       if (format->flags & UVC_FMT_FLAG_COMPRESSED)
> >               fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
> >       fmt->pixelformat = format->fcc;
> > +     if (format->name[0])
> > +             strscpy(fmt->description, format->name,
> > +                     sizeof(fmt->description));
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 9a596c8d894a..22656755a801 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -264,6 +264,8 @@ struct uvc_format {
> >       u32 fcc;
> >       u32 flags;
> >
> > +     char name[32];
> > +
> >       unsigned int nframes;
> >       struct uvc_frame *frame;
> >  };
> >
> >
> >



-- 
Ricardo Ribalda
