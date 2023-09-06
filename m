Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFF15793D66
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 15:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235311AbjIFNGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 09:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjIFNGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 09:06:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BE9171F
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694005602; x=1725541602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XAXTOl4gpCDSKyt2t2bE3sVk4P7d+ADExnYVy6TMuHo=;
  b=mR0+CcyCVxlS+P+oGhLzXlzeSCzDdUIZiKJukY47vlpE9snYlGgamNN1
   nW2kXPW6jPS5kqwb7VFXdaONVoKKj0VCms63qeQC5R+0ECzTCi88j7GsA
   AjFKRfIfCD3I38WAOzsMnbrJ5IibQYfqQ1ttQp0FxCkDlOspIBDDLx//u
   AM3swuoxBjRYot0RhXSi9Ho/f8Px5A3qGIS/+KqP/HYqmjghnSarOPX3x
   Lp5334e0Yhk9fhRz7zuaqs4PP7CidfeM0DSoZ66SH+ADJYrJ+rdd0cwTR
   Qr66JGlFdAw/fHq1G3YMq3QeBNOpnMK9xFTOVrgp4k2gRw7dOUQXL7GlZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="380856529"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="380856529"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 06:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="735041824"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="735041824"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 06:06:39 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C446D11FC2C;
        Wed,  6 Sep 2023 16:06:36 +0300 (EEST)
Date:   Wed, 6 Sep 2023 13:06:36 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 06/10] media: uapi: Add a macro to tell whether an
 mbus code is metadata
Message-ID: <ZPh5XLsacpmOu8OF@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-7-sakari.ailus@linux.intel.com>
 <98069c4c-d2fd-9117-08cd-eb595df77d4a@ideasonboard.com>
 <ZPcE+b3EYWM8G8vE@kekkonen.localdomain>
 <20230905170604.GG7971@pendragon.ideasonboard.com>
 <ZPhjipPedxYHxXni@kekkonen.localdomain>
 <20230906122308.GE17308@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906122308.GE17308@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 06, 2023 at 03:23:08PM +0300, Laurent Pinchart wrote:
> On Wed, Sep 06, 2023 at 11:33:30AM +0000, Sakari Ailus wrote:
> > On Tue, Sep 05, 2023 at 08:06:04PM +0300, Laurent Pinchart wrote:
> > > On Tue, Sep 05, 2023 at 10:37:45AM +0000, Sakari Ailus wrote:
> > > > On Tue, Sep 05, 2023 at 12:47:21PM +0300, Tomi Valkeinen wrote:
> > > > > On 08/08/2023 10:55, Sakari Ailus wrote:
> > > > > > Add a macro to tell whether a given mbus code is metadata.
> > > > > > 
> > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > ---
> > > > > >   include/uapi/linux/media-bus-format.h | 3 +++
> > > > > >   1 file changed, 3 insertions(+)
> > > > > > 
> > > > > > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > > > > > index 9ee031397372..2486b4178c5f 100644
> > > > > > --- a/include/uapi/linux/media-bus-format.h
> > > > > > +++ b/include/uapi/linux/media-bus-format.h
> > > > > > @@ -182,4 +182,7 @@
> > > > > >   #define MEDIA_BUS_FMT_META_20			0x8006
> > > > > >   #define MEDIA_BUS_FMT_META_24			0x8007
> > > > > > +#define MEDIA_BUS_FMT_IS_META(code)		\
> > > > > > +	((code) & 0xf000 == 0x7000 || (code) & 0xf000 == 0x8000)
> > > > > > +
> > > > > >   #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
> > > > > 
> > > > > mbus code seems to be u32, so the above won't work. Maybe:
> > > > > 
> > > > > (((code) & ~0xfffULL) == 0x7000 || ((code) & ~0xfffULL) == 0x8000)
> > > > > 
> > > > > Also, embedded formats with 0x9nnn codes are added later in the series.
> > > > 
> > > > Thanks, I'll address these for v4.
> > > 
> > > It would be nice to make this an inline function, to avoid evaluating
> > > the code twice. I think you can move it to an internal kernel header, it
> > > doesn't need to be exposed to userspace.
> > 
> > This was meant for user space consumption for setting the buffer type to
> > the video node accordingly. It's certainly possible to do that without this
> > macro, too.
> 
> I think userspace would be fine without it :-)

I'll see if this would seem useful in yavta support before dropping it: the
buffer type needs to be specified correctly and knowing the format is a
metadata format maybe helpful. Let's see.

-- 
Sakari Ailus
