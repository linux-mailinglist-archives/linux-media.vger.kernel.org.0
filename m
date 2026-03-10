Return-Path: <linux-media+bounces-55238-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHvBMxqIsGl2kQIAu9opvQ
	(envelope-from <linux-media+bounces-55238-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:07:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7192581A3
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E88913029C1D
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DD43B0AE5;
	Tue, 10 Mar 2026 21:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oH955PFc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF5C279DCA;
	Tue, 10 Mar 2026 21:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773176850; cv=none; b=ZNxV85JoPSvW52WJBVEiAwuoHuTjoZ4JgycyJx0IMTY1P+/eYRAv90Lz/PDVM8G/Fe+t+mbnOtw6RSY1AA5VMz/bXhpKUMC9vvM7A2BNL9tTUqPGjuxtGnSXnhz9iXLpnCxbxS1ZcXU8NirDDVTuSNoKoXyfUR2eRj5csctlgdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773176850; c=relaxed/simple;
	bh=QD0ocCLo29LGXqoE2UpeJgKKNEmmXUqDI3RgU/UG4UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rh0DHB1baTQ2TXOhmAb6siiRsTIMniXX6tntRhVnkprMYVWgGNpChLghT3kfQjJDOU0wci0IzZ8p65swnqIWrkdIoSySXOGS7jtXFpf/YgymrAcp+1K1ShIKsXwvZaKx0KPsf4QA3QzOwi4lW192Pd3EmK16DRYEoM7lmV9qlX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oH955PFc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773176849; x=1804712849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QD0ocCLo29LGXqoE2UpeJgKKNEmmXUqDI3RgU/UG4UM=;
  b=oH955PFc4YfGQoq7aYFG3uEcOiPXc1UJFxKtvi22nijzmdFlavrCaH5F
   Lae4H2qB+wuJC2aOihCWnBm6W3Np6r8lRoXZ6LdPKkSFbX8uTVNul9zmD
   Kebsz2M6yM5SdamYIrfJpUg0wOK4cfWtjfHbz09GO8XMEx16RVx3H+8cZ
   ZgRpRXW24Q6urHqE4K9jG+l1VWmzVoeMSLMsFjGDQSeTkbdyp6R8ShLkM
   lCRaJY8STRxL4KT1EKLQRAM+kLXaiJJIz8T02mTFaeAx26VmCBZxHScVe
   AC2n/5UOBCgP8Nu+QlEEnAde1XzZ7GZRVNmaYPphLBnDE0X/kh9soKe5N
   Q==;
X-CSE-ConnectionGUID: 2qep1djwQmu5kaOwjUpV6g==
X-CSE-MsgGUID: XrVoSt2jR5eioqDU9wSiAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84867487"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="84867487"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:07:28 -0700
X-CSE-ConnectionGUID: uZWVu9RWRJeylP2ReXAurA==
X-CSE-MsgGUID: MPB2+mqHR0uif6GIR6yszg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="216978035"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:07:19 -0700
Date: Tue, 10 Mar 2026 23:07:16 +0200
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
Subject: Re: [PATCH 1/7] staging: greybus: simplify cleanup using __free
Message-ID: <abCIBPZzZBfMoOtm@ashevche-desk.local>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-2-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310200513.2162018-2-sanjayembedded@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 7B7192581A3
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
	TAGGED_FROM(0.00)[bounces-55238-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 01:35:07AM +0530, Sanjay Chitroda wrote:

> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().

...

> +	struct gb_camera_configure_streams_request *req __free(kfree) =
> +	    kmalloc(req_size, GFP_KERNEL);
> +	struct gb_camera_configure_streams_response *resp __free(kfree) =
> +	    kmalloc(resp_size, GFP_KERNEL);
>  	if (!req || !resp) {

Now this check should be done in a better way.

> -		kfree(req);
> -		kfree(resp);
>  		return -ENOMEM;
>  	}
>  

>  done_skip_pm_put:
>  	mutex_unlock(&gcam->mutex);

To complete this, one may add a prerequisite to use guard()() first.

> -	kfree(req);
> -	kfree(resp);
>  	return ret;
>  }


-- 
With Best Regards,
Andy Shevchenko



