Return-Path: <linux-media+bounces-512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7CA7EF4D7
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 15:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB7C51C2091C
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 14:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8860435F02;
	Fri, 17 Nov 2023 14:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y2kjJ0A3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EDE1AD
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 06:59:44 -0800 (PST)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 195F79B6;
	Fri, 17 Nov 2023 15:59:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700233155;
	bh=7/0Bkw7P6J4sUTj3gMoQyfUDssrfmv3FHlO8+G7MO+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2kjJ0A3QXDygGDRM0mz/9vdcfCIDd+Epdpa3qAG9pF0GbZVMYDQUawJA+NP8Iw3q
	 JizPnUmDcA8GBWZ5EB6Tj5jvsi5UDGW5OaekR0tAi0d37FKDqPeq1U6dcmZRz1jppj
	 DhF5nlyUkd0rtrxkBGON5ZnFXIwuphNN6VEb69bg=
Date: Fri, 17 Nov 2023 15:59:39 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Lee Jackson <lee.jackson@arducam.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for OmniVision OV64A40
Message-ID: <3hmhyq2n2lcmllnhvkk7qblkwhelljapjmew5inqwdq2supomu@7qi3i2h7mcpb>
References: <20231010151208.29564-1-jacopo.mondi@ideasonboard.com>
 <20231010151208.29564-3-jacopo.mondi@ideasonboard.com>
 <ZVHciyhWSogA4ckc@kekkonen.localdomain>
 <uk3jwwpwthl7es6gdfkremjf4wil5w4b2kd6amajmeigywa55f@qxsz33z5t6q6>
 <ZVJL0grMufajJ3Tm@kekkonen.localdomain>
 <w536wwkmzdxlppj7i5lbq4hvmh5owlufh3rjj5qixu3kuot2oa@toybd7h47pvv>
 <ZVO80o65pOZ9RVqz@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZVO80o65pOZ9RVqz@kekkonen.localdomain>

Hi Sakari

On Tue, Nov 14, 2023 at 06:30:42PM +0000, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Nov 14, 2023 at 06:24:20PM +0100, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Mon, Nov 13, 2023 at 04:16:18PM +0000, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Mon, Nov 13, 2023 at 10:19:32AM +0100, Jacopo Mondi wrote:
> > >
> > > ...
> > >
> > > > > > +	bool vbin;
> > > > > > +	bool hbin;
> > > > >
> > > > > I recall bool is 32 bits on arm. Is it 64 bits on arm64? Just a note, I
> > > > > don't have a great suggestion here. :-)
> > > > >
> > > > > So only binning up to 2x2 is supported?
> > > > >
> > > >
> > > > yes, further downscaling is obtained by skipping.
> > > >
> > > > The 0x3820 register has BIT(1) "vbin_vc" than enables binning, so the
> > > > binning factor doesn't seem to be configurable. Of course there might
> > > > be other bits/registers to control this, but I'm not aware of those
> > >
> > > Ack.
> > >
> > > > > > +static int ov64a40_start_streaming(struct ov64a40 *ov64a40,
> > > > > > +				   struct v4l2_subdev_state *state)
> > > > > > +{
> > > > > > +	const struct ov64a40_reglist *reglist = &ov64a40->mode->reglist;
> > > > > > +	unsigned long delay;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	ret = pm_runtime_resume_and_get(ov64a40->dev);
> > > > >
> > > > > You seem to be using autosuspend, but you still do not try to avoid writes
> > > > > of presumably the same register values if the sensor was powered on. The
> > > > > register writes usually take the most of the time there.
> > > >
> > > > I'm not sure I get this comment. Are you afraid of multiple calls to
> > > > "start_streaming" being made ? Isn't it responsibility of the bridge
> > > > driver to handle this correctly ?
> > >
> > > It is.
> > >
> > > What I'm saying is that you're re-writing a lot of unchanged sensor
> > > configuration below even if the sensor has not been powered off in the
> > > meantime.
> > >
> >
> > Indeed! I can move programming the long table of registers to
> > power_on() so that it gets written only when the device actually
> > resumes, and close calls to start_stream() won't need to do so.
>
> That is one option.

Unforuntately I can't do that easily. Mixing modes does not give good
results if I skip re-writing the long init sequence, as the per-mode
register tables, specifically the max resolution one, are designed to
be applied to a configured sensor.

I tried fixing the max res mode to set all the register it needs, but
I wasn't able to set all the requested registers (did I mention most
of them are undocumented ?)

>
> Do note that you can't set up controls there using control handler's setup
> function as pm_runtime_get_if_in_use() (or ..._active()) will return an
> error there.
>
> >
> > > >
> > > > One thing for sure, I should grab a few controls (flips, link_freq)
> > > > avoid them being written to HW while the sensor is streaming.
> > > >
> > > > >
> > > > > pm_runtime_get_sync() returns 1 if the sensor was already in active state.
> > > > >
> > > > > I'm about to send a patchset related to this actually, I can cc you...
> > > > >
> >
> > Please, I'm not sure I get the issue still
> >
> > > > > > +	if (ret < 0)
> > > > > > +		return ret;
> > > > > > +
> > > > > > +	ret = cci_multi_reg_write(ov64a40->cci, ov64a40_init,
> > > > > > +				  ARRAY_SIZE(ov64a40_init), NULL);
> > > > > > +	if (ret)
> > > > > > +		goto error_power_off;
> > > > > > +
> > > > > > +	ret = cci_multi_reg_write(ov64a40->cci, reglist->regvals,
> > > > > > +				  reglist->num_regs, NULL);
> > > > > > +	if (ret)
> > > > > > +		goto error_power_off;
> > > > > > +
> > > > > > +	ret = ov64a40_program_geometry(ov64a40);
> > > > > > +	if (ret)
> > > > > > +		goto error_power_off;
> > > > > > +
> > > > > > +	ret = ov64a40_program_subsampling(ov64a40);
> > > > > > +	if (ret)
> > > > > > +		goto error_power_off;
> > > > > > +
> > > > > > +	ret =  __v4l2_ctrl_handler_setup(&ov64a40->ctrl_handler);
> > > > > > +	if (ret)
> > > > > > +		goto error_power_off;
> > > > > > +
> > > > > > +	ret = cci_write(ov64a40->cci, OV64A40_REG_SMIA,
> > > > > > +			OV64A40_REG_SMIA_STREAMING, NULL);
> > > > > > +	if (ret)
> > > > > > +		goto error_power_off;
> > > > > > +
> > > > > > +	/* delay: max(4096 xclk pulses, 150usec) + exposure time */
> > > > > > +	delay = DIV_ROUND_UP(4096, OV64A40_XCLK_FREQ / 1000 / 1000);
> > > > > > +	delay = max(delay, 150ul);
> > > > > > +	delay += DIV_ROUND_UP(ov64a40->mode->ppl * ov64a40->exposure->cur.val,
> > > > > > +			      OV64A40_PIXEL_RATE / 1000 / 1000);
> > > > > > +	fsleep(delay);
> > > > > > +
> > > > > > +	return 0;
> > > > > > +
> > > > > > +error_power_off:
> > > > > > +	pm_runtime_mark_last_busy(ov64a40->dev);
> > > > > > +	pm_runtime_put_autosuspend(ov64a40->dev);
> > > > > > +
> > > > > > +	return ret;
> > > > > > +}
> > >
> > > ...
> > >
> > > > > > +static int ov64a40_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > > > +{
> > > > > > +	struct ov64a40 *ov64a40 = container_of(ctrl->handler, struct ov64a40,
> > > > > > +					       ctrl_handler);
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	if (ctrl->id == V4L2_CID_VBLANK) {
> > > > > > +		int exp_max = ov64a40->mode->height + ctrl->val
> > > > > > +			    - OV64A40_EXPOSURE_MARGIN;
> > > > > > +		int exp_val = min(ov64a40->exposure->cur.val, exp_max);
> > > > > > +
> > > > > > +		__v4l2_ctrl_modify_range(ov64a40->exposure,
> > > > > > +					 ov64a40->exposure->minimum,
> > > > > > +					 exp_max, 1, exp_val);
> > > > > > +	}
> > > > > > +
> > > > > > +	if (pm_runtime_get_if_in_use(ov64a40->dev) == 0)
> > > > >
> > > > > The function you should use here is actually called
> > > > > pm_runtime_get_if_active(), but this change would better be postponed after
> > > > > my patchset.
> > > >
> > > >   `int pm_runtime_get_if_in_use(struct device *dev);`
> > > >     - return -EINVAL if 'power.disable_depth' is nonzero; otherwise, if the
> > > >       runtime PM status is RPM_ACTIVE and the runtime PM usage counter is
> > > >       nonzero, increment the counter and return 1; otherwise return 0 without
> > > >       changing the counter
> > > >
> > > >   `int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count);`
> > > >     - return -EINVAL if 'power.disable_depth' is nonzero; otherwise, if the
> > > >       runtime PM status is RPM_ACTIVE, and either ign_usage_count is true
> > > >       or the device's usage_count is non-zero, increment the counter and
> > > >       return 1; otherwise return 0 without changing the counter
> > > >
> > > >
> > > > The only difference I see here is the additional 'ign_usage_count'
> > > > which allows to forcefully resume the device by ignoring the usage
> > > > counter ? Why would you forcefully resume the device here ? Don't we
> > > > actually want the opposite and use this check to only access the HW if
> > > > the device is powered already ?
> > > >
> > >
> > > It ignores the usage_count before the call while incrementing it if the
> > > device was in active state. Although this change isn't useful if you
> > > continue to re-write the configuration to sensor's registers in streamon
> > > nevertheless.
> > >
> >
> > I didn't get why the two things are related :)
>

Ok, now that I've read your patch series this makes sense.

Did you mean:

> Consider the following:
>
> 1. The application stops streaming. Autosuspend timer prevents suspending
>    the sensor immediately even if usage_count becomes zero.
> 2. The application set a control. The sensor is still powered on so

s/so/but/

>    pm_runtime_get_if_in_use() returns 0 and the control value is written to
>    registers.

s/is written/is not written/

> 3. pm_runtime_put() at the end of s_ctrl() callback will power the sensor
>    off immediately.
> 4. Application proceeds to start streaming and the sensor is powered on
>    again.
>
> The purpose of autosuspend is to avoid (needlessly) powering off and on the
> device --- which takes time.
>

Should I base my next version on top of "[PATCH v2 0/7] Small Runtime
PM API changes" ? Remember I'm going to write the init sequence in
start_stream() so even if I use get_if_active() I won't save much.


