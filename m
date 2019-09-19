Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58637B8782
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 00:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404466AbfISWjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 18:39:49 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33853 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393525AbfISWjs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 18:39:48 -0400
Received: by mail-ed1-f67.google.com with SMTP id p10so4643649edq.1
        for <linux-media@vger.kernel.org>; Thu, 19 Sep 2019 15:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MMUjJCwIl0O1q1PtvFRwqlu/rYQ+tpcv/qKGn4UhdgA=;
        b=nvIPEjO1WeoDUWrnWwCmiI8mGeM+jGArxJPGVfCfHiRyhLSci3YlZ4rIIZBwTNGz5Q
         AGX76maDriHa97Ub2/b0xqOUax0ZFAWObJ9QSiVKkLB6nol8PW/sQrK15ar2cb1Sp5gb
         f9nW7TG1IZYJq60jyyKy/quLssWhQqNarivPMMmn8bydY3iDJDeuMiPoMUsjdBk2o+DW
         f54bB2d6oEB2BJNmQP4RvFoqLKhZWSfB+6f7CbkqDOTJiTiGisnibmawv6OO2wCwxKvH
         eTy1K6mhUVfYLvtEmbeBZ8+nrHkzE8OYvqZFjOapaH9xN1zF1oN4bEY5BJa+Z+kJOcTg
         fHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MMUjJCwIl0O1q1PtvFRwqlu/rYQ+tpcv/qKGn4UhdgA=;
        b=iviMtPgZT5bHwwKL7bqBokbmgql4ZAptcxRldJ8wW2XpRGWMcmnV5NfFCc0ALk0/kl
         4HZImxEeFiA/RjSIpHhtfidxbgEhXhApEZLQGCsSh/eXjeoR/SfjRUUGictGUDaHs0jq
         o3TPKw3X2B+I8Cjs7we6LDd0i/dxDpHM+yfnbD+vo5b/LsZi0aXssD5e1O1mTvS3uBZk
         BvdJrp8mLCAYPLEyRY8W9+1WcjlTp9kGXgkqLzT5LWh3686Tf48YXSakgx8bThT9qYWC
         qtypwayMd3XbFxJdl059RO2Y53lEmO/CJQPS0o+JXxNzjQ8VZxZqizwirqeprL1QBnGq
         OMFA==
X-Gm-Message-State: APjAAAXLyLUpAKLjwXysfRPp3MUJo4FGKc/AfPmvrK9XkoTBRM9aR1ov
        pTTnR/JGAReOGrGigjkgTHOw0aBiEQ8YRwjZeBw=
X-Google-Smtp-Source: APXvYqxzmrmmAO7X+jj/6MZ10sKVva39TYFo83SPWoEMk9iIqCCsW5xeMm8zxuGbeez8n+hi5znolBdbXH8CQy6qZZ0=
X-Received: by 2002:a50:bb22:: with SMTP id y31mr19327451ede.58.1568932785955;
 Thu, 19 Sep 2019 15:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190919151358.7030-1-pretoriano.mp@gmail.com> <20190919154016.l32myqh5zzccbggf@gofer.mess.org>
In-Reply-To: <20190919154016.l32myqh5zzccbggf@gofer.mess.org>
From:   Flavius Adrian <pretoriano.mp@gmail.com>
Date:   Fri, 20 Sep 2019 01:39:35 +0300
Message-ID: <CAOLSq=CPHeYpJ_j+0ZRjO0LtSC8qy4p9rfXP6d4_cPT0d8C9fA@mail.gmail.com>
Subject: Re: [PATCH] media: rc: Add support for another iMON 0xffdc device
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        Chris Vandomelen <chris@sightworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 19, 2019 at 6:40 PM Sean Young <sean@mess.org> wrote:
>
> Hi Flavius,
>
> Please make sure you label your patch with sequentially increasing versions.
> I think the last one was v3 and there is no v4.
>
Hi Sean,
thanks for taking the time to review this patch.
I decided to re-send the patch because the previous one was a bit messy,
mostly because some mistakes i did,so that's why there's no version on
this one.Please ignore the previous ones.

> On Thu, Sep 19, 2019 at 06:13:58PM +0300, Flavius Georgescu wrote:
> > The device it's an iMON UltraBay (0x98 in config byte) with LCD,
> > IR and dual-knobs front panel.
> >
> > To work properly the device also require its own key table,
> > and repeat suppression for all buttons.
> >
> > Signed-off-by: Flavius Georgescu <pretoriano.mp@gmail.com>
> > Co-developed-by: Chris Vandomelen <chris@sightworks.com>
> > Signed-off-by: Chris Vandomelen <chris@sightworks.com>
> > ---
> >  drivers/media/rc/imon.c | 46 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >
> > diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> > index 37a850421fbb..17141d57e311 100644
> > --- a/drivers/media/rc/imon.c
> > +++ b/drivers/media/rc/imon.c
> > @@ -83,6 +83,7 @@ struct imon_usb_dev_descr {
> >       __u16 flags;
> >  #define IMON_NO_FLAGS 0
> >  #define IMON_NEED_20MS_PKT_DELAY 1
> > +#define IMON_SUPPRESS_REPEATED_KEYS 2
> >       struct imon_panel_key_table key_table[];
> >  };
> >
> > @@ -315,6 +316,32 @@ static const struct imon_usb_dev_descr imon_DH102 = {
> >       }
> >  };
> >
> > +/* imon ultrabay front panel key table */
> > +static const struct imon_usb_dev_descr ultrabay_table = {
> > +     .flags = IMON_SUPPRESS_REPEATED_KEYS,
> > +     .key_table = {
> > +             { 0x0000000f0000ffeell, KEY_MEDIA },      /* Go */
> > +             { 0x000000000100ffeell, KEY_UP },
> > +             { 0x000000000001ffeell, KEY_DOWN },
> > +             { 0x000000160000ffeell, KEY_ENTER },
> > +             { 0x0000001f0000ffeell, KEY_AUDIO },    /* Music */
> > +             { 0x000000200000ffeell, KEY_VIDEO },    /* Movie */
> > +             { 0x000000210000ffeell, KEY_CAMERA },   /* Photo */
> > +             { 0x000000270000ffeell, KEY_DVD },
> > +             { 0x000000230000ffeell, KEY_TV },
> > +             { 0x000000050000ffeell, KEY_PREVIOUS },
> > +             { 0x000000070000ffeell, KEY_REWIND },
> > +             { 0x000000040000ffeell, KEY_STOP },
> > +             { 0x000000020000ffeell, KEY_PLAYPAUSE },
> > +             { 0x000000080000ffeell, KEY_FASTFORWARD },
> > +             { 0x000000060000ffeell, KEY_NEXT },
> > +             { 0x000100000000ffeell, KEY_VOLUMEUP },
> > +             { 0x010000000000ffeell, KEY_VOLUMEDOWN },
> > +             { 0x000000010000ffeell, KEY_MUTE },
> > +             { 0, KEY_RESERVED },
> > +     }
> > +};
> > +
> >  /*
> >   * USB Device ID for iMON USB Control Boards
> >   *
> > @@ -1661,6 +1688,17 @@ static void imon_incoming_packet(struct imon_context *ictx,
> >                       return;
> >               }
> >       }
> > +     /* KEY repeats from knob need to be suppressed */
> > +     if (ictx->dev_descr->flags & IMON_SUPPRESS_REPEATED_KEYS) {
> > +             if (ictx->kc == ictx->last_keycode) {
> > +                     msec = ktime_ms_delta(t, prev_time);
> > +                     if (msec < ictx->idev->rep[REP_DELAY]) {
> > +                             spin_unlock_irqrestore(&ictx->kc_lock, flags);
> > +                             return;
> > +                     }
> > +             }
> > +     }
>
> This can probably be merged with previous statement. Also, the nested ifs
> can be shorted with &&.
>
>         if (itc->kc == KEY_MUTE ||
>             ictx->dev_descr->flags & IMON_SUPPRESS_REPEATED_KEYS) {
>                 if (ictx->kc == ictx->last_keycode &&
>                     ktime_ms_delta(t, prev_time) < ictx->idev->rep[REP_DELAY]) {
>                         spin_unlock_irqrestore(&ictx->kc_lock, flags);
>                         return;
>                 }
>         }
>
>
> Something like that a least. No need for the msec variable.
>
Thanks for the advice,already tested your solution and it's working.I
will send a new revision which will include your changes.

> > +
> >       prev_time = t;
> >       kc = ictx->kc;
> >
> > @@ -1848,6 +1886,14 @@ static void imon_get_ffdc_type(struct imon_context *ictx)
> >               dev_info(ictx->dev, "0xffdc iMON Inside, iMON IR");
> >               ictx->display_supported = false;
> >               break;
> > +     /* Soundgraph iMON UltraBay */
> > +     case 0x98:
> > +             dev_info(ictx->dev, "0xffdc iMON UltraBay, LCD + IR");
> > +             detected_display_type = IMON_DISPLAY_TYPE_LCD;
> > +             allowed_protos = RC_PROTO_BIT_IMON | RC_PROTO_BIT_RC6_MCE;
> > +             ictx->dev_descr = (struct imon_usb_dev_descr *) &ultrabay_table;
>
> No cast needed here (I think).
>
Sadly,i couldn't figure a way around that and i know that probably
isn't the best solution.
If you have a better solution to set the key table,please let me know
and i will be glad to
test it.

> > +             break;
> > +
> >       default:
> >               dev_info(ictx->dev, "Unknown 0xffdc device, defaulting to VFD and iMON IR");
> >               detected_display_type = IMON_DISPLAY_TYPE_VFD;
> > --
> > 2.20.1



-- 
Flavius
