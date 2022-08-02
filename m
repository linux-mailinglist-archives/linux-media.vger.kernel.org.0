Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A5158803F
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 18:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237463AbiHBQ2x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 12:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237224AbiHBQ2v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 12:28:51 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D6433E0E
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 09:28:51 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id r4so10578294edi.8
        for <linux-media@vger.kernel.org>; Tue, 02 Aug 2022 09:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=wckayKxqp8c89/BeJuWRQW46lUUDjZtvzfYjnDkVDwQ=;
        b=Dgst/FlCULPjB7WQx7NBOzFLCm72Jxa70V34htwey8mZ45jM9YF1XLtI2T9JcyiH1O
         QwoDXrYV9sRgXriVWvn2AXmhjON7hnsz6t0ZDmRaPMNSqiKdTNFpgt5zo2EP4MEwY9vK
         olXUHBJcr4kh5mqR+8bwCccecPczdD2K0SnwBeVtUYZ/63TRYD/TVyZG8bs0VTNrNDL4
         67p3cNnImPJfNIcyssEvFar3JjXzkTRGvqj6vXB54IS6svuU1qyxrlIR679/NnIY7pIa
         IAXaee0KQ3/HnVPSVn+5H4jCOHtecL43Xps4hIbSwR/jxFnHO/869/mIoMNU2AfDmC3F
         nW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wckayKxqp8c89/BeJuWRQW46lUUDjZtvzfYjnDkVDwQ=;
        b=M7ww64DR0D46kc0Bk6AVIU0PNFZaxS+ur+xtIu5a+4caLPHGiETeMFCbzaa63UwC0+
         J5dnjnVEC+6fsSUJcEo+gv0L8q5keQOSxv6TgrfQw/EyzNc7IkK4Ls0ZZVy8FR8F2ulU
         HCRS2RwFN/FidAO9JiA/n3wxMkcD2KnBHHGVF07D1IAT1qI39NpR32HxnloAQYv2l+vF
         MtgRBxnoZ7XWwbeam5eBwjR1W1G4218hKmmbGhx2NIyfA8dqjzY3Pnr6k8tvjmUdwKSY
         RApbmGZ05DGJS6ahDzX+vDLst0yLpA1Hp7F+p52zdyRmoiY0GBCckJz58psx/EAP3+xO
         P5hw==
X-Gm-Message-State: AJIora+3MGVf/OjoaeWFeZS+mzGRNadln/Pf+LD1C5U9/Jt34mTmp//5
        p5El3si6NuRufIwN42KZErI5kw+dv6J0bziVucQ=
X-Google-Smtp-Source: AGRyM1v7u0sTdvxQgOQAjOMf7FZZOGseoOFFalR21S9XRrawWCYNqmEH+fStF3wYUTyVYVFcF+zBb8pUAv0r8QOD8kw=
X-Received: by 2002:a05:6402:40c3:b0:43b:d65a:cbf7 with SMTP id
 z3-20020a05640240c300b0043bd65acbf7mr21971862edb.380.1659457729533; Tue, 02
 Aug 2022 09:28:49 -0700 (PDT)
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
 <403e5055-81dd-7426-a3cd-f3c3bbf24179@xs4all.nl> <CAHp75VeAKbJYB0pQOR9oVXFTaQm+G_R14zrzRe9qEPDqK1ttNw@mail.gmail.com>
In-Reply-To: <CAHp75VeAKbJYB0pQOR9oVXFTaQm+G_R14zrzRe9qEPDqK1ttNw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Aug 2022 18:28:12 +0200
Message-ID: <CAHp75VezzNifHTYHOkaQZubdotL8VGwog1--GR_7OSJR8bNGww@mail.gmail.com>
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

On Tue, Aug 2, 2022 at 6:26 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Aug 2, 2022 at 2:58 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > On 8/2/22 14:49, Andy Shevchenko wrote:
> > > On Tue, Aug 2, 2022 at 2:45 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > >> On 8/2/22 14:26, Andy Shevchenko wrote:
> > >>> On Tue, Aug 2, 2022 at 2:23 PM Andy Shevchenko
> > >>> <andy.shevchenko@gmail.com> wrote:
> > >>>> On Tue, Aug 2, 2022 at 2:21 PM Andy Shevchenko
> > >>>> <andy.shevchenko@gmail.com> wrote:
>
> ...
>
> > >>>>> You are blaming the wrong man here, i.e. devm. The problem as I stated
> > >>>>> above is developers who do not understand (pay attention to) the
> > >>>>> lifetime of the objects.
> > >>>>
> > >>>> That said, the devm has nothing to do with the driver still being
> > >>>> problematic for the scenario you described, no?
> > >>>
> > >>> And the cleanest (at the first glance) solution is to make v4l2 to fix
> > >>> this bug by suppressing unbind attributes when the device is opened
> > >>> for all v4l2 subdev drivers, and restore it back when it's closed.
> > >>
> > >> Why would we do that? The patch works in the scenario that I described:
> > >> the memory is freed in the struct video_device release() callback, which
> > >> is called when the last reference to the video node goes away. This is
> > >> standard V4L2 framework behavior that works great in the case of a unbind.
> > >>
> > >> Without devm_kzalloc it works fine, even when unbind is called. With
> > >> devm_kzalloc the unbind attributes would have to be suppressed. I see no
> > >> reason for that as media maintainer.
> > >
> > > I'm not sure anymore that we are talking about the same thing.
> > >
> > > Your driver allocates memory with kzalloc() in ->probe() and frees it
> > > in ->remove(). How is this different from the lifetime of a devm:ed
> > > object? If what you said is true, than driver is still problematic,
> > > since ->remove() frees this memory the very same way at unbind call.
> >
> > No, it is not freed in remove(). remove() calls video_unregister_device(),
> > and that calls cat24c208_release() when the last user of /dev/videoX closes
> > its filehandle. And it is cat24c208_release() that finally frees the memory.
>
> Okay, I got it.
>
> So, if you unbind the driver the state will be stale and still being
> accessible by the user (with outdated info). Now, what happens if you
> unbind and try to bind back, while the user is slow enough to close
> the device file?
>
> Also it's still racy against any i2c calls done via IOCTLs, because
> you have unregistered I2C devices.

As far as I understand current design, you may not call anything but
video_device_unregister() in the subdevice's ->remove(), or be very
careful on what resources can be used via IOCTLs.


-- 
With Best Regards,
Andy Shevchenko
