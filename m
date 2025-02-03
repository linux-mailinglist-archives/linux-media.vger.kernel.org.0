Return-Path: <linux-media+bounces-25534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E108FA254B7
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F5891886F8F
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 08:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978752063CC;
	Mon,  3 Feb 2025 08:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uQV1JRdN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE331FC118;
	Mon,  3 Feb 2025 08:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572203; cv=none; b=mvdz92yRbvGnopSJU/PHaaRUSKMESznFSZRC4PUU5aNjrdBFge0fTPByZCW+rKGjyKH4rTgpvSvzYHLcUm1lOKcaAENsYoYrxtUCAyBxT969zl097L9CAeXvM4ROcfMvuVU6qw+xYwpewnqQAQs/4IGY8063MriUp3y2MwsxgEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572203; c=relaxed/simple;
	bh=FSEzlbiy5M1pWEDS7O1ZbKEA0xHVoAoGTVpaCBXJsBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiqRn2yuKocY8OklhC+qmsv9ofCzC2N3fJ8EBQTTBK3e1U/pUxpqWHFXjhLaBVCcZEuub/WVI0a9ahRaNkUJ7HRTNs37+PtQ+o/dw+XDBqfjfIs8PNUXiQFqXcCY3gzcO8CaP/pCz3Q/IVcqWZ4QGkANVXSAFut+UkHCQ1pcxGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uQV1JRdN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B311D664;
	Mon,  3 Feb 2025 09:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738572121;
	bh=FSEzlbiy5M1pWEDS7O1ZbKEA0xHVoAoGTVpaCBXJsBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uQV1JRdN7kYtzijkC4SZcV2uzlSTR010pGkinuQqDQ1qsm+QLCN5gsj6hsca0afgO
	 dDXEWtL+AEcOSiVGWzFjd/4WGQFQAE9brXVwiiST4C8NK6KISAhHqJ/sP/e+S0uBmM
	 XMTVWmiF6NfHPA9v4A1cTYuL19Y1i0F3KgT57fcE=
Date: Mon, 3 Feb 2025 10:43:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
	bryan.odonoghue@linaro.org, laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
	alain.volmat@foss.st.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org, alexander.stein@ew.tq-group.com,
	umang.jain@ideasonboard.com, zhi.mao@mediatek.com, festevam@denx.de,
	julien.vuillaumier@nxp.com, alice.yuan@nxp.com
Subject: Re: Re: [PATCH v2 2/4] media: ox05b1s: Add omnivision OX05B1S raw
 sensor driver
Message-ID: <20250203084309.GA12223@pendragon.ideasonboard.com>
References: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
 <20241126155100.1263946-3-mirela.rabulea@nxp.com>
 <20241127092400.GD31095@pendragon.ideasonboard.com>
 <ab1049db-67db-44e1-998e-dfd93444bb5e@nxp.com>
 <20250125002237.GB19927@pendragon.ideasonboard.com>
 <371a6b6f-6018-4b4a-a5b9-318d372768ed@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <371a6b6f-6018-4b4a-a5b9-318d372768ed@nxp.com>

Hi Mirela,

On Mon, Feb 03, 2025 at 10:02:14AM +0200, Mirela Rabulea wrote:
> Hi Laurent,
> 
> ...
> >>>> +
> >>>> +struct ox05b1s_mode {
> >>>> +     u32 index;
> >>>> +     u32 width;
> >>>> +     u32 height;
> >>>> +     u32 code;
> >>>> +     u32 bpp;
> >>>> +     u32 vts; /* default VTS */
> >>>> +     u32 hts; /* default HTS */
> >>>> +     u32 exp; /* max exposure */
> >>>> +     bool h_bin; /* horizontal binning */
> >>>> +     u32 fps;
> >>>> +     struct ox05b1s_reglist *reg_data;
> >>>> +};
> >>>> +
> ...
> >>>> +
> >>>> +static struct ox05b1s_mode ox05b1s_supported_modes[] = {
> >>>> +     {
> >>>> +             .index          = 0,
> >>>> +             .width          = 2592,
> >>>> +             .height         = 1944,
> >>>> +             .code           = MEDIA_BUS_FMT_SGRBG10_1X10,
> >>>> +             .bpp            = 10,
> >>>> +             .vts            = 0x850,
> >>>> +             .hts            = 0x2f0,
> >>>> +             .exp            = 0x850 - 8,
> >>>> +             .h_bin          = false,
> >>>> +             .fps            = 30,
> >>>> +             .reg_data       = ox05b1s_reglist_2592x1944,
> >>>> +     }, {
> >>>> +             /* sentinel */
> >>>> +     }
> >>>> +};
> >>>> +
> ...
> >>>> +
> >>>> +static int ox05b1s_set_vts(struct ox05b1s *sensor, u32 vts)
> >>>> +{
> >>>> +     u8 values[2] = { (u8)(vts >> 8) & 0xff, (u8)(vts & 0xff) };
> >>>> +
> >>>> +     return regmap_bulk_write(sensor->regmap, OX05B1S_REG_TIMING_VTS_H, values, 2);
> >>>> +}
> >>>> +
> ...
> >>>> +
> >>>> +static int ox05b1s_s_ctrl(struct v4l2_ctrl *ctrl)
> >>>> +{
> >>>> +     struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> >>>> +     struct i2c_client *client = v4l2_get_subdevdata(sd);
> >>>> +     struct ox05b1s *sensor = client_to_ox05b1s(client);
> >>>> +     u32 w = sensor->mode->width;
> >>>> +     u32 h = sensor->mode->height;
> >>>> +     int ret = 0;
> >>>> +
> >>>> +     /* apply V4L2 controls values only if power is already up */
> >>>> +     if (!pm_runtime_get_if_in_use(&client->dev))
> >>>> +             return 0;
> >>>> +
> >>>> +     /* s_ctrl holds sensor lock */
> >>>> +     switch (ctrl->id) {
> >>>> +     case V4L2_CID_VBLANK:
> >>>> +             ret = ox05b1s_set_vts(sensor, h + ctrl->val);
> >>>> +             break;
> >>>> +     case V4L2_CID_HBLANK:
> >>>> +             if (sensor->mode->h_bin)
> >>>> +                     ret = ox05b1s_set_hts(sensor, w + ctrl->val);
> >>>> +             else
> >>>> +                     ret = ox05b1s_set_hts(sensor, (w + ctrl->val) / 2);
> >>>> +             break;
> >>>> +     case V4L2_CID_PIXEL_RATE:
> >>>> +             /* Read-only, but we adjust it based on mode. */
> >>>> +             break;
> >>>> +     case V4L2_CID_ANALOGUE_GAIN:
> >>>> +             ret = ox05b1s_set_analog_gain(sensor, ctrl->val);
> >>>> +             break;
> >>>> +     case V4L2_CID_EXPOSURE:
> >>>> +             ret = ox05b1s_set_exp(sensor, ctrl->val);
> >>>> +             break;
> >>>> +     default:
> >>>> +             ret = -EINVAL;
> >>>> +             break;
> >>>> +     }
> >>>> +
> >>>> +     pm_runtime_put(&client->dev);
> >>>> +
> >>>> +     return ret;
> >>>> +}
> >>>> +
> ...
> >>>> +
> >>>> +/* Update control ranges based on current streaming mode, needs sensor lock */
> >>>> +static int ox05b1s_update_controls(struct ox05b1s *sensor)
> >>>> +{
> >>>> +     int ret;
> >>>> +     struct device *dev = &sensor->i2c_client->dev;
> >>>> +     u32 hts = sensor->mode->hts;
> >>>> +     u32 hblank;
> >>>> +     u32 vts = sensor->mode->vts;
> >>>> +     u32 vblank = vts - sensor->mode->height;
> >>>> +     u32 fps = sensor->mode->fps;
> >>>> +     u64 pixel_rate = (sensor->mode->h_bin) ? hts * vts * fps : 2 * hts * vts * fps;
> >>>
> >>> Unless the sensor adjusts the pixel rate when you write the blanking
> >>> registers, this doesn't seem correct.
> >>
> >> I'm not sure I understand.
> >>
> >> The pixel_rate value calculated here is fixed per mode, as the
> >> hts,vts,fps are the default values per mode.
> >>
> >> The hblank is basically read-only (min=max value). If vblank is changed
> >> by user, the frame rate will change, but the pixel_rate value will
> >> remain the same.
> >
> > Yes, the frame rate will change, but the fps variable above won't. It
> > will still be set to the default fps for the mode, while the actual
> > frame rate produced by the sensor will differ. The pixel rate
> > calculation here will therefore give an incorrect value.
> 
> Yes, the real frame rate produced  by the sensor is different than the 
> value that is hold in the fps field of the mode structure (that is the 
> default fps, I can add a comment to clarify that, or change the names of 
> those fields to def_fps, def_hts, def_vts). But that only happens as a 
> result of the actual vts change, and the actual vts is not used in the 
> pixel_rate calculation above, the calculation only uses the default 
> values from the mode structure.

Ah, looks like I missed that when reading the code.

> The real vts is written into the sensor 
> register when V4L2_CID_VBLANK control is changed, but the vts field in 
> the mode structure remains a default value.
> 
> Or, I could add a pixel_rate field in the ox05b1s_mode, and use that 
> instead of a formula, maybe it would be more straightforward.

I think that would be less confusing. Even better would be to calculate
the pixel rate from the PLL parameters, but Iknow there's such a thing
as too much yak shaving (even if it would be a useful improvement).

> Let me know what you think.
> 
> ...
> >>>> +     {0x0100, 0x00},
> >>>
> >>> Please use register macros for the registers that are documented.
> >>
> >> Do you mean to add a define for all register numbers in the init list,
> >> or just use the define in the init list, in case it was defined already
> >> for other usages elsewhere in the code?
> >
> > The latter, using OX05B1S_REG_SW_STB here. I'd like a macro for each
> > register in the init list, but macros such as OX05B1S_REG_0107 are
> > useless. Registers that are documented in the datasheet should be named
> > with macros, registers that are not can use numerical addresses and
> > values.
>
> Thanks, I'll add macros for the documented registers.

-- 
Regards,

Laurent Pinchart

