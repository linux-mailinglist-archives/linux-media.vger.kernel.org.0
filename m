Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE3970BCC8
	for <lists+linux-media@lfdr.de>; Mon, 22 May 2023 14:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233659AbjEVMAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 May 2023 08:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233640AbjEVMAe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 May 2023 08:00:34 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97197A8
        for <linux-media@vger.kernel.org>; Mon, 22 May 2023 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684756809; x=1716292809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vuxhX4ZIY72Kth2XVO27bHsA3ytECxppmX7adXXypro=;
  b=CC9tTNssbsMGOb7V3Df6FkIxoyTCouNPOP2WRxGmhgiaAoWwwMHTW519
   M0XXAUkb0zTqPUY/OdVRF9Xjnnpxg7BSIY3SRQ/keTkQ/BQ0NYPPoxPLO
   U67XkKI8USiMVVjAxR4pzwXxj5UmwivQiCsQmnJV8qhiYjaEkR51bmPFz
   XfK++3A4dErQ0e2jFV6+bkqlWpFcbXBB51p5TjRGPkLuqy2KbCYlcKQpU
   hzPVZpCfhgqK1WuOgUPg8zGVI7dHYg8/MKv//HizLK55j8M742gpslO/2
   VHHUalEIf+amHCfrT+eEDjRn/dwpgaGLGgEj0VKObKCTs6FW3CahZYlwn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="416361818"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="416361818"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 04:59:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="680918377"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="680918377"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 04:59:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 90E38120BF9;
        Mon, 22 May 2023 14:59:23 +0300 (EEST)
Date:   Mon, 22 May 2023 11:59:23 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, niklas.soderlund@ragnatech.se
Subject: Re: v4l2-async: regression due to endpoint matching
Message-ID: <ZGtZGzZ3wiwiJBkp@kekkonen.localdomain>
References: <8360125.31r3eYUQgx@steina-w>
 <5676976.irdbgypaU6@steina-w>
 <ob373sf6lmg6qfkdqy5ovxescw5gp7yedb2flk4ax762abo7b3@w33eqx3erdg7>
 <6415252.e9J7NaK4W3@steina-w>
 <3u5xed27to5bnwo3dksviydw6z2lga3udjkgvvzor4tlobjlxv@hsnam3wurgxc>
 <ZEtytxcB2+DA8Xs/@kekkonen.localdomain>
 <f30d063b-e131-a659-9a1f-8f47e5736b44@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f30d063b-e131-a659-9a1f-8f47e5736b44@leemhuis.info>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thorsten,

On Mon, May 22, 2023 at 12:53:52PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 28.04.23 09:16, Sakari Ailus wrote:
> > On Fri, Apr 28, 2023 at 08:43:21AM +0200, Jacopo Mondi wrote:
> >> On Fri, Apr 28, 2023 at 08:33:30AM +0200, Alexander Stein wrote:
> >>> Am Freitag, 28. April 2023, 08:31:54 CEST schrieb Jacopo Mondi:
> >>>> On Fri, Apr 28, 2023 at 08:24:22AM +0200, Alexander Stein wrote:
> >>>>> Am Donnerstag, 27. April 2023, 18:01:38 CEST schrieb Jacopo Mondi:
> >>>>>> On Thu, Apr 27, 2023 at 04:40:46PM +0200, Alexander Stein wrote:
> >>>>>>> I have a setup on my TQMa6x (imx6q-mba6a.dts) with a tc358743 attached
> >>>>>>> to
> >>>>>>> the MIPI CSI input.
> >>>>>>> I noticed that since commit 1f391df44607 ("media: v4l2-async: Use
> >>>>>>> endpoints in __v4l2_async_nf_add_fwnode_remote()") the async subdevice
> >>>>>>> probing does not work anymore. If I revert that, it is working again,
> >>>>>>> even on next-20230425.
> >>>>>>
> >>>>>> A similar issue has been discussed at
> >>>>>> https://www.spinics.net/lists/linux-media/msg223351.html
> >>>>>>
> >>>>>> Unfortunately there was no conclusion as far as I can tell if not that
> >>>>>> imx6 is now broken
> >>>>>
> >>>>> Thanks for the link, seems like a non-trivial thing :(
> >>>>>
> >>>>> From a glimpse, this series seems to deal with multiple async subdevs:
> >>>>> https://lore.kernel.org/all/20230330115853.1628216-1-sakari.ailus@linux.in
> >>>>> tel.com/
> >>>>>
> >>>>> So imx-media-csi should be adjusted as well, no?
> >>>>
> >>>> It would really be helpful if you can give that series a spin on imx6
> >>>> if you already have a test setup.
> >>>
> >>> I tried, but it failed to apply on my current development tree. What base does
> >>> this series apply to? Is there also a repository available I can fetch from?
> >>
> >> Sakari could tell, for me it applied on v6.3-rc2 but I recall I had to
> >> manually fix a few things.
> > 
> > Don't try v1, it won't work. I missed some object relation changes in the
> > linked lists. I'll post v2, hopefully some time next week, to address these
> > issues.
> 
> Hi, Thorsten here, the Linux kernel's regression tracker.
> 
> I see that v2[1] got a lot of ACKs, but is not even yet in next. And
> it's a lot of patches, so maybe too much for backporting to stable
> kernels. Which leads to the question: Will the regression this thread is
> about (introduced in 5.19 afaics) ever be fixed in v6.1?
> Normally/Ideally it should be.

We'll need v3 (at least), a problem that's not trivial to fix was
identified with v2. There patches aren't really fixes either: it's new
functionality that wasn't there previously. I.MX6 just happened to work due
to missing checks in the V4L2 async framework, what it needs was never
supported (without this set).

Dropping endpoint matching will break adv748x driver that relies on it.

So I'd expect i.MX6 to work again once we have this set in, but I wouldn't
try to backport the set.

Cc Niklas.

-- 
Regards,

Sakari Ailus
