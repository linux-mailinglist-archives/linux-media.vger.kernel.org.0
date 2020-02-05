Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59DA41527F0
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 10:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbgBEJCM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Feb 2020 04:02:12 -0500
Received: from mga11.intel.com ([192.55.52.93]:21948 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727070AbgBEJCM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Feb 2020 04:02:12 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Feb 2020 01:02:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,405,1574150400"; 
   d="scan'208";a="231652104"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 05 Feb 2020 01:02:07 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1izGZU-0008Fz-F4; Wed, 05 Feb 2020 11:02:08 +0200
Date:   Wed, 5 Feb 2020 11:02:08 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 02/17] media: v4l2-fwnode: Pass notifier to
 v4l2_async_register_fwnode_subdev()
Message-ID: <20200205090208.GR10400@smile.fi.intel.com>
References: <20200204234918.20425-1-slongerbeam@gmail.com>
 <20200204234918.20425-3-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204234918.20425-3-slongerbeam@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 04, 2020 at 03:49:03PM -0800, Steve Longerbeam wrote:
> Instead of allocating a notifier in v4l2_async_register_fwnode_subdev(),
> have the caller provide one. This allows the caller to implement
> notifier ops (bind, unbind).
> 
> The caller is now responsible for first initializing its notifier with a
> call to v4l2_async_notifier_init().

Hint: When creating a list of maintainers use this (or similar) command:

	scripts/get_maintainer.pl --git --git-min-percent=67 ...

P.S. Please, do not add me in Cc list for v4l2 matters.

-- 
With Best Regards,
Andy Shevchenko


