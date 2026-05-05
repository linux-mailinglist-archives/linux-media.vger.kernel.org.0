Return-Path: <linux-media+bounces-60470-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBsfFG4z+mlLKwMAu9opvQ
	(envelope-from <linux-media+bounces-60470-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 20:14:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 024454D287F
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 20:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1BBB300E5D7
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 18:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1274A340A;
	Tue,  5 May 2026 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="s2knLRbe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4483E3DB7
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 18:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004839; cv=none; b=pWiNuMw0F8Pb8kwD0Kxv8MebcrPzYdDQeH6nb7MDkXS4TLLn0/ERttKlppXPz7JA9Mq2YgfksRKn5EiTR3yJgEkv0nhqWdtdrqcypEZbmYIgdn0xI/pjQKE5W+9mkLL//7gh9KoEUZn5ew7oELQJvrfEgY+vSEU1sHqCVFWGVPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004839; c=relaxed/simple;
	bh=3b27KxuKQlB4Xmy1kkKEdcO+WaPnuhruIPgcAT3CJvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPdjNRCGlZiajp6LaK3rxyOM9Vv2C/DyqgOhde/63m6f8UGiOeZKsyDQDAnfc4RkAqZ/59SkkMISSpMEhc9YJ4JmlOplwY6JjStusACzhpnxzhRTUappMjHVBhTJ2LQAUjaD7UGh7shSiCALGQoang5fThVbZaUbaQM4UhVDZno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=s2knLRbe; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645EFnWL2795328
	for <linux-media@vger.kernel.org>; Tue, 5 May 2026 11:13:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=n/8Evrp0/Cs5xE91fVKhf/YUdfmd3rQjcqs7sGTTtLk=; b=s2knLRbegq9X
	RCpDDJ/hBxKjw2pRkecpdWzz2gHGLBfGVyowgs8mooCbRWX5MHpJSEhh8YVlH6AQ
	8RJ4/8+pU0ux8fOyIJoDPGbyaMfqNNhuUfCBWb+L+6lEdCNzSvCxg1fBEoqSc2+V
	EbmQz+k9tHe0F2aoDYv3pCDhVCvsHHbhW/6qRUBFrMHrkZVXCYrRkaY7BYYwJhni
	o1DNwr+CwfydLAJE+CuHn63B/ToXKcgo18Id141iN/gmxjPmOMMEzF5gNaollCf6
	s+rXyR2Cnq0QDf7k1BVwbMqmN9WyJoH39FmoZTvdqbFOhWUbt8KRnCrHywPFKfuB
	XIvDNHkjbQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dxtp224xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 May 2026 11:13:57 -0700 (PDT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so1054232eec.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 11:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778004836; x=1778609636;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/8Evrp0/Cs5xE91fVKhf/YUdfmd3rQjcqs7sGTTtLk=;
        b=VJmzZqoYnc9CkBCU1AE9H+o7cJ6iIMGt0Yezlua2tFB5cDk6KKdyC+vly0VwZJWSYo
         mLKvhHJmIvehT+SuOt9YZKNzj/k+7fiWK8psxbkNq/YAcHTJ3oGTYyLL0ndWuE6UmTAI
         V09XqQCg/lGLSl1Pn9t3cVVzT+6TohzVMHH0I+i5ZzKcVvOEH7sXQY5038+L9hnnhLpp
         2oWxk7fL1CZFvKR+Q1wPaWE0ZiUKNqvIzW51NKYMn+WYyj6K4CI20TeKf9yjUjthtUyX
         MgQWISHDhiPF012SQEAZivmA+9kZb78rrZbbY27f5IGK/RAHnT+MHJoAHLK/eELlUbA6
         khLA==
X-Forwarded-Encrypted: i=1; AFNElJ9sXp6snEscz3VWq1Uv7Ji+0eEwry4FmLB7WWIGlR+7dLDm6nkdFMF8QdJtZTLetlhltpMomlQIX52pqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKmJnuDjaTTTJX0WgP7LEc5gVQPlMH4YStw7UjiWNV2OCG7RpB
	Q9kh9HsTHtqc5SdawmLjllOUkUvqnhnEpyTqiDbKxOp62M1eZlnF+apCro9A7QjYE/ZLnkHR2sf
	RFN+lFB1WnstjWc2IppoR9Ln10K5Vvg5+0qSWAndoZX0NgRDuf94v61zZ6oWqE2w=
X-Gm-Gg: AeBDieu7Vmc4IVmnsmMGYknzli2s9jTNYPlqSSQ4W7Ogx5v+oHuDTcKS+fDfWZj7Ljb
	srESXsBiSlFq10z/OGX49LdflwSwYcSysh5/FGKDleVaMndHtLXxcr548+r/E6zmL6S19smEWZw
	wT34vSJ0FzXHiX+nywW+BiSSKTS1xU8hxUuqlQnzF8qR5MKeaHGAby+tcQQhZ9jqtkUv34GjgIQ
	RWLtrdcpdaYGwJBivEsyYZfPlb4sycRVOXA3kbSkwiXVazc7U1ctyAiJlF/ha98TEIrfLwQ2Bl3
	drGCusGadVbGa/FWaYRa1H7RCRbzeQ/lQjGt+UaS0/zWgdBqzmpydYupbICyacGylV41XNQOFAT
	+IBdxJcP/TVcp/s0QHqXjKjNF5W9c0moOVXdn8Sgg
X-Received: by 2002:a05:693c:300b:b0:2f2:32bc:788a with SMTP id 5a478bee46e88-2f54b465ca5mr163911eec.25.1778004836049;
        Tue, 05 May 2026 11:13:56 -0700 (PDT)
X-Received: by 2002:a05:693c:300b:b0:2f2:32bc:788a with SMTP id 5a478bee46e88-2f54b465ca5mr163886eec.25.1778004835478;
        Tue, 05 May 2026 11:13:55 -0700 (PDT)
Received: from [10.0.40.29] ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bc6a79esm25025486eec.26.2026.05.05.11.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:13:54 -0700 (PDT)
Message-ID: <2d0eb275-64ef-4710-806b-36f6b32f7122@meta.com>
Date: Tue, 5 May 2026 19:13:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] vfio/pci: Add a helper to create a DMABUF for a
 BAR-map VMA
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
 <20260416131815.2729131-4-mattev@meta.com>
 <20260424182426.GG3444440@nvidia.com>
 <c598a21e-ee50-42d9-98dc-2959e84ace50@meta.com>
 <20260430171106.GA6829@nvidia.com>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260430171106.GA6829@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0FX_DUyg46eUAR1LL7uI5a6uRhIV9CRF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE3NyBTYWx0ZWRfX9NthfVj4Pu66
 faGuYIwvqfXCLRdaQrE6iLmv0atbrgx83dZiyq+Ms8Icl/T+tlIaXcJWS/X2h4rZ/9wMDb+yb9k
 FtjycOmTjceeSqBnaAVrFQm8Qif+s9y5YFpXctE8T/w6G4cDRtD8SlU933vnHdeyMRujmNzSom/
 RbfWmi+pQlv1Z9SaiRE1mAvufod34k8DreXrW0ceUzZkDZQhIEiofqTzE/YTansc3wAFvODMQnh
 1W1X5oPel6mBmc5+8T6HDTm3ETQhvPmOpqqDNxmck1aZvTvqPyoGJlJ0FTcXKLZ7blHFhIkD0qa
 QrC6w0nFtqWFGxM0Di3ic1dh7IlMGGfYo1eHtFMJc3kmjx+iPQqhVxGsRevcTLsSymdTpXKYPAv
 5Dgw5E33NamESsDydI6SCkETupZVu/PJENpI5UfkkuN9qxG5PRQLXCkDgxmFwKTD494Sg5M/KxQ
 D4MiGZf9cZhyP+Xdoyw==
X-Authority-Analysis: v=2.4 cv=SsmgLvO0 c=1 sm=1 tr=0 ts=69fa3365 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=2UbFsIa4v//lIgRL4kGwwA==:17
 a=Dv35txUGz5gI0hTa:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=znC_9Zf_qiuKpCydwTIA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 0FX_DUyg46eUAR1LL7uI5a6uRhIV9CRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Rspamd-Queue-Id: 024454D287F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60470-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Jason,

On 30/04/2026 18:11, Jason Gunthorpe wrote:
> 
> On Thu, Apr 30, 2026 at 05:47:49PM +0100, Matt Evans wrote:
>>> On Thu, Apr 16, 2026 at 06:17:46AM -0700, Matt Evans wrote:
>>>> +int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>>>> +				   struct vm_area_struct *vma,
>>>> +				   u64 phys_start, u64 req_len,
>>>> +				   unsigned int res_index)
>>>> +{
>>>> +	struct vfio_pci_dma_buf *priv;
>>>> +	const unsigned int nr_ranges = 1;
>>>> +	int ret;
>>>> +
>>>> +	priv = kzalloc_obj(*priv);
>>>> +	if (!priv)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	priv->phys_vec = kzalloc_obj(*priv->phys_vec);
>>>> +	if (!priv->phys_vec) {
>>>> +		ret = -ENOMEM;
>>>> +		goto err_free_priv;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * The mmap() request's vma->vm_offs might be non-zero, but
>>>> +	 * the DMABUF is created from _offset zero_ of the BAR.  The
>>>> +	 * portion between zero and the vm_offs is inaccessible
>>>> +	 * through this VMA, but this approach keeps the
>>>> +	 * /proc/<pid>/maps offset somewhat consistent with the
>>>> +	 * pre-DMABUF code.  Size includes the offset portion.
>>>
>>> I'm not sure I understand this comment?
>>>
>>> For the old path vm_pgoff for byte 0 of the bar starts at some large
>>> offset
>>>
>>> For the new path vm_pgoff for byte 0 of the first range starts at 0
>>
>> Glad you asked.  :)
>>
>> This is trying to achieve keeping /proc/<pid>/maps (or similar) somewhat
>> as informative as pre-DMABUF BAR mmap, in terms of keeping the VMA
>> vm_offs column useful.  Before this patch, say you mmap() two slices A
>> and B of the same BAR:
>>
>>   struct vfio_region_info bar_region;
>>
>>   vm_a = mmap(0, 0x1000, ..., device_fd, bar_region.offset + 0);
>>   vm_b = mmap(0, 0x1000, ..., device_fd, bar_region.offset + 0x4000);
>>
>> ...you'd see something like this in /proc/blah/maps:
>>
>> fffff4000000-fffff4001000 rw-s 10000000000 00:07 148     /dev/vfio/devices/vfio0
>> fffff5000000-fffff5001000 rw-s 10000004000 00:07 148     /dev/vfio/devices/vfio0
> 
> 
>> then the VMA's vm_offs would need to be thunked back down to 0 (since
>> the fault handler then treats vm_b + 0 as the first byte of the DMABUF).
>> That works/adds up, but then the vm_offs of both VMAs A & B both have
>> offset 0, and it's harder to differentiate in /proc/blah/maps.
> 
> Yes, and that would be correct.
> 
> The VMA output of lspci should show the exact pgoff passed to mmap and
> nothing else. Do not mangle it for "debugging".
> 
> pgoff is not to be used to show random internal FD details..
> 
>> We could possibly stash the original offset somewhere and then render it
>> in the name string, but the name's already about the max size and using
>> the existing vm_offs column is nicer IMO, doesn't need a new field, etc.
> 
>> I need to work on this comment then!  What this is trying to say is that
>> the DMABUF is made artificially larger than the part that is visible
>> through the VMA.
> 
> Yuk, that's another reason not to do this.

OK, fair enough.  I'll rework this and remove this one weird trick, 
thanks for the input.

Matt


