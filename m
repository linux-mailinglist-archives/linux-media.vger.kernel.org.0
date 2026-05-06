Return-Path: <linux-media+bounces-60617-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULfMCG9I+2lZYwMAu9opvQ
	(envelope-from <linux-media+bounces-60617-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:55:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7092B4DB676
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FDCA303FDD8
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FB0466B5B;
	Wed,  6 May 2026 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="gW3xmhO/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358233F23DF
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778075619; cv=none; b=JtpUMkVwDYvsXg1rfGryI7N02YhRyMUKlLH5CmlGzXQ76vjdMmpT+e3zjT3LLVtR1GyaYO1gFWKKn2DOzXoUdwrWwAcadOFP3zld1YkWVta4mWeen5njosGC9AtXKhBT8mAILJuLINDMi/6zgO2zXxQCYUwZCt9OqzkBwBtnQsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778075619; c=relaxed/simple;
	bh=Yf3p9DePpxrz1wRV7pVbqVJsbvljiS6iIc3Z+7d2LCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TepqcLRu1RDKPOyjIS3gXT5SdUGh5n97OTiVPbHumXb28V9izci+h0OiWca4QechhQU0LcyN55/a37WucF0kZBECztxMBK0b14doJI5EolKD3Awn0qaqahb9fjAhbhjWpxcjLIigPSSY3KhFjsofBTf4wcSHfN+uXzq+y2xSWhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=gW3xmhO/; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466TGmc1886585
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 06:53:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=Wr10VTJN3duBxSrKADAl6R/6nUDyzwk22GvJwJKGKOw=; b=gW3xmhO/sRQz
	XJqsiB30MPqABfSYdPyLP0Gn/OezmfyWpq/Qzqjhz2ze7SQRMEXSQHa99g+b7Iir
	gFzVLc2FOh5mAKnK8IvSBVns4QA0YXbcRl87u0f1pieyGY90bP6vERpbS+L7g+P9
	DHCWf4PcInhjkxO+Gm7vkvPJ6GVW5B0TpH8Jp8xFidA4r6Hlogd/JJy3L8saGMRk
	15ap4MCtUXuicSVe2/hcNksNiN8B1EbtQCmsjgszWsFwGMWCoArp5Upp87gHiWGn
	78NOQtEVTH4koE76G93+00BqHzW9i4PIfjFdjf47b5lVOIeDazmu1SVOr2EArvRI
	msxzNEBCAw==
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4e00d926gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 06:53:36 -0700 (PDT)
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-67c414217ccso4390471a12.3
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 06:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778075615; x=1778680415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wr10VTJN3duBxSrKADAl6R/6nUDyzwk22GvJwJKGKOw=;
        b=lPsCdx9tiFxmSo17/LCoZqQ1cl4LXRMK6QbPsl2SvBc9AXXWqfeAqfQo/Zqs7iLyZD
         hmVtXgLg+UE3eNrzx7rK3N82cInJGHWcQJ9SS/uw/CXDpaNzgMBLeV5OmYo1CJ/QmpC8
         6Tjely9gWJm9L2EHjkwCPaey1PCffuKjianH1cmBP4MjKk7mCk/tMvLRFhbhe9DdiGl+
         BlLmrxaTSKi4rHEPq1PX0g5V7JU6bRjALKq+o9TUYM77WNtdYQYBUu5306tYUHPf6oQ9
         8XSLPxN9fvUh4voMie4y/IqVM5SaM4z6Kjhcu3CEmLv36MRUiCdZT9mwupmYNn9Pnntz
         0gCA==
X-Forwarded-Encrypted: i=1; AFNElJ/vuv4UwqH3QZhxAvkeE0ZwVlOosHC89LV70sjADOKcA6bEjpDpxx7/DDTrfrZfoh+RhhAFUeLDL0ckZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyas+Ph8k2M1H0buWhP3wkYAKYS6LJisdO15WpeYGmy3tlgW9ei
	uj8KAfHKwLtPDMrSzsSVdhXgy9o8mf55PVTSOPf1V52DhfzOGIlZRg71slALBQFKeUhTetnvRWC
	abW01hOTLhYBJSRVm7q2F047h0t90I0rB4bMXGj5upOusCSNBeQbEXzbEwte5V74=
X-Gm-Gg: AeBDiesmcBjzGYBRHHMrGTWgNCHNywmZHWXsfkmssjx5rT3jZteIclbXLLmu726TW6B
	V+UTecprKdN+b2y2Q1mTl6Nbh0BSyEVWOUwWA2Uss5kdJIcsb4dq0VNePM5qQl6UbLcwvetiwI9
	IC+m5Vh98MRRa2QY5qqzV95VHrDEEWAq9vE9yF778XoO+Boj1bhfUzzg/VRMfptCFQLlpOahoM2
	hRibXgyJCbWvnzr6a7zA2BH/tbHrEac8NRukxFFzrUwXOKWWk6/0fHUufHi5j7PsS9r8nd9e36v
	s+5r1Rc3YFoGa6IR1S4cD1W4LtzdmgHuGxvqoGXy94nWPsRtp2yVlSo2EROxB1HHvmEP+YGs47S
	caA88xBe61XLvLN+1VwHpvPwBtIoH+Dz+4jUx8YIG3Grtd+T+bx8M4oDzmPsU4KoRe7S/x/Bz+s
	EWY5dYl/oASBoSPoM83c1Gxwpw9ZtDJEu0MY7C9kNpP2vsJdmzTG7Z0+zr+5oobdaxB6PxJpsjP
	ZGpjChsc16Tgg18PSqSrf+dDB0mrpEajA==
X-Received: by 2002:a05:6402:3788:b0:674:b1b1:d039 with SMTP id 4fb4d7f45d1cf-67d63db380emr1617976a12.11.1778075614642;
        Wed, 06 May 2026 06:53:34 -0700 (PDT)
X-Received: by 2002:a05:6402:3788:b0:674:b1b1:d039 with SMTP id 4fb4d7f45d1cf-67d63db380emr1617931a12.11.1778075614040;
        Wed, 06 May 2026 06:53:34 -0700 (PDT)
Received: from ?IPV6:2001:8b0:8b6:13d4:102e:f2af:e074:5cde? (e.d.c.5.4.7.0.e.f.a.2.f.e.2.0.1.4.d.3.1.6.b.8.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:8b6:13d4:102e:f2af:e074:5cde])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd904fe68sm1337174a12.0.2026.05.06.06.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 06:53:33 -0700 (PDT)
Message-ID: <9304aada-ee84-4cf2-a1d7-82313eda07aa@meta.com>
Date: Wed, 6 May 2026 14:53:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] vfio/pci: Fix vfio_pci_dma_buf_cleanup() double-put
Content-Language: en-GB
To: Alex Williamson <alex@shazbot.org>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
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
        kvm@vger.kernel.org, =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-2-mattev@meta.com>
 <20260501131236.278ac431@shazbot.org>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260501131236.278ac431@shazbot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CojD3O60akilGuM0skBsS4B7ZaMmBQSL
X-Proofpoint-GUID: CojD3O60akilGuM0skBsS4B7ZaMmBQSL
X-Authority-Analysis: v=2.4 cv=G+4s1dk5 c=1 sm=1 tr=0 ts=69fb47e0 cx=c_pps
 a=Tczdrg5if7+wQeIJmxD/XA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=4h92JMTCafKA-fb_NiOh:22 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=Ikd4Dj_1AAAA:8
 a=VabnemYjAAAA:8 a=CQcdbiei6IkXp1Z0tZsA:9 a=QEXdDO2ut3YA:10
 a=1oAhN8tkTtOBK6_UvoHx:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEzNiBTYWx0ZWRfX7iGSrwF095Gs
 eiz/bbPjNqC+S8pg8AOhAsM6+bjIAzv4qtKNPSFlzJvSJ+v4J1tyuWKxqzO1mKx/LdIILMGPcLO
 r8ZmSSKo2GbL5aanhiuWesmbxzi6PbCC1NhI3450HwFRdpzLL38+KguSyozDH7EBF+iB7XiclM3
 v/oR0DultnOnR6o8cg6ER8ImCugAQFoJg/i0GWLEP2kE7MkfWGv/DHglwRvYggUq0x6CRLGx0qT
 r31lT97mxejYMJYbSjlDsdZqm/vc45cS0b1bMImiAsf++ERYcSYRydOfRqDzyfpzFqmyGa6Uz0b
 e293J2dyUGjEaLFurC5XN550TugZDAmzFS1NTHQHxACcs8td9HnJVDOWtNjUGNcNM06ZmkLVmjt
 FLQTYYp0SwcqTJIG8oayjK2fa+zl18FCjfn9VmzVeMGXgNk8Ga3yjHCkRaYpbb9IPWUUGKjEY7F
 QGRYnqFee3Q65ONQYSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Rspamd-Queue-Id: 7092B4DB676
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-60617-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,meta.com:dkim,meta.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Alex,

On 01/05/2026 20:12, Alex Williamson wrote:
> 
> On Thu, 16 Apr 2026 06:17:44 -0700
> Matt Evans <mattev@meta.com> wrote:
> 
>> vfio_pci_dma_buf_cleanup() assumed all VFIO device DMABUFs need to be
>> revoked.  However, if vfio_pci_dma_buf_move() revokes DMABUFs before
>> the fd/device closes, then vfio_pci_dma_buf_cleanup() would do a
>> second/underflowing kref_put() then wait_for_completion() on a
>> completion that never fires.  Fixed by predicating on revocation
>> status.
>>
>> This could happen if PCI_COMMAND_MEMORY is cleared before closing the
>> device fd (but the scenario is more likely to hit when future commits
>> add more methods to revoke DMABUFs).
>>
>> Fixes: 1a8a5227f2299 ("vfio: Wait for dma-buf invalidation to complete")
>> Signed-off-by: Matt Evans <mattev@meta.com>
>> ---
>>
>> (Just a fix, but later "vfio/pci: Convert BAR mmap() to use a DMABUF"
>> and "vfio/pci: Permanently revoke a DMABUF on request" depend on this
>> context, so including in this series.)
> 
> We really need a fix for this split out from this series, It's already
> been shown[1] that this is trivially reachable.  Carlos proposed[2] a
> similar solution to the one below.  I was concurrently working on the
> issued and suggested an alternative[3].  Let's pick a solution for
> 7.1-rc.  Thanks,

It looks like [3] is progressing, so I'll drop this one when I can 
rebase onto it.

I noticed [3] removes the dma_resv_lock(priv->dmabuf->resv) around the 
priv->vdev = NULL, and this series' vfio_pci_mmap_huge_fault() relies on 
vdev only changing whilst resv is held to resolve a race between a fault 
and cleanup (see patch 7 of this series).  The handler takes resv so 
that it can stably test vdev in order to take memory_lock.

Must your fix change vdev outside of holding resv?  I'm still sketching 
alternatives; at first glance perhaps the fault handler could rely on 
vdev being valid if !revoked, which can be tested holding [only] resv.


Thanks,

Matt

> 
> Alex
> 
> [1]https://lore.kernel.org/all/GVXPR02MB12019AA6014F27EF5D773E89BFB372@GVXPR02MB12019.eurprd02.prod.outlook.com/
> [2]https://lore.kernel.org/all/20260429182736.409323-2-clopez@suse.de/
> [3]https://lore.kernel.org/all/20260429142242.70f746b4@nvidia.com/
> 
>   
>> drivers/vfio/pci/vfio_pci_dmabuf.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> index 281ba7d69567..04478b7415a0 100644
>> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
>> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> @@ -395,20 +395,25 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>>   
>>   	down_write(&vdev->memory_lock);
>>   	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>> +		bool was_revoked;
>> +
>>   		if (!get_file_active(&priv->dmabuf->file))
>>   			continue;
>>   
>>   		dma_resv_lock(priv->dmabuf->resv, NULL);
>>   		list_del_init(&priv->dmabufs_elm);
>>   		priv->vdev = NULL;
>> +		was_revoked = priv->revoked;
>>   		priv->revoked = true;
>>   		dma_buf_invalidate_mappings(priv->dmabuf);
>>   		dma_resv_wait_timeout(priv->dmabuf->resv,
>>   				      DMA_RESV_USAGE_BOOKKEEP, false,
>>   				      MAX_SCHEDULE_TIMEOUT);
>>   		dma_resv_unlock(priv->dmabuf->resv);
>> -		kref_put(&priv->kref, vfio_pci_dma_buf_done);
>> -		wait_for_completion(&priv->comp);
>> +		if (!was_revoked) {
>> +			kref_put(&priv->kref, vfio_pci_dma_buf_done);
>> +			wait_for_completion(&priv->comp);
>> +		}
>>   		vfio_device_put_registration(&vdev->vdev);
>>   		fput(priv->dmabuf->file);
>>   	}
> 


