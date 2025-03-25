Return-Path: <linux-media+bounces-28647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C4BA6E87F
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 04:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2FEA189644A
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 03:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63EA18DB26;
	Tue, 25 Mar 2025 03:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InkqNsQK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37482E3367
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 03:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742872022; cv=none; b=MRFhLyxKaxM9eXOdWE6Vpaml57Hs8wHQnMBRNhsHxGSMX/RgF+N2Aubv1GVw6XVAWAatcGIS5DUotkkwajVAPhWmUXh3FQgavzrGyD/do35ZR+gG6R75+G4334fWizZw9ifRYsCPgEN4k4qvZd8ODhUBACApZe5kplH+5dk7OAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742872022; c=relaxed/simple;
	bh=9D0ThSgGwI8VAcc0DOYrkJK82c9K8rDCGKAONSMNq1I=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=e4hIxcT3P14AKwnAkvCqOr+hJ8GLLpixZX4qtwcETirOz63EOtymP/3LHVUEnn5M4QLfIu7x9c5EGPjZr8kGYSQdKWxvWCeagfyS90iCWvpC1sJMouC9/ouxCkp9YwIyVLey5QR7XgcvRc+FI69X52ldkDTd7NRvKeZFjHfLbDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InkqNsQK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742872021; x=1774408021;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=9D0ThSgGwI8VAcc0DOYrkJK82c9K8rDCGKAONSMNq1I=;
  b=InkqNsQKj60/j935ebClHxZcIS9ylULRnhwznq9kMyYdZKTEZoGvmRCd
   FfHDOe3waDLgojOSrLHaQsTxEnf0u0iGcsoo6DwRZVc1FEKV9ANXCj1Kj
   j6oSVoSvxYAWMKypqS94sq9UP+vY43JoLlV2ohTwqCfgsAKZwO6hWy6HG
   2HGDcPROQa9nxt4XsI1HApf7gbV9aHmgj3fcmfz9rQ+6c0jx+2ruVGAwt
   jFuRmkhA7XbDpUPbCKxVNKuTZtIHgRKV7OsXbG+iZYQsLdSFa2kk13Pxd
   kdnzcjvks9tK6MWjyNKor1RJc5BQH/UYhp752117ZAcDjNNXdougYEOya
   A==;
X-CSE-ConnectionGUID: ZXkrIi1LTJyizQ5KNPbUjw==
X-CSE-MsgGUID: gMlgnbHLSX2zSU+CUcmNhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43259066"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="43259066"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 20:07:00 -0700
X-CSE-ConnectionGUID: S6kEWrh+TX6iRY0Jq3Idvw==
X-CSE-MsgGUID: paHck8NmQbqFz5ak6btDmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="129426200"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 20:06:57 -0700
Subject: Re: [PATCH] media: ov2740: Move pm-runtime cleanup on probe-errors to
 proper place
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250324130109.375068-1-hdegoede@redhat.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <3c7f3f45-5717-6251-cff0-ea4d65a1a18e@linux.intel.com>
Date: Tue, 25 Mar 2025 11:02:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250324130109.375068-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hans,

Thank you for the patch.

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 3/24/25 9:01 PM, Hans de Goede wrote:
> When v4l2_subdev_init_finalize() fails no changes have been made to
> the runtime-pm device state yet, so the probe_error_media_entity_cleanup
> rollback path should not touch the runtime-pm device state.
> 
> Instead this should be done from the probe_error_v4l2_subdev_cleanup
> rollback path. Note the pm_runtime_xxx() calls are put above
> the v4l2_subdev_cleanup() call to have the reverse call order of probe().
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
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
> 

-- 
Best regards,
Bingbu Cao

