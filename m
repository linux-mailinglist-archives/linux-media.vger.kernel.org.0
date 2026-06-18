Return-Path: <linux-media+bounces-65177-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hWj/B4jPM2p5GgYAu9opvQ
	(envelope-from <linux-media+bounces-65177-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:59:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5E469F8C5
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:59:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=FqQ7Y0DC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65177-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65177-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EB2B307D41E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 10:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCEAA3D813C;
	Thu, 18 Jun 2026 10:57:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF2B26B764;
	Thu, 18 Jun 2026 10:56:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780220; cv=none; b=mJOIqg7pwDDn6l8N/MlMXiW2ZCxJ5+AlfXqY7oFeVH+XMg3mvTOX8M9hnCcBQg/yH1NjjtAhDOyxuzvzUt9ZDqY4qakoQZOJQkC8P9nPnVMBgpVLMQmvwbmc8+7g6j5oSJL9nJG8K08kOcTdZLYmd6uY8DjnQdzb5jUCr5JHdIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780220; c=relaxed/simple;
	bh=+ymsNrzDLdgJtptnPbvQpPijZL9PtQnAzZX1vRE3l/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AimSPXzz5ljLtFdtCNKfmD2H9DU7PLynJf6sWsocfPAzTy9vOsUWYLp4Y9uogEwrZ3zIVFJebTElhNYNEQlYEgL2z3N8g/IfNQir5Z3q03PoGA1HLtY++wZwkC73kceOjxK8dmsoaJh9pSiuUG9oaO5/6XzJH/vRo9xkA6BCkBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqQ7Y0DC; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781780217; x=1813316217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+ymsNrzDLdgJtptnPbvQpPijZL9PtQnAzZX1vRE3l/Q=;
  b=FqQ7Y0DCyix0HvshPkN3xitEjrfQmA/c7uwWmh5PcF/8ZvbbaN+N3Glf
   nNGqQilEY1UzOHkMHb90FCmOet+4cj+xAVGFwRQa1cfRoNpxQJjxiU6mN
   3kHkZfL7kcyDtRbORfJCLZWdXwLmrtsmIF0kCCcXmqdtXPamrzrv1IYwR
   3yDh0rRV7e4g7NOdbPcvxHGiXIkZAEeUQ4ozFvIn6Qb5CsmhQwKNs+4Y/
   uLMW8vVYrfwtUbyy3iMUXMdHiNbW1+ac/KIdmMEc3VRAoHzVPcRbBggxq
   HEjDkngaZZRlm44vnjaGzxKh3uYZHre+QLPqDsWyGjrsBiOM4ycxqMcuZ
   Q==;
X-CSE-ConnectionGUID: 8LnWaRZqQhWWdw6+ZVEexg==
X-CSE-MsgGUID: 94BGtXklSYqLoeWNtiirhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82614603"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82614603"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 03:56:56 -0700
X-CSE-ConnectionGUID: JsPYrvVASr+694L0BpLKeA==
X-CSE-MsgGUID: PdOrZZbjSMe8LcQbD/IbeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="250235514"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.24])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 03:56:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 91816121C36;
	Thu, 18 Jun 2026 13:56:49 +0300 (EEST)
Date: Thu, 18 Jun 2026 13:56:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <ajPO8cOS_jgJIcqD@kekkonen.localdomain>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-3-elgin.perumbilly@siliconsignals.io>
 <421ae63a-88c6-4e81-8478-7f581357676b@linaro.org>
 <MA0P287MB2178300B0541EC81B91312F588E32@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB2178300B0541EC81B91312F588E32@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-65177-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:elgin.perumbilly@siliconsignals.io,m:vladimir.zapolskiy@linaro.org,m:laurent.pinchart@ideasonboard.com,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:mehdi.djait@linux.intel.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:bryan.odonoghue@linaro.org,m:himanshu.bhavani@siliconsignals.io,m:heimir.sverrisson@gmail.com,m:jingjing.xiong@intel.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,ideasonboard.com,siliconsignals.io,kernel.org,oss.qualcomm.com,linux.intel.com,foss.st.com,gmail.com,intel.com,vger.kernel.org];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:email,linux.intel.com:from_mime,intel.com:dkim,vger.kernel.org:from_smtp,kekkonen.localdomain:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B5E469F8C5

Hi Elgin, Vladimir,

On Thu, Jun 18, 2026 at 06:22:14AM +0000, Elgin Perumbilly wrote:
> Hi Vladimir,
>  
> Thank you for the review.
>  
> I have addressed all of the comments except for two, where I am not entirely
> sure about the requested changes. Could you please take a look at the points
> below and let me know your opinion?
>  
> > On 4/24/26 12:25, Elgin Perumbilly wrote:
> > > Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.
> > >
> > > The Omnivision os02g10 is a CMOS image sensor with an active array size of
> > > 1920 x 1080.
> > >
> > > The following features are supported:
> > > - Manual exposure an gain control support
> > > - vblank/hblank control support
> > > - vflip/hflip control support
> > > - Test pattern control support
> > > - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)
> > >
> > > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> > > Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
>  
> ...
>  
> > > +#include <linux/array_size.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/cleanup.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/container_of.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/err.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/property.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <linux/units.h>
> > > +#include <linux/types.h>
> > > +#include <linux/time.h>
> > > +#include <linux/regmap.h>
> >
> > Please sort the list of includes in alphabetical order, also you
> > may consider to shrink the list by removing quite many inherited
> > includes.
>  
> Some maintainers prefer the "include what you use" approach, like Andy,
> so I added all the headers that are directly used. Should I now remove
> any inherited includes?

Andy has been indeed asking to include what you use; this way cleaning up
the headers in the future becomes possible.

>  
> > > +#include <media/v4l2-cci.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +#include <media/v4l2-mediabus.h>
>  
> ...
>  
> > > +static int os02g10_set_framefmt(struct os02g10 *os02g10,
> > > +                             struct v4l2_subdev_state *state)
> > > +{
> > > +     const struct v4l2_mbus_framefmt *format;
> > > +     const struct os02g10_mode *mode;
> > > +     int ret = 0;
> > > +
> > > +     format = v4l2_subdev_state_get_format(state, 0);
> > > +     mode = v4l2_find_nearest_size(supported_modes,
> > > +                                   ARRAY_SIZE(supported_modes), width,
> > > +                                   height, format->width, format->height);
> > > +
> > > +     cci_write(os02g10->cci, OS02G10_REG_V_START, mode->y_start, &ret);
> > > +     cci_write(os02g10->cci, OS02G10_REG_V_SIZE, mode->height, &ret);
> > > +     cci_write(os02g10->cci, OS02G10_REG_V_SIZE_MIPI, mode->height, &ret);
> > > +     cci_write(os02g10->cci, OS02G10_REG_H_START, mode->x_start, &ret);
> > > +     cci_write(os02g10->cci, OS02G10_REG_H_SIZE, mode->width, &ret);
> > > +     cci_write(os02g10->cci, OS02G10_REG_H_SIZE_MIPI, mode->width, &ret);
> > > +
> > > +     return ret;
> >
> > Just "return 0" here, and remove the local variable.
>  
> Could you clarify why this should return 0? The local ret is passed to all
> cci_write() calls so that any write error is propagated. Returning 0 here
> would appear to suppress those errors and always report success.

The code seems fine to me.

-- 
Regards,

Sakari Ailus

