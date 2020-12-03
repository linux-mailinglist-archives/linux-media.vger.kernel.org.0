Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325682CDDA9
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 19:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388274AbgLCSaC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 13:30:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbgLCSaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 13:30:01 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98407C061A4E;
        Thu,  3 Dec 2020 10:29:15 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id f1so1606918plt.12;
        Thu, 03 Dec 2020 10:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+WyCqEHFRXG/znTaYwcRSAz+ikU4KUuDWRGTqiuEseI=;
        b=Jq1AeVxjxylFag35gbpDoPu6RWql4w6olyXkAzkSvgiJXX/z5a/6KalXnelP8oFs7U
         hQ/rQwIzWJ7TgKd79uqjVwE26bchVNuMP+6FJegdEdSKA0xJZyYM0417c0moxtGUVFiq
         iq0Op36EaHeARncOUAKj+VBrfPm9/l8AFhky13Tpib9uOkMVmPcUZKOkCoCcNndgPBfN
         BD3VK01aF2hL4MZRrs7A16UjaoM6GhfmNU7UTiPE9Zb56W59bW+BMl/JUz5ts5/cmQw9
         3XuTGWJqvkraNhgLLm7DDat/9WTe6nRIv7V0Sa5MOO1nbjGyLagXPFijR58IMNo+v1Zi
         bn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+WyCqEHFRXG/znTaYwcRSAz+ikU4KUuDWRGTqiuEseI=;
        b=hT2DeMoFR+auy4MqbkEicqub9gDzVszBC/vGEOP+0Lzx4oI6vtHuWI6gDfalNDK5UF
         HoEwe43nPG4lejX12CT4UgSMadg4hSKGnpS5ODb8E4rlzmDnPFFw0vJDB4+MRTjZ0uQ8
         T8Ju1OfsJmz29kGN+XEGSq8PT1lOTG2X/dwdh79iduVh04SmNEZQ2dZe2RB0iENBnf5l
         l0uzThV2YR3kac9teqL6V2Xa5hFy6Os0Xg9KylE+3GVlt2MZROkDtsGkv6mK5JditF2I
         eJQibe/fNGKZCjhDrIo0hUd8Tfo1+degpdy8/BMcJXOzt5tolNKRzu1wmpzSUYKkIshc
         ckJQ==
X-Gm-Message-State: AOAM530plHFunP9KsrH/OHgBr2JGFVYwQzaKbemy0N2/uMItSlYTuO3V
        RSqV0Lx/pePiw3SDxwswSVOnix9/hdQn6Y4+Y+I=
X-Google-Smtp-Source: ABdhPJw76gw7sWSLM4C/6LEnb1g+m3GERIOLPxkx5+zN/CF8v9kUqWUvnYpr3RBnylk3CWwPcZLba5heZ9xnwtU6OrU=
X-Received: by 2002:a17:90a:34cb:: with SMTP id m11mr364955pjf.181.1607020155055;
 Thu, 03 Dec 2020 10:29:15 -0800 (PST)
MIME-Version: 1.0
References: <9af089ea-2532-68ac-5d22-97a669ccec91@canonical.com>
 <CAHp75Ve7Sdf=Zy5N1LN_w22=YwPgWWR-FZtrQcAkOF=ViT2Kbw@mail.gmail.com> <8eb453c7-a221-e741-5fe5-655e59075f34@canonical.com>
In-Reply-To: <8eb453c7-a221-e741-5fe5-655e59075f34@canonical.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Dec 2020 20:30:03 +0200
Message-ID: <CAHp75VffBjhvuZ1Uy5Eo5qSiZ4w-+dhH5cR_XgmqGvxtrMd3uQ@mail.gmail.com>
Subject: Re: media: i2c: add OV02A10 image sensor driver
To:     Colin Ian King <colin.king@canonical.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 3, 2020 at 8:24 PM Colin Ian King <colin.king@canonical.com> wrote:
> On 03/12/2020 18:10, Andy Shevchenko wrote:
> > On Thu, Dec 3, 2020 at 8:03 PM Colin Ian King <colin.king@canonical.com> wrote:
> >
> >> Static analysis on linux-next with Coverity has detected an issue with
> >> the following commit:
> >
> > If you want to fix it properly, see my comments below...
> >
> >> 529 static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
> >> 530 {
> >> 531        struct ov02a10 *ov02a10 = to_ov02a10(sd);
> >> 532        struct i2c_client *client =
> >> v4l2_get_subdevdata(&ov02a10->subdev);
> >>
> >>    1. var_decl: Declaring variable ret without initializer.
> >>
> >> 533        int ret;
> >> 534
> >> 535        mutex_lock(&ov02a10->mutex);
> >> 536
> >>
> >>    2. Condition ov02a10->streaming == on, taking true branch.
> >>
> >> 537        if (ov02a10->streaming == on)
> >>
> >>    3. Jumping to label unlock_and_return.
> >>
> >> 538                goto unlock_and_return;
> >> 539
> >> 540        if (on) {
> >> 541                ret = pm_runtime_get_sync(&client->dev);
> >> 542                if (ret < 0) {
> >
> >> 543                        pm_runtime_put_noidle(&client->dev);
> >> 544                        goto unlock_and_return;
> >
> > Instead of two above:
> >                        goto err_rpm_put;
> >
> >> 545                }
> >> 546
> >> 547                ret = __ov02a10_start_stream(ov02a10);
> >> 548                if (ret) {
> >> 549                        __ov02a10_stop_stream(ov02a10);
> >> 550                        ov02a10->streaming = !on;
> >> 551                        goto err_rpm_put;
> >> 552                }
> >> 553        } else {
> >> 554                __ov02a10_stop_stream(ov02a10);
> >> 555                pm_runtime_put(&client->dev);
> >> 556        }
> >> 557
> >> 558        ov02a10->streaming = on;
> >
> > (1)
> >
> >> 559        mutex_unlock(&ov02a10->mutex);
> >> 560
> >> 561        return 0;
> >> 562
> >> 563 err_rpm_put:
> >> 564        pm_runtime_put(&client->dev);
> >
> >> 565 unlock_and_return:
> >
> > Should be moved to (1).
> >
> >> 566        mutex_unlock(&ov02a10->mutex);
> >> 567
> >>
> >> Uninitialized scalar variable (UNINIT)
> >>     4. uninit_use: Using uninitialized value ret.
> >>
> >> 568        return ret;
> >> 569 }
> >>
> >> Variable ret has not been initialized, so the error return value is a
> >> garbage value. It should be initialized with some appropriate negative
> >> error code, or ret could be removed and the return should return a
> >> literal value of a error code.
> >>
> >> I was unsure what value is appropriate to fix this, so instead I'm
> >> reporting this issue.
> >
> Not sure I fully understand how that fixes it.

If you are not sure and have no means to test, then don't bother. This
is not the priority driver anyway.

>  Given that ret is
> currently not initialized when we hit:
>
>          if (ov02a10->streaming == on)
>                 goto unlock_and_return;
>
> either we initialize ret to 0 at the start of the function, or do:
>
>          if (ov02a10->streaming == on) {
>                 ret = 0;
>                 goto unlock_and_return;
>         }
>
> (assuming the intention is to return zero for this specific case).

No, please read my message again.

-- 
With Best Regards,
Andy Shevchenko
