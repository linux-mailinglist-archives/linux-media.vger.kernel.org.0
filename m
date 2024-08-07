Return-Path: <linux-media+bounces-15910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A6C94A31A
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 10:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B0421F248D4
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AC51C9DE9;
	Wed,  7 Aug 2024 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKNv2/VU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F261C7B8C;
	Wed,  7 Aug 2024 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723020212; cv=none; b=MS7A9vkkz6BRD6HwkWNLGHTNBa6XtYhqKUiKUy3Cxb/SIqUBnh3G6zdE8j/uzH9tDSJO5Oe+zWXwMBmskwK1HI0wtphHj1qGkrWkxt/GehajFSzHcmxm1zN62s4mZpziCkB6+3aUIOEpg7e4YdKEwdHg1V2nyS5/GMAmaSGw+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723020212; c=relaxed/simple;
	bh=/EOajK/oqldQZR0GViVm2V+Iml2wibuEIfyieC++EzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6GnSGLaJP6vsHvEEsLodGXJZIZx3X/1PlE+vsyloR4LM35AtZv0OciSbkFTJiH3OwnvjeVVdZlCz1O/DRfaZ+7XPy6RVTpkWETIU+ElXoV+GYRtFtonRe/1uYMCoHr0ewDhjPBT8qbPf/B0RsskdGDrvgXxQYsipnMCGWnuSg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKNv2/VU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723020211; x=1754556211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/EOajK/oqldQZR0GViVm2V+Iml2wibuEIfyieC++EzQ=;
  b=JKNv2/VU9b2KKZDIXHkVFOXDMNO/rTwy2hCLvFJGILxk/N8TZhcyrglF
   5uAzO2KU39y6PmjQQZSGA+oVqzuKVBfhfLQYb4f28h6p3KK5AYSm6HwMd
   lSmMKhkDVlodV0cpPfZ1yKndaiMdU1XQ1UaPVMCMWRUGcGjuKHhtEChJw
   YaZ/cNbzvXO1vBfVIICFWNCcRvK1/ZdSpUB8X0Hmxb+cn/GGqJrwsB22K
   /4SNw4FKUsPvSyWIXUt2f1W0Oh46Npc6P7P1pGVZ/xaDUj8qXrdhCf3vG
   K58PcXzqptpcH6jZNb1fPfzmeBu8SXR4BOlNurdsmiffghnxjQD+X1jSC
   g==;
X-CSE-ConnectionGUID: Y2P0/RbqRau5t6YmGV7MpQ==
X-CSE-MsgGUID: q4uI6+rPSb2Gsk9+QYaz4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="38586778"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="38586778"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 01:43:30 -0700
X-CSE-ConnectionGUID: 8Z5QmtfFR925koO4Az1nRw==
X-CSE-MsgGUID: jTgxpuPkQ42F+U0DYuYBEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="61671575"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 01:43:28 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E52A711F8A8;
	Wed,  7 Aug 2024 11:43:24 +0300 (EEST)
Date: Wed, 7 Aug 2024 08:43:24 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Benjamin Bara <bbara93@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH 2/2] media: i2c: imx290: Check for availability in probe()
Message-ID: <ZrMzrJlbOpd8V0n9@kekkonen.localdomain>
References: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com>
 <20240807-imx290-avail-v1-2-666c130c7601@skidata.com>
 <6072611.lOV4Wx5bFT@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6072611.lOV4Wx5bFT@steina-w>

Hi,

On Wed, Aug 07, 2024 at 10:33:51AM +0200, Alexander Stein wrote:
> Hi Benjamin,
> 
> Am Mittwoch, 7. August 2024, 10:10:28 CEST schrieb Benjamin Bara:
> > Currently, the V4L2 subdevice is also created when the device is not
> > available/connected. In this case, dmesg shows the following:
> > 
> > [   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
> > [   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
> > [   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
> > [   10.454018] imx290 7-001a: Error writing reg 0x3020: -6
> > 
> > which seems to come from imx290_ctrl_update() after the subdev init is
> > finished. However, as the errors are ignored, the subdev is initialized
> > but simply does not work. From userspace perspective, there is no
> > visible difference between a working and not-working subdevice (except
> > when trying it out or watching for the error message).
> > 
> > This commit adds a simple availability check before starting with the
> > subdev initialization to error out instead.
> 
> There is already a patch reading the ID register at [1]. This also reads the
> ID register. But I don't have any documentation regarding that register,
> neither address nor values definitions. If there is known information about
> that I would prefer reading the ID and compare it to expected values.
> 
> Best regards,
> Alexander
> 
> [1] https://gitlab.com/ideasonboard/nxp/linux/-/commit/85ce725f1de7c16133bfb92b2ab0d3d84efcdb47

I'd also prefer reading a register and indeed comparing the read value with
the expected value.

-- 
Regards,

Sakari Ailus

