Return-Path: <linux-media+bounces-55239-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP+rBD+JsGmukQIAu9opvQ
	(envelope-from <linux-media+bounces-55239-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:12:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2BF2582CC
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5595130614D7
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67AA3BED2C;
	Tue, 10 Mar 2026 21:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZ742tAh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC839DBFB;
	Tue, 10 Mar 2026 21:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773177129; cv=none; b=AQZNwu3KRGo7Tfjp+q8kbnyfcctVkP8Xm7UVf5qHdqY8gvCiPKgb8T4/JGtOJV/w4YaAnL7sxfOVb/hiOATYn0TK7q4p2MBGP81PIZa52Zbw+Hdsww8JEmGpJHtfxxpcA7tdmTKBkmx0aKFoLV542f3oNA/HDXFl42MDq6JhIUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773177129; c=relaxed/simple;
	bh=pehZhuiQQpthYsgXZoLR8NFfpxutBnuajwfJq5hQwx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjlfXYOqz2Ba6YKWxrnixhrzxnda9SS+6GBoTYQx+J9kjOJZp3Zsx0HHKA9pbbKQzkC4uTK+x3+tOOox949wJiGig5qtg9G1s5EvCSaFc8MWvW2ytIb0eCf4jpFzS0cG8pCehsHqA2Ur+kqBjXf6KI+hu2GldIebWjH9dVuswJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZ742tAh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773177127; x=1804713127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pehZhuiQQpthYsgXZoLR8NFfpxutBnuajwfJq5hQwx4=;
  b=RZ742tAhpuRUF5xMJzpNqTxJBFlW4nZ54vx/dmeOoTJHdFxe88OUVPaw
   z+fjCP40m9bSQ0+mJeOwN6Hk9qCQEsrEoaaDGcn8CwzJNK6Wk2RMt/SE3
   nAwR+xpWJfaFeyXFHM9/1QVyTZLfJ402Enn1xncgwWdJwBgexyRC/pMRj
   pJuJE2eJrr7x31RcYLYuZWh6uKwWFErL5fx69WAxBxqN26heobIJ2peFq
   QHIShjL3uXu/5F5OXQxsneED0c8/FO7A0AuWftyqXWmkD3RiRxMmpU0Vo
   S6+k5SM43hwirYCdqmwzkkaPyqGjMFVphZ7zno7AqZaiUu0ahiSBnzt/q
   Q==;
X-CSE-ConnectionGUID: iBTPoyGmTuSau0yQQE3FsA==
X-CSE-MsgGUID: NSLkxqu/Sia8Oysmj+OpQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77841729"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="77841729"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:12:06 -0700
X-CSE-ConnectionGUID: ixppP8mBRc2aAsqY+2t1EQ==
X-CSE-MsgGUID: +u7wFx7eQXiY/mTugiKMyQ==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:11:58 -0700
Date: Tue, 10 Mar 2026 23:11:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
	kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
	straube.linux@gmail.com, dan.carpenter@linaro.org,
	lukagejak5@gmail.com, ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
	sun.jian.kdev@gmail.com, weibu@redadmin.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 2/7] iio: ssp_sensors: simplify cleanup using __free
Message-ID: <abCJHOuBcPo4W2GQ@ashevche-desk.local>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-3-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310200513.2162018-3-sanjayembedded@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: BC2BF2582CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[43];
	TAGGED_FROM(0.00)[bounces-55239-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie,baylibre.com,analog.com,nabijaczleweli.xyz,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 01:35:08AM +0530, Sanjay Chitroda wrote:
> 
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().

Why this is a series? You can avoid spamming tons of unrelated people with this
by sending patches individually.

...

>  	case SSP_HUB2AP_WRITE:
> -		buffer = kzalloc(length, GFP_KERNEL | GFP_DMA);
> +		char *buffer __free(kfree) = kzalloc(length, GFP_KERNEL | GFP_DMA);
>  		if (!buffer)
>  			return -ENOMEM;
>  
>  		ret = spi_read(data->spi, buffer, length);
>  		if (ret < 0) {
>  			dev_err(SSP_DEV, "spi read fail\n");
> -			kfree(buffer);
>  			break;
>  		}
>  
>  		ret = ssp_parse_dataframe(data, buffer, length);
>  
> -		kfree(buffer);
>  		break;

Now you can return directly.

		return ssp_parse_dataframe(data, buffer, length);

But also add a prerequisite to convert to guard()() et alai.

>  	default:

-- 
With Best Regards,
Andy Shevchenko



