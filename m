Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 115243FECB2
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 13:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234004AbhIBLLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 07:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhIBLLb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 07:11:31 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9BDC061575;
        Thu,  2 Sep 2021 04:10:31 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id i21so3430398ejd.2;
        Thu, 02 Sep 2021 04:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5FLgfhteMlRQ2DZ2rl9S+fJuUtzUvkCYbFu3Mxtxt+M=;
        b=EGPivUHfWvqF0SPr2PYx+r0fTy9t/PA1fwl/0NWf8Pu7Zq55Vxj5yaXFEGYjfoTTVS
         7nmsY5PwBx9QGl6p9r/Z46AJZoINfsPh7Vx3X/KOgHIlYhIZY58NvvZrKssdTK623iER
         YPCGsblrilccT484uPj+pVJ7IHjSbPuyB9t8ABQcN1NHpkd3ZIHCeGuAlrCe6RvsqP6v
         QnE1FFrqr1Q2MOnqcTRT1EmsDCQ0ONrLHHP8/P8HjWAx8OoqIQ9mmUEZ36vnCFMGjFyt
         qB0Df+k+0kG6lsfDt/A1KVqC0NCkjfg5WuXgyJFXT2lijm95fM23j4xWaeH1MsqNTuBf
         zGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5FLgfhteMlRQ2DZ2rl9S+fJuUtzUvkCYbFu3Mxtxt+M=;
        b=ib9FJ62rYa6OLq2CK9je6MKL3gktdrbjfjMJ6IavA92XQCizBwSPZ2kxVahrEekqV2
         HStE/rSMHD0v5qCjdb/gRQ/uldgn2KVt3u/LNsGpXRcg7fdv0oyvo7BBErPYxMCtrL5E
         oYIEMerbH/5tRV1XdozjlNZfMVlAKCVQK7Fw43K2Pe1A2PpJ+1Ssr+Qf3wy3GUB4UY/+
         6rQdm/8nIu90jA96H4usHUHRGKiabkmEMJv81XfBBLi1nkRzyMzF8vf7WPsHc8J7t0cj
         QDcOhnEC0EIAqau1DfGLKcmzh8X35dGF8hxM7gV28Dd7CcEME7sYPtpiQNd61usknAQS
         koGg==
X-Gm-Message-State: AOAM531bhEHXfiOjolftoqlKpJmPX8CNmfQQaXD6D0zt7qOEXz6BJFa2
        ORpwrEgH+zV1n2Hk97Ub7PRp+KploucYL0yTIcE=
X-Google-Smtp-Source: ABdhPJx4x23rySGBX5CAWHHwVwgEialI+/veWy25Cjo+qgtZTp2gL4CP5b86ZM5iu5U8LO7f2jaQpJODhi29DPzGguo=
X-Received: by 2002:a17:906:a3c3:: with SMTP id ca3mr3158415ejb.337.1630581029805;
 Thu, 02 Sep 2021 04:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210714032340.504836-1-mudongliangabcd@gmail.com>
 <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
 <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
 <YTCp6d1umr7AXRZW@kroah.com> <20210902125416.1ad73fad@coco.lan> <CAD-N9QVZQo+YPjNwAUqg-kQ_fEwicLR=1am1E99h8oHi0aXocA@mail.gmail.com>
In-Reply-To: <CAD-N9QVZQo+YPjNwAUqg-kQ_fEwicLR=1am1E99h8oHi0aXocA@mail.gmail.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Thu, 2 Sep 2021 19:10:02 +0800
Message-ID: <CAD-N9QXPJz60jKfHg1Yh6tnzJRBFAwkmV+LUoSY+f7cZ_5kYww@mail.gmail.com>
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Pavel Skripkin <paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 2, 2021 at 6:59 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
> On Thu, Sep 2, 2021 at 6:54 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> >
> > Em Thu, 2 Sep 2021 12:39:37 +0200
> > Greg KH <gregkh@linuxfoundation.org> escreveu:
> >
> > > On Thu, Sep 02, 2021 at 06:23:36PM +0800, Dongliang Mu wrote:
> > > > On Fri, Jul 23, 2021 at 6:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> > > > >
> > > > > On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> > > > > >
> > > > > > stk_camera_probe mistakenly execute usb_get_intf and increase the
> > > > > > refcount of interface->dev.
> > > > > >
> > > > > > Fix this by removing the execution of usb_get_intf.
> > > > >
> > > > > Any idea about this patch?
> > > >
> > > > +cc Dan Carpenter, gregkh
> > > >
> > > > There is no reply in this thread in one month. Can someone give some
> > > > feedback on this patch?
> > >
> > > This is the media developers domain, not much I can do here.
> >
> > There is a high volume of patches for the media subsystem. Anyway,
> > as your patch is at our patchwork instance:
> >
> >         https://patchwork.linuxtv.org/project/linux-media/patch/20210714032340.504836-1-mudongliangabcd@gmail.com/
> >
> > It should be properly tracked, and likely handled after the end of
> > the merge window.

Hi Mauro,

I found there is another fix [1] for the same memory leak from Pavel
Skripkin (already cc-ed in this thread).

[1] https://www.spinics.net/lists/stable/msg479628.html

> >
> > > > > > Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > > > > Fixes: 0aa77f6c2954 ("[media] move the remaining USB drivers to drivers/media/usb")
> > > > > > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> >
> > If you're the author of the patch, it doesn't make much sense to
> > add a "Reported-by:" tag there. We only use it in order to give
> > someone's else credit to report an issue.
>
> I see. Someone told me this rule in another thread. I will update this
> in the next version.
>
> >
> > Thanks,
> > Mauro
