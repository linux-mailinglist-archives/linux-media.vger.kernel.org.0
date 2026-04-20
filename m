Return-Path: <linux-media+bounces-59179-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BwDAGeU5mnGyQEAu9opvQ
	(envelope-from <linux-media+bounces-59179-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 23:02:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CE3433E04
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 23:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9268A3010D89
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 21:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B6138A73A;
	Mon, 20 Apr 2026 21:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gG0tO6VD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D171E5724
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 21:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776718945; cv=none; b=SQpu6wzn9is6yUwB1g0uHjH0FbgPOyq9bi4WfrasAOd+JGnwODyHRcg9mzd8R5Dqe7kWF/4eejdda2YkS/K0GdaanXzGo9v9myvqRKnlAjo0TFVKvYfNnc7JiHOahOODrK5X/jmLJmqjAMBFN+qbth2QtCZLkQv1Gfnvo74enRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776718945; c=relaxed/simple;
	bh=6c6R0CVKdD0dMoez6bq2reMTUtIgam18+FQSEGNxgEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPHp2abMXIS40X9crtL3QLsGsx4T651mx7csggU4tjO0SOrM7P/RerWWRFOIuNw95WdtfFMQ6v201YQbmv8SQAjKdHj0242AB9cpBFftGDu8yVxwNgnwaSIPXJll8EaCCwroOetRA4fOAP3Oq9Dih9mdDi1VGti1kv/Omd0ANaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gG0tO6VD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776718944; x=1808254944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6c6R0CVKdD0dMoez6bq2reMTUtIgam18+FQSEGNxgEY=;
  b=gG0tO6VDueQ/41AYskLaZwlUgBUYQjmNV4F7em+lS2XQXi0eFBV8vSVW
   zeSvBZ1T2bjdDpiEYrF96tbDhKlbcqRUfGOCDGOBN8wF7KWAt2vlz9IHM
   UivzynGLoeDh4XAWqaHCm5iJOjdgyiKJAbOTDOKgGwGHhXGr1HUtJZA0f
   O7OMRsW1PdBwFw/7naPKkB8I7kc/hKPMq2ip1WziJ/ffutjhSKLHJKVVg
   xlWhWnGxgNuNozYsn1G2ee4bvWxLw0/HNubXRy82pd85Ykuh7t0ml6tAs
   YkY8em66HR0VablDk1arGfgyCciaWPT8Ld9DhHUSxnDueS8X/NVndOPoj
   w==;
X-CSE-ConnectionGUID: vRZoNOr5TkOY6vR7SG4qEQ==
X-CSE-MsgGUID: iYvr2JOmStCj94gDVMafKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="100303929"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="100303929"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 14:02:23 -0700
X-CSE-ConnectionGUID: T1qCgZthRBmVOnm504B6TA==
X-CSE-MsgGUID: EtIN9hRRRn+W0SyCAwri1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="236202126"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.228])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 14:02:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 72BF711F910;
	Tue, 21 Apr 2026 00:02:14 +0300 (EEST)
Date: Tue, 21 Apr 2026 00:02:14 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 05/29] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Message-ID: <aeaUVplesfPX_sx2@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-6-sakari.ailus@linux.intel.com>
 <adi17tFyi5uX1GpP@zed>
 <177626391137.489396.6706972719698320660@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177626391137.489396.6706972719698320660@freya>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-59179-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51CE3433E04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jai,

On Wed, Apr 15, 2026 at 08:08:31PM +0530, Jai Luthra wrote:
> Hi Sakari
> 
> Thank you for the patch, and sorry for the late response. I finally got
> time to test this out, there are some significant issues.
> 
> Did you test the behaviour with an IMX219 sensor before and after this
> series?
> 
> What I see is the following before this series:
> 
>     | Mode | HBLANK | VBLANK | Pixel Rate | Observed FPS | Formula FPS | Error
>     % |
>     |---|---:|---:|---:|---:|---:|---:|
>     | 640x480 | 2920 | 1227 | 364800000 | 60.07 | 60.03 | 0.07 |
>     | 640x480 | 4000 | 1227 | 364800000 | 46.09 | 46.06 | 0.07 |
>     | 640x480 | 6000 | 1227 | 364800000 | 32.20 | 32.18 | 0.05 |
>     | 640x480 | 2920 | 2000 | 364800000 | 41.32 | 41.32 | 0.00 |
>     | 640x480 | 2920 | 3000 | 364800000 | 29.45 | 29.45 | 0.01 |
>     | 1640x1232 | 1920 | 475 | 364800000 | 60.07 | 60.03 | 0.07 |
>     | 1640x1232 | 3000 | 475 | 364800000 | 46.09 | 46.06 | 0.07 |
>     | 1640x1232 | 5000 | 475 | 364800000 | 32.20 | 32.18 | 0.05 |
>     | 1640x1232 | 1920 | 1000 | 364800000 | 45.91 | 45.91 | -0.00 |
>     | 1640x1232 | 1920 | 2000 | 364800000 | 31.71 | 31.71 | 0.01 |
>     | 1920x1080 | 1528 | 683 | 182400000 | 30.01 | 30.01 | 0.01 |
>     | 1920x1080 | 2500 | 683 | 182400000 | 23.43 | 23.41 | 0.10 |
>     | 1920x1080 | 4000 | 683 | 182400000 | 17.48 | 17.48 | 0.02 |
>     | 1920x1080 | 1528 | 1200 | 182400000 | 23.20 | 23.20 | -0.01 |
>     | 1920x1080 | 1528 | 2000 | 182400000 | 17.18 | 17.18 | 0.03 |
> 
> 
> And after this series
> 
>     | Mode | HBLANK | VBLANK | Pixel Rate | Observed FPS | Formula FPS | Error
>     % |
>     |---|---:|---:|---:|---:|---:|---:|
>     | 640x480 | 2920 | 1227 | 182400000 | 30.02 | 30.02 | 0.02 |
>     | 640x480 | 4000 | 1227 | 182400000 | 23.03 | 23.03 | 0.00 |
>     | 640x480 | 6000 | 1227 | 182400000 | 16.09 | 16.09 | -0.02 |
>     | 640x480 | 2920 | 2000 | 182400000 | 20.66 | 20.66 | 0.00 |
>     | 640x480 | 2920 | 3000 | 182400000 | 14.72 | 14.72 | -0.02 |
> 
> So while the "formula" still works, we can't achieve high FPS capture we
> could before.

Could you test again with my metadata-pre branch, please?

> 
> With minimum blankings I could get around ~190 FPS capture before. Now it's
> just ~70 FPS.
> 
> And I couldn't even stream the any other mode than 640x480, because S_FMT
> on the sensor gives an error:
> 
> $ media-ctl -V '"imx219 1-0010":0 [fmt:SRGGB10_1X10/1920x1080 field:none]'
> Unable to setup formats: Numerical result out of range (34)
> 
> This patch sets vblank ranges and default values which don't work out:
>    - 1920x1080: min = 1080, default = 683
>    - 1640x1232: min = 616, default = -379
> 
> Quoting Jacopo Mondi (2026-04-10 14:12:22)
> > Hi Sakari
> > 
> > On Wed, Apr 08, 2026 at 06:39:14PM +0300, Sakari Ailus wrote:
> > > When vertical analogue binning is in use, the minimum frame length in
> > > lines decreases to around half of the normal. In relation to the sensor's
> > > output size this means vertical blanking can be negative but that's not an
> > > issue as control values are signed. Remove the workaround for this
> > > non-issue that doubled the pixel rate, frame length in lines and exposure
> > > time.
> > 
> > I don't think this was a workaround. Doubling the pixel rate and
> > halving the values written to registers for EXPOSURE and VBLANK
> > allowed userspace to maintain a consistent view while the driver
> > accounts for the special binning mode where, at least in my latest
> > understanding, the sensor averages two lines before passing them to
> > the ADC.
> > 
> > I am missing in which case, with the current driver implementation,
> > the vertical blanking can be negative.
> > 
> > >
> > > The resulting change also fixes the minimum, the maximum and the step
> > > values for the control.
> > >
> > > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Jai, and others including Dave and me, have spent quite some time
> > testing and implementing proper support for the special analogue
> > binning mode for this sensor. Of course we might have missed something
> > obvious, but I'm still missing what you're trying to fix here.
> > 
> 
> So, I tend to agree with Jacopo here. There's been a lot of effort to get
> this sensor give correct and high FPS frames.

Yet bugs seem to have remained -- see the beginning of the series. Which I
think indeed proves it's just hard to get these things right. The imx219 is
one of the most scrutinised drivers albeit the configurability it offers
still means there may be corner cases.

The metadata series indeed makes the driver freely configurable. I tested
earlier all configurations that have modes appear to be reachable through
the new APIs but not much more than that.

> 
> As we discussed offline, I don't mind the model where we have negative
> values for blankings, but the sensor should still work the same way, i.e.
> the same FPS range is supported with the new blanking and pixel rate model.
> 
> Otherwise that would count as breaking the userspace, especially for
> probably the most widely used sensor out there :/

I agree. And this is why we test and review code, right? :-)

-- 
Kind regards,

Sakari Ailus

