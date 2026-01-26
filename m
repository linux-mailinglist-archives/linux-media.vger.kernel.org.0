Return-Path: <linux-media+bounces-51538-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFLoHp49d2mMdQEAu9opvQ
	(envelope-from <linux-media+bounces-51538-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:10:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D68B86771
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76386306E815
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358C432E74E;
	Mon, 26 Jan 2026 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S/vhAU6i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B49E32D7F3;
	Mon, 26 Jan 2026 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421959; cv=none; b=GKJWzZYcKzKbDUsqmpP1gFbzHAU0eP4CXYmWb6H7gjXKRTtCZresVqcDZUxxDLjVDFmP1h1bCmyYAGqlQS8OFw1dOLU4hXGJsgd/uad91lqdQXgQURM8SrLKJpeva0RB88k4H9oGG/f/ICV6YOfDqmMh6ta1PfrqVX+MfzEUMB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421959; c=relaxed/simple;
	bh=az2SXhiidJVbYsg6HTnSFdFHH7FfxGTHHd7eGH2uRrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7OS+tawuhMkpv9zXXLvZl7K7bPfERoT3nkDqYaZWXOPs3ll78NfWndxc4zNi4+cAS2NxdIXuqDmXCOkztS4jXTuyPAZsyCTXl0xpVHbIVAEkM6jVhVUUi6UImITep0nozfIqF+L89QOf91+chulemTpgnv01oI9Bbc0ji28XDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S/vhAU6i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7E03F557;
	Mon, 26 Jan 2026 11:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769421920;
	bh=az2SXhiidJVbYsg6HTnSFdFHH7FfxGTHHd7eGH2uRrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S/vhAU6iB/PAbVgmSJULehi8CN69RGuVknOzR4zv6b145hpWChfhI31LFccOatJTr
	 o2QyaUl0hXtp5rYEGOg2BNZzkj4onRXrlgWwb/JoImGvtrU2Zb+Ba28vLx4+anBug8
	 z8qrFnmEPQI+cmKX2wVF1XLkFqn5jYp1F/P3MdVI=
Date: Mon, 26 Jan 2026 12:05:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] media: i2c: mt9m114: add support for Aptina MI1040
Message-ID: <20260126100554.GC593812@killaraus>
References: <20260126083430.8247-1-clamor95@gmail.com>
 <20260126083430.8247-3-clamor95@gmail.com>
 <aXc1XwD8Wo2yu4dv@kekkonen.localdomain>
 <CAPVz0n3=JPyjm3RypcSec=FZ66W2cq4Mwu2yodR03Ng2jDbxEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n3=JPyjm3RypcSec=FZ66W2cq4Mwu2yodR03Ng2jDbxEw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51538-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 1D68B86771
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 11:50:05AM +0200, Svyatoslav Ryhel wrote:
> пн, 26 січ. 2026 р. о 11:35 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> > On Mon, Jan 26, 2026 at 10:34:30AM +0200, Svyatoslav Ryhel wrote:
> > > Slightly different version of MT9M114 camera module is used in a several
> > > devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
> > > called Aptina MI1040. Only difference found so far is lacking ability to
> >
> > s/Only/The only/
> >
> > > poll STATUS and COMMAND registers during power on sequence, which causes
> > > driver to fail with time out error. Add polling flag to diverge models and
> > > address quirk found in MI1040.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/media/i2c/mt9m114.c | 35 ++++++++++++++++++++++++++++-------
> > >  1 file changed, 28 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > > index 4ec033c0ee84..d96a57ebcad4 100644
> > > --- a/drivers/media/i2c/mt9m114.c
> > > +++ b/drivers/media/i2c/mt9m114.c
> > > @@ -368,6 +368,10 @@ enum {
> > >   * Data Structures
> > >   */
> > >
> > > +struct mt9m114_model_info {
> > > +     bool polling;
> > > +};
> > > +
> > >  enum mt9m114_format_flag {
> > >       MT9M114_FMT_FLAG_PARALLEL = BIT(0),
> > >       MT9M114_FMT_FLAG_CSI2 = BIT(1),
> > > @@ -421,6 +425,8 @@ struct mt9m114 {
> > >
> > >               struct v4l2_ctrl *tpg[4];
> > >       } ifp;
> > > +
> > > +     const struct mt9m114_model_info *info;
> > >  };
> > >
> > >  /* -----------------------------------------------------------------------------
> > > @@ -2186,9 +2192,11 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
> > >        */
> > >       usleep_range(44500, 50000);
> > >
> > > -     ret = mt9m114_poll_command(sensor, MT9M114_COMMAND_REGISTER_SET_STATE);
> > > -     if (ret < 0)
> > > -             goto error_clock;
> > > +     if (sensor->info->polling) {
> > > +             ret = mt9m114_poll_command(sensor, MT9M114_COMMAND_REGISTER_SET_STATE);
> > > +             if (ret < 0)
> > > +                     goto error_clock;
> > > +     }
> >
> > What does the datasheet say, is there a need to do something else instead?
> > As the polling is there to ensure firmware has done its job, the need
> > appears to still be there.
> 
> MI1040 has no datasheet available and downstream code does not do this
> polling. I have tested on Nexus 7 which has this camera and it seems
> to be fully operational without this poling, but as soon it is enabled
> camera fails will timeout. I suspect that this camera version has some
> quirk regarding early access, but I cannot back it up by any
> documentation or additional data.
> 
> I have a device with proper version of mt9m114 too and it works with
> his driver without any major issues.

Does the device reply to reads of the MT9M114_COMMAND_REGISTER register
but never shows the MT9M114_COMMAND_REGISTER_SET_STATE bit being set, or
does it not reply to reads at all (timeouts on the I2C bus) ?

> > >
> > >       if (sensor->bus_cfg.bus_type == V4L2_MBUS_PARALLEL) {
> > >               /*
> > > @@ -2207,9 +2215,11 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
> > >        * reaches the standby mode (either initiated manually above in
> > >        * parallel mode, or automatically after reset in MIPI mode).
> > >        */
> > > -     ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
> > > -     if (ret < 0)
> > > -             goto error_clock;
> > > +     if (sensor->info->polling) {
> > > +             ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
> >
> > Ditto.
> >
> > > +             if (ret < 0)
> > > +                     goto error_clock;
> > > +     }
> > >
> > >       return 0;
> > >
> > > @@ -2421,6 +2431,8 @@ static int mt9m114_probe(struct i2c_client *client)
> > >       if (ret < 0)
> > >               return ret;
> > >
> > > +     sensor->info = of_device_get_match_data(dev);
> >
> > You can use device_get_match_data() here.
> 
> noted
> 
> > > +
> > >       /* Acquire clocks, GPIOs and regulators. */
> > >       sensor->clk = devm_v4l2_sensor_clk_get(dev, NULL);
> > >       if (IS_ERR(sensor->clk)) {
> > > @@ -2539,8 +2551,17 @@ static void mt9m114_remove(struct i2c_client *client)
> > >       pm_runtime_set_suspended(dev);
> > >  }
> > >
> > > +static const struct mt9m114_model_info mt9m114_models_default = {
> > > +     .polling = true,
> > > +};
> > > +
> > > +static const struct mt9m114_model_info mt9m114_models_aptina = {
> > > +     .polling = false,
> > > +};
> > > +
> > >  static const struct of_device_id mt9m114_of_ids[] = {
> > > -     { .compatible = "onnn,mt9m114" },
> > > +     { .compatible = "onnn,mt9m114", .data = &mt9m114_models_default },
> > > +     { .compatible = "aptina,mi1040", .data = &mt9m114_models_aptina },
> > >       { /* sentinel */ },
> >
> > The sentinel entry shouldn't have a comma. Feel free to fix that while at
> > it.
> 
> noted
> 
> > >  };
> > >  MODULE_DEVICE_TABLE(of, mt9m114_of_ids);

-- 
Regards,

Laurent Pinchart

