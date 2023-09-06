Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26043793CE4
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 14:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236916AbjIFMnz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 08:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233463AbjIFMny (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 08:43:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFFF170D
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 05:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694004230; x=1725540230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HmvG1tXf0cm/aujjxpJSjnaiOL8iS2W03IstsKpxKHw=;
  b=VGiBFu9pIOKaLC5BBIiBlkeZ7LrLag7gDMlDI2KLPIzBya2zwaUOup4u
   G+TCAke1AoCwRuia43JxNcQcHHo6SEVlMuSLj0+lwfV9rm4Wa2o5r1nt3
   d/0S9imAdB/2F8FpRYXnhGE20pZG1jRMOJU/HpS7detDEUt8s4w/s11+O
   k+NU8C+re8ybvTRdpojeJ6jPaKo2IdXQ4HS9phoBluqLGVsS50e+wgi35
   tTjCeENdYo+2GfIdSK0Vg8gN2LqU7DcG0bk8hAKHHc2fSK65D/LluR0fm
   16U5gjB8bI8n2y87WLYHboNk4OOKoyw826YWUGy8gSDjCPo7PZpaTRt28
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="441030116"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="441030116"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 05:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="988222400"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="988222400"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 05:43:47 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id BF07311FC2C;
        Wed,  6 Sep 2023 15:43:44 +0300 (EEST)
Date:   Wed, 6 Sep 2023 12:43:44 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 01/10] media: Documentation: Align numbered list
Message-ID: <ZPh0ALJSBxcE4QP8@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-2-sakari.ailus@linux.intel.com>
 <20230905130640.GF11700@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905130640.GF11700@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Sep 05, 2023 at 04:06:40PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Aug 08, 2023 at 10:55:29AM +0300, Sakari Ailus wrote:
> > Align lines for numbered list so that Sphinx produces an uniform output
> > for all list entries.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/dev-subdev.rst    | 27 +++++++++----------
> >  1 file changed, 13 insertions(+), 14 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index a4f1df7093e8..b023918177b5 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -579,20 +579,19 @@ is started.
> >  
> >  There are three steps in configuring the streams:
> >  
> > -1) Set up links. Connect the pads between sub-devices using the :ref:`Media
> > -Controller API <media_controller>`
> > +1) Set up links. Connect the pads between sub-devices using the
> > +   :ref:`Media Controller API <media_controller>`
> 
> While at it, could we standardize on 1. vs. 1) ? Both are used in the
> same file. After this patch they both render to "1.", but it would be
> nice to be consistent in the source too.

I'll check the rest of the file. The number followed by a trailing dot is a
numbered list in ReST, we should align with that.

> 
> >  
> > -2) Streams. Streams are declared and their routing is configured by
> > -setting the routing table for the sub-device using
> > -:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
> > -setting the routing table will reset formats and selections in the
> > -sub-device to default values.
> > +2) Streams. Streams are declared and their routing is configured by setting the
> > +   routing table for the sub-device using :ref:`VIDIOC_SUBDEV_S_ROUTING
> > +   <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that setting the routing table will
> > +   reset formats and selections in the sub-device to default values.
> >  
> > -3) Configure formats and selections. Formats and selections of each stream
> > -are configured separately as documented for plain sub-devices in
> > -:ref:`format-propagation`. The stream ID is set to the same stream ID
> > -associated with either sink or source pads of routes configured using the
> > -:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
> > +3) Configure formats and selections. Formats and selections of each stream are
> > +   configured separately as documented for plain sub-devices in
> > +   :ref:`format-propagation`. The stream ID is set to the same stream ID
> > +   associated with either sink or source pads of routes configured using the
> > +   :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
> >  
> >  Multiplexed streams setup example
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > @@ -619,8 +618,8 @@ modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
> >  To configure this pipeline, the userspace must take the following steps:
> >  
> >  1) Set up media links between entities: connect the sensors to the bridge,
> > -bridge to the receiver, and the receiver to the DMA engines. This step does
> > -not differ from normal non-multiplexed media controller setup.
> > +   bridge to the receiver, and the receiver to the DMA engines. This step does
> > +   not differ from normal non-multiplexed media controller setup.
> >  
> >  2) Configure routing
> >  
> 
> 3) below contains two paragraphs that are not indented.

From the documentation output this does not matter. Or was your comment
about aligning the formatting in the source? (I prefer it as-is but no
strong opinion about it either. Just slightly easier to edit that way. :-))

-- 
Regards,

Sakari Ailus
