Return-Path: <linux-media+bounces-60844-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBBtEE/E/GnSTAAAu9opvQ
	(envelope-from <linux-media+bounces-60844-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:56:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0752D4EC8A9
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0DFE3301AA56
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 16:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F21451044;
	Thu,  7 May 2026 16:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="qL/Obi5d"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC7A3E6DED
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172977; cv=none; b=A9tDXJK98JjCkEi8YE+ij27FLME+RpfnDyUfWY6CRdT93uvbw0ZDM1eeZ2u2X0Jh2SLnj43NPRjQCCSOCBmjB6VvhKOYeaAgcXfuNvLJ/6tzcGfe6PBkbIpjjq6PUOC8JLCeL9HquPfbz+0Stv0qYtLLcImy2hF8tyy5SGFOcyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172977; c=relaxed/simple;
	bh=+2wx6vKDw+c0VU0AZTmqbnZRdl3cwkeppMWHRhyO0Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/tZ2SyxTeSZWB0HU+320157lxDkGioCrQSBRPVjFTgSfk3jZLTfXMa7wb06uEpgtMY91BI5WhlVUMsXFhyT7oHfP8ROctr7IFaBKoUjNGVBcldzplFNUgLOyzxADyYvav09JArJkeY7TNZi7WeVNctEA5p2dPNnEnXhFqb9haM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=qL/Obi5d; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646M9uBL2489306
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 09:56:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=AStKs7gIf+H7qi7ZzQdIOFiCgW57yK3MpNAkRUF2is0=; b=qL/Obi5dvBwt
	i9c2sv9SNtqXpLw63YE0iVFyLwL6b4BaMhACgc6cvxDCuo+iXEgY5AqcK8DYXOfG
	Oy2Cy3R2kU+21KVGKEdcKnO+JORfiteK8SES7tlFIxyrNJzXgNQnK5HgJvFp3gp9
	ZnR3EfXRenjXlRDNZApwgtgRy4IabZdUKVivNibPvjxRcMi9IvB0Db0W3LQCsLet
	oDdCWe82S8Q9Od6e/B0LJxAkBUtfBo3NK8J9ZB1phV+Om3BTlNLhHQh4kwQdPjrt
	Yeq/XkO+njD2M7PWY6DdNkD4qHPoIjFPhOFiwolRaAFuyZWZzKXpW4t5P5TGgTnF
	1qzC6F8MXg==
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dwck21gj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 09:56:15 -0700 (PDT)
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48d104d1d8aso5959295e9.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 09:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778172974; x=1778777774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AStKs7gIf+H7qi7ZzQdIOFiCgW57yK3MpNAkRUF2is0=;
        b=PP2q+jNS4TK5y47iYkk3qpn+gi3izUn2XDmkGcTCRDzMULw6FU2cKJIBPvLwEo6T9y
         X4xV0du6169gW2Hj1+e7/kpGmfY848TovwmLu6KasbTM+5FRWmV92RPrVERbb505lEqE
         oZ79+D4tt2YzQqjI0EBjCEu8P0x94Xl45d/LnKDo1+aWtrHJKNVDKWcklCDx3wk2Ikld
         aX9xwNGaRDm35dW0lIf8htfhEuHPZuGxxiSUGNci6bXOsmiphElZyO3qGIwP0mOIKhCR
         dODEci0kEbX4MD3cxjxqEWCQ2hoHPBHRw0y+ED8mRurQ0IMB4yRB/7PiF6xe8sQYO8KP
         3FLg==
X-Forwarded-Encrypted: i=1; AFNElJ/sddURnv5g7e2Vzv21Tc6QrH8CEVwb1EU+Pb4Nm1TRkJqfuYYumZZlLm3AB5PjekHyaYVy6fFG3Ec4XA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/dz7dlKTl0L9JSDglEuEHvLL+MLIsAXcBvda4DTQjAlMU/6f0
	2Qu6P6LrmyKBOLQBg/g2vo82eqnTrhtb5JyfFOeIvUKwKpw+Y2xaAg9/VxrV+NZ5HAILGfzedlD
	sckuzp83SislGfKpPhm9YoMiOuBQ2lO/8nIz5L69Hsav6PqyDYEtQ04QLzdknMPE=
X-Gm-Gg: AeBDieue78V0RBt1ztRmIkhSRK9TQYPbW7OX3vHdrXAuCyOhkj+h0kA/MgIv0VyOV4b
	6i04ruzwYrx4OuBZzpgL8Gs+blJ1X/Snb0PoZ1//VUitmXfr1/SQLQ5RJA65oj+hV/nDRJjJPvY
	hOgGZHyyT4dGkXxmoTFYw2Zy5ddEqOKCt2ca/7fZaeBE1rtJgCBIDOwvX/5wa6m5/NIoRuPc2gr
	ga09Tel1JtbOde0eZjd+T/h/hivJz3ak/vsLppkMztTTrduq2LxX6gf0qHTJtg9Lf1T4bIO0tVE
	jj/D8pXQexKWG2D+6i7w0CPNIudEjuecJKXcdLvbBMAwCG6DN8JiG741kMdClXeeRJ6kW89hvDg
	jyLULQSo6ino+sk6CMc+l8lGXFOcLlZa/CXHGQal9P3MWiU0DsmiC7VYW2WOxvXtJoz4B9oLpoV
	bpQPuRo3JJ6w2nV0VytBBQFmnauJi6EPlJd3SV1HyeTqRUUCzsg2JA6CT/CceLKwG2VxkMBYLtI
	5geTjMBfziHxbs/6XRId6o=
X-Received: by 2002:a05:600c:4e0c:b0:48a:55d8:7882 with SMTP id 5b1f17b1804b1-48e51e16e58mr154923265e9.9.1778172973516;
        Thu, 07 May 2026 09:56:13 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0c:b0:48a:55d8:7882 with SMTP id 5b1f17b1804b1-48e51e16e58mr154922585e9.9.1778172973017;
        Thu, 07 May 2026 09:56:13 -0700 (PDT)
Received: from ?IPV6:2001:8b0:8b6:13d4:102e:f2af:e074:5cde? (e.d.c.5.4.7.0.e.f.a.2.f.e.2.0.1.4.d.3.1.6.b.8.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:8b6:13d4:102e:f2af:e074:5cde])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e642f8d32sm369175e9.25.2026.05.07.09.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 09:56:12 -0700 (PDT)
Message-ID: <7d370a5d-3730-42f0-8656-14ad9c0da682@meta.com>
Date: Thu, 7 May 2026 17:56:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] vfio/pci: Provide a user-facing name for BAR mappings
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
        kvm@vger.kernel.org
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-6-mattev@meta.com>
 <20260501164430.5d3ea683@shazbot.org>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260501164430.5d3ea683@shazbot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3BY5OVHOWjKUggjlmG5Z_K7tUfymrh01
X-Proofpoint-GUID: 3BY5OVHOWjKUggjlmG5Z_K7tUfymrh01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3MCBTYWx0ZWRfX06F43wgT+0MZ
 ONN+yv3rEfmmFvWucHmv2iV3MXTMvBhtmWmLH339fI7bSwakJ5dqhpx2H4RbIVzl/FcQEHPuW1M
 7pnSor86vYfb1Gk21qHtn/qRET2xnrmu6sa34Nro6pns3veFFUxdBFWYZDjr4VBIkRjnNSNTWMp
 jAUfnewXp0mgVr1fdNRRdt7PI5W4HM9/umXmXMJV2iAai1L+/JI6X4UFZn6A3DdslNvBjz8WKBt
 4XyKAUfri7zlJLNsEu4AvRkmbsVGAslvaFbYsZFHnQAfpNaWCOJNmCmwJY2IcLRiyR2GTGAWrLP
 0fp6fZf3SZ8nhTvA3mrodGrvuYrhFg1AcNN6HBid4kb5zVNo+qzIbur2+g5Hr2JOTQHihKo71dT
 qXwdyHoO3qYC84PG4U11Adx74CoSePH3eKVVTtfpc+1fPPnUKob4OZpDFeb5NBtoZcrVY3Bv2PP
 /pjmKEZKL5q8koWRkcw==
X-Authority-Analysis: v=2.4 cv=Pu+jqQM3 c=1 sm=1 tr=0 ts=69fcc42f cx=c_pps
 a=ocXdEHcuFBd2kx0v6vcWqw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=8elwO82fXORLTBIkMd32:22 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8
 a=L20xLjZDwgROH_O_AugA:9 a=QEXdDO2ut3YA:10 a=XRP02QYyWapGEjE7oHHB:22
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Rspamd-Queue-Id: 0752D4EC8A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60844-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Alex,

On 01/05/2026 23:44, Alex Williamson wrote:
> 
> On Thu, 16 Apr 2026 06:17:48 -0700
> Matt Evans <mattev@meta.com> wrote:
> 
>> Since converting BAR mmap()s to using DMABUFs, we lose the original
>> device path in /proc/<pid>/maps, lsof, etc.  Generate a debug-oriented
>> synthetic 'filename' based on the cdev, plus BDF, plus resource index.
>>
>> This applies only to BAR mappings via the VFIO device fd, as
>> explicitly-exported DMABUFs are named by userspace via the
>> DMA_BUF_SET_NAME ioctl.
>>
>> Signed-off-by: Matt Evans <mattev@meta.com>
>> ---
>>   drivers/vfio/pci/vfio_pci_dmabuf.c | 27 +++++++++++++++++++++++++--
>>   1 file changed, 25 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> index a12432825e5e..04c7733fe712 100644
>> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
>> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> @@ -4,6 +4,7 @@
>>   #include <linux/dma-buf-mapping.h>
>>   #include <linux/pci-p2pdma.h>
>>   #include <linux/dma-resv.h>
>> +#include <uapi/linux/dma-buf.h>
>>   
>>   #include "vfio_pci_priv.h"
>>   
>> @@ -467,6 +468,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>>   {
>>   	struct vfio_pci_dma_buf *priv;
>>   	const unsigned int nr_ranges = 1;
>> +	char *bufname;
>>   	int ret;
>>   
>>   	priv = kzalloc_obj(*priv);
>> @@ -479,6 +481,20 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>>   		goto err_free_priv;
>>   	}
>>   
>> +	bufname = kzalloc(DMA_BUF_NAME_LEN, GFP_KERNEL);
>> +	if (!bufname) {
>> +		ret = -ENOMEM;
>> +		goto err_free_phys;
>> +	}
>> +
>> +	/*
>> +	 * Maximum size of the friendly debug name is
>> +	 * vfio1234567890:ffff:ff:3f.7-9 = 30, which fits within
>> +	 * DMA_BUF_NAME_LEN.
>> +	 */
>> +	snprintf(bufname, DMA_BUF_NAME_LEN, "%s:%s/%x",
>> +		 dev_name(&vdev->vdev.device), pci_name(vdev->pdev), res_index);
> 
> Comment suggests 9 is the max res_index that can be printed, but mmap
> only directly supports standard BARs 0-5.  Comment also uses a '-'
> while the code uses a '/'.  Thanks,

Right you are.  Fixed, but, since...
https://lore.kernel.org/kvm/52162da4-e1cc-4f90-a95a-218d6089cd71@meta.com/

...I'm keeping the resource index encoded in the vm_pgoffs and as that's
in /proc/<pid>/maps it doesn't need to be in the name. I.e., an example
mapping of BAR 2 looks like:

ffffa9330000-ffffad300000 rw-s 20000030000 00:0b 12 /dmabuf:vfio0:0000:00:03.0

Thanks,

Matt

