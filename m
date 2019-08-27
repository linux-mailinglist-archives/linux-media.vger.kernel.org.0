Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A25FB9DE9B
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 09:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbfH0HUt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 03:20:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:45050 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbfH0HUt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 03:20:49 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Aug 2019 00:20:48 -0700
X-IronPort-AV: E=Sophos;i="5.64,436,1559545200"; 
   d="scan'208";a="197245079"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Aug 2019 00:20:46 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8BAA92095B; Tue, 27 Aug 2019 10:20:43 +0300 (EEST)
Date:   Tue, 27 Aug 2019 10:20:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     mripard@kernel.org, mchehab@kernel.org, wens@csie.org,
        maxime.ripard@bootlin.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] media: sun6i: Make sun4i_csi_formats static
Message-ID: <20190827072043.GA7657@paasikivi.fi.intel.com>
References: <20190827070623.15776-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827070623.15776-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yue,

On Tue, Aug 27, 2019 at 03:06:23PM +0800, YueHaibing wrote:
> Fix sparse warning:
> 
> drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c:21:31:
>  warning: symbol 'sun4i_csi_formats' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks for the patch.

This has been already addressed by another patch:

<URL:https://patchwork.linuxtv.org/patch/58395/>

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
