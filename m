Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04B527BFCEF
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 15:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbjJJNKb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 09:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjJJNKa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 09:10:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93AA7AC
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696943428; x=1728479428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8LfrtzSe3QTLmf73zJyj8cTCI32a+oRZPf1k4J8zTNg=;
  b=efYO6/nkTYt2rwf5q/MKUGMZrCdIOggWv9awwXYfAtTbvafazBdwW9BR
   J1HxLw6rZYXS4ZfebdUJs0wZ7L/nE9+FaUmHxubeReBu07ifIcLnUVm77
   9ck2ERFTc11uj7fszH/hmFAMC8IL8XlBEdGV7sTRNy9ewMOyf8eV1kIkl
   9w4ZLjeNOZ5vmBgAl4UPspUUFwIbakHd8xd4c7WaL2ASN+4zoxy63Ftcj
   L4qzgfG9hSfmm0m+XVBU5jMpME1DR93gGFz+AA9+UxS30SRh/hB9/MVwS
   wpsKMqAtK0OV0CYHAwtMsc+sssrOqtgd0mYcLsJqMeuoxW8pTeoMZF/NE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387224875"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="387224875"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:10:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="877220279"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="877220279"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:10:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 56D1211F8DE;
        Tue, 10 Oct 2023 16:10:17 +0300 (EEST)
Date:   Tue, 10 Oct 2023 13:10:17 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Dennis Bonke <admin@dennisbonke.com>,
        tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH] media: subdev: Don't report V4L2_SUBDEV_CAP_STREAMS when
 the streams API is disabled
Message-ID: <ZSVNOb1Cg6lIda6E@kekkonen.localdomain>
References: <20231010102458.111227-1-hdegoede@redhat.com>
 <ZSU6ZFKS5QkFJgZw@kekkonen.localdomain>
 <c9157c41-a890-4542-bdad-9e193dcbb833@xs4all.nl>
 <ZSVChht/IK+XA0dp@kekkonen.localdomain>
 <acdf7d7b-e6f2-41c0-a025-397a95afc2cf@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acdf7d7b-e6f2-41c0-a025-397a95afc2cf@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 10, 2023 at 03:01:53PM +0200, Hans Verkuil wrote:
> On 10/10/23 14:24, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Tue, Oct 10, 2023 at 01:52:21PM +0200, Hans Verkuil wrote:
> >> On 10/10/23 13:49, Sakari Ailus wrote:
> >>> Hi Hans,
> >>>
> >>> On Tue, Oct 10, 2023 at 12:24:58PM +0200, Hans de Goede wrote:
> >>>> Since the stream API is still experimental it is currently locked away
> >>>> behind the internal, default disabled, v4l2_subdev_enable_streams_api flag.
> >>>>
> >>>> Advertising V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
> >>>> confuses userspace. E.g. it causes the following libcamera error:
> >>>>
> >>>> ERROR SimplePipeline simple.cpp:1497 Failed to reset routes for
> >>>>   /dev/v4l-subdev1: Inappropriate ioctl for device
> >>>>
> >>>> Don't report V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
> >>>> to avoid problems like this.
> >>>>
> >>>> Reported-by: Dennis Bonke <admin@dennisbonke.com>
> >>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>> ---
> >>>> -Clearing the V4L2_SUBDEV_FL_STREAMS flag from sd.flags might seem
> >>>>  appealing as an alternative fix. But this causes various v4l2-core bits
> >>>>  to enter different code paths which confuses drivers which set
> >>>>  V4L2_SUBDEV_FL_STREAMS, so this is a bad idea.
> >>>
> >>> Thanks, this apparently had been missed while disabling the API.
> >>>
> >>> Probably also should be added:
> >>>
> >>> Fixes: 9a6b5bf4c1bb ("media: add V4L2_SUBDEV_CAP_STREAMS")
> >>> Cc: stable@vger.kernel.org # for >= 6.3
> >>>
> >>> Also cc'd Tomi.
> >>
> >> Should this be queued up as a 6.6 fix?
> > 
> > I wonder what the criteria is these days.
> > 
> > I'd think it's unlikely anything is or will be broken by this in practice.
> > The further this exists, though, increases the likelihood for that to
> > happen.
> > 
> 
> 1) Regressions: i.e. it worked before, but no longer in v6.6.
> 2) Compilation errors, typically due to Kconfig problems.
> 3) For new code that appeared in v6.6: serious bugs causing kernel oopses
>    or other bad behavior during normal use. (I.e., the 'Oh shit, I never
>    tested that!' bugs)
> 
> Generally a lot of these fixes deal with error paths etc., those can
> often wait for the next kernel.
> 
> There are no doubt more reasons for considering patches for v6.6, but those
> three are no-brainers...
> 
> And there is of course a gray area where you could lean either way.
> 
> For this particular patch it would affect imx8-isi-crossbar.c in 6.4 onwards,
> and starting with 6.6 it is also used in the ds90ub9xx drivers according to
> git grep.

I think it'd be better to get it to 6.6 right away. If you take this,
please add:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
