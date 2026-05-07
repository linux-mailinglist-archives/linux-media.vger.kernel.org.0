Return-Path: <linux-media+bounces-60839-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNe9OsO6/Gl2TAAAu9opvQ
	(envelope-from <linux-media+bounces-60839-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:16:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C344EC0A1
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83FFF3128E1E
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 16:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CE144CAD9;
	Thu,  7 May 2026 16:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="sC/HxRbj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B50F3F0AB9
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778170205; cv=none; b=Bah2fxfMaWfqnzuxdWrO2NbOLjFEX5m9/bTQndh9awlStb6/zvbIvKxIw0vRPa34fIrXg2CJIntXW2dFAEVjXcbFhFQArlrEqhIAh6QnlSwP2dUX6e8XAcIzWbYRwCaFiMDjb8U/zpC4IOgVPJBoPR9mU7o5ye6xpWjpxKAk4TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778170205; c=relaxed/simple;
	bh=xhlnadrHwiFfIWY2g2xSfdQ0B9ev2VRblVYd07DI1c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Emd4gsB8vbTe9g7Rq+lGKWli3BGrEILWD0vHc0eF0BILt+3qE3EbImbTtY1NFfKn5p8he7WQM4atq9ulyuN+tjuOYeeyyUQ5hOmpcTuw+GHpA8i5xnR0MZ+y9aFVanPehB4bwKcDDp5VlSlLVmvvqqS8ExiOXmlxWOzIo+SNZxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=sC/HxRbj; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475xMwC571467
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 09:10:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=eFG1vBkuGjV5WqwCWdKJSFjXXoeKLNuaVc0SsnohSl0=; b=sC/HxRbj/khP
	lauwqZ9En1m3PiufFWhk2MVi8NnVzUAemf9bI6F5CBdj1cHPIggkaXe2/+EQOCEU
	Qfst0vpp73IxZdukxzFpSLZ/U+7vQBDU5pepEIqV/Iud44cWwJgw12gI1g58sTtM
	KksXYFPHQ8h6CUL6YKHLFFteuLAoXy3X/XAZiCtRuXtKlenAOWQS4xrDbUZ67XKR
	BAi7ALQLC2NtDOk9eMoLHqLiIEvmiSJgtKCAHe7XRwq5NbKpCcUkRb+O1q4FcLKp
	jMlfnYMVmysh10DkwwgF9TodXhraCJ5gFNKqgDPilbYYJj3L3jdHUXWSyilWfZwb
	YMz6VepcRw==
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dwec78x1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 09:10:03 -0700 (PDT)
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4411a2c034fso857625f8f.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 09:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778170202; x=1778775002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFG1vBkuGjV5WqwCWdKJSFjXXoeKLNuaVc0SsnohSl0=;
        b=Ck3ZW/I2ekwAw7tdvNewCP0ZLibYuDJOE5bo37WWnzz5592a9rJJRk/DRyvwOb7m7l
         M2XBMInLk8ASiLkJ3QysINpEvkzKG5NM8gk80umNj0dfkUxhjZbYZlGTM5dfmDocaqQu
         g22teRtOc5bD5V01CCzOc1vz7TYjsmnETlQw356wArENa2Ef9CpVfiR9geaUA+xsyo90
         3wDbbBQG2uOh38EQRMQMCGHUAaouP7OXuCq5CTXkbcaAxrR4ZFcFA6srnOYMjYDHIBkb
         b56aZEaxogra8EMDMc4kv76KsnQGDsRga6uBvw05bXw0QG7iEoAG8LW4PQckXk29BNFv
         2uAQ==
X-Forwarded-Encrypted: i=1; AFNElJ94fwop6aj83HCFUbiWXbncy8pEqay2Y52/ZkyMzgBC00/FHKiyZuK5AjrRyLIVzTDGtsOe2dwVJaMP3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6aUy1fAmor9MnYkyzM1b40r0J54EYgyAS+UAB77faDeavBT3S
	E7NsF96HChyjFoOyv9nusvPbdgr/avLSaLrBWiSi1pGm4kQjWCyG6KoiukNoS/zsOH519TAiumG
	rpIN9GoUjzlCU6z3Lk2aPfNcx7XV0gvL+4BE2VtocciFspDlXQ26Kkj7WoNWt0iY=
X-Gm-Gg: AeBDievx4EsX5/gZsV9CXs3MAY3YyGB/f1stdEyrm++3xnPSurF5CE2oaw+JxfaT8cS
	AQ7xuqvknycvdN/UKq6tvesSiqnIUCPsvaCIRnMCMa0pghNEQnNRBT50xxT8CebBKfMESF/29nv
	JWzaRL4wDK7A7ICmeE1CHXZHoZGEXpNy2Wf1NJUlb86LiE6mQm2cCmBmmzmvCRh3PjNmGvD3ds4
	lIxetj51ia6BJTAPQWtvQEybDsv3KI2H4irmJd1o5kPGk/k9N5libLfwnStKHC9bAY3XycI+bP6
	Ua5h5x0BU/ulJFHDVsGQ0t05j67axHvOTFZPQT5T+EaB2zK0e2QkzRq3yZupbS5+/rLszBpErgl
	YRCyMCP+xhlQZyJF0aPd16+/PGFH58Hf2TmSi3wWvqr/C1aA6endufG1DGqSKs3a6nGnOEhEA1N
	AUePne4MoL+sJ09l7M3McJQJ0G+AbtmaNEhdjxDUvpbT+aysNSGTU1SY0AU26ZFb5YpkQbrklrT
	nNcETXja1W9jpIdz8GxBrk=
X-Received: by 2002:a5d:5f47:0:b0:43d:613:33de with SMTP id ffacd0b85a97d-4515cf11d94mr13854426f8f.20.1778170201784;
        Thu, 07 May 2026 09:10:01 -0700 (PDT)
X-Received: by 2002:a5d:5f47:0:b0:43d:613:33de with SMTP id ffacd0b85a97d-4515cf11d94mr13854369f8f.20.1778170201226;
        Thu, 07 May 2026 09:10:01 -0700 (PDT)
Received: from ?IPV6:2001:8b0:8b6:13d4:102e:f2af:e074:5cde? (e.d.c.5.4.7.0.e.f.a.2.f.e.2.0.1.4.d.3.1.6.b.8.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:8b6:13d4:102e:f2af:e074:5cde])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412820454sm149530f8f.6.2026.05.07.09.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 09:10:00 -0700 (PDT)
Message-ID: <2a75c858-5dfe-4b93-98fc-909a2ee5558d@meta.com>
Date: Thu, 7 May 2026 17:09:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] vfio/pci: Support mmap() of a VFIO DMABUF
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
        Alex Mastro <amastro@fb.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
        Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
        Pranjal Shrivastava <praan@google.com>,
        Alistair Popple
 <apopple@nvidia.com>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kvm@vger.kernel.org
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-8-mattev@meta.com>
 <20260424183006.GI3444440@nvidia.com>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260424183006.GI3444440@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vc3H+lp9 c=1 sm=1 tr=0 ts=69fcb95b cx=c_pps
 a=CsXZvLRfiTx/ye2xXAwb9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=bfFL6uTa8VbwhnMIod8A:9 a=QEXdDO2ut3YA:10
 a=F7q00xkr9EfWfQvbdVXI:22
X-Proofpoint-GUID: VLDpuLkUuq76dosP9H6qvBrGgsVoomJN
X-Proofpoint-ORIG-GUID: VLDpuLkUuq76dosP9H6qvBrGgsVoomJN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE2MSBTYWx0ZWRfXz2QfCWFH4MgC
 UfZSNN1za8toGZSsnqrx8KYSyoaHopbb9dLKqLdUpI17XTLQ8Y8MgJcFgBYmmzQp5RQ+/DdarCw
 uk7WAY25FrYiv4kvW7AxcDfLmXW/dOcExlLhU/8ujWcrqCViJj5WQp5dv29CuD0+l7vlgFUehiB
 KAO4TMoAMXuZo5bEjTJBr+mY4+6POlDcGay/vgVYmhH1bnXSgpw5A1tc+5WvjrfGgXjDhY0B2id
 SI2+Xh1TAaLkpnPtDybaeVdECiRduiqn6cwcax/viX5VsLODO8IP8CMtuB8mw41e0RoCMpKp1zD
 31ZBpGEvdPgSzJkRXlJQQMOuWHOlIf6COQ3Vca76ecfw6zDT1UXky0TKPoAsXOpSr1VD6hNBhyF
 IoqYaYpTPJ6oVYINCdhIHygXGzC15PJJQvyxwwxBHKh7jp7ysAhMc9c6HrmySWReC/QMcqsh12N
 sTMWhWVPf18j3pAGqGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Rspamd-Queue-Id: 22C344EC0A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60839-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[meta.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Jason,

On 24/04/2026 19:30, Jason Gunthorpe wrote:
> 
> On Thu, Apr 16, 2026 at 06:17:50AM -0700, Matt Evans wrote:
>> +
>> +	dma_resv_lock(priv->dmabuf->resv, NULL);
>>   	vdev = READ_ONCE(priv->vdev);
>>
>> +	if (READ_ONCE(priv->revoked) || !vdev) {
> 
> Why is this read once? It is inside the resv lock so it is stable?
> 
>> +		pr_debug_ratelimited("%s VA 0x%lx, pgoff 0x%lx: DMABUF revoked/cleaned up\n",
>> +				     __func__, vmf->address, vma->vm_pgoff);
>> +		dma_resv_unlock(priv->dmabuf->resv);
>> +		return VM_FAULT_SIGBUS;
>> +	}
>> +	/* vdev is usable */
>> +
>> +	if (!vfio_device_try_get_registration(&vdev->vdev)) {
>> +		/*
>> +		 * If vdev != NULL (above), the registration should
>> +		 * already be >0 and so this try_get should never
>> +		 * fail.
>> +		 */
>> +		dev_warn(&vdev->pdev->dev, "%s: Unexpected registration failure\n",
>> +			 __func__);
>> +		dma_resv_unlock(priv->dmabuf->resv);
>> +		return VM_FAULT_SIGBUS;
>> +	}
>> +	dma_resv_unlock(priv->dmabuf->resv);
>> +
>>   	scoped_guard(rwsem_read, &vdev->memory_lock) {
>> -		if (!priv->revoked) {
>> +		if (!READ_ONCE(priv->revoked)) {
> 
> Same here, it is not read once since you hold the memory_lock it is
> stable.

I used them more as an 'eyecatcher' to complement the comment.  Although 
they're not strictly required (compiler barriers at the lock/unlocks), 
they stand out to say "something's going on here".

Revoked/status is read first holding resv, and _must be read a second 
time_ once that's released and after memory_lock is taken, so two 
READ_ONCEs seemed appropriate to show this.

But if you feel strongly, sure, I can remove it (though I'd add, say, a 
/* Re-read status value */ comment).


Matt

