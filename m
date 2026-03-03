Return-Path: <linux-media+bounces-54363-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHuEHy/jpmnpYgAAu9opvQ
	(envelope-from <linux-media+bounces-54363-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 14:33:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC471F0529
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 14:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D03C6303BF45
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 13:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFAE25DB0D;
	Tue,  3 Mar 2026 13:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3Cp4BjD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322BE238C0D;
	Tue,  3 Mar 2026 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544769; cv=none; b=gpqTn4jfqvc/oI+697vXU0K3KGyHRTU01A55fNNgT8DHRMcPTykg0YK8g8W6AmpvyGpmyfjs80G3p+WDqirsXscoRi2mSNXyZOBdAlrBdkDkldo4wGiws4MrTadpZjXMOr1Fi2cH+NPPXW8/4V7ShKCY76BiBPjHSP7Sv8SFjgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544769; c=relaxed/simple;
	bh=Yf1X/UrPQMStcwK7+YRdFyIg3DT7ZqH5rAdOAf/lJMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALoX+ZRIsXV3FawtLANJfE3VGMsgQbPtitg87YBBHAEFWm7fUWTsqnwwD9JPatCXWw+ok0HCmfe+GPBMK4nJOU6rLOf+cccpG5EhMxczKPNexCkgGE9my3MxazP0eFxpQCEVeigaBlkzDX3o/TDDpVFlqfkf7FEPop6cRvHpyi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3Cp4BjD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772544759; x=1804080759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yf1X/UrPQMStcwK7+YRdFyIg3DT7ZqH5rAdOAf/lJMk=;
  b=A3Cp4BjDTk6diYxBWp9uF5LYwCW80kVZ0uRqwbcIQOJbG0F2xWs4DIhK
   NV1W+yAumKn74ZnXRLDglFDbbIaFiqndpKqQHyYBHgXLQjtxuKI6xiele
   Ny1yywSqEUGDWRLhm9KeLHKqrWQLarIMvhNiRDedHFomzWlzkRGLwlG37
   qTry80TvhiznHCfwAN0RX1Uf5b8ot9jreQrLgJGDwyi76jbaZtp50PqgN
   7Z6eb7j0OKaJv4k1+FHP26yQk9CMnV2XXgwB4K7fzsyoxZl7Gpemhy5SK
   4gjGpVSqGxUi/OiOG1f4KJ/Q2Jy5ewJy0iPtKtNlM0HufVCtJ5THmatje
   Q==;
X-CSE-ConnectionGUID: GVOO6BTvS4OiqLC1vuWQ2w==
X-CSE-MsgGUID: gOuY6xWLSe2QmRo3fgBCFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73487679"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73487679"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 05:32:37 -0800
X-CSE-ConnectionGUID: Ek2oZYJMQOSPpHB1kUN5oA==
X-CSE-MsgGUID: PKg3JJ4TTzSeExDXfFjgzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="248495985"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 05:32:36 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 67815121D1D;
	Tue, 03 Mar 2026 15:33:03 +0200 (EET)
Date: Tue, 3 Mar 2026 15:33:03 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] media: i2c: imx412: Assert reset GPIO during probe
Message-ID: <aabjDzc9kR5N2gAP@kekkonen.localdomain>
References: <20260123-imx412-v7-0-e58303f2b76b@oss.qualcomm.com>
 <20260123-imx412-v7-1-e58303f2b76b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-imx412-v7-1-e58303f2b76b@oss.qualcomm.com>
X-Rspamd-Queue-Id: 2BC471F0529
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:?];
	TAGGED_FROM(0.00)[bounces-54363-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_SPAM(0.00)[0.991];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DMARC_DNSFAIL(0.00)[intel.com : server fail];
	R_DKIM_TEMPFAIL(0.00)[intel.com:s=Intel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi Wenmeng,

On Fri, Jan 23, 2026 at 05:19:55PM +0800, Wenmeng Liu wrote:
> Assert the reset GPIO before first power up. This avoids a mismatch where
> the first power up (when the reset GPIO defaults deasserted) differs from
> subsequent cycles.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

I'll add:

Fixes: 9214e86c0cc1 ("media: i2c: Add imx412 camera sensor driver")
Cc: stable@vger.kernel.org

> ---
>  drivers/media/i2c/imx412.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index b3826f80354703b17b416dc233854da3f5736e38..aa63dfc349181bf9c180ffd566b0317d05b410c1 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -925,7 +925,7 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
>  
>  	/* Request optional reset pin */
>  	imx412->reset_gpio = devm_gpiod_get_optional(imx412->dev, "reset",
> -						     GPIOD_OUT_LOW);
> +						     GPIOD_OUT_HIGH);
>  	if (IS_ERR(imx412->reset_gpio)) {
>  		dev_err(imx412->dev, "failed to get reset gpio %pe\n",
>  			imx412->reset_gpio);
> 

-- 
Kind regards,

Sakari Ailus

