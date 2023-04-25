Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7A76EE111
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 13:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233936AbjDYLah (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 07:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233903AbjDYLag (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 07:30:36 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4DC3C15
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682422235; x=1713958235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=214pIIsWl80owSPIKrQBtwRUJHUwPyVnBUN1uYek/Qc=;
  b=HfQkoTOpFXFoYQ5BI9aK8uAcOlVxbpbtgR4qVN26YxBJH3ArSgffsJqb
   UcD2iZLKpQ2fL8Vi79gzn+6y/qR0uI5M02WGau5WCBYSqZ144LzmXeLI3
   q7Go84U+LwHVeDX+QZDp3rSNqPVwneJMw/j5FnK9BmdZl0x+EO2JdcMOl
   24YoqFPz0LdzQqnysbSiTHE4nF29Q1LitSJ9q7sjroj414B/TrIMZuNEF
   qwwrxW5O4SdSMqZHLw+kLtQnWfXKhS7XZXItrdApSqtJtlynhdFfwDmvu
   2+aemCnZWkaNsAcvne8pwZadTEXfjahua2QUIEGk9KquLBB+dCMqHTl7Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330950511"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="330950511"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 04:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="696154782"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="696154782"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 04:30:30 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id D3E3811FAD0;
        Tue, 25 Apr 2023 14:30:27 +0300 (EEST)
Date:   Tue, 25 Apr 2023 14:30:27 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com, daniel.h.kang@intel.com
Subject: Re: [RFC PATCH 13/14] Documentation: add Intel IPU6 ISYS driver
 admin-guide doc
Message-ID: <ZEe505AggPlLI+lQ@kekkonen.localdomain>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
 <20230413100429.919622-14-bingbu.cao@intel.com>
 <20230420144917.GD17497@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420144917.GD17497@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Apr 20, 2023 at 05:49:17PM +0300, Laurent Pinchart wrote:

...

> > +common driver which does PCI configuration, firmware loading and parsing,
> > +firmware authentication, DMA mapping and IPU-MMU (internal Memory mapping Unit)
> > +configuration. intel_ipu6_isys implements V4L2, Media Controller and V4L2
> > +sub-device interfaces. The IPU6 ISYS driver supports camera sensors connected
> > +to the IPU6 ISYS through V4L2 sub-device sensor drivers.
> 
> Will the intel_ipu6 driver also serve a future intel_ipu6_psys driver,
> or is it specific to the ISYS ?

intel-ipu6 contains common parts required by both ISYS and PSYS drivers.

> 
> > +
> > +Input system driver
> > +===================
> > +
> > +Input System driver mainly configure CSI2 DPHY, construct the firmware stream
> 
> s/^Input/The Input/
> s/configure/configures the/
> s/construct/constructs/
> 
> > +configuration and send commands to firmware and get response from hardware and
> 
> s/send/sends/
> s/get response/gets responses/
> 
> > +firmware and then return buffers to user.
> 
> s/return/returns/
> 
> So control of the ISYS goes through the firmware, the driver doesn't
> access the hardware directly ?

Must of the low-level hardware control takes place through firmware, the
ISYS driver uses direct register access mainly for the communication with
the ISYS firmware and PHY configuration.

> 
> > +The ISYS is represented as several V4L2 sub-devices - 'Intel IPU6 CSI2 $port',
> > +which provide V4L2 subdev interfaces to the user space, there are also several
> > +video nodes for each CSI-2 stream capture - 'Intel IPU6 ISYS capture $num' which
> > +provide interface to user to set formats, queue buffers and streaming.
> > +
> > +.. kernel-figure::  ipu6_isys_graph.svg
> > +   :alt: ipu6 isys media graph
> 
> I see in the figure 6 CSI-2 receivers and 4 video nodes. Are those CSI-2
> receivers independent of each other, or do they share SoCs pins ? For
> instance, I'm thinking about a use case where you would have 4 data
> lanes and 2 clock lanes, and support capturing from 2x 2-lanes sensors
> with 2 CSI-2 RX, or 1x 4-lanes sensor with 1 CSI-2 RX. More generally,
> can you document the input options of the ISYS ? For DT-based systems
> I'd expect this information to be in the DT bindings, here it needs to
> be documented separately.

This is a to-do item (as noted on the cover page).

The number of video nodes is also going to change with streams support.

> 
> On the video device node side, are there 4 independent hardware DMA
> engines that can be dynamically connected to the different CSI-2
> receivers, or is that what the current firmware version provide, with
> the hardware able to capture more than 4 streams with firmware
> modifications ?
> 
> > +
> > +Capturing frames by IPU6 ISYS
> > +------------------------------------
> > +
> > +IPU6 ISYS is used to capture frames from the camera sensors connected to the
> > +CSI2 port. The supported input formats of ISYS are listed in table below:
> 
> s/port/ports/
> 
> > +
> > +.. tabularcolumns:: |p{0.8cm}|p{4.0cm}|p{4.0cm}|
> > +
> > +.. flat-table::
> > +    :header-rows: 1
> > +
> > +    * - IPU6 ISYS supported input formats
> > +
> > +    * - RGB565, RGB888
> > +
> > +    * - UYVY8, YUYV8
> 
> Unless I'm mistaken, CSI-2 doesn't have separate UYVY and YUYV formats.
> Am I missing something ?
> 
> > +
> > +    * - RAW8, RAW10, RAW12
> 
> Is embedded data capture supported ? More generically, can we capture
> different data types and/or virtual channels from the same CSI-2 input ?

Yes but not quite yet (streams support is pending).

> 
> What's the maximum resolution supported by the ISYS ? Are the DMA
> engines independent, or would the maximum resolution be different if you
> capture from a single camera sensor or multiple camera sensors at the
> same time ?

My understanding is they're independent, i.e. the maximum resolution isn't
affected by what else is happening in the device.

-- 
Regards,

Sakari Ailus
