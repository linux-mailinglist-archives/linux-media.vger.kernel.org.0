Return-Path: <linux-media+bounces-45136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D504BF72E7
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 16:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B48EC35360C
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 14:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC0A33FE3E;
	Tue, 21 Oct 2025 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/8yKnDr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E6433FE34;
	Tue, 21 Oct 2025 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058497; cv=none; b=smkzzFewihHBFVi8dROlBeses9iMtLBEZ8qCe6CtUmKguf7loMpYJi+yDzBW8fHFooEoX2W2P/upceB2wCClaLEDhAv50m84mIMwg44Ujarj7WUY2a1WaQHVNBSpsfBD/zoFnClmGVQ2JFvwCxEs4h7juiSU6YQhjPts2SgUgg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058497; c=relaxed/simple;
	bh=hoXu6hDYfmK8hrzVctyo5LRaf2v5vgtsKH1MRy9WksA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzI8iBpjQgdxOMTQfIso+bDdqDA+R7WMKXwr8COtQuqWw7tZnmjgf6ZQ0BMqZb+ZL5RrjfUeBYesCDc7BJyDR/PyIUS/qokM4dI6OKTDTalrFSHsd76EUrpvYfT+N48xgRQlGqfHXUX7L6XEQBGIrtSYdxi3yq1bXr1DqvSGpGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/8yKnDr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761058495; x=1792594495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hoXu6hDYfmK8hrzVctyo5LRaf2v5vgtsKH1MRy9WksA=;
  b=c/8yKnDrIyOpgV/tflHR+fBgX3YleZ1uH1gC20tWVeEeYdlv5q7q7V1S
   ct8T32Pbfs4cRFCxGjmn6k7bvdGr+2biGYGTTs6IA/k0pXjUKL+db7nPu
   fwriESs+CA+7PqiImdN2P4mAxgZYaVdxNMPj5fgscqIKukjYep96yJxSM
   XiIoiO1iCSEvYg6oueBFUpyTNIIalDen8OCd+LW5O0vxv35ZlebzWZB53
   TWuXWovdMypL3x9LyROzEV8W4Fwra/Nj8o8U/hvGH1F+1PHhFbjmGLOsZ
   NUdRIh9PeOMbODdpfVb254rP8WXA8em7Rk7N7rtwMnaAbyDND8djuMIys
   Q==;
X-CSE-ConnectionGUID: /ZKFQjhuScKp3w4E20WEuQ==
X-CSE-MsgGUID: CsqX5LFfQA6WS5eTI2FWBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63334212"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="63334212"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:54:54 -0700
X-CSE-ConnectionGUID: wRs9ju7gQiKBsaWs2surtA==
X-CSE-MsgGUID: ecpBD4xgSlmLUmyuIjSBDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="183640360"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.215])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:54:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 009CD121E5D;
	Tue, 21 Oct 2025 17:54:49 +0300 (EEST)
Date: Tue, 21 Oct 2025 17:54:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Adam J. Sypniewski" <ajsyp@syptech.net>
Cc: Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ov13b10: Add ACPI ID for ASUS Z13 Flow laptop
Message-ID: <aPeeuSdxRL_JXfE9@kekkonen.localdomain>
References: <aPecNTw6RHzprJ6e@garrus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPecNTw6RHzprJ6e@garrus>

Hi Adam,

On Tue, Oct 21, 2025 at 10:44:05AM -0400, Adam J. Sypniewski wrote:
> The ASUS ROG Flow Z13 2025 (GZ302) laptop uses an OV13B10 sensor with a
> non-standard ACPI ID of OMNI13B1 instead of the expected OVTI13B1.
> 
> Add this ACPI ID to the driver to make the front-facing camera work on
> these laptops.
> 
> Signed-off-by: Adam J. Sypniewski <ajsyp@syptech.net>
> ---
>  drivers/media/i2c/ov13b10.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index 869bc78ed792..6ecd77d02b78 100644
> --- a/drivers/media/i2c/ov13b10.c
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -1693,6 +1693,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov13b10_pm_ops, ov13b10_suspend,
>  static const struct acpi_device_id ov13b10_acpi_ids[] = {
>  	{"OVTIDB10"},
>  	{"OVTI13B1"},
> +	{"OMNI13B1"},

Can you include a comment for this line, explaining why this ID is here?

>  	{ /* sentinel */ }
>  };
>  
> 
> base-commit: 1fdb55ed40fa5ebe6934bd6b93036c714ebb5ef8

-- 
Regards,

Sakari Ailus

