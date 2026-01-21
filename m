Return-Path: <linux-media+bounces-51210-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE8iGSmlcGlyYgAAu9opvQ
	(envelope-from <linux-media+bounces-51210-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 11:06:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D155F54EC5
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 11:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8401466B185
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1739C481259;
	Wed, 21 Jan 2026 09:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieu7Dh5P"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D17480963;
	Wed, 21 Jan 2026 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989262; cv=none; b=FDL0xzJoiHGsi+vKmkRM4179TDmYR5aJzpX0d83PT70qFEEmsXP5ofyartD+yQd80dnoz8pMJq61tJkKrrm2WOLDa8ioswpswJBvidwS/4TWP9DNZ0xTRM/jYIzq0GjbjrqJvgSKeBBXOmaSelTISJr4df0tV0wJu3B4v5NXcIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989262; c=relaxed/simple;
	bh=O1f0o+nUG2+802UR1DcWW9689ZXFLAkKYFEFZtz6b+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkr+jRbnnOXTPrsIRu88klt+MGM+oLSqdTy+PzigaE4/tPevhjv72f/bO3OQPNxmGrrQ95l5HWg3MzkBX6p0/h+hMkehKBlB4OcYCez/TVtT2/xGamgnztEpBajA/vke46s6H7yXH926DFvYSi82zU1LspbvJiy0pKmK31ZPagA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieu7Dh5P; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768989260; x=1800525260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=O1f0o+nUG2+802UR1DcWW9689ZXFLAkKYFEFZtz6b+0=;
  b=ieu7Dh5PEZ0Xo8TasYpljlb7BvLvkO3J486PFfRykXutA5YM77pVw+fw
   1R5f5RXMn7P8m0iwyQ0lZFR9aSFqR1u7ZK4fwuXZz+EKQLlS2I6FwYoJ0
   apcHLHy1m6RAwSx2B57mJwhupOjKzBm2eOj5uGuH2GVIpYaLg1nKp8a0U
   XD2Q3rvzOnBTY4ofw9Wd/qZYURG7QV7/pVbbjt9EI0VTgPIDql1xB2frB
   92lwuVcntxVwKUSigEYBQdEL8ZSdWL7UEG+DROH6COniQwpAfH86j/oNb
   x8yJM+xWbxHs723g3mZndLSZyczvo4Ktqqeo576AIrJSiwjoZRQ6RCt6s
   Q==;
X-CSE-ConnectionGUID: 4l12Nt7OTwyanazJuSeLCw==
X-CSE-MsgGUID: MoDv/SZ1RyWd1jbu+tXDqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70266001"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70266001"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 01:54:19 -0800
X-CSE-ConnectionGUID: scA/2P6CTzmOGQSqdxL6Vw==
X-CSE-MsgGUID: M3leEQuHQ0qOW9V8W7JTTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206733522"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.69])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 01:54:18 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AC79F121D78;
	Wed, 21 Jan 2026 11:54:21 +0200 (EET)
Date: Wed, 21 Jan 2026 11:54:21 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: imx412: Extend the power-on waiting
 time
Message-ID: <aXCiTU_hTsBkSJdA@kekkonen.localdomain>
References: <20260121-imx412-v5-0-be67654a4afe@oss.qualcomm.com>
 <20260121-imx412-v5-2-be67654a4afe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121-imx412-v5-2-be67654a4afe@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51210-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,intel.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: D155F54EC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wenmeng,

On Wed, Jan 21, 2026 at 05:12:15PM +0800, Wenmeng Liu wrote:
> The Arducam IMX577 module requires a longer reset time than the 1000µs
> configured in the current driver. Increase the wait time after power-on
> to ensure proper initialization.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  drivers/media/i2c/imx412.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index aa63dfc349181bf9c180ffd566b0317d05b410c1..b1c201b4c7d008aa70ac84205e4de119e776047b 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -1037,7 +1037,7 @@ static int imx412_power_on(struct device *dev)
>  		goto error_reset;
>  	}
>  

Could you please add the comment why this was being done? It's not enough
to have this in the commit message.

> -	usleep_range(1000, 1200);
> +	usleep_range(10000, 12000);
>  
>  	return 0;
>  
> 

-- 
Regards,

Sakari Ailus

