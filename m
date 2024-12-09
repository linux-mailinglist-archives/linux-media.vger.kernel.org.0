Return-Path: <linux-media+bounces-22952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0DB9E9D2F
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 18:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F25902819C2
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 17:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300BD1552EE;
	Mon,  9 Dec 2024 17:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqFaWGyj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E5013AA2F;
	Mon,  9 Dec 2024 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733766016; cv=none; b=CSjkWuKkNjh5dHUE8jUohHa4YOfdo9kxBVR+pjtGJiRvWE+Oe8zjUIRPhuOKKQr3zAt6eNP3wmO5TP9WyeF4RIY0vJ0cbnqKaXGpNdJw4VE08JHTuRK10hDT7qL6qnkxA3RJiT1GCaZCKaeadY4SqIEAYC7bzg6PfiS8ozVYcgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733766016; c=relaxed/simple;
	bh=P3Li0hA+d4/qdZIMp+kuC9wtISUmDh+RDj/qLLZdrhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lpzr+rsrnaFuoWJHlQq6oP5gUaMONvam6OYvs2SOLipF4sEjj5Y0aT38eoD96BDXbM7vF8juukoQKRSH5GbZjOZGGZumeUomF7eFOK5yg1uKyVfDewsMUqcZqtPOVFUcpksdqqXZVfQ3N4lrST2cx3Dj10UhAqdaSdKFDSSoGXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iqFaWGyj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733766015; x=1765302015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=P3Li0hA+d4/qdZIMp+kuC9wtISUmDh+RDj/qLLZdrhA=;
  b=iqFaWGyjPiKLdrlOcf+K3ap8xIjCBOdTiORFoABvw1xTMaaPwcAxGCR/
   NsDq1pRStsSRPkn4mfKD8h46Au4EJ5UORdHArGrotGIqYTcKQ7/thvu1M
   c1Japu8LE6hVA0Ir036PManx2uDC/I6vwKesXoBPQAVdQKBniXCDlRleq
   unAphUgMzGwgVzf9BN9yjtwmeZLdtUN8/HuimwT25OFtQK5FUn4AhwaY+
   OfAfevNLN/LkBJ1EBU2G2aiOyBX31tUbhr47kFB5m+2/LgltI72ElCAbg
   ir6t4ivqoQ+al/jiBPTJT2qglKqwXT/kqwfQIwjZFiditf9xdhRe7aK+T
   w==;
X-CSE-ConnectionGUID: 6Y3J2/iTR9GmDQYauA2D4A==
X-CSE-MsgGUID: T0l4+bMdSxqbpKS0DqMqDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44757287"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="44757287"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 09:40:14 -0800
X-CSE-ConnectionGUID: P7DZoGf6Rk6ivEnCURkA3A==
X-CSE-MsgGUID: qoRm+YCBTEyk77pLYDOq+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="94984313"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.118.67])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 09:40:11 -0800
Date: Mon, 9 Dec 2024 18:40:09 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Genes Lists <lists@sapience.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	torvalds@linux-foundation.org, stable@vger.kernel.org,
	linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
Message-ID: <Z1creSb6XVWtpyUl@linux.intel.com>
References: <2024120917-vision-outcast-85f2@gregkh>
 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
 <5321021d929cebf7268fc163ddb92cb740c09c82.camel@sapience.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5321021d929cebf7268fc163ddb92cb740c09c82.camel@sapience.com>

On Mon, Dec 09, 2024 at 10:11:17AM -0500, Genes Lists wrote:
> On Mon, 2024-12-09 at 09:52 -0500, Genes Lists wrote:
> > ortly after booting in dma_alloc_attrs - maybe
> > triggered in ipu6_probe. 
> 
> > 
> Mainline v6.13-rc2  works fine on same hardware (i did need to add the

This upstream commit is missing.

commit 1d4a000289979cc7f2887c8407b1bfe2a0918354
Author: Bingbu Cao <bingbu.cao@intel.com>
Date:   Wed Oct 16 15:53:02 2024 +0800

    media: ipu6: use the IPU6 DMA mapping APIs to do mapping

It does not apply cleanly on 6.12.4, I'll post backport shortly.

Regards
Stanislaw


