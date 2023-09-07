Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6B1797683
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 18:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237621AbjIGQL5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 12:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237653AbjIGQLb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 12:11:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400FB358A
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 09:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694102889; x=1725638889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wmZoioqUcHceV8ibJFxNkH8dVefBlEEXtwpsfoQKvsU=;
  b=bkdxyyb0SBtCPLwhtt39aq/OZ/7Oq1HWNn0GQoNKFI9utEAYNCSAm7hM
   oN/5hF4HOsJ9u5sRrpZidOxXyTn3R+KYwAWU3PF92bhIynh2o6NtSA1Z2
   czM4NTo90A90Bkd/HmVFdf7d+vbQ6GSbF/fQ5tK4b0yp5e92QPfXCagpv
   yTHNU+ZLgDzUU4khQrYoQjEIoYrY/INy1sdqhnrAnwbi9Ko3Pj3eLBskE
   3LjymWSPmEDd4OWfKbNuIIXJaZT5GhmJXYB3lEWyTIEU0nN9+DMWad1JZ
   Mh27+jqMpBfMqacb32qUv9L70+mbubIYtsN0tc6tknGQxQ1V01cUsyV8+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="380042664"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="380042664"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 04:04:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865595207"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="865595207"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 04:04:22 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0665811F9DF;
        Thu,  7 Sep 2023 14:04:20 +0300 (EEST)
Date:   Thu, 7 Sep 2023 11:04:19 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 04/10] media: uapi: Add generic serial metadata mbus
 formats
Message-ID: <ZPmuM3+tMJLun2c5@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-5-sakari.ailus@linux.intel.com>
 <0d022884-366d-4df0-caa6-2406714d5e07@ideasonboard.com>
 <ZOcFpbLmZHh1d6Vt@kekkonen.localdomain>
 <d16ebd3e-4837-3300-1e6b-4bf3e866e312@ideasonboard.com>
 <20230905163827.GA7971@pendragon.ideasonboard.com>
 <5e9c8fb5-6ae1-5f2c-2c1d-0a948c901dce@ideasonboard.com>
 <20230906113117.GD17308@pendragon.ideasonboard.com>
 <ZPhxwvkQO59gAjwQ@kekkonen.localdomain>
 <20230906125009.GG17308@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906125009.GG17308@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Sep 06, 2023 at 03:50:09PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Wed, Sep 06, 2023 at 12:34:10PM +0000, Sakari Ailus wrote:
> > On Wed, Sep 06, 2023 at 02:31:17PM +0300, Laurent Pinchart wrote:
> > > On Wed, Sep 06, 2023 at 11:28:37AM +0300, Tomi Valkeinen wrote:
> > > > On 05/09/2023 19:38, Laurent Pinchart wrote:
> > > > > On Thu, Aug 24, 2023 at 11:26:56AM +0300, Tomi Valkeinen wrote:
> > > > >> On 24/08/2023 10:24, Sakari Ailus wrote:
> > > > >>> On Wed, Aug 23, 2023 at 04:16:13PM +0300, Tomi Valkeinen wrote:
> > > > >>>> On 08/08/2023 10:55, Sakari Ailus wrote:
> > > > >>>>> Add generic serial metadata mbus formats. These formats describe data
> > > > >>>>> width and packing but not the content itself. The reason for specifying
> > > > >>>>> such formats is that the formats as such are fairly device specific but
> > > > >>>>> they are still handled by CSI-2 receiver drivers that should not be aware
> > > > > 
> > > > > Do we want these formats to be CSI-2-specific ?
> > > > >
> > > > >>>>> of device specific formats. What makes generic metadata formats possible
> > > > >>>>> is that these formats are parsed by software only, after capturing the
> > > > >>>>> data to system memory.
> > > > >>>>
> > > > >>>> If I'm not mistaken, the CSI-2 spec doesn't say much about embedded data,
> > > > >>>> except that it may exist. Afaics, in CSI-2, the embedded data is split into
> > > > >>>> "lines", although the amount of data can be different than in the video
> > > > >>>> lines.
> > > > >>>>
> > > > >>>> The CCS specs talks more about embedded data. Some of it is quite odd, like:
> > > > >>>> "The length of the embedded data line shall not exceed the length of the
> > > > >>>> image data line. The embedded data line should have the same length as the
> > > > >>>> image data line.". I think it means the embedded line can be shorter than
> > > > >>>> image line, but not longer.
> > > > >>>
> > > > >>> That's what it means, yes. The CCS also has means to obtain the actual
> > > > >>> length --- frame format descriptors.
> > > > >>>
> > > > >>>> CCS also says that an embedded line should use 0x07 as padding at the end of
> > > > >>>> the line, if there's less data than the image line.
> > > > >>>>
> > > > >>>> CCS also talks about how the embedded data would be packed, and in some
> > > > >>>> cases that packing would be the same as for pixel data.
> > > > >>>
> > > > >>> In fact the packing is the same as for pixel data: the CSI-2 does not
> > > > >>> really differentiate there.
> > > > >>
> > > > >> If I understand the CCS spec right, the packing is not the same as for
> > > > >> the pixel data. You can have RAW12 pixel data but 8-byte embedded data.
> > > > >> But if you meant that the different packing style options are the same
> > > > >> for pixel and embedded data, yes.
> > > > > 
> > > > > The idea is to allow CSI-2 receivers to unpack embedded data the same
> > > > > way as pixel data at the hardware level, and guarantee that no embedded
> > > > 
> > > > Yes, but my comment was to Sakari's "the packing is the same as for 
> > > > pixel data" comment. Afaics, there's nothing in CSI-2 or CCS that says 
> > > > the packing is the same for pixel data and embedded data.
> > > > 
> > > > In fact, the CSS says "By default, top-embedded data shall use the same 
> > > > data packing as the Visible pixel data with one embedded data byte per 
> > > > pixel", implying that it would not always be the case. It continues that 
> > > > for RAW16/RAW20/RAW24 pixels the embedded data could be sent with 
> > > > RAW8/RAW10/RAW12.
> > > 
> > > The spec if a bit ambiguous :-S "by default" implies that something else
> > > could be done, but it's not clear what the other options are.
> > 
> > The options for packing are detailed in the spec. For higher bit depths
> > there are options (as detailed by Tomi above).
> 
> The "by default" wording could be construed as allowing any packing. I
> think the intent was to only allow an alternative packing for RAW16 and
> higher, but it's not very clear.

The optimised packing convention is only available for RAW16 and higher ---
otherwise you won't have enough bits needed to carry two bytes of data. The
packing used is configured using emb_data_ctrl register.

Maybe annex A could be merged to section 7.15 in order to make things
clearer.

> 
> > > > That was just for top-embedded data, and I couldn't right away see 
> > > > mention of other embedded data.
> > > 
> > > The specification also mentions PDAF data for instance.
> > 
> > The bottom PDAF data is vendor defined (as it's processed) so the vendor is
> > free to do whatever there. Note that the better way to support PDAF is via
> > embedded PDAF pixels, not via separate bottom embedded (PDAF) data. The
> > bottom embedded data could also be different kinds of statistics.
> 
> Lots of ISPs don't support hardware processing of embedded PDAF pixels,
> so sensor-side processing is often nice to have. I wouldn't consider the
> embedded PDAF lines to be always worse than embedded PDAF pixels.

Not necessarily, indeed, but these formats tend not to be documented. :-(

-- 
Regards,

Sakari Ailus
