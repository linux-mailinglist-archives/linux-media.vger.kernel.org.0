Return-Path: <linux-media+bounces-62045-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDhRL9xFC2rgFAUAu9opvQ
	(envelope-from <linux-media+bounces-62045-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 19:01:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E14D5715CC
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 19:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC3F330F4500
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CFB4921A4;
	Mon, 18 May 2026 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="XN8JeS87"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3977C494A1A
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123304; cv=none; b=n3FUSWg/cQShYWdyjRsAkM8JrrXdYxRLXqri5u6JFRUol6F7xXPer0R/+amNjNSOAX3ABhgbp5eVVo8AgaFpUrwjJ5MXttiVBq5V+PydVCzlw4gnEWTvU/4/fT5T9fIfIBPMH8RdBmcWpurIzjoXPysJmoHN6oM1SZ2gJOP89wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123304; c=relaxed/simple;
	bh=uLzwi/WCQNnI3a9r0Mor6iinE3d+0njf87UPy8a7WLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sGbA+HfDFodkUkpl2b9Dg8GvGCICMC3ifuf1Zu1J8SBYkodeivlfO3ta/uiwJn77PiVoUwQ7nKUYkdvTUTrrxihPmyVj+1OExclrM7eQ6c47iU38TxB0+Km7olRm847KklWWeAVSLhvm2/u7jKZ+JRSqF87apwmjl48SFLB8xxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=XN8JeS87; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HNI4d61449052
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 09:55:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=ZLY9yfLbRBjpxy+2SZZ2QJ1skamsrrS9MpjOO7Diwus=; b=XN8JeS877jEd
	EB+ZxD27YIsRCiVSeSY3lAZcZeFfFdxQF+qfF4CTddtmCk+K2U3049kfL4nFlmH7
	SL3cBbF1DhT0/mKioDrKiQNuR8X/wF49z9HY/X3ZO25Px96ZXMmw7UGd0yozk487
	BHNo/ja8XUZxE3NcwBWwhA5pmfG/2rItk5Uheyxl/ozsVbHucAmJ+60On9h5ljfT
	gsTgOrcXmoUn6KVcUVg0XrKksIyHrs9ANc/am9s32d/a/zIvHdMsuKPx/fJ1J80A
	0nwLeVfHhVfOp9GSZfmcFsGcbp6H2Lm7tfODKhxJrvgT4pMpk4jYBf7t481ofi8A
	u89jy8cs2A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4e797hpwnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 09:54:59 -0700 (PDT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ef62078ee7so3480958eec.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 09:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123299; x=1779728099;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLY9yfLbRBjpxy+2SZZ2QJ1skamsrrS9MpjOO7Diwus=;
        b=jJ8oILv3GcRtYOxFLndvxdFOTxiNEcDn8tLCUVZ6Hq6bdaSYDU9ZcdwiF/gPt1WnG3
         PLxOHa/IBO6jbmbpEZum2xQEiYyF2VrpP4OkIdzLP9iNqv/0GLt+cGJSaacI2B4tukzx
         EtjnI+X+hv6pUlLTG3ARkyKlUCsnfTBJ2Lh/B1cKzqv0bztqCrYiMK0qhenz467mpNIl
         h2zFyii7PmbYPstY3qWOkEUoT8gx288Tqc6IL5bOGsLfcIVmtc0Y0n2W5weH5E/TQzwz
         I5qAdfctTYrnu8SN4QSZGenl1QsZXgGBSMV9tW5wsLc71HOgNB61NYyrgr1r7uUuxzSN
         0uJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DL0/Ow4LzWN2VgObnCWLvf3u/xeAnsYZFUzjI1DW9V9MLIfFQimpa+gK9vZenYA6Orl85VTDuUURHmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGiJfpD0jFEK9dr+zM5MD6hOrd5KyGEjypk1z90/6vTuSHhdB/
	SBVFBV+/I+AP5fk/7gbaPa76b2/v0kSdZ3PMJWN9jbj2Q+r0ASl6setlr11J7P1MSeZhaz7j1AR
	hIl+kOdE1VgQsHUErVYg3fe+Qtqw7koG0yjcFGg0Sr3RdLlkK7zlmJ/bkEZO1K70=
X-Gm-Gg: Acq92OFuTBrXvSUWnOXCgCdttflsBwNuC0zf2P4KbbVCimELOuomqwpfGAR3QtUx6oH
	j+0i+xtypz+mdjBi4Q1y72qm1uYGP3DstTPXVYednECkoKu3zx4ZWs2vMPUxo6StTQQyfkXjciD
	gVIga9ErtTYHLboJfaz64fT0pBts1AUaOoSwTPqRhvDYYt3RconMRyF6cGH+EjWIcAYfprPlXjJ
	U/upIRg/QNZEDfKlKcoPW0q9WhSHvOg18fpxJKf2Rphkmunb7gXcGNUmTGE8V/RGddERLOpDvWG
	fRxjuLRETuTRPc381AN/hH1V0KXjPry4rAKmE7KchVImGOx13FL+TbsC0ihU2uDBEuhghZJbINS
	CyopzHBDwv8MieGHoREWoHUk55D4/7w==
X-Received: by 2002:a05:693c:2c8e:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-303986b0490mr6401862eec.30.1779123298670;
        Mon, 18 May 2026 09:54:58 -0700 (PDT)
X-Received: by 2002:a05:693c:2c8e:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-303986b0490mr6401843eec.30.1779123298106;
        Mon, 18 May 2026 09:54:58 -0700 (PDT)
Received: from [10.0.40.30] ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm15797561eec.15.2026.05.18.09.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 09:54:57 -0700 (PDT)
Message-ID: <e90b20b7-3189-4395-b2a8-6391b5958936@meta.com>
Date: Mon, 18 May 2026 17:54:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] vfio/pci: Clean up BAR zap and revocation
Content-Language: en-GB
To: Leon Romanovsky <leon@kernel.org>, Alex Williamson <alex@shazbot.org>
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
 <20260416131815.2729131-7-mattev@meta.com>
 <20260501171919.42659174@shazbot.org> <20260505105822.GC11063@unreal>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260505105822.GC11063@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NiBTYWx0ZWRfXwXR4Mxq6afPo
 4RIDWMmJeZfCHpNx4zMc0hQ34ryxUZ0rdmYhb5fa6YAO1vuVXzIZ9uFNr57vyA7wL0SrR9f101d
 SucCuBLC1lWAuoq2y+f4UrMX46bikVSi5aMJXiR6APycvlBmmmdi1k50NdRAE6m/e/d4HsYqBQG
 ryH10xzi6UJKYIDFviM+0aUKcwIioh2KERQl/Yaq3EDqFk6xFWdS1qW0VMBU1Kq2NCdA1UguDqf
 fv0HMKQwBf/Nc4iyviYBDSGjoqeR+znm7jCgbhz26EOQAidHk6B2myZtyBDZ+73JF2vDXErl3FI
 G1LD/byM5OW4rc57a3uezw88cyqBijdGnqAZD1PcH+l5yv5o/1+YXcmsjDH5rWutR+os435fSkV
 NgRX7vlbNf3gbrdMVoyZXuBW7x84KtKuSL0+vHJliLq7eQWYCcPVXr4LRHl24I4bDOpoWDO4RVC
 ZiePsLo4uu968ATBuCA==
X-Proofpoint-GUID: wqouDqPrlrBY9kvsGuAgeSmwRU8AB_DB
X-Authority-Analysis: v=2.4 cv=VscTxe2n c=1 sm=1 tr=0 ts=6a0b4463 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=2UbFsIa4v//lIgRL4kGwwA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=kkcUborcUVj0H7zxAXTl:22 a=VabnemYjAAAA:8
 a=GEBLkO6eNKYXaKtmIbgA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: wqouDqPrlrBY9kvsGuAgeSmwRU8AB_DB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62045-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,meta.com:mid,meta.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E14D5715CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Leon, Alex,

On 05/05/2026 11:58, Leon Romanovsky wrote:
> 
> On Fri, May 01, 2026 at 05:19:19PM -0600, Alex Williamson wrote:
>> On Thu, 16 Apr 2026 06:17:49 -0700
>> Matt Evans <mattev@meta.com> wrote:
>>
>>> Previously, vfio_pci_zap_bars() (and the wrapper
>>> vfio_pci_zap_and_down_write_memory_lock()) calls were paired with
>>> calls of vfio_pci_dma_buf_move().
>>>
>>> This commit replaces them a unified new function,
>>> vfio_pci_zap_revoke_bars() containing both the vfio_pci_dma_buf_move()
>>> and the unmap_mapping_range(), making it harder for callers to omit
>>> one.  It adds a wrapper, vfio_pci_lock_zap_revoke_bars(), which takes
>>> the write memory_lock before zapping, and adds a new
>>> vfio_pci_unrevoke_bars() for the re-enable path.
>>>
>>> However, as of "vfio/pci: Convert BAR mmap() to use a DMABUF" the
>>> unmap_mapping_range() to zap is entirely redundant for plain vfio-pci,
>>> since the DMABUFs used for BAR mappings already zap PTEs when the
>>> vfio_pci_dma_buf_move() occurs.
>>>
>>> One exception remains as a FIXME: in nvgrace-gpu, some BAR VMAs
>>> conditionally use custom vm_ops, which have not moved to be backed by
>>> DMABUFs.  If these BARs are mmap()ed, the vdev enables the existing
>>> behaviour of unmap_mapping_range() for the device fd address space.
>>
>> What's the plan here?  Is this a temporary FIXME or a place to prove
>> that dmabuf for mmap works beyond the core use case?

The larger picture is that I havne't converted the nvgrace-gpu driver to 
use DMABUFs for its custom mmap/fault handler code.  (It's not 
straightforward to test, so I don't want to hack that.)

This FIXME is added to vfio_pci_zap_revoke_bars(), saying that for this 
specific sub-driver (or any others that do custom mmap) they still need 
to flag so that this wrapper still performs the unmap_mapping_range().

>>> Signed-off-by: Matt Evans <mattev@meta.com>
>>> ---
>>>   drivers/vfio/pci/nvgrace-gpu/main.c |  5 +++
>>>   drivers/vfio/pci/vfio_pci_config.c  | 30 ++++++--------
>>>   drivers/vfio/pci/vfio_pci_core.c    | 62 +++++++++++++++++++----------
>>>   drivers/vfio/pci/vfio_pci_priv.h    |  3 +-
>>>   include/linux/vfio_pci_core.h       |  1 +
>>>   5 files changed, 62 insertions(+), 39 deletions(-)
>>>
>> ...
>>> @@ -1229,7 +1228,7 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
>>>   	if (!vdev->reset_works)
>>>   		return -EINVAL;
>>>   
>>> -	vfio_pci_zap_and_down_write_memory_lock(vdev);
>>> +	vfio_pci_lock_zap_revoke_bars(vdev);
>>>   
>>>   	/*
>>>   	 * This function can be invoked while the power state is non-D0. If
>>> @@ -1242,10 +1241,9 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
>>>   	 */
>>>   	vfio_pci_set_power_state(vdev, PCI_D0);
>>>   
>>> -	vfio_pci_dma_buf_move(vdev, true);
>>
>> This seems subtle enough to be troublesome.  I wonder if Leon didn't
>> intentionally place the dmabuf revoke after the device is in D0 to
>> allow the driver to interact with the device.
> 
> My intention was to place vfio_pci_dma_buf_move() as close as possible to
> pci_try_reset_function(), so the device is known to be fully operational
> at that point. It looks like calling it after the transition to D0 is the
> right ordering.

Thanks for that, I had missed that need to have D0 at the time of the 
revoke.

Getting the lock in the existing place (before D0 set) but doing a 
separate vfio_zap_revoke_bars() here (replacing the bare move) seems 
right, though for the sub-drivers which still need the zap (nvgace-gpu) 
then the unmap_mapping_range() would happen after the D0 now.  I believe 
this is OK, but I wanted to flag that difference.

Many thanks,


Matt


