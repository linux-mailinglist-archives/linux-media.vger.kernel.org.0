Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841AB232EC5
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 10:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729197AbgG3Iik (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 04:38:40 -0400
Received: from mga14.intel.com ([192.55.52.115]:13935 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729028AbgG3Iij (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 04:38:39 -0400
IronPort-SDR: 0w0WlNf6bds/SW5iPJeYGglz8WkXO143hty/WQ8FygkpV4LmrQJHsuNjQAcpk4oA7WYHdYOIxa
 Sd+mi1qg/xaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="150734124"
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; 
   d="scan'208";a="150734124"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 01:38:38 -0700
IronPort-SDR: bu9+V7we/ln6rOtutU8VW/C7vRqStryaQhZ5FopFJpxPzgTrfnd9ppiLVy5XN+Il+YKNfCbadZ
 hmcqCWQkAPrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; 
   d="scan'208";a="394921540"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2020 01:38:35 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k145B-004slM-Ry; Thu, 30 Jul 2020 11:38:33 +0300
Date:   Thu, 30 Jul 2020 11:38:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peilin Ye <yepeilin.cs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
Message-ID: <20200730083833.GD3703480@smile.fi.intel.com>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
 <20200728130632.GI1913@kadam>
 <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
 <CAMRc=MciXb152=CHAi1kfpwFuELLN55-BfNOo8hBg8Tzp4wMnQ@mail.gmail.com>
 <CAK8P3a1m7C0rGGEHvndhxun2TyFh-cweNnPHp-rDtu7Z=YyUKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1m7C0rGGEHvndhxun2TyFh-cweNnPHp-rDtu7Z=YyUKw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 30, 2020 at 10:15:24AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 30, 2020 at 10:07 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Tue, Jul 28, 2020 at 3:58 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Tue, Jul 28, 2020 at 3:06 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > Something like
> > >
> > > static int lineevent_put_data(void __user *uptr, struct gpioevent_data *ge)
> > > {
> > > #ifdef __x86_64__
> > >         /* i386 has no padding after 'id' */
> > >         if (in_ia32_syscall()) {
> > >                 struct {
> > >                         compat_u64      timestamp __packed;
> > >                         u32             id;
> > >                 } compat_ge = { ge->timestamp, ge->id };
> > >
> > >                 if (copy_to_user(uptr, &compat_ge, sizeof(compat_ge)))
> > >                         return -EFAULT;
> > >
> > >                 return sizeof(compat_ge);
> > >         }
> > > #endif
> > >
> > >         if (copy_to_user(uptr, ge, sizeof(*ge))
> > >                 return -EFAULT;
> > >
> > >         return sizeof(*ge);
> > > }
> > >
> > >        Arnd
> >
> > Hi Arnd,
> >
> > Andy actually had a patch for that but since this isn't a regression
> > (it never worked), we decided to leave it as it is and get it right in
> > v2 API.
> 
> I would argue that it needs to be fixed anyway, unless you also want
> to remove the v1 interface for native mode. If this works on 32-bit
> kernels, on 64-bit kernels with 64-bit user space and on compat
> 32-bit user space on 64-bit non-x86 architectures, I see no reason
> to leave it broken specifically on x86 compat user space. There are
> still reasons to use 32-bit x86 user space for low-memory machines
> even though native i386 kernels are getting increasingly silly.

It was possible to "fix" (mitigate to some extent) before libgpiod got support
for several events in a request. Now it seems to be impossible to fix. AFAIU we
must discard any request to more than one event in it.

However I'm not an expert in compat IOCTL code (you are :-) and perhaps you may
provide ideas better than mine.

-- 
With Best Regards,
Andy Shevchenko


