Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3EB726FD6
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 23:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235963AbjFGVCx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 17:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235952AbjFGVCi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 17:02:38 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18662139
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 14:01:55 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357119322"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="357119322"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 14:01:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="742849662"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="742849662"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 07 Jun 2023 14:01:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1q70Hm-0020DX-17;
        Thu, 08 Jun 2023 00:01:42 +0300
Date:   Thu, 8 Jun 2023 00:01:42 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 23/28] media: ov2680: Implement selection support
Message-ID: <ZIDwNjQDRuXF2kzx@smile.fi.intel.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-24-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607164712.63579-24-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 07, 2023 at 06:47:07PM +0200, Hans de Goede wrote:
> Implement selection support. Modelled after ov5693 selection support,
> but allow setting sizes smaller than crop-size through set_fmt since

->set_fmt()

> that was already allowed.

-- 
With Best Regards,
Andy Shevchenko


