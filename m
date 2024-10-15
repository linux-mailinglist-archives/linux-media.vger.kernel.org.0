Return-Path: <linux-media+bounces-19635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2A199DD55
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 06:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A6DF1C21573
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 04:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B73176AA1;
	Tue, 15 Oct 2024 04:59:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E898C442F
	for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 04:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728968370; cv=none; b=F6ZX97jxmKIKr1SsHlnynRKlHufRZS6cjXAY0QlYfqkaApFxqwKFfGdP4blmbzZ9Hxi7VhbNrbkkAqTDlXnSgrhyOiN1okSIl8rNiwqGqKU4IiIR0pJta0vF2ypFSTlrEqdMvndF2DiVtLeYhYhEBIlmonSohP9R8K6NMCe6hYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728968370; c=relaxed/simple;
	bh=lAaPcmD4u0iitF9uqB6VpbBwysW/Ztxy878IDSHutUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auVjMUggagmhrTxnc0CH6SDu+VAIUduhqOfy4Dy3Vt+QOBuMu6iw5SA5q8DL9oVR4LpehDwMPXhYwerNjw09RBRIgGRWARTbUpW6vNwgERPmFMuzBlj9kc6WoETnMafRVPVvr2PWNwTOxg2ydkpOCno9DC7pL49Y+eHv6Kli++E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id ABC82227AA8; Tue, 15 Oct 2024 06:59:25 +0200 (CEST)
Date: Tue, 15 Oct 2024 06:59:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Christoph Hellwig <hch@lst.de>, bingbu.cao@intel.com,
	linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH 5/5] media: ipu6: use PFN_UP() and sg_virt() for code
 simplicity
Message-ID: <20241015045925.GA18218@lst.de>
References: <20241014034732.3109440-1-bingbu.cao@intel.com> <20241014034732.3109440-5-bingbu.cao@intel.com> <20241014055401.GC20331@lst.de> <9ff8b19d-963f-0221-3b4c-9629cd938924@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ff8b19d-963f-0221-3b4c-9629cd938924@linux.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Oct 14, 2024 at 06:31:35PM +0800, Bingbu Cao wrote:
> > Not new in this code, but what guarantees that this driver never sees
> > highmem?
> > 
> >
> 
> The hardware is only in Intel 64-bit SoCs. And it is likely the driver
> working with 64-bit kernel. I am not sure driver should handle highmem.

Yes, that should be fine. Unless people bring back the unmapping
user memory from the direct map thing.


