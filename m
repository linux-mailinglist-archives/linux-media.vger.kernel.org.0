Return-Path: <linux-media+bounces-638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4177A7F25F2
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 07:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBE4A1F250EA
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 06:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDFB1BDDF;
	Tue, 21 Nov 2023 06:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2nmGuIo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405A3F5
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 22:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700549395; x=1732085395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6jiO0QDEmEjsbrp6cdOm7b6g2BCotMpz+qyYO2UF2I0=;
  b=O2nmGuIoYlllwAv0SEKiFFAcl/iLI/cMzqFh0sxE9GFbuArFdixw4KVC
   yUXSkFqsLk3hUaZp2Z31aar269wdR4O6Kn28iiKA94aB3X0DdFA0DIVQ6
   68qD3rfSQF17tarqpd2dqVFkZ68+Qbsp7a/42MZBB0cbSDzuGSeavFFgQ
   m+/XL+9BUuWhxMxZxxw2Npo5Ic33zBjW0q5LyihxRsKO7xYMq9YuEJQmb
   XOcIWWT9vW8wCl93hS3yy/7wEHY/5Icm8a/gCDddlZ6ZJmMcWzAqk8eYd
   VQtG04d/HupwZzJTmExhvOcCGvMVfmYjqX3FNfWLEVPicPpdJGEtMqXbM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394620079"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="394620079"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 22:49:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="716432820"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="716432820"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 22:49:53 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CB3C111FC2D;
	Tue, 21 Nov 2023 08:49:49 +0200 (EET)
Date: Tue, 21 Nov 2023 06:49:49 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH 0/4] Enable sensor's runtime PM before registering async
 sub-dev
Message-ID: <ZVxTDbofDPnJxKPl@kekkonen.localdomain>
References: <20231106083516.763184-1-bingbu.cao@intel.com>
 <072fcb90-1888-39c4-1d19-200cf01b6289@linux.intel.com>
 <ZVr-I2m9P2w5LgyK@kekkonen.localdomain>
 <8c9762eb-adb8-bb87-c270-6f3021cb7f01@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c9762eb-adb8-bb87-c270-6f3021cb7f01@linux.intel.com>

Hi Bingbu,

On Tue, Nov 21, 2023 at 11:03:06AM +0800, Bingbu Cao wrote:
> Sakari,
> 
> On 11/20/23 2:35 PM, Sakari Ailus wrote:
> > Hi Bingbu,
> > 
> > On Mon, Nov 20, 2023 at 12:14:40PM +0800, Bingbu Cao wrote:
> >>
> >> Sakari and others,
> >>
> >> On 11/6/23 4:35 PM, bingbu.cao@intel.com wrote:
> >>> From: Bingbu Cao <bingbu.cao@intel.com>
> >>>
> >>> Following Sakari's patch:
> >>> <URL:https://lore.kernel.org/linux-media/20231102090752.1418132-1-sakari.ailus@linux.intel.com/>
> >>>
> >>> The sensor device maybe accessible right after its async sub-device is
> >>> registered, so runtime PM should be ready before its async sub-device
> >>> is registered.
> >>>
> >>>
> >>> Bingbu Cao (4):
> >>>   media: imx355: Enable runtime PM before registering async sub-device
> >>>   media: ov01a10: Enable runtime PM before registering async sub-device
> >>>   media: ov13b10: Enable runtime PM before registering async sub-device
> >>>   media: ov9734: Enable runtime PM before registering async sub-device
> >>>
> >>>  drivers/media/i2c/imx355.c  | 13 ++++++++-----
> >>>  drivers/media/i2c/ov01a10.c |  7 +++++--
> >>>  drivers/media/i2c/ov13b10.c | 14 +++++++++-----
> >>>  drivers/media/i2c/ov9734.c  | 19 +++++++++++--------
> >>>  4 files changed, 33 insertions(+), 20 deletions(-)
> >>>
> >>
> >> Do you have any comments on this series?
> > 
> > Oops. What's the reason for splitting pm_runtime_idle() call from the rest
> > of the Runtime PM related setup?
> 
> Ah, no special reason actually. I just want to make the pm idle callback to
> be the last ops as it was. I have no idea what the async callback does
> before idle.

I think it'd best to move it with the rest of the Runtime PM calls.

-- 
Regards,

Sakari Ailus

