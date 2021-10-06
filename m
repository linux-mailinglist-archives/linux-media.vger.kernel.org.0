Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E464F424932
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 23:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhJFVwH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 17:52:07 -0400
Received: from mga04.intel.com ([192.55.52.120]:28154 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhJFVwD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 17:52:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="224881239"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="224881239"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 14:50:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="545448932"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 14:50:08 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D382520375;
        Thu,  7 Oct 2021 00:50:05 +0300 (EEST)
Date:   Thu, 7 Oct 2021 00:50:05 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Subject: Re: [PATCH v3 3/8] media: ipu3-imgu: Set valid initial format
Message-ID: <YV4aDZlJeKT2CnxT@paasikivi.fi.intel.com>
References: <20211001112522.2839602-1-ribalda@chromium.org>
 <20211001112522.2839602-4-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001112522.2839602-4-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Fri, Oct 01, 2021 at 11:25:17AM +0000, Ricardo Ribalda wrote:
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
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 38a2407645096..1813bb29e362b 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -1136,7 +1136,9 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
>  	def_pix_fmt.height = def_bus_fmt.height;
>  	def_pix_fmt.field = def_bus_fmt.field;
>  	def_pix_fmt.num_planes = 1;
> -	def_pix_fmt.plane_fmt[0].bytesperline = def_pix_fmt.width * 2;
> +	def_pix_fmt.plane_fmt[0].bytesperline =
> +		imgu_bytesperline(def_pix_fmt.width,
> +				  IMGU_ABI_FRAME_FORMAT_RAW_PACKED);


I thought this was for the CIO2 driver when reviewing it, because of the
subject at the time. ;-) The 2nd patch is very nice, thanks!

-- 
Sakari Ailus
