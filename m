Return-Path: <linux-media+bounces-60348-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id l1iiHP6X+Wmo+AIAu9opvQ
	(envelope-from <linux-media+bounces-60348-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:10:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 681EC4C7918
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DA83307E6BA
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 07:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94C23DC4A3;
	Tue,  5 May 2026 07:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXV86gko"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8C13D88FC;
	Tue,  5 May 2026 07:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964487; cv=none; b=mzlFYm8miaBIqXRelFK1zpOladLjbJAH8u6cW7ecBKbjD8DOD53tqjPC1lFQs6oCHiA3DN1W4bqH/QEa37wuI3xgNCPRxAmKuO7lVFsmGMaEtB1/bFloxxG5tk08sq5svq+uPvPt+XmFCuF6m6cYy9vz4Wp6XFoUNCz8+KYYPcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964487; c=relaxed/simple;
	bh=ov1Ya2FB+OCvbgph1fImUSjdp95jYc78u1dJR/hhSUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIuUVvsq6DjzZXxjZYTCXNLt48wek+AcKVN+rEfgeIRppkIHnJ2uG8Auz13VhS+5+VdaU8Sju9T25+eckKZPD4QB4czmUjhM3+v605ZxZnelkUSjosa4caXy3HMO2QOVvP26decrmTuGlF1P7UsCqIeec8zCHCA0I4kJiOH0d10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXV86gko; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777964486; x=1809500486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ov1Ya2FB+OCvbgph1fImUSjdp95jYc78u1dJR/hhSUg=;
  b=QXV86gkodkA9JgMoXEumtZjDm2PKLmR45BKBnCzY9kZEbzaC1PmnNnDT
   1WPge2Qnhp3D08X0MLRk08t4V9WQsWTWfGGpR2y1LbjEnhg0EYFqLuwk3
   f6l/Vw3xfImuIi4gpI3oepAZVynx8Iny3/OvYCbwykniI5IsLccGViZCE
   KJv2PP77jRbDeAhM+pASyZAxUOnMuQLMaAwRHdgfxUnm0NipXamQ/yanO
   rLy+lPed3v616sDL6ax/UZJBfBlpp+RLEnvlf91c1hBC9URbL1x5haO/I
   j+Mq9SWs1NkzKS6XpJ4bbwUmtjDoFHCTDa56Brkw4Y7uxWVvpHPT1sYAo
   g==;
X-CSE-ConnectionGUID: c1RmyaDzScmicpt+dRCcQg==
X-CSE-MsgGUID: huimczlIT525sYlBUj4c6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82695711"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="82695711"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 00:01:25 -0700
X-CSE-ConnectionGUID: NVGJyUP0SIyNNjBXyE58lg==
X-CSE-MsgGUID: iQyVqWX/QMqXRwmsTzaN+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="240724833"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.23])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 00:01:23 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A8FCA120325;
	Tue, 05 May 2026 10:01:22 +0300 (EEST)
Date: Tue, 5 May 2026 10:01:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Martin Hecht <mhecht73@gmail.com>
Cc: martin.hecht@avnet.eu, michael.roeder@avnet.eu,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Fix: correct typo in alvium_set_ctrl_auto_exposure
Message-ID: <afmVwrZx_Gp1ShO7@kekkonen.localdomain>
References: <20260504160114.282024-1-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504160114.282024-1-mhecht73@gmail.com>
X-Rspamd-Queue-Id: 681EC4C7918
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[avnet.eu,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-60348-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim]

Hi Martin,

On Mon, May 04, 2026 at 06:01:10PM +0200, Martin Hecht wrote:
> write value for auto-exposure into register REG_BCRM_EXPOSURE_AUTO_RW
> instead of wrong register REG_BCRM_WHITE_BALANCE_AUTO_RW.
> 
> Signed-off-by: Martin Hecht <mhecht73@gmail.com>
> ---
>  drivers/media/i2c/alvium-csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
> index 955b7072a560..b62b45a4f2fc 100644
> --- a/drivers/media/i2c/alvium-csi2.c
> +++ b/drivers/media/i2c/alvium-csi2.c
> @@ -1290,7 +1290,7 @@ static int alvium_set_ctrl_auto_exposure(struct alvium_dev *alvium, bool on)
>  	struct device *dev = &alvium->i2c_client->dev;
>  	int ret;
>  
> -	ret = alvium_write_hshake(alvium, REG_BCRM_WHITE_BALANCE_AUTO_RW,
> +	ret = alvium_write_hshake(alvium, REG_BCRM_EXPOSURE_AUTO_RW,

Should this also be backported? Could you provide a Fixes: tag?

>  				  on ? 0x02 : 0x00);
>  	if (ret) {
>  		dev_err(dev, "Fail to set autoexposure reg\n");

-- 
Kind regards,

Sakari Ailus

