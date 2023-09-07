Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 231C4797B46
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 20:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239762AbjIGSLy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 14:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237977AbjIGSLx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 14:11:53 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5476F10CA
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 11:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694110289; x=1725646289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pqmhLkCPQV1XfA/CF4Yq2EehojQ2cj1SHXjPRTQSHZs=;
  b=g4xN+PDwPcxK/iXwtKUHaM/u+6cuCjxBI43t5tLj56KWW0HI3RhvBhJ1
   4kiGNEQUuq0voGsRMYLWs2JCk5TIeILq5wTxYnzWwzs+NlY9LUpHxjDp5
   fL/avIGNe8vIZWQwllWVjTkZcN5i7Bt1NuzKrfGzhPp7Szt57/5Sbr1ag
   NT2u7mcPhNbfdN6EAuKjdsmU+ffxf/DJt+309dgcqBxca85Y6LSIEiboS
   pmsJ4Q/VS1H6JWJVCaSV23VYsu9/RC03YjxWO33hb887sRfmofJ6Oq9fQ
   myrKpLt120sVnv97kT7Qgk4jbyvee/CxEYxCkam2ZuOQhJitLaUsKXZOG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="374713112"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="374713112"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 03:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741981347"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="741981347"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 03:58:05 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id DEEBB11F9DF;
        Thu,  7 Sep 2023 13:58:02 +0300 (EEST)
Date:   Thu, 7 Sep 2023 10:58:02 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 01/10] media: Documentation: Align numbered list
Message-ID: <ZPmsuiWm1iruuw0M@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-2-sakari.ailus@linux.intel.com>
 <20230905130640.GF11700@pendragon.ideasonboard.com>
 <ZPh0ALJSBxcE4QP8@kekkonen.localdomain>
 <20230906125057.GH17308@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906125057.GH17308@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 06, 2023 at 03:50:57PM +0300, Laurent Pinchart wrote:
> On Wed, Sep 06, 2023 at 12:43:44PM +0000, Sakari Ailus wrote:
> > > > -2) Streams. Streams are declared and their routing is configured by
> > > > -setting the routing table for the sub-device using
> > > > -:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
> > > > -setting the routing table will reset formats and selections in the
> > > > -sub-device to default values.
> > > > +2) Streams. Streams are declared and their routing is configured by setting the
> > > > +   routing table for the sub-device using :ref:`VIDIOC_SUBDEV_S_ROUTING
> > > > +   <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that setting the routing table will
> > > > +   reset formats and selections in the sub-device to default values.
> > > >  
> > > > -3) Configure formats and selections. Formats and selections of each stream
> > > > -are configured separately as documented for plain sub-devices in
> > > > -:ref:`format-propagation`. The stream ID is set to the same stream ID
> > > > -associated with either sink or source pads of routes configured using the
> > > > -:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
> > > > +3) Configure formats and selections. Formats and selections of each stream are
> > > > +   configured separately as documented for plain sub-devices in
> > > > +   :ref:`format-propagation`. The stream ID is set to the same stream ID
> > > > +   associated with either sink or source pads of routes configured using the
> > > > +   :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
> > > >  
> > > >  Multiplexed streams setup example
> > > >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > @@ -619,8 +618,8 @@ modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
> > > >  To configure this pipeline, the userspace must take the following steps:
> > > >  
> > > >  1) Set up media links between entities: connect the sensors to the bridge,
> > > > -bridge to the receiver, and the receiver to the DMA engines. This step does
> > > > -not differ from normal non-multiplexed media controller setup.
> > > > +   bridge to the receiver, and the receiver to the DMA engines. This step does
> > > > +   not differ from normal non-multiplexed media controller setup.
> > > >  
> > > >  2) Configure routing
> > > >  
> > > 
> > > 3) below contains two paragraphs that are not indented.
> > 
> > From the documentation output this does not matter. Or was your comment
> > about aligning the formatting in the source? (I prefer it as-is but no
> > strong opinion about it either. Just slightly easier to edit that way. :-))
> 
> I like consistency, both in the source and the output :-)

This doesn't seem to be possible in all cases --- Sphinx thinks the
paragraph is part of the preceding table if it's indented.

-- 
Sakari Ailus
