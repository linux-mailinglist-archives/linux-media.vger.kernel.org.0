Return-Path: <linux-media+bounces-67195-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p7hrBtPMT2okogIAu9opvQ
	(envelope-from <linux-media+bounces-67195-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 18:31:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0B77337A9
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 18:31:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=deltatee.com header.s=20200525 header.b=Nh8jbmKX;
	dmarc=pass (policy=quarantine) header.from=deltatee.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67195-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67195-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45855304D25D
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 16:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2831E430CF6;
	Thu,  9 Jul 2026 16:27:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C78B41166C;
	Thu,  9 Jul 2026 16:27:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783614422; cv=none; b=bEraJZxo8jVBWKmpd1BBEYnrN2o1RTSssHA8h+XujJnuQa1fbH7rP61UPu6DTO4tytb3UaRDMoD8S/PKSJJUnk9DYqN1r1AZaQKIr0wDFWtq8kOymey45GyzPJCbRM0maqwcrR83PWp2Z75tJ0TwDBcf+FGQ7+ulzErdiFPk/8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783614422; c=relaxed/simple;
	bh=0tqmk8Tpz1xLWrkV/i4FASNfmGaEw9KxoFnNvgzOptA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:In-Reply-To:
	 Content-Type:Subject; b=pm3eSNlRa/sdLxJZXvhopnsUb4OifjJSWHwZb4lZ/JILmLZUmktx2tZhW3tbOl+wsF4XI9uaAtKRSPAADHR2QkMQLx5PK0Z7Xv1CutuWcjxSN4fwO1Ca8AE/6My0QergocGq8bNho7ZkmJyh08vR/prNMauBf+qadOf3mU6E1UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=Nh8jbmKX; arc=none smtp.client-ip=204.191.154.188
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=cy1QN1NzhHYQz51ULp2Gqf50+XQ1ns+77hhEPNga8rY=; b=Nh8jbmKX6frPNXdTwrWeSUk2K/
	wwAvA+IcRPsu33aWOOpLuL0vijI5DgOV90JCS0vpLno0kjWUzlQOKyS4YwO6k8R8nO7RDwrSMV+dL
	eUNoj0A1PKV5vNYV3esTbqfTeiVKHGkk7+XHxoh+bcruLUDYUxzX5Wd7yRHZ1xiCoknTcW04nSocm
	TcKxahaxu8DLA8ypbE2ArShDLuHPM0Wr6ec/033XdX1AaSEAa6bEKV6ZfKT1F5zkrnnd4htX8lYM5
	87Ax4T2lzLv1AEZrAaLw51M1m/4UwdZNo1vEMAQmEbhUh++xiDpV7Q6oEbp3ERRx1sczH4nnFpYrt
	QnN4V9Dw==;
Received: from s0106ac1f6bb1ecac.cg.shawcable.net ([96.51.150.74] helo=[10.0.33.8])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1whraJ-00000002TP7-04hO;
	Thu, 09 Jul 2026 10:26:47 -0600
Message-ID: <9b664c05-8e85-4ccb-afc4-91ba807438b7@deltatee.com>
Date: Thu, 9 Jul 2026 10:25:45 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matt Evans <matt@ozlabs.org>, Alex Williamson <alex@shazbot.org>,
 Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Kevin Tian <kevin.tian@intel.com>, Pranjal Shrivastava <praan@google.com>
Cc: Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Ankit Agrawal <ankita@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260701171245.90111-1-matt@ozlabs.org>
 <20260701171245.90111-3-matt@ozlabs.org>
 <26f74cf0-8892-4672-b0e1-1f1a385c42bb@deltatee.com>
 <aecbbc66-c154-4439-a6ae-84dc012b0f8d@ozlabs.org>
 <1cd1b832-082c-4f9c-ab68-706110ddcb25@deltatee.com>
 <e0ccdfd7-2379-44ae-b579-a0da045d7f1b@ozlabs.org>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <e0ccdfd7-2379-44ae-b579-a0da045d7f1b@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 96.51.150.74
X-SA-Exim-Rcpt-To: matt@ozlabs.org, alex@shazbot.org, leon@kernel.org, jgg@nvidia.com, amastro@fb.com, christian.koenig@amd.com, bhelgaas@google.com, kevin.tian@intel.com, praan@google.com, mngyadam@amazon.de, dmatlack@google.com, bjorn@kernel.org, sumit.semwal@linaro.org, ankita@nvidia.com, apopple@nvidia.com, vivek.kasireddy@intel.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org, linux-pci@vger.kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH v4 02/10] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[deltatee.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[deltatee.com:s=20200525];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:kevin.tian@intel.com,m:praan@google.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[logang@deltatee.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-67195-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[logang@deltatee.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[deltatee.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[deltatee.com:from_mime,deltatee.com:dkim,deltatee.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D0B77337A9



On 2026-07-09 10:17 a.m., Matt Evans wrote:
> I'm intending to repost _retaining_ the 64BIT dependency (i.e. revert
> its removal) for simplicity's sake.  Then we can follow up separatey
> (outside this series) with a cleanup patch to remove 64BIT, explain,
> examine other dependencies etc. as you suggest.  Works for you?

Yup, that's fine by me. Thanks!

Logan

