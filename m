Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1743D0983
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 09:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234528AbhGUGdQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 02:33:16 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:50525 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233874AbhGUGbf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 02:31:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 66Ommzk4Fhqx966Onmy3Y1; Wed, 21 Jul 2021 09:12:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626851531; bh=rNNXU02X4hihwVI/LiiI8BRVwsxzT7xoZ9gSrP2oRHo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=U8YEEmGej896TY3/TwuTril312KexV2BNmhBo1Fv40Kb0x96N7FUi2dNqZs5KKr9z
         FKgezb/9R8R7uXiZtL13vaqmBr6Ta7yb23ooBCxtX8C8n7lbnUeXrZ4dAD0aFd32gY
         2K3Da5/fHwkGWloTf533Y5cFwQaUhAc5a+tlaH6nE+pB0h3fTPTTKawxxjU61hezeC
         TT52fj30Q3MZhVQfiIQuCTT36gtPTa4LXCe4eiB/x1PvYC7T8hLR5AKwZmb0CzSyYe
         gMHH+vCi0blCVwC4iXiWd6fLgTsA6mvYJWnGYoQr9JdkPVDCzHu24dok4Z/QA0P5rS
         nlEQIN5mnD98Q==
Subject: Re: [PATCH REPOST] TDA1997x: replace video detection routine
To:     =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
References: <m3k0lmejlw.fsf@t19.piap.pl>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <68bd6e41-4c32-240f-aa83-fd2b96929d45@xs4all.nl>
Date:   Wed, 21 Jul 2021 09:12:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <m3k0lmejlw.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEg4p7fAopLcz4yjcxJXdZB1bsOezQlCwvuU2EVih3p7SJ8PRWfsG2XXaJ+I+pzb5e2jRumRHO5ZoWl8Dr6AruaPU8E4gMqPvLhLed/YBzgMv5lm/vcS
 kRtV9SczFhbIqf5Hfya1VyS7d+ir6dOFgT86dRjp1QvLDCc8Jbd87ou41/N0Qmnl7HFCTgF+bcUyXdPeb3EA4CbNpBYNrBYYJ3wAFvmUsbWG2IKZh6goY5v8
 LZSfPb3uhrA84go6otD7pQQZRdBmLl0UD1I6xvn9EiiPVRTjAqt4vVE62LbQEXg30GdSS8jUVjPpO+USFeen09LbLN9pk+iPoQ1ocj+ZtD7ku2s+SzYu0yx/
 9zwSXeQNGF+PgAKY6tpypIMDwtJX/xkzKg4QZPHJXL2VLhVXyFsvdC2/CiLPO7WesvwWRiYs
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,


On 19/07/2021 11:30, Krzysztof Hałasa wrote:
> The TDA1997x (HDMI receiver) driver currently uses a specific video
> format detection scheme. The frame (or field in interlaced mode), line
> and HSync pulse durations are compared to those of known, standard video
> modes. If a match is found, the mode is assumed to be detected,
> otherwise -ERANGE is returned (then possibly ignored). This means that:
> - another mode with similar timings will be detected incorrectly
>   (e.g. 2x faster clock and lines twice as long)
> - non-standard modes will not work.
> 
> I propose to replace this scheme with a direct read of geometry
> registers. This way all modes recognized by the chip will be supported.
> 
> How does this change look like from the user's perspective?
> 
> v4l2-ctl -d $(media-ctl -e "tda19971 2-0048") --query-dv-timings
> 
> Original code - known mode:           Patched:
> Active width: 1152                    Active width: 1152
> Active height: 864		      Active height: 864
> Total width: 1600		      Total width: 1600
> Total height: 900		      Total height: 900
> Frame format: progressive	      Frame format: progressive
> Polarities: +vsync +hsync	      Polarities: -vsync -hsync
> Pixelclock: 108000000 Hz (75.00 FPS)  Pixelclock: 107998200 Hz (75.00 FPS)
> Horizontal frontporch: 64	      Horizontal frontporch: 64
> Horizontal sync: 128		      Horizontal sync: 128
> Horizontal backporch: 256	      Horizontal backporch: 256
> Vertical frontporch: 1		      Vertical frontporch: 1
> Vertical sync: 3		      Vertical sync: 3
> Vertical backporch: 32		      Vertical backporch: 32
> Standards: DMT			      Standards:
> Flags:				      Flags:
> 
> Original code - "unknown" mode:       Patched:
> Active width: 0                       Active width: 1400
> Active height: 0		      Active height: 1050
> Total width: 0			      Total width: 1560
> Total height: 0			      Total height: 1080
> Frame format: progressive	      Frame format: progressive
> Polarities: -vsync -hsync	      Polarities: -vsync -hsync
> Pixelclock: 0 Hz		      Pixelclock: 79998593 Hz (47.48 FPS)
> Horizontal frontporch: 0	      Horizontal frontporch: 48
> Horizontal sync: 0		      Horizontal sync: 32
> Horizontal backporch: 0		      Horizontal backporch: 80
> Vertical frontporch: 0		      Vertical frontporch: 3
> Vertical sync: 0		      Vertical sync: 4
> Vertical backporch: 0		      Vertical backporch: 23
> Standards:			      Standards:
> Flags:				      Flags:
> 
> In the kernel logs - original code:
> Signal Timings: 360006/399/31
> Detected format: 1152x864p75.00 (1600x900)
> 
> Signal Timings: 568630/525/9
> no resolution match for timings: 568630/525/9
> 
> Patched:
> Signal Timings: 360006/399/31
> Geometry: 1600 1152 64 128 256   900 864 1 0 3 32 0
> Detected format: 1152x864p74.99 (1600x900)
> 
> Signal Timings: 568646/525/9
> Geometry: 1560 1400 48 32 80   1080 1050 3 0 4 23 0
> Detected format: 1400x1050p47.48 (1560x1080)
> 
> Note the differences. The original code uses values in
> v4l2_dv_timings_presets[], while with the patch it reads the data from
> the chip. Thus 108000000 Hz changes into (this time) 107998200 Hz.
> 
> Also, the flags. This is HDMI receiver, so I don't exactly think H and V
> sync signals have any polarity (they are symbols embedded in the HDMI
> stream).
> I don't know if the "VESA Discrete Monitor Timings" (DMT) flag makes any
> difference.
> 
> The code assumes the V sync signal has the same duration for both
> fields. While this may be not necessarily true, I can't see any way to
> get the "other" V sync width. This is most probably harmless.
> 
> I have checked the register values in interlaced mode, but currently
> can't test such a setup (I only have remote access to a device working
> in interlaced mode). Perhaps this will change in time.
> 
> All tests have been performed on Gateworks' Ventana GW54xx board, with
> a TDA19971 chip.
> 
> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> ---
> ... also testing UTF-8 path :-)
> 
> Krzysztof "Chris" Hałasa
> 
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
> 
> --- a/drivers/media/i2c/tda1997x.c
> +++ b/drivers/media/i2c/tda1997x.c
> @@ -1092,66 +1094,71 @@ tda1997x_detect_std(struct tda1997x_state *state,
>  		    struct v4l2_dv_timings *timings)
>  {
>  	struct v4l2_subdev *sd = &state->sd;
> -	u32 vper;
> -	u16 hper;
> -	u16 hsper;
> -	int i;
>  
>  	/*
>  	 * Read the FMT registers
> -	 *   REG_V_PER: Period of a frame (or two fields) in MCLK(27MHz) cycles
> -	 *   REG_H_PER: Period of a line in MCLK(27MHz) cycles
> -	 *   REG_HS_WIDTH: Period of horiz sync pulse in MCLK(27MHz) cycles
> +	 *   REG_V_PER: Period of a frame (or field) in MCLK (27MHz) cycles
> +	 *   REG_H_PER: Period of a line in MCLK (27MHz) cycles
> +	 *   REG_HS_WIDTH: Period of horiz sync pulse in MCLK (27MHz) cycles
>  	 */
> -	vper = io_read24(sd, REG_V_PER) & MASK_VPER;
> -	hper = io_read16(sd, REG_H_PER) & MASK_HPER;
> -	hsper = io_read16(sd, REG_HS_WIDTH) & MASK_HSWIDTH;
> +	u32 vper = io_read24(sd, REG_V_PER) & MASK_VPER;
> +	u16 hper = io_read16(sd, REG_H_PER) & MASK_HPER;
> +	u16 hswidth = io_read16(sd, REG_HS_WIDTH);
> +	u16 hsper = hswidth & MASK_HSWIDTH;
> +	u16 htot, hact, hfront, hsync, hback;
> +	u16 vtot, vact, vfront1, vfront2, vsync, vback1, vback2;
> +
>  	v4l2_dbg(1, debug, sd, "Signal Timings: %u/%u/%u\n", vper, hper, hsper);
>  	if (!vper || !hper || !hsper)
>  		return -ENOLINK;
>  
> -	for (i = 0; v4l2_dv_timings_presets[i].bt.width; i++) {
> -		const struct v4l2_bt_timings *bt;
> -		u32 lines, width, _hper, _hsper;
> -		u32 vmin, vmax, hmin, hmax, hsmin, hsmax;
> -		bool vmatch, hmatch, hsmatch;
> -
> -		bt = &v4l2_dv_timings_presets[i].bt;
> -		width = V4L2_DV_BT_FRAME_WIDTH(bt);
> -		lines = V4L2_DV_BT_FRAME_HEIGHT(bt);
> -		_hper = (u32)bt->pixelclock / width;
> -		if (bt->interlaced)
> -			lines /= 2;
> -		/* vper +/- 0.7% */
> -		vmin = ((27000000 / 1000) * 993) / _hper * lines;
> -		vmax = ((27000000 / 1000) * 1007) / _hper * lines;
> -		/* hper +/- 1.0% */
> -		hmin = ((27000000 / 100) * 99) / _hper;
> -		hmax = ((27000000 / 100) * 101) / _hper;
> -		/* hsper +/- 2 (take care to avoid 32bit overflow) */
> -		_hsper = 27000 * bt->hsync / ((u32)bt->pixelclock/1000);
> -		hsmin = _hsper - 2;
> -		hsmax = _hsper + 2;
> -
> -		/* vmatch matches the framerate */
> -		vmatch = ((vper <= vmax) && (vper >= vmin)) ? 1 : 0;
> -		/* hmatch matches the width */
> -		hmatch = ((hper <= hmax) && (hper >= hmin)) ? 1 : 0;
> -		/* hsmatch matches the hswidth */
> -		hsmatch = ((hsper <= hsmax) && (hsper >= hsmin)) ? 1 : 0;
> -		if (hmatch && vmatch && hsmatch) {
> -			v4l2_print_dv_timings(sd->name, "Detected format: ",
> -					      &v4l2_dv_timings_presets[i],
> -					      false);
> -			if (timings)
> -				*timings = v4l2_dv_timings_presets[i];
> -			return 0;
> -		}
> +	htot = io_read16(sd, REG_FMT_H_TOT);
> +	hact = io_read16(sd, REG_FMT_H_ACT);
> +	hfront = io_read16(sd, REG_FMT_H_FRONT);
> +	hsync = io_read16(sd, REG_FMT_H_SYNC);
> +	hback = io_read16(sd, REG_FMT_H_BACK);
> +
> +	vtot = io_read16(sd, REG_FMT_V_TOT);
> +	vact = io_read16(sd, REG_FMT_V_ACT);
> +	vfront1 = io_read(sd, REG_FMT_V_FRONT_F1);
> +	vfront2 = io_read(sd, REG_FMT_V_FRONT_F2);
> +	vsync = io_read(sd, REG_FMT_V_SYNC);
> +	vback1 = io_read(sd, REG_FMT_V_BACK_F1);
> +	vback2 = io_read(sd, REG_FMT_V_BACK_F2);
> +
> +	v4l2_dbg(1, debug, sd, "Geometry: %u %u %u %u %u   %u %u %u %u %u %u %u\n",
> +		 htot, hact, hfront, hsync, hback,
> +		 vtot, vact, vfront1, vfront2, vsync, vback1, vback2);
> +
> +	if (!timings)
> +		return 0;

This check isn't necessary, timings is never NULL.

> +
> +	timings->type = V4L2_DV_BT_656_1120;
> +	timings->bt.width = hact;
> +	timings->bt.hfrontporch = hfront;
> +	timings->bt.hsync = hsync;
> +	timings->bt.hbackporch = hback;
> +	timings->bt.height = vact;
> +	timings->bt.vfrontporch = vfront1;
> +	timings->bt.vsync = vsync;
> +	timings->bt.vbackporch = vback1;
> +	timings->bt.interlaced = hswidth & MASK_HSWIDTH_INTERLACED ?
> +		V4L2_DV_INTERLACED : V4L2_DV_PROGRESSIVE;
> +
> +	timings->bt.pixelclock = (u64)htot * vtot * 27000000;
> +	if (timings->bt.interlaced == V4L2_DV_INTERLACED) {
> +		timings->bt.il_vfrontporch = vfront2;
> +		timings->bt.il_vsync = timings->bt.vsync;
> +		timings->bt.il_vbackporch = vback2;
> +		do_div(timings->bt.pixelclock, vper * 2 /* full frame */);
> +	} else {
> +		timings->bt.il_vfrontporch = 0;
> +		timings->bt.il_vsync = 0;
> +		timings->bt.il_vbackporch = 0;
> +		do_div(timings->bt.pixelclock, vper);
>  	}
> -
> -	v4l_err(state->client, "no resolution match for timings: %d/%d/%d\n",
> -		vper, hper, hsper);
> -	return -ERANGE;

This is all very good. But one more step is needed:

	v4l2_find_dv_timings_cap(timings, &tda1997x_dv_timings_cap,
				 timings->bt.pixelclock / 1000,
				 NULL, NULL);

This will find matching timings in the presets as long as they don't differ
by more that 1/1000th of the pixelclock (to allow for natural variations since
clocks are never precise). If found, it will update the timing to the of the
preset. It's really what you want, since knowing that a timing is a CEA timing
or DMT etc. can be useful for userspace.

If there is no match, then the measured timings are just passed on to userspace.

Regards,

	Hans

> +	v4l2_print_dv_timings(sd->name, "Detected format: ", timings, false);
> +	return 0;
>  }
>  
>  /* some sort of errata workaround for chip revision 0 (N1) */
> --- a/drivers/media/i2c/tda1997x_regs.h
> +++ b/drivers/media/i2c/tda1997x_regs.h
> @@ -120,6 +120,7 @@
>  #define MASK_VHREF		0x3fff
>  #define MASK_HPER		0x0fff
>  #define MASK_HSWIDTH		0x03ff
> +#define MASK_HSWIDTH_INTERLACED	0x8000
>  
>  /* HPD Detection */
>  #define DETECT_UTIL		BIT(7)	/* utility of HDMI level */
> 

