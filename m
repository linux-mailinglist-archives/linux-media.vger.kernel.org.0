Return-Path: <linux-media+bounces-52972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLYaIohZlGkXDAIAu9opvQ
	(envelope-from <linux-media+bounces-52972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 13:05:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDAF14BC47
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 13:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB8A1303320F
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 12:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F623382F4;
	Tue, 17 Feb 2026 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRvVmN3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFihUg2A"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF51337BA1
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 12:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329905; cv=pass; b=rs1bQDxoeX6DzIkZCUt9ghYxQIWcut/9YzVO7oUuZWJhOuuiu/BOGRMG1MSngqW5dYC5G44FgendnRsRgK/F2EIoPh9ZktlCMUp6eQ0hJCf7q84zb+GVmP06RFTI2eniNlQ+1aVFiCKHnpfHqrxGGmhmuguuEUHxgHExlEBaxWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329905; c=relaxed/simple;
	bh=9KVFgu+BEJg1ZO43wRkIdKpD6W9Kxf3Y90o49FxY7zA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nve2Et4f8uxHEBNm+Pm3VVI8bVEKt4OBy0Oi4bwZE8zHEaDZ/eCzcbmCjyqdfKfayKx4ZlfqRbbVMRDWpLiDjkTrRBC0Uyeixi1pwpGCHPsWpo6ozjwtBswMVfP9AjATLJDv+0QEi3ehfTXww9gY9aggUunLBgjrIrDpjbjYcKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRvVmN3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFihUg2A; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H0P1HZ1223109
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 12:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S/yWZoY0bWvRAXMRtCqqCAXL
	oYJkkT33hUE89JH+vyA=; b=TRvVmN3cvKt3SzUiJFOL5+4H/jgCEkLkSzs+eXZI
	bTP3rNZpJRaPr2Evk02oHEi+igXXNbCQF0NmmRM4w6ngqZHS1PEEyWx/vH5Uy5/J
	RUmQxMc2go80ZFbJJb8JrFT18ev2W398WATP0r/RN1y21X/jiSIeRbRi4zJkCpq+
	7cT1uNJtxY5zdNN6yKTk3Vo7O5WuksYVQo3bAij9Enfi8kayM17DJuXueYi8QjHj
	7U6ec1WPeeTeqt+Jk6LuPF+qyiJaPnToUuW2+WvQHE/+VXPX4+fwZ6UWuCGl1BhK
	pseTYseZLFs+jys2CuGWPy5KKBBOH71K1LIQa8EemY8wYw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrt73f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 12:05:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3569ceeb335so4320155a91.2
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 04:05:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771329902; cv=none;
        d=google.com; s=arc-20240605;
        b=UaCz1U8aM+sJ9OXjIlgmYdaPSjjDjNN8TcxUqQw2H/F0LPbEvLSRVT53IMZ2yuD7+Y
         W0sB8E6qRLJUbM06oJC/j69G/mpHxXp8K811uRnMigJCihIs7yKCfDvDE8IsgIvEgkyB
         PCi84kdCURmeV8LHwgDBsx5w1/9kzp8AHSFNPdqKXGJwZCewpo3BvN/HZ77uO12XvNq/
         8Ywhqq6+1yH1rOSF9q+eSZbTs2ZbyJwouTzblC0TqjMHFejbozg34c9pUqcUYH8V9ds4
         0bBWbGZXZxUMMaBuMqHIYDZmSf35hLfeARz4fZi3nNPwktMSFcTJA80o46DQ/fQYgoSb
         +OUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S/yWZoY0bWvRAXMRtCqqCAXLoYJkkT33hUE89JH+vyA=;
        fh=L1u86aaLYja+AxV+fA0O3omj8k9GTDqpSpNA9Jh5qFM=;
        b=C9YYArQiu9m6J5qmSqMkhPCl++DG8P5oXPTqakDJaeC/SiSnucfOYO7UT5zulv5tTU
         fjyPRxAUXoPEwUbuXKGj66fCjsxBq0DeNpxbN9fxiFfrjYVE5B4mU0GnrOJhRDc2J1N4
         SzjNfwuPGpEbMrDY8gXxYQeAuM2UwWIwTC5XkP+qCdPbWRNyK3uGAckUCOHCaf+uAxBP
         4MKDBYiMzxrHGG7Ob1LjffdLb1C0oxiYdoDcI+xO8ADf3I/CudrmwzdUOok8F+W7RNKg
         aJ01+Z+zaJKBnXaArNGV82RydxdAUwRwoBRKSyFCDpG9KiVxkd5VIbOV1jhB11jL/1dK
         1hBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329902; x=1771934702; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S/yWZoY0bWvRAXMRtCqqCAXLoYJkkT33hUE89JH+vyA=;
        b=MFihUg2Avsn+L0Pi7GfkxXJSd4nU9BirqCxtr9FwJBfCzyT7dmxGbAdhVXp/Ytoa9x
         5b7d4MQu+9qoNjIuw+NVO511SgwntsV60PGwPTpAa4IsYmtjo0+HUrxPvMc/I+n7V9G/
         EseEhdG6EIXXRj68Fu9DCdLglDmM+DH6WYDboYKNyFLpGtu9RFjoPOaL5B9dS/91Nn3/
         dUHJNHGlHvVRFWNsOYv7sm6JX5HSsJppEoy6H2YmH2RgksFeSJbzBYxrTWByF4aDflsC
         JxBB8FRfwqZGabJ6veLcbn68iqVCyqtn9FDN2S7EuN4nC4/oVhAJkApqhQH+IOk9VBOI
         jdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329902; x=1771934702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/yWZoY0bWvRAXMRtCqqCAXLoYJkkT33hUE89JH+vyA=;
        b=HjdkiXn8GPDqy2Tg2tcO+jlNV2MgKC3XEODibMgUbn/Svk5nm59fZXXZ3RQutCHn6u
         A/6VEcUqhPgtP5kaPuyIT/MOx0z+kbjiuWtG8Q+Z3VynTg0ifYL7L287UXA+moRyjM69
         JJNIRbodwKtFaMiUsrkEIq4pcS0OI2wyaL+YoJFxCDkgE1S6wbCdiVf+7rpeSA44tcVR
         zt17Zsg8WBbMAdf87ySLmzU/sM85CvdMJEBeHn+yVJBf7mWEM6lKo11W0x4ncmyIVAUK
         MMNa+ISOKm8Gg3KKuut+D3+uLqkL/nYKAYrlHvrKXo7m2JESXQzTox0VAdfgVrxSzhpf
         n1Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWoATx7WgbsCArYM5OlDkhg2G7MNL/8C+bZJJyFv9RG5wRvR3GewaclRrZMCh9+XdupBc29CChuT2oIAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm0QkFOGqPCB1azz3l2gd6Ch1+lWcZiUT4neU4I5VqK1H5zf0S
	uK1x5ezCe7c8XRP3mjOa3ZrLEAP7qLP+okjLMNNekXEmj+4uWhjDoLMuu3fMrx6Ed40ou17imrA
	FrLySnb0T1u2no5+CyU2XGnD/d2COSlJv9i/HnrGC83y2whwhJ6LA+sm2SGxFxX0VgwLSkdRfbd
	4WT68fEu+SqBFND26fSIefmEITsBkrEY0hFVUtw+UW
X-Gm-Gg: AZuq6aKrbgfuCmAOYZACiLqWT7PAkvW6wEcE331jQmOIA4gLdpcgWa4j6rQVOS2HoPC
	wClv6GYQpOt9qqrry7OZnkhfwAF0tawmMLZ2wU5Ueg1JHwbiZbt1AElZb0MO/OPsaaICYg5oleB
	0UwGKXxaI44WwdLikiXLfRvWIIZMchycQJo1RYCjfr39UKIxQM/3Pbpwr3qCaMGKmbK4+d8Ct+7
	8hjTDt4YRazTabp3IOX
X-Received: by 2002:a17:90b:5646:b0:34c:aba2:dd95 with SMTP id 98e67ed59e1d1-356aad9e00emr11360443a91.26.1771329901783;
        Tue, 17 Feb 2026 04:05:01 -0800 (PST)
X-Received: by 2002:a17:90b:5646:b0:34c:aba2:dd95 with SMTP id
 98e67ed59e1d1-356aad9e00emr11360417a91.26.1771329901223; Tue, 17 Feb 2026
 04:05:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com> <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com> <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com> <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
 <mnqt1vydHJ7duvh6qPmtIczPjjPtvVtq45CYhLhlpdAIKfAXuZDtVvIZD2SN2d2m7oF1f75HTXuXFO7qS4ahxw==@protonmail.internalid>
 <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com> <36e636d9-befb-40fd-b63c-6ae48df61199@kernel.org>
In-Reply-To: <36e636d9-befb-40fd-b63c-6ae48df61199@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:04:50 +0200
X-Gm-Features: AaiRm53GORJdxBY3_kRF8qG8hajVea-pFFjSIbX7-vNM8UH9kdgfxYwxz3VkIQE
Message-ID: <CAO9ioeX0HZNOKmDkrp-HPSei_QAYGvar0-b1ptrJnoWKu9X-kw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=6994596e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=_iRmVI0JDk5pcTnXREgA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfX5l3YJLmVLuvR
 z++g1G/fUirvrHc9xVkN7/2jWsECHT2adAT+506rAiCsA+wkWnUMiGYQC1N59ATASCq/MqBvRT4
 OfvrjTeR09NfpGbIusu4lAGj+V/TQbCb7PiqhcRaELM1bOvZUd4l3NSwi+i/iCwK4C0nXckprmJ
 LWN+KH+QuO83eASz3PVymVypiiOGb4w9L/Rql82tg5NxlDxelJS/GN4TwTBB3w+WYUEP8IzDFe/
 0WtU59Zrmmj8f5uW5zE/KtpgVUjnqr9qBs1lXXZiCtLWOWUwtu+ar7DTeNbvjtexMpxgfPwFNgK
 kPCsJjJw2IxAf+6OF3a1yz92GoVGr7D/b/K3Ppj8NYWxNToW9ZO1igc8Sfa+N0tfZbo0h81mrU/
 wKDvBmx/n2yg+jz4m31vL5OsuftNhZeHpwxjsqzCI1PzOb1O68WQp8q8DdHd7mnKHMFBO3JtUSt
 sxBc8nMQ38dhnRpvA4w==
X-Proofpoint-ORIG-GUID: oohx6HCX3j5ONhkuDF3ah_cQnj_yO_nh
X-Proofpoint-GUID: oohx6HCX3j5ONhkuDF3ah_cQnj_yO_nh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-52972-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 2EDAF14BC47
X-Rspamd-Action: no action

On Tue, 17 Feb 2026 at 12:37, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 17/02/2026 07:40, Dikshita Agarwal wrote:
> > Due to these constraints, I think, the only possible way is to extract the
> > version from the firmware binary blob itself.
>
> According to the internet machine
>
> MDT::SW_ID
>       GEN1 == 0x0b || 0x0c
>       GEN2 == 0x24 (or above one assumes)

Neither one is correct. I see SW_ID = 0x0e for all VPU binaries in
linux-firmware.

>
> If you can verify that with the Iris firmware people we should be able
> to parse that data out of the mdt header and reliably differentiate on it.
>
> ---
> bod



-- 
With best wishes
Dmitry

