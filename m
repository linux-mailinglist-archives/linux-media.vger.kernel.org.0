Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBD93E9EAF
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 08:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbhHLGkY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 02:40:24 -0400
Received: from mga01.intel.com ([192.55.52.88]:13074 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231149AbhHLGkX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 02:40:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="237318599"
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="237318599"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 23:39:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="421808995"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 23:39:57 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id EA1C1203D0;
        Thu, 12 Aug 2021 09:39:24 +0300 (EEST)
Date:   Thu, 12 Aug 2021 09:39:24 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Kao, Arec" <arec.kao@intel.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Yeh, Andy" <andy.yeh@intel.com>,
        "Chang, Wei Shun" <wei.shun.chang@intel.com>
Subject: Re: [PATCH] Add sensor driver support for the ov13b10 camera.
Message-ID: <20210812063924.GO3@paasikivi.fi.intel.com>
References: <20210811102402.21945-1-arec.kao@intel.com>
 <20210811104029.GM3@paasikivi.fi.intel.com>
 <DM8PR11MB573372C821350FD295347E7491F99@DM8PR11MB5733.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB573372C821350FD295347E7491F99@DM8PR11MB5733.namprd11.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arec,

On Thu, Aug 12, 2021 at 03:38:55AM +0000, Kao, Arec wrote:
> Hi Sakari,
> 
> Thank you for the nice feedback. I will fix each of your comments on v2
> patch. As regards to your comment: "Does v/hflip change the pixel order
> with this driver btw.?", yes, it does actually change bayer order when
> image flip/mirror and already made some changes with
> increasing/decreasing horizontal/ vertical window offset in v/hflip
> function.

Ok. Almost all sensors require changing the Bayer order but some drivers
just shift the crop window by one pixel. Either is fine, as long as it is
taken care of so that the sensor produces pixels in the order the driver
indicates.

-- 
Regards,

Sakari Ailus
