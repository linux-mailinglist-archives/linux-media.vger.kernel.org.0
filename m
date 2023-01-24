Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0C16795AF
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 11:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbjAXKsd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 05:48:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjAXKs3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 05:48:29 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB32234EF
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 02:47:57 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388614282"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="388614282"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:46:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="730637804"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="730637804"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 24 Jan 2023 02:46:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pKGp5-00EIVo-0B;
        Tue, 24 Jan 2023 12:46:39 +0200
Date:   Tue, 24 Jan 2023 12:46:38 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 42/57] media: atomisp: ov2680: Remove unused data-types
 and defines from ov2680.h
Message-ID: <Y8+3DqjeJFCjp+k1@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-43-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-43-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:50PM +0100, Hans de Goede wrote:
> Remove a bunch of unused data-types and defines from ov2680.h.

Good patch!
Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/ov2680.h | 60 ----------------------
>  1 file changed, 60 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
> index 20ef59928cb1..189d1b2b7584 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
> @@ -46,45 +46,11 @@
>  
>  #define OV2680_FOCAL_LENGTH_NUM	334	/*3.34mm*/
>  
> -#define OV2680_BIN_FACTOR_MAX 4
> -
>  #define MAX_FMTS		1
>  
> -/* sensor_mode_data read_mode adaptation */
> -#define OV2680_READ_MODE_BINNING_ON	0x0400
> -#define OV2680_READ_MODE_BINNING_OFF	0x00
>  #define OV2680_INTEGRATION_TIME_MARGIN	8
> -
> -#define OV2680_MAX_EXPOSURE_VALUE	0xFFF1
> -#define OV2680_MAX_GAIN_VALUE		0xFF
> -
> -/*
> - * focal length bits definition:
> - * bits 31-16: numerator, bits 15-0: denominator
> - */
> -#define OV2680_FOCAL_LENGTH_DEFAULT 0x1B70064
> -
> -/*
> - * current f-number bits definition:
> - * bits 31-16: numerator, bits 15-0: denominator
> - */
> -#define OV2680_F_NUMBER_DEFAULT 0x18000a
> -
> -/*
> - * f-number range bits definition:
> - * bits 31-24: max f-number numerator
> - * bits 23-16: max f-number denominator
> - * bits 15-8: min f-number numerator
> - * bits 7-0: min f-number denominator
> - */
> -#define OV2680_F_NUMBER_RANGE 0x180a180a
>  #define OV2680_ID	0x2680
>  
> -#define OV2680_FINE_INTG_TIME_MIN 0
> -#define OV2680_FINE_INTG_TIME_MAX_MARGIN 0
> -#define OV2680_COARSE_INTG_TIME_MIN 1
> -#define OV2680_COARSE_INTG_TIME_MAX_MARGIN 6
> -
>  /*
>   * OV2680 System control registers
>   */
> @@ -147,19 +113,6 @@
>  #define OV2680_START_STREAMING			0x01
>  #define OV2680_STOP_STREAMING			0x00
>  
> -#define OV2680_INVALID_CONFIG	0xffffffff
> -
> -struct regval_list {
> -	u16 reg_num;
> -	u8 value;
> -};
> -
> -struct ov2680_format {
> -	u8 *desc;
> -	u32 pixelformat;
> -	struct ov2680_reg *regs;
> -};
> -
>  /*
>   * ov2680 device structure.
>   */
> @@ -216,18 +169,6 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
>  			     ctrls.handler)->sd;
>  }
>  
> -#define OV2680_MAX_WRITE_BUF_SIZE	30
> -
> -struct ov2680_write_buffer {
> -	u16 addr;
> -	u8 data[OV2680_MAX_WRITE_BUF_SIZE];
> -};
> -
> -struct ov2680_write_ctrl {
> -	int index;
> -	struct ov2680_write_buffer buffer;
> -};
> -
>  static struct ov2680_reg const ov2680_global_setting[] = {
>  	{0x0103, 0x01},
>  	{0x3002, 0x00},
> @@ -304,7 +245,6 @@ static struct ov2680_reg const ov2680_global_setting[] = {
>  	{0x5793, 0x00},
>  	{0x5794, 0x03}, //based OV2680_R1A_AM10.ovt,Adjust DPC setting (57xx) on 14/06/13
>  	{0x0100, 0x00},	//stream off
> -
>  	{}
>  };
>  
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


