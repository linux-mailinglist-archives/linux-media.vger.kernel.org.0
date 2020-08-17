Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8E72465A6
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 13:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbgHQLrV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 07:47:21 -0400
Received: from mga02.intel.com ([134.134.136.20]:57566 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726161AbgHQLrU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 07:47:20 -0400
IronPort-SDR: 3WvTqaIfyVMOQcJm30aFGL4/hQloxYBvtYBN5ccUeeML1/vNGTYvLwR+WBK9HUO1Ag3OeQN/F2
 2eEthrldu/VQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="142510781"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="142510781"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 04:47:20 -0700
IronPort-SDR: mqbVvajN8UFRLi4aFrIck/QqHRB+zYtCr8VCb3Vc+TLXrs4Lh6tZugYiZtrAOJomTLAEro/voT
 CxCC6z6q9yAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="326385713"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2020 04:47:18 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k7dbh-009Iz4-3b; Mon, 17 Aug 2020 14:47:17 +0300
Date:   Mon, 17 Aug 2020 14:47:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 5/7] media: ipu3-cio2: Replace infinite loop by one
 with clear exit condition
Message-ID: <20200817114717.GM1891694@smile.fi.intel.com>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
 <20200814163017.35001-5-andriy.shevchenko@linux.intel.com>
 <aa68f5ec-359c-70ce-ecf6-ee013497230a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa68f5ec-359c-70ce-ecf6-ee013497230a@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 17, 2020 at 06:21:23PM +0800, Bingbu Cao wrote:
> On 8/15/20 12:30 AM, Andy Shevchenko wrote:
> > Refactor cio2_buffer_done() to get rid of infinite loop by replacing it by one
> > with clear exit condition. This change also allows to check for an error ahead.

...

> > -	int buffers_found = 0;
> > +	struct cio2_fbpt_entry *const entry;
> No 'const' here.

Sure, will not be in v2.

-- 
With Best Regards,
Andy Shevchenko


