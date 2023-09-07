Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC3A797856
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 18:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242129AbjIGQqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 12:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242104AbjIGQqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 12:46:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C00493C1
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 09:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694103578; x=1725639578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eSKLhJp6Sx1MCG8ralZ8y8ZiUhEV5eexMEy7kESnpFU=;
  b=dpf2VY+YLs95dD7uo1zdZwTD3iQYTjdox4GM9y2OWbfIj0nTIDNBgArq
   25OnAYNEMcwbjyaIly/v6/sB8ertIEks7pAQhZTnR/AACamqj4F35W/yS
   ypqv4HnORfgzld7PTGoF1AF6gvNY8m1DX2hhAl/Ik95tF0OZxJayEoax4
   /Ma7ehGDyJk1jigDjlmIFHccDkvREfPpEs7Dc8FCRgGm3rUMhoynFIQu3
   IsPh9h9ntJ5ksyAHK5D7wpzG0Y32dsmFZkFC2V36Lo7yIDwUo5Jx4uSjl
   B/+eVRxAnuumaOGmfgmXyxv1+fhJG7CR3cQh0kMjWBF+98AAwN5VTEsVn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="441311172"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="441311172"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 04:10:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="812096649"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="812096649"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 04:10:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id EA0DC11F9DF;
        Thu,  7 Sep 2023 14:10:04 +0300 (EEST)
Date:   Thu, 7 Sep 2023 11:10:04 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 09/10] media: Add media bus codes for MIPI CCS
 embedded data
Message-ID: <ZPmvjJIA3Nqmyed+@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-10-sakari.ailus@linux.intel.com>
 <20230905172535.GI7971@pendragon.ideasonboard.com>
 <ZPh4ln9GkyQDmbfp@kekkonen.localdomain>
 <20230906131510.GK17308@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906131510.GK17308@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Sep 06, 2023 at 04:15:10PM +0300, Laurent Pinchart wrote:
> On Wed, Sep 06, 2023 at 01:03:18PM +0000, Sakari Ailus wrote:
> > On Tue, Sep 05, 2023 at 08:25:35PM +0300, Laurent Pinchart wrote:
> > > On Tue, Aug 08, 2023 at 10:55:37AM +0300, Sakari Ailus wrote:
> > > > Add new MIPI CCS embedded data media bus formats.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../media/v4l/subdev-formats.rst              | 32 +++++++++++++++++++
> > > >  include/uapi/linux/media-bus-format.h         | 10 +++++-
> > > >  2 files changed, 41 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > index c615da08502d..5d5407738af9 100644
> > > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > @@ -8491,3 +8491,35 @@ and finally the bit number in subscript. "p" indicates a padding bit.
> > > >        - p
> > > >        - p
> > > >        - p
> > > > +
> > > > +MIPI CCS Embedded Data Formats
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines an
> > > 
> > > s/an$/a/
> > 
> > Yes. I think I had "embedded" there in the past...
> > 
> > > > +metadata format for sensor embedded data, which is used to store the register
> > > > +configuration used for capturing a given frame. The format is defined in the CCS
> > > > +specification.
> > > 
> > > Strictly speaking, the MIPI CCS embedded data format specifies not just
> > > the data packing (insertion of padding bytes) and the data encoding (the
> > > data format byte and the tag codes), but also the register addresses and
> > > values that are reported in the embedded data. Do you envision the media
> > > bus formats defined here as being applicable to sensors that use the
> > > same packing and encoding as CCS, but different registers, or only to
> > > fully compliant CCS sensors ?
> > 
> > There are sensors that aren't fully compatible with CCS (including those
> > compatible with SMIA and SMIA++) but I wouldn't expect the format to be
> > used by devices that are entirely incompatible with CCS.
> 
> So if a sensor uses the same packing and encoding as CCS, but a
> different register set, you would require other media bus codes ? If so,
> how would you require those media bus codes to be documented ? The
> packing and encoding could be documented as being identical to CCS, but
> what about the data itself ? Would you require the datasheet to be
> public ? Or the entire register set being documented in the V4L2 spec ?

I'd hope the registers the values of which are written in the embedded data
should be documented, either in V4L2 spec or other documentation.

But then, what do you do if you don't have documentation for all the
registers while you'd like to use what in general is needed there, exposure
time and gain? Do we say no, you can't do that because everything isn't
documented, or do we say yes, you can document this format partially.
That's what we should discuss and decide.

Note that commonly the case is that whoever would like to use the
information in the embedded data may well not have the full documentation
either. Also, even without documentation, it is in the vast majority of
the cases trivial to figure out where these values can be found.

-- 
Regards,

Sakari Ailus
