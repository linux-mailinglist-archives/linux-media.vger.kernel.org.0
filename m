Return-Path: <linux-media+bounces-65564-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8nmCGfvpO2obfQgAu9opvQ
	(envelope-from <linux-media+bounces-65564-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 16:30:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3896BF1F5
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 16:30:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kUQy7MEv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kC976qMJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65564-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65564-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAABE311D50D
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6C93C4171;
	Wed, 24 Jun 2026 14:23:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC5B3C0A09
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 14:23:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311030; cv=none; b=PG1ZxHs4zekPe8XsnwksWjR7kg5TbZPAxvBdyeTygGRMEN/UdxQPobtBxTJDRWUbMIC3WTcWpfQ7j/lWAhIcTk295FsdTWhq43HPvpcz9L1q8nBfncQOsm0Hge3F8LvY8lh8wvXk4bnwVOr2IsNHWfuW9WBORbnhDCW/UuA/Z+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311030; c=relaxed/simple;
	bh=QNGenFbPTeXL/Rook3irOlkkvGOXohHaOGEMChBsdQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/F0Wnuu81qyyMBTa+vw0g1Ff+x2S+qRvMeMNTNu0o6R/cmmeTd2TvfY5VhaLHf5iPGPTn8gu7dOtVHXdyEEUzaZ4MvP3iKtlbGTRDzOXc5Bgwad3QnymCJofMMhbcbkBdeYRwro8p2hK6M9PaFt2UTiUWoG3rKNCqTMJBG45wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUQy7MEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kC976qMJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANkAa2503629
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 14:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NcpTjJLsVJBbegyf3923g3GsuTzjADZiqREetvkabCw=; b=kUQy7MEvtVXFcrSN
	Kurx+11u/l2qBqnAstYKRG3amRWswGVomFm4a5gA6cUsbviOIHWjMAzlBDtvTDNe
	gx2dghLCx7TE/Tiys4lDnoqrwpdlumR1M7Rklux+XC2+c6j5WOMw4hGMM4Fd7FV7
	3ImFV/vMU1yPkKM1VjrqlsbZmVYN+eEtrutp0cMoaVnNR7C5XV5ajG8kmVtTvwYO
	OTrZNwy7N+qwltmYqeqYdsBhPGZxJTiywfAyMs/UDXI3PnK2PMeHGVsUEu5qTM41
	miBL8AQv870WvJWT2kSnVVkscPK19pTw+FqpjOI+NLx612gEYHkPGVp8k+om1SYm
	kVs07Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfamp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 14:23:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422b544a4bso830487b3a.3
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782311026; x=1782915826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NcpTjJLsVJBbegyf3923g3GsuTzjADZiqREetvkabCw=;
        b=kC976qMJd8laodnsxMqG6b8d5NyxbIU63Xw+MFziSv0Nz5dgRTnUMkLG9zGIswrpbq
         pwy545oxTQF61EGk1ObnL2x8hOM0Kisym5SeGP5UEUGfyi2VvwsAPFA5zmChJBMnscop
         V3x3llX96/DYM5+96R0qEH8x2JWXm92T5YiXFKkmaMG6Wx42FVm1F9IPAhURo82Uwjkd
         vD+e7mRCzAl3RMwf/NS6AOgQcc41xrhkoRnel0zdVt1mfw/AMoT8QlRYi6hMU+3K3LbU
         tkinVjjXtedBdw7ut5OWjTjCuFbHYTeqjqKZvScXD5laKePmCn/EqBB6fdI7+RKsJ3nD
         2lfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311026; x=1782915826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcpTjJLsVJBbegyf3923g3GsuTzjADZiqREetvkabCw=;
        b=mEfr5HeMZu58k1qLRMCDGsYHAt/daVO6mGkzBrnne3dPRwv2nk7A1l+oqWRVPtndw4
         8l9nnODb28SFVCl801VqfopQ1dEM+vnwThx2q+voIO/BihV5I9+IbE1BUJrblBCVTFZ7
         aGfNl9fYXELxzfu5YM25A95+/HNL0OF9fdADItzSxIWASrGidx4uGIuVYc3umBri+1lO
         oveQ9ZkTJ58AAw+M0hSPQ8mxYBQykchZSfFg9fAyPMQYIX8utCCT52XqPSQZDp4+rRgR
         rGkdqQ8zgHGLOrtrQZPuaTCxkzFkqlxUlSmmeK80yUDwfdNfJkDZ/5cZP6+7ENDDMBlE
         Na9w==
X-Gm-Message-State: AOJu0Yzi0WTbefVkT71G5+BnZMgNwywVDCx/Z/Kj74N+s97ikDqD0mMt
	ET2mT8goPi+361Q/Pfu7Qazi0UArxb6iYqq8Xepig+38Ip2jpiN3XWtZBGL1d5XJjbqJImzoInX
	HQjN+iDlzaZutKZGVxlIllncuZVF+SXJMskEF4QwkL/2Eo15KP3YZG/xSQwTMiDAKeg==
X-Gm-Gg: AfdE7cmRTUOrguUrJWLiJZ2D5s5Az6JLySAgfo6WrmQLur8oew5R7jjmnFJ9LrvYsaP
	AP6HI/laZdGeN5tx95eIXTQdaflOggQP4xTuclXBFwRVgv+wEglIvEBAaRbJmdCjkHGU7Ps4W+J
	I9c5lzXYABeEPSB0i1UDYK6TYhfTnRFmmiaKerXg3THCWFNjmnhVPOExAWmRRkanhFQPXRlxr6I
	g2zC/UovhhGZ5G141y6irakDTOSN7GoB55RLR5WJLctCE2Rc1ctcn5r6G1Mnc9E2faBizOSh2Gh
	f3X8wmd36FCEBspM5h7iHXFvbqvr4kqbJckrMhNVpJx+3+jSpgkj1iPze1DR/ivl6cPA0uIweXV
	kTdkeo5U1pp7zFSh2II8ZtyUza3o40UR2fT5da38zWGSo
X-Received: by 2002:a05:6a00:1311:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8456247857bmr21212418b3a.10.1782311025891;
        Wed, 24 Jun 2026 07:23:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:1311:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8456247857bmr21212373b3a.10.1782311025442;
        Wed, 24 Jun 2026 07:23:45 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc773sm2548152b3a.11.2026.06.24.07.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 07:23:44 -0700 (PDT)
Message-ID: <74d3f07b-3212-41dc-ba59-ecac57dd1b78@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 19:53:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/16] media: iris: constify inst_fw_cap_sm8250_dec
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-16-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-16-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3be873 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=e8S3DcHKpQokSN46YpYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Loul-pO6Q5whHRh66llzFilbUenYcw60
X-Proofpoint-ORIG-GUID: Loul-pO6Q5whHRh66llzFilbUenYcw60
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfX8XBpzquzU6SR
 XAI5+adbj98lYjNfU47Py2zYpgAKr9565UhsUaAlKUHNP5XRwVx1ls42cpE5xkfPfcTTDtQuokk
 2qXvfcE7lc52AAoW8iPa0PUNEkMGCDc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfX34HDOKWIbiZv
 BrKsI9zOszwoUrhMWiqdCUAiUF87k93I4+FpUqY+edL2GjNz5//ZtsSpHSNnhEcw5GkaTOT0ImK
 zzELHH1hBtfk2WHlc+PigOsmLz5fYw5y+z9ZsT0qyLHJEWVx2nXUvYQJ9mRleDU6ToNcsW5WfaF
 hW+Z2NNi1J6Ak+iLYhsT+cy1FpbtUEbG1v+reLLv++BY6Zxq1mPkKaZYzd5w/6QtvHInWfENNmj
 Tn1TKyE+YHoHOrkrLDYQYWFaJH/T8DUiIpFqvp41GiS11qWvbYgZbkpnI4To5lv07sqjwHkF2ZY
 lXqWaOi69rOt41wFur0ycpFGYcUdVFvzKwdo1FwBeC8fskXQkUGIRglZkp42jvoKp2Aif81Ok8L
 fg1lBqc+Hb8cXVEa6/fKhqkjVe9XgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65564-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF3896BF1F5



On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.
> 
> Suggested-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


