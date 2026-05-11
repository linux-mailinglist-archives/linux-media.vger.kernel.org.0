Return-Path: <linux-media+bounces-61138-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AFhBxT3AWoFmwEAu9opvQ
	(envelope-from <linux-media+bounces-61138-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:34:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6664511427
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94363304630A
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E240402B86;
	Mon, 11 May 2026 15:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="l5CJ9j8P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D659540245E
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 15:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778513449; cv=none; b=h8nJD8sdzjRwBVsvWSYwXP9wrU5E2u4zeJU7Cr+M8AU29awVKiKkXKaZmNnzpNpiX4c0c2C0L/E8rQ78U/JbXU3jvDZGYNJPL2aHhTgDrkthx6aT3v5hAt0BKmt6wHBi5pCZQijLAaaY/tCoe+M+Fo1R3vnRSQWJq2IWOk5wzfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778513449; c=relaxed/simple;
	bh=F7atxy0xKM8DpXLajI6bmHIyh5YuV4M5ES3nif002jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZE5wYCbTMM2m2ZkHtekGpYVyMysnKepZrSlLIhX2hZXqmfFuVQ8cD20S9kUeSg05AsECL5SQuXy1sYX7FhRzv9RjX+jmY3guI+HmPZ7fsHQSwgv7/v3jOzTYdWWV/GSK+9vMDRIeSune65RbligYOLMMHzmCRjoBYGv51VW3aG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=l5CJ9j8P; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 64BEw5No509614
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:30:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=bO0OT5HbP3xMB9H1AybFAyJkqZoplUb3t4HsCcdmo+w=; b=l5CJ9j8Pt4jd
	oo2WjP8zAaxDoOQtii5Xv4O/D6fdD0hd4ART8sIyryLJf8dOqBTz/yQ+uerxGOHZ
	KqdDkk5BUPra4La+lrsGoib67wFEHFUXUYKoT5+8hWBy9OIx+D9V8sE2QmHW+yMT
	h35Kt8l9MYRDqqlmJv0WkUYcqwdMG9jVc7x0RKu6oILOR1twr/YLgUwLpnf350vz
	+GJ1mWfeupTHI+JMhKWxRZCtBSmD+//ybC+8KUEpo8p5QU7ZNmMMdXXRB4OqZre1
	WwVJheJnIclwhharvAmggbk7AX/pj+QZFuYaS5iSYZGy3zEuDg1zR03BUoikGeZS
	XDLlFw4U2A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by m0001303.ppops.net (PPS) with ESMTPS id 4e2mxuy129-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:30:46 -0700 (PDT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ef37c3f773so5337496eec.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778513445; x=1779118245;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bO0OT5HbP3xMB9H1AybFAyJkqZoplUb3t4HsCcdmo+w=;
        b=l8w70bxEmo3Rkdcf5rCuN9J5SR5uXeyNVSrelVNB8mn0EO1k1SCpuq5qgobCC10dLi
         +Ri3f126sBkqaRAP171d4ncf/l5u8QtZjQPh06Gyjiltb5mkULBHsXygqSy5YPi9770G
         OPBcaKAXRleuz/dAg0m+sezvy6PrpafToYmOzuOlLZYcHwPHHWPjpDA0TMJXrmbIE9Vf
         Me5LZtokZwtKNxGBSw56BjYsGxS8ejlKQmg9hvKPKX5CTW2uhbxSCiRgY5Ns2qBfcz46
         39iiNg4EXOgF6yf5RQjpVYjjpsesUUKmCAlPE65urrkRZP1LlMePhyefiEsA9LvOeWfy
         1BPA==
X-Forwarded-Encrypted: i=1; AFNElJ8T8MtxouDVWhqMzCzNXdkFzE/51Jbl7BAHilQokAYL1eplqa8uX8bhhDqWE786lUJMvSwL+3R4Tj5gBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwq9sR01Y5DqfohXZ0YGshsrn6XCIjhYTJu6k56TBAEpqCBwBT
	ozIoZDq0HUtNyHcKB3VMIreJdGlZwHq9xS1aKAQJEvOPoCkqHDX0VpFbXcJFWcZAfa0hVlO6yms
	xb1Sje9GgGcUDuSSDGyLDmhB90Tvm3pkjUWdSUlygapB2OlceNTO7nYKrOm6gP3Y=
X-Gm-Gg: Acq92OGV5XC1dkDmRing6+jirEIxmDhj/WULGydyaOLylRobv7EuhdIvoWH3WhaJlyd
	2BB7QcDAzaXLdhHznCEYa+4xFDkbJ9VySqN44E4t9Etgj91x64jt/P0O7Rj6LFP6R2yLIiN74cK
	TscqbPD1OfBdRmLWyDMvH0/jgCZzKcy5/mf6Jj5b9lydXtt2aLm0Q3ngOyMX6LVbQ32s3gSpNnR
	DSjz2o9A0MDTQJIepLt5CIpAf2jXFdTTGcAhgaj8vEnmsFRFrVqyMtUeAY7TY81SdZYMA37JrM8
	2W9IlrVP3LfGqcDABWH1IwzjD70rmRCeO9Jgb7Wd1kMDwizhupG00rJZzsyKVtiPvVsrufQCKsw
	9mtNc5bQ7jf6iZoM7Ec/AOmLy
X-Received: by 2002:a05:7022:2399:b0:12d:d27f:d817 with SMTP id a92af1059eb24-1318550ae20mr12188181c88.19.1778513445352;
        Mon, 11 May 2026 08:30:45 -0700 (PDT)
X-Received: by 2002:a05:7022:2399:b0:12d:d27f:d817 with SMTP id a92af1059eb24-1318550ae20mr12188121c88.19.1778513444549;
        Mon, 11 May 2026 08:30:44 -0700 (PDT)
Received: from [10.0.40.30] ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327810ff4dsm14644541c88.3.2026.05.11.08.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 08:30:44 -0700 (PDT)
Message-ID: <25a4fc45-1b4d-426b-954a-60bf21e9040f@meta.com>
Date: Mon, 11 May 2026 16:30:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] vfio/pci: Add mmap() attributes to DMABUF feature
Content-Language: en-GB
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
        Pranjal Shrivastava <praan@google.com>,
        Alistair Popple <apopple@nvidia.com>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kvm@vger.kernel.org
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-10-mattev@meta.com>
 <20260424183153.GJ3444440@nvidia.com> <20260426105215.GA440345@unreal>
 <20260427083644.4ee174cd@shazbot.org>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260427083644.4ee174cd@shazbot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VI09byEi1PAbRjwxH8gC4myJTO-vyLyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE2OCBTYWx0ZWRfX15XJYT6HbBnc
 crJ/cZlLMz6Nv/VW3QidxUgCc84ikV33JHhq6VNYLifXMY8IpmPKL9ToFvYWIC0IAbVHQiaakJq
 3BEzcnJ/6ka1qXQAffl3AxWvO3sDZZRa8yDWQ/oanyalvAQHurMezubQW2p3V8ab6g1KyM1u2W7
 9vAKxLOHsP3m2s6GAvYSNWvjsEP7qJmYkasghQTuQwpVAn3qIdgnPMO0yOli1UD3+jGndxsYaYy
 tij9wteXxSqEAQCWhEanCoX50KbxI/TTW6Kuvq8jgxKuPml88fYUbwMZZrBMGgoYL49uO0HOhKj
 UsORLNjAAxmml8o69oR1FNoPPxmslc45/q2OcecJ9vxekURG3BVh6fPLnEMeFM+tVZX8NEET7JV
 5N1p9DyQWh9zeCUAf6yjb2cbMFY72Qz6TUPD7NUaqrY+ykAg1UTctS+n/pvw9BGtG0W2Kz0x9Mb
 8rKLf+Czm+losYimq0A==
X-Proofpoint-GUID: VI09byEi1PAbRjwxH8gC4myJTO-vyLyh
X-Authority-Analysis: v=2.4 cv=d7vFDxjE c=1 sm=1 tr=0 ts=6a01f626 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=2UbFsIa4v//lIgRL4kGwwA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22 a=VwQbUJbxAAAA:8
 a=r1p2_3pzAAAA:8 a=VabnemYjAAAA:8 a=Ikd4Dj_1AAAA:8 a=02ciemoj1X7HeLU9vPcA:9
 a=QEXdDO2ut3YA:10 a=r_pkcD-q9-ctt7trBg_g:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Rspamd-Queue-Id: B6664511427
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-61138-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Alex, Leon,

On 27/04/2026 15:36, Alex Williamson wrote:
> 
> On Sun, 26 Apr 2026 13:52:15 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
> 
>> On Fri, Apr 24, 2026 at 03:31:53PM -0300, Jason Gunthorpe wrote:
>>> On Thu, Apr 16, 2026 at 06:17:52AM -0700, Matt Evans wrote:
>>>> A new field is reserved in vfio_device_feature_dma_buf.flags to
>>>> request CPU-facing memory type attributes for mmap()s of the buffer.
>>>> Add a flag VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_WC, which results in WC
>>>> PTEs for the DMABUF's BAR region.
>>>>
>>>> Signed-off-by: Matt Evans <mattev@meta.com>
>>>> ---
>>>>   drivers/vfio/pci/vfio_pci_dmabuf.c | 15 +++++++++++++--
>>>>   drivers/vfio/pci/vfio_pci_priv.h   |  1 +
>>>>   include/uapi/linux/vfio.h          | 12 +++++++++---
>>>>   3 files changed, 23 insertions(+), 5 deletions(-)
>>>
>>> Nice and simple
>>>
>>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>>>    
>>>> @@ -1549,8 +1551,12 @@ struct vfio_region_dma_range {
>>>>   struct vfio_device_feature_dma_buf {
>>>>   	__u32	region_index;
>>>>   	__u32	open_flags;
>>>> -	__u32   flags;
>>>> -	__u32   nr_ranges;
>>>> +	__u32	flags;
>>>> +	/* Flags sub-field reserved for attribute enum */
>>>> +#define VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_MASK		(0xfU << 28)
>>>> +#define VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_UC		(0 << 28)
>>>> +#define VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_WC		(1 << 28)
>>>> +	__u32	nr_ranges;
>>
>> Alex,
>>
>> The TPH proposal extends the flags field in a similar way, but I suggested
>> a different approach to conserve bits. At the moment, we spend three bits
>> on a single feature, which feels wasteful.
>>
>> What do you think?
>> https://lore.kernel.org/all/20260409120415.GF86584@unreal/
> 
> I already proposed a very different interface for TPH that decouples
> the dma-buf creation from setting the TPH values:
> 
> https://lore.kernel.org/all/20260423132016.4a25e074@shazbot.org/
> 
> This is overall less intrusive than the TPH change proposed, but it
> could still make sense to align this as an operation on the dma-buf,
> that can be probed as a separate feature.  Thanks,

I'll add a VFIO_DEVICE_FEATURE_DMA_BUF_ATTRS in a v2 instead to get in 
line with the TPH work, no worries.

For the benefit of future hackers, how would you describe the criteria 
for adding flags to this existing field?  What hypothetical feature 
characteristics would be appropriate?  (Maybe it's that these attrs & 
TPH add scalar fields in several bits rather than a simple boolean.) 
Two of us have independently added something that's turned out to be 
inapproriate so some guidance would be good.

Thanks!


Matt

