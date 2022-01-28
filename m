Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7155649FE98
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 18:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350406AbiA1RCi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 12:02:38 -0500
Received: from mga03.intel.com ([134.134.136.65]:46953 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350396AbiA1RCi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 12:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643389358; x=1674925358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GYoFI9P8ZZZ1SAE7QhIHccNEewDDCpIE4xkkoSvxBqU=;
  b=jwIED/dN/gmHqIP3MV3n9kH7pNBBTmEJqsw3r82Yaoiwpy+ERkYuAqmY
   9bbhVPx0TPDffQ9QSa5yGxtdSoPlWDkueDWqPB+03K3Xk36RiQh/3LIVE
   EOJ4FFVPwc5MKMo5+RMiZ14MXmHkrBLNUfHAvT6PkqBmbotRz1McK0Pmq
   D1XbreZ0Thi45xvzwu9c/fLbx12MXRMgHBAxywjQbcV0zRjVPvJI+b+dm
   51e1qWPHE1zKFDUfJuXdtZpb8HEFK+FRhc5DfUg5TuNZTX7ntdbkqMWFY
   9qOFJp0Ueba0fSpua1FMlUrjI3fOMlpIW34W9D5EO1oXE/G/dGaWl4xpp
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="247106790"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="247106790"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 09:01:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="697148744"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 09:01:01 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 970A6202F2;
        Fri, 28 Jan 2022 19:00:59 +0200 (EET)
Date:   Fri, 28 Jan 2022 19:00:59 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 4/4] v4l: ioctl: Set bus_info in v4l_querycap()
Message-ID: <YfQhS3Eik/6lgYqM@paasikivi.fi.intel.com>
References: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
 <20220128083309.213122-5-sakari.ailus@linux.intel.com>
 <YfQEoJIA9Tm5wRbF@pendragon.ideasonboard.com>
 <YfQUyEq8yGtBx9jB@paasikivi.fi.intel.com>
 <YfQaKV0OVe43ZZvD@pendragon.ideasonboard.com>
 <YfQbb94fKQG4ycDs@paasikivi.fi.intel.com>
 <YfQdaAQgWTRTtNgq@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfQdaAQgWTRTtNgq@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 28, 2022 at 06:44:24PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Fri, Jan 28, 2022 at 06:35:59PM +0200, Sakari Ailus wrote:
> > On Fri, Jan 28, 2022 at 06:30:33PM +0200, Laurent Pinchart wrote:
> > > On Fri, Jan 28, 2022 at 06:07:36PM +0200, Sakari Ailus wrote:
> > > > On Fri, Jan 28, 2022 at 04:58:40PM +0200, Laurent Pinchart wrote:
> > > > > Hi Sakari,
> > > > > 
> > > > > Thank you for the patch.
> > > > 
> > > > And thanks for the review!
> > > > 
> > > > > On Fri, Jan 28, 2022 at 10:33:09AM +0200, Sakari Ailus wrote:
> > > > > > The bus_info field is set by most drivers based on the type of the device
> > > > > > bus as well as the name of the device. Do this in v4l_querycap() so
> > > > > > drivers don't need to. This keeps compatibility with non-default and silly
> > > > > > bus_info.
> > > > > 
> > > > > Do we have many PCI or platform drivers with non-default bus_info ?
> > > > 
> > > > Quite a few actually. Most have something static in bus_info and there are
> > > > also PCI Express devices that use "PCIe:" prefix. These are mostly old
> > > > drivers though. I've left them as-is.
> > > > 
> > > > New drivers shouldn't bother changing the default unless there's a good
> > > > reason to do that.
> > > 
> > > Let's make it very clear in the documentation then.
> > 
> > Right now there's no place for documenting this. Basically this is about
> > what IOCTL argument struct fields are set in the framework and which ones
> > the driver is responsible for. I don't think addressing that belongs to
> > this set.
> 
> As this sets tries to fix the mess caused by drivers using semi-random
> bus_info, I'd like to disagree :-) It can be done in a patch on top.

Well I think starting to document where the responsibility of filling IOCTL
argument structs fields is definitely does not belong here.

Maybe Hans has an opinion? :-)

-- 
Sakari Ailus
