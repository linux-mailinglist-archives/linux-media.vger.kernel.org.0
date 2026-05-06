Return-Path: <linux-media+bounces-60659-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI7xBpNv+2lmbAMAu9opvQ
	(envelope-from <linux-media+bounces-60659-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:42:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D32044DE3C1
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 373B7300B580
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 16:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFB3494A13;
	Wed,  6 May 2026 16:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="LVK6U0wJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2149D3EF0B7
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 16:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778085769; cv=none; b=Z+Y6134xEthtn6pPfgcgsvIjgoNEXh+SFSnvLWBhFMvcbJRQBzuB4xkDNoSM59BtlhC9x2mJkukaqX5YYoikBOfW/tE7CFn/gUCJ/epuwsE3IuaWBQSgMWTmhA/CW97FhQjKWWswpHxrQIZE63RI5/SvunLkaaQTIRDPFLQcl6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778085769; c=relaxed/simple;
	bh=PIgsAxwjAni+ibNITbesgAa9yzG9WpIb9zhCZJY95/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aiFCStvTSUEm56XXLotScAVAFX9x0w4NV9ePhhyhPUpKhrfLBCNRYrEqwjGpAZy/2FDgHRFyMDvK2swYBCmKm73LBifmKLK29Ri/PcWt8CBp5QScPPhd6ikSaVvLoTZgNl+LtcOwISNk6k3Iz2+9sh3LhpoXXuf2DvCDOPg1Hrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=LVK6U0wJ; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6463IBQj534428
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 09:42:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=KvzelPFNcl7MU+TM0miXboxQSsRGRRlAbQLX3lQgau0=; b=LVK6U0wJ9iIb
	vlscmhtMH1uiKx6GtvkvD3PFd3zgD6F0pJGalLirUzyn7txEkM7B87H6hJ3gBB/R
	xy6LpmR0MAd+x0ZIqp8r0Hyc0y1/04XFD7dLYOiSF6fGh+E8tNIVi/vB/zavG3F8
	8TN42shcv5hTMVXNvb74VYPbCsICbn9zU0M4AXi1sq9f+h9zZCOy9fgdkWE+OWLN
	jvoNlSSljZ+OfTzxu3364d0Kvicl9FDoxbDiiEVrSaNxol0u2vIUnHyNPLDd0Ix5
	f5o4c4x9PCLCIVbSwzFZPTO6tjK7i7qWftyIVCUjJ+tCPZ9EmmMKHs9roWgbBdAX
	UkgXxMdO6A==
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	by m0001303.ppops.net (PPS) with ESMTPS id 4dwcx9supy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 09:42:45 -0700 (PDT)
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488dcaf2f2fso50365635e9.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 09:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778085765; x=1778690565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvzelPFNcl7MU+TM0miXboxQSsRGRRlAbQLX3lQgau0=;
        b=U0hRDxh0irADBXJL6hxEJq7MtPpWBMglqOkKq2FTXl9yX2TvfdWhR2k1cvsrPXb/MT
         NjF/zyl2EapcOGY+zNNVkS/8il6cqmGHZoPhaCW4efpjABP8uJm7IHsBCEFxAS2gqC9E
         sL82JwtdeJOGThSyjbTkVYmceHC11FgKkpbzEwLQLZioBxr+pOtvDWIHALHnXnQzlPez
         +jF6BiAf54c3zPOb+qjpDw3IxJzbelh7fYDn7JiXEi/8XmQ+lDniG7suZizQMjXyh0Ih
         h7SqfJ341Ix7vyM9V7xW9jSGmP3Ip1zWkl6qi58wZ0hm5LYJl7wx17UdavqqqWvDK3CT
         aqGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8SHzpGzNToeVHX/jEFhiM+9sQ0AoNW/HlpZCtgTPA99tr9AWVmKjNu6C/q2xgD9Q+wNHrx3JA64//Quw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqZMGLhqgW+f3tgVBdCkEUj2WirCK5QSWwwWevYCIEMqMbx7jj
	3UjvfmCB6F4Hoou5CNf0W+4LgmSLlCczYFy8YDwUjOvz19fMUklbAqf9iLy857U60czJyhhSQrB
	HtV7HkwvO4X/7DyZRvKHHYGT7uiRanovRGalSBgfOWGysHRAJiTnlVx5JsHZMyCU=
X-Gm-Gg: AeBDieujZHCmxch5rPWanYmAooZKx0BFA5zq6ajYmyoumgRp6bwIGYtfOcTEGOOsPGB
	7gOT0fTmG6yhVgAx9JR95S6CqTfINWn13zoGERGpSrwP4P4kK2aiMXvbUpIVg2n+RZP/m4fIAq+
	XtAe243nrFRiofC9rRBndnQW52/LMw3PfPIsjHsMli0SPQs3sp+Vkvi8nwlJHRPCiHrIIOOiihH
	Xo4kUcbCdt5X/R79F4lyrSDaZ7ZRaFGTr8M6p8UpYhoVgb+87nwdvcrwCGrqVEY0Hm4kruUtQnp
	R2lK39aulzcLn7AzAWDnxW935EnW8OMlWqStimKMN/0JzrMsOJ88SvFpyQw91277ESWn8nSA6Fb
	f+QSAe39wowy1U3ktYZUBfw41Px2/mWvU2jALwzJKhgDDbwHiOAIjPpJoN85yyUmUBBs6znjU7G
	JkFOqq2hkZIK1no5EVcPujg1lxo8Jq4OA94W0/nAno/uhNUrjjrwIWjzoHkKe0hngQXk8xJqUmj
	VEIRrfOm23VcwCNG6xcJCrqFEi2FB4pXQ==
X-Received: by 2002:a05:600c:2ed3:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-48e51f427b3mr46111975e9.15.1778085764712;
        Wed, 06 May 2026 09:42:44 -0700 (PDT)
X-Received: by 2002:a05:600c:2ed3:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-48e51f427b3mr46111525e9.15.1778085764222;
        Wed, 06 May 2026 09:42:44 -0700 (PDT)
Received: from ?IPV6:2001:8b0:8b6:13d4:102e:f2af:e074:5cde? (e.d.c.5.4.7.0.e.f.a.2.f.e.2.0.1.4.d.3.1.6.b.8.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:8b6:13d4:102e:f2af:e074:5cde])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538fb1a7sm113622555e9.9.2026.05.06.09.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 09:42:43 -0700 (PDT)
Message-ID: <9a7e51bc-351d-4ca0-8080-fd9e0265f3a0@meta.com>
Date: Wed, 6 May 2026 17:42:42 +0100
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
 <c0bd0e23-712c-483e-a809-47126ab6e9e9@meta.com>
 <20260506161441.GK11063@unreal>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260506161441.GK11063@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3vtzxwCEOiPy_pLPgGbWj5V3JtYR-9YW
X-Proofpoint-GUID: 3vtzxwCEOiPy_pLPgGbWj5V3JtYR-9YW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2MyBTYWx0ZWRfXxnIMUz04qAVX
 Iy2Gx/a+RZQwKWYbL+Q3VUZ5wSufOTm4+fWIHJAUFAwBgouzbNNw0uKAidUiJu4sPfORgv0lAbS
 dDYD09GjZaxJnB/GLOOgtB0nyXktEEGmrsrvgFPY7GNScMhS/NQHrHiRhPh4mHf+/7gry56Bh/c
 0PvvuBlmG1L5CcG/A6H0kikU6vM16Rwh7Eq24NR7K/NZS4vjr+Av5iu8jZz/htGLH2/INb/2Pn3
 Dk61aSzRyZO5KPAF1jMwYJTBJItEOsMf0U+gB19AF88vgT+n2QOVRSuYWYvgQ4Dk01D9sA+/slY
 ERmfvjs5zGdXfxa9maNV849itbP6uZJBEJWCjuW1PYozOKDjSG79G9YY4GLfHhAOHngYhW8rFsF
 npMzHVXUDZm+cseCDlCDf0WWM4lxBkhwUpLzOvKQT6CPFKqmWApe9HcgSsdJyoSEwr8xBZo0Oao
 CjKMHL03kd8reFcJAHA==
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=69fb6f85 cx=c_pps
 a=Ech0Gv1thIkdqUNjVc2Ehg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=VabnemYjAAAA:8
 a=uIBLic6oc_-Le5kNHd0A:9 a=QEXdDO2ut3YA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Rspamd-Queue-Id: D32044DE3C1
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-60659-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,meta.com:email,meta.com:dkim,meta.com:mid];
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

Hi Leon,

On 06/05/2026 17:14, Leon Romanovsky wrote:
> 
> On Wed, May 06, 2026 at 04:55:27PM +0100, Matt Evans wrote:
>> Hi Leon,
>>
>> On 06/05/2026 16:29, Leon Romanovsky wrote:
>>>
>>> On Wed, May 06, 2026 at 02:53:31PM +0100, Matt Evans wrote:
>>>> Hi Alex,
>>>>
>>>> On 01/05/2026 20:12, Alex Williamson wrote:
>>>>>
>>>>> On Thu, 16 Apr 2026 06:17:44 -0700
>>>>> Matt Evans <mattev@meta.com> wrote:
>>>>>
>>>>>> vfio_pci_dma_buf_cleanup() assumed all VFIO device DMABUFs need to be
>>>>>> revoked.  However, if vfio_pci_dma_buf_move() revokes DMABUFs before
>>>>>> the fd/device closes, then vfio_pci_dma_buf_cleanup() would do a
>>>>>> second/underflowing kref_put() then wait_for_completion() on a
>>>>>> completion that never fires.  Fixed by predicating on revocation
>>>>>> status.
>>>>>>
>>>>>> This could happen if PCI_COMMAND_MEMORY is cleared before closing the
>>>>>> device fd (but the scenario is more likely to hit when future commits
>>>>>> add more methods to revoke DMABUFs).
>>>>>>
>>>>>> Fixes: 1a8a5227f2299 ("vfio: Wait for dma-buf invalidation to complete")
>>>>>> Signed-off-by: Matt Evans <mattev@meta.com>
>>>>>> ---
>>>>>>
>>>>>> (Just a fix, but later "vfio/pci: Convert BAR mmap() to use a DMABUF"
>>>>>> and "vfio/pci: Permanently revoke a DMABUF on request" depend on this
>>>>>> context, so including in this series.)
>>>>>
>>>>> We really need a fix for this split out from this series, It's already
>>>>> been shown[1] that this is trivially reachable.  Carlos proposed[2] a
>>>>> similar solution to the one below.  I was concurrently working on the
>>>>> issued and suggested an alternative[3].  Let's pick a solution for
>>>>> 7.1-rc.  Thanks,
>>>>
>>>> It looks like [3] is progressing, so I'll drop this one when I can rebase
>>>> onto it.
>>>>
>>>> I noticed [3] removes the dma_resv_lock(priv->dmabuf->resv) around the
>>>> priv->vdev = NULL, and this series' vfio_pci_mmap_huge_fault() relies on
>>>> vdev only changing whilst resv is held to resolve a race between a fault and
>>>> cleanup (see patch 7 of this series).  The handler takes resv so that it can
>>>> stably test vdev in order to take memory_lock.
>>>
>>> I think that you should rely on priv->revoked and not on priv->vdev.
>>
>> Needs both unfortunately, as the fault handler ultimately needs to take
>> vdev->memory_lock.
> 
> One can argue that if priv->revoked == True, all accesses to device
> should be denied and treated as priv->vdev == Null.

I agree, the handler will early-exit when a buffer is revoked.  Though 
when it _isn't_ revoked, it still needs to go through a careful set of 
steps to keep vdev around long enough to take the lock (and ensure it 
still isn't revoked, etc.).

I think the sequence in patch 7 still works (with Alex's patch in [3]), 
since the invariants still hold:

- if not-revoked then vdev is still valid (IOW, vdev = NULL only happens 
after revoked = true)
- revoke is only changed when holding priv->dmabuf->resv

OK, [3] doesn't seem to break this series (just context/rebase).  Sorry 
for the thinking out loud, it'll be good if someone sees a flaw in my 
reasoning though.

[3] was https://lore.kernel.org/all/20260429142242.70f746b4@nvidia.com/


Matt

