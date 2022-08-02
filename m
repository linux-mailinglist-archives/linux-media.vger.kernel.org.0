Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6652587C51
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 14:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237022AbiHBMWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 08:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236860AbiHBMWB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 08:22:01 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88492CE3B
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 05:22:00 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id j8so373704ejx.9
        for <linux-media@vger.kernel.org>; Tue, 02 Aug 2022 05:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=fS4QQoDf7pUafKIHkM0g0zIpxTGdJdCQtD9MHDl1scQ=;
        b=CPJyhDJcz6xRfBW+yY10zV5/7CpidgFvJM+C1EjTkOhKAu0vKYAt+3YLejQQag80cp
         8Rj+jYtHAw0YndltgF2I93vzOxIFVLhaxIMYpjBD6o4HproFUetMN8RBvzAW4sIyVT+C
         yfJ7GHKE+LClRrhOX8oN3PT/pCuwT9z1qZoQuywR+jw2T9DNwysdpPn6WxnGLHiM6Yy1
         BSL7TkophdYsOVZ9PY2JrVIKLwM7Psnf+CKizbxSX1V+DUmhIDdGGfJvm2CQRL1WWMr9
         Bx60vD0SV3ZDsPc3IJezAcdlNjc5so7xOZ4ZSigC++C6plKyYspWiACyVb41px0Ec6wX
         DJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fS4QQoDf7pUafKIHkM0g0zIpxTGdJdCQtD9MHDl1scQ=;
        b=B37e+nh/aYrOwJQm8TL5COK+hB5YvtOqrvvQXKnjt4jhBxSuoUKUfbY7AqvAE0wWpG
         /p0QyBfXrM5x7nmQrtBuj5RzGNOBFpiangmnZmgGK8+IH01PeQzU+jIOqHgVzW4fK09P
         QeQS6my9GLBZsdVwFwPsgJ6ddmRfIpeaTuYhWwfZCOoFWdhAmFV8NwDNgDk5qgcDssy8
         tA/uE1iK6qW0IMyfGVIts82K3FGzFE/DpT5Sknendb+E2sNAbVwd5L1qNEXZV5nXDwhl
         Jy1/gP3n6Ot9CbqEfvx0X+MeFUZSApMeftP2AsIYv2YlpgB5BXshDIL8R3jbjoUhyb4N
         yM5w==
X-Gm-Message-State: AJIora/lBLbND9A+5DPIgIGdEehoctyWt3WQOe9K/Jqo+LVTWNIor/Hb
        oiT6vNpfdWQA3U6PBthwUu/Zz7qHSfukmpEFSzvXKD8plXk=
X-Google-Smtp-Source: AGRyM1vuWZeEobNR02A+35RRxsnEskW/Jfr1+LvHScd2PdUcJ5yTIJwIKmIE1yVfwQwJ4Btyg4d5I0iBZKJZRw0s4oU=
X-Received: by 2002:a17:907:6e02:b0:72b:9f16:1bc5 with SMTP id
 sd2-20020a1709076e0200b0072b9f161bc5mr16742445ejc.676.1659442919062; Tue, 02
 Aug 2022 05:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220728114050.2400475-1-hljunggr@cisco.com> <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75Ve6-BQ_Ajst96cr=XvJGV247_FYLTHTz=nvTCC3NhQa1A@mail.gmail.com>
 <db2d74d0ab17b407223092c8e0e01784d36bbda1.camel@cisco.com>
 <CAHp75Vc2qWQXk-+0ath8zuTaGHmSG_ZiUYih=4rGeKx3_nmtsQ@mail.gmail.com>
 <b426bd08-6c52-3891-9319-b6cc52bdfbab@xs4all.nl> <CAHp75Vdtv6qtjxACA+nET2wyzHpHqxvPeZ-KhRWSByGtH4T5TQ@mail.gmail.com>
 <5d3fe43f-5615-137d-b712-f6c9079460cd@xs4all.nl>
In-Reply-To: <5d3fe43f-5615-137d-b712-f6c9079460cd@xs4all.nl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Aug 2022 14:21:21 +0200
Message-ID: <CAHp75VfWhzz4jzyQAD4UYTN8dBWiKsvimKOPiKozGyNd2_oj=A@mail.gmail.com>
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

On Tue, Aug 2, 2022 at 11:06 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 8/2/22 10:42, Andy Shevchenko wrote:
> > On Mon, Aug 1, 2022 at 8:35 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >> On 01/08/2022 16:57, Andy Shevchenko wrote:
> >>> On Mon, Aug 1, 2022 at 3:07 PM Erling Ljunggren (hljunggr)
> >>> <hljunggr@cisco.com> wrote:
> >>>> On Fri, 2022-07-29 at 17:51 +0200, Andy Shevchenko wrote:
> >>>>> On Thu, Jul 28, 2022 at 1:53 PM Erling Ljunggren <hljunggr@cisco.com>
> >>>>> wrote:

...

> >>>>>> +       state = kzalloc(sizeof(*state), GFP_KERNEL);
> >>>>>> +       if (!state)
> >>>>>> +               return -ENOMEM;
> >>>>>
> >>>>> devm_kzalloc() ?
> >>>>
> >>>> This will fail if the device is forcibly unloaded while some
> >>>> application has the device node open.
> >>>
> >>> I'm not sure how it's related. Can you elaborate a bit, please?
> >>>
> >>> If you try to forcibly unload the device (driver) when it's open and
> >>> it somehow succeeds, that will be a sign of lifetime issues in the
> >>> code.
> >>
> >> Not with rmmod but using the unbind facility.
> >
> > And what is the difference? The device driver core calls the same, no?
>
> rmmod when the /dev/videoX is open won't work (device is busy), whereas
> unbind *will* work, and it is really the same as a USB unplug.

Seems there are no guards against that.

> >> For new media drivers we generally
> >> want to avoid using devm_*alloc, it causes more problems than it solves.
> >
> > I think it's because people don't think much about the lifetime of
> > objects. I don't think devm is an issue here.
>
> Yes, it is: unbind will call the driver remove() function, and after that
> function all memory allocated with devm_*alloc will be freed immediately.

Yes.

> But if an application still has a filehandle open and was possibly even in
> the middle of an ioctl call, then having the memory removed instantaneously
> is a really bad thing.

True.

> Hotpluggable devices in general definitely should not use it. I'm not a fan
> of devm_*alloc anymore.

You are blaming the wrong man here, i.e. devm. The problem as I stated
above is developers who do not understand (pay attention to) the
lifetime of the objects.

-- 
With Best Regards,
Andy Shevchenko
