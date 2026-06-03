Return-Path: <linux-media+bounces-63618-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kVbsEjI+IGqCzAAAu9opvQ
	(envelope-from <linux-media+bounces-63618-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:46:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F8E638BF8
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:46:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=meta.com header.s=s2048-2025-q2 header.b=srLuqfx+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63618-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63618-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=meta.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17EB431036B6
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9101548B378;
	Wed,  3 Jun 2026 14:22:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E92048AE2F
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 14:22:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496552; cv=none; b=VsJOoQHB0NaPTep/L/aMwfZP2WE6+FGV+nD9+9ESrpKXsV9KD/AquOCZfdmxTimi/hT9i1RjdO66XS+U3FtpMV2EgUxNIliXh9hJrkwbHf99p/Zq1+07rCbKVaaRgH/zABnntcwd7hSVGDtQQs2fk4LBe4237Ax0/fiXpE85z/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496552; c=relaxed/simple;
	bh=obaUumRSEaiR1Wty6Xgu6N15cGNjCTMsp1x89kLIsEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TIl2htwE+I3BmzeFn8jkgCreUvq0QAw5UMgI1nhlj3YdS0rEtFvQwbFSaQcp0NjHxFn8gDpHpSlilkVq9VhBIhUKw5G8EvQLy6T0UbT9+HZz424P52iCcfpcf4guM/LhCUYNIuYb7dn4KoA3vwAExj3BFUzoJ3PEfZ/p1ATN/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=srLuqfx+; arc=none smtp.client-ip=67.231.153.30
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6534mcE5345716
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 07:22:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=YNScBoT6fWRdM9NkrxjASUlxGuUaN5ox/szwoVCoD/M=; b=srLuqfx+FXuC
	bzE9LkokrAimE5iY6tNN+9tUNfEUn2ef7Lf+87pai3WStxYfRanSdrRxchFrsRaa
	hVp4NgdWnzJDmE0szjBwoM0UI8p/Oe1nmi8cfpFlZ72sJ6MKjrvWVKWCW7EgqGZU
	WY5n4wx/L7mDEsXGDKTFRggrDyDhnviCYwZR1mFhx23XQN1Hossmfj02lNA97hnq
	tldmWLaYSlQaubMvRXFHZmLKUM4/IZrzYGEXU+A7/okfjXt0q6FEFIPesfkDIXRX
	kiDV5EiNC27PctqlfT0z16mTfJF9Zn8GQkNgtJFwMsBAzv/dJKpmMRbazdFqdpR2
	coUlXhATAA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4ej6qc4wgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 07:22:29 -0700 (PDT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304ea1eea05so16510754eec.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 07:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496548; x=1781101348;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNScBoT6fWRdM9NkrxjASUlxGuUaN5ox/szwoVCoD/M=;
        b=AkxTx8vUAqVK0gW0+CyV2LhgkhThQF8nKntkCXHze583SOcg5H2XIZmyB6LNgqMBk5
         mVZPcIsk68In8i0JqCE/D+kxjsWDazSHteSkTgKa1TFOTJSnmpDOox30sWgkGgTuZ1rO
         Z4T690pUpfX7XcfaSPWI4fzR/hc7sEM1xIFpaGAS/VYmfvH5TXnpCM+yd5tC0T7GM7CI
         5d69/spooPaOusJi6SblVCmU/Tddw7n/oVCpFrxuZdbfH8UfDO68+evvdDsRxwc0MFaV
         9bkcvJYwPUv6tBSVLjrLHAV2j4iLB52oFv5v09LPi7Jt+QWq30oAC5cbj3MUE6fK+v5m
         K5Cg==
X-Forwarded-Encrypted: i=1; AFNElJ+ai9hC4Gih0T3LiTCZsXZqniG6SpUBJiqCl1Ar+D37d8afr4QW7OLQBCMkLVe2zRR3XKoEyJ3vNu3aBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLRCxVk3OXJTwobuaDV0lchsjFVQ9gDzTX7Pjr5Ay7UOQ+hkdj
	PaqelbvaYMxtSWzElx3vmeEThy66jl0gs/JKTt+lXj03GnFcES5OarXgrL2HODtqBvxDOWkF0tw
	FCh0yQ0brCzG15rzUUsFO4xxZLAlx+ZojgzO438qQYRnzVl7t6BnofZQfdkaUH0k=
X-Gm-Gg: Acq92OElJHrMTeK8V68Y+WA6CWn/v2dIUPiHx0aks3tYgJhEqORsT5BSZcMkvgnOyXO
	9PxV+UffMw+/T+HtdtPKuNoqx7wcOIkzW4Esn4kF32956AP17y9v/AX/0KKccLuVq8oT4TdyzdB
	ILI2XK1XqOraSNaD8YUzvGYhc36Aap3FS6cjyqZnb8QJsO8OmevaGA/tu4XG9zqi8YMFEox+Yj5
	GmKjywwHyceWBNQDvUWBICf/IVJQ+iZPI/M6QkjNROl3OlDGaoCnaGGu0tVpHfDzhf6LwysZDLM
	7+HuFEKWuVEZTwjz5aT59bpLI5hlEnMVNTjSR+BNfy8EsZc9JE3EY6bFRkYjhCaTMUx+D1n/eVC
	0TYPCydz+ZMjd5X/jLOpb/nQkbo9+DlhYg2fN6lh+
X-Received: by 2002:a05:7300:2142:b0:304:630d:e4c4 with SMTP id 5a478bee46e88-3074fab7663mr1925009eec.10.1780496548230;
        Wed, 03 Jun 2026 07:22:28 -0700 (PDT)
X-Received: by 2002:a05:7300:2142:b0:304:630d:e4c4 with SMTP id 5a478bee46e88-3074fab7663mr1924977eec.10.1780496547695;
        Wed, 03 Jun 2026 07:22:27 -0700 (PDT)
Received: from [10.0.40.30] ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8e8csm2504082eec.16.2026.06.03.07.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 07:22:27 -0700 (PDT)
Message-ID: <b7635ebb-c746-48e6-bce3-a10bd288e0c7@meta.com>
Date: Wed, 3 Jun 2026 15:22:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] vfio/pci: Add mmap() attributes to DMABUF feature
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
 <20260527102319.100128-10-mattev@meta.com>
 <20260528171432.771a1a30@shazbot.org>
 <8854824e-06c2-43b3-86c2-8c2c28f9ad63@meta.com>
 <20260602131417.41366391@shazbot.org>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260602131417.41366391@shazbot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O3m5nphA5ii-x3GIk_sNuCdL3gH6HvEi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzOCBTYWx0ZWRfXwQVVkg+eCvu6
 rUS+esb8mGcRDOozeiGtbf7aJqeL/nHnskUlk9ovIgmjSwoXzXfsK1sEjvJsoDw/GaDjx1xbzDX
 U5Ag4L8XdhZiEcK1K6Ln+rIZeeSyGdCmNnmjLgb69MQXjVAwuUXUBV/P8Pe23dxFgXGLiajxpN7
 Xf8ZjIhD0qNz3zJioalkelWOT0Zrw87cTFJogwteeSpvpkzbQdXQ6X9f40b8J6y1Dn1tPn9HnCD
 IwaT69vqT+R1Giqhw8rmSWrZwckkZK/PxZRSNxzHOJLOXopJ1hoqkbN5AgwfSx+JlNkxah69toD
 2tzI3FS/9LApRkyKmcghdU9t7Igw8KYJBiYuaZJBVtAOs+6LyCTIlhYOikE7+fR6G1GFjg07vpA
 qV9LxN2fhGNW//K30CyZtvfwFBWlwfbijS9uD0i3S0MASDW8lqKzYI+hPYLdi1a2e+Bf2BO41xG
 fxMP3OlUCTp1ZoKcZKw==
X-Authority-Analysis: v=2.4 cv=IbC3n2qa c=1 sm=1 tr=0 ts=6a2038a5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=2UbFsIa4v//lIgRL4kGwwA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22 a=VabnemYjAAAA:8
 a=AWNa1KPf0UDjnrnzYgsA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: O3m5nphA5ii-x3GIk_sNuCdL3gH6HvEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63618-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:mid,meta.com:dkim,meta.com:from_mime,meta.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9F8E638BF8

Hi Alex,

On 02/06/2026 20:14, Alex Williamson wrote:
> 
> On Tue, 2 Jun 2026 17:50:04 +0100
> Matt Evans <mattev@meta.com> wrote:
>> On 29/05/2026 00:14, Alex Williamson wrote:
>>> On Wed, 27 May 2026 03:23:12 -0700
>>> Matt Evans <mattev@meta.com> wrote:
>>>> +		uint32_t old_attr = priv->memattr;
>>>> +
>>>> +		if (flags & VFIO_DEVICE_FEATURE_SET) {
>>>> +			switch(db_attr.memattr) {
>>>> +			case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC:
>>>> +			case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC:
>>>> +				priv->memattr = db_attr.memattr;
>>>> +				break;
>>>> +
>>>> +			default:
>>>> +				ret = -ENOTSUPP;
>>>
>>> -EINVAL
>>
>> I'd like to push back on this one; ENOTSUPP distinguishes trying to use
>> a wild attribute value from all manner of other screwups such as
>> trying to GET (with it no longer supported), passing an fd that isn't a
>> DMABUF, etc.
>>
>> I'm not wed to the value ENOTSUPP, just something distinctive versus the
>> other errors userspace might see, and that value seems appropriate.
> 
> It needs to be a uAPI errno though, aiui ENOTSUPP is an internal NFS
> errno.  How about EOPNOTSUPP?  Thanks,

Ew, right!  TIL, and it's caught by checkpatch too (which I fastidiously 
run but still missed this somehow...) :(  "ENOTSUPP is not a standard 
error code and should be avoided in new patches.  EOPNOTSUPP should be 
used instead."

Fixed.

Thanks,


Matt


