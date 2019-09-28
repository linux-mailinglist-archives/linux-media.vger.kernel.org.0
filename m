Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4C0CC1170
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2019 19:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbfI1RCV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Sep 2019 13:02:21 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35567 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfI1RCV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Sep 2019 13:02:21 -0400
Received: by mail-io1-f68.google.com with SMTP id q10so26165414iop.2;
        Sat, 28 Sep 2019 10:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nsn5RNui/wYoQeLsfCsdYPJc8RIh0LlvrJMCZy9B00U=;
        b=AcntU8ZiAQ7bhWMrePguPrbeqSmlkWHtPFCGV5GGeHxVP7OF0XMOx3YBUxQu4410Ck
         euWaL9/ELTgVTlcfgLurn1uJaTjayTnlY77IP9s8yKgrkjSsREsXaroSb/3lDg1DITbB
         cvO94OIBuuwFAQZkTdynxtpS/GSNaLqQcUkIBIPkWI/Un1U+6QWhsisd166twxDl3oae
         AhtuQGT7EfGInKE8qbjsB/YAU5pYh1kMhS+NEYsghYQqbq/QuntqkZJDZCbix7qHU4+5
         /SKFLMaavoPrR1x+ZpIjvjBsLU1HHmZPzPny1HLmlbjpQiT7P6xOJwRYaoQ9NxMvaL9g
         OdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nsn5RNui/wYoQeLsfCsdYPJc8RIh0LlvrJMCZy9B00U=;
        b=JerFAoBwWxIlB+lGkR+fVEz+HslfDe0tZCbMx0JHcZKbOXdRfnG4I2rVm+Mny4XUs4
         0SXBFDsWHzkcbd/Xp9igNN+25ZVVWWnQG01FaQR9JKjW8k5MHFgOdeGpXpD03+j/l+95
         64wb9RQX0SBOH968UilJfMyMakBbu+yOAiyDKly8up4FgqdJjUVb5nIkG9lf7pXIg2Tj
         e5H+/ndYKd9mboR+dz96DTtiw+cliGEBfb/5nRqog+bsQb3d1CnmTc0TcuTeQGoKWPke
         WMdkEdqAsPFqdl4l1Xf/W6sbzbFGAa+eTbnRkVCbXi66ATkSCWPryD0kTrAV3xlfJDG2
         fgDg==
X-Gm-Message-State: APjAAAWxPmCd1Jpu2BnDotfJ5KwjFjPsEEYATy2NDkzrY66iCU6n6ds5
        7Bzuw8j9sRk8uKjgJGHtJ7q1ep2E+c2zHeyoK+g=
X-Google-Smtp-Source: APXvYqwwGDcrpv4+NAWmHADNF9nBbxIW2FvhMJ0xaH9IqbF1LPUPImBbXHq4tWbdEONn6PBtEZltwB6XOVyFGJO+caI=
X-Received: by 2002:a92:d206:: with SMTP id y6mr11816566ily.208.1569690140551;
 Sat, 28 Sep 2019 10:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190915184419.32184-1-lucmaga@gmail.com> <f9670de6-5586-0067-936e-87ebf8a20609@xs4all.nl>
In-Reply-To: <f9670de6-5586-0067-936e-87ebf8a20609@xs4all.nl>
From:   =?UTF-8?Q?Lucas_Magalh=C3=A3es?= <lucmaga@gmail.com>
Date:   Sat, 28 Sep 2019 14:02:09 -0300
Message-ID: <CAK0xOaFKmpazKwHmT74Kw2OCZ+y6KQC-h+KLTzThxS-3QxomEg@mail.gmail.com>
Subject: Re: [PATCH v2] media: vimc: fla: Add virtual flash subdevice
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        edusbarretto@gmail.com, lkcamp@lists.libreplanetbr.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the review. Sorry about the style mistakes, will be careful
next time.
Just a couple of questions.

On Fri, Sep 20, 2019 at 8:32 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> > +static int vimc_fla_s_ctrl(struct v4l2_ctrl *c)
> > +{
> > +
> > +     struct vimc_fla_device *vfla =
> > +             container_of(c->handler, struct vimc_fla_device, hdl);
> > +
> > +     switch (c->id) {
> > +     case V4L2_CID_FLASH_LED_MODE:
> > +             vfla->led_mode = c->val;
> > +             return 0;
> > +     case V4L2_CID_FLASH_STROBE_SOURCE:
> > +             vfla->strobe_source = c->val;
> > +             return 0;
> > +     case V4L2_CID_FLASH_STROBE:
> > +             if (vfla->led_mode != V4L2_FLASH_LED_MODE_FLASH ||
> > +                 vfla->strobe_source != V4L2_FLASH_STROBE_SOURCE_SOFTWARE){
> > +                     return -EILSEQ;
> > +             }
> > +             vfla->is_strobe = true;
> > +             vfla->kthread = kthread_run(vimc_fla_strobe_thread, vfla, "vimc-flash thread");
>
> What if the thread is already running?
>
> I wonder what existing flash drivers do if V4L2_CID_FLASH_STROBE is called
> repeatedly. Perhaps returning EBUSY if strobe is still active makes sense here.
>
> It would also be a nice feature if keeping the strobe on for more than X seconds
> would create a V4L2_FLASH_FAULT_LED_OVER_TEMPERATURE fault.
>
How would you expect this? At this point I will never cross the maximum timeout
configured. I don't expect a driver to fail if I set a value within
the configuration
borders.

> > +     v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                            V4L2_CID_FLASH_LED_MODE,
> > +                            V4L2_FLASH_LED_MODE_TORCH, ~0x7,
> > +                            V4L2_FLASH_LED_MODE_NONE);
> > +     v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                            V4L2_CID_FLASH_STROBE_SOURCE, 0x1, ~0x3,
> > +                            V4L2_FLASH_STROBE_SOURCE_SOFTWARE);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_STROBE, 0, 0, 0, 0);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_STROBE_STOP, 0, 0, 0, 0);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_TIMEOUT, 0,
> > +                       VIMC_FLASH_TIMEOUT_MAX,
> > +                       VIMC_FLASH_TIMEOUT_STEP,
> > +                       VIMC_FLASH_TIMEOUT_STEP);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_TORCH_INTENSITY, 0, 255, 1, 255);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_INTENSITY, 0, 255, 1, 255);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,V4L2_CID_FLASH_INDICATOR_INTENSITY
> > +                       V4L2_CID_FLASH_INDICATOR_INTENSITY, 0, 255, 1, 255);
>
> Can you look at existing flash drivers and copy the min/max/step/def values?
>
> The values here are rather arbitrary. It would be nice if it was a bit more
> realistic.

I didn't found any driver implementing
V4L2_CID_FLASH_INDICATOR_INTENSITY. Do you have
any examples for this? For the other ones I'm copying the lm3646 for
the other ones.

Regards,
Lucas
