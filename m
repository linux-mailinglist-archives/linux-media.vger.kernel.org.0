Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 287105BFD59
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 13:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbiIULwz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 07:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiIULww (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 07:52:52 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419181E3CA
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 04:52:51 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id x18so3725252qkn.6
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 04:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ztkPTO/3zU/fJZBp6GXCzLEpY4apMVewC69u7Jq+BZk=;
        b=Lj9+97UtsVnIpvWkTLMUo5DyhqQmqyfjAgbB0D6Okckthx/OCCu6+bhu62wkTSS80W
         uhBhUlBTMod54/ufWbRPPP0XEor38J0Izelzj3lb8qWrIN/6fcAP/ZuucifA0rZS2+Nf
         WzZ2Uk+2xr9lZn3J3CDqAcYoCOdjQrRb1Z6Z5Nq2VTDCtDDaFBnD2ktbJC6awD9WQCFt
         /VRul031IOoGceMGLtarlR6edIgUJFW1HNH0Knz7Rc1UWWPwaYATn7m/FI0LfnhXCTE7
         UbZ/Ti1JrsaxT+bF+mNhR8UREMnYUMhw23nywg4Q+S0Xu2W0qWP7h8ZsuRwYRKYhAesT
         eqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ztkPTO/3zU/fJZBp6GXCzLEpY4apMVewC69u7Jq+BZk=;
        b=tHutStU7s8QH5yL8eQc3uUgfJPZSMMMFkbfOcCWOLWIjN91FBnY/fDkFtTgal2ttsW
         HvfIDufrpD78Mq2vjUW5WCivpLpUMEW6g3fncG/j150EOTk+QHi/20+pShlMlQLUANPM
         czHCoT1iZMk+OBFllJ7xPqId4atnufIPLTKDNvarPMKhFyxjJWh8a0JeJogmaRKiC8cv
         jZ8L8B0ToaS+DppbuARibR5k2R4EABXbdZjA16yurDAxQXA/Wa5MEaF92BcR/YhgsGRL
         Z8JTzTYNcMKNRnNCmkpCqw2hfaAyv7bgXqj52YX7+jVqzLxeP2/ggi4IcBrVUy8EDlxb
         VPiw==
X-Gm-Message-State: ACrzQf06lrsh24MuYg+LD393ef2RzyCSuOAdcGS5ioAXGlYxXPB2NE/o
        XG9Q7VhyQPtOhzbD08HIqFTK4+RXZW4H6kDd1yY=
X-Google-Smtp-Source: AMsMyM4Y4moSUGLwnzoqwyA5tgcCeV4jlTGsC8LbF/rWVJ8jxHFZxUwnvolthuiSFRE2M59BDF5+C2VPd82iMb3R5Lw=
X-Received: by 2002:a05:620a:4454:b0:6ce:bfbf:7e3f with SMTP id
 w20-20020a05620a445400b006cebfbf7e3fmr18022702qkp.748.1663761170354; Wed, 21
 Sep 2022 04:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220911171653.568932-1-hdegoede@redhat.com> <20220911171653.568932-2-hdegoede@redhat.com>
 <Yx8T/uEKvVDoCvsT@smile.fi.intel.com> <c52e1abb-0796-b88a-4a94-fa14c09ffcfe@redhat.com>
In-Reply-To: <c52e1abb-0796-b88a-4a94-fa14c09ffcfe@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 21 Sep 2022 14:52:14 +0300
Message-ID: <CAHp75VdvAWQ3OyP3eXFot7VB8a_pf5SmjbceZREDxz4fDWcT2Q@mail.gmail.com>
Subject: Re: [PATCH 01/17] media: atomisp: Use a normal mutex for the main lock
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 21, 2022 at 11:52 AM Hans de Goede <hdegoede@redhat.com> wrote:
> On 9/12/22 13:11, Andy Shevchenko wrote:
> > On Sun, Sep 11, 2022 at 07:16:37PM +0200, Hans de Goede wrote:
> >> There is no reason for atomisp to use a rt_mutex instead of a normal
> >> mutex, so switch over to a normal mutex.
> >>
> >> All the changes in this patch are just s/rt_mutex/mutex/.
> >>
> >> This is a preparation patch for switching the ioctl locking over
> >> to using the video_dev.lock member so that the v4l2-core takes
> >> care of the locking.
> >
> > So the idea behind rt_mutex here is to inherit the priority on the task.
>
> Right.
>
> > I'm wondering what could be possible the bottle neck this is trying to
> > solve.
>
> I don't think there is any specific reasoning behind the code using
> this. The atomisp code is quite questionable in lots of cases and
> I have a feeling this was just a case of "oh this sounds like
> it is faster, lets use this" .

Honestly, this is exactly what is my attitude towards the AtomISP2
codebase. But I asked to be sure that you probably investigated that
more.

> > If there is no other V4L2 driver that does the same, any specific
> > run flow of AtomISP v2 code that may suffer of this?
>
> See above.


-- 
With Best Regards,
Andy Shevchenko
