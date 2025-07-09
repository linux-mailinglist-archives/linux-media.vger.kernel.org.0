Return-Path: <linux-media+bounces-37170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B918AFDE5E
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 05:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2652B189C5F9
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 03:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707102192EF;
	Wed,  9 Jul 2025 03:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DiIQG9IN"
X-Original-To: linux-media@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0E620468C;
	Wed,  9 Jul 2025 03:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752032412; cv=none; b=a6yD0TuBl6jVWCl9RfIDfu93bqVGo5+BD0KWhSRv8WWvpn+/rDG2wpCyunCuCfks/x2d4v3k2Rq8dm7zdeB5PNHET2WXA6v8OIF3EcnTBYik8gU0RokAMkJVTbouKN0QgHZzQEF3Ah830QNVBcjADf5ejMNm0glzaos5oVnp34E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752032412; c=relaxed/simple;
	bh=3SeS1jSZ1uKWb2RnmlmFn9EOFA/8pLBPt/77POmDd88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQbjSv8dVBTrgvN4PVHlGvwbExGEU3bonyLZgVjUOHXmrWk0WAx0io/V4CiuGMVr1mOZueboBJXveHBlvLMMy5G5G8M0/t4T9HE3aKq8D/tYKMyyvOHTB6LSBcQrzA9ZDiwt+B1Z1FRyZ3nv+NnScX+N0dbJImeOIE6VRqYpjpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DiIQG9IN; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=l0Gq002lEzoDPmtVcJJpz54mmuMH6UsxtCTp8dFyrXg=; b=DiIQG9INQ7CtYAmMKi/xLNPP9n
	F5LN75zy7oXey2ZZeG0Fibq2NRXqWDbPPIdMt041mH6fS3oHTtk2mErT6ZWUX5xZBN6+4w3thR4jy
	ccfFObBRKSEAu3NlbR5BSaOBoAs6CIO9GkhKaGwGVPb0jzd+QFXKw0n7d++UQo97RQJDCLqWn4ZC1
	CkCV+hmOjKTRlZ9OPp5j7iELhhBIbDEBRTmTPMai4i9WSNHSMBXKqwtg2qqLHIskxJWKFhIet6BqE
	mWQ3Rr0e0TkvPBegNEOXBf1in1WMTWROUgEc8QFBup62l67fWJ7+9DTy72u/FyiSYzu5IfUaPbEsV
	q28CpoOQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZLfE-00000002Hyu-0FaC;
	Wed, 09 Jul 2025 03:40:08 +0000
Message-ID: <e5f0a46d-401e-476b-a388-db3cce4b135d@infradead.org>
Date: Tue, 8 Jul 2025 20:40:05 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 8 (drivers/staging/media/ipu7/ipu7.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media@vger.kernel.org, akari Ailus <sakari.ailus@linux.intel.com>
References: <20250708201124.25e87f2a@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250708201124.25e87f2a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/8/25 3:11 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250704:
> 

on x86_64:

# CONFIG_ACPI is not set
# CONFIG_PCI is not set
# CONFIG_MODULES is not set
CONFIG_COMPILE_TEST=y


drivers/staging/media/ipu7/ipu7.c: In function 'ipu7_pci_config_setup':
drivers/staging/media/ipu7/ipu7.c:2260:15: error: implicit declaration of function 'pci_enable_msi'; did you mean 'pci_enable_sriov'? [-Wimplicit-function-declaration]
 2260 |         ret = pci_enable_msi(dev);
      |               ^~~~~~~~~~~~~~
      |               pci_enable_sriov
/drivers/staging/media/ipu7/ipu7.c: At top level:
drivers/staging/media/ipu7/ipu7.c:2775:1: warning: data definition has no type or storage class
 2775 | module_pci_driver(ipu7_pci_driver);
      | ^~~~~~~~~~~~~~~~~
drivers/staging/media/ipu7/ipu7.c:2775:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
drivers/staging/media/ipu7/ipu7.c:2775:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
drivers/staging/media/ipu7/ipu7.c:2764:26: warning: 'ipu7_pci_driver' defined but not used [-Wunused-variable]
 2764 | static struct pci_driver ipu7_pci_driver = {
      |                          ^~~~~~~~~~~~~~~
@-- 
~Randy


