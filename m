Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36CAE2CE825
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 07:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgLDGYV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 01:24:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgLDGYV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 01:24:21 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D687FC061A51
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 22:23:40 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id u12so4198409wrt.0
        for <linux-media@vger.kernel.org>; Thu, 03 Dec 2020 22:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=98JkySW9/YPknIOP/vurrpriMRdU3Eb0izq2wDpGtMs=;
        b=ptlG2MEbVrPb2egLQW7XfjoIdnyFnJSEl5UOV3qQqSXT/R/9N5qJh785SkNjtSVafY
         eI5+ODstgUwiwtYUySnaBR+Yc1TSrmYFb2p77jCtkDub+G4YAANIA4qjFRAhpF4pinjq
         LBn9eCES70H/Rleg6etUGUaH+6TfwXpTH1aiEgsI17gT5vxOTf7YgafJSYqTzU47+L9h
         1mYojfdBNMc5Nxn2K1fD7nSv7OS0k/ioAJRfHKXjUYOfdSa1Ltc+FU7t5+ncTAfoxUXT
         +vKLY4WHsptaZu5r0T7cOSJZIIzN96EYHHwaR8qyEVg7PZzCkfd9x/Q8cTa+wXS4yPaq
         x2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=98JkySW9/YPknIOP/vurrpriMRdU3Eb0izq2wDpGtMs=;
        b=YrFHk5JqIPPNzLG/na6g+8Avwu88J3QDkTVXUm7t9qXonrpZTR7b2b8i1Ttr10aWjL
         mr6Cvu7zpmyCg3cosMW2ke3z6UosrlwGLgfvJR0LetYOX25XGNwk0nLvecq+Wkv7opCA
         3Rswld45EG5AKOkFefTSHFaXZWWajVzk8xUkkg0K4SW9adj8ITyEAwQX2r69sundwOZ4
         3TOLwr2ImndC+yVfbpsK3fziMsk7+3BxctRPcpFvJC23gQ1e64DSc+teL1HOq/ZIgW+i
         J+xzRGjn4yR74fiQ+SOuOZblVUK38BmNeEAxaumO/SXyMwMd8+nW3QoziByUWhoeKp0n
         IDgA==
X-Gm-Message-State: AOAM5330uDc7CMCwWyjBu1242WhHiBJWAlMTF9NiAkizk30QU5cUv4C1
        gpVVQ6djqjIyCZUV4WQCmAD9LKmDTLWRWPewS98r2ubgNBc=
X-Google-Smtp-Source: ABdhPJzEy0kjlzbhbJ4HskVgZqUeu1kU8i5mODdxRXXs4BAgs5Hjr/NV8JA3TzwWGgwm85BkW3SiHNkFcJ5K0AD0aOI=
X-Received: by 2002:adf:e54f:: with SMTP id z15mr3093292wrm.159.1607063018670;
 Thu, 03 Dec 2020 22:23:38 -0800 (PST)
MIME-Version: 1.0
References: <9af089ea-2532-68ac-5d22-97a669ccec91@canonical.com>
 <CAHp75Ve7Sdf=Zy5N1LN_w22=YwPgWWR-FZtrQcAkOF=ViT2Kbw@mail.gmail.com> <1607049966.4733.189.camel@mhfsdcap03>
In-Reply-To: <1607049966.4733.189.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@google.com>
Date:   Fri, 4 Dec 2020 15:23:28 +0900
Message-ID: <CAAFQd5C0_v7hyvu7BHtkH_ecYUXPGTGq75Xrr63b3Fe81r=tuA@mail.gmail.com>
Subject: Re: media: i2c: add OV02A10 image sensor driver
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sj Huang <sj.huang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 4, 2020 at 11:47 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Andy,
>
> On Thu, 2020-12-03 at 20:10 +0200, Andy Shevchenko wrote:
> > On Thu, Dec 3, 2020 at 8:03 PM Colin Ian King <colin.king@canonical.com> wrote:
> >
> > > Static analysis on linux-next with Coverity has detected an issue with
> > > the following commit:
> >
> > If you want to fix it properly, see my comments below...
> >
> > > 529 static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
> > > 530 {
> > > 531        struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > 532        struct i2c_client *client =
> > > v4l2_get_subdevdata(&ov02a10->subdev);
> > >
> > >    1. var_decl: Declaring variable ret without initializer.
> > >
> > > 533        int ret;
> > > 534
> > > 535        mutex_lock(&ov02a10->mutex);
> > > 536
> > >
> > >    2. Condition ov02a10->streaming == on, taking true branch.
> > >
> > > 537        if (ov02a10->streaming == on)
> > >
> > >    3. Jumping to label unlock_and_return.
> > >
> > > 538                goto unlock_and_return;
> > > 539
> > > 540        if (on) {
> > > 541                ret = pm_runtime_get_sync(&client->dev);
> > > 542                if (ret < 0) {
> >
> > > 543                        pm_runtime_put_noidle(&client->dev);
> > > 544                        goto unlock_and_return;
> >
> > Instead of two above:
>
> From the document, pm_runtime_put_noidle is to decrease the runtime PM
> usage counter of a device unless it is 0 already; while pm_runtime_put
> would additionally run pm_request_idle to turn off the power if usage
> counter is zero.
>
> So here maybe we can really use pm_runtime_put instead of
> pm_runtime_put_noidle, although it seems that 'pm_runtime_get_sync' and
> 'pm_runtime_put_noidle' often appear in pairs.
>

In an error state (e.g. if pm_runtime_get_sync() fails),
pm_runtime_put() would decrement the usage counter and call rpm_idle()
which would instantly return an error code. The end result would be
the same, except that pm_runtime_put() would return a non-zero error
code, but we ignore it anyway. However strange it looks, this seems to
be an API guarantee, so Andy's suggestion is correct.

Best regards,
Tomasz

> >                        goto err_rpm_put;
> >
> > > 545                }
> > > 546
> > > 547                ret = __ov02a10_start_stream(ov02a10);
> > > 548                if (ret) {
> > > 549                        __ov02a10_stop_stream(ov02a10);
> > > 550                        ov02a10->streaming = !on;
> > > 551                        goto err_rpm_put;
> > > 552                }
> > > 553        } else {
> > > 554                __ov02a10_stop_stream(ov02a10);
> > > 555                pm_runtime_put(&client->dev);
> > > 556        }
> > > 557
> > > 558        ov02a10->streaming = on;
> >
> > (1)
> >
> > > 559        mutex_unlock(&ov02a10->mutex);
> > > 560
> > > 561        return 0;
> > > 562
> > > 563 err_rpm_put:
> > > 564        pm_runtime_put(&client->dev);
> >
> > > 565 unlock_and_return:
> >
> > Should be moved to (1).
> >
> > > 566        mutex_unlock(&ov02a10->mutex);
> > > 567
> > >
> > > Uninitialized scalar variable (UNINIT)
> > >     4. uninit_use: Using uninitialized value ret.
> > >
> > > 568        return ret;
> > > 569 }
> > >
> > > Variable ret has not been initialized, so the error return value is a
> > > garbage value. It should be initialized with some appropriate negative
> > > error code, or ret could be removed and the return should return a
> > > literal value of a error code.
> > >
> > > I was unsure what value is appropriate to fix this, so instead I'm
> > > reporting this issue.
> >
>
