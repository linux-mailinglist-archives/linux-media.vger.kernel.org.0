Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925193FEC81
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 12:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbhIBKzT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 06:55:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:39238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231133AbhIBKzT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Sep 2021 06:55:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C968C60F91;
        Thu,  2 Sep 2021 10:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630580060;
        bh=q0GNvNblP6lxsGan6KTY29HU10SRkr+7SoHSRmhQuD8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tU5zJblbO0vmpIY7OfTkrTXk4AzIk6NN/0g6+WOd6GtrHSpfu7XUvVy6IPpdoOOXG
         8ahHHMv/HlC78ooogIA/xsH9yPZHV+Uy/Upzp1NFGHqeOVU43yJypQWlnX/GkZB6d5
         7kgroJp8X9yktEckGusw3lQ5AsTGacD0YsFEqE1NQ6YHnSc5wi7YQT8XIutobc5emL
         e3znvaZsXOce/ZEbYNJbLreX1u8Vze9AEYWvA/JOW+Xnc/oUh4tc6rkMiia6ZP5I89
         WNCdqi9eyJWRgaBnVXeMAsLnbhjMmQhoLWmCBV0ZYGx4ZtBvgSBybXlbI93l9Zqyr0
         4faQ3kVMnHaBw==
Date:   Thu, 2 Sep 2021 12:54:16 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
Message-ID: <20210902125416.1ad73fad@coco.lan>
In-Reply-To: <YTCp6d1umr7AXRZW@kroah.com>
References: <20210714032340.504836-1-mudongliangabcd@gmail.com>
        <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
        <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
        <YTCp6d1umr7AXRZW@kroah.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 2 Sep 2021 12:39:37 +0200
Greg KH <gregkh@linuxfoundation.org> escreveu:

> On Thu, Sep 02, 2021 at 06:23:36PM +0800, Dongliang Mu wrote:
> > On Fri, Jul 23, 2021 at 6:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:  
> > >
> > > On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:  
> > > >
> > > > stk_camera_probe mistakenly execute usb_get_intf and increase the
> > > > refcount of interface->dev.
> > > >
> > > > Fix this by removing the execution of usb_get_intf.  
> > >
> > > Any idea about this patch?  
> > 
> > +cc Dan Carpenter, gregkh
> > 
> > There is no reply in this thread in one month. Can someone give some
> > feedback on this patch?  
> 
> This is the media developers domain, not much I can do here.

There is a high volume of patches for the media subsystem. Anyway,
as your patch is at our patchwork instance:

	https://patchwork.linuxtv.org/project/linux-media/patch/20210714032340.504836-1-mudongliangabcd@gmail.com/

It should be properly tracked, and likely handled after the end of
the merge window.

> > > > Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > > Fixes: 0aa77f6c2954 ("[media] move the remaining USB drivers to drivers/media/usb")
> > > > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>

If you're the author of the patch, it doesn't make much sense to
add a "Reported-by:" tag there. We only use it in order to give
someone's else credit to report an issue.

Thanks,
Mauro
