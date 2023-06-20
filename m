Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41E757368F9
	for <lists+linux-media@lfdr.de>; Tue, 20 Jun 2023 12:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbjFTKPP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jun 2023 06:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbjFTKPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jun 2023 06:15:05 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79ACA10A
        for <linux-media@vger.kernel.org>; Tue, 20 Jun 2023 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687256104; x=1718792104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J7M/20ja5COe+S9mhNqj9SHs+jbX3eCC9vzW63AEHyM=;
  b=IPPcrcWqnvuGKznLE+4/tthbfIJEWAt8WIMo9mkLkQ0u5jEl8ITxkaE2
   DvkCwhzYknPHHDk7kzaIuw1o3U5tusTwsC08x5MBkbLQD0+Es0NfBfkUq
   Vjr3aWtLqYOQIXUxfPT7eorwWOfZ/zvi/DYaiq+zNDRA9UCjRKU4lKKtN
   gKODQ4CTY1HP4EVKsFNQvez7KBR+I9HQQdHXLVZLztNtrwiapD4uPX8JZ
   rQVpcv2pMg2wsLvtimFgVDf/IPiAKxj4FXHzWismYruZl5QrQPtsY0mz+
   XQ7zuXoqBORi1Q0wFhj8Ud7ElfV/t8kii+4ovEGuNBjM5WDpyErKGh2iM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="358691323"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="358691323"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 03:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="664231430"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="664231430"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 03:14:56 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 4764E11FC35;
        Tue, 20 Jun 2023 13:14:53 +0300 (EEST)
Date:   Tue, 20 Jun 2023 10:14:53 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 32/32] media: Documentation: v4l: Document
 sub-device notifiers
Message-ID: <ZJF8HWPWFxqHhfYg@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-33-sakari.ailus@linux.intel.com>
 <20230530061820.GB6404@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530061820.GB6404@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, May 30, 2023 at 09:18:20AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:16:15PM +0300, Sakari Ailus wrote:
> > Document that sub-device notifiers are now registered using
> > v4l2_async_subdev_nf_init(). No documentation is changed as it seems that
> > sub-device notifiers were not documented apart from kernel-doc comments.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/driver-api/media/v4l2-subdev.rst | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > index 83d3d29608136..d62b341642c96 100644
> > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > @@ -193,9 +193,7 @@ picked up by bridge drivers.
> >  Bridge drivers in turn have to register a notifier object. This is
> >  performed using the :c:func:`v4l2_async_nf_register` call. To
> >  unregister the notifier the driver has to call
> > -:c:func:`v4l2_async_nf_unregister`. The former of the two functions
> > -takes two arguments: a pointer to struct :c:type:`v4l2_device` and a
> > -pointer to struct :c:type:`v4l2_async_notifier`.
> > +:c:func:`v4l2_async_nf_unregister`.
> >  
> >  Before registering the notifier, bridge drivers must do two things: first, the
> >  notifier must be initialized using the :c:func:`v4l2_async_nf_init`.
> > @@ -204,6 +202,12 @@ that the bridge device needs for its operation. Several functions are available
> >  to add subdevice descriptors to a notifier, depending on the type of device and
> >  the needs of the driver.
> >  
> > +For a sub-device driver to register a notifier, the process is otherwise similar
> > +to that of a bridge driver, apart from that the notifier is initialised using
> > +:c:func:`v4l2_async_subdev_nf_init` instead. A sub-device notifier may complete
> > +only after the V4L2 device becomes available, i.e. there's a path via async
> > +sub-devices and notifiers to that root notifier.
> 
> This is correct, but I doubt anyone who doesn't have an in-depth
> knowledge of the v4l2-async framework will be able to understand it. For
> instance, the concept of "root notifier" isn't explained anywhere. And
> the v4l2_async_subdev_nf_register() function isn't mentioned.

That's because the function no longer exists. :-)

> 
> The v4l2-async documentation needs a rewrite.

It would benefit from improvements, yes. I can add patches for this if you
prefer.

> 
> > +
> >  :c:func:`v4l2_async_nf_add_fwnode`, :c:func:`v4l2_async_nf_add_fwnode_remote`
> >  :c:and func:`v4l2_async_nf_add_i2c` are for registering their async sub-devices
> >  :c:with the notifier.
> 

-- 
Regards,

Sakari Ailus
