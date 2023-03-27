Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 873F86C9C11
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbjC0HdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 03:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbjC0HdE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:33:04 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B4940E1
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 00:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679902381; x=1711438381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SuUaywihEeQuyMhUDMPzy28xKJwh3EANuSVgTsxOo6s=;
  b=a450T2V31+d3omuCalXhoTAS30C4T1vJidfVvJLKp6mfxUkegs4+IngD
   sETkDcr7tpDPho66yV8LKRc21F/UdbJXK+Bbuk9gu8gnJdyWLRmbjGAaO
   6kPESnYiWWS8owdDItHKcoKiUsAa6ngHVeQU48h5jioYs23vcQ9HGBVtL
   gBsIkLHUcf9RiFvaNFj9SGiEs/oAuJ3JBQ0pHt4DFCnP9P2r/+F+ecz2y
   C5eROH0p1MJ3Kq675IydbR6VJR0g6+0TXF/ykZ65efiu+navmuKfYLZK/
   9HTINCEngdIfHDQw5jG3Gt4KzZjNGBvGHRN6GsL8hQhZ/bMxKP5hdBQIP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="337702887"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="337702887"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 00:33:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="715982847"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="715982847"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 00:32:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 640CF1218A3;
        Mon, 27 Mar 2023 10:32:55 +0300 (EEST)
Date:   Mon, 27 Mar 2023 10:32:55 +0300
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
Subject: Re: [PATCH v3 3/3] ACPI: delay enumeration of devices with a _DEP
 pointing to INTC1059 device
Message-ID: <ZCFGp3BMRUKlmqoD@kekkonen.localdomain>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <1679898188-14426-4-git-send-email-wentong.wu@intel.com>
 <ZCFAjoaIG2VxtLJr@kekkonen.localdomain>
 <MN2PR11MB43180EF14AEB08D0969AE8378D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR11MB43180EF14AEB08D0969AE8378D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

On Mon, Mar 27, 2023 at 07:17:13AM +0000, Wu, Wentong wrote:
> 
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Hi Wentong,
> > 
> > On Mon, Mar 27, 2023 at 02:23:08PM +0800, Wentong Wu wrote:
> > > Inside IVSC, switching ownership requires an interface with two
> > > different hardware modules, ACE and CSI. The software interface to
> > > these modules is based on Intel MEI framework. Usually mei client
> > > devices are dynamically created, so the info of consumers depending on
> > > mei client devices is not present in the firmware tables.
> > 
> > Ouch.
> 
> MEI client devices are not ACPI devices in our case.
> 
> > 
> > >
> > > This causes problems with the probe ordering with respect to drivers
> > > for consumers of these mei client devices. But on these camera sensor
> > > devices, the ACPI nodes describing the sensors all have a _DEP
> > > dependency on the matching INTC1059 ACPI device, so adding INTC1059 to
> > > acpi_honor_dep_ids allows solving the probe-ordering problem by
> > > delaying the enumeration of ACPI-devices which have a _DEP dependency on
> > an INTC1059 device.
> > 
> > What does the INTC1059 device represent?
> 
> This is the IVSC device on which camera sensor has _DEP 
> 
>             Device (CVFD)
>             {
>                 Name (_HID, "INTC1059")  // _HID: Hardware ID
>                 Name (_DDN, "Intel CVF Device")  // _DDN: DOS Device Name
>                 Method (SID, 1, Serialized)
>                 {
>                     Return (HCID (One))
>                 }
>             }

Should this be interpreted that if you have a _DEP to this device, then the
IVSC is between the sensor and the IPU?

-- 
Kind regards,

Sakari Ailus
