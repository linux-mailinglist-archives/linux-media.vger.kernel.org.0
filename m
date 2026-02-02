Return-Path: <linux-media+bounces-51999-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFcMJpaAgGnE8wIAu9opvQ
	(envelope-from <linux-media+bounces-51999-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:46:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BF6CB2B6
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE9393031CD0
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D01935B64C;
	Mon,  2 Feb 2026 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E14rRjUf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNxuB82p"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5095A33A6ED
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028816; cv=none; b=LIqCLbKf5Xr2RKYg6IRc/iNEjeAWjYUQlMR1SKmhDAozjqsqYW/wNNj8o/U1U7NC6adnhl+mxbMSEMHkHmTBf0/Mmc0ndOBL4VcueKk7OggIBA3Un4A/IFitDx+WMIEjZepCkXOXbNlIqg13DFgT+JEAmMQQOGmXX/0h4yZOO/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028816; c=relaxed/simple;
	bh=6gTBglFHTaGgqTTG6CBV0R7cUv7XK9CWO51lUDEkXsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6lwQwAx5xoCVmap7f5Xkmma9xYW3/WfpEhGAMb+kMyY2UR6MhsYa4xZjOD8KFAEVw1Abv7P+TuEAr1J/kZ0M+sR5MLJ05GviCC0/ceIattnTuH/PsD77XA6WltANCMdFkrQScAraL9kPu7pVEeU92zlyEllITi5TTp8Ak5/IOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E14rRjUf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNxuB82p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6128CP832311549
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 10:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2eKwi0gX9NY3lt9IpkM1Ek8vFQh6Pze36H48CYSXvew=; b=E14rRjUfhrZknhv1
	pHRM8oI5iG6TN5bIN0kkaPZQLr2MzmgH8+UUcWVnk05E5bDOfabKpOCB+KGAxzwo
	YdYRDLV5ZUeXphedUKHVkgOfoMpFtXOkr4w6q6AgkuX3/RgrZ3r73JOh9Uv5LNw0
	36OxDoo+YD+5hD6Sb5T56Xp9D71AdH+XVeTfH2eUa/TzUN9HSVSzbBF7iTiD96DR
	1Sex2QL9BbGm9xaVrC+40fL5fL8YpZPQC54gVqs68XYmNRn9cURoeUIUWg0L6GyP
	0h2/fhJAHNn1KU/+CFeKokWWl0okpv+5JMWTR7wm7rQ5WDP6yt3dx43I5WuFU3OG
	HcLB2A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard53xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 10:40:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0bb1192cbso36282935ad.1
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 02:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770028813; x=1770633613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2eKwi0gX9NY3lt9IpkM1Ek8vFQh6Pze36H48CYSXvew=;
        b=fNxuB82psHV4bIjz3fE82NuDAqYeTrzGd89/Qtu4Obgo2b47NnX/JtRP0tHRhF3tvt
         pclG6MHhzsZflmTf4LFGDb7w2d5cgfFh+BVvwg6C7HRNN3mvMGFbZCmkSHUWhVt9lQ21
         aVdCCE91Ik6F6QQZIYHPaOSmIkG+JphpVbg01KMlisr5c3VUtfOOJfOvqph/9mKW4DGN
         TSLyMRamWpvVzXFGtl1Zmi3igSEZRFAW0RHdIApEA/SV1nFdtzSJFo8i17MmVOrNfCoY
         zJbC8bf917UkZeINlB7ypT9tPSslzB2tQ57TyvS43AFTYeQuGXrfXsEDCCyqWI7+l5ZX
         KZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770028813; x=1770633613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eKwi0gX9NY3lt9IpkM1Ek8vFQh6Pze36H48CYSXvew=;
        b=hwpbIw+QpLag5Y/3AT6km2udSb1ZzFQZc4rTIcu6kmCaIHlIWQCXj3S58NTy6cuPfs
         MqiG56Eq8b10t1Rx9JSCi1t/kKjgNhVCmSlTkXEz/F5Fb5Z6jcuxZWMd/VW4RtZtAEXP
         Wop/aT4ory5XUN6SGVBYYQviLMFxyRTjIcfyg2MMCxf+Hzu/zsqvtsJr0h0nfwwxmX9S
         +5aupU/ypyNKc3upRqGQghjAC2eAfbP6MlZW0C2Wv0FxRRV3UdnMeURmhKadYr6WFeoQ
         jnOSfzMoE6LWjTjnAazPcvh8RlGUNj7oQYVBmptrthd9XYIinNak8N44LhD+j5p1hXKo
         B4Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVHoedONzo4En6nQ8rRX/PQ7yLSe5xpMRjWl0wx5/5N80cKbPBYXepHRYku+cmcl2p8/DcSVAEF/89YFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw31G7SJfW8NfVljmA8AC+rtml6mqNztfPMgZ79Ag39x8lyosHJ
	VrhINbg0invNSKr2zfc3Ez40+/DJ6xdCrEibf2o/XjxtUMRDT0XDoZSPB2qjp90HbOT9X0qhjXy
	JlbaozwvvflBhrEuTBIXkF3Ky9mdbFfdOunKX3F/Iu4xl7vNgEmlbTuRbFii5Qi+Gww==
X-Gm-Gg: AZuq6aJL+qht0ox5mnrjDZT1GWJ1+OnG2WgYecnAktVnf7/j1H2pWIjrumjKJJqchAj
	e/n6nC0kPz1yInQ0X8bJRCWdEa/ur5DSFr0E+lh8fOu6qk+aRKIalDAXxurOetDeelTTqQalynM
	+XiwspH7Gp5weGw9O09FeEHKA4KPl1QKc6Ia9nEEADHIdB/bJ8c0d9nWE91kSUnpVfUJKjrSmjt
	RUwJY7es5+6d6+pWkMEwDUjz+KfFPw0yWVti7lcXmIxjv578b8wLaygz5NS9i9Eh+HUC4u3hbKi
	5AdMcLEQaIhoDlS3Hys/JGPxmEoMVTnESGiXExP9krIbQPleez43oscHmnxJb88FJeUAfw/ASO9
	m75pejN/3gX7qIwC/O+zzenLCeZ09ddoWXfC76XhwvA==
X-Received: by 2002:a17:902:e888:b0:2a7:d42f:7065 with SMTP id d9443c01a7336-2a8d96cc4e7mr118124905ad.27.1770028813097;
        Mon, 02 Feb 2026 02:40:13 -0800 (PST)
X-Received: by 2002:a17:902:e888:b0:2a7:d42f:7065 with SMTP id d9443c01a7336-2a8d96cc4e7mr118124595ad.27.1770028812611;
        Mon, 02 Feb 2026 02:40:12 -0800 (PST)
Received: from [10.204.100.98] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8dc225534sm86203905ad.68.2026.02.02.02.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:40:11 -0800 (PST)
Message-ID: <4dddeac0-cfb0-4ecc-bee2-0b968da6e7c2@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 16:10:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] media: qcom: flip the switch between Venus and
 Iris drivers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
 <f8179247-80ed-4bf0-85d8-53441f0d9311@oss.qualcomm.com>
 <249f2097-8676-4fcb-8570-1ec8c0e946fa@oss.qualcomm.com>
 <pd4slkxwj7q4jrxaxd4xhbzoygxvlnjxjeylqi36pzwy57lion@la65rc7u2fyf>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <pd4slkxwj7q4jrxaxd4xhbzoygxvlnjxjeylqi36pzwy57lion@la65rc7u2fyf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NyBTYWx0ZWRfXzpeRPoNCGIqe
 35BUkE3gUdxC2XUpA1RpOUKM9TBHhnag0GOErWThJTOVopt2TlsahzJWn+9ot/61QXG9a6QrJbQ
 d3acO4fqIpJ4TJ5dBPp9ON2Dzh9H84CUgXq9N7KE8mO/GHnnm+XqnJXoB91TYMAPMReON7fy5RA
 HetH+iuUsLc70PthwVorfQy7WZPdGyYiwHWo8h2o3sakz3cOscWgU/B0k6bnJ4C6cJ7SsrPzOhk
 FNSAeWHdGqvUjUI0GknufGfrrUccjTr2yDADyBWsObaZFDDsepBMzJ9/7zClUHTogU1B8OoHKev
 hTIoEVJRmonACrwGZfy28jFSuWrfqe+qk01tf3ScM7l1M02/wM6J0Tvjho5OAC+qHn0TRWrievh
 Wl5z4HDWZEy55kL6iYU/tjfL/Yq++cpk7uMD7QihhrGwRKWsE57Rsf7UlCpwrv0QvagrJaEuKWV
 8wFVqRexwjPCtvz9swA==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=69807f0e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=4G6ViigsJfsZwVOxGF8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: gXRxGeNaFg5TPfZrAXTskxDPuvw3Mf_h
X-Proofpoint-GUID: gXRxGeNaFg5TPfZrAXTskxDPuvw3Mf_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51999-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00BF6CB2B6
X-Rspamd-Action: no action


On 2/2/2026 2:54 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 02, 2026 at 12:12:01PM +0530, Vikash Garodia wrote:
>>
>> On 2/2/2026 12:00 PM, Vikash Garodia wrote:
>>>
>>> On 1/31/2026 7:28 PM, Dmitry Baryshkov wrote:
>>>> As the Venus and Iris drivers are close to the "feature parity" for the
>>>> common platforms (SC7280, SM8250), in order to get more attention to
>>>> squashing bugs from the Iris driver, flip the switch and default to the
>>>> Iris driver if both are enabled. The Iris driver has several
>>>> regressions, but hopefully they can be fixed through the development
>>>> cycle by the respective team. Also it is better to fail the test than
>>>> crash the device (which Venus driver does a lot).
>>>>
>>>> Note: then intention is to land this in 6.21, which might let us to
>>>> drop those platforms from the Venus driver in 6.22+.
>>>>
>>>> Testing methodology: fluster test-suite, single-threaded mode, SM8250
>>>> device (RB5).
>>>
>>> Fluster results for SC7280 is regressing, which we were discussing in
>>> earlier version of this series, need to be fixed. All tests were failing
>>> but one for h265 decode.
>>
>> I see the patch (#4/5) to increase the size, please add the fluster report
>> on sc7280.
> 
>  From the cover letter:
> 
>     For SC7280, the results match the SM8250 ones.
> 
> Anyway, the relevant part:
> 
> |Test|GStreamer-H.265-V4L2-Gst1.0|
> |TOTAL|133/147|
> |TOTAL TIME|82.276s|
> 
> |-|-|
> |Profile|GStreamer-H.265-V4L2-Gst1.0|
> |MAIN|132/135|
> |MAIN_10|0/11|
> |MAIN_STILL_PICTURE|1/1|
> 
> 
> # GLOBAL SUMMARY
> |TOTALS|GStreamer-H.265-V4L2-Gst1.0|
> |-|-|
> |TOTAL|133/147|
> |TOTAL TIME|82.276s|
> |-|-|
> |Profile|GStreamer-H.265-V4L2-Gst1.0|
> |MAIN|132/135|
> |MAIN_10|0/11|
> |MAIN_STILL_PICTURE|1/1|
> |-|-|
> 

Thank you, good to see this.

> 
>>
>>>
>>> Regards,
>>> Vikash
>>>
>>
> 


