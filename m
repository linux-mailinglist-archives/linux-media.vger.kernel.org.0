Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2C776ED02
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 16:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235297AbjHCOpn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 10:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234450AbjHCOpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 10:45:41 -0400
Received: from mgamail.intel.com (unknown [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1A4A3
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691073936; x=1722609936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ovrlGJ12b18LAlolEMoshW4Xj9yqKZtCfdHfQT8zcog=;
  b=mG3xvnR3FfC9qcERClhSrskzzB71qy54AcTMbG1JIiN/mfprg/YUP8Ly
   undDoeCDS/Me/90W9uGdWNBz3aRm4hI5UjQH9WFMdshr5hPh7+c9cXAJk
   8HSa8YYE1eQ4r/UWWnQ2yT+6+kSDVV5jjOD4Ka/HaODjk8LpFBa86g8ed
   fjdDryNf2cnEWfSNqF1Ig6qVuAS1RpCHrG8r8DncFxuobwLsdzIM3e2mx
   ddduMBVIMowOgCKoL0bl8oOKj27cg9n5oIoL6xCAbr4rYHnIykPPoQrkj
   x+iGajwD1JFEGfScp5/FjTtbCo+Yt4Dzf5ruClHoTy87m/YJixlNKeXuG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="433743286"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="433743286"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 07:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="819694463"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="819694463"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 07:45:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id B80141204CF;
        Thu,  3 Aug 2023 17:45:30 +0300 (EEST)
Date:   Thu, 3 Aug 2023 14:45:30 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 17/32] media: ov2680: Add support for ACPI enumeration
Message-ID: <ZMu9ir+vYOo8jSUz@kekkonen.localdomain>
References: <20230803093348.15679-1-hdegoede@redhat.com>
 <20230803093348.15679-18-hdegoede@redhat.com>
 <ZMuoVeni2dSSM9xb@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMuoVeni2dSSM9xb@smile.fi.intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Thu, Aug 03, 2023 at 04:15:01PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 03, 2023 at 11:33:32AM +0200, Hans de Goede wrote:
> > Add an acpi_match_table now that all the other bits necessary for
> > ACPI support are in place.
> 
> > The OVTI prefix used for the ACPI-HID is used for various OmniVision
> > sensors on many generations x86 tablets and laptops.
> 
> "OVTI is the official ACPI vendor ID for OmniVision Technologies, Inc."
> 
> > The OVTI2680 HID specifically is used on multiple models spanning at
> > least 4 different Intel CPU models (2 ISP2, 2 IPU3).
> 
> With or without above (as it's still the official vendor ID :-)
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> from ACPI ID rules perspective.
> 
> But add that in case you need to send a new version.

Thanks, Andy!

I'll take this version then, it's "just" a sensor driver patch.

-- 
Sakari Ailus
