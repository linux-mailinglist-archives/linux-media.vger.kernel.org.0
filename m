Return-Path: <linux-media+bounces-60650-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEgdCQdm+2kbawMAu9opvQ
	(envelope-from <linux-media+bounces-60650-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:02:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEDE4DDC5D
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F4BA30B1945
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 15:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6183EE1E9;
	Wed,  6 May 2026 15:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="V5KJ2Qsv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A6C481A9F
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082936; cv=none; b=RM+Pz/p2FfxBnKnv+pgsXBPU7vJzgF4OwygJ4bfmbN+3KYgnJXzO2Bt5CTtqzh5BtdN46AatjHMGUvXpaAxRRMtTMSPtKRZRgpJ5jjTENzm7Wv50eTmoaruGO3duXg+W8I8mqA5RfPQf4dvA0/PQptu7HvfB4bfi0A8mwcKETZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082936; c=relaxed/simple;
	bh=yAE/Ym57GFy/KISCQT6Y8a/+2nm5BztVchD6EC2QOxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u6sW5Cash9UTooLxGlgqkKG+7/yyz2fnTQyUYXnsUr5rRAKtJktiCglF6lI5CzBGrjysnQTBqXAOctJheEjXZM8umdhfdZryxP3BY36ln/2f7VwwN6dxBm+neI20/kklTFCDsY+tNIc2b+CWcDAr8iNyPL6qoaXl0yk3MdRL7KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=V5KJ2Qsv; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646BaxX42104282
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 08:55:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=Utn027AUC8UDDUJXMpqeQ33wB0VHRXSGiBE+zdS1lww=; b=V5KJ2QsvDqXI
	jsaAHALFGR6sjzWQOy2R8fDT1m2z8Vp+BEzdkIo2E0PzKZT3MoRqQ2oxFN/cf+RI
	zNdxXgZ/yC9TXtV3oASmSQ58occoBlUXUmIfLY3rEyKedGP+G26q9XfNbpy/cyyL
	ATxSfUlKU+0cbiv5isn7bvGMH98bzLSc6Cor0iZ7DZsrSsJL5Y4HlAHYbDQh47an
	JgHWaoOdPrg/9kinsjy7I1FZDdWBQ1dYEjz8FgwQ2xDR3PrtkNygxgXG3PaHOc5k
	UAwldnK7l+6FDmkB2j0Yjq5S7uSzqNd6Utnc2cINNmewbNDHUuno2cDWgkWZsFdm
	9itz8d4OIQ==
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dwf37935m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 08:55:31 -0700 (PDT)
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d7a5b9678so5524740f8f.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 08:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082930; x=1778687730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Utn027AUC8UDDUJXMpqeQ33wB0VHRXSGiBE+zdS1lww=;
        b=adq/jp9gCJNWX+SwBJD74NmkZcT2/YJbYDp0eYFhaIQjNG1pouXfj2jAnoccfYz3od
         Cyi1LwzSSzLk/jw1rdeCY76VccdWUFZwhF/Psrjrukv1ytKmhk+w36ds5uxVz1/XLEfw
         OSXHkH7Td5Bh65ZqP9H+ofYW3KSFp+mkowcL+rSwXr3ORZmn0692nQpp+5S1HA9ZAqxs
         P6CaS31mNfJrH6JOYki4h3fr4FxrfpfUvCHPeh98KCXFu6AVfZPR5DFEchI05GoQc5mN
         +rzrFufG9JiRZN1vZRZnpZOdNazL2AzLl4RbjG1tU0zM+Mb8zjEIdEmSiKHYdmLJEoaa
         8hhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+32LiX/+OhhCmrv0/cCpAk0SnWHJiswmgeDbIjZpKYDaiwDSE385rPMm9KiNkl34hfCmuqZDI7GDEkXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTPg5xoAyDmkQLX155GpBl827YNMSiXT+aaVcxd0mmH+xbwrNa
	nLzem7cfx+wdQYZ10oVkP/b8a3YZlVugcW9cTwOKdFurTaTV+JcSN/8KBK4H4e3sPywvdC0fgr1
	i5BQiBYnnyUnY+445axMA6nxgpPn7dLbdOfoQOKQEfMP++6YKQeOhp1cPPOwZW5U=
X-Gm-Gg: AeBDieuXkjctz2vDI6PVr+1ETrfATVe7RDItvAS5a6sagKTruTa1I11Jj9PoSOHhkR6
	ba+lQTK3CdRsyHzW4BucoJheccpzAvH/b/R5IJ2/l6+KYTSSgDRhTeofmnB7ZWFRq8mK1yFxQ8M
	fflxTux96SodgIZ+e9IQ1iVl2PSm1GVLPwnRWYkqgA3VEFFGOXg2pkIRTPiNT2YKMe5B+7nzZin
	NdgD+p+btuNmnKZ+2Akugwtpxl1XF7E61qA99qeISmkvpLyYBzITRQyMbt8b8WW+rs5Nszq35Bz
	LregkldHtp+ANtaaNO+ZF7wTYHjnE9vuy0SMT/VEsj+To/yChJcEOTDgYNuRoIH26WgCA0DaPOb
	RB8YT999ZvmOmE7Et56PjnyiX4ly0GQInqdnQq2LO48TkrT5iLljIOWWxWb47waeAFn7f43lC62
	GzID6fd59SE/4ZQAcjGl6eUGS6PSub3+7mLqeUHaGGjB30+0PJZfQ5N6NJOCZG79LRWMp2YD7EO
	kbvBN4K6NB9X+TrDhu8Dj28Koi/JbjCgQ==
X-Received: by 2002:a05:6000:2082:b0:441:1c18:f779 with SMTP id ffacd0b85a97d-4515da967c3mr6651388f8f.37.1778082929984;
        Wed, 06 May 2026 08:55:29 -0700 (PDT)
X-Received: by 2002:a05:6000:2082:b0:441:1c18:f779 with SMTP id ffacd0b85a97d-4515da967c3mr6651329f8f.37.1778082929442;
        Wed, 06 May 2026 08:55:29 -0700 (PDT)
Received: from ?IPV6:2001:8b0:8b6:13d4:102e:f2af:e074:5cde? (e.d.c.5.4.7.0.e.f.a.2.f.e.2.0.1.4.d.3.1.6.b.8.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:8b6:13d4:102e:f2af:e074:5cde])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052483166sm13251331f8f.7.2026.05.06.08.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:55:28 -0700 (PDT)
Message-ID: <c0bd0e23-712c-483e-a809-47126ab6e9e9@meta.com>
Date: Wed, 6 May 2026 16:55:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] vfio/pci: Fix vfio_pci_dma_buf_cleanup() double-put
Content-Language: en-GB
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>,
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
 <9304aada-ee84-4cf2-a1d7-82313eda07aa@meta.com>
 <20260506152937.GJ11063@unreal>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260506152937.GJ11063@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1NiBTYWx0ZWRfX21C20H/X5wuz
 27Zc4LrBygzBAlynLZMTZOc2YWSH9UXu6PSXZb8D7Qs5oul/6YWX448hYaWUYMvQoXY7nJ2erxU
 jCmuN8BTadFK06MNhXftNHfSM9oG9PrABYdQOciEwPW2XjaC+T/3upvpysDcB79UkzlKvpUBkj9
 /OYOg9QGmhGTRxEv7fs3qEC9NkOcsLvqJXZ48sQ59X6KO0axl4scjpIiTim/H6ihzCTsQYphsJS
 j6MgU4UtJtFF4llOXQev7wery80ekF+MeWmyD9OfhyBQGKPPYhWkNfWtK/WrbJLkVeenJNzqw/T
 5Zc05plq5+qSzvJSu1E/5OfxJIOaAPmtFbvRoNmYM0Ka2q8pjT8yOGOxch7DJAsW50FXNCC+UBw
 nmRkspXEF6lGk1wN3Mm38mno1Gw1WLfCF5L5NR+k6gwn8L7S+20rg7uqc0sAJITh44IAVbkb/pV
 ZaNsQOdtjzTnZDp81bw==
X-Proofpoint-GUID: hLa4K_e3jnfrrGmcBMLG58L0StresFgT
X-Authority-Analysis: v=2.4 cv=GKs41ONK c=1 sm=1 tr=0 ts=69fb6473 cx=c_pps
 a=I6ewnrIBtnKHmb6SxpX7Vg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=Ikd4Dj_1AAAA:8
 a=VabnemYjAAAA:8 a=bm6tUXqWTanbjDFH1akA:9 a=QEXdDO2ut3YA:10
 a=MqNruPmfsT8GavliLQMe:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: hLa4K_e3jnfrrGmcBMLG58L0StresFgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Rspamd-Queue-Id: 5CEDE4DDC5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-60650-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,meta.com:dkim,meta.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Leon,

On 06/05/2026 16:29, Leon Romanovsky wrote:
> 
> On Wed, May 06, 2026 at 02:53:31PM +0100, Matt Evans wrote:
>> Hi Alex,
>>
>> On 01/05/2026 20:12, Alex Williamson wrote:
>>>
>>> On Thu, 16 Apr 2026 06:17:44 -0700
>>> Matt Evans <mattev@meta.com> wrote:
>>>
>>>> vfio_pci_dma_buf_cleanup() assumed all VFIO device DMABUFs need to be
>>>> revoked.  However, if vfio_pci_dma_buf_move() revokes DMABUFs before
>>>> the fd/device closes, then vfio_pci_dma_buf_cleanup() would do a
>>>> second/underflowing kref_put() then wait_for_completion() on a
>>>> completion that never fires.  Fixed by predicating on revocation
>>>> status.
>>>>
>>>> This could happen if PCI_COMMAND_MEMORY is cleared before closing the
>>>> device fd (but the scenario is more likely to hit when future commits
>>>> add more methods to revoke DMABUFs).
>>>>
>>>> Fixes: 1a8a5227f2299 ("vfio: Wait for dma-buf invalidation to complete")
>>>> Signed-off-by: Matt Evans <mattev@meta.com>
>>>> ---
>>>>
>>>> (Just a fix, but later "vfio/pci: Convert BAR mmap() to use a DMABUF"
>>>> and "vfio/pci: Permanently revoke a DMABUF on request" depend on this
>>>> context, so including in this series.)
>>>
>>> We really need a fix for this split out from this series, It's already
>>> been shown[1] that this is trivially reachable.  Carlos proposed[2] a
>>> similar solution to the one below.  I was concurrently working on the
>>> issued and suggested an alternative[3].  Let's pick a solution for
>>> 7.1-rc.  Thanks,
>>
>> It looks like [3] is progressing, so I'll drop this one when I can rebase
>> onto it.
>>
>> I noticed [3] removes the dma_resv_lock(priv->dmabuf->resv) around the
>> priv->vdev = NULL, and this series' vfio_pci_mmap_huge_fault() relies on
>> vdev only changing whilst resv is held to resolve a race between a fault and
>> cleanup (see patch 7 of this series).  The handler takes resv so that it can
>> stably test vdev in order to take memory_lock.
> 
> I think that you should rely on priv->revoked and not on priv->vdev.

Needs both unfortunately, as the fault handler ultimately needs to take
vdev->memory_lock.


Matt

> 
> Thanks
> 
>>
>> Must your fix change vdev outside of holding resv?  I'm still sketching
>> alternatives; at first glance perhaps the fault handler could rely on vdev
>> being valid if !revoked, which can be tested holding [only] resv.
>>
>>
>> Thanks,
>>
>> Matt
>>
>>>
>>> Alex
>>>
>>> [1]https://lore.kernel.org/all/GVXPR02MB12019AA6014F27EF5D773E89BFB372@GVXPR02MB12019.eurprd02.prod.outlook.com/
>>> [2]https://lore.kernel.org/all/20260429182736.409323-2-clopez@suse.de/
>>> [3]https://lore.kernel.org/all/20260429142242.70f746b4@nvidia.com/
>>>
>>>> drivers/vfio/pci/vfio_pci_dmabuf.c | 9 +++++++--
>>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
>>>> index 281ba7d69567..04478b7415a0 100644
>>>> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
>>>> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>>>> @@ -395,20 +395,25 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>>>>    	down_write(&vdev->memory_lock);
>>>>    	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>>>> +		bool was_revoked;
>>>> +
>>>>    		if (!get_file_active(&priv->dmabuf->file))
>>>>    			continue;
>>>>    		dma_resv_lock(priv->dmabuf->resv, NULL);
>>>>    		list_del_init(&priv->dmabufs_elm);
>>>>    		priv->vdev = NULL;
>>>> +		was_revoked = priv->revoked;
>>>>    		priv->revoked = true;
>>>>    		dma_buf_invalidate_mappings(priv->dmabuf);
>>>>    		dma_resv_wait_timeout(priv->dmabuf->resv,
>>>>    				      DMA_RESV_USAGE_BOOKKEEP, false,
>>>>    				      MAX_SCHEDULE_TIMEOUT);
>>>>    		dma_resv_unlock(priv->dmabuf->resv);
>>>> -		kref_put(&priv->kref, vfio_pci_dma_buf_done);
>>>> -		wait_for_completion(&priv->comp);
>>>> +		if (!was_revoked) {
>>>> +			kref_put(&priv->kref, vfio_pci_dma_buf_done);
>>>> +			wait_for_completion(&priv->comp);
>>>> +		}
>>>>    		vfio_device_put_registration(&vdev->vdev);
>>>>    		fput(priv->dmabuf->file);
>>>>    	}
>>>
>>


