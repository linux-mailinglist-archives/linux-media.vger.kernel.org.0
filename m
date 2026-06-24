Return-Path: <linux-media+bounces-65528-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EAxgFnerO2pcbAgAu9opvQ
	(envelope-from <linux-media+bounces-65528-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:03:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC44D6BD2B4
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:03:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Q1ZOkOi8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65528-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65528-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAB0F3020874
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934FD3AFCF8;
	Wed, 24 Jun 2026 10:02:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE83431326A;
	Wed, 24 Jun 2026 10:02:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295371; cv=none; b=hFoHxSkvaB5yMzLbEzZ4uNDkCiB9mvBQe/pbWXN6n6Dvrx29r5BPkvYgWbFpnXnnNFNbNC2abQHHx62lm7ZrI5LVCV/9qy6Cu4Q0x6d76VHpHlu9vi9xqvxREW2a+pjnxuUZ2Z1iDF8zBuN/sLZ9wqk0EsdG2tMGg9wwr2O5cA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295371; c=relaxed/simple;
	bh=+9R/5F5XJsVow6kO3ryXRujRFP7sQLyRIDdwr378asA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=davJuHWvAQsKMpI+wxU/RrtYYeg6pPbLD89KwmpwG8cTwEGD3HvuEmo7jsr++Y6IWlYEJ7awWWTPwRs5s4dlG6IGp9Qufst4K7Q1RTXiUiMKBeF2ey+7qcvH8PtqYRcV8prVuwQV7FG6QHIkgMz5Z5C9UZ/XIGmOMn1JaJYjFFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1ZOkOi8; arc=none smtp.client-ip=198.175.65.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782295370; x=1813831370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+9R/5F5XJsVow6kO3ryXRujRFP7sQLyRIDdwr378asA=;
  b=Q1ZOkOi8mwuQEooaf0//Obichlb3vWi3AXnh4xz5nmG88FmHm+yphAbh
   v8EvRSDvZh056fv9GrtwD4Icf0UtpxoTJgHWaFKNMpkslzPIHD+dX/aru
   t2Y1pHVERvQrMjatoeL7EWDqAByIXmRpEK865ion2A/5JZOls01p0d3C3
   /8QPJ26ZNRVXBFXn9/NsU0GLy1AmEORH/b/L8JltQMePKycFXrRliJTQN
   Yk/zrQsWAND48qnWndlZYPCpgRsqkJtexstl8MVinQZJxD2dvXmv09Qna
   HRiui/uUndDeERcErDuUFTLXFiR+l3g/PjbEYOiDtKUmE8miHY7XdC9ug
   A==;
X-CSE-ConnectionGUID: fkfILjiiQeG9SSSHOVlEQQ==
X-CSE-MsgGUID: DSgxgQaZSYyFkWQKAJxi7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83239753"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="83239753"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 03:02:50 -0700
X-CSE-ConnectionGUID: gk5c5M1sR/uhIvGpBO91yg==
X-CSE-MsgGUID: eqIWmdspShSCAYFrWx9z5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="254159923"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.168])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 03:02:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E372D121C4F;
	Wed, 24 Jun 2026 13:02:45 +0300 (EEST)
Date: Wed, 24 Jun 2026 13:02:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Damjan Georgievski <gdamjan@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <ajurRUp-mMUzWJQI@kekkonen.localdomain>
References: <20260624033508.27391-1-hpa@redhat.com>
 <20260624033508.27391-4-hpa@redhat.com>
 <ajubmHMhiuRyyLoM@kekkonen.localdomain>
 <CAEth8oF4-WY0M=644E6bRYDA+Djg+qz1Jx0KahXxYQghsO46ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEth8oF4-WY0M=644E6bRYDA+Djg+qz1Jx0KahXxYQghsO46ng@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65528-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hpa@redhat.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,intel.com,siliconsignals.io,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,intel.com:dkim,intel.com:email,vger.kernel.org:from_smtp,kekkonen.localdomain:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC44D6BD2B4

Hi Kate,

On Wed, Jun 24, 2026 at 05:30:59PM +0800, Kate Hsuan wrote:
> Hi Sakari,
> 
> Thank you for reviewing.
> 
> On Wed, Jun 24, 2026 at 4:56 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Kate,
> >
> > Thanks for the update.
> >
> > On Wed, Jun 24, 2026 at 11:35:08AM +0800, Kate Hsuan wrote:
> > ...
> >
> > > +static int imx471_set_pad_format(struct v4l2_subdev *sd,
> > > +                              struct v4l2_subdev_state *sd_state,
> > > +                              struct v4l2_subdev_format *fmt)
> > > +{
> > > +     struct imx471 *sensor = to_imx471(sd);
> > > +     const struct imx471_mode *mode;
> > > +     int h_blank, ret;
> > > +
> > > +     mode = v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471_modes),
> > > +                                   width, height, fmt->format.width,
> > > +                                   fmt->format.height);
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
> > > +     ret = __v4l2_ctrl_modify_range(sensor->vblank,
> > > +                                    mode->fll_min - mode->height,
> > > +                                    IMX471_FLL_MAX - mode->height,
> > > +                                    1,
> > > +                                    mode->fll_def - mode->height);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     h_blank = mode->llp - mode->width;
> > > +     /*
> > > +      * Currently hblank is not changeable.
> > > +      * So FPS control is done only by vblank.
> > > +      */
> > > +     return __v4l2_ctrl_modify_range(sensor->hblank, h_blank,
> > > +                                     h_blank, 1, h_blank);
> > > +}
> >
> > ...
> >
> > > +
> > > +static int imx471_init_state(struct v4l2_subdev *sd,
> > > +                          struct v4l2_subdev_state *sd_state)
> > > +{
> > > +     struct v4l2_subdev_format fmt = {
> > > +             .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> >
> > The purpose of the init_state op is to initialise the provided state only,
> > it's not allowed to change the sensor configuration.
> 
> The input parameter sd_state could initialise it. I'll change this as follows
> .which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;

sd_state is supposed to be always non-NULL. So you can use FORMAT_TRY
always.

-- 
Regards,

Sakari Ailus

