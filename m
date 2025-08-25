Return-Path: <linux-media+bounces-40906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 133F6B3384A
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 058C11895BE6
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BF8299948;
	Mon, 25 Aug 2025 07:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKL5JVYP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549CD14F70;
	Mon, 25 Aug 2025 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756108500; cv=none; b=ikNc1CU3DJRE9/ZlYBoVIJTtSnojIb10wc6ZnVMxK+1gosfdiD0J49WubGKCmKltsu8FI5IKcrftyO+29a6OAB//b5P3F1YeXTQQdePw2Y7Civk0FnzGvyCtRLX260x3AEb3VAt6Pj81d1nqo1Ago+gXG/nH79YEehp0HlcZoC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756108500; c=relaxed/simple;
	bh=tnERFtuwx/0KAvpsxc7xSwCVJ5+TEdN/2UKJKWWValA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwucyIkVAUxk3/bo43pJOGCq0Xi/9y9x+BTUMQEyG6dEGXPNTzxqLMc2/nvAw5e6p8oanPDwS8tHkhSp2QML6TTGCvzgCj7wXPdFpi/fltRHWpChecNy8uicrtN3ULBbLoSAfPXPJf0onWlD4fOmDARuLXm5Jg2/p6YQswCDOIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKL5JVYP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756108499; x=1787644499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tnERFtuwx/0KAvpsxc7xSwCVJ5+TEdN/2UKJKWWValA=;
  b=NKL5JVYPHa+fZ9MkORMIbxv75BdSp26cch+L1q1rFA39m3i7S9mnMKSJ
   IQI0CtlCJIlQa/Na3IE9ad9p0yqbuafT3c31hEh7m3soPIi/fWr4BF+Oq
   sLz/S1M8kQN9jPlL4moIxJrMbXzY4RNHATdtZpd36JhZaJugAcP0ky/2K
   81CvaJFaEOt695NaRs7dq44NBJ3Be/IZqyajVZivnLWcIO7rD755bGtmy
   9OIT+SmHTS3wMj6XPgpG6bdsjgyX7dS/+WLvLTKLbWooyfi/KuO9b5Q63
   2Kqe/nlvYPcaguxw357QQrVn6Lnes9rLau3ngiTsghwcGj+EBqK6uyPTg
   g==;
X-CSE-ConnectionGUID: SldSSXo4RImoGZYnEhJa/w==
X-CSE-MsgGUID: nnNsNJ2IQx2bnHfiYYmujw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58257444"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58257444"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 00:54:58 -0700
X-CSE-ConnectionGUID: jOO+zamcTCeDQo68mG767Q==
X-CSE-MsgGUID: 6EB3dYYARiO0ROnWQb768g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174510333"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 00:54:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A94B712023C;
	Mon, 25 Aug 2025 10:54:53 +0300 (EEST)
Date: Mon, 25 Aug 2025 10:54:53 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Allen Ballway <ballway@chromium.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ov8865: move mode_configure out of state_configure
Message-ID: <aKwWzQGY_dsP8hg0@kekkonen.localdomain>
References: <20250722-mode_configure-v1-1-5ea35052a01f@chromium.org>
 <20250723154753.GH6719@pendragon.ideasonboard.com>
 <CAEs41JCctnTgwY-ePrB+kwY7nUvJuMAttZ894PzhL-b_SF7uNQ@mail.gmail.com>
 <20250723170237.GE14576@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250723170237.GE14576@pendragon.ideasonboard.com>

Hi Allen, Laurent,

On Wed, Jul 23, 2025 at 08:02:37PM +0300, Laurent Pinchart wrote:
> On Wed, Jul 23, 2025 at 09:40:42AM -0700, Allen Ballway wrote:
> > On Wed, Jul 23, 2025 at 8:47 AM Laurent Pinchart wrote:
> > > On Tue, Jul 22, 2025 at 01:35:43PM -0700, Allen Ballway wrote:
> > > > ov8865_mode_configure() only needs to be called on sensor init, but it can
> > > > be called multiple times from ov8865_state_configure(). Move
> > > > ov8865_mode_configure() to ov8865_sensor_init().
> > > >
> > > > Signed-off-by: Allen Ballway <ballway@chromium.org>
> > > > ---
> > > >  drivers/media/i2c/ov8865.c | 15 +++++++--------
> > > >  1 file changed, 7 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> > > > index 95ffe7536aa6aba814f4e5c3d12e7279470b2f07..1d1a1f261bf4ab5c09848402dc057e2f572504e7 100644
> > > > --- a/drivers/media/i2c/ov8865.c
> > > > +++ b/drivers/media/i2c/ov8865.c
> > > > @@ -2304,14 +2304,6 @@ static int ov8865_state_configure(struct ov8865_sensor *sensor,
> > > >       if (sensor->state.streaming)
> > > >               return -EBUSY;
> > > >
> > > > -     /* State will be configured at first power on otherwise. */
> > > > -     if (pm_runtime_enabled(sensor->dev) &&
> > > > -         !pm_runtime_suspended(sensor->dev)) {
> > > > -             ret = ov8865_mode_configure(sensor, mode, mbus_code);
> > > > -             if (ret)
> > > > -                     return ret;
> > > > -     }
> > > > -
> > > >       ret = ov8865_state_mipi_configure(sensor, mode, mbus_code);
> > > >       if (ret)
> > > >               return ret;
> > > > @@ -2384,6 +2376,13 @@ static int ov8865_sensor_init(struct ov8865_sensor *sensor)
> > > >       }
> > > >
> > > >       /* Configure current mode. */
> > > > +     ret = ov8865_mode_configure(sensor, sensor->state.mode,
> > > > +                                  sensor->state.mbus_code);
> > >
> > > How about the implication on ov8865_set_fmt() that will not update the
> > > link freq and pixel rate controls anymore ?
> > 
> > I believe those will be unaffected by this change, they are updated in
> > ov8865_state_mipi_configure() which is still called from
> > ov8865_set_fmt() via ov8865_state_configure().
> 
> You're right, my bad.
> 
> > > > +     if (ret) {
> > > > +             dev_err(sensor->dev, "failed to configure mode\n");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > >       ret = ov8865_state_configure(sensor, sensor->state.mode,
> > > >                                    sensor->state.mbus_code);
> 
> Can't we drop this now ? The remaining code in ov8865_state_configure()
> updates the link frequency and pixel rate controls, and sets
> sensor->state.mode and sensor->state.mbus_code. The latter is a no-op
> here as they're set to their current value, and the controls shouldn't
> need an update in this function as it's only called from
> ov8865_resume().

Any comments on this? Will there be v2?

-- 
Sakari Ailus

