Return-Path: <linux-media+bounces-63047-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wONxIVWsGWpEyQgAu9opvQ
	(envelope-from <linux-media+bounces-63047-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 17:10:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D1260452F
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 17:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 248EB351299F
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 14:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8571F3E92B4;
	Fri, 29 May 2026 14:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WsnegsD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YEl7spis"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DEA2E719B
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066360; cv=none; b=d413xxfkOtOuS+C5gyuWS1S9uyGe1Fjo8NRvUCs//TcQE/D4X8LV5xIIY2zzus8TJ0XnNGoQD6ZfBuYWQXem9H36yNriVDKgDeTakuyzdp6piGQY7AikrFyxc2/S3OeIhzkuitw7y4EvrfMgZSiJyqy5j4pzsZf4Km7SNhoTPQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066360; c=relaxed/simple;
	bh=MGHfaR8jlzUkkXidIGH4kSnaaY60wAaRTetyKjPVzYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N6nepgumJhXJ1BvKEYUIQX2myM2oUiCFNdzfNcj17SWu+qQ9e15xrjrIo0a8aTY219R5+g+VfHy//MX2lK/6FYd1ynlfOm7GFkjKj4USaYMz0JZvAinkCTNegoBe0/HAG84JoFPT+2D9kVlG9OK4KoBLHocVZtrVmd21nVPK3Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WsnegsD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEl7spis; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLeub2748077
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=; b=WsnegsD/WRgT7zBp
	KZBLOe3RIyTM21H3gknjzlTo+0dXRAyfiCQQTVtGDsznzUIm6YH5vqc4ByboIQmp
	eMmW18qt9ncuqZ+mPB9WBd0MLqIkVfvWtaQRM8RJciofK8pHhC/ecd6O4NXuEarE
	YCJiL823SF8/MsQIuuzHJGpaERcYn6mDnlZWfQ00wNkyT7IF30sqJemQv2r4j4JA
	WuWWtvHZNOuEh8j5uCSTHmDMMrvF6UxOdtJbYHwPO/eXakd3YZUsU3U4n67m4K8k
	9RCjb6XhNP7JA9zBEKKNBGJ9qQMh+JJGbQVNtkhpnIstTuLfKltjCEsovzMocvtg
	d5yOTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug44x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:52:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so11606468a91.0
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780066356; x=1780671156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=;
        b=YEl7spisPYwesOS0EoGrlgkN8Pgw2LVSTQCayP0rAGZL3YGqMLlhVZV/epqQMPvoJG
         1yF+S44ww570idno5bpcwDQrComiP/4YO+fjo8ip2nIRmvXPU33aMnft24+BXymPC8Dy
         4F8czcCk2CmEWfU5Ku8WeryM4CE4wAg2xZw7ebXJARRLC+J4QHhNO78POFDChGaOtx9B
         HpFkqqg9B2NtBdhe6a3i988Q79aENewlX7EagjcmR2OuVRStM/D0LaIIgCUl7rbTeHPU
         RnP4Zl2Na4w6w31p4pAKhmtbsmJW1N4KxCq8RwxuUfTnEr8no5iziJ8T6NUB1h580x3a
         bNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066356; x=1780671156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=;
        b=cCXPsq1VJwLYxQ8Csrs5ox9AQdCuYQwxZ5yJAehwjlxa0oyVEjZo/HycSOSRKeAa5k
         72u+2Za/wKFKtU78CcpNu2bOiCOc43i+ltJjyEzyO99H42nkkM8/y5DA4Ct/AYja1cYM
         JelkfEQ15qNUVDEkRaIm5EwY4LsaxwMLXy0/sNwwTS+dnMXizLwnBF5jaDeupkOi4mVQ
         Aw7aJlWp+73N9KTxCnK+F/aBx5+DoxmbHwwmQIbgvnftljApm5Qf+a2l3pxB3EU0HzWl
         sllpzZ/TMbX+Lcgf3Jirk75mMJepX9WoMD/+kgzb/Cf0qsNTzApoxE+eq4VHESTqgJxg
         X1UQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Ck1587/a9uhBVPCtWoCc9taS71nR2egND74ElrNhrDBxmUewppwvJYKbndasvYx13IDWOxz5CEvT2JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMozT1pWtYkOoK/BLkMYuPens56Aa/u33XakhCEaCwi253Bh6A
	dvpmBRNdk1aO1FwYSbYcgbWtJH2J7OJgsWVGWoPveFDR4HbnWnQZkKYB1LQC3/7l3GovX2b2vnC
	57iGpk//6CpSjXRVvL9cFYP7opniPuoh+7c5PZ0UmML03vDLLROwBtQd56+BlylTIuw==
X-Gm-Gg: Acq92OG5t5J+fLlsgWay6ypGabnLDLtxRe8fgu8ZwbrlvhicUKdXmXQ8n+ZpcQn7kvR
	BlqfrVbCmQ6JuP1/+1N/CBMG9FtTksOcUIeo4XAlLzwDYuZwkkf1RchLFLKJG9S/DRS0KaCIxxu
	LJuWjSGp0ewB81VmJ95XVL0tEtDTm0W4LMxF1eACAE2mY2mygyB1Iin/vUXnlywHz1iidbCz1Zx
	C6ekgOIo4zbSakHIOoJx1kxiKrYhIMIFZGHNrC0uuB/HGtGjmGivpEaRWTPL3B0K4MnuX3h+Tx9
	LzSp7CU3rjrI6z31r3mmIsw9LsD42Xx2ZfdRtcyjVONaGcF2eKFpcpayyTjQGoFgoNIfJ1OltvX
	HX60vIGgNsteT03DJqmC+lCJPeMygnIXSFFWuQqmv7inLrUa3dyq4mMMupXWVI+4=
X-Received: by 2002:a17:90a:d40d:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36bbcad48acmr3569160a91.5.1780066355720;
        Fri, 29 May 2026 07:52:35 -0700 (PDT)
X-Received: by 2002:a17:90a:d40d:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36bbcad48acmr3569081a91.5.1780066354875;
        Fri, 29 May 2026 07:52:34 -0700 (PDT)
Received: from [10.204.67.150] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc9bff159sm845633a91.0.2026.05.29.07.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:52:34 -0700 (PDT)
Message-ID: <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:22:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: bod@kernel.org, Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <178000689150.4557.11759359941436928903.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0OSBTYWx0ZWRfX5cBa7BKiwtjH
 DrHYirW6FJC6zKSXFfekBq+J2HFnwdklcx5eKuXQerF1ixTmDVuqy5XOmwkmqbSIHc1juF6VQ3+
 spiZ+7ooukOTM2TSZm206fauV0xUqrbMR9BsbBFEnPCTkjSkn0dwSQYoRkqUSsIxk9NdrAzWR5e
 k9zBXbHX2FXrB3OgPYVSoiEKWs30A6OVaWcw1qXCxX34M1v7swBhShOZxc+58u/dE3WLrqOC10s
 z5OQyrRXkAeB1bVOQM9VAZW2ZpgBxHdqWTUlIpEi/cwfAlBRSJbLfS9n6a/gmNaoqwjih5vfCSO
 WPKfeGkBcsH4z1bxWYTLSCmFYw2qRtqo0SR55Vfy3hpZ/YWCAjpdgJPLjZTAQ8rV6687jrRvTkF
 cHeO7n3rPfl+8zrgsnp87VcVHijDtu7DDe4wA8PCLsT85FSPdXUJlaA+5zJB2QvWPg3BfFd0HM+
 PEz4ghwJTCk/uSUevVQ==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a19a834 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i0fgkIc6DCDsPB5MfecA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 7CLz56-3I1B0W77yW6fH2gwKfUymUn80
X-Proofpoint-GUID: 7CLz56-3I1B0W77yW6fH2gwKfUymUn80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-63047-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4D1260452F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/29/2026 3:51 AM, bod@kernel.org wrote:
>> +			iommus = <&apps_smmu 0x400 0x0>;
> So I'm suspicious of this IOMMU.
>
> We should list the full range of IFE SIDs here not a subset. Since we are
> register compatible with Agatti that implies to me we should also be IOMMU
> compatible.

Shikra and Agatti are not iommu compatible in terms of Stream ID. Only VFE SID is same
for both. Agatti is documenting iommu for VFE, CDM and OPE. OPE is not yet enabled for
Shikra and in my opinion it should be added as a separate yaml similar to Agatti.
"https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9-bb1055274603@oss.qualcomm.com/"

Regarding cdm iommu we have excluded it as we do not use it to program registers as of now.

Loic/Bryan, Please share your thoughts on this?

> Please list in your next submission commit log the IOMMU SIDs - comment in
> the DTS is fine too.

Sure.

> Ideally list the IOMMus for Agatti/2290 and then explain why the singleton
> you have enumerated here is the only required one.
>
> Right now my suspicion radar is high that either the Agatti binding is
> wrong or the Shikra binding is.
>
> Possibly both.

Regards,

Vikram


