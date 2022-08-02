Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFD0258803A
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 18:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbiHBQ1O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 12:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237539AbiHBQ1L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 12:27:11 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E11233E0E
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 09:27:09 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id tk8so26872338ejc.7
        for <linux-media@vger.kernel.org>; Tue, 02 Aug 2022 09:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=EE3GROpUC29/EPaaQryYjxV9NSEDI6hXILyx3cGjHSU=;
        b=gzX91BXrokmGyRMVc6fcIwJADAAXsRLRthES4IWLUpNtkooWj0WrA+YvZk+9UXP67n
         87jWKGB1spJ2qpUs63mBLj++viA0bslaRdksnU/NlyJUU5R6nRCWXyEIahJ/QLJy233o
         Y6zaPQP5AnjXp58jNZco3fFUcm9KiaOn2CXTdO1M6SoyxXnErI/iybVgr1dBK1MCWaEq
         4L0pO+pNcjSDYkQVB/4N+UwH2TZuiJryC+WMdHtFqKFfkaU3XuxhWJQByvvJBRi8hW05
         cssM/dDcTRNmuAjZsSuQOSG5qbQDXWY7wMFlTP3hJVxh2IsSdpaoU5E3kejYOoDlBsUB
         ldSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=EE3GROpUC29/EPaaQryYjxV9NSEDI6hXILyx3cGjHSU=;
        b=WkRl4nBQlwjUHVehy/uhrsCXE9SStulSxjMZCg2Tu13L4xO1H+QUyozjnfi0QQtj58
         z0m2pk9D1H40gb0eqR4hUFrhX4UkpwfsgxAgORW0qxq3b+jlb8F7E+Z27MJVOLlU8GXR
         APkVNyCm4vrrQ+NOTDPn7DhStcexT+bUriSNtGa5WZfgV/DrUuXRDm6oqK9NDrIITCm8
         Wwf13axf6JnIaqp4QvnhcdM0DAjOhVIE/lTddZjX51SusgVit3j5p1urQIdbBK6Z0Rfw
         56fM1+pPSv7ADoYF7CTQS+3ilqkyuJxhjUggJezYIhbnkMDwRfDn4VfsvsQwnljLQyyf
         tI9g==
X-Gm-Message-State: AJIora/4j/BL0vxuyDIdsOtHHXbGUHeFE1i/PG5GnnURntDYYJJcfuzw
        lfgiibXTCF173oN6mBdy/MVZJMB3PusUAFG+ORM=
X-Google-Smtp-Source: AGRyM1vpDn+DzXpYQDqfUx+iRsBUdsTAWMtN6jIV9EpfKl+3Ew9NuS45SdIfsVAdjE1acEibl/E8SFKMxKh8CU1hXW0=
X-Received: by 2002:a17:907:28d6:b0:72b:7497:76b with SMTP id
 en22-20020a17090728d600b0072b7497076bmr16442582ejc.365.1659457628018; Tue, 02
 Aug 2022 09:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220728114050.2400475-1-hljunggr@cisco.com> <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75Ve6-BQ_Ajst96cr=XvJGV247_FYLTHTz=nvTCC3NhQa1A@mail.gmail.com>
 <db2d74d0ab17b407223092c8e0e01784d36bbda1.camel@cisco.com>
 <CAHp75Vc2qWQXk-+0ath8zuTaGHmSG_ZiUYih=4rGeKx3_nmtsQ@mail.gmail.com>
 <b426bd08-6c52-3891-9319-b6cc52bdfbab@xs4all.nl> <CAHp75Vdtv6qtjxACA+nET2wyzHpHqxvPeZ-KhRWSByGtH4T5TQ@mail.gmail.com>
 <5d3fe43f-5615-137d-b712-f6c9079460cd@xs4all.nl> <CAHp75VfWhzz4jzyQAD4UYTN8dBWiKsvimKOPiKozGyNd2_oj=A@mail.gmail.com>
 <CAHp75Vd60urVv5R+fE+xxqMNJhJSmXZnfJJwU5t-m3E_T+pcWA@mail.gmail.com>
 <CAHp75Ve87Pvh-ZGHA=wK+ex9kq58FusA-p1EtVzdwKO_3MRyOw@mail.gmail.com>
 <390ab4ac-ad6a-5bef-349b-379ef772afa1@xs4all.nl> <CAHp75Vfqn0oUUvFGu2SegRBRPLpxazXVT5_pNmcD8FUi2_fjuw@mail.gmail.com>
 <403e5055-81dd-7426-a3cd-f3c3bbf24179@xs4all.nl>
In-Reply-To: <403e5055-81dd-7426-a3cd-f3c3bbf24179@xs4all.nl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Aug 2022 18:26:31 +0200
Message-ID: <CAHp75VeAKbJYB0pQOR9oVXFTaQm+G_R14zrzRe9qEPDqK1ttNw@mail.gmail.com>
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

On Tue, Aug 2, 2022 at 2:58 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 8/2/22 14:49, Andy Shevchenko wrote:
> > On Tue, Aug 2, 2022 at 2:45 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >> On 8/2/22 14:26, Andy Shevchenko wrote:
> >>> On Tue, Aug 2, 2022 at 2:23 PM Andy Shevchenko
> >>> <andy.shevchenko@gmail.com> wrote:
> >>>> On Tue, Aug 2, 2022 at 2:21 PM Andy Shevchenko
> >>>> <andy.shevchenko@gmail.com> wrote:

...

> >>>>> You are blaming the wrong man here, i.e. devm. The problem as I stated
> >>>>> above is developers who do not understand (pay attention to) the
> >>>>> lifetime of the objects.
> >>>>
> >>>> That said, the devm has nothing to do with the driver still being
> >>>> problematic for the scenario you described, no?
> >>>
> >>> And the cleanest (at the first glance) solution is to make v4l2 to fix
> >>> this bug by suppressing unbind attributes when the device is opened
> >>> for all v4l2 subdev drivers, and restore it back when it's closed.
> >>
> >> Why would we do that? The patch works in the scenario that I described:
> >> the memory is freed in the struct video_device release() callback, which
> >> is called when the last reference to the video node goes away. This is
> >> standard V4L2 framework behavior that works great in the case of a unbind.
> >>
> >> Without devm_kzalloc it works fine, even when unbind is called. With
> >> devm_kzalloc the unbind attributes would have to be suppressed. I see no
> >> reason for that as media maintainer.
> >
> > I'm not sure anymore that we are talking about the same thing.
> >
> > Your driver allocates memory with kzalloc() in ->probe() and frees it
> > in ->remove(). How is this different from the lifetime of a devm:ed
> > object? If what you said is true, than driver is still problematic,
> > since ->remove() frees this memory the very same way at unbind call.
>
> No, it is not freed in remove(). remove() calls video_unregister_device(),
> and that calls cat24c208_release() when the last user of /dev/videoX closes
> its filehandle. And it is cat24c208_release() that finally frees the memory.

Okay, I got it.

So, if you unbind the driver the state will be stale and still being
accessible by the user (with outdated info). Now, what happens if you
unbind and try to bind back, while the user is slow enough to close
the device file?

Also it's still racy against any i2c calls done via IOCTLs, because
you have unregistered I2C devices.

-- 
With Best Regards,
Andy Shevchenko
