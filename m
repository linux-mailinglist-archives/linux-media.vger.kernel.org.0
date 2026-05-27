Return-Path: <linux-media+bounces-62920-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOSyHFImF2qu6wcAu9opvQ
	(envelope-from <linux-media+bounces-62920-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 19:13:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1B35E83B9
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 19:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 274E5303AF81
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 17:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D2844D01D;
	Wed, 27 May 2026 17:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="kbPRowui"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B9E42316B
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 17:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902019; cv=none; b=foFqiiP5L2X3hO3CrmZYAh0AesRL2a5Y8CKF+ddj06sDIUWXZJbLzXO/h3NPsbZcj18goetCS/MNhXl+IcXz8E5xTHd6M90hjDlKdLpX3clofd85PfeIkp7KNKbxmOL/GXAeMoTdyWV+yw6XBzN3r13KsNd1/ACovulNkfGjnRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902019; c=relaxed/simple;
	bh=sUh2qgnb1rvjNwwYWycAZ+HszzMtG96sy5yb7iUgUrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXJcv6Jbl06g0tDe3CwR37acRGrEj/YpwYVG4X9NI9+1rQk2UW0kqt+r9FEuMsQdsoGIHQPzFT5C71u5MleImDpcoTh2uNgeYADGmeaPGJv+tkCS8x9IptzsNoWUd1DV5ou4WFQubGLZQ7KSG5SL07332Wwi9vQJKoRebGEw3sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=kbPRowui; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 64R2Ee04742860
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 10:13:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=mF5ddP6Uato8c/uzw9iXykGIYPHqrtpIex8OCXzcenM=; b=kbPRowui4ML0
	YT114Vj1aVyNdnJJnjW848sZsqDgsQYxXf2af4lfe3yF9FH23tSklBFjrFv+o1wO
	ucJMCKwm9TylaOZQY0BhdJmQkngp6DAyA55R8lVRUQsexRgIwmUgj+H/mCR04y4k
	/GAEdHJqvYT6gQSouuHInLdwLedo/MVWAuYOky/jMujuavyWL/YFHal9G71FuvZm
	tUxMcxI1AwosqBr40clgGXAGZXRDcjjOD1Jq/WacVJpLsQehhEaY4Ed2cuHf56jB
	IOS9EOaVolYK/24AqeQ1zfm7jhCYBImKoLNKwH7NA+wFXFoDOJcUcF7lf4ehsFGn
	OeD1ICtoLg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by m0001303.ppops.net (PPS) with ESMTPS id 4edpugmc88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 10:13:32 -0700 (PDT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1353a6f29deso12826547c88.1
        for <linux-media@vger.kernel.org>; Wed, 27 May 2026 10:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779902011; x=1780506811;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mF5ddP6Uato8c/uzw9iXykGIYPHqrtpIex8OCXzcenM=;
        b=pRAts+EQA7bFQKTkHyLFj2R+0+p5w3slLdvL4bW09ToGon92IbjhLXRlXsWcwPt9J0
         9HdF3bKR/r5PoGhXhRJS85jbf0tO6XVk4lshnDCgHW1XDOZ+A/iUT8iz9Xs8p2lKKrwH
         1/gY75m3DRTsB1EAdXwywU2h4j9/Xeyc/Dm/M9GEGfoB238dekuAgOaw9exR9ds5UZmz
         GaLelrGnl9SWqWxp9wZBjVA9mliyDSjw11gOJXJK6LzDgyp0I61BsrJ3G4Qkd3B7y3pc
         yyZpSS4EYXji0oqg1Nsiq80DlgTPBXkXtF8D7xkaWG/yX6GMUbL2ZS+N8ZQPuvDqfyRm
         fMkw==
X-Forwarded-Encrypted: i=1; AFNElJ8VBOJGLYd5B3nDtTwLPCXiudNBJ5d6KPmLNQJTTFvUvR2YiccuQEqAYOoj39agIiTYDgFrwddWnYLBLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR1LU3t9FZE9CeXMcBwCautVhbFSwo/sC/s3/16+poMmcVZI7i
	Fqyu12LkpA/dSHZ+PcoAGkqwf17CTgAtUsnYgGT9bl2gqLBaKGnKP+5/pMruByRZlwSA+YnDKwT
	iacVH+9FzI4C5VSNA95K+PHh2JEmjdP9tZEnz9SiLC9HplpGQIm8ks2vrdEia19k=
X-Gm-Gg: Acq92OFBNSHSZUy2Cv5krH0pHimv3qP3dDm5AxUWVCBWPl/q3srJL8HYNTjW7tJV3cx
	eLjReVWePBJO35FONIC3ucORqQyipqIg/xOAqDsY28BWMw5a8R9LDTltUEh5yq3so22ILcZC6za
	i9RVNXZ+D1G1CgQf/vRhTi2uY83CwvXgh7lNBjVoQncwpDgIYHWLiydAoaAVrf5InwBS7xWgpIl
	fOIeIjw2cydkin0txz9yVYZIvOrpVqw+Ueg8rwJmmixRnEbCp4w3upLA6R3dCTL3TkpPSaosdxQ
	52XvUmLl/f6r9AXK8zcRrKiTIujLr8Bs0nLWbubTbKnHuouMpX/1bKZCfAYPo2Dfq+XxOcp/PBP
	HNZYP9QHE6II1F8BrUMJxUg/PCeCIVcBuqOc=
X-Received: by 2002:a05:7022:913:b0:135:e814:d03f with SMTP id a92af1059eb24-1365fc7d7e9mr8777512c88.36.1779902011320;
        Wed, 27 May 2026 10:13:31 -0700 (PDT)
X-Received: by 2002:a05:7022:913:b0:135:e814:d03f with SMTP id a92af1059eb24-1365fc7d7e9mr8777489c88.36.1779902010729;
        Wed, 27 May 2026 10:13:30 -0700 (PDT)
Received: from [10.0.40.30] ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-136b3706ad6sm9223289c88.13.2026.05.27.10.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 10:13:30 -0700 (PDT)
Message-ID: <1f1b9967-7182-401c-ac30-373b73216e81@meta.com>
Date: Wed, 27 May 2026 18:13:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
Content-Language: en-GB
To: Logan Gunthorpe <logang@deltatee.com>, Alex Williamson
 <alex@shazbot.org>,
        Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
        Alex Mastro <amastro@fb.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
        Pranjal Shrivastava <praan@google.com>,
        Alistair Popple <apopple@nvidia.com>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kvm@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260527102319.100128-1-mattev@meta.com>
 <20260527102319.100128-2-mattev@meta.com>
 <843e8525-5927-45b5-a3e2-a5ec16234398@deltatee.com>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <843e8525-5927-45b5-a3e2-a5ec16234398@deltatee.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=6a17263c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=2UbFsIa4v//lIgRL4kGwwA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22 a=VabnemYjAAAA:8
 a=gXLdhW2jAAAA:8 a=1nsJja_hzN5yKYYIz30A:9 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22 a=Dn9eIPSr_RzuO0KTJioD:22
X-Proofpoint-GUID: C0Mt4xoD1YU-J_k12b5ujYfaOtVetU_Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE3MiBTYWx0ZWRfX5KAGs77c8yeJ
 g0RdyfN0s/XHKnAP/VCfYChtL+V4XLJmzpcyw+9p1/HQ/nQDNhO7mfnBmMXcaqAKYC/I7HWI8c0
 sjbXz92dPfOVtjsPP9yCkDHBKpasAJbDXdaYF8dZjgKFPLwvd4gteNef4n6BAcL0U9JyiWvnNG1
 knGNJXZfR9l2mGxO/PFBkRvvZDiQRGAmlr4Xu08oPFzxbFNC+qjCciFUzlLUnl1rAGgXS+Th+R4
 gZqWxIpl2mDPwAlFRtCtvcA949kj2ReHLh4iVx+J4E18wrhMl+h4YOaNJxYT96/HgCHumlC2Mf3
 TRhcYqzuPgfeVTzv5bXSMufr+IbLDHip/QwwzFwGe0bFI7iHt5nhU7LiWKHMyHKy3vkualcP3F/
 Wo8PShU5+tN0W9s0froijCDEksRjFRzngojBDLUFI/I9uN6G34TbSrag3IeoysblZ32BXp891Lm
 a+MLjfQSJwFHJJ3g2fw==
X-Proofpoint-ORIG-GUID: C0Mt4xoD1YU-J_k12b5ujYfaOtVetU_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_03,2026-05-26_03,2025-10-01_01
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-62920-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,meta.com:mid,meta.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,deltatee.com:email];
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
X-Rspamd-Queue-Id: 0B1B35E83B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Logan,

On 27/05/2026 17:07, Logan Gunthorpe wrote:
> 
> On 2026-05-27 04:23, Matt Evans wrote:
>> The P2PDMA code currently provides two features under the same
>> CONFIG_PCI_P2PDMA option:
>>
>>   1.  Locate providers via pcim_p2pdma_provider()
>>   2.  Manage actual P2P DMA
>>
>> Other code (such as vfio-pci) depends on 1, without having a hard
>> dependency on 2.
>>
>> A future commit expands the use of DMABUF in vfio-pci for non-P2P
>> scenarios, relying on pcim_p2pdma_provider() always being present.  If
>> that depended on CONFIG_PCI_P2PDMA, it would make vfio-pci only
>> available if CONFIG_ZONE_DEVICE is present (e.g. 64-bit systems), even
>> when P2P is not needed.
>>
>> To resolve this, introduce CONFIG_PCI_P2PDMA_CORE which contains the
>> basic provider functionality to make it available even if the
>> CONFIG_PCI_P2PDMA feature is disabled or unavailable due to
>> !CONFIG_ZONE_DEVICE.  Users such as vfio-pci can enable their own P2P
>> features based off the original CONFIG_PCI_P2PDMA (available when
>> CONFIG_ZONE_DEVICE is set).
>>
>> Signed-off-by: Matt Evans <mattev@meta.com>
> 
> Largely this looks good to me. I have one minor nit below that you can
> apply or not. Either way, feel free to add:
> 
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> 
> 
>>   static void pci_p2pdma_release(void *data)
>>   {
>>   	struct pci_dev *pdev = data;
>> @@ -241,11 +251,13 @@ static void pci_p2pdma_release(void *data)
>>   		synchronize_rcu();
>>   	xa_destroy(&p2pdma->map_types);
>>   
>> +#ifdef CONFIG_PCI_P2PDMA
>>   	if (!p2pdma->pool)
>>   		return;
>>   
>>   	gen_pool_destroy(p2pdma->pool);
>>   	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
>> +#endif
>>   }
> 
> I'm personally not a fan of adding #ifdefs inside functions like this.
> This instance is small and easy to understand, but it can quickly become
> a bit of a mess if we start adding more features. I probably would have
> created a pci_p2pdma_release_pool() helper which does the inverse of
> pci_p2pdma_setup_pool(), it would be called in pci_p2pdma_release() and
> an empty implementation would be provided in the case where
> CONFIG_PCI_P2PDMA is not set.

That's cleaner, I'll do that.  Thanks for the review.


Matt


