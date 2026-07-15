Return-Path: <linux-media+bounces-67632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 31bGG55DV2o+IQEAu9opvQ
	(envelope-from <linux-media+bounces-67632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:23:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF875BD5C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:23:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ZIxVIsRp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67632-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67632-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB7AA302BCBC
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 08:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9023CD8C9;
	Wed, 15 Jul 2026 08:23:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C543B3CAA51;
	Wed, 15 Jul 2026 08:23:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103826; cv=none; b=fgBj1c82TxowUMUKdsz/PIdFFV6KXggFDfsuleZjBSKCH6wamzckzCIcwBszL8YexBAw4p2YjV2cF5rsATdTdnZLrnVl1XujRxavON1/Q5aS1DkcdtwX5CRoKJYkjaPhxMX0Bx48ZIdNbQmTD7UEU32VpdqbRBsDeVkIRjbRDek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103826; c=relaxed/simple;
	bh=58wwpJyXBYb4qLcHty67VmeNVnmtgaRdIOq2l4Yy/jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q20cuSyhSeTNNgZw3dp+RnqHY1Y0L7f+/y3M14t9DEvYXjBna54niDY7jxmj3wf6SUPKPftf7fqSafFTmtVOvmuI4joLBqG9pbrTP8uEirkPJtMorJM10Ru2bjZHKXNs52Eu4FOqsJ6SOENl++a/aKFlH1RpLOllU8y3ognFnsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIxVIsRp; arc=none smtp.client-ip=192.198.163.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784103824; x=1815639824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=58wwpJyXBYb4qLcHty67VmeNVnmtgaRdIOq2l4Yy/jk=;
  b=ZIxVIsRpNYDh6exapFt7IJqJEsGxsNCdwXwMaLumNo2kWuU+1c7GbQnE
   c7OgzEjMx2H+0DTrQoVby5nM30CEg1317R+vAWbYLiJxScgEMJIg2MN0b
   3bkxmxg5bpNENIVvdvX0O4etxViH3y5U3m1B4UOU850ZQrtUXm+hpmxeM
   CnkanooG7QtaErLyUB7mYkoV5P9vAKl9I6KKFOqhZlzgvtbTI9UUjBBYq
   zzi6mqdNxGDiv2XRws3svet+1ksQjjcalGIEKaBDTRBkLuZMqF0NpyXKz
   axp7DpU09Uj3XbMpE9K7b8UE+an49+xFdobAJlXSQ7CAulPOMwJBmOUuq
   A==;
X-CSE-ConnectionGUID: 26ql2AB8S/e5MaGiKCMtlg==
X-CSE-MsgGUID: 1+d+PXXDSo6T1K43S6QCvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84776478"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84776478"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 01:23:44 -0700
X-CSE-ConnectionGUID: 8TlHg0ObTY6EKxAjFYIyGw==
X-CSE-MsgGUID: CyqyiYACSrm4o1a4whwQBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="249736599"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.106])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 01:23:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3F23B11FA5C;
	Wed, 15 Jul 2026 11:23:42 +0300 (EEST)
Date: Wed, 15 Jul 2026 11:23:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] media: ipu3-cio2: disable MSI on probe failure and remove
Message-ID: <aldDjnZ33ljackNd@kekkonen.localdomain>
References: <20260715075607.62277-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715075607.62277-1-mhun512@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67632-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mhun512@gmail.com,m:yong.zhi@intel.com,m:bingbu.cao@intel.com,m:dan.scally@ideasonboard.com,m:tian.shu.qiu@intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ae878000@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,ideasonboard.com,kernel.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kekkonen.localdomain:mid,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3EF875BD5C

Hi Myeonghun,

Thank you for the patch.

On Wed, Jul 15, 2026 at 04:56:07PM +0900, Myeonghun Pak wrote:
> cio2_pci_probe() enables MSI with pci_enable_msi() but pci_disable_msi() is
> never called, so MSI is left enabled on the probe error paths and on normal
> removal in cio2_pci_remove().
> 
> The IRQ is requested with devm_request_irq() and freed by devres only after
> remove() (or a failed probe) returns, so a plain pci_disable_msi() in
> remove() would tear the MSI vector down before free_irq() runs. Register it
> with devm_add_action_or_reset() right after pci_enable_msi() instead: devres
> releases in reverse order, so the IRQ is freed before MSI is disabled, on
> every error path and on remove.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 986b9afd7c..3f738ca681 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1654,6 +1654,13 @@ static void cio2_queues_exit(struct cio2_device *cio2)
>  
>  /**************** PCI interface ****************/
>  
> +static void cio2_disable_msi(void *data)
> +{
> +	struct pci_dev *pci_dev = data;
> +
> +	pci_disable_msi(pci_dev);
> +}
> +
>  static int cio2_pci_probe(struct pci_dev *pci_dev,
>  			  const struct pci_device_id *id)
>  {
> @@ -1707,6 +1714,10 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  		return r;
>  	}
>  
> +	r = devm_add_action_or_reset(dev, cio2_disable_msi, pci_dev);

I think I'd do this without using devm_*().

Alternatively, pcim_enable_msi() could be nice. There would probably be
other similar functions that could benefit from similar wrappers so that
might be best kept separate in any case, also for backporting reasons.

> +	if (r)
> +		return r;
> +
>  	r = cio2_fbpt_init_dummy(cio2);
>  	if (r)
>  		return r;

-- 
Kind regards,

Sakari Ailus

