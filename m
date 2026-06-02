Return-Path: <linux-media+bounces-63411-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tz/vHngHH2rZdgAAu9opvQ
	(envelope-from <linux-media+bounces-63411-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 18:40:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 072D06304A8
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 18:40:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=meta.com header.s=s2048-2025-q2 header.b=HOg7qB1Z;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63411-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63411-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=meta.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CECFB3028DC9
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 16:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0E9372685;
	Tue,  2 Jun 2026 16:40:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FDC368D73
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 16:40:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418403; cv=none; b=OjF8atydUlG53EPTGiwC88yi6mXWASMlk6Gk7lHYZy4/UqdmnzfMFbsv0sBI2jQOc3jRHCDJgpgy2yaM5zjpnqZ4qF2wArDKfMSNy46jTV18t6Vuz+FyQ07/wzZOfvQUee9sbLweR1jiKSXHeAyKgTO4EbUMm/JnpRGCIyH3Oyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418403; c=relaxed/simple;
	bh=woTNv57IMQwTYrlreMeY3hXWvRabJQ4iemjU3w5kLjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8TAUkeE5L2zuR+2mpUXjAPGwrMMbohqBdcPpKQGelxD47jfhYYVlc823hwypjs4Li+zc/e79w05TID9ykKOZBJ+2mlDu7wB5Ps8HwFHWdNxTBERGSeY5ZzSxPBn500+DeyIjrpROfYVHwb6ki+BT9MK7h9aRhGkC1FALUn/qV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=HOg7qB1Z; arc=none smtp.client-ip=67.231.145.42
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652FSBwC2304178
	for <linux-media@vger.kernel.org>; Tue, 2 Jun 2026 09:40:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=aQM+IzQj3ZxDY3ggA3owlA7d3KkShBiCJ4vlXvqOyDo=; b=HOg7qB1ZuQW4
	6lBSat61mKhK+MnCr8cVctmCY8FdH0jD5Vqo1SZjiJT1PXSaE6jJQVDirlh/htm/
	9o6dj/yg6WQlQu1Ag3gFjinhmPlncdZ+iDtruJCHvVEKqdsfNMXoAkXSrKPtLDTA
	3xX8W/GYXP0Aq5Gq6Ync/girYSkqCalmedMCwx9NdEVzNdCIolWzgFPcYbZtVZgO
	Jn4AyjLkjiJuARnKpqqzKSPyRW9JD8y2/mqfCdNwg8CHUTH8ACHXhAFYvzpVOmgy
	952MRLNOgD4wNbb/nZkLL1ZWSrP4TZejD+XKBEBOdJHJiP/7oON+DmOd/cec5Y2L
	4bhL4BgFWQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4ej1uhrhd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 09:40:00 -0700 (PDT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304d0d0b28eso5572426eec.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 09:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418400; x=1781023200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQM+IzQj3ZxDY3ggA3owlA7d3KkShBiCJ4vlXvqOyDo=;
        b=cMTXpMIi9d1lHmy+KJeeGlSYDLdHkOt+4sm7Z3BfE0cJr2dDbCuWQbfP2S5HXpZMxt
         oSihibTzH7MkayXNk7dRBkyE9iWw2BQl5xWA66+MzZm5Z9pxk1n/2IXcH+aGu/MC7JbI
         CIebAt0Dac4YgnDNmTpRWgC0+Dm/kaNn2jGSV1pZONSFZraDEPImfkfG6vEJqZJQRj5O
         ZhAq7sB6nTG6Gktu31M2C1qCJfATB/yeKGUWQLeFogsoYjGTcIeWLBhrCfknOVzDp9rE
         YR11VcFYnTNdhHbJLUqKLhSjEkKyPY4y5oKmtzAeXrm8FWcYBFfX7aqRezmGs0PGf3K+
         CqVA==
X-Forwarded-Encrypted: i=1; AFNElJ+FVlafvfEntyEtFxPne/XaPq+/xReebx0inbWCgKqX6lOkp38sR9KUvorCR+foBd1GCi7quj+O+2Zjkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc+594Zdud9qNzUxIvW10jvB64qOeZWlDOYi6JGhhOziidunmP
	boIgweOLNGwgz8ir+oWUz5XTQHUY7LeaP/nfgfZMCuu9LwCGQI+MdKNkSaLKQfNroQfgMczDcuG
	Iii1Bx9gRcA5bNWobFylHc+ADkfvQeRSUYrm6ayXfsdoaJFcHmzOd9FJD4HuNihs=
X-Gm-Gg: Acq92OFy596UwESRr8nhPta9eNze17x3sONs3jCV73y0cJzbE1yUzi//k+rcghv8ZmW
	Q8y3n5SrEGN3cIj9gHkC4gcD+diIKgU0CLLyDbbtgMu7SGD94t2/iBgPro/OIHDuQA4bgjYlQI5
	KjxPTMiDFEtMCWRvnQH41X2w9dbidcV/5fxTscyunZj3W+Z02xofa+nxT44rkxAEqbvAtOG5OJG
	D3qcshEHir1ElHkTwy2BkiwGgg0N3M0Ziz5TO+I1V2FmqzG+21f7V5KEVIWQsEYFm7osZit0ZvO
	MRN76cNhRVfGuryyDI3imJdz6w8Od8+0+XISOLIDErrLb/Xws+MKA4oNKsC/g1LuysB/IDOrdGz
	7c2UXKur7KcsCcap7nURKr9Ol50IB2TyA6NrXWGvZ
X-Received: by 2002:a05:693c:2c0e:b0:304:e450:67e0 with SMTP id 5a478bee46e88-304fa4c81d5mr8098509eec.10.1780418400056;
        Tue, 02 Jun 2026 09:40:00 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0e:b0:304:e450:67e0 with SMTP id 5a478bee46e88-304fa4c81d5mr8098467eec.10.1780418399427;
        Tue, 02 Jun 2026 09:39:59 -0700 (PDT)
Received: from [10.0.40.30] ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c10c1sm11553860eec.1.2026.06.02.09.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 09:39:59 -0700 (PDT)
Message-ID: <dfa4d88b-9182-499c-b2ba-dbde0fc32745@meta.com>
Date: Tue, 2 Jun 2026 17:39:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] vfio/pci: Add a helper to create a DMABUF for a
 BAR-map VMA
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
 <20260527102319.100128-4-mattev@meta.com>
 <20260527165922.60a79fee@shazbot.org>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260527165922.60a79fee@shazbot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Pt-3B943uMxEzjLklRQB8DUsNx3gUibJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2MSBTYWx0ZWRfX1UG4fOnMwIf8
 DDjYjx4ZP3Y9H06vvonwMpCXQTFx/Y2vrwf28VzQnLFO0zE5d/gzVikSMLQmVbUn9GkLomfU0WR
 /sczJWOrRF1T7eeEDIvGM4TrecY4bXg+MdE34FAjS3ooPq+NH85I8fZ+BEukZAByTuv/Vg41IPV
 W7F0rfltrewilL9HmRZbaJa0U6FdEQiJDuv6uQahxm2oB80SVBTps3PV7CFdNzvcVOLeypDG+Ey
 uHiRJ045juMggGDfDL8y1eIBZ/Cu0ib9gp0riGvCWHCjWTWAMAkZK3JHZA2XSL7LNB5INZ0eVIb
 huIWQaUeh6emDzFLqmWLcLUEzKcZ6icl32Bc6uGFKx1OeIqW6kUrJco0YcH8087QfmLL9YFXs34
 sOwyAaNqCr8+GnixrurAcUZJQPNbPcbbkBuNAHGb6PDMEcdNqv+NqleSlFBMJ6l5nC1PojuqwcJ
 uc4ozKGQQedv4YJIdOg==
X-Proofpoint-ORIG-GUID: Pt-3B943uMxEzjLklRQB8DUsNx3gUibJ
X-Authority-Analysis: v=2.4 cv=UshT8ewB c=1 sm=1 tr=0 ts=6a1f0760 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=2UbFsIa4v//lIgRL4kGwwA==:17
 a=Dv35txUGz5gI0hTa:21 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=U_y8lYiYyhHBU5rMqhb2:22
 a=VabnemYjAAAA:8 a=73EwkdylJAySbZmAXzAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63411-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:mid,meta.com:dkim,meta.com:from_mime,meta.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 072D06304A8

Hi Alex,

On 27/05/2026 23:59, Alex Williamson wrote:
> 
> On Wed, 27 May 2026 03:23:06 -0700
> Matt Evans <mattev@meta.com> wrote:
> 
>> This helper, vfio_pci_core_mmap_prep_dmabuf(), creates a single-range
>> DMABUF for the purpose of mapping a PCI BAR.  This is used in a future
>> commit by VFIO's ordinary mmap() path.
>>
>> This function transfers ownership of the VFIO device fd to the
>> DMABUF, which fput()s when it's released.
>>
>> Refactor the existing vfio_pci_core_feature_dma_buf() to split out
>> export code common to the two paths, VFIO_DEVICE_FEATURE_DMA_BUF and
>> this new VFIO_BAR mmap().
>>
>> Signed-off-by: Matt Evans <mattev@meta.com>
>> ---
>>   drivers/vfio/pci/vfio_pci_dmabuf.c | 140 ++++++++++++++++++++++-------
>>   drivers/vfio/pci/vfio_pci_priv.h   |   5 ++
>>   2 files changed, 115 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> index 0d132c4ca95f..782408c08a5e 100644
>> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
>> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> @@ -82,6 +82,8 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
>>   		up_write(&priv->vdev->memory_lock);
>>   		vfio_device_put_registration(&priv->vdev->vdev);
>>   	}
>> +	if (priv->vfile)
>> +		fput(priv->vfile);
>>   	kfree(priv->phys_vec);
>>   	kfree(priv);
>>   }
>> @@ -222,6 +224,45 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
>>   	return -EFAULT;
>>   }
>>   
>> +/*
>> + * Create a DMABUF corresponding to priv, add it to vdev->dmabufs list
>> + * for tracking (meaning cleanup or revocation will zap it), and take
>> + * a vfio_device registration.
>> + */
>> +static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
>> +				  struct vfio_pci_dma_buf *priv, uint32_t flags)
> 
> s/uint32_t/u32/?

Fixed.

>> +{
>> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>> +
>> +	if (!vfio_device_try_get_registration(&vdev->vdev))
>> +		return -ENODEV;
>> +
>> +	exp_info.ops = &vfio_pci_dmabuf_ops;
>> +	exp_info.size = priv->size;
>> +	exp_info.flags = flags;
>> +	exp_info.priv = priv;
>> +
>> +	priv->dmabuf = dma_buf_export(&exp_info);
>> +	if (IS_ERR(priv->dmabuf)) {
>> +		vfio_device_put_registration(&vdev->vdev);
>> +		return PTR_ERR(priv->dmabuf);
>> +	}
>> +
>> +	kref_init(&priv->kref);
>> +	init_completion(&priv->comp);
>> +
>> +	/* dma_buf_put() now frees priv */
>> +	INIT_LIST_HEAD(&priv->dmabufs_elm);
>> +	down_write(&vdev->memory_lock);
>> +	dma_resv_lock(priv->dmabuf->resv, NULL);
>> +	priv->revoked = !__vfio_pci_memory_enabled(vdev);
>> +	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
>> +	dma_resv_unlock(priv->dmabuf->resv);
>> +	up_write(&vdev->memory_lock);
>> +
>> +	return 0;
>> +}
>> +
>>   /*
>>    * This is a temporary "private interconnect" between VFIO DMABUF and iommufd.
>>    * It allows the two co-operating drivers to exchange the physical address of
>> @@ -340,7 +381,6 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>>   {
>>   	struct vfio_device_feature_dma_buf get_dma_buf = {};
>>   	struct vfio_region_dma_range *dma_ranges;
>> -	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>>   	struct vfio_pci_dma_buf *priv;
>>   	size_t length;
>>   	int ret;
>> @@ -400,34 +440,9 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>>   	kfree(dma_ranges);
>>   	dma_ranges = NULL;
>>   
>> -	if (!vfio_device_try_get_registration(&vdev->vdev)) {
>> -		ret = -ENODEV;
>> +	ret = vfio_pci_dmabuf_export(vdev, priv, get_dma_buf.open_flags);
>> +	if (ret)
>>   		goto err_free_phys;
>> -	}
>> -
>> -	exp_info.ops = &vfio_pci_dmabuf_ops;
>> -	exp_info.size = priv->size;
>> -	exp_info.flags = get_dma_buf.open_flags;
>> -	exp_info.priv = priv;
>> -
>> -	priv->dmabuf = dma_buf_export(&exp_info);
>> -	if (IS_ERR(priv->dmabuf)) {
>> -		ret = PTR_ERR(priv->dmabuf);
>> -		goto err_dev_put;
>> -	}
>> -
>> -	kref_init(&priv->kref);
>> -	init_completion(&priv->comp);
>> -
>> -	/* dma_buf_put() now frees priv */
>> -	INIT_LIST_HEAD(&priv->dmabufs_elm);
>> -	down_write(&vdev->memory_lock);
>> -	dma_resv_lock(priv->dmabuf->resv, NULL);
>> -	priv->revoked = !__vfio_pci_memory_enabled(vdev);
>> -	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
>> -	dma_resv_unlock(priv->dmabuf->resv);
>> -	up_write(&vdev->memory_lock);
>> -
>>   	/*
>>   	 * dma_buf_fd() consumes the reference, when the file closes the dmabuf
>>   	 * will be released.
>> @@ -438,8 +453,6 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>>   
>>   	return ret;
>>   
>> -err_dev_put:
>> -	vfio_device_put_registration(&vdev->vdev);
>>   err_free_phys:
>>   	kfree(priv->phys_vec);
>>   err_free_priv:
>> @@ -449,6 +462,73 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>>   	return ret;
>>   }
>>   
>> +int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>> +				   struct vm_area_struct *vma,
>> +				   u64 phys_start, u64 req_len,
>> +				   unsigned int res_index)
>> +{
>> +	struct vfio_pci_dma_buf *priv;
>> +	const unsigned int nr_ranges = 1;
> 
> Why, versus priv->nr_ranges = 1; below?  Thanks,

Hm, a vestige from a simpler time when it was a different shape and 
unnecessary now, fixed as per suggestion.


Thanks,


Matt

> Alex
> 
>> +	unsigned long vma_pgoff = vma->vm_pgoff & (VFIO_PCI_OFFSET_MASK >> PAGE_SHIFT);
>> +	int ret;
>> +
>> +	priv = kzalloc_obj(*priv);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->phys_vec = kzalloc_obj(*priv->phys_vec);
>> +	if (!priv->phys_vec) {
>> +		ret = -ENOMEM;
>> +		goto err_free_priv;
>> +	}
>> +
>> +	/*
>> +	 * The DMABUF begins from the mmap()'s BAR offset, i.e. the
>> +	 * start of the VMA corresponds to byte 0 of the DMABUF and
>> +	 * byte (vma_pgoff << PAGE_SHIFT) of the BAR.
>> +	 *
>> +	 * vfio_pci_dma_buf_find_pfn() reverses this offset using
>> +	 * vma_pgoff_adjust, so that ultimately a fault's offset from
>> +	 * the start of the _VMA_ has a consistent usage whether the
>> +	 * VMA originates from an mmap() of the VFIO device here or a
>> +	 * direct DMABUF mmap().
>> +	 */
>> +	priv->vdev = vdev;
>> +	priv->size = req_len;
>> +	priv->nr_ranges = nr_ranges;
>> +	priv->vma_pgoff_adjust = vma_pgoff;
>> +	priv->provider = pcim_p2pdma_provider(vdev->pdev, res_index);
>> +	if (!priv->provider) {
>> +		ret = -EINVAL;
>> +		goto err_free_phys;
>> +	}
>> +
>> +	priv->phys_vec[0].paddr = phys_start + ((u64)vma_pgoff << PAGE_SHIFT);
>> +	priv->phys_vec[0].len = priv->size;
>> +
>> +	ret = vfio_pci_dmabuf_export(vdev, priv, O_CLOEXEC | O_RDWR);
>> +	if (ret)
>> +		goto err_free_phys;
>> +
>> +	/*
>> +	 * The VMA gets the DMABUF file so that other users can locate
>> +	 * the DMABUF via a VA.  Ownership of the original VFIO device
>> +	 * file being mmap()ed transfers to priv, and is put when the
>> +	 * DMABUF is released.
>> +	 */
>> +	priv->vfile = vma->vm_file;
>> +	vma->vm_file = priv->dmabuf->file;
>> +	vma->vm_private_data = priv;
>> +
>> +	return 0;
>> +
>> +err_free_phys:
>> +	kfree(priv->phys_vec);
>> +err_free_priv:
>> +	kfree(priv);
>> +	return ret;
>> +}
>> +
>>   void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>>   {
>>   	struct vfio_pci_dma_buf *priv;
>> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
>> index c8f6f959056a..06dc0fd3e230 100644
>> --- a/drivers/vfio/pci/vfio_pci_priv.h
>> +++ b/drivers/vfio/pci/vfio_pci_priv.h
>> @@ -30,6 +30,7 @@ struct vfio_pci_dma_buf {
>>   	size_t size;
>>   	struct phys_vec *phys_vec;
>>   	struct p2pdma_provider *provider;
>> +	struct file *vfile;
>>   	u32 nr_ranges;
>>   	struct kref kref;
>>   	struct completion comp;
>> @@ -133,6 +134,10 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
>>   			      unsigned long address,
>>   			      unsigned int order,
>>   			      unsigned long *out_pfn);
>> +int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>> +				   struct vm_area_struct *vma,
>> +				   u64 phys_start, u64 req_len,
>> +				   unsigned int res_index);
>>   
>>   #ifdef CONFIG_VFIO_PCI_DMABUF
>>   int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> 


