Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 973D02EE824
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 23:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbhAGWJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 17:09:12 -0500
Received: from mga04.intel.com ([192.55.52.120]:37427 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726326AbhAGWJM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Jan 2021 17:09:12 -0500
IronPort-SDR: NN4iJYeQALSXM8oZagGRJoZiUsyh0CUuJH9jNZnvbBppgVEOqlZ2kJaaARGqc815nTdZaoNNDh
 SVoQCNRnIJZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="174923667"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="174923667"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 14:07:26 -0800
IronPort-SDR: +svQMg0gszshsNWZV41lbPJO80x9+uU7REvbBZZHFSgRjjC1nVKB7M16LNixhV+LAgU+XeikJx
 wwDyoUBvCEFQ==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="567904180"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 14:07:25 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4A3F8205C8; Fri,  8 Jan 2021 00:07:23 +0200 (EET)
Date:   Fri, 8 Jan 2021 00:07:23 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Yong Deng <yong.deng@magewell.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/1] v4l: fwnode:
 v4l2_async_notifier_parse_fwnode_endpoints is deprecated
Message-ID: <20210107220723.GV11878@paasikivi.fi.intel.com>
References: <20201214213348.19675-1-sakari.ailus@linux.intel.com>
 <CAAEAJfADNg_RKuWfREAPbtpB86ZQsNKa5rc83sjB9BZViPhtHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfADNg_RKuWfREAPbtpB86ZQsNKa5rc83sjB9BZViPhtHg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Thu, Jan 07, 2021 at 04:31:58PM -0300, Ezequiel Garcia wrote:
> Hi Sakari,
> 
> On Mon, 14 Dec 2020 at 18:45, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Document that v4l2_async_notifier_parse_fwnode_endpoints() is deprecated.
> > Its functionality has been replaced by other, better functions. Also add a
> > reference to an example if someone ends up wandering here.
> >
> 
> I'm working on a series to clean up the v4l2_async API a bit,
> and came across this patch.
> 
> As far as I can see, the only user of v4l2_async_notifier_parse_fwnode_endpoints
> is drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c.

It may be that's the only one left. The intent was also to avoid anyone
proposing new ones.

> Adding Maxime and Yong Deng, it would be great to get rid of this,
> so we can remove the API, which would also allow us to remove
> some other internal functions and therefore make the API a bit cleaner.

Yes, that'd be very nice. Then we could remove it altogether.

-- 
Regards,

Sakari Ailus
