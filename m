Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30FD07E1FC5
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 12:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjKFLSL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 06:18:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjKFLSK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 06:18:10 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F35BB
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 03:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699269488; x=1730805488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DqybztDarWTpyLGDNflgN6SmV68py5C4BMggGTsMQUs=;
  b=PXpk7aKMk1aYE6g4UFSwrxBz5QC/fuAzBpfwuYCmIzYMDgAQZffPBVFm
   kM8iP2kEq89hAtR1VSpHZnAM1teIiLctfc+siU4SKD8XGuUE5TDOyuuJu
   aS++ZVGErfLFXXfiZ8d8SMD3xf14O8Kh/ekc4VLo6d6x7/xhWPllkf/rg
   c5c2zV9W/lzlvHmpEPwbdv5toBitHJoVmsAuxKRncrL6JJtvvnB39wzj1
   OE7iTim51JscEf/sP5t9hW4cLofj/rnpPGVgxr0GQ7ro+gLzTrrMvIMl+
   HcQzLbPQscbXW5b2AJJgt41k/o/oHtk1WOHCUX2loTdUZiT3pUVvcF1lT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="475489225"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="475489225"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 03:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="791443718"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="791443718"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 03:18:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qzxcG-0000000Blun-0JrM;
        Mon, 06 Nov 2023 13:18:00 +0200
Date:   Mon, 6 Nov 2023 13:17:59 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Hans de Goede <hans@hansg.org>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 11/15] media: intel/ipu6: input system video capture
 nodes
Message-ID: <ZUjLZ_ev4Xy-Ey4y@smile.fi.intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-12-bingbu.cao@intel.com>
 <855f69b8-dc33-225a-ebd3-134467d55cf1@hansg.org>
 <8df79f15-2054-d558-7b27-7362cdcde26b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8df79f15-2054-d558-7b27-7362cdcde26b@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 06, 2023 at 05:18:55PM +0800, Bingbu Cao wrote:
> On 11/6/23 12:59 AM, Hans de Goede wrote:

...

> Yes, sure.

It's likely that I meant this series (it's under development, right?) to be
Cc'ed to me in its next version.

-- 
With Best Regards,
Andy Shevchenko


