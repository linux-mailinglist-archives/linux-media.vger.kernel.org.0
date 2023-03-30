Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF896CFE34
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 10:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbjC3I1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 04:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjC3I1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 04:27:53 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EDE19A6
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 01:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680164871; x=1711700871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ivYhZCbu4ph7UzkpH3wIgP5hhiGaPMDSo7jj++I7+H4=;
  b=Izd4WtVGTLOxiLzFgTjNltQeY0Wm4BXKNnx+9KgMXFafyiMl+s26rnvo
   gFwsCzujDzksmU6BlJS7f9C9UKtdDscJS5TLplk8NWL7Nf6IOEnbw3IAf
   vd9s75nk3sy5nsL+4QIaEiSeIkxlwGVd5LNBfr06XagsMqvYthmDxrsvz
   Zo1D/saxY0ezcqaU01cTYuzR9zRq6jDqKkLzPHPyaTzAjni0o8fTd8Oth
   5rZTpW9w9R9iaZxx7ChnO6JARPp1FMCS1HjoLa+jQEmomsq1GOf5fPuHE
   rYTg/wTUHNE9e1y6zvDw++avhD8hKyFbaPf11SkbmjXGtmbdTTIxxsLKu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="343555270"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="343555270"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 01:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="749099672"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="749099672"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 01:27:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 5DAD511FAD0;
        Thu, 30 Mar 2023 11:27:46 +0300 (EEST)
Date:   Thu, 30 Mar 2023 11:27:46 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Ye, Xiang" <xiang.ye@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v3 2/3] media: pci: intel: ivsc: Add ACE submodule
Message-ID: <ZCVIAg1h/LfrWMJY@kekkonen.localdomain>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <1679898188-14426-3-git-send-email-wentong.wu@intel.com>
 <ZCPw7wiHJX4nkpG3@kekkonen.localdomain>
 <MN2PR11MB4318F9FC62A33A86B9ED64FB8D8E9@MN2PR11MB4318.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN2PR11MB4318F9FC62A33A86B9ED64FB8D8E9@MN2PR11MB4318.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

On Thu, Mar 30, 2023 at 07:32:27AM +0000, Wu, Wentong wrote:
> Hi Sakari,
> 
> Thanks
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Wednesday, March 29, 2023 4:04 PM
> > 
> > Hi Wentong,
> > 
> > On Mon, Mar 27, 2023 at 02:23:07PM +0800, Wentong Wu wrote:
> > > ACE is a submodule of IVSC which controls camera sensor's ownership,
> > > belonging to host or IVSC. When IVSC owns camera sensor, it is for
> > > algorithm computing. When host wants to control camera sensor, ACE
> > > module needs to be informed of ownership with defined interface.
> > >
> > > The interface is via MEI. There is a separate MEI UUID, which this
> > > driver uses to enumerate.
> > >
> > > To switch ownership of camera sensor between IVSC and host, the caller
> > > specifies the defined ownership information which will be sent to
> > > firmware by sending MEI command.
> > >
> > > Device link(device_link_add) is used to set the right camera sensor
> > > ownership before accessing the sensor via I²C. With DL_FLAG_PM_RUNTIME
> > > and DL_FLAG_RPM_ACTIVE, the supplier device will be PM runtime resumed
> > > before the consumer(camera sensor).
> > > So use runtime PM callbacks to transfer the ownership between host and
> > > IVSC.
> > >
> > > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > > ---
> > >  drivers/media/pci/intel/ivsc/Makefile  |   3 +
> > >  drivers/media/pci/intel/ivsc/mei_ace.c | 534
> > > +++++++++++++++++++++++++++++++++
> > >  2 files changed, 537 insertions(+)
> > >  create mode 100644 drivers/media/pci/intel/ivsc/mei_ace.c
> > >
> > > diff --git a/drivers/media/pci/intel/ivsc/Makefile
> > > b/drivers/media/pci/intel/ivsc/Makefile
> > > index 7e4c5f0..a641f14 100644
> > > --- a/drivers/media/pci/intel/ivsc/Makefile
> > > +++ b/drivers/media/pci/intel/ivsc/Makefile
> > > @@ -5,3 +5,6 @@
> > >  obj-$(CONFIG_INTEL_VSC) += ivsc-csi.o  ivsc-csi-y += mei_csi.o
> > > ivsc-csi-y += csi_bridge.o
> > > +
> > > +obj-$(CONFIG_INTEL_VSC) += ivsc-ace.o ivsc-ace-y += mei_ace.o
> > > diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c
> > > b/drivers/media/pci/intel/ivsc/mei_ace.c
> > > new file mode 100644
> > > index 0000000..434b072
> > > --- /dev/null
> > > +++ b/drivers/media/pci/intel/ivsc/mei_ace.c
> > > @@ -0,0 +1,534 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2023 Intel Corporation. All rights reserved.
> > > + * Intel Visual Sensing Controller ACE Linux driver  */
> > > +
> > > +/*
> > > + * To set ownership of camera sensor, there is specific command,
> > > +which
> > > + * is sent via MEI protocol. That's a two-step scheme where the
> > > +firmware
> > > + * first acks receipt of the command and later responses the command
> > > +was
> > > + * executed. The command sending function uses "completion" as the
> > > + * synchronization mechanism. The notification for command is
> > > +received
> > > + * via a mei callback which wakes up the caller. There can be only
> > > +one
> > > + * outstanding command at a time.
> > 
> > Could you document the dependencies in the sensor initialisation (ace +
> > csi) 
> 
> This is about ownership instead of dependency, if host sensor driver configure
> sensor with ownership on IVSC, probably it will be changed by firmware somehow.
> 
> > and how the sensor is powered (i.e. no direct control of the PMIC from the
> > host?)? 
> 
> The power line is directly connected to IVSC instead of host, when ownership
> switched to host, sensor is already powered up by firmware. 

Good. Please also document this in the comment.

-- 
Kind regards,

Sakari Ailus
