Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 517EA587C5A
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 14:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236568AbiHBMYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 08:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbiHBMYL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 08:24:11 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30934E874
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 05:24:10 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id dc19so2903705ejb.12
        for <linux-media@vger.kernel.org>; Tue, 02 Aug 2022 05:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=nBBW4WUXiXRlo7hadh/ZCmmBwA7CwRZbKxauE3bKnoA=;
        b=JFD9R4eWz5PWP5ASd/Q8KIy2kErqcEOlkNehQLebcnsEDhgjsDIfLAga0nF+0hjbjG
         c7GGgAnh1ISlqQss+xfnQr0cwJgLZ26z/ctJZMy2I/qYt0C55JLWQH5DN4K7wRn3mA4e
         im8HULoHEfQVX3cqsKWowuYSYwGgBgWN6FKtfP/dPqocQL2iLZsI7B7vvNuTCPZGnIUz
         iiMEg5Cfh1NP6co8nzGHaVWYJPeGaCnSILtCjdTUYfNIC+k8EMgS6PLVM0PB/8hm+Msb
         oLCnEKa2je4HNPEmx0RpPMJs3a+0YgkxrjEv+ITsSPW8chUSOYX+aONlB7fX4Bea9DMi
         I/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=nBBW4WUXiXRlo7hadh/ZCmmBwA7CwRZbKxauE3bKnoA=;
        b=PAkD/twd5IKLmPn5n5s/lUZUBvI6dp3J2c5PJ3YQL7rOoNlnZ/kvanMxrWUHqbNtxK
         4wzGgCw4WC0IBVlcVANXd5JprC9KHr/5DD4dFyvcZYtbbpmTCSD5/TlHohGCDdcw6M5+
         BDUKGucVOFzSOtNKTvdvG3fdirhmHw0llJFEEf79/T+DK70WZQJyv8ig2ks+GLdvsRWM
         Wu0H/BSJYY+8lth3kcrM/fQO3Yit7UA5AM4cwNWvVf7Efkm+rZBmw0w12xePPMaEDuSw
         aKRvVu83EfUz/rzFuSe6o2X0BFEVWLyybpPT0dIhD6YZgQjsL22+L8Ba4fYUqUlHP4ZG
         OutQ==
X-Gm-Message-State: AJIora/iXPqxzGD6hAXqTbLu6ujKZSID87w/AsQCdk+MYYwnSpY2BlgR
        U10/sOr+a7kNEcALbbrilMzQdY7dGIlNWh95qhA=
X-Google-Smtp-Source: AGRyM1voK7Vpv7M0zvOFBJSw9LbwaT3zVrmjcEXPyxPqH1VuXnVBTzILvsPM1l+9fX3rFDt8TdqFwRZxrJwTIFmVJuI=
X-Received: by 2002:a17:907:28d6:b0:72b:7497:76b with SMTP id
 en22-20020a17090728d600b0072b7497076bmr15672001ejc.365.1659443049375; Tue, 02
 Aug 2022 05:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220728114050.2400475-1-hljunggr@cisco.com> <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75Ve6-BQ_Ajst96cr=XvJGV247_FYLTHTz=nvTCC3NhQa1A@mail.gmail.com>
 <db2d74d0ab17b407223092c8e0e01784d36bbda1.camel@cisco.com>
 <CAHp75Vc2qWQXk-+0ath8zuTaGHmSG_ZiUYih=4rGeKx3_nmtsQ@mail.gmail.com>
 <b426bd08-6c52-3891-9319-b6cc52bdfbab@xs4all.nl> <CAHp75Vdtv6qtjxACA+nET2wyzHpHqxvPeZ-KhRWSByGtH4T5TQ@mail.gmail.com>
 <5d3fe43f-5615-137d-b712-f6c9079460cd@xs4all.nl> <CAHp75VfWhzz4jzyQAD4UYTN8dBWiKsvimKOPiKozGyNd2_oj=A@mail.gmail.com>
In-Reply-To: <CAHp75VfWhzz4jzyQAD4UYTN8dBWiKsvimKOPiKozGyNd2_oj=A@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Aug 2022 14:23:32 +0200
Message-ID: <CAHp75Vd60urVv5R+fE+xxqMNJhJSmXZnfJJwU5t-m3E_T+pcWA@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "Erling Ljunggren (hljunggr)" <hljunggr@cisco.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "jonathansb1@gmail.com" <jonathansb1@gmail.com>
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

On Tue, Aug 2, 2022 at 2:21 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Aug 2, 2022 at 11:06 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > On 8/2/22 10:42, Andy Shevchenko wrote:
> > > On Mon, Aug 1, 2022 at 8:35 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > >> On 01/08/2022 16:57, Andy Shevchenko wrote:
> > >>> On Mon, Aug 1, 2022 at 3:07 PM Erling Ljunggren (hljunggr)
> > >>> <hljunggr@cisco.com> wrote:
> > >>>> On Fri, 2022-07-29 at 17:51 +0200, Andy Shevchenko wrote:
> > >>>>> On Thu, Jul 28, 2022 at 1:53 PM Erling Ljunggren <hljunggr@cisco.com>
> > >>>>> wrote:
>
> ...
>
> > >>>>>> +       state = kzalloc(sizeof(*state), GFP_KERNEL);
> > >>>>>> +       if (!state)
> > >>>>>> +               return -ENOMEM;
> > >>>>>
> > >>>>> devm_kzalloc() ?
> > >>>>
> > >>>> This will fail if the device is forcibly unloaded while some
> > >>>> application has the device node open.
> > >>>
> > >>> I'm not sure how it's related. Can you elaborate a bit, please?
> > >>>
> > >>> If you try to forcibly unload the device (driver) when it's open and
> > >>> it somehow succeeds, that will be a sign of lifetime issues in the
> > >>> code.
> > >>
> > >> Not with rmmod but using the unbind facility.
> > >
> > > And what is the difference? The device driver core calls the same, no?
> >
> > rmmod when the /dev/videoX is open won't work (device is busy), whereas
> > unbind *will* work, and it is really the same as a USB unplug.
>
> Seems there are no guards against that.
>
> > >> For new media drivers we generally
> > >> want to avoid using devm_*alloc, it causes more problems than it solves.
> > >
> > > I think it's because people don't think much about the lifetime of
> > > objects. I don't think devm is an issue here.
> >
> > Yes, it is: unbind will call the driver remove() function, and after that
> > function all memory allocated with devm_*alloc will be freed immediately.
>
> Yes.
>
> > But if an application still has a filehandle open and was possibly even in
> > the middle of an ioctl call, then having the memory removed instantaneously
> > is a really bad thing.
>
> True.
>
> > Hotpluggable devices in general definitely should not use it. I'm not a fan
> > of devm_*alloc anymore.
>
> You are blaming the wrong man here, i.e. devm. The problem as I stated
> above is developers who do not understand (pay attention to) the
> lifetime of the objects.

That said, the devm has nothing to do with the driver still being
problematic for the scenario you described, no?


-- 
With Best Regards,
Andy Shevchenko
