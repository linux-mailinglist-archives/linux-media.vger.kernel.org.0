Return-Path: <linux-media+bounces-67408-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jTM/EriiU2pacgMAu9opvQ
	(envelope-from <linux-media+bounces-67408-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 16:20:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 947E1744F5A
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 16:20:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=bAnVOMr+;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67408-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67408-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF0EF30209EE
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 14:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB89D2367D3;
	Sun, 12 Jul 2026 14:20:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3E1FF5E3;
	Sun, 12 Jul 2026 14:20:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783866024; cv=none; b=mIwzRLIoYagmqRg1OwOmoLcaehRDiyXEjEmqdqvK7F5E4Xt4sAyUaq6Q0TghIAQNtO2u3lywMfcCGE5uUw93wbEf9C6gFm9ZhZkHnKToHZVaTPKPgeLLKpgYEAtIvj0pyXTAzavq980Am/YQYv6NHPmYJSFjtB3us+kb8792Sdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783866024; c=relaxed/simple;
	bh=5Nhcnc4ezLPy8605Kf9M8EI1NlsLUYRMPtnyY/wPBAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WA4AYvlqjvo8vYZAy2ZJLK5BcVeSPm2a5gpv5O33BDzuq+gBXFvYApu+joKu+rP4uLi77LAi+KtXO75Vzt/jVTH87b/x6PQj7M5eBc5Q0Id51PgadrLxbH17P54zIZOeaOQmUzD2BreIWOagtkqHdhdMdkZATL53L4pIKfHiauM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAnVOMr+; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783866023; x=1815402023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Nhcnc4ezLPy8605Kf9M8EI1NlsLUYRMPtnyY/wPBAk=;
  b=bAnVOMr+UbCRZlQfQzKHSRnT2YoWW3qWePzlWNO32uFxv9C8rJvaDbZH
   5H5B5zOGEtiqyLd6iAK8HIB/KN4mwBDECwI9N75ndOCwXc/KRlGnq/5zj
   VFcGu1kEo3H20uzAITWuBFrleLrkNQvkXlyfXOzDn3+k4CJ4Zf+Ub0I4P
   8z88+ZlkVQPfEz5M5zHtAhSckiS4dnlfDDpwSLtqmheBr0dgQSVKHfnAQ
   jfoHkUOQuzi+xIMeKKO1LbyaJtJN0Fve0sNovNAn0VUct7JqGvGqYoVNS
   4FbVXd19ERJiFlIoDxPRd1B3qFpflJakCNSWhG4OwuRc50qfQEL2sun+7
   A==;
X-CSE-ConnectionGUID: 3+nraoyEQ6mrijYgxMkzpw==
X-CSE-MsgGUID: GniPLyYqSne+qVZ2jh1eNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107295050"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107295050"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 07:20:22 -0700
X-CSE-ConnectionGUID: 4tJoZCGGRTS6U1yqQB2mNA==
X-CSE-MsgGUID: 4yjcvf6eSzinApMmCgAc3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259628589"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 07:20:17 -0700
Date: Sun, 12 Jul 2026 17:19:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	chelsyratnawat2001@gmail.com, abdelrahmanfekry375@gmail.com,
	matt@mattwardle.net, azpijr@gmail.com, error27@gmail.com,
	kees@kernel.org, pontescpedro@gmail.com, starpt.official@gmail.com,
	karthikey3608@gmail.com, roehling@debian.org, feng@innora.ai,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Drop unnecessary else block
 after return/break
Message-ID: <alOii3vwmkWGfVNx@ashevche-desk.local>
References: <20260706103810.71919-1-dileepsankhla.ds@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706103810.71919-1-dileepsankhla.ds@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67408-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dileepsankhla.ds@gmail.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:chelsyratnawat2001@gmail.com,m:abdelrahmanfekry375@gmail.com,m:matt@mattwardle.net,m:azpijr@gmail.com,m:error27@gmail.com,m:kees@kernel.org,m:pontescpedro@gmail.com,m:starpt.official@gmail.com,m:karthikey3608@gmail.com,m:roehling@debian.org,m:feng@innora.ai,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:dileepsankhlads@gmail.com,m:starptofficial@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,mattwardle.net,debian.org,innora.ai,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:from_mime,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 947E1744F5A

On Mon, Jul 06, 2026 at 04:08:10PM +0530, Dileep Sankhla wrote:
> Remove redundant else blocks following return or break statements. As
> control flow exits in these cases, the else branch is unnecessary.
> Dropping it improves code readability.
> 
> No functional change.

...

> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)

>  		spin_unlock_irqrestore(&isp->lock, flags);
>  		return -EAGAIN;
> -	} else {
> -		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -		irq &= BIT(INTR_IIR);
> -		pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
> -
> -		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -		if (!(irq & BIT(INTR_IIR))) {
> -			atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
> -			goto done;
> -		}
> -		dev_err(isp->dev,
> -			"%s: error in iunit interrupt. status reg=0x%x\n",
> -			__func__, irq);
> -		spin_unlock_irqrestore(&isp->lock, flags);
> -		return -EAGAIN;
>  	}
> +
> +	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> +	irq &= BIT(INTR_IIR);
> +	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
> +
> +	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> +	if (!(irq & BIT(INTR_IIR))) {
> +		atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
> +		goto done;
> +	}
> +	dev_err(isp->dev,
> +		"%s: error in iunit interrupt. status reg=0x%x\n", __func__,
> +		irq);
> +	spin_unlock_irqrestore(&isp->lock, flags);
> +	return -EAGAIN;

I would really avoid touching this for now. This is non-straight workaround for
some platforms and it needs real care on what's going on and how to make it
look better. Since your patch does not targeting that, it's doubtful that this
change is helpful.

...

>  	if ((*flags) & INPUT_SYSTEM_CFG_FLAG_SET) {
>  		// Check for consistency with already set value.
> -		if ((*lhs) == (rhs)) {
> +		if ((*lhs) == (rhs))

Unneeded parentheses, also see below.

>  			return INPUT_SYSTEM_ERR_NO_ERROR;
> -		} else {
> -			*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
> -			return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
> -		}
> +
> +		*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
> +		return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
>  	}

In this case it's better to toggle the conditional to follow the pattern to
check for errors first.

		if (*lhs != rhs) {
			*flags |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
			return INPUT_SYSTEM_ERR_CONFLICT_ON_RESOURCE;
		}

		return INPUT_SYSTEM_ERR_NO_ERROR;

And yeah, looking at the below, you might want to have a common helper for
this. So, perhaps don't touch these three cases for now. Or we can leave them
as in your patch, it's up to Sakari and you.

...

> +		/* TMP: check discrepancy between nr of enqueued
> +		 * parameter sets and dequeued sets
> +		 */

When moving comments with a wrong style, fix the style at the same time.

		/*
		 * TMP: check discrepancy between nr of enqueued parameter sets
		 * and dequeued sets.
		 */

...

> +		assert(g_param_buffer_enqueue_count < g_param_buffer_dequeue_count + 50);

What will this do in the kernel environment? Perhaps first you need to check that and
most likely change the assert():s to something else?

...

> +		ia_css_bufq_enqueue_psys_event(
> +				IA_CSS_PSYS_SW_EVENT_BUFFER_ENQUEUED,
> +				(uint8_t)thread_id, (uint8_t)queue_id, 0);

Why do we need the castings?

...

Half of the patch is good to go, and the other needs more work and real work on
the driver.

-- 
With Best Regards,
Andy Shevchenko



