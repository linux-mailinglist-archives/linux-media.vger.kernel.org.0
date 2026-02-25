Return-Path: <linux-media+bounces-53343-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGn0K/EBn2lAYgQAu9opvQ
	(envelope-from <linux-media+bounces-53343-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:06:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D60A198811
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 406E03095258
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFD83D3334;
	Wed, 25 Feb 2026 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCquubrG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kcRDsu93"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0977A7081E
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028262; cv=none; b=QIWW+3PLeHvFEBwH/QUgkLMa98D+xkbT7mjflZ6i78EIp3SOsOtv/3xTnunYIystVXoUIZr3hzq82V/JDn6bTczb1Yi59iu2Oy9VPK7NVNG20at2R0dnsr+qurV0/jcmkNqUMneviCjmmIkkerjoCxO1aOT94qcTbgoKMzHe9I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028262; c=relaxed/simple;
	bh=itYLORZQooz79YpN89jsSWdfA+QPUsepbZO7kQDmLK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A8iIv5v+04nxPq6uPljkK1RIhymk6RrnUa/dutMEE8QLWz3G8OMwqqFoiG7uDVvGGgkrmtpNSHQJmoFd1+TiEE9m7X80UNdSDVlwuZZPSzMx1BaMGhW9q7VC9puNUQ2suskTupiYh/5p/SeGe/6V/NA/UfcAOQCmOboVsrhuzkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCquubrG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kcRDsu93; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SBaM806514
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 14:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yvs3FrVJNHeiSqjg5v/skUpKDVu9dSX1WyTXBJiY8Mg=; b=oCquubrGyXa0f6P7
	nYcHfEI2TbADQEmQ5NRpB0OBR040NZt7H94tQthhtnRseW+zPvr2ckbJ053UmmIp
	LWv/u2eBJ+JzGXcNMbUSTz8C3+VRMlbKnnaZ6pe3d6xLFkOkdzGTErVTj4Hdj0J/
	DhDdAyBowr7R+AgjpvFBS4/0jGyz2YmgTHfcV/P4JcMoIbY+dsqCidACgW9C0S2d
	fUZyGqMRkaPj/o5qhcsZXVCvE8uvmcfLMS2JwPokpvLJczzBX9lNfnzaTgOjvz9q
	B/s14fhbUTn3KC50euhS5R2rQbyk6NXFw2MlDrYR7lRkOmneOkm4GqdZBsdyIxzU
	NmPG4A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5p9tyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 14:04:18 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ff08a88c7aso770081137.3
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 06:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772028258; x=1772633058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvs3FrVJNHeiSqjg5v/skUpKDVu9dSX1WyTXBJiY8Mg=;
        b=kcRDsu93jumtiA9LKg2budGJ2813xtCXi/0KN5jq4mxfxb764jrFTQ8ChA92nZsnUI
         wb254aDI4kevpl6z5iMAWtNn7ifJd9v5kVWTxKtwrsTXOPFo9MoxOQMcBS113Rf0WJfM
         hBncNy84fYjYRdKBsCkH3jjZMRxeatBnIeew3jHjdcLLiXTzngVsdWO26Ttf7OEWSFcL
         n7dmPjowWZQay98Vptauvt7chHdU5A1pTC9ZMnp77C8SahDz2vuOtkTtkrL90vTRa6Em
         HOalAXsOscGqRo2kIBwJ9bHDXEXj+dAyybxLz5UMJOQOhk4YVX4Xcg6hoNIMWQa/EByj
         +ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772028258; x=1772633058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvs3FrVJNHeiSqjg5v/skUpKDVu9dSX1WyTXBJiY8Mg=;
        b=mFpXS8QphKVb7kjhv13HDr6rCokKP7B+XKpVgd9zmx/1LpZT6XlCvDwIzYsFD1TMrt
         kyOc2Of9zn5BU41eQCYqunR4n1IvvjD013A6P7Q9v/TzMz2g1mXT8Pvg/kyNetc3I2Yz
         eFfBUIZRlsjd49W2rT0Km8TmfhCFT1E5hj3e3Tj5b4K5l1Yij/tHGUkOsjzOFoNABu2j
         EtcWbtUL+Vh1PwGGpEbBBVG0WuTCVfY9A/vRJaJTuYmBx1Sw5TJhIvkJPLxY8WtcViIC
         Jjcr7REleXFuKzG17B8mjljgNoJOjuLSB9Tw7GslxPRu8gw8fZHCis3RgLwjLYgRHoso
         j5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWqEihjIZjERvMsJkIirMxXNU1yv0b5HSr1GlbCleGyyNvfNj+pl3SBRxxrtRn7X+Ch1Wy/wAV7L+V2hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGmicK59llLC0HEa8TwrGSxBsH+Wum65kkhe/u6TwBSvcnO08w
	Ao5LlMIuWQkUA2FsqaeZHfKjnpVC7jtJFkgm1b0N/bq6fgpRPidU3sJovok3UCe3hcelfbmWTAz
	hi5JObKcwXwTK3fvKtZPS6zJMCZymip7/Woa45GO0xiW5efcXFyvxmc4mP2UYgsUd
X-Gm-Gg: ATEYQzyPSDJV/iFp1lc59Thj7PBIkgLI1o8jZ4NoxsQMiGYWvqHjGzBzzuPLytBPiiL
	OmUrXUP4GjCbAxEWxrmKdlbQNcQqQdq70EzPL2Yq4Zv4fttf14ZN56iSYbjvxq7lRKcuKBHWLuE
	6ILL/od28ByTrN1Kby33jRgSibQGIqiQgF2fEUQuhnNznEr/CiuAh9apdWHleA78/GBC+KDuuAN
	tmawbSknBEdi3EScag9En3Cu8659ke4cBhnjSco5rIEcS2eGffBV4+lgI9Vqe9cwjcjCZaPHwQ1
	d1jhLI1b2PEpRjb/B6C3X7aagRi3HJcA6ylzTJvdZ/ZyYNR9/0k0NnU1T3J4ntHTPvjdtyV4sqW
	bS6kss4lM7OxPzy3HWOuUladXwXQzzp8ChEHEG7AbH4TZ/uG6Mh09mcQ=
X-Received: by 2002:a05:6102:3a0a:b0:5f5:512f:603c with SMTP id ada2fe7eead31-5feb305645dmr5510127137.24.1772028257490;
        Wed, 25 Feb 2026 06:04:17 -0800 (PST)
X-Received: by 2002:a05:6102:3a0a:b0:5f5:512f:603c with SMTP id ada2fe7eead31-5feb305645dmr5509864137.24.1772028255246;
        Wed, 25 Feb 2026 06:04:15 -0800 (PST)
Received: from [10.224.242.57] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9088c8fc30sm509996266b.63.2026.02.25.06.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:04:14 -0800 (PST)
Message-ID: <0d7b1d2e-25a0-4248-924d-3165a5ebc6a6@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 15:04:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] virtio-video: Add virtio video device
 specification
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Cc: Albert Esteve <aesteve@redhat.com>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
        Trilok Soni <tsoni@quicinc.com>, Matti Moell <matti@qti.qualcomm.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20260213085306.313348-1-alexander.gordeev@oss.qualcomm.com>
 <20260213085306.313348-2-alexander.gordeev@oss.qualcomm.com>
 <SJ0PR12MB680603C30AB26E93ECB27E2FDC6FA@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <8f4ccb49-57f1-454a-a404-85035a2bb1a8@oss.qualcomm.com>
 <SJ0PR12MB680606ADECCB1C0ECF762521DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Content-Language: en-US
From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
In-Reply-To: <SJ0PR12MB680606ADECCB1C0ECF762521DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNCBTYWx0ZWRfX2qrFnI67OJXS
 3Y1Hl4gym394pRSCpcZKzf/9bRqJm0iYHkQpexBCJl0tcYK+VbtB5EKtxp+fD6v+37Rw97xIGLr
 CYoN7nu9wVfnDfufPHdG5rjnRi61PrqZFDlZ9DZ8uQBBRLoS1gvBdpx+gsCm42dMnAY5E4jEEA8
 FNQIEYWOU1L9BZ6O13CDes59O5CCtI6m5U8FNW5z/5TFU+7SdetaKQ8rpx9lBwEztyFnBAbfvc3
 5cgYx3caUoPQXGAm/jXu72YOWuSMSQZHBepqwcX5jAl+t1cWfIj3RRF7NH2pFwUlreBEbKwGBJh
 +x7Ufd4xoSuIhz58P1ILDjuoDddaDd8u03EPGUY6SIrOWJ3zIfGr82hkRgFgzu2JoQ1TZ5hppwq
 nlkivXGWAVWATnJGbKDzhrVF9O5jL8cTVVG5q9dlzNPvkEeXMsfZAOLPbWrj3xJYfpM7Hu6x7ZE
 71cDfVbmpOl51wFq79Q==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699f0162 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=bs-e4Z8cAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=-EfFpG8A8con4Ebo02QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=YFpLQiK6rFjqGb8m0bXF:22
X-Proofpoint-GUID: FiI9HHSCmLfzSh2lMBztBVEF6UOeDBtY
X-Proofpoint-ORIG-GUID: FiI9HHSCmLfzSh2lMBztBVEF6UOeDBtY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250134
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[redhat.com,linaro.org,collabora.com,ideasonboard.com,gmail.com,quicinc.com,qti.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-53343-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.gordeev@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D60A198811
X-Rspamd-Action: no action

On 25/02/2026 05:59, Parav Pandit wrote:
> 
>> From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
>> Sent: 25 February 2026 01:33 AM
>>
>> On 15/02/2026 11:49, Parav Pandit wrote:
> 
> [..]
>>>> +
>>>> +\begin{description}
>>>> +      \item[VIRTIO_VIDEO_F_ENCODER (0)]
>>>> +            The device can encode video.
>>>> +      \item[VIRTIO_VIDEO_F_DECODER (1)]
>>>> +            The device can decode video.
>>>> +            % Use-case: the device can support both encoding and decoding, so having both
>>>> +            % here can save resources.
>>>> +      \item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (2)]
>>>> +            Guest pages can be used as the backing memory of resources.
>>>> +      \item[VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG (3)]
>>>> +            The device can use non-contiguous guest memory as the backing memory of
>>>> +            resources. Only meaningful if VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES is also
>>>> +            set.
>>>> +      \item[VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT (4)]
>>>> +            Objects exported by another virtio device can be used as the backing memory
>>>> +            of resources.
>>>> +      \item[VIRTIO_VIDEO_F_V4L2_COMPATIBLE_LAST_BUFFER (5)]
>>>> +            The device releases an extra empty output buffer after a drain or DPC so that
>>>> +            the driver can send a buffer with V4L2_BUF_FLAG_LAST set in the V4L2 way.
>>> This does not seem relavant to the video device.
>>> It should not be attached to any V4L2 implementation.
>>> Can you please craft it differently?
>>
>> Hmm, do you mean renaming the feature?
> No. virtio spec already has Media device that exposes V4L2 devices.
> So I am not sure why a dedicated video device is needed.
> If a dedicated video device is desired, it should not be linked to V4L2 at all.
> 
>> The thing is that V4L2 driver is sitting on top in many cases and V4L2 needs an extra output buffer to pass the DPC/EOS events. But this may
>> be not necessary in other implementations (e.g. Windows). So this feature helps here. V4L2 is mentioned in many places here and also some
>> definitions are borrowed/referenced from it. It was agreed during the draft v6 review that this is ok in general. So I'm not sure what do you
>> want me to do here.
>>
> Can you please explain why v4l2 Media device (device id 48) is not sufficient for your use case?

There were multiple discussions already. I'd prefer to avoid starting the discussion again.
Here are some references:
https://lore.kernel.org/virtio-dev/b5c9d69a-fbec-8046-225f-bdb5850bbd54@opensynergy.com/
https://lore.kernel.org/virtio-comment/92964190-81d0-4419-833a-65e254abc0df@opensynergy.com/
https://lore.kernel.org/virtio-comment/f6dc2d4d-89d9-4721-9c67-a214025cb3c3@gmail.com/

> I expect video device to be not linked to V4L2 at all.
> If it needs to be, please explain the reason in the commit log cover letter too.

I checked the spec again. Here are the types of V4L2 references in it:
1. Comments about use-cases.
   These are for illustrative purposes, they don't go into the text. Is this really a problem?
2. Compatibility feature flag and buffer dequeue flags.
   This is a way to do things simpler if the driver is not V4L2, but retain compatibility if the driver is V4L2.
   This is actually an attempt to be not linked to V4L2 and make things simpler if we don't have V4L2.
3. Compressed formats and controls.
   Virtio-video references the descriptions of compressed formats from https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
   This way we can avoid including lengthy descriptions for formats like this:
      - 'H264'
      - H264 Access Unit.
	The decoder expects one Access Unit per buffer.
	The encoder generates one Access Unit per buffer.
	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
	then the decoder has no requirements since it can parse all the
	information from the raw bytestream.
   For the controls this is also mostly about avoiding including all the control descriptions and enum values into the spec like this:

enum v4l2_mpeg_video_h264_profile {
	V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE			= 0,
	V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE	= 1,
	V4L2_MPEG_VIDEO_H264_PROFILE_MAIN			= 2,
	V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED			= 3,
	V4L2_MPEG_VIDEO_H264_PROFILE_HIGH			= 4,
	V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10			= 5,
	V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422			= 6,
	V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE	= 7,
	V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10_INTRA		= 8,
	V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA		= 9,
	V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_INTRA		= 10,
	V4L2_MPEG_VIDEO_H264_PROFILE_CAVLC_444_INTRA		= 11,
	V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_BASELINE		= 12,
	V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH		= 13,
	V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH_INTRA	= 14,
	V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH		= 15,
	V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH		= 16,
	V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH		= 17,
};

   I don't think you want all these lengthy enums in the spec. Right now the virtio-video spec takes 18 pages.
   With all the enums it will be much more. And I think it is really pointless to copy them. 

This is it. So no, this device doesn't just expose V4L2 as virtio-media. The V4L2 references are very limited.
During draft v6 discussions the spec length was brought as one of the issues. Therefore the references to V4L2 formats and controls.
I believe the current state is really the right amount of referencing, also it was discussed in the past, so I don't like to change this.
Of course it is possible to rephrase something on case by case basis if you insist.

>>>> +\end{description}
>>>> +
>>>> +\devicenormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
>>>> +
>>>> +The device MUST set at least one of VIRTIO_VIDEO_F_ENCODER or VIRTIO_VIDEO_F_DECODER.
>>>> +
>>>> +The device MUST set at least one of VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES or
>>>> +VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT, since the absence of both bits would
>>>> +mean that no memory can be used at all for resources.
>>>> +
>>>> +The device MUST NOT set VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG unless it also sets
>>>> +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES.
>>>> +
>>>> +\drivernormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
>>>> +
>>>> +The driver MUST negotiate at least one of the VIRTIO_VIDEO_F_ENCODER and
>>>> +VIRTIO_VIDEO_F_DECODER features.
>>>> +
>>>> +The driver MUST negotiate at least one of the
>>>> +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES and VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT
>>>> +features.
>>>> +
>>> You wouldn't need virtio_object feature bit. It should be covered using the capability.
>>
>> Well, Michael says it is ok
>>
> I am not sure. Once you structure using capability unnecessary feature bits goes away.
> Feature bits offer simplicity but are only useful when one needs them before DRIVER_OK phase.
> So it is unclear why/what driver needs to do with this bit before DRIVER_OK stage. 
> 
>>>> +If VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES has been negotiated, but not
>>>> +VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG, the driver MUST use physically
>>>> +contiguous memory for all the buffers it allocates.
>>>> +
>>>> +\subsection{Device configuration layout}
>>>> +\label{sec:Device Types / Video Device / Device configuration layout}
>>>> +
>>>> +The video device configuration space uses the following layout:
>>>> +
>>>> +\begin{lstlisting}
>>>> +struct virtio_video_config {
>>>> +        le32 max_streams;
>>>> +        le32 caps_length;
>>>> +};
>>>> +\end{lstlisting}
>>>> +
>>>> +\begin{description}
>>>> +      \item[\field{max_streams}]
>>>> +            is the maximum number of concurrent streams the device supports.
>>>> +      \item[\field{caps_length}]
>>>> +            is the minimum length in bytes that a device-writable buffer must have
>>>> +            in order to receive the response to VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS, see
>>>> +            \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}.
>>>> +\end{description}
>>>> +
>>>> +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Video Device / Device configuration layout}
>>>> +
>>>> +\field{max_streams} MUST be positive.
>>>> +
>>>> +\field{caps_length} MUST be set to the response size of
>>>> +VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS.
>>>> +
>>> This plumbing can be easily done using 'Device and driver capabilities' located in the 'Group administration commands'.
>>> Please rework the patch to use the existing basic facility.
>>> This can also possibly eliminate plumbing device specific command q.
>>> More below.
>>
>> I'm still learning about capabilities and admin commands, so please correct me if I'm wrong.
>> Here are some considerations:
>> 1. AFAIU capabilities and admin commands need an admin virtqueue. The latter depends on the VIRTIO_F_ADMIN_VQ feature. What if the
>> device doesn't support it? 
> It isn’t the right question.
> It is a question similar to: what if the virtio-net device does not support control VQ, can it still enable multi-queue?
> No, it cannot. Hence virtio-net to implement cvq to support MQ.
> What if the virtio-blk device does not support AQ, can it will support device parts basic facility?
> No. it cannot.
> 
> Does it mean these devices should invent new queue, instead of admin vq?
> No.
> The devices are encouraged to use the existing basic facilities of chapter 2 that is used by various features and devices such as virtio-net, block, crypto.
> 
>> Also it looks like the admin virtqueues are only defined and implemented in Virtio Over PCI at the moment,
>> "reserved for future use" in Virtio Over MMIO and in Virtio Over Channel I/O and also not available in vhost-user. For us this makes admin
>> queues unusable for now.
> This is not a limitation. AQ support can be added for MMIO transport or channel transport too.
> Admin VQ is not any different beast than newly proposed command queue.

This has to be done by someone first. This is definitely outside the scope of this patch. For now there are no admin queues in MMIO transport, this is a problem for us.
How about agreeing to do as follows:
1. For now virtio-video doesn't require an admin queue, they can be enabled later with a feature flag when at least MMIO transport is ready (possibly together with media, gpu, etc).
2. Maybe you can suggest certain specific things that can be already done in virtio-video to make the future transition to admin queues simpler. Like maybe moving the command type IDs into a certain range (0x8000 - 0xFFFF ??? but it doesn't say this is reserved for device-specific commands though) and maybe changing some types. Capabilities don't fit for now because they depend on the admin queue AFAIU.
Please note that we'd like to avoid creating any unnecessary extra virtqueues so that we can save limited HW resources. Therefore it should be either a commandq, or an admin queue with both admin commands and device-specific commands mixed and consumed in strict order.

>> 2. The virtio capabilities that you mention seem to be about enabling and disabling certain functionality based on a bitmap, right? (Still looking
>> into the flow filter example, which seems to be more complex.) The virtio-video caps are more like an attempt to represent a graph of
>> dependencies between different coded and raw formats, resolutions, etc. For example there will normally be multiple TLVs with the same
>> types (coded and raw sets) "linked" to each other. I'm not sure this maps well into the existing virtio capabilities.
> Sure it can map. Capabilities can be define them.
> 
>> 3. If this is really targeted towards SR-IOV maybe it is better to keep it this way. 
> No. it is not targeted towards SR-IOV.
> It is basic facilities uses for SR-IOV, flow filters, crypto across 3 different device types.
> 
>> I mean we may need admin commands to create a virtio-
>> video device per guest VM, so maybe using the same admin commands + some device-specific commands inside each device could be
>> confusing. The nesting actually continues here, because virtio-video streams have shared buffers called "resources" (probably these should be
>> renamed).
>> 4. Also I'm not sure how does it actually improve the spec/implementation.
>>
> It improves the spec by reusing the basic facilities of the spec and avoids creating new objects.
> This reduces the spec burden.
> It also reuses the existing implementation of the device and driver.

OK, got it. Replied above.

>>>> +\subsection{Device Initialization}
>>>> +\label{sec:Device Types / Video Device / Device Initialization}
>>>> +\begin{enumerate}
>>>> +      \item
>>>> +            The driver reads the feature bits and negotiates the features it needs.
>>>> +      \item
>>>> +            The driver sets up the commandq and the eventq.
>>>> +      \item
>>>> +            The driver reads the \field{caps_length} field of the configuration
>>>> +            space, prepares a buffer of at least that size and sends the buffer on the
>>>> +            commandq with the VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command.
>>>> +      \item
>>>> +            The device sends a response over commandq to
>>>> +            VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS via used descriptors provided with the
>>>> +            command.
>>>> +      \item
>>>> +            The driver receives the response from the device, and parses its capabilities.
>>>> +\end{enumerate}
>>>> +
>>>> +\subsection{Device Operation}
>>>> +\label{sec:Device Types / Video Device / Device Operation}
>>>> +
>>>> +The device supports opening and operating a number of parallel streams up to
>>>> +\field{max_streams}. Each stream has three internal device queues: mainqX,
>>>> +inputqX and outputqX, where X is the stream id. Each stream command has a
>>>> +field that dispatches the command to the specific internal queue.
>>>> +
>>> If these queues are internal to the device it does not need exposure in the spec here. If they have a meaning to the driver,
>>> Than keyword 'internal' should be dropped and rephased.
>>
>> As Michael already assumed the implication is that within each queue commands are consumed in order. 
> Admin virtqueue can be extended to support out of order.
> One can always add a new first admin command to operate in out of order mode.
> Or even a feature bit to have AQ_OUT_OF_ORDER.
> And again this is optimization.
> In other thread we discussed that optimization may come later.
> But if you think it is essential to have the good out of order performance now (and how much it improves - rough estimates), it is worth to extend AQ for out of order.
> Even SR-IOV can benefit of this feature right away for reading and writing device parts of unrelated VFs.
> So there is already more than one user of the out of order feature you suggest. 😊

I think there is some misunderstanding. We actually want all the queues including the internal ones to be consumed in order.
Otherwise the decoding just falls apart.

>> On top of this there are queue
>> priorities: mainq has higher priority than inputq and outputq. This enables resetting inputq and outputq or setting parameters out of band.
>>
> So multiple admin queues are also supported.
> Before starting these queues, their priority can be set using a new command.

As I wrote above we'd like to avoid creating extra virtqueues unless necessary. This is a requirement from our HW engineers.
If every stream always has 3 real virtqueues, this is definitely a problem. So this spec has a scheme to multiplex several stream queues into the single commandq.
I don't see any generic multiplexing scheme in the admin queues for now, so this is also an issue if we consider them managing the internal queues.

>>>> +% Use-case: there might be different real-time requirements for different
>>>> +% streams, so more virtqueues can be added in the future if necessary.
>>>> +% The internal queues don't change, the data formats don't change, only the
>>>> +% mapping of streams/internal queues to particular virtqueues changes.
>>>> +
>>>> +The mainqX is used to open a stream with VIRTIO_VIDEO_CMD_STREAM_OPEN,
>>>> +close a stream with VIRTIO_VIDEO_CMD_STREAM_CLOSE, reset inputqX or outputqX
>>>> +using VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET, set some of the stream parameters out
>>>> +of band with high priority with VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, unblock
>>>> +the outputqX with VIRTIO_VIDEO_CMD_STREAM_UNBLOCK if it gets blocked for
>>>> +format negotiation.
>>>> +
>>>> +The inputqX and outputqX are used to queue input or output resources using
>>>> +VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE. Additionally inputqX is used to set input and
>>>> +output parameters using VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, to complete
>>>> +processing of all queued input resources and make the resulting output
>>>> +resources available to the driver using VIRTIO_VIDEO_CMD_STREAM_DRAIN.
>>>> +
>>>> +All the stream commands start async operations, return the results
>>>> +using async responses over eventq.
>>>> +The eventq is used by the device to send the device's async responses to
>>>> +stream commands and the device's standalone events.
>>>> +
>>>> +% This way eventq becomes the single source of truth about the device's state,
>>>> +% the driver doesn't have to tediously synchronize commandq's and eventq's
>>>> +% used queues the way it was necessary in the past (similarly to V4L2's DQBUF
>>>> +% and DQEVENT). One more benefit is that commandq is processed fast and
>>>> +% strictly in order, so commandq descriptors exhaustion should never happen in
>>>> +% practice.
>>>> +
>>> Video device should be implementable without any V4L2 binding/description etc.
>>
>> Well, as I wrote above some V4L2 definitions are used anyway. It was agreed that this is fine and that we can have V4L2 headers as normative
>> references during the v6 review.
>> In this draft I decided to add some comments describing the reasons behind some design decisions because I keep forgetting them myself. I
>> can edit this particular comment though of course.
>>
> Lets first understand why existing media device is not enough.
>  
>>>> +Parameters allow the driver to configure the stream including setting up the
>>>> +resources. Available parameters depend on the device type, see
>>>> +\ref{sec:Device Types / Video Device / Device capabilities and parameters}.
>>>> +
>>>> +A resource is a set of memory buffers that contain a unit of data that
>>>> +the device can process or produce. Most resources have only one buffer,
>>>> +raw frames using a multi-planar format can have several.
>>>> +Input resources are filled by the driver with compressed (coded) video data
>>>> +for a decoder and raw frames for an encoder, output resources are filled by
>>>> +the device as the result of processing the input resources with decoded raw
>>>> +frames for a decoder and compressed (encoded) data for an encoder.
>>>> +Resources from inputqX and outputqX are consumed independently, not in pairs.
>>>> +One input resource can result in zero to many produced output resources.
>>>> +A decoder device dequeues the output decoded frames in presentation order.
>>>> +An encoder device dequeues the output decoded frames in decoding order.
>>>> +The driver can reuse a queued resource after receiving a corresponding async
>>>> +response. Dequeued output resources can still be used by the device as
>>>> +reference frames, so the driver can't write to them.
>>>> +
>>>> +% TODO: maybe send the second RESOURCE_QUEUE async response, when the dequeued
>>>> +% output resource is not used by the device anymore and therefore becomes
>>>> +% writeable?
>>>> +
>>>> +The device can detect standalone stream-related events: errors and dynamic
>>>> +parameters changes that require intervention from the driver (e.g.
>>>> +reallocating backing memory of output resources to fit the new parameters).
>>>> +The events are signalled on the eventq, see
>>>> +\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
>>>> +
>>>> +\devicenormative{\subsubsection}{Device Operation}{Device Types / Video Device / Device Operation}
>>>> +
>>>> +The device MUST set to zero all unused, disabled or padding bits in its
>>>> +responses.
>>>> +
>>>> +\subsubsection{Device Operation: Command Virtqueue}
>>>> +\label{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
>>>> +
>>>> +This section lists the commands that can be sent by the driver to commandq.
>>>> +
>>>> +Different structures are used for each command and response. A command
>>>> +structure starts with the requested command code, defined as follows:
>>>> +
>>>> +\begin{lstlisting}
>>>> +/* Device */
>>>> +#define VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS      0x100
>>>> +
>>>> +/* Stream */
>>>> +#define VIRTIO_VIDEO_CMD_STREAM_OPEN            0x200
>>>> +#define VIRTIO_VIDEO_CMD_STREAM_CLOSE           0x201
>>> You can craft the stream using a existing basic facility of resource object.
>>> Where each stream is just a resource object, that be queried or modified.
>>
>> Replied about the admin commands above.
>>
> Comments above.
> This can be done using admin commands easily.
> 
>>>> +#define VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS      0x202
>>>> +#define VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS      0x203
>>>> +#define VIRTIO_VIDEO_CMD_STREAM_UNBLOCK         0x204
>>>> +#define VIRTIO_VIDEO_CMD_STREAM_DRAIN           0x205
>>>> +#define VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET     0x206
>>>> +#define VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE  0x207
>>>> +\end{lstlisting}
>>>> +
>>>> +Stream commands start with a header:
>>>> +
>>>> +\begin{lstlisting}
>>>> +#define VIRTIO_VIDEO_QUEUE_TYPE_MAIN    0
>>>> +#define VIRTIO_VIDEO_QUEUE_TYPE_INPUT   1
>>>> +#define VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT  2
>>>> +
>>>> +struct virtio_video_stream_cmd_header {
>>>> +        le32 type; /* One of VIRTIO_VIDEO_CMD_STREAM_* */
>>>> +        le32 stream_id;
>>>> +        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* */
>>>> +        le32 async_response_cookie;
>>>> +};
>>>> +\end{lstlisting}
>>>> +
>>>> +\begin{description}
>>>> +      \item[\field{async_response_cookie}]
>>>> +            is an async response cookie provided by the driver, that allows
>>>> +            to relate an async response to the previously submitted command.
>>>> +\end{description}
>>>> +
>>>> +\subsubsection{Device Operation: Event Virtqueue}
>>>> +\label{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
>>>> +
>>>> +The eventq is used by the device to send async responses to commands queued
>>>> +by the driver on commandq and standalone events. Stream errors and dynamic
>>>> +parameters changes are caused by changes in the device's state, not by
>>>> +commands, still they are delivered as responses to implicit
>>>> +VIRTIO_VIDEO_CMD_STREAM_CLOSE and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS,
>>>> +respectively.
>>>> +
>>>> +Events start with a header:
>>>> +
>>>> +\begin{lstlisting}
>>>> +#define VIRTIO_VIDEO_EVENT_FLAG_ERROR              (1 << 0)
>>>> +#define VIRTIO_VIDEO_EVENT_FLAG_STANDALONE         (1 << 1)
>>>> +#define VIRTIO_VIDEO_EVENT_FLAG_CANCELED           (1 << 2)
>>>> +#define VIRTIO_VIDEO_EVENT_FLAG_BLOCKED            (1 << 3)
>>>> +
>>>> +struct virtio_video_event_header {
>>>> +        le32 event_type; /* VIRTIO_VIDEO_CMD_STREAM_* */
>>>> +        le32 stream_id;
>>>> +        le32 async_response_cookie;
>>>> +        le32 event_flags; /* Bitmask of VIRTIO_VIDEO_EVENT_FLAG_* */
>>>> +};
>>>> +\end{lstlisting}
>>>> +
>>>> +\begin{description}
>>>> +      \item[\field{event_type}]
>>>> +            is the type of the event.
>>>> +      \item[\field{stream_id}]
>>>> +            is the ID of a valid stream.
>>>> +      \item[\field{async_response_cookie}]
>>>> +            is an async response cookie provided by the driver, that allows
>>>> +            to relate the event to a previously submitted command.
>>>> +      \item[\field{event_flags}]
>>>> +            is a bitmask of VIRTIO_VIDEO_EVENT_FLAG_* flags
>>>> +
>>>> +            \begin{description}
>>>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_ERROR]
>>>> +                        is set if the command finished with an error due to an
>>>> +                        invalid argument or for other reasons.
>>>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_STANDALONE]
>>>> +                        is set for standalone events, see
>>>> +                        \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
>>>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_CANCELED]
>>>> +                        is set if the command has been canceled by another
>>>> +                        command, that has higher priority. Doesn't make sense
>>>> +                        for standalone events.
>>>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_BLOCKED]
>>>> +                        is set if the command triggered a block on the
>>>> +                        outputqX to allow output format negotiation.
>>>> +                        When the negotiation is finished the block has to be
>>>> +                        removed using VIRTIO_VIDEO_CMD_STREAM_UNBLOCK
>>>> +                        command, see
>>>> +                        \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / UNBLOCK}.
>>>> +            \end{description}
>>>> +\end{description}
>>>> +
>>>> +The particular data structure representing the event is selected according to
>>>> +the \field{event_type}.
>>>> +
>>>> +\drivernormative{\paragraph}{Device Operation: Event Virtqueue}{Device Types / Video Device / Device Operation / Device Operation:
>>>> Event Virtqueue}
>>>> +
>>>> +The driver MUST at any time have at least one descriptor with a used
>>>> +buffer large enough to contain a \field{struct virtio_video_event}
>>>> +queued on the eventq.
>>>> +
>>>> +The driver MUST NOT put device-readable descriptors into the eventq.
>>>> +
>>>> +The driver MUST account for the fact that the async responses to commands
>>>> +might come out-of-order (i.e. after other commands sent to the device),
>>>> +and that some of them can be cancelled.
>>>> +
>>>> +The driver SHOULD wait for an async response of command A, that caused
>>>> +cancellation of command B, before queueing the command B again.
>>>> +
>>>> +\subsubsection{Device Operation: TLV format}
>>>> +\label{sec:Device Types / Video Device / Device Operation / Device Operation: TLV format}
>>>> +
>>>> +VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS/
>>>> +VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS
>>>> +commands represent device capabilities and corresponding device parameters
>>>> +in the form of TLV (Type-Length-Value):
>>>> +
>>>> +\begin{lstlisting}
>>>> +struct virtio_video_tlv {
>>>> +        le32 type;
>>>> +        le32 length;
>>>> +        u8 value[length];
>>>> +};
>>>> +\end{lstlisting}
>>>> +
>>> All the caps can be crafted using existing capabilities infra. Please restructure the patch to use it.
>>
>> Replied above.
>>
> Same as above.
>  
>>>> +\begin{description}
>>>> +      \item[\field{type}]
>>>> +            specifies the type of data in \field{value}.
>>>> +      \item[\field{length}]
>>>> +            specifies the \field{value} size in bytes aligned to 4 bytes.
>>>> +      \item[\field{value}]
>>>> +            contains the data according to the type.
>>>> +\end{description}
>>>> +
>>>> +The following TLV types are defined:
>>>> +
>>>> +\begin{lstlisting}
>>>> +#define VIRTIO_VIDEO_TLV_CODED_SET                1
>>>> +#define VIRTIO_VIDEO_TLV_RAW_SET                  2
>>>> +#define VIRTIO_VIDEO_TLV_LINK                     3
>>>> +#define VIRTIO_VIDEO_TLV_CODED_FORMAT             4
>>>> +#define VIRTIO_VIDEO_TLV_RAW_FORMAT               5
>>>> +#define VIRTIO_VIDEO_TLV_CODED_RESOURCES          6
>>>> +#define VIRTIO_VIDEO_TLV_RAW_RESOURCES            7
>>>> +#define VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES     8
>>>> +#define VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT   9
>>>> +#define VIRTIO_VIDEO_TLV_CROP                     10
>>>> +#define VIRTIO_VIDEO_TLV_V4L2_CONTROLS            11
>>>> +\end{lstlisting}
>>>> +
>>> You can use the 'flow filter' example of network device to see how to frame the individual or group of capabilities.
>>
>> Checking it, thanks.

