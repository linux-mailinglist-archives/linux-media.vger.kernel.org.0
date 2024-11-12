Return-Path: <linux-media+bounces-21298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD479C55FC
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 12:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 008BD2838AE
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 11:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A7021D238;
	Tue, 12 Nov 2024 10:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yl+2gyNY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217FB21D230;
	Tue, 12 Nov 2024 10:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731408570; cv=none; b=P6Ym6Q4yNGCJfkzJ+aNrZTR4BQ3Mk5FO6N8f1rYcdNptLMYXH9Irojp6epjFkq801ttjc0Gm65cvleOKlt4l+cgSZgS2BE2Qd4cFcI9IR6JBmqjiM1lt7YSSrKTPrSpUuXGLyJn+agmzmvt202lk4M2LhYuI52mSWvrHlY3qDRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731408570; c=relaxed/simple;
	bh=Jxa8ZokOau2HkkKxBChAVF5TbIVaPYQgdafFIUtzKFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9NyznMdP97uppQpJlg3sbY6619+RZamxEpXLVwwfimxT/GNvw2OmGbtgvMZjzufb4gNs9hpzovHVGP++UgM9bO0/xaQGfJFVl7RESLv/Q72JqtZqIuyQ8nCmUsppsofk4a7llEJZDLCVpmM7SqK8Xax+6Z0ZMGTybcJNtr9qfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yl+2gyNY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731408569; x=1762944569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jxa8ZokOau2HkkKxBChAVF5TbIVaPYQgdafFIUtzKFI=;
  b=Yl+2gyNYs/XMofWReIjbX5/u17kzbwBUZotQplxGur6nEuqAY4oj280g
   TqRFpa9E2mdhxq81ewKoWRKsDVrIy/s02ExQ1jeTq7+99NtDaWjWzuQ59
   W/i/kFdgL0nhSJGpj3JRAJuklGxmV9uXmdTNmEtIuVIhZiUFZRJ5LjO4L
   FZnJV0jfXioGx2t8J4IY6cWOsHWZm12QlQZ+ULOxkArjivV9zLKE02p73
   JWMTYHqKq2t+5G/f5OlJig2esbB1c13W6JhWARXKoq64HqeQ8AqvpHVaM
   n7DXyejmjOKzmZpqi0c9Oql2V9X1IQILcejW3L4Elk6MYbZ8EKwG8i1pY
   Q==;
X-CSE-ConnectionGUID: 3hpUvWxjR2WJOtcZ9Iv44A==
X-CSE-MsgGUID: CGfzPgb0QNeGAeZfqWLdUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="35169100"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="35169100"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 02:49:29 -0800
X-CSE-ConnectionGUID: 4A+3ji+gScmQe6XNGJ5Qog==
X-CSE-MsgGUID: uQvZQiNWQX2TxW7ojgCz/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="91892665"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 02:49:27 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 93AFA11F83B;
	Tue, 12 Nov 2024 12:49:24 +0200 (EET)
Date: Tue, 12 Nov 2024 10:49:24 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: imx219: make HBLANK r/w to allow longer
 exposures
Message-ID: <ZzMytF509nZ8CYGZ@kekkonen.localdomain>
References: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
 <20241029-imx219_fixes-v1-2-b45dc3658b4e@ideasonboard.com>
 <ZySV3KKXSyIreRI4@kekkonen.localdomain>
 <CAPY8ntDF8W+xRBXbe=LYpg21LL7-svhCySTSJHRNiDzQs4Xw5Q@mail.gmail.com>
 <Zy3oKnHBiGOq8Uoj@kekkonen.localdomain>
 <CAPY8ntD4Q4f5fSC+xW=j-5T38_Zb5x7pGQM4RYVzrz+NJMGtUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntD4Q4f5fSC+xW=j-5T38_Zb5x7pGQM4RYVzrz+NJMGtUQ@mail.gmail.com>

Hi Dave,

On Mon, Nov 11, 2024 at 07:37:56PM +0000, Dave Stevenson wrote:
> Hi Sakari
> 
> On Fri, 8 Nov 2024 at 10:30, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dave,
> >
> > On Thu, Nov 07, 2024 at 12:43:52PM +0000, Dave Stevenson wrote:
> > > Hi Sakari
> > >
> > > On Fri, 1 Nov 2024 at 08:48, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Hi Jai,
> > > >
> > > > On Tue, Oct 29, 2024 at 02:27:36PM +0530, Jai Luthra wrote:
> > > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > >
> > > > > The HBLANK control was read-only, and always configured such
> > > > > that the sensor HTS register was 3448. This limited the maximum
> > > > > exposure time that could be achieved to around 1.26 secs.
> > > > >
> > > > > Make HBLANK read/write so that the line time can be extended,
> > > > > and thereby allow longer exposures (and slower frame rates).
> > > > > Retain the overall HTS setting when changing modes rather than
> > > > > resetting it to a default.
> > > >
> > > > It looks like this changes horizontal blanking at least in some cases. Does
> > > > this also work as expected in binned modes, for instance?
> > > >
> > > > Many sensors have image quality related issues on untested albeit
> > > > functional line length values.
> > > >
> > > > So my question is: how has this been validated?
> > >
> > > Validated by Sony, or others?
> > > I've tested a range of values in all modes and not observed any image
> > > quality issues.
> >
> > Somehow at least. :-)
> >
> > >
> > > From previous discussions with Sony, they always provide their big
> > > spreadsheet of register values for the specific mode and frame rate
> > > requested. I don't think they even officially state that changing
> > > VTS/FRM_LENGTH_LINES to change the framerate is permitted.
> > > There are some Sony datasheets (eg imx258) that state "set to X. Any
> > > other value please confirm with Sony", but that isn't the case for the
> > > imx219 datasheet. I take that as it is permitted within the defined
> > > ranges.
> >
> > I'm not that much concerned of vertical blanking, changing that within the
> > valid range has effects on the image itself very seldom. Horizontal
> > blanking is different though and this is what the patch makes changeable,
> > including a change in the default value. Of course there are big
> > differences between sensors here.
> 
> The intention was that the default value shouldn't change, and as the
> overall PIXELS_PER_LINE value was meant to be retained on a mode
> change the value used should only change if an application changes
> V4L2_CID_HBLANK. If I blundered in the implementation of that, then
> that should be fixed (I know Jacopo made comments, but I haven't had a
> chance to investigate).

I guess I misread the patch. It indeed should be the same.

> 
> I doubt we'd get validation from Sony beyond the contents of the
> datasheet. Potentially as the sensor is so old they don't have the
> information or engineers involved.
> I'm happy to set up a test system and capture a set of images with
> HBLANK from min to max at some increment. With the same exposure and
> gain they should all be identical as long as there isn't any movement
> (rolling shutter with longer readout times and all that). Would that
> be satisfactory?

Sounds good to me. I just thought how it actually had been tested. :-)

> 
> For contrast, the IMX290 datasheet states that VMAX shall be fixed at
> 0x465 for all-pixel mode / 0x2ee for 720p mode, and HMAX should be
> changed for frame rate control. As you say, sensors differ.

-- 
Kind regards,

Sakari Ailus

