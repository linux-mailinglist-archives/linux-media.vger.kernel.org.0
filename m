Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A9141E9EE
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 11:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353270AbhJAJo3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 05:44:29 -0400
Received: from mga05.intel.com ([192.55.52.43]:60521 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353256AbhJAJoR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 Oct 2021 05:44:17 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="310927039"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="310927039"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 02:42:30 -0700
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="618981713"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 02:42:28 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 81B782010B;
        Fri,  1 Oct 2021 12:42:26 +0300 (EEST)
Date:   Fri, 1 Oct 2021 12:42:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Subject: Re: [PATCH v2 2/7] media: ipu3-cio2: Set valid initial format
Message-ID: <YVbYAhc3u9IUrOha@paasikivi.fi.intel.com>
References: <20211001093344.2812707-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001093344.2812707-1-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 01, 2021 at 09:33:43AM +0000, Ricardo Ribalda wrote:
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
> v2: Suggested by Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Replace number with calculation based on width.
> 
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 38a2407645096..19c4fcabce0db 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -1136,7 +1136,8 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
>  	def_pix_fmt.height = def_bus_fmt.height;
>  	def_pix_fmt.field = def_bus_fmt.field;
>  	def_pix_fmt.num_planes = 1;
> -	def_pix_fmt.plane_fmt[0].bytesperline = def_pix_fmt.width * 2;
> +	def_pix_fmt.plane_fmt[0].bytesperline =
> +		DIV_ROUND_UP(def_bus_fmt.width, 50) * 64;

cio2_bytesperline()? :-)

-- 
Sakari Ailus
