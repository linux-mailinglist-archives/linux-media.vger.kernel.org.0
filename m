Return-Path: <linux-media+bounces-60845-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCYxDU7J/Gn1TgAAu9opvQ
	(envelope-from <linux-media+bounces-60845-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 19:18:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9824ECC8D
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 19:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD057301135C
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 17:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D4144E045;
	Thu,  7 May 2026 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="Qg6qXUNE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F384131F992
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 17:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778174279; cv=none; b=pXogg8R4hH5ZPo8EonZb86SIw8LZxcT5mCVTBJqVpjiVp/AhwF3F4F1T5eiWYfiqqNOsjOWmBm2qup3FA1bspcHpULWJCAWx0PyJfLFCTQUsnjJafn41jAlbqds7tRxpLr4hzkCYV8s01el0LgCP09yKxY3vax70cJgVh5kUOFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778174279; c=relaxed/simple;
	bh=U69rHVcbDuR5mmmicSB4hQ3en+h1EfcsrBH5MCfaye8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HNFa+cpogh/QNlfDehdp5rFL8PBbN8rhoNxCqKIm2yFWKzdEE4eg2mGrRl/AUeK6mQdXYgWPhjhXd8zrUzPWTwfkPMut5D8vX6nYY0fvedcybPAi/ylqAS4B99BRzl6eKY61npFzKCcVlVw/kFbQxoC09D/tIreVjsQ361pgs98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=Qg6qXUNE; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6474pl1X847968
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 10:17:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=2hseHusJHq4MxssvE9ph720WJzKkL0PdIQg2ntbbJzc=; b=Qg6qXUNE89L6
	+1ES/JHEoLIWulvpYZjGL9eLFRE+al8XgZoQ8YL/vXchbQbFrgU8ECcnx8vgaMhB
	GTxqwgWBviFZw2PcYYNaT1rfZofblWJNgGXEXTjDIybxE43ZtWQSvsNvmlX7vFO/
	0go7Uor9MuOCWiXaIbGZ2PKGWUYx60XssWozr1TyEmBZvoY/X8vkn1lSceRGZPfQ
	Su8oMk6xG+FtN054DdH+1h2blHvZqaHvayI8GoSnX83+ToBjab/+284lAwtmgqEG
	07naHNI1aSQw11PSjpb1QTqodKmpaVbNohVKeOsctRjkWzSfSxiMMguFRx/xw9th
	HExpZMTmKg==
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dx1wh6562-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 10:17:56 -0700 (PDT)
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43efc93e4f6so763769f8f.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 10:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778174276; x=1778779076;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2hseHusJHq4MxssvE9ph720WJzKkL0PdIQg2ntbbJzc=;
        b=CDvRozHp8NRmcdrpzi8dJr8B2vbJ91wzuErKxZQHgTy2nxiA0G/lEiJLeeBlUP7Gpw
         20pY8fCU0h+s5ypZ7wqHj1oL7KSl7iLUFLdrcWfRi9BY7ckcavasMuyb7mHKq8sRJcKl
         rT+P4d/WBH+kSmwqhX5tAOMpxWNcdMeUcf2b+H7yk+yvVsje7TX7J1a0t1XDf3pt23m+
         /kpg4rph7Phnpa9ECojD7mVCL3KY5yMP4j8J0jegKMn51rcyfaYCGI12JdyhkryEetHN
         jlqouAZdB67XNGbdsWOgY+Pqke5cfVoLFcJSk5F7M8qP1IGISW+vp0qqFFZon0Y/iP+8
         RWgw==
X-Forwarded-Encrypted: i=1; AFNElJ+VpnWbwo2PsYKfNfI0o2DtuSDtOkVj13qgEWPx+uZNmbGiz+gBplNkzhyUsoUVfTwTUCopqo3G8LPMpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQQL/vNW+ceGv1kW3lm5vFULykSmqD2HSHJUWH/+YZLxYW8/g
	xFWZ6e4eCDrKCvNDIjtm6Aj2we7QQDFpGySADwak/RCWys9QezKb506GQZhtYG2Yr+RkQgoFX5W
	oXciA3ev8u+BCDQW88u91TalyrVkfogmXAa022CiNIJgX7/pEEb4le0a3BhsQC7I=
X-Gm-Gg: Acq92OEXX2IiNey7s08zOLodm7bArhCiVXGQ9epizxHNL5bJYmLyXH0IICg1KSDUOUR
	4hbvsxJ4dwpWtiddkbujdeRIq2lkj1n6HUllVljbD2DeJyH9/X6VLwBnZtRyctMnHiB06P7pUry
	7Ig9nRjHvyZFh4zSLcYI0M66P43qjO8y/Ze1llItFFTlbQMkXlozAOJ8zdLpHLMPWLpIiWKumSE
	VXyh0WqVOuIbcxmwhGdKit/Mr9hryymvRYvXv+Ro2Zz6kbpWfN+uIc5nPUHtEFnmj5kScQLGf5T
	meWcHlwZuGT0i0iUSz0NQy7eP+9r1JIKnY6CoNE3RQgBCAWEZDauNvHpL8HIVb+8wcLsQN4K4fQ
	PNyZMmyqghbY1k4lLECCHZEBJLBQYKC662oBcVHmuLCU2TSJ945vjug575nrQHwPGNbNttzefxz
	ZIFtTWRkhrF0FzrSFtiH1ScSvZ1h4sLXGUJ1pZp2d6gnc7iNO2SxvfeNC9Y/cNpOFUM9jL8Ety1
	k6DKoVAGAhaJPaYr3q3HArbmskwBorsmQ==
X-Received: by 2002:a05:6000:2903:b0:43d:242:b9bb with SMTP id ffacd0b85a97d-4515b9f322fmr14370568f8f.18.1778174275483;
        Thu, 07 May 2026 10:17:55 -0700 (PDT)
X-Received: by 2002:a05:6000:2903:b0:43d:242:b9bb with SMTP id ffacd0b85a97d-4515b9f322fmr14370521f8f.18.1778174275013;
        Thu, 07 May 2026 10:17:55 -0700 (PDT)
Received: from ?IPV6:2001:8b0:8b6:13d4:102e:f2af:e074:5cde? (e.d.c.5.4.7.0.e.f.a.2.f.e.2.0.1.4.d.3.1.6.b.8.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:8b6:13d4:102e:f2af:e074:5cde])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4541282046esm408713f8f.8.2026.05.07.10.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 10:17:54 -0700 (PDT)
Message-ID: <afd17112-5d59-4a68-88ac-903616ed7dfd@meta.com>
Date: Thu, 7 May 2026 18:17:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] vfio/pci: Provide a user-facing name for BAR mappings
From: Matt Evans <mattev@meta.com>
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
 <7d370a5d-3730-42f0-8656-14ad9c0da682@meta.com>
Content-Language: en-GB
In-Reply-To: <7d370a5d-3730-42f0-8656-14ad9c0da682@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jt/Bas4C c=1 sm=1 tr=0 ts=69fcc944 cx=c_pps
 a=I6ewnrIBtnKHmb6SxpX7Vg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=kkcUborcUVj0H7zxAXTl:22 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8
 a=gEb6E3g4VIbv0AVgNvMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=MqNruPmfsT8GavliLQMe:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3MyBTYWx0ZWRfXweU2U5dEF7Z/
 0JhRfz3M31BXkjX6zSqDsY/8y5zAyBVnbxh87lBLoRNcXUoeRZ0kP4UjQ3VD/R8clRSZ/rKwx4A
 4it+HuXPaW9H/augFablt3F/ImVrldKkzVzSSV6NvmAtUYq8jYhd+BSDFc/swY9nJisaLTq87C4
 k5kCqX29RPlXCKvY6wDTGChJP50JbsSR3hlaQJn/BVS3Sco0g0YE1f3wd9jburFaa5frm65thw5
 n4XqdkJSvD13GZz174flpNNtkSIHkJpo3TvH/88KYoHcRoxqWTacXgFFOzcjZH3TnL8anIDCngf
 4RWDO7FvZqTyM8qiNW+tr/nxMUejuMsUfvg0NdrguUPkeawc6oLUq3muUw6yVleiA9J4jyONRJx
 U3r5e9ohF8N8bx3GxooQLoaNdLsb/xDErQVwwCPsXfpAjNYlUPP5x4GjJBlzol1idvBjgHqkG4T
 t8afxUzvaNHZUiN61rw==
X-Proofpoint-GUID: hBhpPDp3chWyqJsYCJGqs2evlKTqzn-D
X-Proofpoint-ORIG-GUID: hBhpPDp3chWyqJsYCJGqs2evlKTqzn-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Rspamd-Queue-Id: CE9824ECC8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-60845-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,meta.com:mid,meta.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Sent too soon, :|

On 07/05/2026 17:56, Matt Evans wrote:
> Hi Alex,
> 
> On 01/05/2026 23:44, Alex Williamson wrote:
>>
>> On Thu, 16 Apr 2026 06:17:48 -0700
>> Matt Evans <mattev@meta.com> wrote:
>>
>>> Since converting BAR mmap()s to using DMABUFs, we lose the original
>>> device path in /proc/<pid>/maps, lsof, etc.  Generate a debug-oriented
>>> synthetic 'filename' based on the cdev, plus BDF, plus resource index.
>>>
>>> This applies only to BAR mappings via the VFIO device fd, as
>>> explicitly-exported DMABUFs are named by userspace via the
>>> DMA_BUF_SET_NAME ioctl.
>>>
>>> Signed-off-by: Matt Evans <mattev@meta.com>
>>> ---
>>>   drivers/vfio/pci/vfio_pci_dmabuf.c | 27 +++++++++++++++++++++++++--
>>>   1 file changed, 25 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/ 
>>> vfio_pci_dmabuf.c
>>> index a12432825e5e..04c7733fe712 100644
>>> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
>>> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>>> @@ -4,6 +4,7 @@
>>>   #include <linux/dma-buf-mapping.h>
>>>   #include <linux/pci-p2pdma.h>
>>>   #include <linux/dma-resv.h>
>>> +#include <uapi/linux/dma-buf.h>
>>>   #include "vfio_pci_priv.h"
>>> @@ -467,6 +468,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct 
>>> vfio_pci_core_device *vdev,
>>>   {
>>>       struct vfio_pci_dma_buf *priv;
>>>       const unsigned int nr_ranges = 1;
>>> +    char *bufname;
>>>       int ret;
>>>       priv = kzalloc_obj(*priv);
>>> @@ -479,6 +481,20 @@ int vfio_pci_core_mmap_prep_dmabuf(struct 
>>> vfio_pci_core_device *vdev,
>>>           goto err_free_priv;
>>>       }
>>> +    bufname = kzalloc(DMA_BUF_NAME_LEN, GFP_KERNEL);
>>> +    if (!bufname) {
>>> +        ret = -ENOMEM;
>>> +        goto err_free_phys;
>>> +    }
>>> +
>>> +    /*
>>> +     * Maximum size of the friendly debug name is
>>> +     * vfio1234567890:ffff:ff:3f.7-9 = 30, which fits within
>>> +     * DMA_BUF_NAME_LEN.
>>> +     */
>>> +    snprintf(bufname, DMA_BUF_NAME_LEN, "%s:%s/%x",
>>> +         dev_name(&vdev->vdev.device), pci_name(vdev->pdev), 
>>> res_index);
>>
>> Comment suggests 9 is the max res_index that can be printed, but mmap
>> only directly supports standard BARs 0-5.  Comment also uses a '-'
>> while the code uses a '/'.  Thanks,
> 
> Right you are.  Fixed, but, since...
> https://lore.kernel.org/kvm/52162da4-e1cc-4f90-a95a-218d6089cd71@meta.com/
> 
> ...I'm keeping the resource index encoded in the vm_pgoffs and as that's
> in /proc/<pid>/maps it doesn't need to be in the name. I.e., an example
> mapping of BAR 2 looks like:
> 
> ffffa9330000-ffffad300000 rw-s 20000030000 00:0b 12 / 
> dmabuf:vfio0:0000:00:03.0

BUT, the name's visible via paths other than just /proc/<pid>/maps, e.g.
/sys/kernel/debug/dma_buf/bufinfo or /proc/<pid>/map_files which don't 
have the vm_offs, and so back to plan A.  Just made the comment consistent.

Matt

