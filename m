Return-Path: <linux-media+bounces-65182-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rar2MpDaM2oIHQYAu9opvQ
	(envelope-from <linux-media+bounces-65182-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:46:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DB069FCE5
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:46:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=g+DnJLHq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65182-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65182-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA45F3050C8F
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418F6386429;
	Thu, 18 Jun 2026 11:46:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42CD35202A;
	Thu, 18 Jun 2026 11:46:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783169; cv=none; b=qRPE6yfWS8U5LnwDFrCnqVHvMXcpHERL9HuU2k2Jbme5Q0PLmdj++FLPx9coUwCCe+za+o58m+W3LCD3bI3KibNqFqz5JMZheubx3R/WTeKK9W9JJjmkznJRkOGjN4NlXwNsk0/nec6f8rlpomswVhDEFAdwpcIdhA7XZ8eHLVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783169; c=relaxed/simple;
	bh=zBOxcc15XlTx9hZEwn04/icC6SbcUPCa+Fc3jTXc0OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbWt42Grl+Kc53JKRqYd9447c3emYmszYHuzXx2wd6E7R4RNts5dKjNGFkRLEfnrbMWgT3kZVmS7sHlDw4xzoEaXGrObYCoG39vKSmAvvEfSOSDRq63MrlbxUNvSmdv1vf+S+w+UeazPY/iwmgv+kZIR4cVqR0Dq7jQZ0V+EAQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g+DnJLHq; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B24F741;
	Thu, 18 Jun 2026 13:45:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781783130;
	bh=zBOxcc15XlTx9hZEwn04/icC6SbcUPCa+Fc3jTXc0OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+DnJLHqxrGKLmcVbuqnA4giZZUpAPBGWHatK6JJSVaHjpOO4GGDYDnRWDjDEicSn
	 uBmk18TKECSFoE+uGDj/h8P7jR70L1qP5ygdTDCy3OptNv5BxoOF5UROdkAoTpgxHt
	 nUKKR4Nxt5gN9Z5lUJFTHBHme9XQ97xc6BVc1H/I=
Date: Thu, 18 Jun 2026 14:46:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] media: i2c: add os02g10 image sensor driver
Message-ID: <20260618114603.GA3345533@killaraus.ideasonboard.com>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-3-elgin.perumbilly@siliconsignals.io>
 <421ae63a-88c6-4e81-8478-7f581357676b@linaro.org>
 <MA0P287MB2178300B0541EC81B91312F588E32@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <fa5eb21d-ea67-47c9-b00e-6b9060e0c5f0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fa5eb21d-ea67-47c9-b00e-6b9060e0c5f0@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65182-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:elgin.perumbilly@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:mehdi.djait@linux.intel.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:bryan.odonoghue@linaro.org,m:himanshu.bhavani@siliconsignals.io,m:heimir.sverrisson@gmail.com,m:jingjing.xiong@intel.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[siliconsignals.io,linux.intel.com,kernel.org,oss.qualcomm.com,foss.st.com,linaro.org,gmail.com,intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35DB069FCE5

On Thu, Jun 18, 2026 at 02:06:20PM +0300, Vladimir Zapolskiy wrote:
> On 6/18/26 09:22, Elgin Perumbilly wrote:
> > Hi Vladimir,
> >   
> > Thank you for the review.
> >   
> > I have addressed all of the comments except for two, where I am not entirely
> > sure about the requested changes. Could you please take a look at the points
> > below and let me know your opinion?
> >   
> >> On 4/24/26 12:25, Elgin Perumbilly wrote:
> >>> Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.
> >>>
> >>> The Omnivision os02g10 is a CMOS image sensor with an active array size of
> >>> 1920 x 1080.
> >>>
> >>> The following features are supported:
> >>> - Manual exposure an gain control support
> >>> - vblank/hblank control support
> >>> - vflip/hflip control support
> >>> - Test pattern control support
> >>> - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)
> >>>
> >>> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> >>> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
> >   
> > ...
> >   
> >>> +#include <linux/array_size.h>
> >>> +#include <linux/bitops.h>
> >>> +#include <linux/cleanup.h>
> >>> +#include <linux/clk.h>
> >>> +#include <linux/container_of.h>
> >>> +#include <linux/delay.h>
> >>> +#include <linux/err.h>
> >>> +#include <linux/gpio/consumer.h>
> >>> +#include <linux/i2c.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/mutex.h>
> >>> +#include <linux/pm_runtime.h>
> >>> +#include <linux/property.h>
> >>> +#include <linux/regulator/consumer.h>
> >>> +#include <linux/units.h>
> >>> +#include <linux/types.h>
> >>> +#include <linux/time.h>
> >>> +#include <linux/regmap.h>
> >>
> >> Please sort the list of includes in alphabetical order, also you
> >> may consider to shrink the list by removing quite many inherited
> >> includes.
> >   
> > Some maintainers prefer the "include what you use" approach, like Andy,
> > so I added all the headers that are directly used. Should I now remove
> > any inherited includes?
> 
> Yes, here opinions may vary, that's why I asked for sorting and to

Sorting is a good idea.

> consider to remove some of the redundant headers. In my personal opinion
> this type of excessive information is not needed, especially if it is
> justified only by probable and far future trivial clean-up work.

I typically ask for a "include what you use" approach too, to avoid
build breakages. It's not only a matter of future work, but indirect
includes can also vary based on the kernel configuration (and the
architecture).

> >>> +#include <media/v4l2-cci.h>
> >>> +#include <media/v4l2-ctrls.h>
> >>> +#include <media/v4l2-device.h>
> >>> +#include <media/v4l2-fwnode.h>
> >>> +#include <media/v4l2-mediabus.h>
> >   
> > ...
> >   
> >>> +static int os02g10_set_framefmt(struct os02g10 *os02g10,
> >>> +                             struct v4l2_subdev_state *state)
> >>> +{
> >>> +     const struct v4l2_mbus_framefmt *format;
> >>> +     const struct os02g10_mode *mode;
> >>> +     int ret = 0;
> >>> +
> >>> +     format = v4l2_subdev_state_get_format(state, 0);
> >>> +     mode = v4l2_find_nearest_size(supported_modes,
> >>> +                                   ARRAY_SIZE(supported_modes), width,
> >>> +                                   height, format->width, format->height);
> >>> +
> >>> +     cci_write(os02g10->cci, OS02G10_REG_V_START, mode->y_start, &ret);
> >>> +     cci_write(os02g10->cci, OS02G10_REG_V_SIZE, mode->height, &ret);
> >>> +     cci_write(os02g10->cci, OS02G10_REG_V_SIZE_MIPI, mode->height, &ret);
> >>> +     cci_write(os02g10->cci, OS02G10_REG_H_START, mode->x_start, &ret);
> >>> +     cci_write(os02g10->cci, OS02G10_REG_H_SIZE, mode->width, &ret);
> >>> +     cci_write(os02g10->cci, OS02G10_REG_H_SIZE_MIPI, mode->width, &ret);
> >>> +
> >>> +     return ret;
> >>
> >> Just "return 0" here, and remove the local variable.
> >   
> > Could you clarify why this should return 0? The local ret is passed to all
> > cci_write() calls so that any write error is propagated. Returning 0 here
> > would appear to suppress those errors and always report success.
> 
> My bad, yes, here please leave 'return ret' as is, I was confused and
> misleaded by initialization of the local variable to zero, which is
> redundant, and I'd suggest to remove this initialization.

-- 
Regards,

Laurent Pinchart

