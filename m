Return-Path: <linux-media+bounces-8154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8F2890EAA
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 00:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31F98B23954
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 23:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2001386A8;
	Thu, 28 Mar 2024 23:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="kcVs4Npb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta200.mxroute.com (mail-108-mta200.mxroute.com [136.175.108.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820074F888
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 23:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711669388; cv=none; b=SEaCy9LSkqf0wzbOmC/BiDSPXaxod1qA7wQRbBpCLWz3ujlup+6LJVleY2nhj0CcH4T8nIWo/PBsM/p6mwvTQoT5SmUHUo9Ey8u7AAhWEMvXKxjJha9Xqcu1RQl11dBv2L7OB5fUTd0fao0H6as2tsy8yJ78NpID1SwCDnKGdeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711669388; c=relaxed/simple;
	bh=G2g5TvMatIi9E0KafS+62jz9try3uydQIoNr5oJJg8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UblfRzCzYZL5ExCATfvlxJ7LwWU9d3bwH1xzNSOFJI9K/8f/44YgiFPmQwZ2UF2pPmfvUo9ct2LgrNgoTGcymii4mSv77SOoCCYZHOVPuUDBjPRtA7Kc5/BmSQrHN8saV+N8xR+DFinRy1E9Fexa3dktix/JeLxZzU9t9ZlyuSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=kcVs4Npb; arc=none smtp.client-ip=136.175.108.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta200.mxroute.com (ZoneMTA) with ESMTPSA id 18e8771f2dd0003bea.010
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Mar 2024 23:42:55 +0000
X-Zone-Loop: 91d8404308db42b126c946a6fc08fdb1fb66e15b197d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WXnRZJZncP5H+W4jxwoGE4gpnH8bRBwD05nPym/FeIE=; b=kcVs4NpbSx4aRZxR3TxLhgmLLF
	jXOdgXrQm5inOvbRc2Kabj9xdnKSBt1LdOBqBfUFUs4XTzKFKVqakzF4JA6XCxb8w2HDrim35RU1a
	OmIiApV362yG00Wq777351SM5+22V8Yi0IUUrYSIhs0HBomRGmkhyQx0ePsjiAAWCzwCPc1TvnqIT
	ms5iqnWZ0kMFIMlRUUc8jiLJkBYVrZi2UZA+M9UrmlxouWGro1MoJTz3VM4KBkeM+o0SxLHK/7VqX
	erQnv/v4DpUP7zqf0WP6aSnAYCLQw2Plp59ZqZ/kArWbfacF9mUKQI8dBtN3YCex4U7f7JNdyOI41
	IYdCqoSw==;
Message-ID: <493be807-819b-4871-a996-cbe0dd020065@luigi311.com>
Date: Thu, 28 Mar 2024 17:42:51 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/23] media: i2c: imx258: Add support for running on 2
 CSI data lanes
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
 jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240327231710.53188-1-git@luigi311.com>
 <20240327231710.53188-10-git@luigi311.com>
 <ZgUoH4mhl3Ol280r@kekkonen.localdomain>
From: Luigi311 <git@luigi311.com>
In-Reply-To: <ZgUoH4mhl3Ol280r@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: git@luigi311.com

On 3/28/24 02:19, Sakari Ailus wrote:
> Hi Luigi311, Dave,
> 
> On Wed, Mar 27, 2024 at 05:16:55PM -0600, git@luigi311.com wrote:
>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>
>> Extends the driver to also support 2 data lanes.
>> Frame rates are obviously more restricted on 2 lanes, but some
>> hardware simply hasn't wired more up.
>>
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> Signed-off-by: Luigi311 <git@luigi311.com>
>> ---
>>  drivers/media/i2c/imx258.c | 214 ++++++++++++++++++++++++++++++++-----
>>  1 file changed, 190 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
>> index 6ee7de079454..c65b9aad3b0a 100644
>> --- a/drivers/media/i2c/imx258.c
>> +++ b/drivers/media/i2c/imx258.c
>> @@ -86,12 +86,18 @@ struct imx258_reg_list {
>>  	const struct imx258_reg *regs;
>>  };
>>  
>> +enum {
>> +	IMX258_2_LANE_MODE,
>> +	IMX258_4_LANE_MODE,
>> +	IMX258_LANE_CONFIGS,
>> +};
>> +
>>  /* Link frequency config */
>>  struct imx258_link_freq_config {
>>  	u32 pixels_per_line;
>>  
>>  	/* PLL registers for this link frequency */
>> -	struct imx258_reg_list reg_list;
>> +	struct imx258_reg_list reg_list[IMX258_LANE_CONFIGS];
>>  };
>>  
>>  /* Mode : resolution and related config&values */
>> @@ -111,8 +117,34 @@ struct imx258_mode {
>>  	struct imx258_reg_list reg_list;
>>  };
>>  
>> -/* 4208x3120 needs 1267Mbps/lane, 4 lanes */
>> -static const struct imx258_reg mipi_1267mbps_19_2mhz[] = {
>> +/*
>> + * 4208x3120 @ 30 fps needs 1267Mbps/lane, 4 lanes.
>> + * To avoid further computation of clock settings, adopt the same per
>> + * lane data rate when using 2 lanes, thus allowing a maximum of 15fps.
>> + */
>> +static const struct imx258_reg mipi_1267mbps_19_2mhz_2l[] = {
>> +	{ 0x0136, 0x13 },
>> +	{ 0x0137, 0x33 },
>> +	{ 0x0301, 0x0A },
>> +	{ 0x0303, 0x02 },
>> +	{ 0x0305, 0x03 },
>> +	{ 0x0306, 0x00 },
>> +	{ 0x0307, 0xC6 },
>> +	{ 0x0309, 0x0A },
>> +	{ 0x030B, 0x01 },
>> +	{ 0x030D, 0x02 },
>> +	{ 0x030E, 0x00 },
>> +	{ 0x030F, 0xD8 },
>> +	{ 0x0310, 0x00 },
>> +
>> +	{ 0x0114, 0x01 },
>> +	{ 0x0820, 0x09 },
>> +	{ 0x0821, 0xa6 },
>> +	{ 0x0822, 0x66 },
>> +	{ 0x0823, 0x66 },
>> +};
>> +
>> +static const struct imx258_reg mipi_1267mbps_19_2mhz_4l[] = {
>>  	{ 0x0136, 0x13 },
>>  	{ 0x0137, 0x33 },
>>  	{ 0x0301, 0x05 },
>> @@ -126,16 +158,18 @@ static const struct imx258_reg mipi_1267mbps_19_2mhz[] = {
>>  	{ 0x030E, 0x00 },
>>  	{ 0x030F, 0xD8 },
>>  	{ 0x0310, 0x00 },
>> +
>> +	{ 0x0114, 0x03 },
>>  	{ 0x0820, 0x13 },
>>  	{ 0x0821, 0x4C },
>>  	{ 0x0822, 0xCC },
>>  	{ 0x0823, 0xCC },
>>  };
>>  
>> -static const struct imx258_reg mipi_1272mbps_24mhz[] = {
>> +static const struct imx258_reg mipi_1272mbps_24mhz_2l[] = {
>>  	{ 0x0136, 0x18 },
>>  	{ 0x0137, 0x00 },
>> -	{ 0x0301, 0x05 },
>> +	{ 0x0301, 0x0a },
>>  	{ 0x0303, 0x02 },
>>  	{ 0x0305, 0x04 },
>>  	{ 0x0306, 0x00 },
>> @@ -146,13 +180,59 @@ static const struct imx258_reg mipi_1272mbps_24mhz[] = {
>>  	{ 0x030E, 0x00 },
>>  	{ 0x030F, 0xD8 },
>>  	{ 0x0310, 0x00 },
>> +
>> +	{ 0x0114, 0x01 },
>>  	{ 0x0820, 0x13 },
>>  	{ 0x0821, 0x4C },
>>  	{ 0x0822, 0xCC },
>>  	{ 0x0823, 0xCC },
>>  };
>>  
>> -static const struct imx258_reg mipi_640mbps_19_2mhz[] = {
>> +static const struct imx258_reg mipi_1272mbps_24mhz_4l[] = {
>> +	{ 0x0136, 0x18 },
>> +	{ 0x0137, 0x00 },
>> +	{ 0x0301, 0x05 },
>> +	{ 0x0303, 0x02 },
>> +	{ 0x0305, 0x04 },
>> +	{ 0x0306, 0x00 },
>> +	{ 0x0307, 0xD4 },
>> +	{ 0x0309, 0x0A },
>> +	{ 0x030B, 0x01 },
>> +	{ 0x030D, 0x02 },
>> +	{ 0x030E, 0x00 },
>> +	{ 0x030F, 0xD8 },
>> +	{ 0x0310, 0x00 },
>> +
>> +	{ 0x0114, 0x03 },
>> +	{ 0x0820, 0x13 },
>> +	{ 0x0821, 0xE0 },
>> +	{ 0x0822, 0x00 },
>> +	{ 0x0823, 0x00 },
>> +};
>> +
>> +static const struct imx258_reg mipi_640mbps_19_2mhz_2l[] = {
>> +	{ 0x0136, 0x13 },
>> +	{ 0x0137, 0x33 },
>> +	{ 0x0301, 0x05 },
>> +	{ 0x0303, 0x02 },
>> +	{ 0x0305, 0x03 },
>> +	{ 0x0306, 0x00 },
>> +	{ 0x0307, 0x64 },
>> +	{ 0x0309, 0x0A },
>> +	{ 0x030B, 0x01 },
>> +	{ 0x030D, 0x02 },
>> +	{ 0x030E, 0x00 },
>> +	{ 0x030F, 0xD8 },
>> +	{ 0x0310, 0x00 },
>> +
>> +	{ 0x0114, 0x01 },
>> +	{ 0x0820, 0x05 },
>> +	{ 0x0821, 0x00 },
>> +	{ 0x0822, 0x00 },
>> +	{ 0x0823, 0x00 },
>> +};
>> +
>> +static const struct imx258_reg mipi_640mbps_19_2mhz_4l[] = {
>>  	{ 0x0136, 0x13 },
>>  	{ 0x0137, 0x33 },
>>  	{ 0x0301, 0x05 },
>> @@ -166,13 +246,37 @@ static const struct imx258_reg mipi_640mbps_19_2mhz[] = {
>>  	{ 0x030E, 0x00 },
>>  	{ 0x030F, 0xD8 },
>>  	{ 0x0310, 0x00 },
>> +
>> +	{ 0x0114, 0x03 },
>> +	{ 0x0820, 0x0A },
>> +	{ 0x0821, 0x00 },
>> +	{ 0x0822, 0x00 },
>> +	{ 0x0823, 0x00 },
>> +};
>> +
>> +static const struct imx258_reg mipi_642mbps_24mhz_2l[] = {
>> +	{ 0x0136, 0x18 },
>> +	{ 0x0137, 0x00 },
>> +	{ 0x0301, 0x0A },
>> +	{ 0x0303, 0x02 },
>> +	{ 0x0305, 0x04 },
>> +	{ 0x0306, 0x00 },
>> +	{ 0x0307, 0x6B },
>> +	{ 0x0309, 0x0A },
>> +	{ 0x030B, 0x01 },
>> +	{ 0x030D, 0x02 },
>> +	{ 0x030E, 0x00 },
>> +	{ 0x030F, 0xD8 },
>> +	{ 0x0310, 0x00 },
>> +
>> +	{ 0x0114, 0x01 },
>>  	{ 0x0820, 0x0A },
>>  	{ 0x0821, 0x00 },
>>  	{ 0x0822, 0x00 },
>>  	{ 0x0823, 0x00 },
>>  };
>>  
>> -static const struct imx258_reg mipi_642mbps_24mhz[] = {
>> +static const struct imx258_reg mipi_642mbps_24mhz_4l[] = {
>>  	{ 0x0136, 0x18 },
>>  	{ 0x0137, 0x00 },
>>  	{ 0x0301, 0x05 },
>> @@ -186,6 +290,8 @@ static const struct imx258_reg mipi_642mbps_24mhz[] = {
>>  	{ 0x030E, 0x00 },
>>  	{ 0x030F, 0xD8 },
>>  	{ 0x0310, 0x00 },
>> +
>> +	{ 0x0114, 0x03 },
>>  	{ 0x0820, 0x0A },
>>  	{ 0x0821, 0x00 },
>>  	{ 0x0822, 0x00 },
>> @@ -240,7 +346,6 @@ static const struct imx258_reg mode_common_regs[] = {
>>  	{ 0x5F05, 0xED },
>>  	{ 0x0112, 0x0A },
>>  	{ 0x0113, 0x0A },
>> -	{ 0x0114, 0x03 },
>>  	{ 0x0342, 0x14 },
>>  	{ 0x0343, 0xE8 },
>>  	{ 0x0344, 0x00 },
>> @@ -359,11 +464,13 @@ enum {
>>  
>>  /*
>>   * pixel_rate = link_freq * data-rate * nr_of_lanes / bits_per_sample
>> - * data rate => double data rate; number of lanes => 4; bits per pixel => 10
>> + * data rate => double data rate;
>> + * number of lanes => (configurable 2 or 4);
>> + * bits per pixel => 10
>>   */
>> -static u64 link_freq_to_pixel_rate(u64 f)
>> +static u64 link_freq_to_pixel_rate(u64 f, unsigned int nlanes)
>>  {
>> -	f *= 2 * 4;
>> +	f *= 2 * nlanes;
>>  	do_div(f, 10);
>>  
>>  	return f;
>> @@ -393,15 +500,27 @@ static const struct imx258_link_freq_config link_freq_configs_19_2[] = {
>>  	[IMX258_LINK_FREQ_1267MBPS] = {
>>  		.pixels_per_line = IMX258_PPL_DEFAULT,
>>  		.reg_list = {
>> -			.num_of_regs = ARRAY_SIZE(mipi_1267mbps_19_2mhz),
>> -			.regs = mipi_1267mbps_19_2mhz,
>> +			[IMX258_2_LANE_MODE] = {
>> +				.num_of_regs = ARRAY_SIZE(mipi_1267mbps_19_2mhz_2l),
>> +				.regs = mipi_1267mbps_19_2mhz_2l,
>> +			},
>> +			[IMX258_4_LANE_MODE] = {
>> +				.num_of_regs = ARRAY_SIZE(mipi_1267mbps_19_2mhz_4l),
>> +				.regs = mipi_1267mbps_19_2mhz_4l,
>> +			},
>>  		}
>>  	},
>>  	[IMX258_LINK_FREQ_640MBPS] = {
>>  		.pixels_per_line = IMX258_PPL_DEFAULT,
>>  		.reg_list = {
>> -			.num_of_regs = ARRAY_SIZE(mipi_640mbps_19_2mhz),
>> -			.regs = mipi_640mbps_19_2mhz,
>> +			[IMX258_2_LANE_MODE] = {
>> +				.num_of_regs = ARRAY_SIZE(mipi_640mbps_19_2mhz_2l),
>> +				.regs = mipi_640mbps_19_2mhz_2l,
>> +			},
>> +			[IMX258_4_LANE_MODE] = {
>> +				.num_of_regs = ARRAY_SIZE(mipi_640mbps_19_2mhz_4l),
>> +				.regs = mipi_640mbps_19_2mhz_4l,
>> +			},
>>  		}
>>  	},
>>  };
>> @@ -410,15 +529,27 @@ static const struct imx258_link_freq_config link_freq_configs_24[] = {
>>  	[IMX258_LINK_FREQ_1267MBPS] = {
>>  		.pixels_per_line = IMX258_PPL_DEFAULT,
>>  		.reg_list = {
>> -			.num_of_regs = ARRAY_SIZE(mipi_1272mbps_24mhz),
>> -			.regs = mipi_1272mbps_24mhz,
>> +			[IMX258_2_LANE_MODE] = {
>> +				.num_of_regs = ARRAY_SIZE(mipi_1272mbps_24mhz_2l),
>> +				.regs = mipi_1272mbps_24mhz_2l,
>> +			},
>> +			[IMX258_4_LANE_MODE] = {
>> +				.num_of_regs = ARRAY_SIZE(mipi_1272mbps_24mhz_4l),
>> +				.regs = mipi_1272mbps_24mhz_4l,
>> +			},
>>  		}
>>  	},
>>  	[IMX258_LINK_FREQ_640MBPS] = {
>>  		.pixels_per_line = IMX258_PPL_DEFAULT,
>>  		.reg_list = {
>> -			.num_of_regs = ARRAY_SIZE(mipi_642mbps_24mhz),
>> -			.regs = mipi_642mbps_24mhz,
>> +			[IMX258_2_LANE_MODE] = {
>> +				.num_of_regs = ARRAY_SIZE(mipi_642mbps_24mhz_2l),
>> +				.regs = mipi_642mbps_24mhz_2l,
>> +			},
>> +			[IMX258_4_LANE_MODE] = {
>> +				.num_of_regs = ARRAY_SIZE(mipi_642mbps_24mhz_4l),
>> +				.regs = mipi_642mbps_24mhz_4l,
>> +			},
>>  		}
>>  	},
>>  };
>> @@ -477,6 +608,7 @@ struct imx258 {
>>  
>>  	const struct imx258_link_freq_config *link_freq_configs;
>>  	const s64 *link_freq_menu_items;
>> +	unsigned int nlanes;
>>  
>>  	/*
>>  	 * Mutex for serialized access:
>> @@ -782,7 +914,7 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
>>  		__v4l2_ctrl_s_ctrl(imx258->link_freq, mode->link_freq_index);
>>  
>>  		link_freq = imx258->link_freq_menu_items[mode->link_freq_index];
>> -		pixel_rate = link_freq_to_pixel_rate(link_freq);
>> +		pixel_rate = link_freq_to_pixel_rate(link_freq, imx258->nlanes);
>>  		__v4l2_ctrl_s_ctrl_int64(imx258->pixel_rate, pixel_rate);
>>  		/* Update limits and set FPS to default */
>>  		vblank_def = imx258->cur_mode->vts_def -
>> @@ -811,11 +943,13 @@ static int imx258_start_streaming(struct imx258 *imx258)
>>  {
>>  	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
>>  	const struct imx258_reg_list *reg_list;
>> +	const struct imx258_link_freq_config *link_freq_cfg;
>>  	int ret, link_freq_index;
>>  
>>  	/* Setup PLL */
>>  	link_freq_index = imx258->cur_mode->link_freq_index;
>> -	reg_list = &imx258->link_freq_configs[link_freq_index].reg_list;
>> +	link_freq_cfg = &imx258->link_freq_configs[link_freq_index];
>> +	reg_list = &link_freq_cfg->reg_list[imx258->nlanes == 2 ? 0 : 1];
>>  	ret = imx258_write_regs(imx258, reg_list->regs, reg_list->num_of_regs);
>>  	if (ret) {
>>  		dev_err(&client->dev, "%s failed to set plls\n", __func__);
>> @@ -1033,9 +1167,11 @@ static int imx258_init_controls(struct imx258 *imx258)
>>  		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>  
>>  	pixel_rate_max =
>> -		link_freq_to_pixel_rate(imx258->link_freq_menu_items[0]);
>> +		link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
>> +					imx258->nlanes);
>>  	pixel_rate_min =
>> -		link_freq_to_pixel_rate(imx258->link_freq_menu_items[1]);
>> +		link_freq_to_pixel_rate(imx258->link_freq_menu_items[1],
>> +					imx258->nlanes);
>>  	/* By default, PIXEL_RATE is read only */
>>  	imx258->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
>>  				V4L2_CID_PIXEL_RATE,
>> @@ -1132,6 +1268,10 @@ static int imx258_get_regulators(struct imx258 *imx258,
>>  static int imx258_probe(struct i2c_client *client)
>>  {
>>  	struct imx258 *imx258;
>> +	struct fwnode_handle *endpoint;
>> +	struct v4l2_fwnode_endpoint ep = {
>> +		.bus_type = V4L2_MBUS_CSI2_DPHY
>> +	};
>>  	int ret;
>>  	u32 val = 0;
>>  
>> @@ -1172,13 +1312,35 @@ static int imx258_probe(struct i2c_client *client)
>>  		return -EINVAL;
>>  	}
>>  
>> +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
>> +	if (!endpoint) {
>> +		dev_err(&client->dev, "Endpoint node not found\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
> 
> Here you're obtaining the list of supported link frequencies from the
> firmware but it is not validated (nor it was validated by the driver
> previously). I'd regard that a driver bug but fixing it at this point could
> introduce adverse effects elsewhere.
> 
> I think what I'd do here is that I'd ignore the issue if there are no
> frequencies defined for the endpoint but if there are, then enable only
> those that are listed in the endpoint.
> 
> Could you add a patch to do this, please? v4l2_link_freq_to_bitmap() has
> been recently added to facilitate this.
> 

I can give this a try, it would be similar to this patch that you submitted
earlier for the imx319 here
https://github.com/torvalds/linux/commit/726a09c1b6890887b7388745a26c8e93867780ca
right? 

>> +	fwnode_handle_put(endpoint);
>> +	if (ret) {
>> +		dev_err(&client->dev, "Parsing endpoint node failed\n");
>> +		return ret;
>> +	}
>> +
>> +	/* Get number of data lanes */
>> +	imx258->nlanes = ep.bus.mipi_csi2.num_data_lanes;
>> +	if (imx258->nlanes != 2 && imx258->nlanes != 4) {
>> +		dev_err(&client->dev, "Invalid data lanes: %u\n",
>> +			imx258->nlanes);
>> +		ret = -EINVAL;
>> +		goto error_endpoint_free;
>> +	}
>> +
>>  	/* Initialize subdev */
>>  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
>>  
>>  	/* Will be powered off via pm_runtime_idle */
>>  	ret = imx258_power_on(&client->dev);
>>  	if (ret)
>> -		return ret;
>> +		goto error_endpoint_free;
>>  
>>  	/* Check module identity */
>>  	ret = imx258_identify_module(imx258);
>> @@ -1211,6 +1373,7 @@ static int imx258_probe(struct i2c_client *client)
>>  	pm_runtime_set_active(&client->dev);
>>  	pm_runtime_enable(&client->dev);
>>  	pm_runtime_idle(&client->dev);
>> +	v4l2_fwnode_endpoint_free(&ep);
>>  
>>  	return 0;
>>  
>> @@ -1223,6 +1386,9 @@ static int imx258_probe(struct i2c_client *client)
>>  error_identify:
>>  	imx258_power_off(&client->dev);
>>  
>> +error_endpoint_free:
>> +	v4l2_fwnode_endpoint_free(&ep);
>> +
>>  	return ret;
>>  }
>>  
> 


