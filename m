Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6031677E27
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 15:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbjAWOe4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 09:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbjAWOev (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 09:34:51 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB5A421C
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 06:34:49 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="313945624"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="313945624"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 06:34:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="663617258"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="663617258"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2023 06:34:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pJxtX-00DmTF-29;
        Mon, 23 Jan 2023 16:33:59 +0200
Date:   Mon, 23 Jan 2023 16:33:59 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 11/57] media: atomisp: Remove no longer used binning info
 from sensor resolution info
Message-ID: <Y86a12t/LYcFtA+s@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-12-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-12-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:19PM +0100, Hans de Goede wrote:
> Remove the no longer used bin_factor_x, bin_factor_y and bin_mode members
> from the resolution info inside various atomisp camera sensor drivers.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/gc0310.h    |  6 --
>  drivers/staging/media/atomisp/i2c/gc2235.h    | 27 ---------
>  drivers/staging/media/atomisp/i2c/mt9m114.h   | 12 ----
>  drivers/staging/media/atomisp/i2c/ov2680.h    | 39 ------------
>  drivers/staging/media/atomisp/i2c/ov2722.h    | 30 ----------
>  .../staging/media/atomisp/i2c/ov5693/ov5693.h | 60 -------------------
>  6 files changed, 174 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
> index 2a559b0d474d..cae480ae6fba 100644
> --- a/drivers/staging/media/atomisp/i2c/gc0310.h
> +++ b/drivers/staging/media/atomisp/i2c/gc0310.h
> @@ -123,9 +123,6 @@ struct gc0310_resolution {
>  	u32 skip_frames;
>  	u16 pixels_per_line;
>  	u16 lines_per_frame;
> -	u8 bin_factor_x;
> -	u8 bin_factor_y;
> -	u8 bin_mode;
>  	bool used;
>  };
>  
> @@ -386,9 +383,6 @@ static struct gc0310_resolution gc0310_res_preview[] = {
>  		.pixels_per_line = 0x0314,
>  		.lines_per_frame = 0x0213,
>  #endif
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.skip_frames = 2,
>  		.regs = gc0310_VGA_30fps,
>  	},
> diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
> index 8e33eb166bed..55ea422291ba 100644
> --- a/drivers/staging/media/atomisp/i2c/gc2235.h
> +++ b/drivers/staging/media/atomisp/i2c/gc2235.h
> @@ -134,9 +134,6 @@ struct gc2235_resolution {
>  	u32 skip_frames;
>  	u16 pixels_per_line;
>  	u16 lines_per_frame;
> -	u8 bin_factor_x;
> -	u8 bin_factor_y;
> -	u8 bin_mode;
>  	bool used;
>  };
>  
> @@ -536,9 +533,6 @@ static struct gc2235_resolution gc2235_res_preview[] = {
>  		.used = 0,
>  		.pixels_per_line = 2132,
>  		.lines_per_frame = 1068,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = gc2235_1600_900_30fps,
>  	},
> @@ -552,9 +546,6 @@ static struct gc2235_resolution gc2235_res_preview[] = {
>  		.used = 0,
>  		.pixels_per_line = 2132,
>  		.lines_per_frame = 1368,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = gc2235_1616_1082_30fps,
>  	},
> @@ -567,9 +558,6 @@ static struct gc2235_resolution gc2235_res_preview[] = {
>  		.used = 0,
>  		.pixels_per_line = 2132,
>  		.lines_per_frame = 1368,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = gc2235_1616_1216_30fps,
>  	},
> @@ -593,9 +581,6 @@ static struct gc2235_resolution gc2235_res_still[] = {
>  		.used = 0,
>  		.pixels_per_line = 2132,
>  		.lines_per_frame = 1068,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = gc2235_1600_900_30fps,
>  	},
> @@ -608,9 +593,6 @@ static struct gc2235_resolution gc2235_res_still[] = {
>  		.used = 0,
>  		.pixels_per_line = 2132,
>  		.lines_per_frame = 1368,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = gc2235_1616_1082_30fps,
>  	},
> @@ -623,9 +605,6 @@ static struct gc2235_resolution gc2235_res_still[] = {
>  		.used = 0,
>  		.pixels_per_line = 2132,
>  		.lines_per_frame = 1368,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = gc2235_1616_1216_30fps,
>  	},
> @@ -644,9 +623,6 @@ static struct gc2235_resolution gc2235_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 1828,
>  		.lines_per_frame = 888,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = gc2235_1296_736_30fps,
>  	},
> @@ -659,9 +635,6 @@ static struct gc2235_resolution gc2235_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 1492,
>  		.lines_per_frame = 792,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = gc2235_960_640_30fps,
>  	},
> diff --git a/drivers/staging/media/atomisp/i2c/mt9m114.h b/drivers/staging/media/atomisp/i2c/mt9m114.h
> index 831875071cbb..b0cd1b724394 100644
> --- a/drivers/staging/media/atomisp/i2c/mt9m114.h
> +++ b/drivers/staging/media/atomisp/i2c/mt9m114.h
> @@ -316,9 +316,6 @@ struct mt9m114_res_struct {
>  	struct regval_list *regs;
>  	u16 pixels_per_line;
>  	u16 lines_per_frame;
> -	u8 bin_factor_x;
> -	u8 bin_factor_y;
> -	u8 bin_mode;
>  };
>  
>  /* 2 bytes used for address: 256 bytes total */
> @@ -350,9 +347,6 @@ static struct mt9m114_res_struct mt9m114_res[] = {
>  
>  		.pixels_per_line = 0x0640,
>  		.lines_per_frame = 0x0307,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  	},
>  	{
>  		.desc	= "848P",
> @@ -366,9 +360,6 @@ static struct mt9m114_res_struct mt9m114_res[] = {
>  
>  		.pixels_per_line = 0x0640,
>  		.lines_per_frame = 0x03E8,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  	},
>  	{
>  		.desc	= "960P",
> @@ -382,9 +373,6 @@ static struct mt9m114_res_struct mt9m114_res[] = {
>  
>  		.pixels_per_line = 0x0644, /* consistent with regs arrays */
>  		.lines_per_frame = 0x03E5, /* consistent with regs arrays */
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  	},
>  };
>  
> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
> index 2bc350c67711..596e14453fb3 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
> @@ -147,9 +147,6 @@ struct ov2680_resolution {
>  	u32 skip_frames;
>  	u16 pixels_per_line;
>  	u16 lines_per_frame;
> -	u8 bin_factor_x;
> -	u8 bin_factor_y;
> -	u8 bin_mode;
>  };
>  
>  struct ov2680_format {
> @@ -758,9 +755,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.fps = 30,
>  		.pixels_per_line = 1698,//1704,
>  		.lines_per_frame = 1294,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2680_1616x1216_30fps,
>  	},
> @@ -771,9 +765,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.fps = 30,
>  		.pixels_per_line = 1698,//1704,
>  		.lines_per_frame = 1294,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2680_1616x1082_30fps,
>  	},
> @@ -784,9 +775,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.pix_clk_freq = 66,
>  		.pixels_per_line = 1698,//1704,
>  		.lines_per_frame = 1294,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2680_1616x916_30fps,
>  	},
> @@ -797,9 +785,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.pix_clk_freq = 66,
>  		.pixels_per_line = 1698,//1704,
>  		.lines_per_frame = 1294,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2680_1456x1096_30fps,
>  	},
> @@ -810,9 +795,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.pix_clk_freq = 66,
>  		.pixels_per_line = 1698,//1704,
>  		.lines_per_frame = 1294,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2680_1296x976_30fps,
>  	},
> @@ -823,9 +805,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.pix_clk_freq = 66,
>  		.pixels_per_line = 1698,//1704,
>  		.lines_per_frame = 1294,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2680_720p_30fps,
>  	},
> @@ -836,9 +815,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.pix_clk_freq = 66,
>  		.pixels_per_line = 1698,//1704,
>  		.lines_per_frame = 1294,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2680_800x600_30fps,
>  	},
> @@ -849,9 +825,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.pix_clk_freq = 66,
>  		.pixels_per_line = 1698,//1704,
>  		.lines_per_frame = 1294,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2680_720x592_30fps,
>  	},
> @@ -862,9 +835,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.pix_clk_freq = 66,
>  		.pixels_per_line = 1698,//1704,
>  		.lines_per_frame = 1294,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2680_656x496_30fps,
>  	},
> @@ -875,9 +845,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.pix_clk_freq = 66,
>  		.pixels_per_line = 1698,//1704,
>  		.lines_per_frame = 1294,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2680_QVGA_30fps,
>  	},
> @@ -888,9 +855,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.pix_clk_freq = 66,
>  		.pixels_per_line = 1698,//1704,
>  		.lines_per_frame = 1294,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2680_CIF_30fps,
>  	},
> @@ -901,9 +865,6 @@ static struct ov2680_resolution ov2680_res_preview[] = {
>  		.pix_clk_freq = 66,
>  		.pixels_per_line = 1698,//1704,
>  		.lines_per_frame = 1294,
> -		.bin_factor_x = 0,
> -		.bin_factor_y = 0,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2680_QCIF_30fps,
>  	},
> diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
> index 5802cdb0e90c..020743a944c4 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2722.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2722.h
> @@ -177,9 +177,6 @@ struct ov2722_resolution {
>  	u32 skip_frames;
>  	u16 pixels_per_line;
>  	u16 lines_per_frame;
> -	u8 bin_factor_x;
> -	u8 bin_factor_y;
> -	u8 bin_mode;
>  	bool used;
>  	int mipi_freq;
>  };
> @@ -1109,9 +1106,6 @@ static struct ov2722_resolution ov2722_res_preview[] = {
>  		.used = 0,
>  		.pixels_per_line = 2260,
>  		.lines_per_frame = 1244,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2722_1632_1092_30fps,
>  		.mipi_freq = 422400,
> @@ -1125,9 +1119,6 @@ static struct ov2722_resolution ov2722_res_preview[] = {
>  		.used = 0,
>  		.pixels_per_line = 2260,
>  		.lines_per_frame = 1244,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2722_1452_1092_30fps,
>  		.mipi_freq = 422400,
> @@ -1141,9 +1132,6 @@ static struct ov2722_resolution ov2722_res_preview[] = {
>  		.used = 0,
>  		.pixels_per_line = 2068,
>  		.lines_per_frame = 1114,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2722_1080p_30fps,
>  		.mipi_freq = 345600,
> @@ -1167,9 +1155,6 @@ struct ov2722_resolution ov2722_res_still[] = {
>  		.used = 0,
>  		.pixels_per_line = 2260,
>  		.lines_per_frame = 1244,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2722_1632_1092_30fps,
>  		.mipi_freq = 422400,
> @@ -1183,9 +1168,6 @@ struct ov2722_resolution ov2722_res_still[] = {
>  		.used = 0,
>  		.pixels_per_line = 2260,
>  		.lines_per_frame = 1244,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2722_1452_1092_30fps,
>  		.mipi_freq = 422400,
> @@ -1199,9 +1181,6 @@ struct ov2722_resolution ov2722_res_still[] = {
>  		.used = 0,
>  		.pixels_per_line = 2068,
>  		.lines_per_frame = 1114,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2722_1080p_30fps,
>  		.mipi_freq = 345600,
> @@ -1220,9 +1199,6 @@ struct ov2722_resolution ov2722_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 2048,
>  		.lines_per_frame = 1184,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2722_QVGA_30fps,
>  		.mipi_freq = 364800,
> @@ -1236,9 +1212,6 @@ struct ov2722_resolution ov2722_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 2048,
>  		.lines_per_frame = 1184,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2722_480P_30fps,
>  	},
> @@ -1251,9 +1224,6 @@ struct ov2722_resolution ov2722_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 2068,
>  		.lines_per_frame = 1114,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.skip_frames = 3,
>  		.regs = ov2722_1080p_30fps,
>  		.mipi_freq = 345600,
> diff --git a/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h b/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
> index c9b9dc780f96..5e17eaf8fd6e 100644
> --- a/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
> +++ b/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
> @@ -198,9 +198,6 @@ struct ov5693_resolution {
>  	int pix_clk_freq;
>  	u16 pixels_per_line;
>  	u16 lines_per_frame;
> -	u8 bin_factor_x;
> -	u8 bin_factor_y;
> -	u8 bin_mode;
>  	bool used;
>  };
>  
> @@ -1109,9 +1106,6 @@ static struct ov5693_resolution ov5693_res_preview[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.regs = ov5693_736x496_30fps,
>  	},
>  	{
> @@ -1123,9 +1117,6 @@ static struct ov5693_resolution ov5693_res_preview[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.regs = ov5693_1616x1216_30fps,
>  	},
>  	{
> @@ -1137,9 +1128,6 @@ static struct ov5693_resolution ov5693_res_preview[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.regs = ov5693_2576x1456_30fps,
>  	},
>  	{
> @@ -1151,9 +1139,6 @@ static struct ov5693_resolution ov5693_res_preview[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.regs = ov5693_2576x1936_30fps,
>  	},
>  };
> @@ -1175,9 +1160,6 @@ struct ov5693_resolution ov5693_res_still[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.regs = ov5693_736x496_30fps,
>  	},
>  	{
> @@ -1189,9 +1171,6 @@ struct ov5693_resolution ov5693_res_still[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.regs = ov5693_1424x1168_30fps,
>  	},
>  	{
> @@ -1203,9 +1182,6 @@ struct ov5693_resolution ov5693_res_still[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.regs = ov5693_1616x1216_30fps,
>  	},
>  	{
> @@ -1217,9 +1193,6 @@ struct ov5693_resolution ov5693_res_still[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.regs = ov5693_2592x1456_30fps,
>  	},
>  	{
> @@ -1231,9 +1204,6 @@ struct ov5693_resolution ov5693_res_still[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.regs = ov5693_2592x1944_30fps,
>  	},
>  };
> @@ -1250,9 +1220,6 @@ struct ov5693_resolution ov5693_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 2,
> -		.bin_factor_y = 2,
> -		.bin_mode = 1,
>  		.regs = ov5693_736x496,
>  	},
>  	{
> @@ -1264,9 +1231,6 @@ struct ov5693_resolution ov5693_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 2,
> -		.bin_factor_y = 2,
> -		.bin_mode = 1,
>  		.regs = ov5693_336x256,
>  	},
>  	{
> @@ -1278,9 +1242,6 @@ struct ov5693_resolution ov5693_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 2,
> -		.bin_factor_y = 2,
> -		.bin_mode = 1,
>  		.regs = ov5693_368x304,
>  	},
>  	{
> @@ -1292,9 +1253,6 @@ struct ov5693_resolution ov5693_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 2,
> -		.bin_factor_y = 2,
> -		.bin_mode = 1,
>  		.regs = ov5693_192x160,
>  	},
>  	{
> @@ -1306,9 +1264,6 @@ struct ov5693_resolution ov5693_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 2,
> -		.bin_factor_y = 2,
> -		.bin_mode = 0,
>  		.regs = ov5693_1296x736,
>  	},
>  	{
> @@ -1320,9 +1275,6 @@ struct ov5693_resolution ov5693_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 2,
> -		.bin_factor_y = 2,
> -		.bin_mode = 0,
>  		.regs = ov5693_1296x976,
>  	},
>  	{
> @@ -1334,9 +1286,6 @@ struct ov5693_resolution ov5693_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.regs = ov5693_1636p_30fps,
>  	},
>  	{
> @@ -1348,9 +1297,6 @@ struct ov5693_resolution ov5693_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.regs = ov5693_1940x1096,
>  	},
>  	{
> @@ -1362,9 +1308,6 @@ struct ov5693_resolution ov5693_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.regs = ov5693_2592x1456_30fps,
>  	},
>  	{
> @@ -1376,9 +1319,6 @@ struct ov5693_resolution ov5693_res_video[] = {
>  		.used = 0,
>  		.pixels_per_line = 2688,
>  		.lines_per_frame = 1984,
> -		.bin_factor_x = 1,
> -		.bin_factor_y = 1,
> -		.bin_mode = 0,
>  		.regs = ov5693_2592x1944_30fps,
>  	},
>  };
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


