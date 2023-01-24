Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD676795BB
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 11:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbjAXKtc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 05:49:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233125AbjAXKtY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 05:49:24 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E262442C0
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 02:49:11 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="306621877"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="306621877"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804543606"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="804543606"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2023 02:49:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pKGrN-00EIZN-2m;
        Tue, 24 Jan 2023 12:49:01 +0200
Date:   Tue, 24 Jan 2023 12:49:01 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 44/57] media: atomisp: ov2680: Consistently indent define
 values
Message-ID: <Y8+3nedqWqYgqjEP@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-45-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-45-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:52PM +0100, Hans de Goede wrote:
> Use the same indentation level for all #define values.

Can we at the same time add spaces surround the text?
With that,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/ov2680.h | 36 +++++++++++-----------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
> index 5aa46f669715..f0641dd611c3 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
> @@ -44,10 +44,10 @@
>  /* If possible send 16 extra rows / lines to the ISP as padding */
>  #define OV2680_END_MARGIN			16
>  
> -#define OV2680_FOCAL_LENGTH_NUM	334	/*3.34mm*/
> +#define OV2680_FOCAL_LENGTH_NUM			334	/*3.34mm*/
>  
> -#define OV2680_INTEGRATION_TIME_MARGIN	8
> -#define OV2680_ID	0x2680
> +#define OV2680_INTEGRATION_TIME_MARGIN		8
> +#define OV2680_ID				0x2680
>  
>  /*
>   * OV2680 System control registers
> @@ -61,23 +61,23 @@
>  #define OV2680_SC_CMMN_SCCB_ID			0x302B /* 0x300C*/
>  #define OV2680_SC_CMMN_SUB_ID			0x302A /* process, version*/
>  
> -#define OV2680_GROUP_ACCESS							0x3208 /*Bit[7:4] Group control, Bit[3:0] Group ID*/
> +#define OV2680_GROUP_ACCESS			0x3208 /*Bit[7:4] Group control, Bit[3:0] Group ID*/
>  
>  #define OV2680_REG_EXPOSURE_PK_HIGH		0x3500
>  #define OV2680_REG_GAIN_PK			0x350a
>  
> -#define OV2680_HORIZONTAL_START_H					0x3800 /*Bit[11:8]*/
> -#define OV2680_HORIZONTAL_START_L					0x3801 /*Bit[7:0]*/
> -#define OV2680_VERTICAL_START_H						0x3802 /*Bit[11:8]*/
> -#define OV2680_VERTICAL_START_L						0x3803 /*Bit[7:0]*/
> -#define OV2680_HORIZONTAL_END_H						0x3804 /*Bit[11:8]*/
> -#define OV2680_HORIZONTAL_END_L						0x3805 /*Bit[7:0]*/
> -#define OV2680_VERTICAL_END_H						0x3806 /*Bit[11:8]*/
> -#define OV2680_VERTICAL_END_L						0x3807 /*Bit[7:0]*/
> -#define OV2680_HORIZONTAL_OUTPUT_SIZE_H				0x3808 /*Bit[3:0]*/
> -#define OV2680_HORIZONTAL_OUTPUT_SIZE_L				0x3809 /*Bit[7:0]*/
> -#define OV2680_VERTICAL_OUTPUT_SIZE_H				0x380a /*Bit[3:0]*/
> -#define OV2680_VERTICAL_OUTPUT_SIZE_L				0x380b /*Bit[7:0]*/
> +#define OV2680_HORIZONTAL_START_H		0x3800 /*Bit[11:8]*/
> +#define OV2680_HORIZONTAL_START_L		0x3801 /*Bit[7:0]*/
> +#define OV2680_VERTICAL_START_H			0x3802 /*Bit[11:8]*/
> +#define OV2680_VERTICAL_START_L			0x3803 /*Bit[7:0]*/
> +#define OV2680_HORIZONTAL_END_H			0x3804 /*Bit[11:8]*/
> +#define OV2680_HORIZONTAL_END_L			0x3805 /*Bit[7:0]*/
> +#define OV2680_VERTICAL_END_H			0x3806 /*Bit[11:8]*/
> +#define OV2680_VERTICAL_END_L			0x3807 /*Bit[7:0]*/
> +#define OV2680_HORIZONTAL_OUTPUT_SIZE_H		0x3808 /*Bit[3:0]*/
> +#define OV2680_HORIZONTAL_OUTPUT_SIZE_L		0x3809 /*Bit[7:0]*/
> +#define OV2680_VERTICAL_OUTPUT_SIZE_H		0x380a /*Bit[3:0]*/
> +#define OV2680_VERTICAL_OUTPUT_SIZE_L		0x380b /*Bit[7:0]*/
>  #define OV2680_HTS_H				0x380c
>  #define OV2680_HTS_L				0x380d
>  #define OV2680_VTS_H				0x380e
> @@ -89,7 +89,7 @@
>  #define OV2680_X_INC				0x3814
>  #define OV2680_Y_INC				0x3815
>  
> -#define OV2680_FRAME_OFF_NUM						0x4202
> +#define OV2680_FRAME_OFF_NUM			0x4202
>  
>  /*Flip/Mirror*/
>  #define OV2680_REG_FORMAT1			0x3820
> @@ -98,7 +98,7 @@
>  #define OV2680_MWB_RED_GAIN_H			0x5004/*0x3400*/
>  #define OV2680_MWB_GREEN_GAIN_H			0x5006/*0x3402*/
>  #define OV2680_MWB_BLUE_GAIN_H			0x5008/*0x3404*/
> -#define OV2680_MWB_GAIN_MAX				0x0fff
> +#define OV2680_MWB_GAIN_MAX			0x0fff
>  
>  #define OV2680_REG_ISP_CTRL00			0x5080
>  
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


