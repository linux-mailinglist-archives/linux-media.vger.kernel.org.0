Return-Path: <linux-media+bounces-19599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D169099C8DD
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 13:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96AE5290F2D
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2A01591E2;
	Mon, 14 Oct 2024 11:28:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D907933998
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728905288; cv=none; b=sUo5bQoIQRck933EVUs0NPyxe0MvwBbts9l13cmdzWeQ/rBr0p8rbzbqSVJKlIQUI2NrPHaP8iCp/yhHCUhmWD5u4iFEckD7sA4weOGaPn7UFAs2dAxJlh2PW7U0NSo0qg3Je3P3MbxKhGvThg0SHTmR9i9SYLRl2sIt0kaFlzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728905288; c=relaxed/simple;
	bh=kBaIYfBZ+QidaCIsE3lqSK2Wdb/w8hLpwdxiuyil3H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5c0x5YwhfpfgOv6aBLcfdrkQWuFf4vaQ6EkMBe0zem6b9IYyksM8GfuzFHu8XUmJ9GR5rnZhLD54tib3NCcdAlyipuUMd3OjaCroyxxqcI/pbP/xUDxYM1H215lnT3SoMjB312twdt6KSJlXrISgiIAflHEqXweGdIrDTF7iKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: PxmFgcHOSeqyJIbIKsPLpQ==
X-CSE-MsgGUID: JI4yfxboSp+VTG2mMYQcNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39631040"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="39631040"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:28:06 -0700
X-CSE-ConnectionGUID: P/K9kgzlQQ6TGlxdgbPlAQ==
X-CSE-MsgGUID: LzA7EhDQTRaXwgQo3WxftQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="108337808"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:28:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1t0JF3-00000002sag-2xAO;
	Mon, 14 Oct 2024 14:28:01 +0300
Date: Mon, 14 Oct 2024 14:28:01 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, Robert Mast <rn.mast@zonnet.nl>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/4] media: atomisp: Fix WARN_ON() in
 vb2_start_streaming() triggering
Message-ID: <Zw0AQdqJowtYe0zV@smile.fi.intel.com>
References: <20241013154056.12532-1-hdegoede@redhat.com>
 <20241013154056.12532-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013154056.12532-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Oct 13, 2024 at 05:40:53PM +0200, Hans de Goede wrote:
> If atomisp fails to start the stream the buffers must be returned to
> the VB2_BUF_STATE_QUEUED state before returning an error from
> atomisp_start_streaming().
> 
> This fixes the following WARN_ON():
> [  250.313554] WARNING: CPU: 3 PID: 2178 at drivers/media/common/videobuf2/videobuf2-core.c:1801 vb2_start_streaming+0xcb/0x150 [videobuf2_common]

...

>  	if (ret) {
>  		dev_err(isp->dev, "Error starting mc pipeline: %d\n", ret);
> +		atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_QUEUED, true);
>  		goto out_unlock;
>  	}

Seems like error message does not depend on the video pipe. Hence I would
first flush the pipe and then print a message.

-- 
With Best Regards,
Andy Shevchenko



