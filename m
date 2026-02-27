Return-Path: <linux-media+bounces-53741-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFPjNwTMoWnbwQQAu9opvQ
	(envelope-from <linux-media+bounces-53741-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 17:53:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADD51BB0C4
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 17:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87CBC3087D16
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 16:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118D5349B15;
	Fri, 27 Feb 2026 16:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Htr0BPJy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGo1bR8n"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF963469FA
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 16:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210958; cv=none; b=JADFzXMqC9HR0uIJ8fWAVrwABMPPs6FU02hgYuVAy8KLTp78mrSMsYe/PYIZu4FI02MdN/0Rsh95o8VlO9rU+QRZBtZQOB341DK93LU5wQD/nKDKYDKj14iE1uoiSD8UceAKYR83PZeCrVST/xP/ovs1yd0OKvveY4rj+ix5/nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210958; c=relaxed/simple;
	bh=qS+jq1JrvcU5hElzUv5cMkCRMKosDacHXQdATwP+kLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1pk8mXcDVjgqHctBPFZcWxafnPuXIPHDZLBazjwnp0pbfnhsy2NfRLCsniUaNW69pImRZjjEk1RNxdgBwkjcObddEIL2FW/NfjmrP/vmLVjzxETkfisSjImYxsNj5vGZSx+ejqO+kLHTQG2mjEO4BjYUkcSx4XeDkuKYXqOZdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Htr0BPJy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGo1bR8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RGj2MT4171699
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 16:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GF8gzs0Y2ObftuKtilXKIdvF2o6qLBxvxxDd8LVJ5J8=; b=Htr0BPJyfQzNZWnH
	KGwS/K4b90TqkpIVkjY0WQe6wv7osT/++zLDbJdsOlQu1wgmilzT7eDC5LNmjtBu
	IlenPEPLjuXuquEQTglM37TkAYLMnDs4mKZWEg8xDM4bioZKTH3GWGBSwnOg7YyT
	7w/lZ2t6yKpOev3+azKx/xeNjxEfSRHZmAxuUaJlcYXapHUVVbO4FoOs3OAW0APm
	mUdv8HKkeat8x4wHvfBDsRCDcApnTWrd1OWtuU6Q3zZ/7d9JCyteLxHjzql7M7e2
	hL5NP0g0Wal1Areu0rTQ9JeiMT0iYJfEBo18krSVBCKFe7r8wdIqrsoOAVXh+Wkx
	/OmJjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuytus3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 16:49:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3978cdb2so209188885a.1
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 08:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772210956; x=1772815756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GF8gzs0Y2ObftuKtilXKIdvF2o6qLBxvxxDd8LVJ5J8=;
        b=TGo1bR8nkZjEpQX3qC/4v6YHp6hgIe3cOZ1fQZHMMEHcyId+SA0VE2qOLIspQbVfli
         MovGjc+Uwxs7gk8a0wuvw9YJKj3JXW5ELsT9rZ4EnGgz8uR8vpwrtZv2DbJV61lOp6K2
         rui198P2Gs0nBCKm/eDoMwvP5aEiLZHWZYmrTMFoOyBGBBLlb72LFub7UARbWh/BGzx/
         UXkR7NWtHyhrz8M1XrFg+4b2vtLNs+3NLjFooDFDp4kfpXXMDyhs+mITRVXfQb/fMkQB
         xpGgt+EIjUjwFzezFFRPoUO+h1oLkV8RQpNEyBCHyrxSQaUmX/JP2fvk66CKDwaR+kyT
         eWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210956; x=1772815756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GF8gzs0Y2ObftuKtilXKIdvF2o6qLBxvxxDd8LVJ5J8=;
        b=qwHNWZkVzkOV0+rkVZFegGTGBX7xhOOa2kXhfveMZ/txK+GecHypPfAbQV+QsWihR/
         yO5dP5f/tH1OEg3syE5HelaF0QWEs5k05VduTN6pzF3XO6J19/kfO3HpBxl4sLM17anr
         EmMgOHVTY7S+PoMkjdN227RpRmET5RJw8sqCbgohEWwAbiCpwT1TbitbUcnv2HpjFNBv
         vdapROjc69zQ5PMaoC7nGkPd+PLQcTUL0JasGNOQXS556Spu4z2WfwuA4d4cVoWeWndB
         pmhiV7V/uOjxFAlBDK3Ze0mWWqwRNVCWIUCziO4KokV7KwUILSxSBd3a108T5UWC2SeE
         MM0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVcJSbFvkqZ/W6oPNa1Rb/5xxZoaAinOT6vQhyB/fs4SvWP/vs6K+PCEEJbJnWD3nurC0q/GG2yKghzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRfddJrKO7U3hWanA//+wWzXVjYwtgUrUyMmLiukUA9vPPzDJC
	colITlSqTKiVaf7WeiZKSS6lQbDJ7Qi6Ka5ZpMV0S+Smf8QmanNY3sNifQYSe4q9kfQqbDdpkne
	qqVtwLmgYv2iNijxeCIit0hHyf48+yj/SDhwHCZSojJ3kGVvafffz8lvdXjNPPevAOA==
X-Gm-Gg: ATEYQzzEzDUKaV8rs4+LN85sU9krhtrIYGOVFF9XSP+32BDqfFPtXM8ue6p0eGAxODX
	Z/J1vJSDO67mv3Ue/DDPio9P3ovX9thDvx4hmsDl7XTq8Y2eeAXZ9L5am+/BfE9dZYfHpEL2Ajr
	tzx/QggJrdzPiVQ+J1FFy33f7UOqRgyXaLU6DDMtwiaGMid/2dNvRa/AjhQts45QEB0HwZanHsi
	M1jMm3Dx5ujeDDgtZMG7tHqNxnrZaLpNvu17satdDvd8wjMZ/N2i0yEyoeQo+wXmwoBDp7AVMYJ
	/XweF9FA1MutgCH00MgAU8CYS6jmXF+VjsJTLsd6cAOF4mEBjwwXXui6RbYVaaUsL09Gwp6WbGd
	/Gq3uLPrdmnHmq926CoGSqqDKgbY6jsonGe5yQ00KTj6fMKSYffQIOaoWPCScT85KgW2DL7S40U
	ibv0o=
X-Received: by 2002:a05:620a:25c7:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cbc8f5a1aamr328588285a.10.1772210955413;
        Fri, 27 Feb 2026 08:49:15 -0800 (PST)
X-Received: by 2002:a05:620a:25c7:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cbc8f5a1aamr328583485a.10.1772210954927;
        Fri, 27 Feb 2026 08:49:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec4426sm162355466b.56.2026.02.27.08.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 08:49:14 -0800 (PST)
Message-ID: <6fe3a1a8-46c7-427c-abb5-2e7366a43392@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 17:49:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] media: iris: switch to hardware mode after
 firmware boot
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-2-850043ac3933@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-kaanapali-iris-v2-2-850043ac3933@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bJIb4f+Z c=1 sm=1 tr=0 ts=69a1cb0c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=uMIPjMpX8He5E15aO8IA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: JoOgGLCF579lGcOK3tlziGptCpbOUxUX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE1MCBTYWx0ZWRfX4O762XpRTj+y
 yeMKG0MiYdZxS0+EmUF0GykKpP7a8LNSY6bsp1lSFgtGysiP500l/ZHDDfpHxzp9G1YjM47mi92
 jDSKVbOWVE24CAVgyOAR4oYWYk04BB+KKEnvcF1B8OKUzw2amO8T03i0N5A5q85vzPo88ZYmzrP
 a99YWvNhkRdsCjlNSDVOR8MXFaUT+GZFVRMAxC0SGeSUB4V3BnxvuPJ6/INcvkE2gQUSP5iiw7R
 PAe5fFY39+4FadtURhzQoCfyTMp/yGaRzaOKkv9rvg+WrbespPL9QxCPMIAgsIPVrnj46OFAyEr
 ibeBWzGhr2hqX0/T7/D8vmSEGeLPrfYCBo0cB4V5wzCPnxOBvO2SpsTQmQJbWMCrbLDfmpIOPch
 9tjHJf4wgSiH2K1sPIHFpB6bXarZ9vQAilAIer0KZjgG5mGQIcLwbkYQ6KcmQniomvJK8Qw3/qI
 Kjsll3bSoG9wlRsyiNg==
X-Proofpoint-GUID: JoOgGLCF579lGcOK3tlziGptCpbOUxUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270150
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53741-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4ADD51BB0C4
X-Rspamd-Action: no action

On 2/27/26 3:11 PM, Vikash Garodia wrote:
> Currently the driver switches the vcodec GDSC to hardware (HW) mode
> before firmware load and boot sequence. GDSC can be powered off, keeping
> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
> carry default (reset) values.
> Move the transition to HW mode after firmware load and boot sequence.
> 
> The bug was exposed with driver configuring different stream ids to
> different devices via iommu-map. With registers carrying reset values,
> VPU would not generate desired stream-id, thereby leading to SMMU fault.
> 
> For vpu4, when GDSC is switched to HW mode, there is a need to perform
> the reset operation. Without reset, there are occassional issues of
> register corruption observed. Hence the vpu GDSC switch also involves
> the reset.

Is that a characteristic of the hardware (e.g. also seen downstream), or
is that required with upstream iris only?

Konrad

