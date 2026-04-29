Return-Path: <linux-media+bounces-59928-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA+tAjSy8WmwjgEAu9opvQ
	(envelope-from <linux-media+bounces-59928-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:24:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6674906A9
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D153130511A4
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06B63A4F37;
	Wed, 29 Apr 2026 07:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WVx1kddy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD6B388374;
	Wed, 29 Apr 2026 07:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447408; cv=none; b=oIg7J30AoorCfdI4icvEMw9BPxeW3/VP2VHEfcng/29l7HT51GxvHK8h4c9iIkjeGq+fNwQtZVSSDbZtB8U+7kYDcG6eqM5ebv4IfKkBkkw7thEqvgG9K8gDhKGSTHqZk2pHRCvwAvDL6OVtPplF/6bk90Elp4B1lM9CBqI28Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447408; c=relaxed/simple;
	bh=myC8ZrIcO/JLr5kCTzobIlrn8vLb6kcE8jmiXVTHJ0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AV219sZ25mTC6NXAM8l/9EirUzBmpRwLodmoVlMUY7dJW6AnxWM896bbpIDnnQ5vXxeimjePOFMyJvKR44XVSG0bOzq3SaByp0KzyCxx6u3rIHs9uGvd92TJ/029yc+mrppcX0+L7IMD+7z4EK2HV9OwUafeFtInpdgyK+lubUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WVx1kddy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC8EB104C;
	Wed, 29 Apr 2026 09:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777447302;
	bh=myC8ZrIcO/JLr5kCTzobIlrn8vLb6kcE8jmiXVTHJ0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVx1kddyGbN/HF/VbQ2B6s9csJ8rnsElSouvX0vKoAybdZCFwN0K0P/yp6jvEEKZf
	 QOuykdPEaH9cgfEs5aZ63F/q5uThWvnLPJJXRcAlwpimzkjpythMNyd/42VsNPI01T
	 uZ+sXlMBNEgUiQTqg4g62aQBbAGqHPnycyh5diuk=
Date: Wed, 29 Apr 2026 10:23:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/6] media: Fix new smatch warnings
Message-ID: <20260429072323.GA8407@killaraus.ideasonboard.com>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <afC7qXCCkTTOS7jr@stanley.mountain>
 <CANiDSCvn3EbrPUiGYzE1zDHp=kKPJLAgHx17OJvv7gWLZM9tBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvn3EbrPUiGYzE1zDHp=kKPJLAgHx17OJvv7gWLZM9tBw@mail.gmail.com>
X-Rspamd-Queue-Id: BD6674906A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,chipsnmedia.com,intel.com,linuxfoundation.org,amlogic.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-59928-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim]

On Tue, Apr 28, 2026 at 03:58:08PM +0200, Ricardo Ribalda wrote:
> On Tue, 28 Apr 2026 at 15:52, Dan Carpenter wrote:
> > On Tue, Apr 28, 2026 at 12:41:06PM +0000, Ricardo Ribalda wrote:
> > > Current version of smatch triggers some warnings for the media tree.
> > > Most of them are inoffensive, but we would like to have zero smatch
> > > warnings.
> > >
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> > > drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> > > drivers/media/platform/chips-media/wave5/wave5-vpuapi.c:588 wave5_vpu_dec_get_output_info() error: buffer overflow 'inst->frame_buf' 64 <= 127
> > > drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
> > > drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
> > > drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max
> > > drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > I'm re-writing a bunch of core stuff right now...  Feel free to
> > complain about false positives.  I'm going to re-write the buffer
> > overflow warning in the next couple weeks.
> 
> The only one that deserves a complain is this one:
> https://lore.kernel.org/linux-media/CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com/T/#m650723c33ec0318d8f32f1a6cc74c74a952ae11a
> 
> There are other false positives like this one:
> https://lore.kernel.org/linux-media/CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com/T/#md58851baa54c511f57b05a4dcf3aecf0ffb1b1fa
> But I think the extra check makes the code more robust.

I think there's also a more general question. How can we tell smatch
(and other static analysis tools) that a value has been checked
elsewhere and is guaranteed to be within certain bounds, without
performing runtime bounds checking at the site where the value is used ?

> Thanks for your tool :)

-- 
Regards,

Laurent Pinchart

