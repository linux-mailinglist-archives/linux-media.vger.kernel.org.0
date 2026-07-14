Return-Path: <linux-media+bounces-67547-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cF+jAkTzVWrnwgAAu9opvQ
	(envelope-from <linux-media+bounces-67547-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 10:28:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F98D752637
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 10:28:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ep5NBuq9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67547-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67547-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D570F300A33D
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 08:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C130404BF7;
	Tue, 14 Jul 2026 08:28:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C3D3F9F51;
	Tue, 14 Jul 2026 08:28:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017722; cv=none; b=JMEIsR8Ir1Tp30hyBq90p3ukoJdhliuXsOJPhKB0Y+EDtfrr2IHruhR47nG0JvWXV0E4/8/80mE+iq8LvguRW6bWrm+pI27oH/uQo97BdX53jQ2P06flt4JNy45Bv/+7tHZfInvgMnQXyKNWHrhFGOyThROzoMosT35Tmq84R8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017722; c=relaxed/simple;
	bh=Qmk/zcQuiUWy/lQsND7Tk1pGYfzrXjw+QtefMWJZBa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVNwhDzFzVS0j1GNhvYqwC/lkthAO1VKth4i8CqqXFFF7JxXCVQU7PgZ7YNt7B7xqcS1CwWlunvoPO3qXiKEKu41NrVUzl6TYV2cHtKooPdLu6y8lqizA0JaOyaqO7VAJitCULEx1IJ1fqO/D2ItoOxEW62jkO75DAPjqU2QIbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ep5NBuq9; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784017716; x=1815553716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qmk/zcQuiUWy/lQsND7Tk1pGYfzrXjw+QtefMWJZBa0=;
  b=ep5NBuq91hK40pWy8LFnBSlReaToQlsj5cmjsGsxG30WNITOfQ3sAqLz
   xAeNhi9ycze7+33bra8gwOLggLup+1ua29Az5AVEOez4To0ZSIeXW1/FA
   TiRpEryDCCFedhdn+AWSL3Q9+yXCqtcpytyvQdLMMiTyxaqwfIr4Dl5ij
   pqV1VUzPyFC5aygc4p+NilK/PMXYk6hX5GAudICmSpe/4/PjzVJo2W7wh
   IlfH5nAEJG59qDJdk5JC/Qz3oleyhWpDnfFlCbxI7J6eSigAQgUO3BgcP
   qr8Vij4r5j9dbUnlB6eP761He5o1MeJrS0pCKeYWYt9D6+20W8NodFkyn
   Q==;
X-CSE-ConnectionGUID: d/A+tXcESRWZOSaxUTVWoQ==
X-CSE-MsgGUID: /XmZPlOcQKGH1dSNsigzNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="83756698"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="83756698"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:28:30 -0700
X-CSE-ConnectionGUID: 5CA7uqEQSN2BkbZL+OyBOg==
X-CSE-MsgGUID: NU28rdnOReedPWyNMDjJ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="254668704"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.245])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:28:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DF3DC11F8D1;
	Tue, 14 Jul 2026 11:28:25 +0300 (EEST)
Date: Tue, 14 Jul 2026 11:28:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: linux-media@vger.kernel.org, tarang.raval@siliconsignals.io,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: i2c: imx412: Convert to CCI register
 access helpers
Message-ID: <alXzKeKnDPk99Y5m@kekkonen.localdomain>
References: <20260316090059.121605-1-elgin.perumbilly@siliconsignals.io>
 <20260316090059.121605-2-elgin.perumbilly@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316090059.121605-2-elgin.perumbilly@siliconsignals.io>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,windriver.com,ideasonboard.com,foss.st.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-67547-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:elgin.perumbilly@siliconsignals.io,m:linux-media@vger.kernel.org,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:xiaolei.wang@windriver.com,m:laurent.pinchart@ideasonboard.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F98D752637

Hi Elgin,

On Mon, Mar 16, 2026 at 02:30:54PM +0530, Elgin Perumbilly wrote:
> @@ -543,29 +445,25 @@ static int imx412_update_controls(struct imx412 *imx412,
>  static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, u32 gain)
>  {
>  	u32 lpfr;
> -	int ret;
> +	int ret = 0;
> +	int ret_hold;
> 
>  	lpfr = imx412->vblank + imx412->cur_mode->height;
> 
>  	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, lpfr %u\n",
>  		exposure, gain, lpfr);
> 
> -	ret = imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 1);
> -	if (ret)
> -		return ret;
> +	cci_write(imx412->cci, IMX412_REG_HOLD, 1, &ret);
> 
> -	ret = imx412_write_reg(imx412, IMX412_REG_LPFR, 2, lpfr);
> -	if (ret)
> -		goto error_release_group_hold;
> +	cci_write(imx412->cci, IMX412_REG_LPFR, lpfr, &ret);
> 
> -	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, exposure);
> -	if (ret)
> -		goto error_release_group_hold;
> +	cci_write(imx412->cci, IMX412_REG_EXPOSURE_CIT, exposure, &ret);
> 
> -	ret = imx412_write_reg(imx412, IMX412_REG_AGAIN, 2, gain);
> +	cci_write(imx412->cci, IMX412_REG_AGAIN, gain, &ret);
> 
> -error_release_group_hold:
> -	imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 0);
> +	ret_hold = cci_write(imx412->cci, IMX412_REG_HOLD, 0, NULL);

	return cci_write(...);

I'll fix it while applying.

> +	if (ret_hold)
> +		return ret_hold;
> 
>  	return ret;
>  }

-- 
Regards,

Sakari Ailus

