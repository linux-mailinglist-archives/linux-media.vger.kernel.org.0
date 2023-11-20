Return-Path: <linux-media+bounces-584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E07F0BE3
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 07:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 587271C203E0
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 06:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C3128FA;
	Mon, 20 Nov 2023 06:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJIWYTrI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0D6DB
	for <linux-media@vger.kernel.org>; Sun, 19 Nov 2023 22:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700462119; x=1731998119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JNbo47CdwH0f2jjRGLDiWqQIx6siulqgCMxoPgVB5DU=;
  b=NJIWYTrIeGPS93yh8SNzBzSkiGbkagMu+Sext9jpEObZik9xPy8j6Ppu
   jGSxVzQg9Mwcsq/MK6DDuLw2vkJQO7XQ4mbXrYgFh/s+gObO8A7X2r2RD
   nQ5htWp3lLYEHmtzocs9QKFVzXCg1odDtl5rpcPqI9bKt9Nur66+8SAbi
   yMmUY8whfbwXWj20KFnWrhpuglxtYzNj4CPCgtoSm08RHNh+yjao6D5vD
   FBOP0uEAqd+/O5LxKP02bDoyHhHE1Kj1WeAR+seqVlO8w3Q4DYnpuz7cw
   V+EHgsaVnhuL8RdnetvzvDN3Ol/l6Bm6Zit6D/IlFPMnIkl2FpPhMgBa0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="455883225"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="455883225"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 22:35:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="14498850"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 22:35:18 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 60B2011FBD1;
	Mon, 20 Nov 2023 08:35:15 +0200 (EET)
Date: Mon, 20 Nov 2023 06:35:15 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH 0/4] Enable sensor's runtime PM before registering async
 sub-dev
Message-ID: <ZVr-I2m9P2w5LgyK@kekkonen.localdomain>
References: <20231106083516.763184-1-bingbu.cao@intel.com>
 <072fcb90-1888-39c4-1d19-200cf01b6289@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <072fcb90-1888-39c4-1d19-200cf01b6289@linux.intel.com>

Hi Bingbu,

On Mon, Nov 20, 2023 at 12:14:40PM +0800, Bingbu Cao wrote:
> 
> Sakari and others,
> 
> On 11/6/23 4:35 PM, bingbu.cao@intel.com wrote:
> > From: Bingbu Cao <bingbu.cao@intel.com>
> > 
> > Following Sakari's patch:
> > <URL:https://lore.kernel.org/linux-media/20231102090752.1418132-1-sakari.ailus@linux.intel.com/>
> > 
> > The sensor device maybe accessible right after its async sub-device is
> > registered, so runtime PM should be ready before its async sub-device
> > is registered.
> > 
> > 
> > Bingbu Cao (4):
> >   media: imx355: Enable runtime PM before registering async sub-device
> >   media: ov01a10: Enable runtime PM before registering async sub-device
> >   media: ov13b10: Enable runtime PM before registering async sub-device
> >   media: ov9734: Enable runtime PM before registering async sub-device
> > 
> >  drivers/media/i2c/imx355.c  | 13 ++++++++-----
> >  drivers/media/i2c/ov01a10.c |  7 +++++--
> >  drivers/media/i2c/ov13b10.c | 14 +++++++++-----
> >  drivers/media/i2c/ov9734.c  | 19 +++++++++++--------
> >  4 files changed, 33 insertions(+), 20 deletions(-)
> >
> 
> Do you have any comments on this series?

Oops. What's the reason for splitting pm_runtime_idle() call from the rest
of the Runtime PM related setup?

-- 
Regards,

Sakari Ailus

