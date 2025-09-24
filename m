Return-Path: <linux-media+bounces-43048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 138A3B996DB
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 12:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 495721896D54
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 10:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB5C2DEA6A;
	Wed, 24 Sep 2025 10:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8vjPhsb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10141C27;
	Wed, 24 Sep 2025 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758709708; cv=none; b=XMyR0Q2lJ7uXjPY3wn1ULWtcDMVwjhkiBIXT2s/OnzeNKjomukQUUizIVUUr8TCpYunkuWh7wArwtHf6697VAJWjR8VyZQDHxy25ybTyd79AcRkuDB0p97Nofy/5fthxeb4b/bS1prlkzMHkxxmE9YhT7vTawRt5PXZbbhvepqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758709708; c=relaxed/simple;
	bh=PUm/MckmMuqc3RDJS00hIM2rP4ZPlxtPlpRdpa5ukWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5ADji8ifBXjrhJCvk3PoReXWINUBdZGBZEfbGuoU7MLjbNpu6r9fqQ39nnfsCMuGcUkTaVRx61sGdwPxa/IH87Vi87vZmzD3MXmtkDhBqZcbko1QnUxxhhPATO0JdW6rc3CKMNA/5oU6pYTvbKGQX+y5uRIFbekma7SWQhh8HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8vjPhsb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758709703; x=1790245703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PUm/MckmMuqc3RDJS00hIM2rP4ZPlxtPlpRdpa5ukWA=;
  b=k8vjPhsbr1APx+DPLt9l0uWeqdyuzw0vtJl7xHWV9DsG8EBUdbB4I1IG
   Qne4Z/3vu9CLxyuIC1j6qVuLaYWb3DSnuLIsnXILfNk9YWGeR1V5wycEg
   Mf3ZvpqgeLL7+ycBi4dam91nu/wISCimpx3TScOa2CKn+O62c9bqMqfT7
   96CeJB9KCuVyGy6KlesCKTsFIHyDHQSX4ztS8tkMGF1hHMEmJjLK5zMKy
   uyhVj9grTzqX03UzLmRK9+CCEtooZjTzDswwMQxnpNkYF9oyuuW4uQIgq
   VkHqc2Cm3vKmPDO/PZ5Dq6ZgDPKqkNi+mrVvt8X1ODY3pY1ysqSpoTOgz
   Q==;
X-CSE-ConnectionGUID: T/WxrY5iTVqoiBuGUgRt5w==
X-CSE-MsgGUID: 4xHeBcS9QjOCduJURZZyVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61116034"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="61116034"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 03:28:22 -0700
X-CSE-ConnectionGUID: QczX+i3VRpO3EH8Z0FFLVg==
X-CSE-MsgGUID: dwv3m2PKSsClDWI0B0aGkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="214127924"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.128])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 03:28:20 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7923C11FA4A;
	Wed, 24 Sep 2025 13:28:16 +0300 (EEST)
Date: Wed, 24 Sep 2025 13:28:16 +0300
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
Message-ID: <aNPHwKQ2fJVgvVTI@kekkonen.localdomain>
References: <20250910104702.7470-1-hansg@kernel.org>
 <20250910104702.7470-2-hansg@kernel.org>
 <ccdf3f79-b1ad-a7cd-5e40-0fb8f70d05d4@linux.intel.com>
 <qWUcwd3SUhjavnDhfi9XGxQGsawpzg7ULgHBZllrjxgmELw17JPeZYZuN4bc_VvmoVzd73AmdyZfOcWyFzTvdYUNOG_ORuJhlzPgkxdyN-A=@vinarskis.com>
 <97ebc9ec-1087-400c-9453-947c414937c3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97ebc9ec-1087-400c-9453-947c414937c3@kernel.org>

Hi Hans, Aleksandrs,

On Wed, Sep 24, 2025 at 11:58:38AM +0200, Hans de Goede wrote:
> Hi All,
> 
> On 24-Sep-25 9:06 AM, Aleksandrs Vinarskis wrote:
> > 
> > On Wednesday, September 10th, 2025 at 12:51, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> wrote:
> > 
> >>
> >>
> >> On Wed, 10 Sep 2025, Hans de Goede wrote:
> >>
> >>> During DT-binding review for extending the V4L2 camera sensor privacy LED
> >>> support to systems using devicetree, it has come up that having a "-led"
> >>> suffix for the LED name / con_id is undesirable since it already is clear
> >>> that it is a LED.
> >>>
> >>> Drop the "-led" suffix from the con_id in both the lookup table in
> >>> the int3472 code, as well as from the con_id led_get() argument in
> >>> the v4l2-subdev code.
> >>>
> >>> Signed-off-by: Hans de Goede hansg@kernel.org
> >>> ---
> >>> drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
> >>> drivers/platform/x86/intel/int3472/led.c | 2 +-
> >>> 2 files changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> index 113eb74eb7c1..babcc1120354 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> @@ -2602,7 +2602,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_is_streaming);
> >>> int v4l2_subdev_get_privacy_led(struct v4l2_subdev *sd)
> >>> {
> >>> #if IS_REACHABLE(CONFIG_LEDS_CLASS)
> >>> - sd->privacy_led = led_get(sd->dev, "privacy-led");
> >>> + sd->privacy_led = led_get(sd->dev, "privacy");
> >>> if (IS_ERR(sd->privacy_led) && PTR_ERR(sd->privacy_led) != -ENOENT)
> >>> return dev_err_probe(sd->dev, PTR_ERR(sd->privacy_led),
> >>> "getting privacy LED\n");
> >>> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
> >>> index f1d6d7b0cb75..b1d84b968112 100644
> >>> --- a/drivers/platform/x86/intel/int3472/led.c
> >>> +++ b/drivers/platform/x86/intel/int3472/led.c
> >>> @@ -43,7 +43,7 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gp
> >>>
> >>> int3472->pled.lookup.provider = int3472->pled.name;
> >>> int3472->pled.lookup.dev_id = int3472->sensor_name;
> >>> - int3472->pled.lookup.con_id = "privacy-led";
> >>> + int3472->pled.lookup.con_id = "privacy";
> >>> led_add_lookup(&int3472->pled.lookup);
> >>>
> >>> return 0;
> >>
> >>
> >> Acked-by: Ilpo Järvinen ilpo.jarvinen@linux.intel.com
> >>
> > 
> > Hi all,
> > 
> > Anything still pending before this patch can land? As DT-binding change that requires this [1] is already in linux-next it would be nice to land this in the same cycle.
> 
> Hmm, I was under the impression this was already merged but I do not see it in:
> 
> https://gitlab.freedesktop.org/linux-media/media-committers/
> 
> Sakari, can you pick this one up please, preferably for
> 6.18 ?

Is the related DT binding change going to be merged for v6.18? I had this
queued for v6.19 but I don't see a problem with merging it as a fix for
v6.18 either.

-- 
Regards,

Sakari Ailus

