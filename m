Return-Path: <linux-media+bounces-60264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO5pA4Nl+GlDuAIAu9opvQ
	(envelope-from <linux-media+bounces-60264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 11:23:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AD64BAE88
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 11:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E5933012C84
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 09:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FD937756E;
	Mon,  4 May 2026 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdlEHcn/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EE035A3B8;
	Mon,  4 May 2026 09:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886591; cv=none; b=twFBRAEKsRzloSdAEckjoMW6YdNNLhPfHnoN3isnh65irACp5YVmf01T8s5E0ggte44VKekaDxGRft5WP87zOyqBoeFZGSabtTwwicEx4IPukQfWvojhGFL6AA1zHBf1+YcTn6Nq05RBNBnov3WZ1ShquixEDecpzOyjL9GkFeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886591; c=relaxed/simple;
	bh=nZb0z9pTsXJI05TJH4UO/YC/GWTdUKG+HJaCP67coDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1Mb3a4FxJXPMkqsN6cLKQsqMsrai94nn2qSmZHEQLSf0zdtn3mY2eT4deu6LWYfFB9g7GXvdDeLfttq4d+7/mBkwiColUQgLBMfnjagLw2WiFme4j8qhKmAGbzEY8zzRPV1S+Bl1dGWkSr02fH2duTnT0lbunHnMi+BlqgLcxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdlEHcn/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777886589; x=1809422589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nZb0z9pTsXJI05TJH4UO/YC/GWTdUKG+HJaCP67coDE=;
  b=CdlEHcn/DhzhZnuI0POrhjPIfDpijzPHNQEuD2zVbbqtHReBjnaJ7lg9
   673UrjEQtMjZsImVeSu/99ux3c9tr6T7r+3Js5WdExy0D+aybUXu8hh5m
   UzGxdaAuWh+maR2ezG/wXYjDcPYU9aIUmiKFn9RhuE31c3J9XChu+hanL
   lcCfqasZ08IIR78flCV0wiAvAcVI4XoF55FIuBKUFrbHVhNf0q/13CcOn
   YY9q3PlqlxU+fDL4nWArdE1NFZLShssCwXC+dbZ7194VwePiXBiG3SCYn
   4fHP/azReD/X50yimxAbJoCkDFS7yb3KHuuq7D6hEfdbJKTUhedxhgEM1
   w==;
X-CSE-ConnectionGUID: qC4ZY1KgRRiKxT1otlWvAw==
X-CSE-MsgGUID: uff8mg1yRAW2aAg+g+cHbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82589817"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="82589817"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 02:23:08 -0700
X-CSE-ConnectionGUID: lMWpqpVDQA6m+lgKQHiWpQ==
X-CSE-MsgGUID: B59DyxOwSSWdP1Kb4r6Dsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="234603399"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 02:23:06 -0700
Date: Mon, 4 May 2026 12:23:03 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: drop unnecessary else block
 after return/break
Message-ID: <afhldw80eBVTR8Fo@ashevche-desk.local>
References: <20260503172200.94712-1-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503172200.94712-1-shyamsunderreddypadira@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 71AD64BAE88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60264-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]

On Sun, May 03, 2026 at 10:52:00PM +0530, Shyam Sunder Reddy Padira wrote:
> Remove redundant else blocks following return or break
> statements.As control flow exits in these cases, the

There is a room for more words on the lines. Also respect English grammar and
punctuation, exempli gratia use space after a punctuation.

> else branch is unnecessary.Dropping it improves code
> readability.
> 
> No functional change.

...

Code wise almost good, see below.


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
> +		"%s: error in iunit interrupt. status reg=0x%x\n",
> +		__func__, irq);

Now it may occupy two lines only.

	dev_err(isp->dev, "%s: error in iunit interrupt. status reg=0x%x\n",
		__func__, irq);

> +	spin_unlock_irqrestore(&isp->lock, flags);
> +	return -EAGAIN;

-- 
With Best Regards,
Andy Shevchenko



