Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9E19729D22
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 16:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241281AbjFIOla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 10:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240870AbjFIOl3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 10:41:29 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 491CB1BFF
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 07:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686321688; x=1717857688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kh9TWn0GP93wkvL0k+JKFX3HDtLQXlgEdb+F1PworKU=;
  b=EY9ciT18y2hsU7lJis5DsPYIKJwYDYYxss3hBu2OgxploCg4R131ja2u
   a1YxdQP8u9dDDlHYnlxncviRxNQatE0oCVZtcK5a/ryHMuAfAJMsTMtQ3
   mtwwjhXm4yNFTW7pud+vr7Xv4G8O4kORIQdAkx1j3Wb8C6c7hX5TZi1Zz
   4J+tte61bFSvFkzmi6ZitMuZ4lUONdXvSZKEVtgxbYft8S6QDVSnHxPBH
   I9lE+MlBdJlWW1V8TW0DWloMlSSBa7gmut5lgwX1ZdaHiKlka1CKXc4Q0
   WXc8eIajb32lMZ30zJRCftfHX5LJrPasWTrGON8UFneatTdLMvleaCzxl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="342287945"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="342287945"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 07:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="704569883"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="704569883"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 07:41:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E7C8C11F76F;
        Fri,  9 Jun 2023 17:41:22 +0300 (EEST)
Date:   Fri, 9 Jun 2023 14:41:22 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [RFC 0/7] Generic line based metadata support, internal pads
Message-ID: <ZIM6EvssU3I5QPua@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <CAPY8ntAQxojXVgaD9w8O41QEt6ZBdCB+dxNnnYwimnv6GMjgDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntAQxojXVgaD9w8O41QEt6ZBdCB+dxNnnYwimnv6GMjgDQ@mail.gmail.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Fri, Jun 09, 2023 at 02:59:20PM +0100, Dave Stevenson wrote:
> Hi Sakari
> 
> Sorry to be late to the party.
> 
> On Fri, 5 May 2023 at 22:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi folks,
> >
> > Here are a few patches to add support generic, line based metadata as well
> > as internal source pads. While the amount of code is not very large, to
> > the contrary it is quite small actually IMO, I presume what this is about
> > and why it is being proposed requires some explaining.
> >
> > Metadata mbus codes and formats have existed for some time in V4L2. They
> > however have been only used by drivers that produce the data itself and
> > effectively this metadata has always been statistics of some sort (at
> > least when it comes to ISPs). What is different here is that we intend to
> > add support for metadata originating from camera sensors.
> >
> > Camera sensors produce different kinds of metadata, embedded data (usually
> > register address--value pairs used to capture the frame, in a more or less
> > sensor specific format), histograms (in a very sensor specific format),
> > dark pixels etc. The number of these formats is probably going to be about
> > as large as image data formats if not larger, as the image data formats
> > are much better standardised but a smaller subset of them will be
> > supported by V4L2, at least initially but possibly much more in the long
> > run.
> >
> > Having this many device specific formats would be a major problem for all
> > the other drivers along that pipeline (not to mention the users of those
> > drivers), including bridge (e.g. CSI-2 to parallel) but especially CSI-2
> > receiver drivers that have DMA: the poor driver developer would not only
> > need to know camera sensor specific formats but to choose the specific
> > packing of that format suitable for the DMA used by the hardware. It is
> > unlikely many of these would ever get tested while being present on the
> > driver API. Also adding new sensors with new embedded data formats would
> > involve updating all bridge and CSI-2 receiver drivers. I don't expect
> > this to be a workable approach.
> >
> > Instead what I'm proposing is to use specific metadata formats on the
> > sensor devices only, on internal pads (more about those soon) of the
> > sensors, only visible in the UAPI, and then generic mbus formats along the
> > pipeline and finally generic V4L2 metadata formats on the DMAs (specific
> > to bit depth and packing). This would unsnarl the two, defining what data
> > there is (specific mbus code) and how that is transported and packed
> > (generic mbus codes and V4L2 formats).
> >
> > The user space would be required to "know" the path of that data from the
> > sensor's internal pad to the V4L2 video node. I do not see this as these
> > devices require at least some knowledge of the pipeline, i.e. hardware at
> > hand. Separating what the data means and how it is packed may even be
> > beneficial: it allows separating code that interprets the data (sensor
> > internal mbus code) from the code that accesses it (packing).
> >
> > These formats are in practice line based, meaning that there may be
> > padding at the end of the line, depending on the bus as well as the DMA.
> > If non-line based formats are needed, it is always possible to set the
> > "height" field to 1.
> >
> > The internal (source) pads are an alternative to source routes [1]. The
> > source routes were not universally liked and I do have to say I like
> > re-using existing interface concepts (pads and everything you can do with
> > pads, including access format, selections etc.) wherever it makes sense,
> > instead of duplicating functionality.
> >
> > Effectively internal source pads behave mostly just like sink pads, but
> > they describe a flow of data that originates from a sub-device instead of
> > arriving to a sub-device. The SUBDEV_S_ROUTING IOCTLs are used to enable
> > and disable routes from internal source pads to sub-device's source pads.
> > The subdev format IOCTLs are usable, too, so one can find which subdev
> > format is available on given internal source pad.
> 
> Just to confirm my own understanding, the muxed streams API currently
> copes with situations such as the FPD-Link devices combining a single
> stream from each of a number of subdevs into one multiplexed stream
> using virtual channels, but it doesn't handle multiple data types from
> the same subdev. You're addressing that omission.

Correct.

> 
> All seems reasonable.
> 
> One detail that I haven't seen covered and think ought to be clarified.
> For raw sensors where you have image data and metadata, in my
> experience the line width of that metadata and the packing format
> (8/10/12/14/16/20/24 bit) are all dictated by the image data
> configuration. You can't have eg 640 pixel wide _SBGGR10_1X10 image
> data and 320 pixel wide _META_1X8_8 metadata. (it has to be 640 pixel
> wide _META_1X10_10)

That corresponds to my experience and is probably related to sensor
implementation rather than CSI-2 itself.

> 
> Which layer would be responsible for validating the configuration, and when?
> a) The driver validates in set_stream, and fails if mismatched. That
> potentially results in lots of duplication between drivers.
> b) set_pad_format on the image pad updates the formats and widths of
> the metadata pads automatically. Is there a way of notifying clients
> that the formats on potentially unrelated pads has changed, or is it
> something that just gets documented?
> c) something else.
> 
> Either is workable, but IMHO it needs to be specified as to which is
> the expected behaviour.

I left that out of the spec as in the end this depends on the hardware
constraints and how the driver author decided to map that to the API.

I expect sensor drivers to let the user configure the image format freely
(as it's been so far) and if there's anything to configure in the metadata
format that does not affect the image data format, then that
configurability is available on the metadata internal sink pad via
SUBDEV_S_FMT. So from the above options b appears a good fit. SUBDEV_S_FMT
does not have notification ability and probably shouldn't, instead the
order of configuration should be followed.

I think this would be good to be documented, perhaps with the first sensor
driver that uses it. Likely to be merged with this set later on.

-- 
Kind regards,

Sakari Ailus
