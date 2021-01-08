Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841942EF075
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 11:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbhAHKLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 05:11:24 -0500
Received: from mga06.intel.com ([134.134.136.31]:16399 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbhAHKLY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 05:11:24 -0500
IronPort-SDR: AJFfs2w9QBbKqwAU3svq90zASJD61pAXSzAEfwkejSmvv1xH39RTuqS7ZjbwNeceV0LrZT6jhf
 tYQEoxOCKiGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="239125622"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="239125622"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 02:09:38 -0800
IronPort-SDR: yWctD8157T9vgUXdARnHZ0HvK9KkWUb7T6cwttWmDtoai9PE4OS2vHsHfARm2MhZPTb1WIBvoC
 ArMJMAVSw1hA==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="398943111"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 02:09:37 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2507D2067A; Fri,  8 Jan 2021 12:09:35 +0200 (EET)
Date:   Fri, 8 Jan 2021 12:09:35 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Maxime Ripard <mripard@kernel.org>,
        Yong Deng <yong.deng@magewell.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/1] v4l: fwnode:
 v4l2_async_notifier_parse_fwnode_endpoints is deprecated
Message-ID: <20210108100935.GX11878@paasikivi.fi.intel.com>
References: <20201214213348.19675-1-sakari.ailus@linux.intel.com>
 <CAAEAJfADNg_RKuWfREAPbtpB86ZQsNKa5rc83sjB9BZViPhtHg@mail.gmail.com>
 <20210107220723.GV11878@paasikivi.fi.intel.com>
 <X/gspYsUCNm+wcpS@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/gspYsUCNm+wcpS@aptenodytes>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Fri, Jan 08, 2021 at 10:57:57AM +0100, Paul Kocialkowski wrote:
> Hi,
> 
> On Fri 08 Jan 21, 00:07, Sakari Ailus wrote:
> > Hi Ezequiel,
> > 
> > On Thu, Jan 07, 2021 at 04:31:58PM -0300, Ezequiel Garcia wrote:
> > > Hi Sakari,
> > > 
> > > On Mon, 14 Dec 2020 at 18:45, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Document that v4l2_async_notifier_parse_fwnode_endpoints() is deprecated.
> > > > Its functionality has been replaced by other, better functions. Also add a
> > > > reference to an example if someone ends up wandering here.
> > > >
> > > 
> > > I'm working on a series to clean up the v4l2_async API a bit,
> > > and came across this patch.
> > > 
> > > As far as I can see, the only user of v4l2_async_notifier_parse_fwnode_endpoints
> > > is drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c.
> > 
> > It may be that's the only one left. The intent was also to avoid anyone
> > proposing new ones.
> > 
> > > Adding Maxime and Yong Deng, it would be great to get rid of this,
> > > so we can remove the API, which would also allow us to remove
> > > some other internal functions and therefore make the API a bit cleaner.
> > 
> > Yes, that'd be very nice. Then we could remove it altogether.
> 
> I've been touching that area a bit with my MIPI CSI-2 support series.
> I'll try to get rid of it along the way if I need to respin the series,
> or come up with a follow-up patch to remove the call to this function.
> 
> If I understand correctly, the preferred way now is to use:
> - fwnode_graph_get_endpoint_by_id
> - v4l2_fwnode_endpoint_parse
> - v4l2_async_notifier_add_fwnode_remote_subdev
> 
> Is that correct? I think that's what I've been doing in the MIPI CSI-2
> bridge drivers so far.

Yes, that's the preferred way.

-- 
Sakari Ailus
