Return-Path: <linux-media+bounces-61610-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELM7FbDWBWrxbwIAu9opvQ
	(envelope-from <linux-media+bounces-61610-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 16:05:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC8E542C07
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 16:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E568E305E891
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 13:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA53402442;
	Thu, 14 May 2026 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="LxtRhAqK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA0C3F7A8B
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766946; cv=none; b=QU2I/nX4+zqzBxF4K6nuGI5qY3Nx6ZBIkMx6anOdV/Rocj2hSv/54BnZDx4Vxp0LRQNrH5S1DXZddnyODa9y22yKSCMLjCv7Om8OeYe9hmABb08qKufqQPzyCGbh70n0RsxopTJdlzfb8onRalMQU+zG06MDOheQAm5wH3g2qsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766946; c=relaxed/simple;
	bh=srPu2T221McHXTkQSH9Oejgv5+62Emrh2FOZ3YXu77c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvmOcpyCrbaRnmYJ6usYV3h46HLkG0AlgAcqV4vze/kfFlKl9XsxVvc5iz5QyTiU1mvpjomNTglTB+oENVx6bQRhVMKkS2ccStpndewQBs13bN7M6lPhwlM0OjoQp++rYj+UtvkkRiapvVQnlwkV1N6f8ITxoK3FiGM/opibV0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=LxtRhAqK; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 64E5ISit909428
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 06:55:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=IkkxRlEVU+3w+Yl34MPIFikE3yFUtB8xK/F28U9hrPg=; b=LxtRhAqK961K
	Qx6NyNdgt1AOhTAfIWUL4hMXnHS0598SipoJSDn2iWyvAzTrQJAJzUw+9sZxRwsw
	AR4HU5bIdSM3bPtuqkEL4/XZroyBkRJFBb8S4iq2p6k3Q3kBLqi2SZyuut/I+7yv
	xUXa521SbV2iscLIYd/hlxRNxClEJY5FzzABKnHYbLU/H96TcElBWFWztKhlJ7aG
	ud5pmNFXYCBdVjukCE9qns8eC2TSH3FWbtOqLsrdfRLV+ZPg5rKJK7KkrwX6S2cJ
	o1yla90oO9Hn4h6L0GpgkLL95NEIbYr1lnodaxhfyrHlbKjK8GwSA0mYBX8DYX/V
	TqTnTTC9EQ==
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	by m0001303.ppops.net (PPS) with ESMTPS id 4e3t79tufh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 06:55:41 -0700 (PDT)
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-bcc2320b2deso525506566b.1
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 06:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766940; x=1779371740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IkkxRlEVU+3w+Yl34MPIFikE3yFUtB8xK/F28U9hrPg=;
        b=FrEu0tr51XQjU4wBgJcjd+FwcTxkFngkI7SGTBtY2X5yDMr5LNDI7IROw+zWc/NIBh
         UZN/VOekFavOr/pBwOx+Ct+SU0WSn3QjJGl5gEwbgoTSuKMOM+ntHegoVHDH+YFUO/Lm
         030uo+CoUOTA1TgMDd935P0JRalLtOZBYjXM4xRgf5Vi5VFClm+7AODIe7+Q6X7IQ+Ig
         IFnWd86kkXLelqEjZDj6b1vVIR1YwXAcW1X5y4SpmGnmALUUSbURZPLFPWdJVdifA1Ly
         KKlM3FTs1H1xjALuCbodwshcwagFt6FZz5hgXpxOToury3U9a6Adt20aUFnJHPGIMncC
         GRhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/le+sNvG4nA5xVlLjeYbRJz0hQYd3ZNp3xbS+PdJ8LjROMJW8rh+YXgOXtbTezvdkQ6w8FN/DHK2ehQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNk2mUIHzAFm8UsUfFgVaftjrQ12bx5Ee2o8njpx7XYOdOcfkr
	GLc1wE57Py1kPcDnpeokBkoOQsX2Iyf4JNEI78RY4hcCyrRVO3k8POiV96J/1+sTHKbo4TU3/CP
	seTYW68XZ3Wa7HhtE6Q8C4yv/TMpHAGd9rZnCuNZAFbhKKfS1xuHgd2gt94FJJ1E=
X-Gm-Gg: Acq92OHt1F+eEuS1xRwf2dX2LRBaMM+QIqVZiSZ8QOdFN6HwOA7jIPFRHECbdhMfmE8
	q6nKDTNlJUG8xsuZr0zo9QnaMwFmTPpg9jjyOB2L8OaWgAjcNNw6lKZ7bE6x2QmrDzLcFLWvMQC
	R536nYCDmsL11dxpG/1d7Pcu3QJfCSwcX7jVDZEnaOQGH2jvoXuddCHVmS4mnf9W/oAZEzrfA/0
	eoWMlJcN+ubL2GWWtGIvKRwdc+41hyf8TkkhCVAw8DCaOkInOE+bMRkof0teTyJzkRTOqfS9Z1d
	n9/nGIb9q+Ocucpv+hnrEhV82RxxBjPwOpRit/fG+N72ov4tLAmXsOxFCpxmMifHs8yasIHZPxB
	851oqrnnFp8bkkWawP+sLwBQeyXY8thuIl8pqwDJpUyqwsZJMEnr/gZ62gpRQ6cBBjC0zIZTbXu
	Qf+LRnzdyvavbOzRjevDaDdiqZlFpcgDuWfK1x7gx1K4vl1Tq88ebplgjx6TqhdFQ+ys8iQGd6n
	Y8m5tKMKSruBwCi2UaiJNk=
X-Received: by 2002:a17:906:4786:b0:bd3:2b8a:2164 with SMTP id a640c23a62f3a-bd3bfb9f635mr526851466b.16.1778766939872;
        Thu, 14 May 2026 06:55:39 -0700 (PDT)
X-Received: by 2002:a17:906:4786:b0:bd3:2b8a:2164 with SMTP id a640c23a62f3a-bd3bfb9f635mr526848066b.16.1778766939261;
        Thu, 14 May 2026 06:55:39 -0700 (PDT)
Received: from ?IPV6:2001:8b0:8b6:13d4:102e:f2af:e074:5cde? (e.d.c.5.4.7.0.e.f.a.2.f.e.2.0.1.4.d.3.1.6.b.8.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:8b6:13d4:102e:f2af:e074:5cde])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd0a24sm94246766b.11.2026.05.14.06.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 06:55:38 -0700 (PDT)
Message-ID: <5c64e13a-2d41-4e5e-addf-9a76f08ae172@meta.com>
Date: Thu, 14 May 2026 14:55:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] vfio/pci: Add mmap() attributes to DMABUF feature
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
 <20260416131815.2729131-10-mattev@meta.com>
 <20260424183153.GJ3444440@nvidia.com> <20260426105215.GA440345@unreal>
 <20260427083644.4ee174cd@shazbot.org>
 <25a4fc45-1b4d-426b-954a-60bf21e9040f@meta.com>
 <20260511140957.25eb5d9d@shazbot.org>
 <4af0c788-22cc-4fb1-9276-ab35439fb7c8@meta.com>
 <20260513122734.44ce8a68@shazbot.org>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <20260513122734.44ce8a68@shazbot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ho8qDTFvFoMp7XSwF56KtmySrEWjlOn2
X-Proofpoint-ORIG-GUID: ho8qDTFvFoMp7XSwF56KtmySrEWjlOn2
X-Authority-Analysis: v=2.4 cv=VNntWdPX c=1 sm=1 tr=0 ts=6a05d45d cx=c_pps
 a=edIAN7ErZTGbxav20d8A7Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=VabnemYjAAAA:8 a=QlOCKlcsugFDnh0twowA:9
 a=QEXdDO2ut3YA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfXysLNWrljjt38
 Fk9BOmX2QDwSuWxkDZ0oJgmy2JBgf7Uja68jlghpFvPkQ+4YL4owZ2Yt4NTpnrpiOVFmKh5VxJl
 E7d9duSzGvLk1AyhHDnN4MTIlmKOP79kwbos1uWrXBaiF7+hHsr+nQsjO/sqvH8jg+Me91t3MCA
 kQsXtx361wTOQzLVQnjK9Zk9djYY+xEZLnwLuQJA+cL+wgfqhAUeXdICHZjH4uLQkHBtnOEfWx2
 QhmAUBLX7YoWEjIceqlw668gUJMjyITcmHJtPURfAQtNJtHYjh1IO31RXLCGYvaBOPbLfDjFp3v
 +313XF72kCBZz6lfq23cBVtua0rF65Qd7Mg8Yyw422JSSCXEialdOvYLsS/jV9aGof8LkzyjQx6
 Pdp4OegYX7j2bOv5A8nRW4pc1e1i3d/RCxrxbiKhLFto06mprxlqTcAXmcGlCKvsqInAdONMO85
 ogK9m6tUaSjCzOHlQ3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Rspamd-Queue-Id: BFC8E542C07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-61610-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,meta.com:email,meta.com:mid,meta.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Alex,

On 13/05/2026 19:27, Alex Williamson wrote:
> 
> On Tue, 12 May 2026 18:51:40 +0100
> Matt Evans <mattev@meta.com> wrote:
>> On 11/05/2026 21:09, Alex Williamson wrote:
>>> I think the question of how we actually expand an arbitrary grab bag of
>>> "ATTRS" is the central question in whether we should implement the
>>> interface.
>>
>>> If we follow the direction I suggested for TPH, maybe this
>>> is just a VFIO_DEVICE_FEATURE_DMA_BUF_WC, where it supports only PROBE
>>> and SET, with SET taking only the dma-buf fd to implement the one-way
>>> promotion from UC -> WC.
>>>
>>> If we support a generic SET ATTRS feature, we really need to map out how
>>> flag bits are indicated as supported and how a user untangles failures
>>> from trying to set various attributes.  If we end up with a feature
>>> indicating each ATTR is available, we might as well have just
>>> implemented a feature for each attribute.  Thanks,
>>
>> Agreed, that's key.  Alhough, the aim of this patch is for attrs to be a
>> memory type enum rather than a bag of possibly-concurrent and
>> possibly-conflicting boolean flags.  Maybe 'memory attributes' would be
>> a better feature name.
>>
>> I'm not sure about the feature-per-attribute.  Say we do a
>> VFIO_DEVICE_FEATURE_DMA_BUF_WC and then later support a second,
>> VFIO_DEVICE_FEATURE_DMA_BUF_UC_WEAK (like, say, Arm Device-nGRE).  Then
>> we have to specify that these two VFIO feature types actually
>> interact/override somehow.  I doubt we'll end up with a dozen but it's a
>> bit tiresome having a few features that interact.
>>
>> At least if it's a single DMA_BUF_MEMATTR feature taking an enum, we
>> just encode the N different (mutually-exclusive!) valid states and done.
>>    I don't feel having a new feature for each keeps things simpler.
>>
>> Discovery of support for a specific future attribute is OK with a single
>> ATTR too; we can take an enum attribute argument to a GET and -ENOTSUPP
>> for any we don't like.
>>
>> (We could also add orthogonal DMABUF flags (can't think of a good
>> example...) but I'd suggest _those_ as semantically-grouped different
>> features, with the same issues of specifying conflicting cases versus
>> existing features.)
> 
> I think the GET behavior you're proposing is a bit counter-intuitive, if
> not abusive of the interface, but I do agree that if the feature is
> SET'ing a single value and not a group of independent flags, that we
> can probably rely more on a try-and-fail model rather than advertising
> each supported value as a separate feature.
>
> For example, the user has some list of compatible attributes ordered
> from most to least desirable, they try each in order until one works,
> or none work and they decide whether that's ok.
> 
> For GET, if we implement it, I think it should report the current
> attribute, mirroring SET.  We could almost get away without implementing
> it, but I do worry about the case of nvgrace-gpu, where it might be
> interesting for the user to see that the default attribute could be WB
> rather than UC.

I'd come to the same conclusion yesterday when implementing it. :)

GET just returns the current value, SET gives ENOTSUPP if the provided 
value isn't supported.

I haven't done much thinking on mechanisms for overriding the default 
value, but a sub-driver could add that via some hook from 
vfio_pci_core_feature_dma_buf().

> Where does the user derive the enum value?  Are we defining our own or
> is it a system header defined enum?  I'm curious if/how we're going to
> handle architecture specific attributes.  Thanks,

Good question.  There doesn't seem to be a suitable existing enum so I 
defined a new set (mirroring existing pgprot_*() semantics), in the same 
vfio.h/UAPI place as this patch.

The set could be extended in future to add some kind of "base vs 
arch-specific" grouping if we want to support arch-specific types like 
that hypothetical example arm64 'UC_WEAK' above.  (The feature param's a 
u32, so steal top byte for extension group_id?)

For the base set of types, they should at most follow the set of 
IO-related pgprot_*() types (whose names are a bit of an awkward fit 
across architectures but they're used consistently).  I've revisited the 
names to make them consistent with pgprot_*().  For sake of keeping the 
huge enum names smaller, abbreviated slightly:

pgprot_noncached()    -> VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC (*)
pgprot_writecombine() -> VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC
pgprot_device()       -> VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_DEV

  *: Was UC in the v1 patch, which makes more sense as a memory type
     name, but consistency with pgprot_* is better.

But, I was thinking to support just the NC default and WC option in this 
series.  Does anyone feel strongly about needing pgprot_device() right 
now?  For external PCIe functions it'll behave the same as the NC type 
(even on arm64) so I don't think it's critical to add yet.

At this stage feels like we should get more field experience before 
adding more values/a scheme for arch-specific values so I'm keen on NC + 
WC for now, WDYT?


Matt




