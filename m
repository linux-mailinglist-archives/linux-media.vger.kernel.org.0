Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC74A797B0E
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 20:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234083AbjIGSBR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 14:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245689AbjIGSBP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 14:01:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071E21FF5
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 11:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694109654; x=1725645654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p6s/ghMXMV68Kdag5Vu/r94gOoWNmhl0k+5ya8EbzIU=;
  b=KBW/ze4B/nZm/sI8Cu6dWovPcPnH8nZXgxqdJIFh4l6YOhvY3ARrzK+n
   tS4Gt0nN+xHbOMGmxo8exqcNlx4f0E8Seizmp4B6Xf7fiaXBe0wgjNhYp
   ENYQW9+0BEFQlX46aiZ6SYLHepDubUkFB6YksdJ68avRemK7JTt/TY+3F
   8K4e8boLv79EwAJ+4Mmsf9gX5QSlUWEoJj9LDe091ID7nWkOyJiEhKLeO
   +CgdD1og2kyrj0keiy4cI5NoVS7E+X7AdyfjSXpkUG54cnWu5mKzBZZxf
   MH+n0GhSf7atl9JsoFzziXA1Q2XhX7j9Pn+XfIXWUHwu2zAIHQ8AqHCRd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443678299"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="443678299"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 01:20:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="691693182"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="691693182"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 01:20:32 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1892911FAE0;
        Thu,  7 Sep 2023 11:20:30 +0300 (EEST)
Date:   Thu, 7 Sep 2023 08:20:30 +0000
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
Message-ID: <ZPmHzg/vFHoM4Cui@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-7-sakari.ailus@linux.intel.com>
 <98069c4c-d2fd-9117-08cd-eb595df77d4a@ideasonboard.com>
 <ZPcE+b3EYWM8G8vE@kekkonen.localdomain>
 <20230905170604.GG7971@pendragon.ideasonboard.com>
 <ZPhjipPedxYHxXni@kekkonen.localdomain>
 <20230906122308.GE17308@pendragon.ideasonboard.com>
 <ZPh5XLsacpmOu8OF@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPh5XLsacpmOu8OF@kekkonen.localdomain>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 06, 2023 at 01:06:36PM +0000, Sakari Ailus wrote:
> On Wed, Sep 06, 2023 at 03:23:08PM +0300, Laurent Pinchart wrote:
> > On Wed, Sep 06, 2023 at 11:33:30AM +0000, Sakari Ailus wrote:
> > > On Tue, Sep 05, 2023 at 08:06:04PM +0300, Laurent Pinchart wrote:
> > > > On Tue, Sep 05, 2023 at 10:37:45AM +0000, Sakari Ailus wrote:
> > > > > On Tue, Sep 05, 2023 at 12:47:21PM +0300, Tomi Valkeinen wrote:
> > > > > > On 08/08/2023 10:55, Sakari Ailus wrote:
> > > > > > > Add a macro to tell whether a given mbus code is metadata.
> > > > > > > 
> > > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > ---
> > > > > > >   include/uapi/linux/media-bus-format.h | 3 +++
> > > > > > >   1 file changed, 3 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > > > > > > index 9ee031397372..2486b4178c5f 100644
> > > > > > > --- a/include/uapi/linux/media-bus-format.h
> > > > > > > +++ b/include/uapi/linux/media-bus-format.h
> > > > > > > @@ -182,4 +182,7 @@
> > > > > > >   #define MEDIA_BUS_FMT_META_20			0x8006
> > > > > > >   #define MEDIA_BUS_FMT_META_24			0x8007
> > > > > > > +#define MEDIA_BUS_FMT_IS_META(code)		\
> > > > > > > +	((code) & 0xf000 == 0x7000 || (code) & 0xf000 == 0x8000)
> > > > > > > +
> > > > > > >   #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
> > > > > > 
> > > > > > mbus code seems to be u32, so the above won't work. Maybe:
> > > > > > 
> > > > > > (((code) & ~0xfffULL) == 0x7000 || ((code) & ~0xfffULL) == 0x8000)
> > > > > > 
> > > > > > Also, embedded formats with 0x9nnn codes are added later in the series.
> > > > > 
> > > > > Thanks, I'll address these for v4.
> > > > 
> > > > It would be nice to make this an inline function, to avoid evaluating
> > > > the code twice. I think you can move it to an internal kernel header, it
> > > > doesn't need to be exposed to userspace.
> > > 
> > > This was meant for user space consumption for setting the buffer type to
> > > the video node accordingly. It's certainly possible to do that without this
> > > macro, too.
> > 
> > I think userspace would be fine without it :-)
> 
> I'll see if this would seem useful in yavta support before dropping it: the
> buffer type needs to be specified correctly and knowing the format is a
> metadata format maybe helpful. Let's see.

As yavta doesn't deal with mbus codes, this isn't useful for it. I'll drop
it for now.

-- 
Sakari Ailus
