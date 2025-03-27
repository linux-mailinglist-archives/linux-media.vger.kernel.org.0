Return-Path: <linux-media+bounces-28828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EFAA72C47
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 10:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 332361898A5A
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 09:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E63120C01B;
	Thu, 27 Mar 2025 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2mWYVGs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644F413C8EA
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 09:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743067323; cv=none; b=IC+uhekdVrazqZ/SyOgaPws7VQHVKVKBI809V2hDgn8zh8mM4IujkRj0geGbk9RJ5oqY9W/U4ROenNF07FyCNLJ/j7nM+Gz+rjCswqEOTvqiJhv25F8bqimktwGZDyl+b/kbE2YF4bQKqdOdHngPrYlaaCkoUjk6eVQFUgaFERw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743067323; c=relaxed/simple;
	bh=FWFeO2X+YWLMMCxPSZ3Bio+i7PKtzHFgmZCb3bXDnhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kO+9KLj6TWHeT3se3XRTjmVjVZzmbj7dljRQYAsQBLA3O90yk0QmjNgauFON587kmEhy0bqUs7WqIz2lRJlv4+fr7BI3gNVl8aSqAfbHP2wa3rffmp4zISVxgiapR4bshMl1HybL0PUrc29lgu74SDe1J9nxERSUZ3UV7SZnNNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2mWYVGs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743067321; x=1774603321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FWFeO2X+YWLMMCxPSZ3Bio+i7PKtzHFgmZCb3bXDnhg=;
  b=K2mWYVGs1O6iD4IqJOn2OdpHMUtoGYKPoI6Qt9sZX2dVrCeUDB18TdUl
   WdkDRvEVQcrse+z9VcfUlmMd58pJCguHBIpgwwiojVSfee9p+jzNWkJTS
   qJidZEAplJL1KXQJ/zJvEJ7RYbr7grHWy0fuJnpxeuOSbav6k8tD7qL0S
   8FQTQWOftI9MZp2DwkrgGuyjMyVCDGy4/Egbs9VzRM4LTKsdxohGT4+Tr
   fR9ObjQfTrAETJ50s00R12DvnBxWKPANG0GogLtbBKn3mQzkjUn8NsQKJ
   4gnM+AB23I7Q4Pj+XP2Fim58DUaDHfXqr5V946Oe0mqkFaUTNWXOTPhNv
   w==;
X-CSE-ConnectionGUID: 0Y2hO8PFRieLBapBh6Xozg==
X-CSE-MsgGUID: ujky93qeSCel/c9bfo+4LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66858537"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="66858537"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 02:22:01 -0700
X-CSE-ConnectionGUID: S6/YuDVySnC2xsy0N5oBhw==
X-CSE-MsgGUID: 5R3wqmzWR76uSoZv7I8tLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="130177794"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 02:21:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0311A11F99F;
	Thu, 27 Mar 2025 11:21:56 +0200 (EET)
Date: Thu, 27 Mar 2025 09:21:56 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ov2740: Move pm-runtime cleanup on probe-errors
 to proper place
Message-ID: <Z-UYtDXCKaLK5RGU@kekkonen.localdomain>
References: <20250324130109.375068-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324130109.375068-1-hdegoede@redhat.com>

Hi Hans,

On Mon, Mar 24, 2025 at 02:01:09PM +0100, Hans de Goede wrote:
> When v4l2_subdev_init_finalize() fails no changes have been made to
> the runtime-pm device state yet, so the probe_error_media_entity_cleanup
> rollback path should not touch the runtime-pm device state.
> 
> Instead this should be done from the probe_error_v4l2_subdev_cleanup
> rollback path. Note the pm_runtime_xxx() calls are put above
> the v4l2_subdev_cleanup() call to have the reverse call order of probe().
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>


Thanks for the fix!

This also deserves:

Fixes: 289c25923ecd ("media: ov2740: Use sub-device active state")
Cc: stable@vger.kernel.org

> ---
>  drivers/media/i2c/ov2740.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 80d151e8ae29..6cf461e3373c 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -1456,12 +1456,12 @@ static int ov2740_probe(struct i2c_client *client)
>  	return 0;
>  
>  probe_error_v4l2_subdev_cleanup:
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
>  	v4l2_subdev_cleanup(&ov2740->sd);
>  
>  probe_error_media_entity_cleanup:
>  	media_entity_cleanup(&ov2740->sd.entity);
> -	pm_runtime_disable(&client->dev);
> -	pm_runtime_set_suspended(&client->dev);
>  
>  probe_error_v4l2_ctrl_handler_free:
>  	v4l2_ctrl_handler_free(ov2740->sd.ctrl_handler);

-- 
Kind regards,

Sakari Ailus

