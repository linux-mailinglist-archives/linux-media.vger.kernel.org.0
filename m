Return-Path: <linux-media+bounces-63424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9CSoL8cbH2rGgAAAu9opvQ
	(envelope-from <linux-media+bounces-63424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 20:07:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE1C630F02
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 20:07:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=meta.com header.s=s2048-2025-q2 header.b=TIq8E1+7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63424-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63424-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=meta.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27F8C302BDC8
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 18:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFE23168E6;
	Tue,  2 Jun 2026 18:01:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355FF306774
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 18:01:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780423300; cv=none; b=qntFeS1nbvpEDo72bTRHxDQmXvo8Xxe+v0/NbDR2gsB+SeOyYZukk8k0ATKkl523VxrEKxRbL4x72IbCVRc+HoAafsxIvJlju17cA+i4m1ONV1Kh/1X93Cf5yd++Fg3STeGaCDIXSwqlKUZ2wDd7c2cJpl9n11RnB+FGwM1kYmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780423300; c=relaxed/simple;
	bh=n3dVA53zT9JspPQuJ+Mlz6nYXKpskRHU5FQNcYin9vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T2mOaEpKPfv+x+P4JpAxLNyjeGjZLOnAii/K4o2yOGMUOhP3xJpQlREYBOPp3bOfY8GBSsmfYtWPq0dhkPiwHkm0wCYAo34+F8oH6F0i5ZJ1v7Le//iezcVnkR6fgWW6DCNUxZ7U5TwY9eYblpWfEE3FlWupncfvNp1YG4z0CvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=TIq8E1+7; arc=none smtp.client-ip=67.231.153.30
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652EP10H1179018
	for <linux-media@vger.kernel.org>; Tue, 2 Jun 2026 11:01:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=TLuI65oSuDRE65vhzQMOoO1E/g4MwzO7wSZkxf244TE=; b=TIq8E1+7htJB
	lJL0TinyyKQcSMbO9fSTw8UX+CQIBwyy4v7QIWjABAup5GqlgDWYlBhEWy3n5KuB
	r/NlG1xhRZ/63zTsX0RK9U8IwEol4i0k56zq/Zb5jVz6aVDy4NKBKhGjzhx5SSLV
	v7FGN/bXZUQndbr1C/4PmqwmSjKpJ9qWcewGv5R2Lrc6K521RF3iHAbiMJXhUMvg
	OFMBj8D9l28rkMniQsfeBpFYkYAai9aNZ/VN9J5BuI1K7TUH+uDNARacLrtOI6cz
	Sm/BqXlMHXrLOcAfYb8HTW7WSbyi0W1njXBxZvE/b5q428NIuY71gH0l/34V7v3y
	VmuVrZWdyQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4ej0wshk1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 11:01:38 -0700 (PDT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304b8d0ee63so9945027eec.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 11:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780423297; x=1781028097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLuI65oSuDRE65vhzQMOoO1E/g4MwzO7wSZkxf244TE=;
        b=fm3BGSvn2zVUS+b3Mk7XA6pIMtv4jPP/HbQD3rPVR5ANvySlVKFcLLNha+UVkbYnFm
         G6fAbOQG/denehxyQuS8wtB1jSuqRwfwhhZY6ozk21Qp54ZyOS4dAG/ppLHNMl50I9O0
         BNmRs+OPFYkxtFuMt2zd4zQYQGjq2z9yn5Obq8uSxDVfKH0egTcR6WRZpLrhGOAZnnMk
         QvrA5t9TyLDmugOTCtmlQmDwGcmCcl+E8MVnmDxxFrFzqOJMJ6t4mm3O0IE/od2fQeQV
         iKWUPV3YbfcxiMnDnQzePzTTeLO0evYsUKTznUsww7PZnmmFZbWh/ZlSeEhafAtBE9V6
         adyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rsjUyCVA2ej6sWuMX+oUmVVRciHCHN5vfyYG1OjDMGDLE8PkS6+4bxlPFyUypq3StECuT+Xg/4qwBoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRDHrU1zttvf3mTSoTWA8R5ba2bTLVdSJrJYhmerLqbVJb+6lM
	UBMtq43rkGbFz99Z3NzJptU/WiYpV0JvyCZW7WmMVzhHfVR+bbwryJrsuz0UcZiekcSEAbBTYhX
	ZVMQlujK68XD4KS7G7OombVtJanUyBn3aA7bFK5Uruz8zClCFkWCpa0nDj5Qp7wY=
X-Gm-Gg: Acq92OEZtSedHRVY0C28aZAcJWsXjobCVAq7jN3eDd7kvYdT0QkWi2/5clgIhiPcEcQ
	5u2hSigHyBUnyuiBhtQ/xvSFnvfy0L7Zd/xaSbTmXdWNA0s+iVJbZXEEtpcquIbmvA34FPz78wN
	E+vM/XX1lc+AwfQoqOEY+5ADk7Rgmj2TQMVmrlqBMaNXmV9GL8r+q/hZXzvo2XlWJqF4Pm/DhOl
	SQPMhZHWD4rqvhpGk9sejzBnNZu9oub954i+q2NJOkfk0Cd2ncxsm+xoHF4L0wI1Fx6fpF4eybY
	yVNaeSWHHmN5I/Uxu8Vcevi2JyDb/W5kCWsj4xlQ3RW1Qtr8aK/T6lf2uB11tWd12yZjx5AeEIr
	k1Oq7JWwSX+Dqb3cbsU+WQjE9900ozybweCQ=
X-Received: by 2002:a05:7022:f99:b0:132:f16:a574 with SMTP id a92af1059eb24-137d3d09cf1mr7685431c88.7.1780423296202;
        Tue, 02 Jun 2026 11:01:36 -0700 (PDT)
X-Received: by 2002:a05:7022:f99:b0:132:f16:a574 with SMTP id a92af1059eb24-137d3d09cf1mr7685300c88.7.1780423294977;
        Tue, 02 Jun 2026 11:01:34 -0700 (PDT)
Received: from [10.0.40.30] ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f54db05csm353834c88.8.2026.06.02.11.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 11:01:34 -0700 (PDT)
Message-ID: <3070025e-5634-4033-af87-d6d99f1c141c@meta.com>
Date: Tue, 2 Jun 2026 19:01:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] vfio/pci: Convert BAR mmap() to use a DMABUF
Content-Language: en-GB
To: Alex Williamson <alex@shazbot.org>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
        Alex Mastro <amastro@fb.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Logan Gunthorpe <logang@deltatee.com>,
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
        kvm@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260527102319.100128-1-mattev@meta.com>
 <20260527102319.100128-5-mattev@meta.com>
 <20260528171544.3d8db4a2@shazbot.org>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260528171544.3d8db4a2@shazbot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJfAb79m c=1 sm=1 tr=0 ts=6a1f1a82 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=2UbFsIa4v//lIgRL4kGwwA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22 a=VabnemYjAAAA:8
 a=X6LgIXqp_Fj0wCoY6GEA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: asAW-l9u5sdmBebQKBoJGaeo9Z5tywu3
X-Proofpoint-ORIG-GUID: asAW-l9u5sdmBebQKBoJGaeo9Z5tywu3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE3NCBTYWx0ZWRfX533XeeFHX8H9
 IsRvaiPMHSQLoqSJIWr6DP2twIgap7aMRzr75aHZJEIPWqaZfIY5jE2L+NCdY/f9Ex8c1reXYvS
 hl21U2w3si8QsdxB9gJ95DGUNp51D2EiMX+nSRlp4TDGGtor1/I0C0YrSQPFjR25p4PfSKGJqf/
 FoDXymrl9JKZun1izv2Nz97Em5e8rmnPauSIqBzFdBgn1Ja1aImJqq35xlsW8UezENAbtwBj0I4
 sn3WAjNYFYuJccktyBZ+wyE+F+k4DGFn3XqwQHvk2Zhb/2HHeQOp8jxhCv3i0uiC0e25m2RToe8
 CO2ZnHg06QAVOQApO5gb4rtmTK22jE9CPHxBViPM3co4+3XlhsiVmgcwcyTQcynE53gaoILfFOC
 1OIC0s/rz2o6T+4TgmA4yFooeFVmu+kl9axtjKh+d+ViFNvUQnQqO2nK4vzyr8nEnNO/pQBM2LQ
 2sNKULLMwGkpsgo62FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_03,2026-05-28_03,2025-10-01_01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63424-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[meta.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FE1C630F02

Hi Alex,

On 29/05/2026 00:15, Alex Williamson wrote:
> 
> On Wed, 27 May 2026 03:23:07 -0700
> Matt Evans <mattev@meta.com> wrote:
> 
>> Convert the VFIO device fd fops->mmap to create a DMABUF representing
>> the BAR mapping, and make the VMA fault handler look up PFNs from the
>> corresponding DMABUF.  This supports future code mmap()ing BAR
>> DMABUFs, and iommufd work to support Type1 P2P.
>>
>> First, vfio_pci_core_mmap() uses the new
>> vfio_pci_core_mmap_prep_dmabuf() helper to export a DMABUF
>> representing a single BAR range.  Then, the vfio_pci_mmap_huge_fault()
>> callback is updated to understand revoked buffers, and uses the new
>> vfio_pci_dma_buf_find_pfn() helper to determine the PFN for a given
>> fault address.
>>
>> Now that the VFIO DMABUFs can be mmap()ed, vfio_pci_dma_buf_move()
>> zaps PTEs (used on the revocation and cleanup paths).
>>
>> CONFIG_VFIO_PCI_CORE now unconditionally depends on
>> CONFIG_DMA_SHARED_BUFFER and CONFIG_PCI_P2PDMA_CORE.  The
>> CONFIG_VFIO_PCI_DMABUF feature conditionally includes support for
>> VFIO_DEVICE_FEATURE_DMA_BUF, depending on the availability of
>> CONFIG_PCI_P2PDMA.
>>
>> Signed-off-by: Matt Evans <mattev@meta.com>
>> ---
>>   drivers/vfio/pci/Kconfig           |  4 +-
>>   drivers/vfio/pci/Makefile          |  3 +-
>>   drivers/vfio/pci/vfio_pci_core.c   | 79 +++++++++++++++++++-----------
>>   drivers/vfio/pci/vfio_pci_dmabuf.c | 12 +++++
>>   drivers/vfio/pci/vfio_pci_priv.h   | 11 +----
>>   5 files changed, 68 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
>> index 296bf01e185e..9197343a7301 100644
>> --- a/drivers/vfio/pci/Kconfig
>> +++ b/drivers/vfio/pci/Kconfig
>> @@ -6,6 +6,8 @@ config VFIO_PCI_CORE
>>   	tristate
>>   	select VFIO_VIRQFD
>>   	select IRQ_BYPASS_MANAGER
>> +	select PCI_P2PDMA_CORE
>> +	select DMA_SHARED_BUFFER
>>   
>>   config VFIO_PCI_INTX
>>   	def_bool y if !S390
>> @@ -56,7 +58,7 @@ config VFIO_PCI_ZDEV_KVM
>>   	  To enable s390x KVM vfio-pci extensions, say Y.
>>   
>>   config VFIO_PCI_DMABUF
>> -	def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
>> +	def_bool y if PCI_P2PDMA
> 
> This largely only breaks consistency, but should VFIO_PCI_CORE become a
> 'depends on' rather than dropped entirely?

That makes more sense, avoids the file being built if !VFIO_PCI...  Fixed.

>>   
>>   source "drivers/vfio/pci/mlx5/Kconfig"
>>   
>> diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
>> index 6138f1bf241d..881452ea89be 100644
>> --- a/drivers/vfio/pci/Makefile
>> +++ b/drivers/vfio/pci/Makefile
>> @@ -1,8 +1,7 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   
>> -vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
>> +vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o vfio_pci_dmabuf.o
>>   vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
>> -vfio-pci-core-$(CONFIG_VFIO_PCI_DMABUF) += vfio_pci_dmabuf.o
>>   obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
>>   
>>   vfio-pci-y := vfio_pci.o
>> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
>> index 041243a84d81..c5f934905ce0 100644
>> --- a/drivers/vfio/pci/vfio_pci_core.c
>> +++ b/drivers/vfio/pci/vfio_pci_core.c
>> @@ -1683,18 +1683,6 @@ void vfio_pci_memory_unlock_and_restore(struct vfio_pci_core_device *vdev, u16 c
>>   	up_write(&vdev->memory_lock);
>>   }
>>   
>> -static unsigned long vma_to_pfn(struct vm_area_struct *vma)
>> -{
>> -	struct vfio_pci_core_device *vdev = vma->vm_private_data;
>> -	int index = vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
>> -	u64 pgoff;
>> -
>> -	pgoff = vma->vm_pgoff &
>> -		((1U << (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
>> -
>> -	return (pci_resource_start(vdev->pdev, index) >> PAGE_SHIFT) + pgoff;
>> -}
>> -
>>   vm_fault_t vfio_pci_vmf_insert_pfn(struct vfio_pci_core_device *vdev,
>>   				   struct vm_fault *vmf,
>>   				   unsigned long pfn,
>> @@ -1722,23 +1710,42 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
>>   					   unsigned int order)
>>   {
>>   	struct vm_area_struct *vma = vmf->vma;
>> -	struct vfio_pci_core_device *vdev = vma->vm_private_data;
>> -	unsigned long addr = vmf->address & ~((PAGE_SIZE << order) - 1);
>> -	unsigned long pgoff = (addr - vma->vm_start) >> PAGE_SHIFT;
>> -	unsigned long pfn = vma_to_pfn(vma) + pgoff;
>> -	vm_fault_t ret = VM_FAULT_FALLBACK;
>> -
>> -	if (is_aligned_for_order(vma, addr, pfn, order)) {
>> -		scoped_guard(rwsem_read, &vdev->memory_lock)
>> -			ret = vfio_pci_vmf_insert_pfn(vdev, vmf, pfn, order);
>> -	}
>> +	struct vfio_pci_dma_buf *priv = vma->vm_private_data;
>> +	struct vfio_pci_core_device *vdev;
>> +	unsigned long pfn = 0;
>> +	vm_fault_t ret = VM_FAULT_SIGBUS;
>>   
>> -	dev_dbg_ratelimited(&vdev->pdev->dev,
>> -			   "%s(,order = %d) BAR %ld page offset 0x%lx: 0x%x\n",
>> -			    __func__, order,
>> -			    vma->vm_pgoff >>
>> -				(VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT),
>> -			    pgoff, (unsigned int)ret);
>> +	/*
>> +	 * We can rely on the existence of both a DMABUF (priv) and
>> +	 * the VFIO device it was exported from (vdev).  This fault's
>> +	 * VMA was established using vfio_pci_core_mmap_prep_dmabuf()
>> +	 * which transfers ownership of the VFIO device fd to the
>> +	 * DMABUF, and so the VFIO device is held open because the
>> +	 * VMA's vm_file (DMABUF) is open.
>> +	 *
>> +	 * Since vfio_pci_dma_buf_cleanup() cannot have happened,
>> +	 * vdev must be valid; we can take memory_lock.
>> +	 */
>> +	vdev = READ_ONCE(priv->vdev);
> 
> The above comment argues that vdev is stable, so why do we need to
> access it with READ_ONCE()?

Fixed as of my reply to your review of [7/8].

> 
>> +
>> +	scoped_guard(rwsem_read, &vdev->memory_lock) {
>> +		if (!priv->revoked) {
>> +			int pres = vfio_pci_dma_buf_find_pfn(priv, vma,
>> +							     vmf->address,
>> +							     order, &pfn);
>> +
>> +			if (pres == 0)
>> +				ret = vfio_pci_vmf_insert_pfn(vdev, vmf,
>> +							      pfn, order);
>> +			else if (pres == -EAGAIN)
>> +				ret = VM_FAULT_FALLBACK;
>> +		}
>> +
>> +		dev_dbg_ratelimited(&vdev->pdev->dev,
>> +				    "%s(order = %d) PFN 0x%lx, VA 0x%lx, pgoff 0x%lx: 0x%x\n",
>> +				    __func__, order, pfn, vmf->address,
>> +				    vma->vm_pgoff, (unsigned int)ret);
> 
> Looks like this should still be outside the scope of the memory_lock.

Argh, I think I stuffed a rebase there, thanks for that.  I should've 
caught that in my local review.  Fixed!

(Reply flurry pausing now;  still working on implementing the suggestion 
for "[PATCH v2 6/9] vfio/pci: Clean up BAR zap and revocation" and 
refactoring for "[PATCH v2 1/9] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE", 
but will post a v3 in a day or two.  As ever, thanks for the reviews.)


Matt


> Thanks,
> 
> Alex
> 
>> +	}
>>   
>>   	return ret;
>>   }
>> @@ -1763,6 +1770,7 @@ int vfio_pci_core_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma
>>   	unsigned int index;
>>   	u64 phys_len, req_len, pgoff, req_start;
>>   	void __iomem *bar_io;
>> +	int ret;
>>   
>>   	index = vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
>>   
>> @@ -1802,7 +1810,20 @@ int vfio_pci_core_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma
>>   	if (IS_ERR(bar_io))
>>   		return PTR_ERR(bar_io);
>>   
>> -	vma->vm_private_data = vdev;
>> +	/*
>> +	 * Create a DMABUF with a single range corresponding to this
>> +	 * mapping, and wire it into vma->vm_private_data.  The VMA's
>> +	 * vm_file becomes that of the DMABUF, and the DMABUF takes
>> +	 * ownership of the VFIO device file (put upon DMABUF
>> +	 * release).  This maintains the behaviour of a live VMA
>> +	 * mapping holding the VFIO device file open.
>> +	 */
>> +	ret = vfio_pci_core_mmap_prep_dmabuf(vdev, vma,
>> +					     pci_resource_start(pdev, index),
>> +					     req_len, index);
>> +	if (ret)
>> +		return ret;
>> +
>>   	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>>   	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>   
>> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> index 782408c08a5e..f7797f58d44b 100644
>> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
>> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> @@ -9,6 +9,7 @@
>>   
>>   MODULE_IMPORT_NS("DMA_BUF");
>>   
>> +#ifdef CONFIG_VFIO_PCI_DMABUF
>>   static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>>   				   struct dma_buf_attachment *attachment)
>>   {
>> @@ -25,6 +26,7 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>>   
>>   	return 0;
>>   }
>> +#endif /* CONFIG_VFIO_PCI_DMABUF */
>>   
>>   static void vfio_pci_dma_buf_done(struct kref *kref)
>>   {
>> @@ -89,7 +91,9 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
>>   }
>>   
>>   static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
>> +#ifdef CONFIG_VFIO_PCI_DMABUF
>>   	.attach = vfio_pci_dma_buf_attach,
>> +#endif
>>   	.map_dma_buf = vfio_pci_dma_buf_map,
>>   	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
>>   	.release = vfio_pci_dma_buf_release,
>> @@ -263,6 +267,7 @@ static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
>>   	return 0;
>>   }
>>   
>> +#ifdef CONFIG_VFIO_PCI_DMABUF
>>   /*
>>    * This is a temporary "private interconnect" between VFIO DMABUF and iommufd.
>>    * It allows the two co-operating drivers to exchange the physical address of
>> @@ -461,6 +466,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>>   	kfree(dma_ranges);
>>   	return ret;
>>   }
>> +#endif /* CONFIG_VFIO_PCI_DMABUF */
>>   
>>   int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>>   				   struct vm_area_struct *vma,
>> @@ -535,6 +541,10 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>>   	struct vfio_pci_dma_buf *tmp;
>>   
>>   	lockdep_assert_held_write(&vdev->memory_lock);
>> +	/*
>> +	 * Holding memory_lock ensures a racing VMA fault observes
>> +	 * priv->revoked properly.
>> +	 */
>>   
>>   	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>>   		if (!get_file_active(&priv->dmabuf->file))
>> @@ -552,6 +562,8 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>>   			if (revoked) {
>>   				kref_put(&priv->kref, vfio_pci_dma_buf_done);
>>   				wait_for_completion(&priv->comp);
>> +				unmap_mapping_range(priv->dmabuf->file->f_mapping,
>> +						    0, priv->size, 1);
>>   				/*
>>   				 * Re-arm the registered kref reference and the
>>   				 * completion so the post-revoke state matches the
>> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
>> index 06dc0fd3e230..d38e1b98b2e9 100644
>> --- a/drivers/vfio/pci/vfio_pci_priv.h
>> +++ b/drivers/vfio/pci/vfio_pci_priv.h
>> @@ -138,13 +138,13 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>>   				   struct vm_area_struct *vma,
>>   				   u64 phys_start, u64 req_len,
>>   				   unsigned int res_index);
>> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
>> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
>>   
>>   #ifdef CONFIG_VFIO_PCI_DMABUF
>>   int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>>   				  struct vfio_device_feature_dma_buf __user *arg,
>>   				  size_t argsz);
>> -void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
>> -void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
>>   #else
>>   static inline int
>>   vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>> @@ -153,13 +153,6 @@ vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>>   {
>>   	return -ENOTTY;
>>   }
>> -static inline void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>> -{
>> -}
>> -static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev,
>> -					 bool revoked)
>> -{
>> -}
>>   #endif
>>   
>>   #endif
> 


