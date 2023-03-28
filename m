Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E52F6CCAEE
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 21:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjC1TtC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 15:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjC1TtB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 15:49:01 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532D01996
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 12:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680032940; x=1711568940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qIu6p69T5udUNYsfJospEfuU8VKNZUrQzOfJb5s3IHs=;
  b=G/lhKslgzWkFic2VIBGrViBm00s2TMOQhE0qD3aHlLYJuzPXJR0itSKL
   kuuvJjKJzJvBeqP0xmGFvwX3Z+dNJ3DUvmfUnM66HP9FlkfYNsZUcQW8j
   dcpqzh5jzMNbk6BCxHFm3dOKwU84W2V/zIQYbcAOHpQKka23DFOdW0of1
   GhSPKSKKQpnKsfvlQsFflo7UJeQLuahggMj4SXFuVs908wSaJIPSFGSJm
   32q1KwcBSbkWWI9/qnK/heCsHWOcsHHO5CeO17/mqZEy7Pei5nz/L4/qi
   XVN0GQCh6r7HzfaI4Lna9NnpK+OCqgXy2MZ5WAfSSJsackLw/dRyVBvzC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="426947724"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="426947724"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 12:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="827608805"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="827608805"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 12:48:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1489B11F937;
        Tue, 28 Mar 2023 22:48:55 +0300 (EEST)
Date:   Tue, 28 Mar 2023 22:48:55 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Ye, Xiang" <xiang.ye@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v3 0/3] media: pci: intel: ivsc: Add driver of Intel
 Visual Sensing Controller(IVSC)
Message-ID: <ZCNEp6NmeDElNMRs@kekkonen.localdomain>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <ZCFD3aW4NRrn69LR@kekkonen.localdomain>
 <MN2PR11MB43184340CB813FFCE47AA68B8D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
 <ZCFKmNKZAPwsIq/j@kekkonen.localdomain>
 <MN2PR11MB431892069628328E614F03498D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
 <ZCFjqu4P9AcNbMoZ@kekkonen.localdomain>
 <DM6PR11MB4316138CF6D8D300C007B4DE8D889@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4316138CF6D8D300C007B4DE8D889@DM6PR11MB4316.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 28, 2023 at 07:32:27AM +0000, Wu, Wentong wrote:
> 
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Monday, March 27, 2023 5:37 PM
> > 
> > Hi Wentong,
> > 
> > On Mon, Mar 27, 2023 at 08:13:29AM +0000, Wu, Wentong wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Sent: Monday, March 27, 2023 3:50 PM
> > > >
> > > > Hi Wentong,
> > > >
> > > > On Mon, Mar 27, 2023 at 07:33:48AM +0000, Wu, Wentong wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > Sent: Monday, March 27, 2023 3:21 PM
> > > > > >
> > > > > > Hi Wentong,
> > > > > >
> > > > > > On Mon, Mar 27, 2023 at 02:23:05PM +0800, Wentong Wu wrote:
> > > > > > > Intel Visual Sensing Controller (IVSC), codenamed "Clover
> > > > > > > Falls", is a companion chip designed to provide secure and low
> > > > > > > power vision capability to IA platforms. IVSC is available in
> > > > > > > existing commercial platforms from multiple OEMs.
> > > > > > >
> > > > > > > The primary use case of IVSC is to bring in context awareness.
> > > > > > > IVSC interfaces directly with the platform main camera sensor
> > > > > > > via a CSI-2 link and processes the image data with the
> > > > > > > embedded AI engine. The detected events are sent over I2C to
> > > > > > > ISH (Intel Sensor
> > > > > > > Hub) for additional data fusion from multiple sensors. The
> > > > > > > fusion results are used to implement advanced use cases like:
> > > > > > >  - Face detection to unlock screen
> > > > > > >  - Detect user presence to manage backlight setting or waking
> > > > > > > up system
> > > > > > >
> > > > > > > Since the Image Processing Unit(IPU) used on the host
> > > > > > > processor needs to configure the CSI-2 link in normal camera
> > > > > > > usages, the
> > > > > > > CSI-2 link and camera sensor can only be used in
> > > > > > > mutually-exclusive ways by host IPU and IVSC. By default the
> > > > > > > IVSC owns the CSI-2 link and camera sensor. The IPU driver can
> > > > > > > take ownership of the CSI-2 link and camera sensor using
> > > > > > > interfaces exported
> > > > via v4l2 sub-device.
> > > > > > >
> > > > > > > Switching ownership requires an interface with two different
> > > > > > > hardware modules inside IVSC. The software interface to these
> > > > > > > modules is via Intel MEI (The Intel Management Engine) commands.
> > > > > > > These two hardware modules have two different MEI UUIDs to
> > > > > > > enumerate. These hardware
> > > > > > modules are:
> > > > > > >  - ACE (Algorithm Context Engine): This module is for
> > > > > > > algorithm computing when IVSC owns camera sensor. Also ACE
> > > > > > > module controls camera sensor's ownership. This hardware
> > > > > > > module is used to set ownership of
> > > > > > camera sensor.
> > > > > > >  - CSI (Camera Serial Interface): This module is used to route
> > > > > > > camera sensor data either to IVSC or to host for IPU driver and
> > application.
> > > > > > >
> > > > > > > IVSC also provides a privacy mode. When privacy mode is turned
> > > > > > > on, camera sensor can't be used. This means that both ACE and
> > > > > > > host IPU can't get image data. And when this mode is turned
> > > > > > > on, users are informed via
> > > > > > > v4l2 control API.
> > > > > > >
> > > > > > > In summary, to acquire ownership of camera by IPU driver,
> > > > > > > first ACE module needs to be informed of ownership and then to
> > > > > > > setup MIPI CSI-2 link for the camera sensor and IPU.
> > > > > > >
> > > > > > > Implementation:
> > > > > > > There are two different drivers to handle ACE and CSI hardware
> > > > > > > modules inside IVSC.
> > > > > > >  - ivsc_csi: MEI client driver to send commands and receive
> > > > > > > notifications from CSI module.
> > > > > > >  - ivsc_ace: MEI client driver to send commands and get status
> > > > > > > from ACE module.
> > > > > > > Interface is exposed via v4l2 sub-devcie APIs to acquire and
> > > > > > > release camera sensor and CSI-2 link.
> > > > > >
> > > > > > Thanks for the update.
> > > > > >
> > > > > > Could you elaborate the decision of keeping the csi_bridge
> > > > > > entirely separate from the cio2_bridge (to be turned to ipu_bridge first)?
> > > > > > Both are doing essentially the same and using the same data
> > > > > > structures,
> > > > aren't they?
> > > > >
> > > > > yes, they're doing same thing to bridge the software nodes needed
> > > > > by v4l2, but they have different type devices(pci and mei_client
> > > > > device) and dependency. And they have same SSDB definition in
> > > > > DSDT, so the structures are almost same.
> > > >
> > > > If there are differences, what are they?
> > > >
> > > The properties of swnode are same, because we need same info to
> > > configure CSI2. But csi bridge can get sensor connected to IVSC by
> > > dependency info instead of just polling the only supported sensors for
> > > ipu. Also IVSC
> > 
> > It's totally fine the method for finding the sensor is different, this should be an
> > extra argument for the bridge init function and a small number of lines of
> > additional code.
> > 
> > > doesn't need vcm. And the topology of dependency is different.
> > 
> > The VCM is optional for current cio2_bridge, too.
> > 
> > It also seems that this currently creates swnodes on mei csi side only for the
> > connection towards the sensor, not the IPU.
> 
> IPU could find the MEI CSI software node by software_node_find_by_name,
> and then setup the bridge between MEI CSI and IPU.
> 
> > At the moment you can't reliably
> > add software nodes to a device that has may be already probing so both of
> > these should be created at the same time.
> 
> If you're worried about sequence, IPU driver could make software node and
> register it, MEI CSI bridge could find IPU software node by software_node_find_by_name,
> if the return value is NULL, driver will defer the probe.

The IPU driver would also need to figure out whether a given sensor should
be behind the IVSC. I imagine it'll be hard to achieve this reasonably
neatly if you split the implementation into different parts --- both of
which need the same information from the same place (and in neither case
it's under the same device than to which the driver is bound).

> 
> > 
> > >
> > > > What comes to cio2_bridge, the fact that it's related to a PCI
> > > > device doesn't seem to matter after initialisation so it could as well work
> > with struct device.
> > > >
> > > > >
> > > > > I have no idea what the ipu bridge would be like, but IVSC csi
> > > > > bridge can be configured via kconfig to enable/disable.
> > > >
> > > > Please work out the details with Bingbu.
> > >
> > > @bingbu.cao@linux.intel.com @Sakari Ailus Please share your design idea
> > here.
> > > What the ipu bridge would be like?  What's the responsibility of ipu bridge?
> > 
> > I'd expect Bingbu to have patches to turn the current cio2_bridge to an
> > ipu_bridge at some point. These should come on top of those patches.
> 
> When will this be ready if you already make the plan? But could you please help
> review my other patches except bridge?

Please configure your e-mail client to wrap your lines at most at 74
characters or so.

I think it's binding this all together that is the concern, the individual
drivers much less so.

-- 
Regards,

Sakari Ailus
