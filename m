Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 552A46F1231
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 09:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345270AbjD1HQQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 03:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbjD1HQN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 03:16:13 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94C72120
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 00:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682666171; x=1714202171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WDn00m9UzV/KH/8u9sF+ark5+fCFPGNhzvSlSEPe4FI=;
  b=WwuNzyA5BK0QY/etrsnad1iUFM6ZG+VAlAABf4MSoPnKp5y1qZpw2wQx
   fTmR6J883B0lT8s5m1breK+Zn9mH/g6hfmC4dUMt3d9p7FCZ6V3ScFWOj
   BqeNIvHbEJD67+45jRMaIfSDWkDD7cKNUUDCwZ1+KTB+IFcg4Aol/1Psh
   7DymmZNUyrwreejDE1Dn4L9/5R4UjArA1wVKmiWencttQBtnOqXoXEkxv
   Drw44qcajRNKnEoZ99vBPRY5kEfjwEG4WQFJCLXBISJzUT5YSD09w0hzP
   NvIzxTBDKlZoDi2H/HFrODp3tcCDKu0+/pnhdZ511jW+Ke7SfFabQj/kD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="336720856"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="336720856"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 00:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="697419198"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="697419198"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 00:16:10 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C47D311FCA0;
        Fri, 28 Apr 2023 10:16:07 +0300 (EEST)
Date:   Fri, 28 Apr 2023 10:16:07 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org
Subject: Re: v4l2-async: regression due to endpoint matching
Message-ID: <ZEtytxcB2+DA8Xs/@kekkonen.localdomain>
References: <8360125.31r3eYUQgx@steina-w>
 <5676976.irdbgypaU6@steina-w>
 <ob373sf6lmg6qfkdqy5ovxescw5gp7yedb2flk4ax762abo7b3@w33eqx3erdg7>
 <6415252.e9J7NaK4W3@steina-w>
 <3u5xed27to5bnwo3dksviydw6z2lga3udjkgvvzor4tlobjlxv@hsnam3wurgxc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3u5xed27to5bnwo3dksviydw6z2lga3udjkgvvzor4tlobjlxv@hsnam3wurgxc>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 28, 2023 at 08:43:21AM +0200, Jacopo Mondi wrote:
> Hi Alexander
> 
> On Fri, Apr 28, 2023 at 08:33:30AM +0200, Alexander Stein wrote:
> > Hi Jacopo,
> >
> > Am Freitag, 28. April 2023, 08:31:54 CEST schrieb Jacopo Mondi:
> > > Hi Alexander
> > >
> > > On Fri, Apr 28, 2023 at 08:24:22AM +0200, Alexander Stein wrote:
> > > > Hi Jacopo,
> > > >
> > > > Am Donnerstag, 27. April 2023, 18:01:38 CEST schrieb Jacopo Mondi:
> > > > > Hi Alexander
> > > > >
> > > > > On Thu, Apr 27, 2023 at 04:40:46PM +0200, Alexander Stein wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > I have a setup on my TQMa6x (imx6q-mba6a.dts) with a tc358743 attached
> > > > > > to
> > > > > > the MIPI CSI input.
> > > > > > I noticed that since commit 1f391df44607 ("media: v4l2-async: Use
> > > > > > endpoints in __v4l2_async_nf_add_fwnode_remote()") the async subdevice
> > > > > > probing does not work anymore. If I revert that, it is working again,
> > > > > > even on next-20230425.
> > > > >
> > > > > A similar issue has been discussed at
> > > > > https://www.spinics.net/lists/linux-media/msg223351.html
> > > > >
> > > > > Unfortunately there was no conclusion as far as I can tell if not that
> > > > > imx6 is now broken
> > > >
> > > > Thanks for the link, seems like a non-trivial thing :(
> > > >
> > > > From a glimpse, this series seems to deal with multiple async subdevs:
> > > > https://lore.kernel.org/all/20230330115853.1628216-1-sakari.ailus@linux.in
> > > > tel.com/
> > > >
> > > > So imx-media-csi should be adjusted as well, no?
> > >
> > > It would really be helpful if you can give that series a spin on imx6
> > > if you already have a test setup.
> >
> > I tried, but it failed to apply on my current development tree. What base does
> > this series apply to? Is there also a repository available I can fetch from?
> >
> 
> Sakari could tell, for me it applied on v6.3-rc2 but I recall I had to
> manually fix a few things.

Don't try v1, it won't work. I missed some object relation changes in the
linked lists. I'll post v2, hopefully some time next week, to address these
issues.

-- 
Regards,

Sakari Ailus
