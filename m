Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFFFC88B5
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 14:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbfJBMfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 08:35:20 -0400
Received: from mga11.intel.com ([192.55.52.93]:22111 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbfJBMfU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 08:35:20 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 05:35:19 -0700
X-IronPort-AV: E=Sophos;i="5.64,574,1559545200"; 
   d="scan'208";a="195993400"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 05:35:16 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 7657420976; Wed,  2 Oct 2019 15:35:13 +0300 (EEST)
Date:   Wed, 2 Oct 2019 15:35:13 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        hugues.fruchet@st.com
Subject: Re: [Patch 1/3] media: ov5640: add PIXEL_RATE control
Message-ID: <20191002123513.GI972@paasikivi.fi.intel.com>
References: <20190925152301.21645-1-bparrot@ti.com>
 <20190925152301.21645-2-bparrot@ti.com>
 <20191001075704.GA5449@paasikivi.fi.intel.com>
 <20191001162341.f2o7ruar2nifl5ws@ti.com>
 <20191002075951.afp2xligspqat4ew@uno.localdomain>
 <20191002121438.g3re6v54q4hit2wv@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002121438.g3re6v54q4hit2wv@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

On Wed, Oct 02, 2019 at 07:14:38AM -0500, Benoit Parrot wrote:
> Hi Jacopo,
> 
> Maybe, I miss spoke when I mentioned a helper I did not intent a framework
> level generic function. Just a function to help in this case :)
> 
> That being said, I re-read the thread you mentioned. And as Hughes pointed
> out dynamically generating a "working" link frequency value which can be
> used by a CSI2 receiver to properly configure its PHY is not trivial.
> 
> When I created this patch, I also had another to add V4L2_CID_LINK_FREQ
> support. I am testing this against the TI CAL CSI2 receiver, which already
> uses the V4L2_CID_PIXEL_RATE value for that purpose, so I also had a patch
> to add support for V4L2_CID_LINK_FREQ to that driver as well.
> 
> Unfortunately, similar to Hughes' findings I was not able to make it "work"
> with all supported resolution/framerate.
> 
> Unlike my V4L2_CID_PIXEL_RATE solution which now works in all mode with the
> same receiver.
> 
> So long story short I dropped the V4L2_CID_LINK_FREQ patch and focused on
> V4L2_CID_PIXEL_RATE instead.

It shouldn't make a difference which one you use; if you know the bus type
(and if it's CSI-2 with D-PHY, number of lanes and how many bits per pixel
the media bus format has), you can convert fairly trivially between the
two.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
