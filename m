Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99069579871
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 13:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236756AbiGSL2B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 07:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236587AbiGSL1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 07:27:53 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC22C31202
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 04:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658230072; x=1689766072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WNpsdeGzmNHi1I+QFd1Ulc+RjSswlm9Nsn3hOwsgo8Y=;
  b=IPtLdDIwJnQMo1URBscrcioEnQ3BRBhZsdgDeRgKJmkK1XMBw7vLMAaQ
   xOKQlsAgRomoHiSSSJcmO3aNh9AR3f9DXkbLdGQW+QOinc/KMkUCKKnc0
   AfNir9s0j2rRj34W9HjlDggmR7jKecJtRm46HVt5tsDYnpC72v+ILrwJf
   Lll80OjRhl3flqEoHu5yXbV0ORoLtF9coo+r18Y1mnszwkK1wHKdX4X8p
   PD0LbmlIQYxuYNxV+9XKPFnG2yLBz2X+Vn0EoSfI7/Z7RnAvb1HJ4gL3/
   jk3pLzFmdjZcXLLYCP8KPBk2LK34zVXm7ORh06aw0UBRTXvExTN5CC9Zl
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="266866309"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="266866309"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 04:27:52 -0700
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="739832608"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 04:27:51 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 630BE202EA;
        Tue, 19 Jul 2022 14:27:49 +0300 (EEST)
Date:   Tue, 19 Jul 2022 11:27:49 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/1] media: sunxi: Depend on GENERIC_PHY_MIPI_DPHY
Message-ID: <YtaVNVMxVnlr64dm@paasikivi.fi.intel.com>
References: <20220713192540.222794-1-sakari.ailus@linux.intel.com>
 <YtZxajlS5FFFnfgf@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtZxajlS5FFFnfgf@aptenodytes>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Tue, Jul 19, 2022 at 10:55:06AM +0200, Paul Kocialkowski wrote:
> Hi Sakari,
> 
> On Wed 13 Jul 22, 22:25, Sakari Ailus wrote:
> > The sun6i-mipi-csi2 and sun6i-a83t-mipi-csi2 drivers depend on the generic
> > MIPI D-PHY support. Select it. This fixes a linking problem when either of
> > these drivers is enabled and GENERIC_PHY_MIPI_DPHY is disabled.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Looks good to me but I have one question below.
> 
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> 
> Cheers,
> 
> Paul
> 
> > ---
> >  drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig      | 1 +
> >  drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> > index b1712f5873fd9..eb982466abd30 100644
> > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> > @@ -8,6 +8,7 @@ config VIDEO_SUN6I_MIPI_CSI2
> >  	select VIDEO_V4L2_SUBDEV_API
> >  	select V4L2_FWNODE
> >  	select PHY_SUN6I_MIPI_DPHY
> > +	select GENERIC_PHY_MIPI_DPHY
> 
> Since we select PHY_SUN6I_MIPI_DPHY here which also selects
> GENERIC_PHY_MIPI_DPHY, I suppose this is not strictly needed?

In that case the symbols won't be present in modpost and that causes a build
failure.

Thanks for the review. The patch is already merged though.

-- 
Kind regards,

Sakari Ailus
