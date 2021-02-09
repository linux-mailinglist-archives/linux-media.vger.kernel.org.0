Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36146314EBB
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 13:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhBIMLC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 07:11:02 -0500
Received: from mga02.intel.com ([134.134.136.20]:60667 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229705AbhBIMJ7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 07:09:59 -0500
IronPort-SDR: b0vtR+7bJ5Xhui5I3kURhg4F3I9MuNfT1sVhHw2/PTtfrSvp2iI7NrbNXqZb5s5gVwxCHTBOo3
 QOHHZ7VPuhDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="168992860"
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="168992860"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 04:08:09 -0800
IronPort-SDR: Tr4PBGm/FMthpmhKVbqXAKSGFuBdC1bKsJJojV1ehukhdGsp9aFVDSuFuD6OZLqzwIBUFz/3Iz
 VWGYGoF/wA1g==
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="509852615"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 04:08:06 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A3814206D0; Tue,  9 Feb 2021 14:08:04 +0200 (EET)
Date:   Tue, 9 Feb 2021 14:08:04 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx334: Fix an error message
Message-ID: <20210209120804.GD32460@paasikivi.fi.intel.com>
References: <YCJsUCngklBkJMgw@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCJsUCngklBkJMgw@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Tue, Feb 09, 2021 at 02:04:48PM +0300, Dan Carpenter wrote:
> The "ret" variable is uninitialized in this error message.
> 
> Fixes: 9746b11715c3 ("media: i2c: Add imx334 camera sensor driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch. This has been already addressed by a patch from Hans
(but not merged yet):

<URL:https://patchwork.linuxtv.org/project/linux-media/patch/917ccfef-b93e-4d90-0b5a-4974145ab187@xs4all.nl/>

> ---
> When new drivers are merged into the kernel, then could we use the
> driver prefix?  In other words something like this:
> 
> media: i2c/imx334: Add imx334 camera sensor driver

We've usually had driver's name and Mauro's scripts add media: prefix ---
unless it's already there. Are you suggesting also the bus should be part
of it?

-- 
Kind regards,

Sakari Ailus
