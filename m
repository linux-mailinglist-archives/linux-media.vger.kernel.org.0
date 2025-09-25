Return-Path: <linux-media+bounces-43207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91551BA0890
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 18:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 425D6163C01
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 16:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4203019C1;
	Thu, 25 Sep 2025 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngGZIyUo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AC82DCF77;
	Thu, 25 Sep 2025 16:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758816261; cv=none; b=NPJNNvcSQtWjiXgxl4ruiroUiklQxenHKmWrL2EFiPK39Je0lXXqYpY0aVotts5fZz2ayvtOaev9lyp2Gja4FDEC1Kp++ya5TYMxgpSnt/1TrUg/1paKrnbsVnvYWWfNVvKiOe2rZNcx4HpJ+HJKJD0bL97gjKsG8RXugX6tRSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758816261; c=relaxed/simple;
	bh=1E5ge8SOU4T5+pXfKHbQ+r48nul2YYUlxybztB9Rju4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEdRsl6lnh3Rn95PZqD4rzVVQVhyvw+tj/2bfYK+InSDNqPdVpDmnjhRi/Uqbs+1BeEg9ZFCc24e+eu7DEce1u/G9Ouq5gGt+ZT6jlk/A/myS8TsWOB4+1SaLWU4562yRbLA15B7dkFGC3Ph5FpqZUtylLFEIePp6IP5nQaIxzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngGZIyUo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758816259; x=1790352259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1E5ge8SOU4T5+pXfKHbQ+r48nul2YYUlxybztB9Rju4=;
  b=ngGZIyUo5bP4tEE2KPLSNW08FpF8b3A15/bpW7Du17AB7E68kp3mVX67
   0IlylcrSD8tTDleZ+ylSEuKVz990/CJgWFJkRWN7j4136A9MB6UUB9KLx
   wd6rH0G1TXbrV5ITiTYli7rbpP+x3k7ylOBP1YZ8YJSB6u4XuWt+KjTwz
   pJOR9puR5TFxnQ1iqt2D/tKXYJpgdjyNZBE4hKMruc6+oaC0iOnIvFp8l
   9M7lAbG2mk0kRfv6woc7QvaWZJT8FLzC0XdSv4zzzjuD/PM1GscKSeKby
   sNjOiucOfjAfsfnvdg7TfMPe+mDHmKOn/jp7dl5NgKn7HuzpO9qMSVra5
   w==;
X-CSE-ConnectionGUID: naWX1Z/UQ5CSKLWDoCIigA==
X-CSE-MsgGUID: 59lGTJk7TBa5qi5hNhRflw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="71826111"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="71826111"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 09:04:18 -0700
X-CSE-ConnectionGUID: mUwjlDodTN2Q6XDzK41ODg==
X-CSE-MsgGUID: /87D4KspTQuQf5shor0ScQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="182632907"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.57])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 09:04:17 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0EC0011F99E;
	Thu, 25 Sep 2025 19:04:14 +0300 (EEST)
Date: Thu, 25 Sep 2025 19:04:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/1] media: v4l2-subdev / pdx86: int3472: Use
 "privacy" as con_id for the privacy LED
Message-ID: <aNVn_TeS--sdVFSf@kekkonen.localdomain>
References: <20250910104702.7470-1-hansg@kernel.org>
 <20250910104702.7470-2-hansg@kernel.org>
 <ccdf3f79-b1ad-a7cd-5e40-0fb8f70d05d4@linux.intel.com>
 <qWUcwd3SUhjavnDhfi9XGxQGsawpzg7ULgHBZllrjxgmELw17JPeZYZuN4bc_VvmoVzd73AmdyZfOcWyFzTvdYUNOG_ORuJhlzPgkxdyN-A=@vinarskis.com>
 <97ebc9ec-1087-400c-9453-947c414937c3@kernel.org>
 <aNPHwKQ2fJVgvVTI@kekkonen.localdomain>
 <58e4a3a2-ede5-4121-99da-03a78b6d1481@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58e4a3a2-ede5-4121-99da-03a78b6d1481@kernel.org>

Hi Hans,

On Wed, Sep 24, 2025 at 12:33:38PM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 24-Sep-25 12:28 PM, Sakari Ailus wrote:
> > Hi Hans, Aleksandrs,
> > 
> > On Wed, Sep 24, 2025 at 11:58:38AM +0200, Hans de Goede wrote:
> >> Hi All,
> >>
> >> On 24-Sep-25 9:06 AM, Aleksandrs Vinarskis wrote:
> >>>
> >>> On Wednesday, September 10th, 2025 at 12:51, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> wrote:
> >>>
> >>>>
> >>>>
> >>>> On Wed, 10 Sep 2025, Hans de Goede wrote:
> >>>>
> >>>>> During DT-binding review for extending the V4L2 camera sensor privacy LED
> >>>>> support to systems using devicetree, it has come up that having a "-led"
> >>>>> suffix for the LED name / con_id is undesirable since it already is clear
> >>>>> that it is a LED.
> >>>>>
> >>>>> Drop the "-led" suffix from the con_id in both the lookup table in
> >>>>> the int3472 code, as well as from the con_id led_get() argument in
> >>>>> the v4l2-subdev code.
> >>>>>
> >>>>> Signed-off-by: Hans de Goede hansg@kernel.org
> >>>>> ---
> >>>>> drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
> >>>>> drivers/platform/x86/intel/int3472/led.c | 2 +-
> >>>>> 2 files changed, 2 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >>>>> index 113eb74eb7c1..babcc1120354 100644
> >>>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >>>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >>>>> @@ -2602,7 +2602,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_is_streaming);
> >>>>> int v4l2_subdev_get_privacy_led(struct v4l2_subdev *sd)
> >>>>> {
> >>>>> #if IS_REACHABLE(CONFIG_LEDS_CLASS)
> >>>>> - sd->privacy_led = led_get(sd->dev, "privacy-led");
> >>>>> + sd->privacy_led = led_get(sd->dev, "privacy");
> >>>>> if (IS_ERR(sd->privacy_led) && PTR_ERR(sd->privacy_led) != -ENOENT)
> >>>>> return dev_err_probe(sd->dev, PTR_ERR(sd->privacy_led),
> >>>>> "getting privacy LED\n");
> >>>>> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
> >>>>> index f1d6d7b0cb75..b1d84b968112 100644
> >>>>> --- a/drivers/platform/x86/intel/int3472/led.c
> >>>>> +++ b/drivers/platform/x86/intel/int3472/led.c
> >>>>> @@ -43,7 +43,7 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gp
> >>>>>
> >>>>> int3472->pled.lookup.provider = int3472->pled.name;
> >>>>> int3472->pled.lookup.dev_id = int3472->sensor_name;
> >>>>> - int3472->pled.lookup.con_id = "privacy-led";
> >>>>> + int3472->pled.lookup.con_id = "privacy";
> >>>>> led_add_lookup(&int3472->pled.lookup);
> >>>>>
> >>>>> return 0;
> >>>>
> >>>>
> >>>> Acked-by: Ilpo Järvinen ilpo.jarvinen@linux.intel.com
> >>>>
> >>>
> >>> Hi all,
> >>>
> >>> Anything still pending before this patch can land? As DT-binding change that requires this [1] is already in linux-next it would be nice to land this in the same cycle.
> >>
> >> Hmm, I was under the impression this was already merged but I do not see it in:
> >>
> >> https://gitlab.freedesktop.org/linux-media/media-committers/
> >>
> >> Sakari, can you pick this one up please, preferably for
> >> 6.18 ?
> > 
> > Is the related DT binding change going to be merged for v6.18?
> 
> Just be clear / make sure we are on the same page 6.18 will be what
> is in -next now, so my request to merge this for 6.18 is a request
> to get this into -next before the merge-window which will open next
> Monday (or in the first fixes pull-req after the merge-window).

Ack, I'll pick this as a fix for v6.18.

-- 
Kind regards,

Sakari Ailus

