Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C0F246695
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 14:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgHQMov (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 08:44:51 -0400
Received: from mga01.intel.com ([192.55.52.88]:41273 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728186AbgHQMou (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 08:44:50 -0400
IronPort-SDR: 8fxU1yilIwAluDcHPaofQ9SmWDyZ1ee0grtoV6gO4iuvhFvMO24/w4Z/m+Rry+f6tQYkgfi/2/
 vxCnUeeRVReg==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="172745231"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="172745231"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 05:44:50 -0700
IronPort-SDR: OQMA9mVU7VGaYXAEctMlsWnFVu0fgA/BrXDbv1jkfFy3jocy+ZEPsk441OXI+06CXvPIy/zdLP
 UrijWp4a/vZA==
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="296471340"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 05:44:47 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A1F9A207BA; Mon, 17 Aug 2020 15:44:45 +0300 (EEST)
Date:   Mon, 17 Aug 2020 15:44:45 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, joe@perches.com,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 6/7] media: ipu3-cio2: Use readl_poll_timeout() helper
Message-ID: <20200817124445.GK24582@paasikivi.fi.intel.com>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
 <20200814163017.35001-6-andriy.shevchenko@linux.intel.com>
 <6b739304-7d12-016f-f42a-089c8fe7efac@linux.intel.com>
 <20200817094436.GF1891694@smile.fi.intel.com>
 <20200817111316.GH24582@paasikivi.fi.intel.com>
 <20200817112006.GH1891694@smile.fi.intel.com>
 <20200817112746.GI24582@paasikivi.fi.intel.com>
 <20200817113322.GI1891694@smile.fi.intel.com>
 <20200817115538.GJ24582@paasikivi.fi.intel.com>
 <20200817122911.GN1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817122911.GN1891694@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 17, 2020 at 03:29:11PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 17, 2020 at 02:55:38PM +0300, Sakari Ailus wrote:
> > On Mon, Aug 17, 2020 at 02:33:22PM +0300, Andy Shevchenko wrote:
> > > On Mon, Aug 17, 2020 at 02:27:47PM +0300, Sakari Ailus wrote:
> > > > On Mon, Aug 17, 2020 at 02:20:06PM +0300, Andy Shevchenko wrote:
> > > > > On Mon, Aug 17, 2020 at 02:13:16PM +0300, Sakari Ailus wrote:
> > > > > > On Mon, Aug 17, 2020 at 12:44:36PM +0300, Andy Shevchenko wrote:
> > > > > > > On Mon, Aug 17, 2020 at 05:27:33PM +0800, Bingbu Cao wrote:
> > > > > > > > On 8/15/20 12:30 AM, Andy Shevchenko wrote:
> > > > > > > > > We may use special helper macro to poll IO till condition or timeout occurs.
> > > > > > > 
> > > > > > > > > +	ret = readl_poll_timeout(dma, value, value & CIO2_CDMAC0_DMA_HALTED, 4000, 2000000);
> > > > > > > > 
> > > > > > > > This line is too long, need a break, others look good for me.
> > > > > > > 
> > > > > > > checkpatch doesn't complain, but if you insist, I'll split it in v2.
> > > > > > 
> > > > > > The coding style hasn't changed, it's just the checkpatch.pl warning that
> > > > > > has.
> > > > > 
> > > > > Joe, it seems we have inconsistency now between checkpatch and coding style.
> > > > > Shouldn't we revert 100 limit warning to 80?
> > > > 
> > > > There are sometimes genuine reasons for having longer lines than 80, and
> > > > depending on the code, that happens more often in some places than
> > > > elsewhere. This tended to generate lots of checkpatch.pl warnings in the
> > > > past.
> > > > 
> > > > While I didn't see the patch removing the 80 chars per line limit until it
> > > > made the news, I think it was a quite reasonable compromise.
> > > 
> > > But doesn't it make harder life for reviewers like you? You have to keep in
> > > mind all these inconsistencies and rule either way.
> > > 
> > > That said, we either would fix the doc, or revert the checkpatch change.
> > 
> > I don't think the documentation should be changed. There *are* reasons for
> > the 80-column limit. Although the exact number can be connected to the
> > width of traditional text terminals, using very long lines makes reading
> > text harder. IOW, there's a connection to the same reason why wide
> > newspaper articles are split into several columns.
> 
> > Would it be reasonable if checkpatch.pl warned about exceeding 80-column
> > limits if such lines are rare or nonexistent in the same file?
> 
> I don't think so. If somebody decides to *gradually* move to 100 limit in the
> driver, it will be painful with all these new old warnings.

There would be no more such warnings than with the 80-column limit.

I'd also question whether this is a realistic example. If a file was fine
without long lines in the past, it's unlikely a sudden and sustained need
for having them arises.

I think common reasons for those long lines are e.g. referring to definitions
from standards as-is or IOCTL command definitions. Or flags used on various
interfaces to keep them descriptive. All either exist in given files or do
not. That generally doesn't change over the lifetime of the said files.

-- 
Sakari Ailus
