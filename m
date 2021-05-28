Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A34E5394069
	for <lists+linux-media@lfdr.de>; Fri, 28 May 2021 11:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236209AbhE1J6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 May 2021 05:58:10 -0400
Received: from mga07.intel.com ([134.134.136.100]:64311 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235292AbhE1J6G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 May 2021 05:58:06 -0400
IronPort-SDR: 7p1Kl/A3ra87q2Or4wNL8ZUAuNcmB8tJobuP4JE800qDsSKRz0ZtB0lcVjKpNmGAXMYTJdEVtd
 CstySekkotcw==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="266814201"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="266814201"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:56:30 -0700
IronPort-SDR: lHedNBtMjWa7HpWVCW9aObzHnYW23RnXYGsPsppyc6Ei+P04eyzXOHyu8ZfV457u3N4AOaUWI7
 wqEwtzQiUwfw==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="480985811"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:56:28 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 09160202F7;
        Fri, 28 May 2021 12:56:26 +0300 (EEST)
Date:   Fri, 28 May 2021 12:56:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Christoph Hellwig <hch@lst.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: remove compat_ioctl32 code
Message-ID: <20210528095625.GO3@paasikivi.fi.intel.com>
References: <20210516204818.2967910-1-arnd@kernel.org>
 <20210524151829.GO3@paasikivi.fi.intel.com>
 <CAK8P3a1--fRJ0A+XwOPFLNDNUU7uFWi_LiPCAoCQ53GYZknvpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1--fRJ0A+XwOPFLNDNUU7uFWi_LiPCAoCQ53GYZknvpg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 28, 2021 at 09:19:46AM +0200, Arnd Bergmann wrote:
> On Mon, May 24, 2021 at 5:18 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Sun, May 16, 2021 at 10:47:43PM +0200, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > This is one of the last remaining users of compat_alloc_user_space()
> > > and copy_in_user(), which are in the process of getting removed.
> > >
> > > As of commit 57e6b6f2303e ("media: atomisp_fops.c: disable
> > > atomisp_compat_ioctl32"), nothing in this file is actually getting used
> > > as the only reference has been stubbed out.
> >
> > This patch was made redundant by another one that fixed the bug. But I
> > guess you're right in the sense that no-one could have used this because of
> > the patch that disabled it.
> >
> > So:
> >
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >
> > But:
> >
> > > diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> > > index f1e6b2597853..e383e17c5072 100644
> > > --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> > > +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> > > @@ -1283,7 +1283,8 @@ const struct v4l2_file_operations atomisp_fops = {
> > >       .unlocked_ioctl = video_ioctl2,
> > >  #ifdef CONFIG_COMPAT
> > >       /*
> > > -      * There are problems with this code. Disable this for now.
> > > +      * this was removed because of bugs, the interface
> > > +      * needs to be made safe for compat tasks instead.
> > >       .compat_ioctl32 = atomisp_compat_ioctl32,
> >
> > I think the comment could go, too.
> 
> Should I replace it with an entry in the TODO file then?

On second thought, it's fine.

The lack of compat ioctl support is not among the biggest issues anyway.

-- 
Sakari Ailus
