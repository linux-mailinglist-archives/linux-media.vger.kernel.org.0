Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2923172803E
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 14:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbjFHMli (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 08:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235905AbjFHMlc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 08:41:32 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D3A2726
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 05:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686228092; x=1717764092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TTf6aKfoT3+IDxClj80hgakY4hpx5x2H2soSVtkenFw=;
  b=j638GXxjClXCS04KYQKl7W4kAFydRUw4XTG0nKwjWLB8DGcQo/Kkh+yQ
   tgvYg5hMZ6peb1NeaxuQSkbvqALpSa78zpi+jNDvLvEJuT++E8+EsVgqe
   IliU/1DTy9Eahpiw1Xn430L0aaCIhA3xzG+EvVKBNbV+taG/grj8XCKp8
   Ywr98tikiUkqMXDVEmq53FjjCLm4snmMcQiLZ0KSlSNr3Fhiy4MA7SqLL
   72rJxWWwBzvgGUJnAr3hjSzZlbTpvGAj0khxgP1pDmvUUzEeXDU8KSk65
   aRVIqCZPiRds6HLK7yyBl40LnjLXEoyojWAh/b8z7UHn8OX9UBlo6Lg6v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="423145293"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="423145293"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 05:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="713103114"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="713103114"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 05:41:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 23753120BE1;
        Thu,  8 Jun 2023 15:41:27 +0300 (EEST)
Date:   Thu, 8 Jun 2023 12:41:27 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 01/28] media: ov2680: Remove auto-gain and auto-exposure
 controls
Message-ID: <ZIHMd/ygG6LdXndd@kekkonen.localdomain>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607164712.63579-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jun 07, 2023 at 06:46:45PM +0200, Hans de Goede wrote:
> Quoting the OV2680 datasheet:
> 
> "3.2 exposure and gain control
> 
> In the OV2680, the exposure time and gain are set manually from an external
> controller. The OV2680 supports manual gain and exposure control only for
> normal applications, no auto mode."
> 
> And indeed testing with the atomisp_ov2680 fork of ov2680.c has shown that
> auto-exposure and auto-gain do not work.
> 
> Note that the code setting the auto-exposure flag was broken, callers
> of ov2680_exposure_set() were directly passing !!ctrls->auto_exp->val as
> "bool auto_exp" value, but ctrls->auto_exp is a menu control with:
> 
> enum  v4l2_exposure_auto_type {
>         V4L2_EXPOSURE_AUTO = 0,
>         V4L2_EXPOSURE_MANUAL = 1,
> 	...
> 
> So instead of passing !!ctrls->auto_exp->val they should have been passing
> ctrls->auto_exp->val == V4L2_EXPOSURE_AUTO, iow the passed value was
> inverted of what it should have been.
> 
> Also remove ov2680_g_volatile_ctrl() since without auto support the gain
> and exposure controls are not volatile.
> 
> This also fixes the control values not being properly applied in
> ov2680_mode_set(). The 800x600 mode register-list also sets gain,
> exposure and vflip overriding the last set ctrl values.
> 
> ov2680_mode_set() does call ov2680_gain_set() and ov2680_exposure_set()
> but did this before writing the mode register-list, so these values
> would still be overridden by the mode register-list.
> 
> Add a v4l2_ctrl_handler_setup() call after writing the mode register-list
> to restore all ctrl values. Also remove the ctrls->gain->is_new check from
> ov2680_gain_set() so that the gain always gets restored properly.
> 
> Last since ov2680_mode_set() now calls v4l2_ctrl_handler_setup(), remove
> the v4l2_ctrl_handler_setup() call after ov2680_mode_restore() since
> ov2680_mode_restore() calls ov2680_mode_set().
> 
> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

It is interesting, to say at least, to see this and the few following
patches. No-one has previously complained. Makes me also wonder how the
original driver was tested.

Could you also cc the original author who is also listed as the current
maintainter of the driver for v2?

-- 
Kind regards,

Sakari Ailus
