Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAFF726B73
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 22:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233317AbjFGUZ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 16:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbjFGUZT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 16:25:19 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAD626B2
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 13:24:55 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="336726535"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="336726535"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 13:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="854041217"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="854041217"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2023 13:23:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1q6zgs-001zo9-1q;
        Wed, 07 Jun 2023 23:23:34 +0300
Date:   Wed, 7 Jun 2023 23:23:34 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 08/28] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZIDnRoSEv4jhgd2q@smile.fi.intel.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-9-hdegoede@redhat.com>
 <ZIDnGGd2OU5sDT1G@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIDnGGd2OU5sDT1G@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 07, 2023 at 11:22:48PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 07, 2023 at 06:46:52PM +0200, Hans de Goede wrote:
> > The CSI2 specification specifies a standard method to access camera sensor
> > registers called "Camera Control Interface (CCI)".
> > 
> > This uses either 8 or 16 bit (big-endian wire order) register addresses
> > and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
> > 
> > Currently a lot of Linux camera sensor drivers all have their own custom
> > helpers for this, often copy and pasted from other drivers.
> > 
> > Add a set of generic helpers for this so that all sensor drivers can
> > switch to a single common implementation.
> > 
> > These helpers take an extra optional "int *err" function parameter,
> > this can be used to chain a bunch of register accesses together with
> > only a single error check at the end, rather then needing to error
> > check each individual register access. The first failing call will
> > set the contents of err to a non 0 value and all other calls will
> > then become no-ops.
> 
> So, this version doesn't have updates we discussed previously. Is it only for
> reference here?

Okay, I found the answer in the cover letter.

-- 
With Best Regards,
Andy Shevchenko


