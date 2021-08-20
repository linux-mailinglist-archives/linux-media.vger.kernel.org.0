Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 443443F2E78
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 17:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240607AbhHTPDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 11:03:23 -0400
Received: from mga02.intel.com ([134.134.136.20]:61999 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229772AbhHTPDX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 11:03:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="203983320"
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="203983320"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2021 08:02:45 -0700
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="463409322"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2021 08:02:43 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 92E68201C5;
        Fri, 20 Aug 2021 18:02:41 +0300 (EEST)
Date:   Fri, 20 Aug 2021 18:02:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Fabian =?iso-8859-1?Q?W=FCthrich?= <me@fabwu.ch>,
        linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Dan Scally <djrscally@gmail.com>
Subject: Re: [PATCH v4] ipu3-cio2: Parse sensor orientation and rotation
Message-ID: <20210820150241.GC3@paasikivi.fi.intel.com>
References: <20210414083022.25453-3-me@fabwu.ch>
 <20210712090326.7064-1-me@fabwu.ch>
 <20210820131207.GB3@paasikivi.fi.intel.com>
 <CAHp75Vf=1aKx=SN60rGpUpgvXEryq9w1R7NRi0nCG49jWWzefg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vf=1aKx=SN60rGpUpgvXEryq9w1R7NRi0nCG49jWWzefg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Fri, Aug 20, 2021 at 04:25:15PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 20, 2021 at 4:12 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Mon, Jul 12, 2021 at 11:03:26AM +0200, Fabian Wüthrich wrote:
> > > The sensor orientation is read from the _PLC ACPI buffer and converted to a v4l2
> > > format.
> > >
> > > The sensor rotation is read from the SSDB ACPI buffer and converted into
> > > degrees.
> > >
> > > Signed-off-by: Fabian Wüthrich <me@fabwu.ch>
> > > Reviewed-by: Daniel Scally <djrscally@gmail.com>
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> > It's in my tree now.
> 
> Do you know what's going on with
> https://lore.kernel.org/linux-media/20210726084055.54887-1-andriy.shevchenko@linux.intel.com/
> ?

I thought you'd be merging that through the other tree where the other
patch was merged.

I can also take it through the media tree. I guess by now it'll be the next
version in any case.

-- 
Kind regards,

Sakari Ailus
