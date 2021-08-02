Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F31F3DD02F
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 08:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhHBGA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 02:00:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:42439 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229734AbhHBGA7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Aug 2021 02:00:59 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="213120549"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="213120549"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2021 23:00:49 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="568219178"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2021 23:00:45 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 1FD12203BC;
        Mon,  2 Aug 2021 09:00:42 +0300 (EEST)
Date:   Mon, 2 Aug 2021 09:00:42 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2][next] media: staging/intel-ipu3: css: Replace
 one-element array and use struct_size() helper
Message-ID: <20210802060042.GK3@paasikivi.fi.intel.com>
References: <cover.1627600430.git.gustavoars@kernel.org>
 <8db90c8f5124bbeab20af9c1314439da8f033184.1627600430.git.gustavoars@kernel.org>
 <20210730074950.GW1931@kadam>
 <20210730084009.GA5422@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210730084009.GA5422@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gustavo,

On Fri, Jul 30, 2021 at 03:40:09AM -0500, Gustavo A. R. Silva wrote:
> On Fri, Jul 30, 2021 at 10:49:50AM +0300, Dan Carpenter wrote:
> > On Thu, Jul 29, 2021 at 06:22:40PM -0500, Gustavo A. R. Silva wrote:
> > > There is a regular need in the kernel to provide a way to declare having
> > > a dynamically sized set of trailing elements in a structure. Kernel code
> > > should always use “flexible array members”[1] for these cases. The older
> > > style of one-element or zero-length arrays should no longer be used[2].
> > > 
> > > Replace a one-element array with a flexible-array member in struct
> > > imgu_fw_header and use the struct_size() helper.
> > > 
> > > This also helps with the ongoing efforts to globally enable
> > > -Warray-bounds and get us closer to being able to tighten the
> > > FORTIFY_SOURCE routines on memcpy().
> > > 
> > > [1] https://en.wikipedia.org/wiki/Flexible_array_member
> > > [2] https://www.kernel.org/doc/html/v5.10/process/deprecated.html#zero-length-and-one-element-arrays
> > > 
> > > Link: https://github.com/KSPP/linux/issues/79
> > > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > > ---
> > >  drivers/staging/media/ipu3/ipu3-css-fw.c | 5 ++---
> > >  drivers/staging/media/ipu3/ipu3-css-fw.h | 2 +-
> > >  2 files changed, 3 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
> > > index ab021afff954..3b7df1128840 100644
> > > --- a/drivers/staging/media/ipu3/ipu3-css-fw.c
> > > +++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
> > > @@ -127,9 +127,8 @@ int imgu_css_fw_init(struct imgu_css *css)
> > >  	if (css->fw->size < sizeof(struct imgu_fw_header) ||
> >                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Originally this was sizeof() the pointer which is clearly wrong.  Then
> > patch 1 changed it to force that binary_header[] had at least one
> > element, but now it's changed again to say that binary_header[] can have
> > zero elements.  So either patch 1 or patch 2 is wrong.
> > 
> > I feel like the probably the correct fix is to just fold these two
> > patches together and say that binary_header[] with zero elements is
> > allowed.  But I don't know this code well.
> 
> Oops... I forgot to tag this one for stable, too. But it would probably
> be better to fold both of these into a single patch as you suggest.
> 
> To me these two pieces of code suggest that binary_header[] should not
> be declared as a one-element array, but a flexible one instead:

I guess if you look at the data structure alone, you're right.

But you'll need at least one binary for the firmware to be useful. So if
you'd change the struct as in this patch, an additional check for the
number of binaries will be needed.

I think I'd keep the patches separate, the first one is a bugfix but the
second one is just about making the code a little nicer.

-- 
Kind regards,

Sakari Ailus
