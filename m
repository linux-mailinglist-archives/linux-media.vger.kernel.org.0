Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2597F41E977
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 11:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352820AbhJAJRG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 05:17:06 -0400
Received: from mga03.intel.com ([134.134.136.65]:40199 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230000AbhJAJRD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 Oct 2021 05:17:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="225458831"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="225458831"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 02:15:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="539952628"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 02:15:17 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id BE7342010B;
        Fri,  1 Oct 2021 12:15:15 +0300 (EEST)
Date:   Fri, 1 Oct 2021 12:15:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Subject: Re: [PATCH 2/7] media: ipu3-cio2: Set valid initial format
Message-ID: <YVYrkNjkDZ9Cn/nI@paasikivi.fi.intel.com>
References: <20210928211033.2415162-1-ribalda@chromium.org>
 <20210928211033.2415162-3-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928211033.2415162-3-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Tue, Sep 28, 2021 at 09:10:28PM +0000, Ricardo Ribalda wrote:
> The initial format did not have a valid size.
> 
> Fixes v4l2-compliance:
> 
> fail: v4l2-test-formats.cpp(723): Video Output Multiplanar:
> 				  TRY_FMT(G_FMT) != G_FMT
> test VIDIOC_TRY_FMT: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 38a2407645096..fbb9eb2ba99e4 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -1136,7 +1136,7 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
>  	def_pix_fmt.height = def_bus_fmt.height;
>  	def_pix_fmt.field = def_bus_fmt.field;
>  	def_pix_fmt.num_planes = 1;
> -	def_pix_fmt.plane_fmt[0].bytesperline = def_pix_fmt.width * 2;
> +	def_pix_fmt.plane_fmt[0].bytesperline = 2496;

Please derive the value from the width, don't use a number here.

-- 
Regards,

Sakari Ailus
