Return-Path: <linux-media+bounces-63478-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J1StAnu5H2o2pAAAu9opvQ
	(envelope-from <linux-media+bounces-63478-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:19:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FA86343E3
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:19:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Tz4k9u8e;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZSe6Xnvi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63478-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63478-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1968E30557FB
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 05:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA56D31AA8F;
	Wed,  3 Jun 2026 05:19:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB59430148C
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 05:19:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780463970; cv=none; b=C5PrcpZpd8X9KbOhrmAKpwOVSdLv0rrB1BHKZ6vPvay35hRr6ic5HOX+lgzOapTop6EemYfjKojNgW5/cUYH86DgO6Ud7aCbD2akT6gBO9lNS81vLpBCVFRiqJjE72nIJU2JZd3MgsIIV5+Fw/UW9wzBvw18cZEbJIukj5dpk1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780463970; c=relaxed/simple;
	bh=ernpbc8mYW3pnQ6ReVEaUvPZ/tMCJlEDj12Fyv3+pSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uU8bdu/4IiXV/42BGhXKXnT76YF3QvYAj2lZNDNHt5vCaS6lTlB6PKGGFIG4XbFjDuEgZuO87t7fyU/s9/C/1EUtXgHgDsOfM5XcCSo9URIk4z7xJsHU53VFzdGGsAXf0T7qbhVXsBlSuZZTCWc2oDIDSvNYnArSVzxEmCm0/FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tz4k9u8e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSe6Xnvi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6533Kg7E3357003
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 05:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOezco5+6BfmrPgKfWENo0B2DWVFkDWfjF+LxPufsWM=; b=Tz4k9u8ewVkJrO5B
	99GB3NoAxaV/ZgnBI5djpO9t9CiuxBOwWbgiYZ15Dou2NkfUl8fwbVqvcH43VPdv
	CbvtGdm5wm1S3ktWSq+pyilEiuMMVToFEPobSTan3F5560/XS80pGmmVW5AVHTka
	O/8ly7e9RsUFprK66xn7pC6IE/4WSSuiMoOzXQeNBZA9BdpGzL0Ruv7bIJaWERnR
	odTUeR0vun/2F2aJVwrX5Lj/iykCVQFntqTduXCHhVjh1peZZaYQhw4J+Ygb5VP+
	qxFlqBpRupSQbHc59MIYsSyr4/NOmG4Txf3R0iRg1a5Tb03mfXePTk1nxr3pyR1o
	J6EcXQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehvkxcc1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 05:19:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso5079071a91.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 22:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780463966; x=1781068766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jOezco5+6BfmrPgKfWENo0B2DWVFkDWfjF+LxPufsWM=;
        b=ZSe6Xnvi78f7dpCu/YQ3dVcyz1y9UvPqCPjRXeBmuvNrME6bADNhAc8G2JvM+zsD4W
         M3md03KF7WH5LuddAH1xANrgxB1jLds+y61j1pDQr/Se4zl1wJoMNSWcoCWs8iqi9Gq3
         GwhKMcMMkHAFGUIblHf543U3pMHkX5FAWke3OiR98Qv+WyaZepqGjPhYwsVIFYAnKhae
         cPz9gX6PBn9Q6ir5///3r5BBULeWKqJraHZ/fOLhLhDYi59hg8wGVnlYFXEky5DEQ0zR
         3rM/nhnRPltXzIUbl/f1Zktbn18asrgv8tfS24hCxE4yr7Ls4OAwCEcVX2p8ean3Ib9Z
         GQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780463966; x=1781068766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOezco5+6BfmrPgKfWENo0B2DWVFkDWfjF+LxPufsWM=;
        b=lR/ytTeFxjyoCzxBjCJZAZU4cWY9t+RFPCd5vGYy9NS8sCYJOA9Isv+XI45UJy1GX0
         ahrCQSuCurvfDCX/mQcs5J6GSaTAYdGR0oIKkcnuZkHGtZiuJcZ3vdWmtYPhqVjeBUDp
         22TSXbHCQiEPSZdQ8Pnh1taor7TH98xZogDK6B6CJRQGwSDIdjuQAUp567dOXPAT1oyQ
         QKrUbk66xVG1TfVob6dETVCIvOHjwiMghUaSK358a/1UmNNQ0G5mSRk4eaVM4moIn8MA
         3I9I1zWG677oILeXnzgIaz5KP4lgIqz79oQX3ZadWskX1b5UemVksSnpIM+yECGG+xVr
         8CKg==
X-Forwarded-Encrypted: i=1; AFNElJ9sZ7NjqEjMNoE9uw4IOGsyi9KCb555pF8pnEvhfGAfiTY9dYKPb1YxPgElurhO4WPNRvx2VezwsWB0bA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNz/HWjgMlS1TDuEpnPSz5dSL0KYQzDqxdLJB3UlMY6+8+8mRr
	hmXYS9YUMy8taejesgch6p3sJFGnqmjZJCnMkcDLPzw3GsSFvCKhg+ZqvUCzEXwiZbwDAYuuxIe
	S8VKwW733/LZYH6UZVvo/YEGXsENLYt6ueBFakMj79vSqa2Mi59DyhMuUn5CR2C8Fng==
X-Gm-Gg: Acq92OHt+BSt6b6ikGAi+0cRcZ+ruaHfuUr+HjprvQe1Fm5+t0S3voyend/V+J5FhkC
	GINc9YaLdz8ntQWLjFGlR8/bsH3Nl06OSkL6hDKMy+51L1wWwmteg08Zat++B9Z6Sj1uAq0U0Tf
	0PcRrJQecRGCIxOIIU13rSz+4Ro6ifndu2IisUMLynPMJDVUJodl64PD5ZoeMuAYeHk8SoBfQpR
	5dQkoJRPchkaHKk5tYArIx7T+jh7+pzcXvMDtgRFHOtVitMOKBa187QYT22KE9QQAar1OPggCPr
	cdnswqcs5PShS0DnpBTRAY8UFkSSXn3zGPeTCC0vFvJE/gbsy8UM2KDvUlMOU0mzhsFhLoKrzyL
	ys/l0ukSirIzt4n0Jt2FU6XE7Xk8kzJVkUi0VxPn3HVtZLYQE0i/rC7fXD1/7
X-Received: by 2002:a17:90b:540c:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-36e2f3c32demr2076737a91.9.1780463966254;
        Tue, 02 Jun 2026 22:19:26 -0700 (PDT)
X-Received: by 2002:a17:90b:540c:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-36e2f3c32demr2076710a91.9.1780463965719;
        Tue, 02 Jun 2026 22:19:25 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a14485esm1695509a91.3.2026.06.02.22.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 22:19:25 -0700 (PDT)
Message-ID: <77511905-1dac-4605-8195-68ec770740d2@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 10:49:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] accel/qda: Add QDA driver documentation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-2-b2d984c297f8@oss.qualcomm.com>
 <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O2Z3AVkCqCheIAb6LXfWsDIr1u7m6NDI
X-Authority-Analysis: v=2.4 cv=GYknWwXL c=1 sm=1 tr=0 ts=6a1fb95f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yE1-P__lAf5keu_9ItMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: O2Z3AVkCqCheIAb6LXfWsDIr1u7m6NDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA0NyBTYWx0ZWRfX0LSgtDakCBCa
 4bRDFt9Mnc3pWvBsolZ2QYEIDHE0kZDpdToDfi6ajJiH10wAGT2gvXsvNQW+GbbjLOnTRArXY00
 /ZnrYFTwmRaWinl5MXZSUqSgCjO6IDoAkbqy2o0O/o+xez5pO0wSSk8665mJ324W7nfXji0kKjT
 JtNtuUnvuBsMesfj/yt+EcSp+JIjsGuAykiR/ILpW1G4FaDhgoxB8VIAm7HaGXtpsnJUT6wXe6C
 //6bNY9nscqrVOG1f7nitrpo2e8Jh522q8J0wKEwNyptFD/m8lN1ZykVzp8ONsni7V/MrHGy874
 ofGFu7YCHXGM2Jywt1KgGrhH7FWlUUsQ0jqC6sKMi+Htp9r9xUGFQxNt70W/wjCFG8bUcLn3luy
 C3G8hNrWjruPDWI/oxEGEmDp9LnD85v949vI+WWGlJKZg/Om7GCE6Fh2T1lSECWX7AAxilvwm4z
 PYyA1vTwGkgaRma3zvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63478-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,foo:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56FA86343E3

On 20-05-2026 19:42, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 11:45:52AM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Add documentation for the Qualcomm DSP Accelerator (QDA) driver under
>> Documentation/accel/qda/. The documentation covers the driver
>> architecture, GEM-based buffer management, IOMMU context bank
>> isolation, and the RPMsg transport layer.
>>
>> The user-space API section describes the DRM IOCTLs for session
>> management, GEM buffer allocation, and remote procedure invocation via
>> the FastRPC protocol, along with a typical application lifecycle
>> example. Sections for dynamic debug and basic testing are also
>> included.
>>
>> Wire the new documentation into the Compute Accelerators index at
>> Documentation/accel/index.rst.
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  Documentation/accel/index.rst     |   1 +
>>  Documentation/accel/qda/index.rst |  13 ++++
>>  Documentation/accel/qda/qda.rst   | 146 ++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 160 insertions(+)
>>
>> diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
>> index cbc7d4c3876a..5901ea7f784c 100644
>> --- a/Documentation/accel/index.rst
>> +++ b/Documentation/accel/index.rst
>> @@ -10,4 +10,5 @@ Compute Accelerators
>>     introduction
>>     amdxdna/index
>>     qaic/index
>> +   qda/index
>>     rocket/index
>> diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
>> new file mode 100644
>> index 000000000000..013400cf9c25
>> --- /dev/null
>> +++ b/Documentation/accel/qda/index.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +==================================
>> +accel/qda Qualcomm DSP Accelerator
>> +==================================
>> +
>> +The QDA driver provides a DRM accel based interface for Qualcomm DSP offload.
>> +It uses the FastRPC protocol and integrates with DRM and GEM infrastructure
>> +for device and buffer management.
>> +
>> +.. toctree::
>> +
>> +   qda
>> diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
>> new file mode 100644
>> index 000000000000..9f49af6e6acc
>> --- /dev/null
>> +++ b/Documentation/accel/qda/qda.rst
>> @@ -0,0 +1,146 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +=====================================
>> +Qualcomm DSP Accelerator (QDA) Driver
>> +=====================================
>> +
>> +Introduction
>> +============
>> +
>> +The QDA driver is a DRM accel driver for Qualcomm's DSPs. It provides a
>> +DRM accel based interface for Qualcomm DSP offload, supporting workloads
>> +such as AI inference, computer vision, audio processing, and sensor offload
>> +on Qualcomm SoCs. It uses the FastRPC protocol and integrates with DRM and
>> +GEM infrastructure for device and buffer management.
>> +
>> +Key Features
>> +============
>> +
>> +*   **DRM accel Interface**: Exposes a standard character device node
>> +    (e.g., ``/dev/accel/accel0``) via the DRM accel subsystem.
>> +*   **FastRPC Protocol**: Implements the FastRPC protocol for communication
>> +    between the application processor and the DSP.
>> +*   **GEM Buffer Management**: Uses the DRM GEM interface for buffer
>> +    allocation, lifecycle management, and DMA-BUF import/export.
>> +*   **IOMMU Isolation**: Uses IOMMU context banks to enforce memory isolation
>> +    between different DSP user sessions.
>> +*   **Modular Design**: Clean separation between the core DRM logic, the
>> +    memory manager, and the RPMsg-based transport layer.
>> +
>> +Architecture
>> +============
>> +
>> +The QDA driver consists of several functional blocks:
>> +
>> +1.  **Core Driver (``qda_drv``)**: Manages device registration, file operations,
>> +    and DRM accel integration.
>> +2.  **Memory Manager (``qda_memory_manager``)**: A flexible memory management
>> +    layer that handles IOMMU context banks. It supports pluggable backends
>> +    (such as DMA-coherent) to adapt to different SoC memory architectures.
>> +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
>> +
>> +    * **``qda_gem``**: Core GEM object management, including allocation, mmap
>> +      operations, and buffer lifecycle management.
>> +    * **``qda_prime``**: PRIME import functionality for DMA-BUF interoperability
>> +      with other kernel subsystems.
>> +
>> +4.  **Transport Layer (``qda_rpmsg``)**: Abstraction over the RPMsg framework
>> +    to handle low-level message passing with the DSP firmware.
>> +5.  **Compute Bus (``qda_compute_bus``)**: A custom virtual bus used to
>> +    enumerate and manage the specific compute context banks defined in the
>> +    device tree. The bus was introduced because IOMMU context banks (CBs) are
>> +    synthetic constructs — not real platform devices — making a platform driver
>> +    an incorrect abstraction for them. The earlier platform-driver approach also
>> +    had a race condition: device nodes were created before the RPMsg channel
>> +    resources were fully initialized, and because ``probe`` runs asynchronously,
>> +    applications could open a CB device and attempt to start a session before
>> +    the underlying transport was ready. The compute bus makes CB lifetime
>> +    explicitly subordinate to the parent QDA device, closing that window.
>> +6.  **FastRPC Core (``qda_fastrpc``)**: Implements the protocol logic for
>> +    marshalling arguments and handling remote invocations.
>> +
>> +User-Space API
>> +==============
>> +
>> +The driver exposes a set of DRM-compliant IOCTLs:
>> +
>> +*   ``DRM_IOCTL_QDA_QUERY``: Query DSP type (e.g., "cdsp", "adsp")
>> +    and capabilities.
>> +*   ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE``: Initialize a new process context
>> +    on the DSP.
>> +*   ``DRM_IOCTL_QDA_REMOTE_INVOKE``: Submit a remote method invocation (the
>> +    primary execution unit).
>> +*   ``DRM_IOCTL_QDA_GEM_CREATE``: Allocate a GEM buffer object for DSP usage.
>> +*   ``DRM_IOCTL_QDA_GEM_MMAP_OFFSET``: Retrieve mmap offsets for memory mapping.
>> +*   ``DRM_IOCTL_QDA_REMOTE_MAP`` / ``DRM_IOCTL_QDA_REMOTE_MUNMAP``: Map or unmap
>> +    buffers into the DSP's virtual address space. Each accepts a ``request``
>> +    field selecting between a legacy operation (``QDA_MAP_REQUEST_LEGACY`` /
>> +    ``QDA_MUNMAP_REQUEST_LEGACY``) and an attribute-based operation
>> +    (``QDA_MAP_REQUEST_ATTR`` / ``QDA_MUNMAP_REQUEST_ATTR``).
> 
> Explain, what happens in the users don't map the buffers into the DSP
> space. Will DRM_IOCTL_QDA_REMOTE_INVOKE handle the mapping or not? What
> is the difference between those two modes?
I'll add more details for this, this is specifically required when
persistent type of DSP mappings are required.>
> Would the driver benefit from using GPUVM?
I'm not exactly sure how this will fit in here, I'll check this and get
back.>
>> +
>> +Usage Example
>> +=============
>> +
>> +A typical lifecycle for a user-space application:
>> +
>> +1.  **Discovery**: Open ``/dev/accel/accel*`` and use
>> +    ``DRM_IOCTL_QDA_QUERY`` to identify the DSP domain served by that
>> +    device node.
>> +2.  **Initialization**: Call ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE`` to
>> +    establish a session and create a process context on the DSP.
>> +3.  **Memory**: Allocate buffers via ``DRM_IOCTL_QDA_GEM_CREATE`` or import
>> +    DMA-BUFs (PRIME fd) from other drivers using ``DRM_IOCTL_PRIME_FD_TO_HANDLE``.
>> +4.  **Execution**: Use ``DRM_IOCTL_QDA_REMOTE_INVOKE`` to pass arguments and
>> +    execute functions on the DSP.
>> +5.  **Cleanup**: Close file descriptors to automatically release resources and
>> +    detach the session.
> 
> I'd have expected the description of the actual example. I.e. clone the
> app from https://the.addr, prepare clang >= NN.MM, QAIC (https://foo),
> run make, run the app, check the results. I'd remind that DRM Accel has
> a very specific requirement of having the working toolhain in the
> open-source.
ack>
>> +
>> +Internal Implementation
>> +=======================
>> +
>> +Memory Management
>> +-----------------
>> +The driver's memory manager creates virtual "IOMMU devices" that map to
>> +hardware context banks. This allows the driver to manage multiple isolated
>> +address spaces. The implementation uses a DMA-coherent backend to ensure data consistency
>> +between the CPU and DSP without manual cache maintenance in most cases.
> 
> GEM usage?
I'll add the details here.>
>> +
>> +Debugging
>> +=========
>> +The driver includes extensive dynamic debug support. Enable it via the
>> +kernel's dynamic debug control:
>> +
>> +.. code-block:: bash
>> +
>> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control
>> +
>> +Testing
>> +=======
>> +The QDA driver can be exercised using the ``fastrpc_test`` utility from the
>> +FastRPC userspace library. Run the test application:
> 
> pointer
ack.>
>> +
>> +.. code-block:: bash
>> +
>> +    fastrpc_test -d 3 -U 1 -t linux -a v68
>> +
>> +**Options**
>> +
>> +``-d domain``
>> +    Select the DSP domain to run on:
>> +
>> +    * ``0`` — ADSP
>> +    * ``1`` — MDSP
>> +    * ``2`` — SDSP
>> +    * ``3`` — CDSP *(default on targets with CDSP)*
>> +
>> +``-U unsigned_PD``
>> +    Select signed or unsigned protection domain:
>> +
>> +    * ``0`` — signed PD
>> +    * ``1`` — unsigned PD *(default)*
>> +
>> +``-t target``
>> +    Target platform: ``android`` or ``linux`` *(default: linux)*
>> +
>> +``-a arch_version``
>> +    DSP architecture version, e.g. ``v68``, ``v75`` *(default: v68)*
>>
>> -- 
>> 2.34.1
>>
>>
> 


