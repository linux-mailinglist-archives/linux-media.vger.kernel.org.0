Return-Path: <linux-media+bounces-54065-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELQUGG9VpWnR9AUAu9opvQ
	(envelope-from <linux-media+bounces-54065-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:16:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BAD1D5653
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E02E1305C2B5
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 09:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C63C38CFEE;
	Mon,  2 Mar 2026 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzf41Olr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHf8/NaK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3A438CFF3
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442779; cv=none; b=iaatQqf8EJ5y6HpJgiqdu750YoG0gjdko0eA9QmPOhqVjFNW8VXznx8bN8MQSnAlj0sbQts8NyEqPKrewX5IJNyF36yzZqE3UDikq0IDWgpfzQxtAIijTia/I5WPJ1eGm60tv0mXpmwlzFbhPbzxbvnZxnCVQAbe6X0FVFkwHio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442779; c=relaxed/simple;
	bh=upR9qprZzNZKObkJyZBXoQ2flW1n8CMNghZ1KRkdicA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fE6ag1ewYwpi6P1XTwjQAjD31WVIIxu0Lcn0JAU0likeglHvzARl/VPIiEBXTd7BB+QeeSr9iWqPxWKW+wovTZRsTJl82KBdrWGxAlyyBZv6yin7ZpeqQ0K5hyBWBv/WZUhE46+tgsG6Y+EnXQNLTVgyftXQDubtwlLHpoBjiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzf41Olr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHf8/NaK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294sO21291635
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 09:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUKup/XfO3qrGbQJzWHbBXV03Pa7ritqjhXq2ej50ho=; b=fzf41OlrSKkpQ6wi
	cPQXO5M+H1/gKBOaYXUE9BMMfcSeGx6uEDuGZwsV6Lq/my7EBWG7XVuLcNdZVZOB
	tSNDpjP9FtPPM6iRJHZNHDS+OOflGy+z5cH3tFGhNqlwtxYdGJW5wbNWdZTgWQOk
	V1kdZnXxUtPv83ZpKQnB8FeCY9+wu6Mxz4I2dyAN6IX6diuuKNaFkAlazxJdsoaw
	gYzC3Kk1n4VHbhHDUmxRT4knmV/BOZd0Lbb80uMjPOqswfxyFGS+h51ftHuBN74E
	QHtVo1SnCm+zRdOYV2YUkcg2ExftgfTOXynvwoGd2evfkuzDo09ACqGAovNTqVLA
	fk8GnA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7ku012c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 09:12:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae49080364so9664875ad.0
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 01:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772442776; x=1773047576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUKup/XfO3qrGbQJzWHbBXV03Pa7ritqjhXq2ej50ho=;
        b=CHf8/NaKFovT9gBAlTm/7OosaAD+pAzfCcd0C0WyU36RR6Uti4MKNwn6qPJ92AZWCh
         yHF5X+qPuYNfNGY2glA/0TWkZ37M9vU5T3fEil3CwLSF/iYZYSvo+ImRFaf6xZ/lAe9N
         J8S7V1xWbatndOE9o81v5hdIqWBEA+jSCMjO94X4GW4QReUJu4Z4ZSvCOPsGGK2TtG9+
         d8Zkkpi+bYSzI8C7TIKXR5U0UgijIg2+iSVerHrmM/rXUjH9k4Dq2nk+FuNmquvZxMPB
         Wx8sE17h1j1nR4HIAVMHLTv52oMfLvkH4frll31c90EypaNOjYpR3zWqRBGqnssSByNk
         zqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442776; x=1773047576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUKup/XfO3qrGbQJzWHbBXV03Pa7ritqjhXq2ej50ho=;
        b=KE5SkVGqbt0ZXauKJ3iawPBIKDWfNNrf3fAeL/woJqzJxEhsxOA6C2OiPGtgP/aWlw
         SsrUm6Q3nAtvWYW5OUM7d1+xmj9MZ1xDPPH5e+C2dku26z5hWSwfcjJ9xLkD6U7AgzyE
         xfJH+ljyA9vOpGpvBVUM4HWe3sjxyc0wwQI+iRfOI6Ybq2DRRIXJuEUhSzalX6YtY+Aq
         kBPrcl9vgry86sRXfKY+xxxuOZLCPj8d1n+fSyHwWrDvDGevqq4bi2Wntjmi3gWqpdQs
         xmWMOoqLgBfv6n8PVOtGY/HasGHa5cWMOA3hiY8QzyZZ5kq+hOSldvAg9Enqf+JnTMis
         lzNA==
X-Forwarded-Encrypted: i=1; AJvYcCUA1xUta+SP9OdqXGlstZGKYtkehq+Er2xiFLJAz4dErpw62Ne+4JpXVDtE8pPxXpVEgmDlnBhunGSw2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlv43cup2znc6Hj3wn99mSdk/ImhpX3QQ7FFY4pg67MoH3prIz
	MTqSQhI7Ll23UXZqz0IWJnCGPgPfn/9DgWYvf2Vhz6FIX8PCvRbEXwbgoGd2wew8jBaW1ymz4AH
	ReN6juoLPkVBtimdYdWSt1elMpFoDc5oni3ejP/60sSmTqsTZoKmhU6Pm0pEiUM75+g==
X-Gm-Gg: ATEYQzxjVKa6HTtqHnfK5UaT3v0a5NVyAMLkwVPyXXQY6OkayeGDD1ZXUGGE5fvHCZK
	JMi9nupMMqq41R4Psk/xqkNMAYLKviQBKV7ogQ2pblgjnmEFj36n7qa8osoFPa8Mu30DWMXZXK5
	YW0JS6DLKmaE88aRwzQu80LoqlJCV8vTA8SzCjTXysDb3tzpg8rvkMsyf7IMnrB4M0JWD/SEfX9
	HjDpHhoXYWnmSsA0C6c25ZuEqjG3hzE/2BOtUzahUO2J/8SSYofSNHw/LJgdlphMW1I9ifwT4fC
	KQzBjueW3z1azoq2VF3RNJAGtvbAvjqQsEII8Qn1aQWj3qgvwWD4n+hEfVYkJnRAFdj7SlRWYDF
	GfSJ9Zp37s9rqSAmhcRQmBaJlcE/bertUEJw4MarqUoYTAv13YA==
X-Received: by 2002:a17:902:d58b:b0:2ae:5655:b16 with SMTP id d9443c01a7336-2ae56551006mr12820335ad.21.1772442776038;
        Mon, 02 Mar 2026 01:12:56 -0800 (PST)
X-Received: by 2002:a17:902:d58b:b0:2ae:5655:b16 with SMTP id d9443c01a7336-2ae56551006mr12820065ad.21.1772442775550;
        Mon, 02 Mar 2026 01:12:55 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b0691sm178825005ad.11.2026.03.02.01.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:12:54 -0800 (PST)
Message-ID: <4abcb402-8d57-4bd3-ab8f-3a96c11b3410@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:42:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 16/18] accel/qda: Add FastRPC-based DSP memory mapping
 support
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-16-fe46a9c1a046@oss.qualcomm.com>
 <fd7a2ac7-796a-4cdb-a55f-91e42f08109c@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <fd7a2ac7-796a-4cdb-a55f-91e42f08109c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69a55499 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=A3mkvOHymaTnmgbQ1zAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 0PRF8bH6cEfmt_0cunpi4tnxmFoPWB3b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OCBTYWx0ZWRfX+Nq5X9nG+Vki
 k78O1lpSuyd8W1JHPE9r/ztjL4m29FGdhXYxPPdpu0hU2A4KD2N3fCfsUq1plUs29gL+WcUmKTl
 7MZA5ctEHoWkD+Bpk5neOBqmsTYw4gL+cRmyTe0Q8Rpiucdqcnz7vFFHvzdaC//cNwSnKUwi5XS
 /E/oo1Ft78Zi6cqVehZQXjQvXex4U2Re1YwEvIDLCnrdxYtdEijFVuCSqkUkfAYLbrEmk+8GzL9
 pUOJbIL+XjtEWnMFlIe2dg4blUp3eZD7JGTv4YIHQH0phV2DaoVnej6h4xH9ZfDlTi9r9NK/YcB
 4INdfI3V6jqjJpw5noE225yBPAM/bKxmBrHqNdzzb2JUqTPNE5uWqQcxtaLPvlGV57JP7r58d84
 4K4awLbaJsqRRtoBTm23SGgue3lOAkYMyXsDtM/I6ZkFw30HIwqnfXns60JJO7Th6PWkyMAK6Wt
 YaQhA0xpFvpQCpglwJA==
X-Proofpoint-ORIG-GUID: 0PRF8bH6cEfmt_0cunpi4tnxmFoPWB3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54065-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00BAD1D5653
X-Rspamd-Action: no action



On 2/26/2026 4:18 PM, Krzysztof Kozlowski wrote:
> On 23/02/2026 20:09, Ekansh Gupta wrote:
>> Add a DRM_QDA_MAP ioctl and supporting FastRPC plumbing to map GEM
>> backed buffers into the DSP virtual address space. The new
>> qda_mem_map UAPI structure allows userspace to request legacy MMAP
>> style mappings or handle-based MEM_MAP mappings with attributes, and
>> encodes flags, offsets and optional virtual address hints that are
>> forwarded to the DSP.
>>
>> On the FastRPC side new method identifiers FASTRPC_RMID_INIT_MMAP
>> and FASTRPC_RMID_INIT_MEM_MAP are introduced together with message
>> structures for map requests and responses. The fastrpc_prepare_args
>> path is extended to build the appropriate request headers, serialize
>> the physical page information derived from a GEM object into a
>> fastrpc_phy_page array and pack the arguments into the shared message
>> buffer used by the existing invoke infrastructure.
>>
>> The qda_ioctl_mmap() handler dispatches mapping requests based on the
>> qda_mem_map request type, reusing the generic fastrpc_invoke()
>> machinery and the RPMsg transport to communicate with the DSP. This
>> provides the foundation for explicit buffer mapping into the DSP
>> address space for subsequent FastRPC calls, aligned with the
>> traditional FastRPC user space model.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig    |   2 +
> Not relevan there. Don't stuff other subsystem code into your patches.
> Especially without any reasons (your commit msg must explain WHY you are
> doing things).
Please ignore this, it's a mistake pulled from my local test branch. I'm not going to add any
defconfig changes as part of this patch series.

Thanks for pointing this out.
>
>>  drivers/accel/qda/qda_drv.c     |   1 +
>>  drivers/accel/qda/qda_fastrpc.c | 217 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_fastrpc.h |  64 ++++++++++++
>>  drivers/accel/qda/qda_ioctl.c   |  24 +++++
>>  drivers/accel/qda/qda_ioctl.h   |  13 +++
>>  include/uapi/drm/qda_accel.h    |  44 +++++++-
>>  7 files changed, 364 insertions(+), 1 deletion(-)
>>
>
>
> Best regards,
> Krzysztof


