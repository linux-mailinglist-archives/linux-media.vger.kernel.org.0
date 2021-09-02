Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0113FEC92
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 13:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242285AbhIBLBM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 07:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbhIBLBJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 07:01:09 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CE4C061575;
        Thu,  2 Sep 2021 04:00:08 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a25so3351717ejv.6;
        Thu, 02 Sep 2021 04:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yZZndZIufB+htcwA80YyTTjrdpcy7LUn4HB1XhvHmiE=;
        b=caDdEftyPkLczUdgBD/WcE5x+squGWDDIpqMSTzSo4zwkbZNSbnd1P+XFNK4/W5ZKh
         +urJnGKt9iH5Iv6wvjxdfM0n/jzsDapdr4yJgarAnICSiJqjJZC8z/ij4qI5Vt2FEAVd
         gU8P5io0y84xDkBXnxy2Brhb2hJ11nMDqrke4R6lJdP/hd/8jiulESYpbauKzV7sdoFs
         7HFNi8r0PcaN5juzBFNYGBp0AyaO6dgmGX+61CbLvUclrg73E4qt6eYdC/s/tfyAIeTm
         BR1JRd/28lzRG1LXSP3w3LYVetsY4XzJunXvLwteMqfOMs2O9T4bwUJzgFKwXv1uV2+9
         hkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yZZndZIufB+htcwA80YyTTjrdpcy7LUn4HB1XhvHmiE=;
        b=S3Kdijm1AJDq9yxjzwpW5lT7QdvuJixX3eF1jpsY0kUBIEFWJ6kqLaTHoz+fpCxhDO
         xX4LCeiY+AdDy9Qzlcm7Y6x90orGXE3R6UpvXqT6A8zGIYRDmCz/V47dGEWVVliUiSF8
         N+m0ItUBUnafcMXrQ1tvWrYELQBiUT+FN7fsIVoDNUPb47I3fPw8lu/gkRLXTXCnxOLb
         3oRxZK/bTtrjC7P0eSVguC+KtGekjLTBPYT1Ie9Q6VAHXDgSW4Du7yjGOsODtFDO7BLv
         A6Ji7iUz+llsmnrGZqard2ZbtLATo+KS1nSg2VEt5I2TDWBJdahG0lUSbZWD1ML5H3Ea
         iLMQ==
X-Gm-Message-State: AOAM530i6eDdrEGc+uV7Fk7kKob13QwjzdmmowFQEp8FfGikDkJ+XCQP
        oJf/gUv4vR2n7wQiihIeEWzt6WwR20GHHvp8DWI=
X-Google-Smtp-Source: ABdhPJz/MrvAvdc+zRmqzLJWiuCaIh3GAbWWw6mWgO6/7IdKcXAdpwKXZGOEG1BA2fdvDm5xWoN0XkFWnVknkaNdLVs=
X-Received: by 2002:a17:906:9b1:: with SMTP id q17mr3101067eje.546.1630580406401;
 Thu, 02 Sep 2021 04:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210714032340.504836-1-mudongliangabcd@gmail.com>
 <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
 <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
 <YTCp6d1umr7AXRZW@kroah.com> <20210902125416.1ad73fad@coco.lan>
In-Reply-To: <20210902125416.1ad73fad@coco.lan>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Thu, 2 Sep 2021 18:59:38 +0800
Message-ID: <CAD-N9QVZQo+YPjNwAUqg-kQ_fEwicLR=1am1E99h8oHi0aXocA@mail.gmail.com>
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 2, 2021 at 6:54 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> Em Thu, 2 Sep 2021 12:39:37 +0200
> Greg KH <gregkh@linuxfoundation.org> escreveu:
>
> > On Thu, Sep 02, 2021 at 06:23:36PM +0800, Dongliang Mu wrote:
> > > On Fri, Jul 23, 2021 at 6:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> > > >
> > > > On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> > > > >
> > > > > stk_camera_probe mistakenly execute usb_get_intf and increase the
> > > > > refcount of interface->dev.
> > > > >
> > > > > Fix this by removing the execution of usb_get_intf.
> > > >
> > > > Any idea about this patch?
> > >
> > > +cc Dan Carpenter, gregkh
> > >
> > > There is no reply in this thread in one month. Can someone give some
> > > feedback on this patch?
> >
> > This is the media developers domain, not much I can do here.
>
> There is a high volume of patches for the media subsystem. Anyway,
> as your patch is at our patchwork instance:
>
>         https://patchwork.linuxtv.org/project/linux-media/patch/20210714032340.504836-1-mudongliangabcd@gmail.com/
>
> It should be properly tracked, and likely handled after the end of
> the merge window.
>
> > > > > Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > > > Fixes: 0aa77f6c2954 ("[media] move the remaining USB drivers to drivers/media/usb")
> > > > > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
>
> If you're the author of the patch, it doesn't make much sense to
> add a "Reported-by:" tag there. We only use it in order to give
> someone's else credit to report an issue.

I see. Someone told me this rule in another thread. I will update this
in the next version.

>
> Thanks,
> Mauro
