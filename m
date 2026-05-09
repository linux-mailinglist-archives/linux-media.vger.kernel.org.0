Return-Path: <linux-media+bounces-60990-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGKLHTzM/mkqwgAAu9opvQ
	(envelope-from <linux-media+bounces-60990-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 07:55:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A334FE2AF
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 07:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25CD9301B4FA
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 05:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1693381AFF;
	Sat,  9 May 2026 05:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JN0Q4Wf3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D89330666
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 05:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778306104; cv=none; b=VpTUCMzPZb07OUTLseyJ38N+Y4zFI7FM5RQc7Hd+E011FWsIiqvveY/zwUwMETF2mLgBeXmtUpVf7W6hnGxfosL7cpNeANLD9CL7uIEbJ5wrurbmivDl2gaYKBoZIVhHZ4vnNZXL8G91SGLc/gH/cQRvhhr1pIscilu4D+V2KJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778306104; c=relaxed/simple;
	bh=5hRHi2UuH9Kopvp+C43fqR0+YbJ1bkI0syw3vymYipA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RC0K5bgZBq0XA3qz7nKV4uEjFwP32WyQYmI0fYzpLXOaQO4MfbxlhyGmvHaMCvGisie22Ag1/YhvPw05yAJ2PC3te3w6HMGvJMcmKTh9NtQ1hOfJ+Mx8kb99cCwRFPilHgWwytw/CC+VFbTTQRFYNc+mS2M2DijYAdyLC13R4xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JN0Q4Wf3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778306102; x=1809842102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5hRHi2UuH9Kopvp+C43fqR0+YbJ1bkI0syw3vymYipA=;
  b=JN0Q4Wf3n39mlyxXMNy6BdWr7bo8ATZfyAtn9I2ZD8ckhZl+HztDQzsq
   Bcp7okK7+xNBhM4Iai3VfsSUlvGJJdSMwVcUQ3F5rIGleu2VzlXhh5yUI
   rtxM7AHSWjPv2XKEV/T4FHBRBeZuY9O6qmiCi3+W247MsPfIVEuDypKdz
   oEAQn0PzfrGcCqIELNZIkILmbbzkuq5DxAAdSTEOLL6x24NIqOOht9X0a
   chKytzuAoy9980Z1SW8QXGSrcmziqdh/lR7eeyLQCZhndcKDhTAIofd4m
   BlcDIV19zkoHWR0NIhXGbWH4EzrgI2uXcYpb86vKWDMiBCeyImM6iEMHW
   Q==;
X-CSE-ConnectionGUID: /fTDw5YRT2WBGIcixXRsKA==
X-CSE-MsgGUID: qSd77+3NT027e7qSDE+SCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="104736193"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="104736193"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 22:55:01 -0700
X-CSE-ConnectionGUID: AldiaZa1SEm+ZwknPId4VA==
X-CSE-MsgGUID: UOkFPcjBRhq7NgYOC6BJPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="260411284"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa002.fm.intel.com with ESMTP; 08 May 2026 22:54:58 -0700
Date: Sat, 9 May 2026 13:31:56 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Dongwon Kim <dongwon.kim@intel.com>,
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	iommu@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>,
	Leon Romanovsky <leonro@nvidia.com>, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH RFC 21/26] dma-buf: Add the Physical Address List DMA
 mapping type
Message-ID: <af7GzASJiASopYiN@yilunxu-OptiPlex-7050>
References: <21-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
 <c413710b-4c28-4ed8-88ec-aeb8c4482011@amd.com>
 <20260413121628.GE2588311@nvidia.com>
 <f6d38a08-009c-4efe-9dc3-6bcf00ac35f7@amd.com>
 <20260422115306.GI3199414@nvidia.com>
 <fd8065ce-fd0e-4df5-9c80-8e9603657cfe@amd.com>
 <20260422131337.GJ3199414@nvidia.com>
 <e67426b9-4ded-4f6c-8309-7f847adb4540@amd.com>
 <20260422150000.GK3199414@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422150000.GK3199414@nvidia.com>
X-Rspamd-Queue-Id: 14A334FE2AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60990-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yilun.xu@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

> Would you be open to an in-between? The exporter and importer both
> have information that should not leak into each other's drivers. 
> 
> What if the dmabuf mapping type core code was the only thing that had
> access to *BOTH*? The exporter provides the address data, the importer
> provides the iommu_domain. The core code, and only the core code, has
> both and does the required operation?

I think that may not work for KVM. On IOMMU side, IOMMUFD acts as the
address space (iova) manager and dma_api/IOMMU driver acts as the
actual page table mapper. But for KVM, it is both. KVM doesn't allow
another component to provide an unknown address space (GPA space) and
say "map it", so doesn't expose to other components about "KVM domain".

Even if we expose "KVM domain", KVM still acts as the importer and the
mapper, is it wierd to say we trust KVM-the-mapper, but don't trust
KVM-the-as-manager?

Is it also wierd that we trust IOMMU-the-mapper, but don't trust
IOMMUFD-the-as-manager? There are more IOMMU drivers than IOMMUFD...

