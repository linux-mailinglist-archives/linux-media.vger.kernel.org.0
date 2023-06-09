Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10812729BB4
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 15:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238987AbjFINiP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 09:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbjFINiP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 09:38:15 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2AC30E4
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686317893; x=1717853893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YTBeme61ifMCNhaJT/Vd9gBeaMyh9ONfhNs5Jo8Asgk=;
  b=KB0GkJ5+r7sA9hgV4BULAmLmCf5pqWAJPagsi5mTHRkTG3G8jCLfxVnw
   PM+VhnvNV5AYVIA/zKODD6mlz1mG/bubQNdbJ/Mnxb4kW6CSqdl7vUoIV
   4ptnqnHZ40aZdBtDtxj8gKsnlplyGY/92XMPb8NlESDR8v4v76aRKRc6q
   a8KILkLayWX8ZfTMVuIWcoSNzj5FuozxSaZGPbp8e6FZXybu+tL3s4qNQ
   ebqS2WbVc7vf4FtooQIppYdqUirTodEk46+YZFa3HRnJukROWSSG5H3pg
   tK7Rwa8N13BLylUvJ/Y5fDgRcB1NlCKMFoRLPuQP+TDC9xpH87vxHNFOm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="356488435"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="356488435"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="710370010"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="710370010"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:38:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id CC69F120A0E;
        Fri,  9 Jun 2023 16:38:08 +0300 (EEST)
Date:   Fri, 9 Jun 2023 13:38:08 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [RFC 5/7] media: uapi: Add generic serial metadata mbus formats
Message-ID: <ZIMrQP/d34qy5tSd@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-6-sakari.ailus@linux.intel.com>
 <15949b9b-e41d-385a-6488-f51c64483a38@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15949b9b-e41d-385a-6488-f51c64483a38@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jun 08, 2023 at 10:46:28AM +0200, Hans Verkuil wrote:
> On 05/05/2023 23:52, Sakari Ailus wrote:
> > Add generic serial metadata mbus formats. These formats describe data
> > width and packing but not the content itself. The reason for specifying
> > such formats is that the formats as such are fairly device specific but
> > they are still handled by CSI-2 receiver drivers that should not be aware
> > of device specific formats. What makes generic metadata formats possible
> > is that these formats are parsed by software only, after capturing the
> > data to system memory.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/subdev-formats.rst              | 257 ++++++++++++++++++
> >  include/uapi/linux/media-bus-format.h         |   9 +
> >  2 files changed, 266 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index a3a35eeed708..1492fff58426 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -8234,3 +8234,260 @@ The following table lists the existing metadata formats.
> >  	both sides of the link and the bus format is a fixed
> >  	metadata format that is not configurable from userspace.
> >  	Width and height will be set to 0 for this format.
> > +
> > +Generic Serial Metadata Formats
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Generic serial metadata formats are used on serial busses where the actual data
> > +content is more or less device specific but the data is transmitted and received
> > +by multiple devices that do not process the data in any way, simply writing
> > +it to system memory for processing in software at the end of the pipeline.
> > +
> > +The more specific variant describing the actual data is used on the internal
> > +source pad of the originating sub-device.
> 
> I'm a bit confused here: on which pads are these generic mbus formats
> set? And who sets this?

As with other pads, the user can set the format. In most cases only a
single option is available whenever the device ourputs metadata over a
stream (and thus uses on of the generic line based metadata formats).

> 
> I.e. the internal source pad has e.g. MEDIA_BUS_FMT_META_FOOBAR_HIST as
> specific format. It's routed to a source pad + stream pair for transfer
> over CSI. Does that source pad + stream pair use the generic mediabus
> format?

Correct.

-- 
Sakari Ailus
