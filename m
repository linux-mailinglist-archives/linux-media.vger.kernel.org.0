Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A3D393DA6
	for <lists+linux-media@lfdr.de>; Fri, 28 May 2021 09:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbhE1HW7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 May 2021 03:22:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:48758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234626AbhE1HWv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 May 2021 03:22:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C66C9613ED;
        Fri, 28 May 2021 07:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622186476;
        bh=N3l+H3FWpz9hTS6R0dJJeiT9f5Hegbgor3bxDoeiZB4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=q17llRD5bNPqI2YOYou1mHif2jH1R4u5xPWmUtaumzWMCJ+/sb8OIeXoYHio5GF7A
         uLtH6EHXeA9atfcpT43lGjq6PFs2AhRZgvolLvJQzTK9jLRjpLF8V+i24STdmwQ/qc
         /gPFqkPwcj5HgMXA4sBCr41WGr85shiy7xgil3lBq7o5vZG8ZupQkO3WT2aqiS8ZI9
         yEWBRrpnf8Bosh3EZsWSAyTT2fRbC0vhfQGwU+khQztIM3d+im05hX/xOk6GoZ04Sb
         gmDJjeTF0eXV0Fy4lbWM8BD0n4y/Jy7rJhrg3kH83cpxWPO6D99A+KOj33qWh7KaDA
         Czsw9UbTtYSWA==
Received: by mail-wr1-f48.google.com with SMTP id g17so2182578wrs.13;
        Fri, 28 May 2021 00:21:16 -0700 (PDT)
X-Gm-Message-State: AOAM531AtTdYeICvR73hE0Bu2Al4fh/o9nJBHl544X27oxEgxJN+069s
        jlX7CAoQ9BEu8AxP6mBSdYCN8ZgRX2fQ4ulUhds=
X-Google-Smtp-Source: ABdhPJxHykzZrhj/hPM+SDXiG/bev9q2vVIuln4XTNDNI7FPpPyt6Z0g0tnEwyXB+ttH+lNiT9Q9Rs7Og0EDShA9RSw=
X-Received: by 2002:adf:e589:: with SMTP id l9mr7433932wrm.361.1622186475355;
 Fri, 28 May 2021 00:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210516204818.2967910-1-arnd@kernel.org> <20210524151829.GO3@paasikivi.fi.intel.com>
In-Reply-To: <20210524151829.GO3@paasikivi.fi.intel.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 28 May 2021 09:19:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1--fRJ0A+XwOPFLNDNUU7uFWi_LiPCAoCQ53GYZknvpg@mail.gmail.com>
Message-ID: <CAK8P3a1--fRJ0A+XwOPFLNDNUU7uFWi_LiPCAoCQ53GYZknvpg@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: remove compat_ioctl32 code
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Christoph Hellwig <hch@lst.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 24, 2021 at 5:18 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Sun, May 16, 2021 at 10:47:43PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > This is one of the last remaining users of compat_alloc_user_space()
> > and copy_in_user(), which are in the process of getting removed.
> >
> > As of commit 57e6b6f2303e ("media: atomisp_fops.c: disable
> > atomisp_compat_ioctl32"), nothing in this file is actually getting used
> > as the only reference has been stubbed out.
>
> This patch was made redundant by another one that fixed the bug. But I
> guess you're right in the sense that no-one could have used this because of
> the patch that disabled it.
>
> So:
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> But:
>
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> > index f1e6b2597853..e383e17c5072 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> > @@ -1283,7 +1283,8 @@ const struct v4l2_file_operations atomisp_fops = {
> >       .unlocked_ioctl = video_ioctl2,
> >  #ifdef CONFIG_COMPAT
> >       /*
> > -      * There are problems with this code. Disable this for now.
> > +      * this was removed because of bugs, the interface
> > +      * needs to be made safe for compat tasks instead.
> >       .compat_ioctl32 = atomisp_compat_ioctl32,
>
> I think the comment could go, too.

Should I replace it with an entry in the TODO file then?

       Arnd
