Return-Path: <linux-media+bounces-60903-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE2ML/Gn/WmEhAAAu9opvQ
	(envelope-from <linux-media+bounces-60903-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 11:08:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8604F40D0
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 11:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B205A3016D34
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 09:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C9537F75E;
	Fri,  8 May 2026 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="nU/9cy4E"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D27282F3B;
	Fri,  8 May 2026 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231275; cv=pass; b=ftuppO2ADPXHGdycqwyvA/cKW2R+B0U/wPCp5mkAxdOVdkilqHCzt/7tYIoz5RrqS0yhw/AzqZ5Y2yzS4C7lEAoSnKgeLzGTkgLrcjej56a8e/D1KHVRV4qtT2VVVCl+tH2YE2ZXkbfVPIxHJap0AYnHH42NB00M4aykCbaW65k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231275; c=relaxed/simple;
	bh=8QESIfAkLwRyfBMFA+U8dqcWKqxKicm7MCiktn08o8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joQZw4/BS+3M41dE3ZDAC8cqfffSo3PVa5AAblIJtm+bhhou9YTVWh0gsbbyloyqDFA2auZpYxeici7qEBqWUbznTWj9YgqEeqkC1h8xHZvEVMCrpswwKbeqYDRBjx1ksbxuZ7cnTC/bV0tSM5z8Awedz79HKV9sz1UoHNOICso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=nU/9cy4E; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4gBjv45K8QzyRd;
	Fri, 08 May 2026 12:07:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1778231265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUghrcim4Oev3eFxnDWf3UNGZyra7wdiWZt/JGnfUSw=;
	b=nU/9cy4E9oML0Z5Vs/faX/xjqubp/ozcrQ1vFl1R69U46q+MoF1NZ1Uf96K2UkdsmVo9bL
	zliWH0vvEVfU5u/ot0kTi4ZbyhM9BW+o/eJgJ0M8tUds6P4SbK8DuLq5dx97diZOjEKIxf
	7BiIQaybpJ71qD6na1TEbTa44s8EtCI=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1778231265;
	b=up8ItQjZi80SxhScElwB5PJ97rtNSC5eOR3WNzvwesyVwUDnTK88vfPS6/+/iYYq9SDA/q
	1PNvBQeb2BVxIn0bpZGgmDensw6iFtUm1jwZKvEYmuaVX69JkmeTFCMOWAKd4YsDa+gmLv
	iIf1XQMtCXMYjqcDWNnr0Tv8R7h7NDg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1778231265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUghrcim4Oev3eFxnDWf3UNGZyra7wdiWZt/JGnfUSw=;
	b=cq8d/mWnu/V8ouB0yqSwJErh+oLmkbLyvvyjal5WJfj6axpyyA4sLJFRxq3kC7pdjMppcE
	QP4Y6mu70TqNOuiBduhAHYUcRo4e0wRKRx0eznhUxdHRdJRey+HW13h+3Rb/3b3RnEkoVK
	KO28S002Yb32qY9aSSE46qHq87GJF8U=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E3D07634C4E;
	Fri, 08 May 2026 12:07:43 +0300 (EEST)
Date: Fri, 8 May 2026 12:07:43 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <af2n3z8B73d9zuvU@valkosipuli.retiisi.eu>
References: <20260505061327.286700-1-hpa@redhat.com>
 <20260505061327.286700-3-hpa@redhat.com>
 <afrpUZBxIT5ugGQV@valkosipuli.retiisi.eu>
 <CAEth8oHg3ERKPfRrLH8rqpTbZW7g460+x_miCXE1nN4vh9rzcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEth8oHg3ERKPfRrLH8rqpTbZW7g460+x_miCXE1nN4vh9rzcQ@mail.gmail.com>
X-Rspamd-Queue-Id: 5E8604F40D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60903-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iki.fi:email,iki.fi:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Action: no action

Hi Kate,

On Fri, May 08, 2026 at 04:51:03PM +0800, Kate Hsuan wrote:
> Hi Sakari,
> 
> Thank you for reviewing the patch.
> 
> On Wed, May 6, 2026 at 3:15 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Hi Kate,
> >
> > Thanks for the update. Please see my comments below.
> >
> > On Tue, May 05, 2026 at 02:13:27PM +0800, Kate Hsuan wrote:
> > > Add a new driver for Sony imx471 camera sensor. It is based on
> > > Jimmy Su <jimmy.su@intel.com> implementation and the driver can be found
> > > in the following URL.
> > > https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/imx471.c
> > >
> > > This sensor can be found on Lenovo X9-14 and X9-15 laptop and it is a part
> > > of IPU7 solution. The driver was tested on Lenovo X9-14 and X9-15 laptops.
> > >
> > > Link: https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/imx471.c
> > > Link: https://bugzilla.redhat.com/show_bug.cgi?id=2454119
> >
> > I'm not sure we need these links. But the extra newline here should go in
> > any case.
> If these links are unnecessary, I'll drop them.

Please.

...

> > > +static const struct cci_reg_sequence imx471_global_regs[] = {
> > > +     { CCI_REG8(0x0136), 0x13 },
> > > +     { CCI_REG8(0x0137), 0x33 },
> > > +     { CCI_REG8(0x3c7e), 0x08 },
> > > +     { CCI_REG8(0x3c7f), 0x05 },
> > > +     { CCI_REG8(0x3e35), 0x00 },
> > > +     { CCI_REG8(0x3e36), 0x00 },
> > > +     { CCI_REG8(0x3e37), 0x00 },
> > > +     { CCI_REG8(0x3f7f), 0x01 },
> >
> > A lot of these appear to be 16-bit registers. It'd make sense to write them
> > to the sensor as such.
> >
> > Quite a few of these registers also have a name, please use the names
> > instead of numerical values.
> Ok.
> >
> > The sensor is probably CCS compliant to some (unknown?) degree.
> It's pretty similar to imx214. I'll try my best to find the names of
> the registers.

If there's no name for a register, which generally is the case for the MSRs
starting at 0x3000, just use the numerical value.

...

> > > +static int imx471_get_regulators(struct device *dev, struct imx471_data *sensor)
> > > +{
> > > +     unsigned int i;
> > > +
> > > +     for (i = 0; i < IMX471_NUM_SUPPLIES; i++)
> >
> > You could declare i here.
> Something like that?
> for (unsigned int i = 0; i < IMX471_NUM_SUPPLIES; i++)

Yes, please.

...

> > > +     case V4L2_CID_HFLIP:
> > > +     case V4L2_CID_VFLIP:
> > > +             if (sensor->streaming)
> >
> > Please grab the controls when starting streaming and ungrab them when
> > stopping it.
>  v4l2_ctrl_grab() will be used to manage it when starting or stopping
> the stream.

You'll need __v4l2_ctrl_grab() as the mutex is already acquired.

...

> > > +static int imx471_set_pad_format(struct v4l2_subdev *sd,
> > > +                              struct v4l2_subdev_state *sd_state,
> > > +                              struct v4l2_subdev_format *fmt)
> > > +{
> > > +     struct imx471_data *sensor = to_imx471_data(sd);
> > > +     const struct imx471_mode *mode;
> > > +
> > > +     mode = v4l2_find_nearest_size(imx471_modes,
> > > +                                   ARRAY_SIZE(imx471_modes),
> > > +                                   width, height,
> > > +                                   fmt->format.width, fmt->format.height);
> > > +
> > > +     imx471_update_pad_format(sensor, mode, fmt);
> > > +
> > > +     *v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> > > +
> > > +     if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > > +             return 0;
> > > +
> > > +     if (media_entity_is_streaming(&sensor->sd.entity))
> > > +             return -EBUSY;
> > > +
> > > +     if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> >
> > You can omit this check.
> Ok, since it is always an active state.
> >
> > > +             int h_blank;
> > > +             u64 pixel_rate;
> > > +
> > > +             pixel_rate = IMX471_LINK_FREQ_DEFAULT * 2 * 4;
> > > +             do_div(pixel_rate, 10);
> >
> > You could use div_u64() here.
> Okay
> >
> > > +             __v4l2_ctrl_modify_range(sensor->pixel_rate,
> > > +                                      V4L2_CID_PIXEL_RATE,
> > > +                                      pixel_rate, 1, pixel_rate);
> > > +
> > > +             __v4l2_ctrl_modify_range(sensor->vblank,
> > > +                                      mode->fll_min - mode->height,
> > > +                                      IMX471_FLL_MAX - mode->height,
> > > +                                      1,
> > > +                                      mode->fll_def - mode->height);
> > > +
> > > +             h_blank = mode->llp - mode->width;
> > > +             /*
> > > +              * Currently hblank is not changeable.
> > > +              * So FPS control is done only by vblank.
> > > +              */
> > > +             __v4l2_ctrl_modify_range(sensor->hblank, h_blank,
> > > +                                      h_blank, 1, h_blank);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int imx471_init_state(struct v4l2_subdev *sd,
> > > +                          struct v4l2_subdev_state *sd_state)
> > > +{
> > > +     struct v4l2_subdev_format fmt = { };
> > > +
> > > +     fmt.which =
> > > +             sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> >
> > sd_state is always non-NULL here.
> I'll change to fmt.which=V4L2_SUBDEV_FORMAT_ACTIVE; here.

I'd just call imx471_update_pad_format() with imx471_modes[0].

-- 
Kind regards,

Sakari Ailus

