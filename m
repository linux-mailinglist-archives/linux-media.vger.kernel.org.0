Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 361293A7947
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 10:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhFOIrw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 04:47:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:42678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230502AbhFOIrv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 04:47:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2D9B613D9;
        Tue, 15 Jun 2021 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623746747;
        bh=euu46a5HmIGMgUUgLt4AGXGV7qIelJ+jWdnF2TyhCgg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JLEdEbVvKwso5c+26NS5xce3UvtFRd81H0tncwj8JIbfIos+F7vkOhB5UHGJbdPMF
         DOtHqMquRv0S5aWWUEg6z/5PxSNs9SGXLxhH8bCrctgk+l3miXeNbuqbtK2L5VRH7p
         XPKbjFLE9Y1pP0kIXiT9m+S3sdpORYvz1Q0qtfi41Wkg0B+uyFoy5uZg9jk9S2VIcp
         9OFVy8EKni+2iM0Dm04SXOuvfBWTTGyoeRAl9SdOHGC0wqM6fCabkZ21OVfpMd9ItI
         nEC08xtBRf4/rxpp09drbo0+QHfJ+muHDPG36Gu5yOladHup/YmFD5TxiN7wrdE83c
         znh8QLtoceKAQ==
Received: by mail-wr1-f45.google.com with SMTP id c9so17373794wrt.5;
        Tue, 15 Jun 2021 01:45:47 -0700 (PDT)
X-Gm-Message-State: AOAM530OQ2wV3m+CYxve9SoGlUbhsAZVniil3iPxsQlAzFanCuZ5vuX6
        SlVA6RcQgrgjsa0waQSLiPuNM2H8If4/uUcx9vw=
X-Google-Smtp-Source: ABdhPJw+QLMgXeE31DnC/gXDVzuLKSe8HXzA+bDPY1jQioViACBluaP0ozszto46RsU0ZGQccBLP7EnooEuRM6ToECk=
X-Received: by 2002:a5d:4050:: with SMTP id w16mr23823101wrp.99.1623746746586;
 Tue, 15 Jun 2021 01:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210614103409.3154127-1-arnd@kernel.org> <20210614103409.3154127-5-arnd@kernel.org>
 <YMeLlvALJ5nJbQGg@pendragon.ideasonboard.com>
In-Reply-To: <YMeLlvALJ5nJbQGg@pendragon.ideasonboard.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 15 Jun 2021 10:43:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1+cWFn8=xyGwZ0c7fWr6+tdEF_sXtMpPCZypDBA_UryA@mail.gmail.com>
Message-ID: <CAK8P3a1+cWFn8=xyGwZ0c7fWr6+tdEF_sXtMpPCZypDBA_UryA@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] media: subdev: remove VIDIOC_DQEVENT_TIME32 handling
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 14, 2021 at 7:02 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jun 14, 2021 at 12:34:05PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Converting the VIDIOC_DQEVENT_TIME32/VIDIOC_DQEVENT32/
> > VIDIOC_DQEVENT32_TIME32 arguments to the canonical form is done in common
> > code, but for some reason I ended up adding another conversion helper to
> > subdev_do_ioctl() as well. I must have concluded that this does not go
> > through the common conversion, but it has done that since the ioctl
> > handler was first added.
> >
> > I assume this one is harmless as there should be no way to arrive here
> > from user space, but since it is dead code, it should just get removed.
>
> If I'm not mistaken, this could be reached when
> !CONFIG_COMPAT_32BIT_TIME, can't it ? Still, there's no need for this
> code in that case, so it seems fine to me.

Yes, that is correct, I missed that condition. We definitely should not handle
the command in that case.

Hans, since you mentioned you would pick up this patch, I assume  you
are going to reword the patch as you see fit. If you prefer me to resend it,
let me know.

       Arnd
