Return-Path: <linux-media+bounces-29285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8829CA79CC0
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 09:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C9DD188FA95
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 07:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C6E23F42D;
	Thu,  3 Apr 2025 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwWj/Opf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C894315C;
	Thu,  3 Apr 2025 07:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664614; cv=none; b=AkI4c8700bYNrq3pMB/bWUfwbB7dk7ABqeO2Avb7fFCdMp0sRMsr62aosI56llHeSntBQUTdxsjHl5f2ah0M2v0RqaW2+/V5ppn4HOF1woAkWmCE67eXmOkvj4DjZxViFkr8yfaahoDvyEzNBHMan+Yl5h0XReQ4AApczsIdtRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664614; c=relaxed/simple;
	bh=fMlKJ/ure0U0459vX4yNgWkeOwNh3v8dvhp3MW5oyQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnGtI2Pd9uOESvZcPIJdhlgi7sOLjijSUREqMMS9Hv9y942yBYlbTQ+INZPynoC7CSguetpCE6jja/ZhhoCWaFgfX4uvvH2S9q2ukOKu37TxJsr1vPigp6SYjV+ry6y0U16yCTr+xjG+KgrusjZKNoGdbaUKqX51OdnRI7SFO9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwWj/Opf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743664613; x=1775200613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fMlKJ/ure0U0459vX4yNgWkeOwNh3v8dvhp3MW5oyQI=;
  b=FwWj/Opflg9aseC4Uv1/wT1Q2vOIQ03hsfxmAPEfuorb8nNO2Fgl0qfS
   pO6DGC3oM7IFh+4VYTDl827M1iUTnitiiD0ehtz796wfL2IU5Weq6sNCf
   xcUYo4XVOISY4XlUcsjt0gjAyI7DGXtwoTlmrEWXDUTB5tbNMLQFmpnQl
   ith7qlNI4mvLhvDgYASEfLKVckQzxDHVnL7HriXE7Mpt0i/4dS7pU/pWw
   c5vwSCqjmY8PpfUNbV9YO+U8qCxDW/FsYS9MSrjTLCf/8NyiaULSnGgE0
   O6gO2xflCVmtx3XpErnZkVpe+h3QqfxZ49v7MlKhWOcJ37smFu/Fj5/8W
   Q==;
X-CSE-ConnectionGUID: K5rnaO7IS5GjzcZMUuCbWw==
X-CSE-MsgGUID: PBgYpmkqRD2jWtlUbVk0PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45179958"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="45179958"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 00:16:52 -0700
X-CSE-ConnectionGUID: nPMWlYSFQZ+Zx4HNqUZ0BQ==
X-CSE-MsgGUID: Tna6xcayTsOpsgXPkAy+3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="126832054"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 00:16:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 81B7911F9AC;
	Thu,  3 Apr 2025 10:16:46 +0300 (EEST)
Date: Thu, 3 Apr 2025 07:16:46 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/8] media: v4l: ctrls: add a control for flash/strobe
 duration
Message-ID: <Z-413oMpd59E_5o5@kekkonen.localdomain>
References: <Z9QwT7n7D09BEfqa@kekkonen.localdomain>
 <3dkwhfqxjhu3w4hpcl4gfsi22kwauo6s5urxrorezaw323yygq@nujmlkie5rpd>
 <Z9l04b5ZGy877j32@kekkonen.localdomain>
 <myyn53owptzx3dm3qmudtm4pmnon7axmjks2u5adno6ywktd3t@qriiifsitqoh>
 <Z9l9-tEwHRtXnz1a@kekkonen.localdomain>
 <s76b7q2cvcuk32n3jpsijyrhxhtstk6fewb5drkxdeopvt5grj@p4mcqltiza36>
 <Z9mNKG07sJcbnk3Z@kekkonen.localdomain>
 <CAPY8ntDzA+j97XB4VUfBtSH0RgpVKSdKxS1o5LnmoNDE1h=eyw@mail.gmail.com>
 <Z9qXJE8M_BW1VIKR@kekkonen.localdomain>
 <4un43tc6jdwyueefqyjyk7yzh34366uhakimtoat2lhutm3myn@ero3pn22qfm7>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4un43tc6jdwyueefqyjyk7yzh34366uhakimtoat2lhutm3myn@ero3pn22qfm7>

Hi Richard, Dave,

On Tue, Mar 25, 2025 at 09:20:29AM +0100, Richard Leitner wrote:
> Hi Dave, Hi Sakari
> 
> On Wed, Mar 19, 2025 at 10:06:28AM +0000, Sakari Ailus wrote:
> > Hi Dave,
> > 
> > On Tue, Mar 18, 2025 at 04:39:05PM +0000, Dave Stevenson wrote:
> > > Hi Sakari
> > > 
> > > On Tue, 18 Mar 2025 at 15:11, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Hi Richard,
> > > >
> > > > On Tue, Mar 18, 2025 at 03:46:18PM +0100, Richard Leitner wrote:
> 
> ...
> 
> > > > > The ov9282 driver uses the sensor in global shutter mode.
> > > > >
> > > > > I totally agree with your statement. This pattern is only useful for
> > > > > global shutter operation.
> > > >
> > > > I think (nearly?) all supported sensors use a rolling shutter.
> > > 
> > > You've got at least two other global shutter sensors supported in
> > > mainline - Omnivision ov7251 and Sony imx296.
> > > Patches have been posted for OnSemi ar0144 (Laurent) and ar0234
> > > (Dongcheng), which are also both global shutter sensors.
> > > 
> > > So yes they are in the minority, but not that uncommon.
> > 
> > Thanks for the list. I briefly discussed this with Laurent and I agree with
> > him this information would probably be best kept with userspace (libcamera)
> > without trying to enumerate it from the kernel (albeit CCS might be an
> > exception, but that's an entirely different discussion then). Only changing
> > the global/rolling configuration would require a control.
> 
> Thanks for the feeback and clarification!
> 
> So am I understanding this correctly that the flash/strobe duration
> approach in this series is basically fine?

I'd think so, yes.

> 
> If so I will send a v3 later today.

-- 
Regards,

Sakari Ailus

