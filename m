Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15A0B4C430E
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 12:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239602AbiBYLGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 06:06:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbiBYLGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 06:06:41 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8C9235840;
        Fri, 25 Feb 2022 03:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645787168; x=1677323168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cNnER2dwJjeRwmhdHHCR3aquBgpk98yfshBdll1PUqw=;
  b=oASR+gB99Hlx9aZGi0uqyhDN8ZWeu35ra4YcZJywbMm8vrmvBhlJUDZG
   INsJVFFlRCzFAh5XzH1tgdAS9vMDtzmed7Nc2trv9UrGCOG+P4pPOI5MV
   sFrtj2hT8IePAxaTrchEE1ShJ9/6+a0mnAGvXLsr1T2AlfRBhM3BigkIT
   O+fmqZ1wBeOIxAKF1tgvz57DbFwlrz80i1u8v8MmacBQz4ENLQXUtF+6q
   aO9sfVFYL6xGeLDqRyrLQIVwmUL44FQi3CwAQB6+94nhi8EUnB4PLTV6L
   y1CTbdVzUyX9WzZr09djWQlO4p5Y2Y7dPKpyJIDXEtPcNp4o6xrdURjUJ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="250057281"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="250057281"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 03:06:08 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="506662682"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 03:06:05 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 85FC820482;
        Fri, 25 Feb 2022 13:06:03 +0200 (EET)
Date:   Fri, 25 Feb 2022 13:06:03 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] fixup! media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Message-ID: <Yhi4GyxEMcnBnR0u@paasikivi.fi.intel.com>
References: <YheUuCShBA6jvn8a@paasikivi.fi.intel.com>
 <20220224160020.2630632-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224160020.2630632-1-m.tretter@pengutronix.de>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 24, 2022 at 05:00:20PM +0100, Michael Tretter wrote:
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/media/i2c/isl7998x.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
> index df124a0b401c..67ff1f508717 100644
> --- a/drivers/media/i2c/isl7998x.c
> +++ b/drivers/media/i2c/isl7998x.c
> @@ -551,12 +551,11 @@ static unsigned int isl7998x_norm_to_val(v4l2_std_id norm)
>  {
>  	unsigned int i;
>  
> -	if (norm == V4L2_STD_UNKNOWN)
> -		return ISL7998X_REG_PX_DEC_SDT_STANDARD_UNKNOWN;
> -
>  	for (i = 0; i < ARRAY_SIZE(isl7998x_std_res); i++)
>  		if (isl7998x_std_res[i].norm & norm)
>  			break;
> +	if (i == ARRAY_SIZE(isl7998x_std_res))
> +		return ISL7998X_REG_PX_DEC_SDT_STANDARD_UNKNOWN;
>  
>  	return isl7998x_std_res[i].id;
>  }
> @@ -565,13 +564,12 @@ static const struct isl7998x_mode *isl7998x_norm_to_mode(v4l2_std_id norm)
>  {
>  	unsigned int i;
>  
> -	/* Use NTSC default resolution during standard detection */
> -	if (norm == V4L2_STD_UNKNOWN)
> -		return &supported_modes[1];
> -
>  	for (i = 0; i < ARRAY_SIZE(isl7998x_std_res); i++)
>  		if (isl7998x_std_res[i].norm & norm)
>  			break;
> +	/* Use NTSC default resolution during standard detection */
> +	if (i == ARRAY_SIZE(isl7998x_std_res))
> +		return &supported_modes[1];
>  
>  	return isl7998x_std_res[i].mode;
>  }

Thanks!

-- 
Sakari Ailus
