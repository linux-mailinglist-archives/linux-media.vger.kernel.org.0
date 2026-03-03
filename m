Return-Path: <linux-media+bounces-54412-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCm2BC91p2mehgAAu9opvQ
	(envelope-from <linux-media+bounces-54412-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 00:56:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A021F88D3
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 00:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D1BB31246B1
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 23:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2B2375AD3;
	Tue,  3 Mar 2026 23:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FW4I5nNO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Azxdd9Ye"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86B6373BF8
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 23:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581905; cv=none; b=gTXRJh/M9oocmw/fVOEf4zcvmRkGiXaaxS/SjHJod7QiuQu+EjRBMD4AZn4o4FT3GNSQj150m+PToSwb26M0L8zqo7OfWLJBy3ur1qbuK6BcNq2PZSn18m6yspci2S71D9mzf/gO7jOBcaAuCM3Qo+FZZEjwu+XX2vlmxCKeZ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581905; c=relaxed/simple;
	bh=Bby4bIhu2hZqyUu4JjsDDqsnrdQH6/sSRvwIrlCeRrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KfRFwLJbjrYMvYuUWiexEvz/KjkgJ3C1WFV7Pbf4ZzrJf5rXXD2p/Mm68spUYElqybTQDBNxM0nJ3XF0ZmyUOUQ6WW9FIc+XksHB3CO0A0H1EGmD4drI2IRPLSLqSSshTwq0A/7qhtHeu/ueYX6Lp+uH0zvJ6NbTNJ1cWouhAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FW4I5nNO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Azxdd9Ye; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0Tkr3708825
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 23:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tek9uhlm2h1k7JiB2+lAHLOsL/qiE45qQ/vw4e2qztQ=; b=FW4I5nNOHeX38DBb
	ebtuRtObFnn08Gud4xSSYdXxcXUD3qZh7f+H81wV1O4e16nhbJDgGjs4L0LpGo0i
	fztZ6cb7TnC2i7xXUrpAbDNepfblgTDtS66L7ty6TXE1+RgR06a+7e4XGviKHb2M
	3/L++RrL6eW76Tuj8AOnvAzgGZ2O2AxGy7mPelTwwFehMFZ2P8Yea1svqpKBGB4B
	YHvp7sUCNbCQ3JddAjEz+m7pl3J2cDx68VnwzP74Voh4nmBsdIKHr3PxPsc0mWZx
	Jh20L9FU8zy7mDZGqpSoOgsIkkFDhAXfeDE3dsqPmU5Kc3BKFDJWRXNFKRELCuvo
	b48utQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm3k4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 23:51:44 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1275c2ae713so10334154c88.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 15:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772581903; x=1773186703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tek9uhlm2h1k7JiB2+lAHLOsL/qiE45qQ/vw4e2qztQ=;
        b=Azxdd9YeEpi+Iw7kpM9tmK2QMf4FhMO6Onhdg5qaeUhswkKgnn9bfFVj6L48droyWN
         mN6M7sCFUMbXHH2gPLQe/oPSI00kWm6WBzjT/pb6QVdw2o33uZXLVZvlpLjm7GxF/Nm/
         fHbrEbJp8LcHTJgizowVOYHEc6H3Rnd0YIVRKGoqd0KLVCXMfAOL69SVgzlHUTQMV2kO
         9PETubN3wRwckTk2HmjWGI4SlpC5GDcOGxE/+A1R+iO97kMpZZnHC2gAwCCe11TmcD5y
         jEBeYQAHn7IV345jj6cJTshJYThNIOmBvD2AwLd3j+N1tDuHYrHBlTkXSgxXIkkHzJwr
         uG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772581903; x=1773186703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tek9uhlm2h1k7JiB2+lAHLOsL/qiE45qQ/vw4e2qztQ=;
        b=gSk2jqoaqohESeV4a+ZjbaX1+Q4W3BI6frqyKukMbWNU5En+mdek4F0qCcIrUhzPOJ
         8a7PofBHbzKbOxkD6s/QhKP+5vnfrSA4mS79NRqgdJO3P+wBs2KW+qHRJemSv1rIuKYW
         LGt/IcRDRg1mQ8G5JLxcSGlUG5Zyrpuy/P/SSzqwTQGDsANT0qxY4kVVVGIDIEGR8Qk/
         JCrMVOKkKcInClyFBlryx7hsoJT4tTwqpdx/tvqpb8WBJS1KZMdwv16vAf1Rm/PLPfN6
         Gvr2lqU9W4P0hbJ61v8M/GAYCxe5Ityu7Ydi04etZLtjqJTq4IgW5LURxtmeiokACkpP
         ykFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGFalHDo+CKDuxPDQQlPn7Jdjy2i2+qDUSV0CBa4VT2corL0Nqt1ikJeeu2JdXAu+wn3ofGZFjL5BFbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh/7MSwg0zcSBsNyijVyAF2zqFmaYiaUTEkfkK65l3Haoho29t
	LtXyo0z2ZbbMUGyf6CylDPENhqCC+dFWh4XZKlGxFP4ePo94kqRHeTkP68G/axgfWVsXlfPGKoI
	3CyYcTmDyvdJTUCxNWss4cmXUDLeMJFT5lCqQeOzTy7SgFmitzSLcyBXDX6v1BOM1wA==
X-Gm-Gg: ATEYQzy+CHAqzdkKq6HEElYcb/T4ga5HBwd9N3zBqPxlOkhx3W3DiapgGYNpOJSt0cG
	v3GSgNnlNHmw0M3+LFiLXbspn2iFFHXWmIK+B8RrbuV7zl/Hxn6AfJP+BWAJ4Zz/T1GTSj55xg9
	pqpRaRVWn7SKghWUWDCHnHuKp6K/9W7JQbBMnj7o+rpCjGlQ/dzTM9XZpSEHQOHtG1oHMC+oKZe
	17x4lbLwoa0iVb1aHol/pltIBiEAwwG4rtoCkOWEV6YxBuvG0vlOOmLVNYKs/oP3WIfUDdlQzUr
	T8CpaLcFgDISsQGCmqdqGyMVRhhLVnCMPIvi30SEexD3cRsgewYXttClRf5R2dISALf7PtQKsSr
	8OGCEniLuzRqZjoi3XrKXRDBne/zTGGuqfYDubMmM+UyXLIY7UDotrm4kiPfoheoapDtsgyNIvr
	w2
X-Received: by 2002:a05:7022:78d:b0:11f:3483:bbb0 with SMTP id a92af1059eb24-128b70949f3mr23939c88.19.1772581903403;
        Tue, 03 Mar 2026 15:51:43 -0800 (PST)
X-Received: by 2002:a05:7022:78d:b0:11f:3483:bbb0 with SMTP id a92af1059eb24-128b70949f3mr23910c88.19.1772581902816;
        Tue, 03 Mar 2026 15:51:42 -0800 (PST)
Received: from [10.62.37.55] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be249ed6a4sm1984701eec.11.2026.03.03.15.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 15:51:42 -0800 (PST)
Message-ID: <b5d41d1c-1856-4155-a0ad-36acfe29715e@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 15:51:41 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <yhatx2iuoofvsqpu5da7ohpyvzhc2y7uq3bhuhfuv6pkfpqrnz@75xei3bawzza>
 <f83f616d-9114-426d-bc9b-42ddc839686f@oss.qualcomm.com>
 <qcrwodgyayhyd7rpfglsxkefrufgqxjcs6n7druwr46wmkojvo@263ooobucj2c>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <qcrwodgyayhyd7rpfglsxkefrufgqxjcs6n7druwr46wmkojvo@263ooobucj2c>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6FELkGpem8UqqZOT_SjamkC1mvYrc4rG
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a77410 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=xyu7nF3SspGO5Dy-1yQA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 6FELkGpem8UqqZOT_SjamkC1mvYrc4rG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NiBTYWx0ZWRfX9/ms4VQFNMEU
 HZj5KBBf0Kjgc8XXOUDaJd+fRhnByBBfCSuu+Y03zjYm6jeTHNoPkF6J3XxNAM+qa+W7Yt5Jhuj
 /48JDDtlwW8VcFokQqadUYMHAuTFQkmz0fPN6XKYZ6N/+Hc64BLgVPUi/IiGr/FMWWfH2J5fUha
 nT+IsiuIOvqn8MptELD1vyfxrBYVrlkGHGbuBui3PgGHJnrG6gN+pUMjm5aqTa8+rytSOVQ6fpF
 QehJN4NRDN46dKOklrUI43buOAIWtUq8h9XG/D0/R8/1ipfat2x+lakai6KtES4znpZ9hqs/ksL
 gW9QUX9vK/kIbVKAaRirS7CdS6aa0X30KEjlBxFEPsk2GwNll9nUueBhkjYIehRZoGyCJGv6tuv
 01TyVmFOjYGwmLM9zMdz68LCITodUXEOs8bLh2vWbJuvB7sJvSpz9nFOHoQYGZrJ1NWOEzyb1Aq
 ZQIzA2UYea3nblAW8cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030196
X-Rspamd-Queue-Id: 61A021F88D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54412-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/3/2026 3:49 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 03, 2026 at 03:24:16PM -0800, Vijay Kumar Tumati wrote:
>>
>>
>> On 3/3/2026 2:31 PM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 02, 2026 at 05:51:24PM -0800, Vijay Kumar Tumati wrote:
>>>> Hi Bryan,
>>>>
>>>> On 2/26/2026 4:34 AM, Bryan O'Donoghue wrote:
>>>>> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>>>> As we are cleaning up the PHY device nodes, we should consider fixing the
>>>> power domains as well. Although TOP GDSC is defined as a power domain, it is
>>>> not the power source for the PHY devices. Rather, it is the MMCX, MXC and
>>>> optionally MXA based on the architecture (Refer to 'Voltage rail' column for
>>>> PHY clocks in IPCAT). There is no
>>>> parent-child relationship between the TOP GDSC and these in the clock driver
>>>> and it was just working as the required power rails are getting enabled
>>>> by/for other MM devices.
>>>
>>> Which domains are required to access CSI PHY registers?
>> PHY register access requires the PHY core clock, cam_top_ahb clock. So in my
>> understanding, we need to trace these clocks in the topology backwards up
>> until at least the RCG, and all the voltage rails powering these clocks will
>> be the required power domains. Having said that, just register access works
>> even if the voltage rails are configured to the min level, which camcc does
>> already.
> 
> Are they not gated by the GDSC?
All the Titan CAMCC clocks are gated by the TOP GDSC, yes.
> 
>>>
>>>>> +
>>>>> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
>>>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>>>> +    };
>>>>> +
>>>
>> Thanks,
>> Vijay.
> 
Thanks,
Vijay.

