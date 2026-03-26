Return-Path: <linux-media+bounces-57119-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EmTBmC4xGlf2wQAu9opvQ
	(envelope-from <linux-media+bounces-57119-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 05:38:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 815AC32F1EC
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 05:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9EBA304116C
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 04:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B82392C5B;
	Thu, 26 Mar 2026 04:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1F2FBaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2EQXAnE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78128DB54
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 04:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499931; cv=none; b=FygoHT0NmowrGcMCu1aUaro+xxYv96Nskg19HCaGDGGFQfLhs1W6CVJSVVqpMgb5Dpf0TnNlY2bXySALTcIGX1Dpeq9kvXYVk82xRTE0pDyEqp8aoFJZ5b32Qc2FUwNCnjAX6b0ITGW3YJDAwQZmOr0hb+s5OXkiTk2AZAfpZUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499931; c=relaxed/simple;
	bh=7BEpTUwfjnv+m6yiGvTU/fNcjvz89YGvw1D3jrNX8zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QqqpQZg51hdqDjA/1cPv34hhFdD/KGuAMvVMea2nZ6cB5hyBON/ROeZ0lJRwbg4I33ut7dSUju76SN9W0mzTWKXJ1zkaEJ0q5tN0qav8JydC0vFfh3VSrleHpgGJ2zeo3eW32ZuogT3abnTG4TaiqYfSgeF3MBvyhljDxc+jfDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1F2FBaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2EQXAnE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKl1PT052587
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 04:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DnvNoeZFYoOW1EuO4Q4AOdaugbUxKcFqMhwUYgMQi0s=; b=o1F2FBaVKTNwzPrK
	HZcshpnZmhMAnN4J+Q9hetewdJrHVnGxg/Tg58CLy3/ULzHN4JbL5ZImSk2DtESC
	kZT+lZEC/ylClIAtLPSlylL9VhgRN3FFg3tgkEc5O0ZBYflCKPMCZZ3SYqOgLJYg
	F8cHiOpVHcvcR7zF+In68C/kwC3eddzYZI+SpoWkqaWrrBZ99FKv5Kr/Hr3WW83J
	UF0LV0xs0q6oJSx5PPg9XFHpPDiVDPoVGHKYYNyawJ6+nlZ7hXBmhJvqbOx0P+Gg
	n/H42xvCCZKXH3HwLZuYtocEwCCYF5idAzgk8QnEI1w2hpA6E3IprQQaiJAeXrZ4
	SiOkug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t16je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 04:38:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aeb90532f6so6876475ad.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 21:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499928; x=1775104728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnvNoeZFYoOW1EuO4Q4AOdaugbUxKcFqMhwUYgMQi0s=;
        b=G2EQXAnElbahhPg07STDwqcZUMcZug8e3Lh7vf7yHHwFzMHNTGeTQydktQnditYiXe
         Sr3XxZQArFOexEwMs5Ct5DedMBiOfzBNAzHL8dSi0K/WREArjGuBnQ2bifyK3eZe79bt
         QVGnmSMBtEnaoat4F6oGWD/o49pVjaKI1nKoByr9sddUvI6bicgWjeEUy32+nPlJppcR
         5GFdLJZ9jQz1RB/MDyBS8vf/AIIWDB8ejtu1cIG+cp5vFV+dQShPyLO8BX66tlnsLIkL
         euIMcAgE/CAR55W0EaE3FrN83Mi+jusEnsMpSD+Cb4+OrPLWBYQNKJNhSXmV3UvR5nvp
         4JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499928; x=1775104728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnvNoeZFYoOW1EuO4Q4AOdaugbUxKcFqMhwUYgMQi0s=;
        b=cC/A5XqHoMFs6WcKVmlmVJbNDL5aKhjYeenQUsmiHmBBWS+Ijy8erBhBTit0ReHdyH
         maGMVKsSHPIrDkbWc+FmCsOTtBzdzk+DPcv14IQ5G6MhOgFEQhZG7SeT23Af+VhkrFSj
         PLj22KmKPtESVpStAIKrJy5qM/j7+9tgi1E4idJ/BYHdlhDI8RIH0sKfukWQHvwGNcP8
         +T8J4Vui5sjyP3upl/VevKa1xNGxx2L4WvFrpKFNkGr4Almfw3jRPQoQcsOsLMRR6/6I
         upjx0mBzLKWSveKSjzVoZLcq/Q5Ng0INqdF0PYIZhEbvYHh8rOYfC/DC/tm2EeEP1IvH
         CWKw==
X-Gm-Message-State: AOJu0YxtXFhzYxYjUvx3UDB5wUd9vAYzBNg7fm0L7w0sVM6yBrW0+OEA
	ZfaiJchfm+Z/D5KRuAG4GVsrdmpTN+5Z9nVE87vKW44FQcptBKMOJZrNH/ZulRhLYaZTpp1R05w
	+foBihUDy42HM4r9/Za83j0ygEd13EXvMQt0GIDJ+Y7uGcAe04HP+ZA9gcdf5ccT4PQ==
X-Gm-Gg: ATEYQzzlnHibSI3K4Un6T337Nwplo6mG/240sAHUCxqsaxb+SxEmpcZr1LD6qBa2Z5U
	7X1GzR24ns2A1DJgN/M3ohREaJcZdPpHKC41OGWiv8PqhCE8y3KNt8rYOdvKTqJMsRtJz0CqXaU
	OMxmP2PYo/DWVG5co6VPQCLIESKeavGHLpKcEMyVGbpY7Y864fD11He3RUMBx2CnMAFVMSm9J8H
	uGvh2BBQTNa4NhDM0qcKZCaFc0AGx6cx/Avqln7PUJO6O8e41d2wZR9jV/93HhkUD9uMKwDJ2ne
	lmJ0+5gNe8zIb1ieWRMiuvH+T7xu9SHcfC3pwz5B9DedaJi5+mpXt8K46gEvuk9JzDkS1Mg+wHx
	22+USp2SFcf0+amqeHLTwqrvLmpE6PkA7yk91sqTWh7r45pjrfEGduw==
X-Received: by 2002:a17:903:1786:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2b0b0a41b9amr68267105ad.22.1774499928271;
        Wed, 25 Mar 2026 21:38:48 -0700 (PDT)
X-Received: by 2002:a17:903:1786:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2b0b0a41b9amr68266795ad.22.1774499927726;
        Wed, 25 Mar 2026 21:38:47 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76b57asm15459845ad.3.2026.03.25.21.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 21:38:47 -0700 (PDT)
Message-ID: <2c3c1ef3-bcc0-c4f0-e1a4-b3d91dc92d59@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:08:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 00/11] media: qcom: iris: rework platform data handling
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c4b859 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=n9i7a1ABM4vdrNuulSdbnA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CUfvY3FEa73prft6vwkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: VPhH6ekWpmMCGu404rD3yqkx-j_Crd0i
X-Proofpoint-ORIG-GUID: VPhH6ekWpmMCGu404rD3yqkx-j_Crd0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMyBTYWx0ZWRfX3vBeaBwMvYwD
 Vqk2umIFUBvx5QtzpSVtZojyrvJSFjI8l8BM6ZEbgxYmh1Mg+0cGsySNlU3VbRuGWUTCl0MPBVj
 P/r0EAMoKHp/04fEb1325/a1i2bWvN2opLl1NB1tVR/kGsOo/XowDFejvTLlUkayxb6pJv9MN4t
 toessmNWnQIOQGdye4Va/j74N5BCr6HYGmxY6P3Xb3LSsC+xpkatOGk6/4l1aICC4mSKfOk/EX4
 mMFGkG4IO9bwJy6f1klFNaAGmyhaTzgewEqo5kvTDW+9Q31rdH9ncjCEzQT5g/G8BjqctFSdqmm
 +wniY5a3lYCTjrkroDwsNjvVTiq5Yt9DbH9vkOMAxw5AtNlj4YT4zKBtn/bpbC3VpAN8bgjXztV
 6Cuk314Ugf5PLWqX0fv40BPOHv6rbHOivS2u7ZqIDHGlR1ACUQln3YYZymbMGDHvRpYO7XL7el7
 P5LcLGsicBb9tXZPOsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260033
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57119-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 815AC32F1EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/20/2026 7:24 AM, Dmitry Baryshkov wrote:
> Currently platform data for the iris devices contain a mixture of
> hadware and software description. This seems to work in simple cases,
> but as the driver matures, it leads to strange decisions.
> 
> For example, the recent series extending SC7280 support to be able to
> use HFI Gen2 firmware ended up duplicating SC7280 data, using
> SM8550-related structs even though the hardware hasn't changed.
> 
> Another example, SM8450 and SM8350 are also simiar cores (and similar to
> the existing SM8250), however SM8450 will have to go to the same file as
> VPU3 cores just because of the firmware interface.
> 
> Last, but not least, this leads to a lot of copy-paste duplicates
> between platforms, having similar firmware interfaces. It damages
> readability and complicates adding support for new platforms.
> 
> Rework Iris platform data, splitting it into hardware description
> (definied by the GPU core) and HFI Gen-related firmware data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v9:
> - Collected missing R-Bs from the previous iterations (sorry, Vikash)
> - Link to v8: https://lore.kernel.org/r/20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com
> 
> Changes in v8:
> - Moved core_arch to iris_firmware_data (Dikshita)
> - Made HW_RESPONSE_TIMEOUT_VALUE static (Vikash)
> - Changed firmware name for SM8250
> - Extracted firmware description interface (Dikshita)
> - Link to v7: https://lore.kernel.org/r/20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com
> 
> Changes in v7:
> - Fixed build error
> - Link to v6: https://lore.kernel.org/r/20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com
> 
> Changes in v6:
> - Moved get_vpu_buffer_size() back to iris_platform_data, it will be
>   handled separately, when adding support for Gen2 on Kodiak (Dikshita)
> - Renamed iris_platform_vpu3.c to iris_platform_vpu3x.c (Dikshita)
> - Renamed generic VPU2 and VPU3x constants to stop referencing SM8250
>   and SM8550 (Dikshita)
> - Link to v5: https://lore.kernel.org/r/20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com
> 
> Changes in v5:
> - Added missing kerneldoc for struct iris_core (Dikshita)
> - Dropped two more unused defines, leftovers from the split
> - Link to v4: https://lore.kernel.org/r/20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com
> 
> Changes in v4:
> - Renamed iris_hfi_gen1_ops instances and related functions to contain
>   _sys_ (Dikshita)
> - Link to v3: https://lore.kernel.org/r/20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com
> 
> Changes in v3:
> - Dropped the config_params / subscription_params patches for now,
>   let's get more different platforms in first, determining the common
>   base and the best way to handle the differences.
> - Dropped set_preset_registers callback, call
>   iris_vpu_set_preset_registers() directly (Dikshita)
> - Renamed HFI ops to hfi_sys_ops and hfi_session_ops (Dikshita)
> - Dropped (unused) hfi_response_ops from struct iris_core (Dikshita)
> - Renamed hfi_response_handler and get_instance callbacks to follow
>   other hfi_sys_ops callbacks.
> - Link to v2: https://lore.kernel.org/r/20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com
> 
> Changes in v2:
> - Fixed build error in the interim patch, the fix sneaked to the wrong
>   patch in rebases.
> - Link to v1: https://lore.kernel.org/r/20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (11):
>       media: qcom: iris: drop pas_id from the iris_platform_data struct
>       media: qcom: iris: use common set_preset_registers function
>       media: qcom: iris: don't use function indirection in gen2-specific code
>       media: qcom: iris: split HFI session ops from core ops
>       media: qcom: iris: merge hfi_response_ops and hfi_command_ops
>       media: qcom: iris: move get_instance to iris_hfi_sys_ops
>       media: qcom: iris: drop hw_response_timeout_val from platform data
>       media: qcom: iris: split firmware_data from raw platform data
>       media: qcom: iris: split platform data from firmware data
>       media: qcom: iris: use new firmware name for SM8250
>       media: qcom: iris: extract firmware description data
> 
>  drivers/media/platform/qcom/iris/Makefile          |   6 +-
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  88 ++---
>  drivers/media/platform/qcom/iris/iris_common.c     |   8 +-
>  drivers/media/platform/qcom/iris/iris_core.c       |   3 +-
>  drivers/media/platform/qcom/iris/iris_core.h       |   9 +-
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |  54 +--
>  drivers/media/platform/qcom/iris/iris_firmware.c   |  13 +-
>  drivers/media/platform/qcom/iris/iris_hfi_common.c |   6 +-
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  13 +-
>  .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 168 +--------
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   6 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  43 ++-
>  .../platform/qcom/iris/iris_hfi_gen1_response.c    |  11 +-
>  .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 413 +--------------------
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   5 +-
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 115 +++---
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  11 +-
>  drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
>  .../platform/qcom/iris/iris_platform_common.h      |  95 +++--
>  .../platform/qcom/iris/iris_platform_sm8250.h      |  29 ++
>  .../platform/qcom/iris/iris_platform_sm8550.h      |  31 ++
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 132 +++++++
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 219 +++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |   5 +-
>  drivers/media/platform/qcom/iris/iris_utils.c      |   5 +-
>  drivers/media/platform/qcom/iris/iris_vb2.c        |   2 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       |   6 +-
>  drivers/media/platform/qcom/iris/iris_venc.c       |   4 +-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  14 +-
>  drivers/media/platform/qcom/iris/iris_vpu_common.c |  11 +-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
>  31 files changed, 703 insertions(+), 828 deletions(-)
> ---
> base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
> change-id: 20260227-iris-platform-data-c5c80e84d1a7
> prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v4
> prerequisite-patch-id: 615a763749fdc0c4ee184478bc64120972d8c7a1
> prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
> prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
> prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
> prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
> prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
> prerequisite-change-id: 20260110-iris-ubwc-06f64cbb31ae:v4
> prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
> prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
> prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
> prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
> prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
> prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
> prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
> prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
> prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
> prerequisite-change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497:v5
> prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
> prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
> prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
> prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
> prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
> prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
> prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
> prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
> prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
> prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449
> 

Could you please fix the depednecies when you send v10 for this?
some patches are not applying cleanly on latest media-committer.

Thanks,
Dikshita


> Best regards,

