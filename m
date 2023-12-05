Return-Path: <linux-media+bounces-1653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BA38050F3
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 11:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C7BD1F21500
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 10:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277E841747;
	Tue,  5 Dec 2023 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gsIzHIph"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BB6B9
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 02:45:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01175844;
	Tue,  5 Dec 2023 11:44:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701773062;
	bh=BLVlU4DTil0C3IAyBlrrRQUR59E2z/oQGGd/2emHvz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gsIzHIph/SBiHBPpyckUgRb5Xud1ZLJMJ31lPEwaiOYOwMDKireedhToYJ2i4wIkH
	 gBAj7E+ma7FcxLvEBdX2AbNDYtSMK2BbFpu67F/6KMm4TbRmZ3AEStKMD1Lp8gHDno
	 GGgm4GADewcFIqfGr63p0jto9X1trf5xWC0tB1GY=
Date: Tue, 5 Dec 2023 12:45:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: imx415: Add more supported modes
Message-ID: <20231205104509.GB17394@pendragon.ideasonboard.com>
References: <20231205090557.298680-1-alexander.stein@ew.tq-group.com>
 <20231205090557.298680-4-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205090557.298680-4-alexander.stein@ew.tq-group.com>

Hi Alexander,

Thank you for the patch.

On Tue, Dec 05, 2023 at 10:05:57AM +0100, Alexander Stein wrote:
> These modes are listed in section "All-pixel mode" of the datasheet
> IMX415-AAQR-C (Rev. E19504, 2019/05/21).
> hmax_pix and pixel_rate are taken from the comment above the mode list.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/i2c/imx415.c | 362 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 362 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index a222b9134aa2..48b8ae6d790d 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -445,6 +445,38 @@ static const struct imx415_clk_params imx415_clk_params[] = {
>  	},
>  };
>  
> +/* all-pixel 2-lane 594 Mbps 10 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_2_594[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x0CE4 },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> +	{ IMX415_TCLKPOST, 0x0067 },
> +	{ IMX415_TCLKPREPARE, 0x0027 },
> +	{ IMX415_TCLKTRAIL, 0x0027 },
> +	{ IMX415_TCLKZERO, 0x00B7 },
> +	{ IMX415_THSPREPARE, 0x002F },
> +	{ IMX415_THSZERO, 0x004F },
> +	{ IMX415_THSTRAIL, 0x002F },
> +	{ IMX415_THSEXIT, 0x0047 },
> +	{ IMX415_TLPX, 0x0027 },
> +};
> +
> +/* all-pixel 2-lane 891 Mbps 15 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_2_891[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x0898 },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> +	{ IMX415_TCLKPOST, 0x007F },
> +	{ IMX415_TCLKPREPARE, 0x0037 },
> +	{ IMX415_TCLKTRAIL, 0x0037 },
> +	{ IMX415_TCLKZERO, 0x00F7 },
> +	{ IMX415_THSPREPARE, 0x003F },
> +	{ IMX415_THSZERO, 0x006F },
> +	{ IMX415_THSTRAIL, 0x003F },
> +	{ IMX415_THSEXIT, 0x005F },
> +	{ IMX415_TLPX, 0x002F },
> +};
> +
>  /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
>  static const struct cci_reg_sequence imx415_mode_2_720[] = {
>  	{ IMX415_VMAX, 0x08CA },
> @@ -461,6 +493,38 @@ static const struct cci_reg_sequence imx415_mode_2_720[] = {
>  	{ IMX415_TLPX, 0x0027 },
>  };
>  
> +/* all-pixel 2-lane 1782 Mbps 30 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_2_1782[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x044C },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> +	{ IMX415_TCLKPOST, 0x00B7 },
> +	{ IMX415_TCLKPREPARE, 0x0067 },
> +	{ IMX415_TCLKTRAIL, 0x006F },
> +	{ IMX415_TCLKZERO, 0x01DF },
> +	{ IMX415_THSPREPARE, 0x006F },
> +	{ IMX415_THSZERO, 0x00CF },
> +	{ IMX415_THSTRAIL, 0x006F },
> +	{ IMX415_THSEXIT, 0x00B7 },
> +	{ IMX415_TLPX, 0x005F },
> +};
> +
> +/* all-pixel 2-lane 2079 Mbps 30 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_2_2079[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x044C },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> +	{ IMX415_TCLKPOST, 0x00D7 },
> +	{ IMX415_TCLKPREPARE, 0x007F },
> +	{ IMX415_TCLKTRAIL, 0x007F },
> +	{ IMX415_TCLKZERO, 0x0237 },
> +	{ IMX415_THSPREPARE, 0x0087 },
> +	{ IMX415_THSZERO, 0x00EF },
> +	{ IMX415_THSTRAIL, 0x0087 },
> +	{ IMX415_THSEXIT, 0x00DF },
> +	{ IMX415_TLPX, 0x006F },
> +};
> +
>  /* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
>  static const struct cci_reg_sequence imx415_mode_2_1440[] = {
>  	{ IMX415_VMAX, 0x08CA },
> @@ -477,6 +541,70 @@ static const struct cci_reg_sequence imx415_mode_2_1440[] = {
>  	{ IMX415_TLPX, 0x004F },
>  };
>  
> +/* all-pixel 4-lane 594 Mbps 20 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_4_594_20fps[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x0672 },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> +	{ IMX415_TCLKPOST, 0x0067 },
> +	{ IMX415_TCLKPREPARE, 0x0027 },
> +	{ IMX415_TCLKTRAIL, 0x0027 },
> +	{ IMX415_TCLKZERO, 0x00B7 },
> +	{ IMX415_THSPREPARE, 0x002F },
> +	{ IMX415_THSZERO, 0x004F },
> +	{ IMX415_THSTRAIL, 0x002F },
> +	{ IMX415_THSEXIT, 0x0047 },
> +	{ IMX415_TLPX, 0x0027 },
> +};
> +
> +/* all-pixel 4-lane 594 Mbps 25 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_4_594_25fps[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x0528 },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> +	{ IMX415_TCLKPOST, 0x0067 },
> +	{ IMX415_TCLKPREPARE, 0x0027 },
> +	{ IMX415_TCLKTRAIL, 0x0027 },
> +	{ IMX415_TCLKZERO, 0x00B7 },
> +	{ IMX415_THSPREPARE, 0x002F },
> +	{ IMX415_THSZERO, 0x004F },
> +	{ IMX415_THSTRAIL, 0x002F },
> +	{ IMX415_THSEXIT, 0x0047 },
> +	{ IMX415_TLPX, 0x0027 },
> +};
> +
> +/* all-pixel 4-lane 720 Mbps 25 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_4_720_25fps[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x0500 },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> +	{ IMX415_TCLKPOST, 0x006F },
> +	{ IMX415_TCLKPREPARE, 0x002F },
> +	{ IMX415_TCLKTRAIL, 0x002F },
> +	{ IMX415_TCLKZERO, 0x00BF },
> +	{ IMX415_THSPREPARE, 0x002F },
> +	{ IMX415_THSZERO, 0x0057 },
> +	{ IMX415_THSTRAIL, 0x002F },
> +	{ IMX415_THSEXIT, 0x004F },
> +	{ IMX415_TLPX, 0x0027 },
> +};
> +
> +/* all-pixel 4-lane 720 Mbps 30.01 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_4_720_30fps[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x042A },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> +	{ IMX415_TCLKPOST, 0x006F },
> +	{ IMX415_TCLKPREPARE, 0x002F },
> +	{ IMX415_TCLKTRAIL, 0x002F },
> +	{ IMX415_TCLKZERO, 0x00BF },
> +	{ IMX415_THSPREPARE, 0x002F },
> +	{ IMX415_THSZERO, 0x0057 },
> +	{ IMX415_THSTRAIL, 0x002F },
> +	{ IMX415_THSEXIT, 0x004F },
> +	{ IMX415_TLPX, 0x0027 },
> +};
> +
>  /* all-pixel 4-lane 891 Mbps 30 Hz mode */
>  static const struct cci_reg_sequence imx415_mode_4_891[] = {
>  	{ IMX415_VMAX, 0x08CA },
> @@ -493,6 +621,102 @@ static const struct cci_reg_sequence imx415_mode_4_891[] = {
>  	{ IMX415_TLPX, 0x002F },
>  };
>  
> +/* all-pixel 4-lane 1440 Mbps 30.01 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_4_1440_30fps[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x042A },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> +	{ IMX415_TCLKPOST, 0x009F },
> +	{ IMX415_TCLKPREPARE, 0x0057 },
> +	{ IMX415_TCLKTRAIL, 0x0057 },
> +	{ IMX415_TCLKZERO, 0x0187 },
> +	{ IMX415_THSPREPARE, 0x005F },
> +	{ IMX415_THSZERO, 0x00A7 },
> +	{ IMX415_THSTRAIL, 0x005F },
> +	{ IMX415_THSEXIT, 0x0097 },
> +	{ IMX415_TLPX, 0x004F },
> +};
> +
> +/* all-pixel 4-lane 1440 Mbps 60.03 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_4_1440_60fps[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x0215 },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> +	{ IMX415_TCLKPOST, 0x009F },
> +	{ IMX415_TCLKPREPARE, 0x0057 },
> +	{ IMX415_TCLKTRAIL, 0x0057 },
> +	{ IMX415_TCLKZERO, 0x0187 },
> +	{ IMX415_THSPREPARE, 0x005F },
> +	{ IMX415_THSZERO, 0x00A7 },
> +	{ IMX415_THSTRAIL, 0x005F },
> +	{ IMX415_THSEXIT, 0x0097 },
> +	{ IMX415_TLPX, 0x004F },
> +};
> +
> +/* all-pixel 4-lane 1485 Mbps 60 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_4_1485[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x0226 },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> +	{ IMX415_TCLKPOST, 0x00A7 },
> +	{ IMX415_TCLKPREPARE, 0x0057 },
> +	{ IMX415_TCLKTRAIL, 0x005F },
> +	{ IMX415_TCLKZERO, 0x0197 },
> +	{ IMX415_THSPREPARE, 0x005F },
> +	{ IMX415_THSZERO, 0x00AF },
> +	{ IMX415_THSTRAIL, 0x005F },
> +	{ IMX415_THSEXIT, 0x009F },
> +	{ IMX415_TLPX, 0x004F },
> +};
> +
> +/* all-pixel 4-lane 1782 Mbps 60 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_4_1782[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x0226 },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> +	{ IMX415_TCLKPOST, 0x00B7 },
> +	{ IMX415_TCLKPREPARE, 0x0067 },
> +	{ IMX415_TCLKTRAIL, 0x006F },
> +	{ IMX415_TCLKZERO, 0x01DF },
> +	{ IMX415_THSPREPARE, 0x006F },
> +	{ IMX415_THSZERO, 0x00CF },
> +	{ IMX415_THSTRAIL, 0x006F },
> +	{ IMX415_THSEXIT, 0x00B7 },
> +	{ IMX415_TLPX, 0x005F },
> +};
> +
> +/* all-pixel 4-lane 2079 Mbps 60 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_4_2079[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x0226 },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> +	{ IMX415_TCLKPOST, 0x00D7 },
> +	{ IMX415_TCLKPREPARE, 0x007F },
> +	{ IMX415_TCLKTRAIL, 0x007F },
> +	{ IMX415_TCLKZERO, 0x0237 },
> +	{ IMX415_THSPREPARE, 0x0087 },
> +	{ IMX415_THSZERO, 0x00EF },
> +	{ IMX415_THSTRAIL, 0x0087 },
> +	{ IMX415_THSEXIT, 0x00DF },
> +	{ IMX415_TLPX, 0x006F },
> +};
> +
> +/* all-pixel 4-lane 2376 Mbps 60 Hz mode */
> +static const struct cci_reg_sequence imx415_mode_4_2376[] = {
> +	{ IMX415_VMAX, 0x08CA },
> +	{ IMX415_HMAX, 0x016E },
> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> +	{ IMX415_TCLKPOST, 0x00E7 },
> +	{ IMX415_TCLKPREPARE, 0x008F },
> +	{ IMX415_TCLKTRAIL, 0x008F },
> +	{ IMX415_TCLKZERO, 0x027F },
> +	{ IMX415_THSPREPARE, 0x0097 },
> +	{ IMX415_THSZERO, 0x010F },
> +	{ IMX415_THSTRAIL, 0x0097 },
> +	{ IMX415_THSEXIT, 0x00F7 },
> +	{ IMX415_TLPX, 0x007F },
> +};
> +
>  struct imx415_mode_reg_list {
>  	u32 num_of_regs;
>  	const struct cci_reg_sequence *regs;
> @@ -536,6 +760,26 @@ struct imx415_mode {
>  
>  /* mode configs */
>  static const struct imx415_mode supported_modes[] = {
> +	{
> +		.lane_rate = 594000000,
> +		.lanes = 2,
> +		.hmax_pix = 4400,
> +		.pixel_rate = 99000000,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_2_594),
> +			.regs = imx415_mode_2_594,
> +		},
> +	},
> +	{
> +		.lane_rate = 891000000,
> +		.lanes = 2,
> +		.hmax_pix = 4400,
> +		.pixel_rate = 148500000,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_2_891),
> +			.regs = imx415_mode_2_891,
> +		},
> +	},
>  	{
>  		.lane_rate = 720000000,
>  		.lanes = 2,
> @@ -547,6 +791,24 @@ static const struct imx415_mode supported_modes[] = {
>  		},
>  	},
>  	{
> +		.lane_rate = 1782000000,
> +		.lanes = 2,
> +		.hmax_pix = 4400,
> +		.pixel_rate = 297000000,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_2_1782),
> +			.regs = imx415_mode_2_1782,
> +		},
> +	},	{
> +		.lane_rate = 2079000000,
> +		.lanes = 2,
> +		.hmax_pix = 4400,
> +		.pixel_rate = 304615385,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_2_2079),
> +			.regs = imx415_mode_2_2079,
> +		},
> +	},	{
>  		.lane_rate = 1440000000,
>  		.lanes = 2,
>  		.hmax_pix = 4510,
> @@ -556,6 +818,46 @@ static const struct imx415_mode supported_modes[] = {
>  			.regs = imx415_mode_2_1440,
>  		},
>  	},
> +	{
> +		.lane_rate = 594000000,
> +		.lanes = 4,
> +		.hmax_pix = 5500,
> +		.pixel_rate = 247500000,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_594_20fps),
> +			.regs = imx415_mode_4_594_20fps,
> +		},
> +	},
> +	{
> +		.lane_rate = 594000000,
> +		.lanes = 4,

The mode is selected from the number of data lanes and the lane rate.
They're the same as the previous entry, so this entry will never be
selected. Same below.

> +		.hmax_pix = 4400,
> +		.pixel_rate = 247500000,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_594_25fps),
> +			.regs = imx415_mode_4_594_25fps,
> +		},
> +	},
> +	{
> +		.lane_rate = 720000000,
> +		.lanes = 4,
> +		.hmax_pix = 4400,
> +		.pixel_rate = 247500000,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_720_25fps),
> +			.regs = imx415_mode_4_720_25fps,
> +		},
> +	},
> +	{
> +		.lane_rate = 720000000,
> +		.lanes = 4,
> +		.hmax_pix = 4510,
> +		.pixel_rate = 304615385,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_720_30fps),
> +			.regs = imx415_mode_4_720_30fps,
> +		},
> +	},
>  	{
>  		.lane_rate = 891000000,
>  		.lanes = 4,
> @@ -566,6 +868,66 @@ static const struct imx415_mode supported_modes[] = {
>  			.regs = imx415_mode_4_891,
>  		},
>  	},
> +	{
> +		.lane_rate = 1440000000,
> +		.lanes = 4,
> +		.hmax_pix = 4510,
> +		.pixel_rate = 304615385,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1440_30fps),
> +			.regs = imx415_mode_4_1440_30fps,
> +		},
> +	},
> +	{
> +		.lane_rate = 1440000000,
> +		.lanes = 4,
> +		.hmax_pix = 4510,
> +		.pixel_rate = 609230769,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1440_60fps),
> +			.regs = imx415_mode_4_1440_60fps,
> +		},
> +	},
> +	{
> +		.lane_rate = 1485000000,
> +		.lanes = 4,
> +		.hmax_pix = 4400,
> +		.pixel_rate = 594000000,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1485),
> +			.regs = imx415_mode_4_1485,
> +		},
> +	},
> +	{
> +		.lane_rate = 1782000000,
> +		.lanes = 4,
> +		.hmax_pix = 4400,
> +		.pixel_rate = 594000000,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1782),
> +			.regs = imx415_mode_4_1782,
> +		},
> +	},
> +	{
> +		.lane_rate = 2079000000,
> +		.lanes = 4,
> +		.hmax_pix = 4400,
> +		.pixel_rate = 594000000,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_2079),
> +			.regs = imx415_mode_4_2079,
> +		},
> +	},
> +	{
> +		.lane_rate = 12376000000,
> +		.lanes = 4,
> +		.hmax_pix = 4392,
> +		.pixel_rate = 891000000,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_2376),
> +			.regs = imx415_mode_4_2376,
> +		},
> +	},
>  };
>  
>  static const char *const imx415_test_pattern_menu[] = {

-- 
Regards,

Laurent Pinchart

