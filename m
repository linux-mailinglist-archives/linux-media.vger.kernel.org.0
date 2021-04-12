Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B2F35C38B
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 12:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237626AbhDLKRp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 06:17:45 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:49165 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237302AbhDLKR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 06:17:29 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AGbDAia04DzLbot04H/gwLgqjBGUkLtp033Aq?=
 =?us-ascii?q?2lEZdDV+dMuEm8ey2MkB3RjvhzoLHF0mk9aMOK6PKEm9ybde544NMbC+GDT3oW?=
 =?us-ascii?q?fAFuBfxKbr3jGIIUfD38FH06MIScRDIfnRKXQ/ssrg+gm/FL8bruWv1Kyzn+/R?=
 =?us-ascii?q?wzNMYGhRAJ1I1AtyBgaFHkAefmAvObMCCJGe6sBbzgDMRV0raK2AaUU4Yw=3D?=
 =?us-ascii?q?=3D?=
X-IronPort-AV: E=Sophos;i="5.82,216,1613430000"; 
   d="scan'208";a="502751049"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 12:17:10 +0200
Date:   Mon, 12 Apr 2021 12:17:10 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Greg KH <gregkh@linuxfoundation.org>
cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mitali Borkar <mitaliborkar810@gmail.com>,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] Re: [PATCH 1/6] staging: media: intel-ipu3:
 replace bit shifts with BIT() macro
In-Reply-To: <YHQXty07oAP1L0W9@kroah.com>
Message-ID: <alpine.DEB.2.22.394.2104121216140.6734@hadrien>
References: <cover.1618180659.git.mitaliborkar810@gmail.com> <cc7b827a3264f08cedb76adddd16a34df48f935f.1618180659.git.mitaliborkar810@gmail.com> <20210412094230.GI3@paasikivi.fi.intel.com> <YHQXty07oAP1L0W9@kroah.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Mon, 12 Apr 2021, Greg KH wrote:

> On Mon, Apr 12, 2021 at 12:42:30PM +0300, Sakari Ailus wrote:
> > Hi Mitali,
> >
> > On Mon, Apr 12, 2021 at 04:38:39AM +0530, Mitali Borkar wrote:
> > > Added #include <linux/bitops.h> and replaced bit shifts by BIT() macro.
> > > This BIT() macro from linux/bitops.h is used to define IPU3_UAPI_GRID_Y_START_EN
> > > and IPU3_UAPI_AWB_RGBS_THR_B_* bitmask.
> > > Use of macro is better and neater. It maintains consistency.
> > > Reported by checkpatch.
> > >
> > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > ---
> > >  drivers/staging/media/ipu3/include/intel-ipu3.h | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > index edd8edda0647..589d5ccee3a7 100644
> > > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > @@ -5,6 +5,7 @@
> > >  #define __IPU3_UAPI_H
> > >
> > >  #include <linux/types.h>
> > > +#include <linux/bitops.h>
> > >
> > >  /* from /drivers/staging/media/ipu3/include/videodev2.h */
> > >
> > > @@ -22,11 +23,11 @@
> > >  #define IPU3_UAPI_MAX_BUBBLE_SIZE			10
> > >
> > >  #define IPU3_UAPI_GRID_START_MASK			((1 << 12) - 1)

Mitali,

It's not very relevant given the use of this header, but if the 1 << 15
translation was correct, you could have changed the 1 << 12 computation as
well.

julia

> > > -#define IPU3_UAPI_GRID_Y_START_EN			(1 << 15)
> > > +#define IPU3_UAPI_GRID_Y_START_EN			BIT(15)
> >
> > This header is used in user space where you don't have the BIT() macro.
>
> If that is true, why is it not in a "uapi" subdir within this driver?
>
> Otherwise it is not obvious at all that this is the case :(
>
> thanks,
>
> greg k-h
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YHQXty07oAP1L0W9%40kroah.com.
>
