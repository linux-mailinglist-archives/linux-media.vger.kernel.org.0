Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9969922EBE3
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 14:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgG0MQi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 08:16:38 -0400
Received: from mga06.intel.com ([134.134.136.31]:50179 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726555AbgG0MQi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 08:16:38 -0400
IronPort-SDR: wUbWWZCF38OrhU0qTV28ErBfwR6SH+ou8TkwUA5qph6xC50+bkXs790XOb5kjYC2viU/m13RdO
 he+4ceOwDeMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="212525543"
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="212525543"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2020 05:16:37 -0700
IronPort-SDR: xm21LHzL+iPrWEbp8NdponhHFX5IsjKy0gdGMDaiQjphChxSCwVIEdoB88yjYbU3W8TYXZGRwT
 B0yQgUUNZEAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="489945687"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2020 05:16:35 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k023X-004Gw7-Kh; Mon, 27 Jul 2020 15:16:35 +0300
Date:   Mon, 27 Jul 2020 15:16:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ankit <b18007@students.iitmandi.ac.in>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging : media : atomisp : pci : fixed a brace coding
 sytle issue
Message-ID: <20200727121635.GT3703480@smile.fi.intel.com>
References: <20200727080150.10659-1-b18007@students.iitmandi.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727080150.10659-1-b18007@students.iitmandi.ac.in>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 01:31:50PM +0530, Ankit wrote:
> From: Ankit Baluni<b18007@students.iitmandi.ac.in>
> 
> Fixed a coding style issue.

One time is enough to be sent :-)

The Subject nevertheless can be amended, like

media: atomisp: fixed a brace coding sytle issue

-- 
With Best Regards,
Andy Shevchenko


