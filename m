Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF97B5F409F
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 12:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbiJDKP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 06:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJDKP1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 06:15:27 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412332AC79
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 03:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664878524; x=1696414524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/K7M43Dyqv7vXQZYikKA1OEQCt+nrxqM2mVGqErgGOU=;
  b=eyciK0AhBOOu2wCmMUmNIzdSYbarJprxhkhKjSFJVPsxUZxlvOiqYwtx
   MWcEZMPXCwCZyuBqUnt97PAjpJiNXg/Co/2Ko7gtY5qnWXYsjQ9q9P8Si
   752sHs+8RTwhh1h2GRx8evhb3ES22L9JUVgOCh9SgaM2rAJFv6+FwctLp
   uMBQeIYmUNHt2AF5IUsWMev1z4oIu5XL1chYQ6Edi/poSSRYZYt0YEkPx
   YJciifCo4GWNwZZ8rf4V4xIo7YgptI8CwiZvK3bHcWMIOAB3OgtS1wSpN
   Gbpx7T9wWeceb3taM5OzV0dn5Int5PUEjdl21FGGBlWoNZIVur/nb1AgK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="302852874"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="302852874"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 03:15:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="728163858"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="728163858"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 03:15:21 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D27AE20321;
        Tue,  4 Oct 2022 13:05:57 +0300 (EEST)
Date:   Tue, 4 Oct 2022 10:05:57 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v15 05/19] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <YzwFhYtzh8hPoAYv@paasikivi.fi.intel.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-6-tomi.valkeinen@ideasonboard.com>
 <7b56d565-5358-67be-84b8-101a97f97f2b@xs4all.nl>
 <Yztb06LVmPBKf8J2@paasikivi.fi.intel.com>
 <eea402df-7468-f9fc-ed05-8581ea67f5d3@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eea402df-7468-f9fc-ed05-8581ea67f5d3@xs4all.nl>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Oct 04, 2022 at 10:43:55AM +0200, Hans Verkuil wrote:
> Hi Sakari,
> 
> On 10/4/22 00:01, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Mon, Oct 03, 2022 at 04:26:32PM +0200, Hans Verkuil wrote:
> >>> +#define V4L2_SUBDEV_ROUTE_FL_SOURCE		(1U << 1)
> >>
> >> Can we rename this to _FL_INTERNAL_SOURCE? Just 'SOURCE' is very confusing
> >> IMHO. The name 'INTERNAL_SOURCE' makes it clear that it is generated internally,
> >> and so does not come from an external sink-side endpoint.
> >>
> >> I also think that the documentation for this flag in patch 04/19 is very vague,
> >> I'll comment on that patch as well.
> > 
> > Having descriptive names is important but I think "SOURCE" as such is fine
> > for the purpose. Adding "INTERNAL_" adds 9 characters to what is already a
> > very long name, making the flag very clumsy to use in code. That's why I
> > would prefer to keep it as-is.
> > 
> 
> _FL_SOURCE is meaningless (at least to me): there are so many 'source' and 'sink'
> references, that just plain 'SOURCE' doesn't help me understand what the flag
> means. I did consider INT_SOURCE, but I thought 'INT' is too close to 'interrupt'.
> I'm OK with that, though.
> 
> Another alternative would be _FL_NO_SINK: that clearly conveys that 1) there is
> no sink, and implies that 2) the source is internally generated.
> 
> Or perhaps: _FL_SOURCE_ONLY?

This appears as the best compromise IMO. NO_SINK is shorter but conveying
the meaning through negation is what I don't like too much.

-- 
Kind regards,

Sakari Ailus
