Return-Path: <linux-media+bounces-59933-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOHUA6e28WngjwEAu9opvQ
	(envelope-from <linux-media+bounces-59933-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:43:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8114909F6
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77F183016D0D
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD67D3A6B7F;
	Wed, 29 Apr 2026 07:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UW5C6nH9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8923A3814;
	Wed, 29 Apr 2026 07:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448584; cv=none; b=fsJn9LmTCg+tXv7x/9uE5rxOdnn2ij82+HBj8dQ8vT5wP/XGABG9vtarOJJNq/KJ0+w8NuzNMA4tlM28PFUsrho06DeisWZc6zj9+rWoxx9yd2Xo232xFfvp2C+R0GXOg6r2KaC41xBuZ86m7HxNE5USha4mAGSbQ+ypIjkLgAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448584; c=relaxed/simple;
	bh=CC3r3hHpl3PYePstBnan9ERucJgMhXDJr9YHge/rvgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGg5gqTYRWP4XEaxvqFUNo+8Af2KmZnshM9dp7NQcvXiH1gVhQPKG3tZHzb0DXhdwDwBfZ0yzG22I6SwfNxXTYwmAi8H4GR6x903UAk/8EPuZ4EBkHi3N6ytmoZE5XEPc59shxOA6aQ9LKEBLCMnFHNlcHdIWnhMacZcnqXiMl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UW5C6nH9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777448581; x=1808984581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CC3r3hHpl3PYePstBnan9ERucJgMhXDJr9YHge/rvgc=;
  b=UW5C6nH9iT/rICK5IMUATJZTFeJMWz8y6SFf+dGGW/PIjuQCKjXGSF3O
   WFzXZ0Pd+eR5l7Rst+c3ytStTqRHOJwJz/NRzzpRwcbMSGpBW/n6M1akN
   +7dWx82srtvZQ6H3nEaM4b2HrJdnf/CmZGDD8wo2KQdbnVBkweEVg+zp5
   HRNQUJATTVDhPUvBPhlLsKVSXz5nMBYnIeoZ5Nzl0Hodu+TRFbzWVkCVJ
   QvRBZUwb+OZ786DFfatPesA+EPFIQXv/PaoixWarfzdYzxLvWyvTMOISd
   2YoN8QyOxfirrSodsRQzYxauccAqQXJ2huJ08/dRErVsCez9ImttEqlzn
   A==;
X-CSE-ConnectionGUID: zrCZbw7NSNSVx6R338RBxg==
X-CSE-MsgGUID: xdYegJWPTxe2xSQ/84qK9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="103826580"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="103826580"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:43:00 -0700
X-CSE-ConnectionGUID: Ff0adLojSWynEvLAbfrT7g==
X-CSE-MsgGUID: toqVZPHlQFugjBTO9/2QdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="257746924"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:42:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A0E2411FCDF;
	Wed, 29 Apr 2026 10:43:02 +0300 (EEST)
Date: Wed, 29 Apr 2026 10:43:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/6] media: v4l2-dev: Add range check for vdev->minor
Message-ID: <afG2hm-V9uUkUmXk@kekkonen.localdomain>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-1-46890dffb611@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-smatch-7-1-v1-1-46890dffb611@chromium.org>
X-Rspamd-Queue-Id: BA8114909F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59933-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,kekkonen.localdomain:mid,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Ricardo,

On Tue, Apr 28, 2026 at 12:41:07PM +0000, Ricardo Ribalda wrote:
> If the fixed minor ranges are not properly set we could end up in a
> situation where the calculated minor is invalid. Add a check for this in
> the code.
> 
> This check also fixes the following smatch warning:
> 
> drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 6ce623a1245a..a731ffdb91ee 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1032,6 +1032,12 @@ int __video_register_device(struct video_device *vdev,
>  	vdev->minor = i + minor_offset;
>  	vdev->num = nr;
>  
> +	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {

Could this be combined with the should-not-happen case below? The error
handling is the same (releasing the mutex) and the error code could be as
well. I think the message can be just as well removed as we have a
WARN_ON() here anyway.

I wonder what Hans thinks.

> +		mutex_unlock(&videodev_lock);
> +		pr_err("invalid minor. Check ranges.\n");
> +		return -EINVAL;
> +	}
> +
>  	/* Should not happen since we thought this minor was free */
>  	if (WARN_ON(video_devices[vdev->minor])) {
>  		mutex_unlock(&videodev_lock);
> 

-- 
Kind regards,

Sakari Ailus

