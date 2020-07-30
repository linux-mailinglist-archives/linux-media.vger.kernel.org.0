Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2288923313A
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 13:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgG3Lss (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 07:48:48 -0400
Received: from mga18.intel.com ([134.134.136.126]:28320 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbgG3Lsr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 07:48:47 -0400
IronPort-SDR: 43OE7a9WJ395AqDiD2EuId75l8yCfaEudjVKoAVY4rwenWJ024TxGavR/pjIhzUZunw9TD13Jz
 D7l+S4cpxZTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="139121723"
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="139121723"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 04:48:47 -0700
IronPort-SDR: wmlhB2ZzttBFINXRufelrxv8L53CImhLZ6YLEBjkVR5V0gkzH1JXuIS1XD0H6dLKepNgiLNPuq
 Qw0S9w3OkVZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="491097611"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jul 2020 04:48:43 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k173C-004ugB-9a; Thu, 30 Jul 2020 14:48:42 +0300
Date:   Thu, 30 Jul 2020 14:48:42 +0300
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
Message-ID: <20200730114842.GH3703480@smile.fi.intel.com>
References: <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
 <20200728130632.GI1913@kadam>
 <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
 <CAMRc=MciXb152=CHAi1kfpwFuELLN55-BfNOo8hBg8Tzp4wMnQ@mail.gmail.com>
 <CAK8P3a1m7C0rGGEHvndhxun2TyFh-cweNnPHp-rDtu7Z=YyUKw@mail.gmail.com>
 <20200730083833.GD3703480@smile.fi.intel.com>
 <CAK8P3a2i2mnRPZ-f9UNxPNJcjyjdTOA7-fgcMqavsV8Ab17RkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2i2mnRPZ-f9UNxPNJcjyjdTOA7-fgcMqavsV8Ab17RkQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 30, 2020 at 11:18:04AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 30, 2020 at 10:38 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Jul 30, 2020 at 10:15:24AM +0200, Arnd Bergmann wrote:
> > > On Thu, Jul 30, 2020 at 10:07 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

...

> > > I would argue that it needs to be fixed anyway, unless you also want
> > > to remove the v1 interface for native mode. If this works on 32-bit
> > > kernels, on 64-bit kernels with 64-bit user space and on compat
> > > 32-bit user space on 64-bit non-x86 architectures, I see no reason
> > > to leave it broken specifically on x86 compat user space. There are
> > > still reasons to use 32-bit x86 user space for low-memory machines
> > > even though native i386 kernels are getting increasingly silly.
> >
> > It was possible to "fix" (mitigate to some extent) before libgpiod got support
> > for several events in a request. Now it seems to be impossible to fix. AFAIU we
> > must discard any request to more than one event in it.
> 
> Any reason why the workaround I suggested above would not work?

That is the question to somebody who has better understanding. If it works,
I vote up to get it fixed with little effort. I would be glad to test patches!

> The in_ia32_syscall() check should be completely reliable in telling whether
> we are called from read() by an ia32 task or not, and we use the same
> logic for input_event, which has a similar problem (on all compat architectures,
> not just x86).

By the way any reason why we have to have in_ia32_syscall() instead of
in_compat_syscall()?

> > However I'm not an expert in compat IOCTL code (you are :-) and perhaps you may
> > provide ideas better than mine.
> 
> What makes this interface tricky is that this is actually a read() call, not
> ioctl() which is usually easier because it encodes the data length in the
> command code. As far as I could tell from skimming the interface, the
> ioctls are actually fine here.

Right.

-- 
With Best Regards,
Andy Shevchenko


