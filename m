Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFAB793D15
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 14:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbjIFMuw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 08:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjIFMuw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 08:50:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73278E43
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 05:50:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12A0FC67;
        Wed,  6 Sep 2023 14:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694004557;
        bh=xt3hTsvUOlKjP6rRPwrBraLfgdWiHe067GDKosV/IeI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PWPrtfcoL2DkkhmqfHCzYW9IfLi+gtW+a2vRWP0ZgGoRDhQPprDyqTjFGSt/2ZZnh
         baVOfOExZ4U4xYiCrm8k4Eqxm0Xfz6mq+MknHkfPr1YDDQnZzf6HT5Z8LGIL7r5Q0G
         iuzEHkcGTVCvqZavR9UkfC1u8SYfrSnxF93IN9P0=
Date:   Wed, 6 Sep 2023 15:50:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 01/10] media: Documentation: Align numbered list
Message-ID: <20230906125057.GH17308@pendragon.ideasonboard.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-2-sakari.ailus@linux.intel.com>
 <20230905130640.GF11700@pendragon.ideasonboard.com>
 <ZPh0ALJSBxcE4QP8@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZPh0ALJSBxcE4QP8@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 06, 2023 at 12:43:44PM +0000, Sakari Ailus wrote:
> On Tue, Sep 05, 2023 at 04:06:40PM +0300, Laurent Pinchart wrote:
> > On Tue, Aug 08, 2023 at 10:55:29AM +0300, Sakari Ailus wrote:
> > > Align lines for numbered list so that Sphinx produces an uniform output
> > > for all list entries.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../userspace-api/media/v4l/dev-subdev.rst    | 27 +++++++++----------
> > >  1 file changed, 13 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > index a4f1df7093e8..b023918177b5 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > @@ -579,20 +579,19 @@ is started.
> > >  
> > >  There are three steps in configuring the streams:
> > >  
> > > -1) Set up links. Connect the pads between sub-devices using the :ref:`Media
> > > -Controller API <media_controller>`
> > > +1) Set up links. Connect the pads between sub-devices using the
> > > +   :ref:`Media Controller API <media_controller>`
> > 
> > While at it, could we standardize on 1. vs. 1) ? Both are used in the
> > same file. After this patch they both render to "1.", but it would be
> > nice to be consistent in the source too.
> 
> I'll check the rest of the file. The number followed by a trailing dot is a
> numbered list in ReST, we should align with that.
> 
> > 
> > >  
> > > -2) Streams. Streams are declared and their routing is configured by
> > > -setting the routing table for the sub-device using
> > > -:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
> > > -setting the routing table will reset formats and selections in the
> > > -sub-device to default values.
> > > +2) Streams. Streams are declared and their routing is configured by setting the
> > > +   routing table for the sub-device using :ref:`VIDIOC_SUBDEV_S_ROUTING
> > > +   <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that setting the routing table will
> > > +   reset formats and selections in the sub-device to default values.
> > >  
> > > -3) Configure formats and selections. Formats and selections of each stream
> > > -are configured separately as documented for plain sub-devices in
> > > -:ref:`format-propagation`. The stream ID is set to the same stream ID
> > > -associated with either sink or source pads of routes configured using the
> > > -:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
> > > +3) Configure formats and selections. Formats and selections of each stream are
> > > +   configured separately as documented for plain sub-devices in
> > > +   :ref:`format-propagation`. The stream ID is set to the same stream ID
> > > +   associated with either sink or source pads of routes configured using the
> > > +   :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
> > >  
> > >  Multiplexed streams setup example
> > >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > @@ -619,8 +618,8 @@ modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
> > >  To configure this pipeline, the userspace must take the following steps:
> > >  
> > >  1) Set up media links between entities: connect the sensors to the bridge,
> > > -bridge to the receiver, and the receiver to the DMA engines. This step does
> > > -not differ from normal non-multiplexed media controller setup.
> > > +   bridge to the receiver, and the receiver to the DMA engines. This step does
> > > +   not differ from normal non-multiplexed media controller setup.
> > >  
> > >  2) Configure routing
> > >  
> > 
> > 3) below contains two paragraphs that are not indented.
> 
> From the documentation output this does not matter. Or was your comment
> about aligning the formatting in the source? (I prefer it as-is but no
> strong opinion about it either. Just slightly easier to edit that way. :-))

I like consistency, both in the source and the output :-)

-- 
Regards,

Laurent Pinchart
