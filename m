Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36FD26F761
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 09:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgIRHwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 03:52:05 -0400
Received: from mga03.intel.com ([134.134.136.65]:47743 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgIRHwE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 03:52:04 -0400
IronPort-SDR: 1a3eqCzY0mnDMxYhSTzoUMS5ekCYqeuLPcKZLcl4hdPaCIlmPGjadmTQelFak5y0Iny8FfjP1b
 KEyImH78yVxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="159936005"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="159936005"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 00:52:03 -0700
IronPort-SDR: aGLIl3MOuejeYag5/MQZNdd9G1WZcYWhHIhn1M+ibBYwpU2kvnetFLi7rJn/wOLZSe9oYFqUbF
 4IZrxTeb95zA==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="287874902"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 00:51:59 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id AB1B320815; Fri, 18 Sep 2020 10:51:57 +0300 (EEST)
Date:   Fri, 18 Sep 2020 10:51:57 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dan Scally <djrscally@gmail.com>, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, davem@davemloft.net, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, jorhand@linux.microsoft.com,
        kitakar@gmail.com, kieran.bingham@ideasonboard.com
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
Message-ID: <20200918075157.GF26842@paasikivi.fi.intel.com>
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917103343.GW26842@paasikivi.fi.intel.com>
 <8133a57d-ab4c-dccd-4325-9b10e7805648@gmail.com>
 <20200917124514.GK3956970@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917124514.GK3956970@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Thu, Sep 17, 2020 at 03:45:14PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 17, 2020 at 11:52:28AM +0100, Dan Scally wrote:
> > On 17/09/2020 11:33, Sakari Ailus wrote:
> > > a module and not enlarge everyone's kernel, and the initialisation would at
> > > the same time take place before the rest of what the CIO2 driver does in
> > > probe.
> > I thought of that as well, but wasn't sure which was preferable. I can
> > compress it into the CIO2 driver though sure.
> 
> Sakari, I tend to agree with Dan and have the board file separated from the
> driver and even framework.

And it'll be linked to the kernel binary then I suppose?

I don't have a strong opinion either way, just thought that this will
affect anyone using x86 machines, whether or not they have IPU3. I guess it
could be compiled in if the ipu3-cio2 driver is enabled?

-- 
Sakari Ailus
