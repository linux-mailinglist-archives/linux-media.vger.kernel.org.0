Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2461E49FE26
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 17:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350173AbiA1QgQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 11:36:16 -0500
Received: from mga11.intel.com ([192.55.52.93]:16770 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350155AbiA1QgN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 11:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643387772; x=1674923772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fy6pVZkgbKK3IzeW+UBBUclkvFZCfXfZ+YPTEmzcj64=;
  b=e7bohn5KC56W1r8LQfrPrAb5T4QB3qruETVNzyaQWNbqp7b9FyiSRnmA
   SJ42xSWUGi94kS7DeRGQYy/j/tMlkVLFFFYYcQLGsRmguF0SjPvKUvkco
   nISFDbJmycNjlgJljZs1TKpmp/1ftm2Vt/PWFVQY31B4pxo+zoNJUFypn
   PS1XzcinH0bocAtRfTY5/oX9ucIGU/7UTti5kO+zE8Mb0kyT0FRFYOqtw
   lIoeFA8O139bgtsorKQGzfXRjbkmAgsgn5Yn7lBszJqidAzcc6PMdiy8R
   VieI6kDvsAmOCvAgVUv2nmnajMmqtjck8rnNTUf8mrSSpv49+he0cMlcy
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="244754307"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="244754307"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 08:36:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="675139282"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 08:36:01 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0E5BE202F2;
        Fri, 28 Jan 2022 18:35:59 +0200 (EET)
Date:   Fri, 28 Jan 2022 18:35:59 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 4/4] v4l: ioctl: Set bus_info in v4l_querycap()
Message-ID: <YfQbb94fKQG4ycDs@paasikivi.fi.intel.com>
References: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
 <20220128083309.213122-5-sakari.ailus@linux.intel.com>
 <YfQEoJIA9Tm5wRbF@pendragon.ideasonboard.com>
 <YfQUyEq8yGtBx9jB@paasikivi.fi.intel.com>
 <YfQaKV0OVe43ZZvD@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfQaKV0OVe43ZZvD@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 28, 2022 at 06:30:33PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Fri, Jan 28, 2022 at 06:07:36PM +0200, Sakari Ailus wrote:
> > On Fri, Jan 28, 2022 at 04:58:40PM +0200, Laurent Pinchart wrote:
> > > Hi Sakari,
> > > 
> > > Thank you for the patch.
> > 
> > And thanks for the review!
> > 
> > > On Fri, Jan 28, 2022 at 10:33:09AM +0200, Sakari Ailus wrote:
> > > > The bus_info field is set by most drivers based on the type of the device
> > > > bus as well as the name of the device. Do this in v4l_querycap() so
> > > > drivers don't need to. This keeps compatibility with non-default and silly
> > > > bus_info.
> > > 
> > > Do we have many PCI or platform drivers with non-default bus_info ?
> > 
> > Quite a few actually. Most have something static in bus_info and there are
> > also PCI Express devices that use "PCIe:" prefix. These are mostly old
> > drivers though. I've left them as-is.
> > 
> > New drivers shouldn't bother changing the default unless there's a good
> > reason to do that.
> 
> Let's make it very clear in the documentation then.

Right now there's no place for documenting this. Basically this is about
what IOCTL argument struct fields are set in the framework and which ones
the driver is responsible for. I don't think addressing that belongs to
this set.

-- 
Sakari Ailus
