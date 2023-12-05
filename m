Return-Path: <linux-media+bounces-1682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C1C8057F2
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 15:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FC131C21173
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 14:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4D167E62;
	Tue,  5 Dec 2023 14:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iFENTZz5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E568A196
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 06:54:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97184844;
	Tue,  5 Dec 2023 15:53:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701788027;
	bh=NHAfvm/PaYqO+OWFkGqXq0frpT97uKDwsyW2GkggBbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFENTZz5EN9RI3NMbWmvm5UiU3AgFK3axgFWjzJ65W4cMX0bEM6MmkAjkcGsJq7Pm
	 T6xAZF4fwcdbDH4fepmt/J7SS9o4ni2j2H9ly0YmTuWbxqN0+7q/V7J+OXhj4Flz04
	 j7CNBpRIFCSp5Ayslom5owXU0y2CxSpbsoSL6480=
Date: Tue, 5 Dec 2023 16:54:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: imx415: Add more supported modes
Message-ID: <20231205145435.GA22607@pendragon.ideasonboard.com>
References: <20231205090557.298680-1-alexander.stein@ew.tq-group.com>
 <20231205090557.298680-4-alexander.stein@ew.tq-group.com>
 <20231205104509.GB17394@pendragon.ideasonboard.com>
 <12337827.O9o76ZdvQC@steina-w>
 <e14a0d97-7a99-4ad6-8938-3e0025437ed6@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e14a0d97-7a99-4ad6-8938-3e0025437ed6@wolfvision.net>

Hello,

On Tue, Dec 05, 2023 at 03:47:15PM +0100, Gerald Loacker wrote:
> Am 05.12.2023 um 12:12 schrieb Alexander Stein:
> > Am Dienstag, 5. Dezember 2023, 11:45:09 CET schrieb Laurent Pinchart:
> >> On Tue, Dec 05, 2023 at 10:05:57AM +0100, Alexander Stein wrote:
> >>> These modes are listed in section "All-pixel mode" of the datasheet
> >>> IMX415-AAQR-C (Rev. E19504, 2019/05/21).
> >>> hmax_pix and pixel_rate are taken from the comment above the mode list.
> >>>
> >>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>> ---
> >>>
> >>>  drivers/media/i2c/imx415.c | 362 +++++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 362 insertions(+)
> >>>
> >>> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> >>> index a222b9134aa2..48b8ae6d790d 100644
> >>> --- a/drivers/media/i2c/imx415.c
> >>> +++ b/drivers/media/i2c/imx415.c
> >>> @@ -445,6 +445,38 @@ static const struct imx415_clk_params imx415_clk_params[] = {
> >>>  	},
> >>>  };
> >>>
> >>> +/* all-pixel 2-lane 594 Mbps 10 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_2_594[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x0CE4 },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> >>> +	{ IMX415_TCLKPOST, 0x0067 },
> >>> +	{ IMX415_TCLKPREPARE, 0x0027 },
> >>> +	{ IMX415_TCLKTRAIL, 0x0027 },
> >>> +	{ IMX415_TCLKZERO, 0x00B7 },
> >>> +	{ IMX415_THSPREPARE, 0x002F },
> >>> +	{ IMX415_THSZERO, 0x004F },
> >>> +	{ IMX415_THSTRAIL, 0x002F },
> >>> +	{ IMX415_THSEXIT, 0x0047 },
> >>> +	{ IMX415_TLPX, 0x0027 },
> >>> +};
> >>> +
> >>> +/* all-pixel 2-lane 891 Mbps 15 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_2_891[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x0898 },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> >>> +	{ IMX415_TCLKPOST, 0x007F },
> >>> +	{ IMX415_TCLKPREPARE, 0x0037 },
> >>> +	{ IMX415_TCLKTRAIL, 0x0037 },
> >>> +	{ IMX415_TCLKZERO, 0x00F7 },
> >>> +	{ IMX415_THSPREPARE, 0x003F },
> >>> +	{ IMX415_THSZERO, 0x006F },
> >>> +	{ IMX415_THSTRAIL, 0x003F },
> >>> +	{ IMX415_THSEXIT, 0x005F },
> >>> +	{ IMX415_TLPX, 0x002F },
> >>> +};
> >>> +
> >>>  /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
> >>>  static const struct cci_reg_sequence imx415_mode_2_720[] = {
> >>>  	{ IMX415_VMAX, 0x08CA },
> >>> @@ -461,6 +493,38 @@ static const struct cci_reg_sequence imx415_mode_2_720[] = {
> >>>  	{ IMX415_TLPX, 0x0027 },
> >>>  };
> >>>
> >>> +/* all-pixel 2-lane 1782 Mbps 30 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_2_1782[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x044C },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> >>> +	{ IMX415_TCLKPOST, 0x00B7 },
> >>> +	{ IMX415_TCLKPREPARE, 0x0067 },
> >>> +	{ IMX415_TCLKTRAIL, 0x006F },
> >>> +	{ IMX415_TCLKZERO, 0x01DF },
> >>> +	{ IMX415_THSPREPARE, 0x006F },
> >>> +	{ IMX415_THSZERO, 0x00CF },
> >>> +	{ IMX415_THSTRAIL, 0x006F },
> >>> +	{ IMX415_THSEXIT, 0x00B7 },
> >>> +	{ IMX415_TLPX, 0x005F },
> >>> +};
> >>> +
> >>> +/* all-pixel 2-lane 2079 Mbps 30 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_2_2079[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x044C },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> >>> +	{ IMX415_TCLKPOST, 0x00D7 },
> >>> +	{ IMX415_TCLKPREPARE, 0x007F },
> >>> +	{ IMX415_TCLKTRAIL, 0x007F },
> >>> +	{ IMX415_TCLKZERO, 0x0237 },
> >>> +	{ IMX415_THSPREPARE, 0x0087 },
> >>> +	{ IMX415_THSZERO, 0x00EF },
> >>> +	{ IMX415_THSTRAIL, 0x0087 },
> >>> +	{ IMX415_THSEXIT, 0x00DF },
> >>> +	{ IMX415_TLPX, 0x006F },
> >>> +};
> >>> +
> >>>  /* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
> >>>  static const struct cci_reg_sequence imx415_mode_2_1440[] = {
> >>>  	{ IMX415_VMAX, 0x08CA },
> >>> @@ -477,6 +541,70 @@ static const struct cci_reg_sequence imx415_mode_2_1440[] = {
> >>>  	{ IMX415_TLPX, 0x004F },
> >>>  };
> >>>
> >>> +/* all-pixel 4-lane 594 Mbps 20 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_4_594_20fps[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x0672 },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> >>> +	{ IMX415_TCLKPOST, 0x0067 },
> >>> +	{ IMX415_TCLKPREPARE, 0x0027 },
> >>> +	{ IMX415_TCLKTRAIL, 0x0027 },
> >>> +	{ IMX415_TCLKZERO, 0x00B7 },
> >>> +	{ IMX415_THSPREPARE, 0x002F },
> >>> +	{ IMX415_THSZERO, 0x004F },
> >>> +	{ IMX415_THSTRAIL, 0x002F },
> >>> +	{ IMX415_THSEXIT, 0x0047 },
> >>> +	{ IMX415_TLPX, 0x0027 },
> >>> +};
> >>> +
> >>> +/* all-pixel 4-lane 594 Mbps 25 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_4_594_25fps[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x0528 },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> >>> +	{ IMX415_TCLKPOST, 0x0067 },
> >>> +	{ IMX415_TCLKPREPARE, 0x0027 },
> >>> +	{ IMX415_TCLKTRAIL, 0x0027 },
> >>> +	{ IMX415_TCLKZERO, 0x00B7 },
> >>> +	{ IMX415_THSPREPARE, 0x002F },
> >>> +	{ IMX415_THSZERO, 0x004F },
> >>> +	{ IMX415_THSTRAIL, 0x002F },
> >>> +	{ IMX415_THSEXIT, 0x0047 },
> >>> +	{ IMX415_TLPX, 0x0027 },
> >>> +};
> >>> +
> >>> +/* all-pixel 4-lane 720 Mbps 25 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_4_720_25fps[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x0500 },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> >>> +	{ IMX415_TCLKPOST, 0x006F },
> >>> +	{ IMX415_TCLKPREPARE, 0x002F },
> >>> +	{ IMX415_TCLKTRAIL, 0x002F },
> >>> +	{ IMX415_TCLKZERO, 0x00BF },
> >>> +	{ IMX415_THSPREPARE, 0x002F },
> >>> +	{ IMX415_THSZERO, 0x0057 },
> >>> +	{ IMX415_THSTRAIL, 0x002F },
> >>> +	{ IMX415_THSEXIT, 0x004F },
> >>> +	{ IMX415_TLPX, 0x0027 },
> >>> +};
> >>> +
> >>> +/* all-pixel 4-lane 720 Mbps 30.01 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_4_720_30fps[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x042A },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> >>> +	{ IMX415_TCLKPOST, 0x006F },
> >>> +	{ IMX415_TCLKPREPARE, 0x002F },
> >>> +	{ IMX415_TCLKTRAIL, 0x002F },
> >>> +	{ IMX415_TCLKZERO, 0x00BF },
> >>> +	{ IMX415_THSPREPARE, 0x002F },
> >>> +	{ IMX415_THSZERO, 0x0057 },
> >>> +	{ IMX415_THSTRAIL, 0x002F },
> >>> +	{ IMX415_THSEXIT, 0x004F },
> >>> +	{ IMX415_TLPX, 0x0027 },
> >>> +};
> >>> +
> >>>  /* all-pixel 4-lane 891 Mbps 30 Hz mode */
> >>>  static const struct cci_reg_sequence imx415_mode_4_891[] = {
> >>>  	{ IMX415_VMAX, 0x08CA },
> >>> @@ -493,6 +621,102 @@ static const struct cci_reg_sequence imx415_mode_4_891[] = {
> >>>  	{ IMX415_TLPX, 0x002F },
> >>>  };
> >>>
> >>> +/* all-pixel 4-lane 1440 Mbps 30.01 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_4_1440_30fps[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x042A },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> >>> +	{ IMX415_TCLKPOST, 0x009F },
> >>> +	{ IMX415_TCLKPREPARE, 0x0057 },
> >>> +	{ IMX415_TCLKTRAIL, 0x0057 },
> >>> +	{ IMX415_TCLKZERO, 0x0187 },
> >>> +	{ IMX415_THSPREPARE, 0x005F },
> >>> +	{ IMX415_THSZERO, 0x00A7 },
> >>> +	{ IMX415_THSTRAIL, 0x005F },
> >>> +	{ IMX415_THSEXIT, 0x0097 },
> >>> +	{ IMX415_TLPX, 0x004F },
> >>> +};
> >>> +
> >>> +/* all-pixel 4-lane 1440 Mbps 60.03 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_4_1440_60fps[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x0215 },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> >>> +	{ IMX415_TCLKPOST, 0x009F },
> >>> +	{ IMX415_TCLKPREPARE, 0x0057 },
> >>> +	{ IMX415_TCLKTRAIL, 0x0057 },
> >>> +	{ IMX415_TCLKZERO, 0x0187 },
> >>> +	{ IMX415_THSPREPARE, 0x005F },
> >>> +	{ IMX415_THSZERO, 0x00A7 },
> >>> +	{ IMX415_THSTRAIL, 0x005F },
> >>> +	{ IMX415_THSEXIT, 0x0097 },
> >>> +	{ IMX415_TLPX, 0x004F },
> >>> +};
> >>> +
> >>> +/* all-pixel 4-lane 1485 Mbps 60 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_4_1485[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x0226 },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> >>> +	{ IMX415_TCLKPOST, 0x00A7 },
> >>> +	{ IMX415_TCLKPREPARE, 0x0057 },
> >>> +	{ IMX415_TCLKTRAIL, 0x005F },
> >>> +	{ IMX415_TCLKZERO, 0x0197 },
> >>> +	{ IMX415_THSPREPARE, 0x005F },
> >>> +	{ IMX415_THSZERO, 0x00AF },
> >>> +	{ IMX415_THSTRAIL, 0x005F },
> >>> +	{ IMX415_THSEXIT, 0x009F },
> >>> +	{ IMX415_TLPX, 0x004F },
> >>> +};
> >>> +
> >>> +/* all-pixel 4-lane 1782 Mbps 60 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_4_1782[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x0226 },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> >>> +	{ IMX415_TCLKPOST, 0x00B7 },
> >>> +	{ IMX415_TCLKPREPARE, 0x0067 },
> >>> +	{ IMX415_TCLKTRAIL, 0x006F },
> >>> +	{ IMX415_TCLKZERO, 0x01DF },
> >>> +	{ IMX415_THSPREPARE, 0x006F },
> >>> +	{ IMX415_THSZERO, 0x00CF },
> >>> +	{ IMX415_THSTRAIL, 0x006F },
> >>> +	{ IMX415_THSEXIT, 0x00B7 },
> >>> +	{ IMX415_TLPX, 0x005F },
> >>> +};
> >>> +
> >>> +/* all-pixel 4-lane 2079 Mbps 60 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_4_2079[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x0226 },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> >>> +	{ IMX415_TCLKPOST, 0x00D7 },
> >>> +	{ IMX415_TCLKPREPARE, 0x007F },
> >>> +	{ IMX415_TCLKTRAIL, 0x007F },
> >>> +	{ IMX415_TCLKZERO, 0x0237 },
> >>> +	{ IMX415_THSPREPARE, 0x0087 },
> >>> +	{ IMX415_THSZERO, 0x00EF },
> >>> +	{ IMX415_THSTRAIL, 0x0087 },
> >>> +	{ IMX415_THSEXIT, 0x00DF },
> >>> +	{ IMX415_TLPX, 0x006F },
> >>> +};
> >>> +
> >>> +/* all-pixel 4-lane 2376 Mbps 60 Hz mode */
> >>> +static const struct cci_reg_sequence imx415_mode_4_2376[] = {
> >>> +	{ IMX415_VMAX, 0x08CA },
> >>> +	{ IMX415_HMAX, 0x016E },
> >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> >>> +	{ IMX415_TCLKPOST, 0x00E7 },
> >>> +	{ IMX415_TCLKPREPARE, 0x008F },
> >>> +	{ IMX415_TCLKTRAIL, 0x008F },
> >>> +	{ IMX415_TCLKZERO, 0x027F },
> >>> +	{ IMX415_THSPREPARE, 0x0097 },
> >>> +	{ IMX415_THSZERO, 0x010F },
> >>> +	{ IMX415_THSTRAIL, 0x0097 },
> >>> +	{ IMX415_THSEXIT, 0x00F7 },
> >>> +	{ IMX415_TLPX, 0x007F },
> >>> +};
> >>> +
> >>>  struct imx415_mode_reg_list {
> >>>  	u32 num_of_regs;
> >>>  	const struct cci_reg_sequence *regs;
> >>> @@ -536,6 +760,26 @@ struct imx415_mode {
> >>>
> >>>  /* mode configs */
> >>>  static const struct imx415_mode supported_modes[] = {
> >>> +	{
> >>> +		.lane_rate = 594000000,
> >>> +		.lanes = 2,
> >>> +		.hmax_pix = 4400,
> >>> +		.pixel_rate = 99000000,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_2_594),
> >>> +			.regs = imx415_mode_2_594,
> >>> +		},
> >>> +	},
> >>> +	{
> >>> +		.lane_rate = 891000000,
> >>> +		.lanes = 2,
> >>> +		.hmax_pix = 4400,
> >>> +		.pixel_rate = 148500000,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_2_891),
> >>> +			.regs = imx415_mode_2_891,
> >>> +		},
> >>> +	},
> >>>  	{
> >>>  		.lane_rate = 720000000,
> >>>  		.lanes = 2,
> >>> @@ -547,6 +791,24 @@ static const struct imx415_mode supported_modes[] = {
> >>>  		},
> >>>  	},
> >>>  	{
> >>> +		.lane_rate = 1782000000,
> >>> +		.lanes = 2,
> >>> +		.hmax_pix = 4400,
> >>> +		.pixel_rate = 297000000,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_2_1782),
> >>> +			.regs = imx415_mode_2_1782,
> >>> +		},
> >>> +	},	{
> >>> +		.lane_rate = 2079000000,
> >>> +		.lanes = 2,
> >>> +		.hmax_pix = 4400,
> >>> +		.pixel_rate = 304615385,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_2_2079),
> >>> +			.regs = imx415_mode_2_2079,
> >>> +		},
> >>> +	},	{
> >>>  		.lane_rate = 1440000000,
> >>>  		.lanes = 2,
> >>>  		.hmax_pix = 4510,
> >>> @@ -556,6 +818,46 @@ static const struct imx415_mode supported_modes[] = {
> >>>  			.regs = imx415_mode_2_1440,
> >>>  		},
> >>>  	},
> >>> +	{
> >>> +		.lane_rate = 594000000,
> >>> +		.lanes = 4,
> >>> +		.hmax_pix = 5500,
> >>> +		.pixel_rate = 247500000,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_594_20fps),
> >>> +			.regs = imx415_mode_4_594_20fps,
> >>> +		},
> >>> +	},
> >>> +	{
> >>> +		.lane_rate = 594000000,
> >>> +		.lanes = 4,
> >>
> >> The mode is selected from the number of data lanes and the lane rate.
> >> They're the same as the previous entry, so this entry will never be
> >> selected. Same below.
> > 
> > I noticed that as well. The datasheet lists different FPS for the same link 
> > frequency / lane combination, only HMAX being different. Right now HMAX/VMAX 
> > is fixed, so is FPS.
> > I am aware there is no way to select between these modes, but I added them for 
> > completeness.
> 
> I'd prefer to only add common and tested modes. We have to keep in mind
> that in future we may want to add more features as 12 bit support or
> HDR. Adding all modes could make this more complex.

More than that, it would also be good to start computing parameters
dynamically instead of adding lots of hardcoded values. The
IMX415_LANEMODE register value in the cci_reg_sequence arrays is a
low-hanging fruit, the register can be programmed from the number of
lanes. The CSI-2 timings would also benefit from being computed
dynamically based on the lane rate. Dynamic calculation of the HMAX and
VMAX values to achieve a particular default frame rate should be
possible too, but more importantly, they should be configurable from
userspace too.

> >>> +		.hmax_pix = 4400,
> >>> +		.pixel_rate = 247500000,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_594_25fps),
> >>> +			.regs = imx415_mode_4_594_25fps,
> >>> +		},
> >>> +	},
> >>> +	{
> >>> +		.lane_rate = 720000000,
> >>> +		.lanes = 4,
> >>> +		.hmax_pix = 4400,
> >>> +		.pixel_rate = 247500000,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_720_25fps),
> >>> +			.regs = imx415_mode_4_720_25fps,
> >>> +		},
> >>> +	},
> >>> +	{
> >>> +		.lane_rate = 720000000,
> >>> +		.lanes = 4,
> >>> +		.hmax_pix = 4510,
> >>> +		.pixel_rate = 304615385,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_720_30fps),
> >>> +			.regs = imx415_mode_4_720_30fps,
> >>> +		},
> >>> +	},
> >>>  	{
> >>>  		.lane_rate = 891000000,
> >>>  		.lanes = 4,
> >>> @@ -566,6 +868,66 @@ static const struct imx415_mode supported_modes[] = {
> >>>  			.regs = imx415_mode_4_891,
> >>>  		},
> >>>  	},
> >>> +	{
> >>> +		.lane_rate = 1440000000,
> >>> +		.lanes = 4,
> >>> +		.hmax_pix = 4510,
> >>> +		.pixel_rate = 304615385,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1440_30fps),
> >>> +			.regs = imx415_mode_4_1440_30fps,
> >>> +		},
> >>> +	},
> >>> +	{
> >>> +		.lane_rate = 1440000000,
> >>> +		.lanes = 4,
> >>> +		.hmax_pix = 4510,
> >>> +		.pixel_rate = 609230769,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1440_60fps),
> >>> +			.regs = imx415_mode_4_1440_60fps,
> >>> +		},
> >>> +	},
> >>> +	{
> >>> +		.lane_rate = 1485000000,
> >>> +		.lanes = 4,
> >>> +		.hmax_pix = 4400,
> >>> +		.pixel_rate = 594000000,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1485),
> >>> +			.regs = imx415_mode_4_1485,
> >>> +		},
> >>> +	},
> >>> +	{
> >>> +		.lane_rate = 1782000000,
> >>> +		.lanes = 4,
> >>> +		.hmax_pix = 4400,
> >>> +		.pixel_rate = 594000000,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1782),
> >>> +			.regs = imx415_mode_4_1782,
> >>> +		},
> >>> +	},
> >>> +	{
> >>> +		.lane_rate = 2079000000,
> >>> +		.lanes = 4,
> >>> +		.hmax_pix = 4400,
> >>> +		.pixel_rate = 594000000,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_2079),
> >>> +			.regs = imx415_mode_4_2079,
> >>> +		},
> >>> +	},
> >>> +	{
> >>> +		.lane_rate = 12376000000,
> >>> +		.lanes = 4,
> >>> +		.hmax_pix = 4392,
> >>> +		.pixel_rate = 891000000,
> >>> +		.reg_list = {
> >>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_2376),
> >>> +			.regs = imx415_mode_4_2376,
> >>> +		},
> >>> +	},
> >>>  };
> >>>  
> >>>  static const char *const imx415_test_pattern_menu[] = {

-- 
Regards,

Laurent Pinchart

