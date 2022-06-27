Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C41655B4F5
	for <lists+linux-media@lfdr.de>; Mon, 27 Jun 2022 03:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbiF0BbD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jun 2022 21:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbiF0BbC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jun 2022 21:31:02 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639032673
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 18:31:01 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3178acf2a92so71649187b3.6
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 18:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I7VJ+Ef59I/S/1ra/0+o/r4IfdPzo+3MZUOqiUm6eCw=;
        b=KHzomc0ujei0qoWuvQDE4WDn1VSBJcV2TY30q74+tXbH8Y0qWMU3ndk/P0Jhso9jf1
         /uqtc6XSjfH7d8Vl+rw1i/3lRozIWsLQGYTdOtmaXzOmHuICEuLGAkoj+wrCLrhTmBCn
         QO5H2BeJla2BZoJU3DxhBy0wPIc9uN9ltC1ttnQyrmmZRBMeYCg81NbR4zUPTamgHuvO
         4WY0Aoq+gDqa1RzCaXjxra8KkozErRQH6SXTG9sFyDRWt7hsEjLBUpzslL0jI75mHrgl
         6100Aa0ZRBsOxHW9qMZAv7JQnTWUClyMa4iyyiLnLgpDQ3uCYdTy3+xCIlTcczTlL9Wv
         tkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I7VJ+Ef59I/S/1ra/0+o/r4IfdPzo+3MZUOqiUm6eCw=;
        b=mzp2w1ZGbhOkwscJRqD3BuGspde3yglX1lCOWhf4ZyX/qHCcw89Bq4k0e1hv6RR9MM
         FX0AM8S+i0KpiaLrwufWSApk+gfTYhUbuCwGl8pl927PpBJcpXSW1ePbAJtKTmKtXI2B
         wf9X/lMtrY9X8Uz9V48dPWMOqNN5OyiXzavb8B0eRy1FYhMw/Hlw0iHoqc3H04sALm2w
         CVmKYZJZs+OEwjs4gHQhnvcCRYWe+wWJSS0ZA8wBvm5kdFpnouVi4GOpSe1XvyaKnV7A
         aUbe/60e3inWi8jrP4LpKm73i36T0EFc34DW5/I6qdZnnz+gPUmEGJiMA0EXfdZgxNYX
         gITQ==
X-Gm-Message-State: AJIora8ZHZUNc3GpVeRi+d2N8F8hqnl6TAw3M50/T+4TQDV5dV7Igo00
        VfPjvXUtyaL7N4gr8279jH0DuDKVaqKSJNdWh5XlDA==
X-Google-Smtp-Source: AGRyM1uf+37LwHywtWpq4gumsTdSxtZhth7l6SODU/V8Jb06OsmhrxAq34HaGFqc2VGD0bOIhqIzxOHujHNIZPpQ3Zc=
X-Received: by 2002:a05:690c:90:b0:2f1:9b7a:ceec with SMTP id
 be16-20020a05690c009000b002f19b7aceecmr12358673ywb.308.1656293460409; Sun, 26
 Jun 2022 18:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220617015745.3950197-1-yunkec@google.com> <20220617015745.3950197-2-yunkec@google.com>
 <177345ff-f601-e440-31e0-2c967736af6b@linuxfoundation.org>
 <CANqU6Fed=E1ogvR1ccwJA9bR_9VxU4QPd6PjvBAyRrMeQuRWfg@mail.gmail.com> <610bc1b9-c013-46d7-4446-5a5eab4c2569@linuxfoundation.org>
In-Reply-To: <610bc1b9-c013-46d7-4446-5a5eab4c2569@linuxfoundation.org>
From:   Yunke Cao <yunkec@google.com>
Date:   Mon, 27 Jun 2022 10:30:49 +0900
Message-ID: <CANqU6Fcspk-CWi3xYfUBg80vUWb1ZhJhr8G6YF9Nna6nrq_17Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: vimc: add ancillary lens
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shuah,

Thanks for the pointers.

On Wed, Jun 22, 2022 at 12:57 AM Shuah Khan <skhan@linuxfoundation.org> wro=
te:
>
> On 6/19/22 7:57 PM, Yunke Cao wrote:
> > Hi Shuah,
> >
> > Thanks for the review.
> >
> > On Sat, Jun 18, 2022 at 5:01 AM Shuah Khan <skhan@linuxfoundation.org> =
wrote:
> >>
> >> On 6/16/22 7:57 PM, Yunke Cao wrote:
> >>> Add a basic version of vimc lens.
> >>> The lens supports V4L2_CID_FOCUS_ABSOLUTE control.
> >>> Link the lens with vimc sensors using media-controller
> >>> ancillary links.
> >>>
> >>
> >> Commit log lines are usually ~75 charracters long. Make it easier
> >> to read.
> > That's good to know. Thanks!
> > Should I send v3 and trim the commit log?
> > I'm thinking something like this:
> >
> > The lens supports FOCUS_ABSOLUTE control.
> > Link the lens with sensors using ancillary links.
> >
>
> Why is this necessary? How did you test this change? How could
> one use this feature?
>

Add lens to vimc driver and link them with sensors using ancillary links.
Provides an example of ancillary link usage.The lens supports
FOCUS_ABSOLUTE control.

Test example: With default vimc topology
> media-ctl -p
Media controller API version 5.18.0
=E2=80=A6
- entity 28: Lens A (0 pad, 0 link)
             type V4L2 subdev subtype Lens flags 0
             device node name /dev/v4l-subdev6
- entity 29: Lens B (0 pad, 0 link)
             type V4L2 subdev subtype Lens flags 0
             device node name /dev/v4l-subdev7
>  v4l2-ctl -d /dev/v4l-subdev7 -C focus_absolute
focus_absolute: 0

Let me know what you think. Thanks!

Best,
Yunke

> >>
> >>> This change can be used to test the recently added ancillary
> >>> links.
> >>>
> >>
> >> Care to add instructions on how one would test ancillary with
> >> this feature?
> >
> > The lens shows up in the media topology. I documented it in 2/2.
> > Not sure what else is necessary here.
> >
>
> Why is this necessary? How did you test this change? How could
> one use this feature?
>
> Take a look at the some of the other commit messages e.g:
> 4a2e0a806cb58a4d3106add079488e0b56a221b6
> 5f3fb5c54d67670fa6743d2434a5bd43a97c01de
>
> This one is a good example of what would a commit log adding a
> new feature should include.
>
> commit 9b4a9b31b9aeef262b4fa211f2083c30c4391df7
> Author: Pedro Terra <pedro@terraco.de>
> Date:   Tue Aug 31 19:48:22 2021 +0200
>
>      media: vimc: Enable set resolution at the scaler src pad
>
> thanks,
> -- Shuah
