Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A91C47D7510
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 22:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234337AbjJYUCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 16:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbjJYUCF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 16:02:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795D3181
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698264123; x=1729800123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4uxiqXiiQnmZdcZ5jXyNPTOqXGOZYspgRJO19VzIkXc=;
  b=nQkAEImXBKRqLZ/FNk7wvySa9ExHavUc+bkBp2WNHmyeNhmSzJsqx98y
   2ZYb20TrFAaR7AQxt0qWkBIGyukRlCukjaNVLJlZfU7emLCp/R4bhpKTZ
   Wxsyfzd0kihNdPNSml2kWZMNLNSWfW1F/OJmr/biyuau1p+YSrpJB98US
   OmFsrlcbf4me++ISicB2PtC00svh9emR7vKRseu1QUkVI7QnUDOC48N3q
   kuO+8rxdyRko7HcgiexifP/rAZ5rzfWiOwIbwRmD0iiB3TN4USvRH0VMb
   OJlrSmaXaDxCXnVVMxMMrwJO2ixkXaxZsYhL9y9JCysO1e1suyuXjRF3C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="386269491"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="386269491"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 13:02:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="824761523"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="824761523"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 13:01:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qvk4i-00000008fqd-1Q3l;
        Wed, 25 Oct 2023 23:01:56 +0300
Date:   Wed, 25 Oct 2023 23:01:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH v2 12/15] media: add Kconfig and Makefile for IPU6
Message-ID: <ZTl0NJcDhB+0Gze1@smile.fi.intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-13-bingbu.cao@intel.com>
 <ZTfAxXJcGN8tS0kD@smile.fi.intel.com>
 <ZTkIOYgvN8CoMa_Z@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTkIOYgvN8CoMa_Z@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 25, 2023 at 12:21:13PM +0000, Sakari Ailus wrote:
> On Tue, Oct 24, 2023 at 04:04:05PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 24, 2023 at 07:29:21PM +0800, bingbu.cao@intel.com wrote:

...

> > > +intel-ipu6-objs				+= ipu6.o \
> > 
> > += doesn't seem right.
> > Besides that 'objs' is for user space, in kernel we use 'y'.
> 
> This is a common pattern used in other Makefiles, too... I guess ":=" would
> work, too.
> 
> How otherwise would you do this?

:= has different meaning in make language. How you will guarantee somewhere
else somebody won't use same target, note that make is recursive.

-- 
With Best Regards,
Andy Shevchenko


