Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE89B6784EB
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 19:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbjAWSav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 13:30:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbjAWSa0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 13:30:26 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1AC733450
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 10:30:04 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="390616559"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="390616559"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:29:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="611716953"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="611716953"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 23 Jan 2023 10:29:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pK1Ze-00DsCb-0m;
        Mon, 23 Jan 2023 20:29:42 +0200
Date:   Mon, 23 Jan 2023 20:29:41 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Brent Pappas <bpappas@pappasbrent.com>
Subject: Re: [PATCH 56/57] media: atomisp: pci: hive_isp_css_common: host:
 vmem: Replace SUBWORD macros with functions
Message-ID: <Y87SFcb20zsebIWK@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-57-hdegoede@redhat.com>
 <Y87Rmdv84KrQ34Yg@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y87Rmdv84KrQ34Yg@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 08:27:37PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:52:04PM +0100, Hans de Goede wrote:
> > From: Brent Pappas <bpappas@pappasbrent.com>
> > 
> > Replace the macros SUBWORD() and INV_SUBWORD() with functions to comply
> > with Linux coding style standards.

...

> > +static inline hive_uedge
> > +subword(hive_uedge w, unsigned int start, unsigned int end)
> > +{
> > +	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
> > +}
> 
> ...
> 
> > +static inline hive_uedge
> > +inv_subword(hive_uedge w, unsigned int start, unsigned int end)
> > +{
> > +	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
> > +}
> 
> ...
> 
> Brent, maybe you can look at these deeply and convert them to use GENMASK()
> instead? (It can be done as a followup patch, this one is fine)

Note, with such conversion done you may kill these macros and use GENMASK()
inline.

-- 
With Best Regards,
Andy Shevchenko


