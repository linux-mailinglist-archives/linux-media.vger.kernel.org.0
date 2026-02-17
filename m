Return-Path: <linux-media+bounces-52969-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAVYOj9JlGn0BwIAu9opvQ
	(envelope-from <linux-media+bounces-52969-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 11:55:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA9C14B0AD
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 11:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D371E302A54D
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 10:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C0432BF23;
	Tue, 17 Feb 2026 10:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjpket2t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ls0r302d"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448AF32ABCE
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771325750; cv=none; b=biO8+hpjSvoyW18HzOERdAH4VSycg7NnAdDh8+xX3vFC6ACJGjo25NpMWYBPU1Gx3zflWzZuyOY8Tlzf+V+UyHor97F2dEeNi5UwRgRzJhxVFSxusWGhPWDB27IqqiqcUClfufLWhbXbhwEpNln+hl8mRCS6rHzZ/81yk83s8As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771325750; c=relaxed/simple;
	bh=fQkAhhQAqFJXXjDjlKJ4Pr2ZUi0r4H/CsWFdmxSGiOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrUEM1KPCGFH6VBY/v5Y6iTB+ddYEx16VuabKlLfFhbvYb3bBv4coLSnjbhXXhlVLJowCln8XHiDNvo6LUMCNEDphk7gywupwskV5Ptz1LOdllOu7Eik340Wr+lrmPToWXh0w36iNr3Xb9WqDjRGy3qsw1Wd3wygrcoVABCjKMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjpket2t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ls0r302d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GNYmU02296956
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 10:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zqkImrZ3d6J+orJLxyPG7cK4X2BClCQg2tGoIiWRLY0=; b=gjpket2tJkF7Ry6c
	4Wxoow40RYWa1aGiYUPjFUiolbC8H6rqJ6xSGmY7S5fnMe6U+ZTnJOGIsre4Lxn8
	NJ/Zkz4nigFnnK1IqbRum3Org8EoX5Bc+JSHwp6ZDBEHq4udGF6ql2RZfrn6gX1i
	bjbNcshnjtxaPglb1ahI4lOIt+XidFv/rO5vdULJDlI8UfeiGDUeQTOqiSk5eT95
	3GceHAb5m4skPLqWBzmdc7yXp0H0c6+SNHNRBjEPc9uupIOQWSoRQNAwCCXKHiVo
	dS+XbCZ40Qd/pekF3d3EOjS3y1dpdk+xVfvtyWHYk0MogZ1P/TyQvEUNgVf5brjE
	wpxvgA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajsvsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 10:55:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50dfd542so229200685a.0
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 02:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771325747; x=1771930547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqkImrZ3d6J+orJLxyPG7cK4X2BClCQg2tGoIiWRLY0=;
        b=Ls0r302dja9OozseCL0EH/6cwPwMFflYKKoH05uyw3jO6R6/2Bp1nSEdS7TDhHDPcU
         p91QaBV5o40ue1te0aqKLa6WRHj8d1lW8rYwC6PVWQvNc3gnYJg5h9g013gJjssY11od
         phO48fIHh6FltnBhLQ7hM1gHyuHnxnlC4IBmBmI/TiXAGw60HBAbUE3zt40NMhLZmPQi
         Q+zpMah2ZaEyn9qNkHwW6N3m9wmXkhC98hfJgOsI9expAf/IJXvQGgW/2KNGzOAli9VW
         kK1sHSz+IEUdWtNGQ9V5zGWmvtszkjzZ2102UWth/Di50tr+8r0hBOZrEFjhgWzNVv8z
         6Zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771325747; x=1771930547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqkImrZ3d6J+orJLxyPG7cK4X2BClCQg2tGoIiWRLY0=;
        b=UViN2ySfY8TAg7eShTLhxo0ixLDLO0L2YA3ONNPEFyA6uCNT0fZQZGylAT4g4Mv6i4
         n/HwSoibPoVSDjjZq9wXjz5TLSqKdzagHe1hyG/80wKXnTVu6JhHlJtqkMK89XtiuDAp
         XB1uF4wVrP50CTRBtDkc2exK115T3GpLYVXOv5BC+B5UpFSc+ygTHZcT3hH9Gr2Cike/
         7Yxj4FjMlLQp62eL2TB3GZJzTpB8Oa/fzNCvFe7xuimwYvHlr16ycsVz+SJxqC4Wztt9
         46EQygjkK7MIKVltPUseAn4QfRFixJY/IeLNoTFF5JIxDUQErzrykm82ssbNR5KRakoH
         5H2w==
X-Forwarded-Encrypted: i=1; AJvYcCV0IDg0N0pH0JQtSC7ZhHz35bAc6j6IGEMdpu7cqpVNrqQqmlWd0xdohij+UMU4aiHPtjJtrBg+RsB65w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2yP1GWrrrqb6fSdzrY5L1Qj7AOGQdz9Bg4AJa/QGZYop/NR/F
	f03MNbemBgu4ZgyWZmCjKZDjWq8d8zNNltX3nnBZNl2fGDh6dQj754oTKEpd5kqnMu9yGDadIr9
	OE5Fe7vVhSVO3umYOiTi7Qv37Uf+Ik76Oy94p2R+pQI9HalqsdJHUtJWmbcDIBVPdAg==
X-Gm-Gg: AZuq6aIHEH6bsJkLgXkGqfO4yqtT8tsrIAGcyKiJvmYE6RaO7WdJlu2VTW7sOlot/lc
	BcmUs8R8ez3lvymhCCEvcfhxuVQyC5vNOD/iL1+IwnVPbOM1TwwRSnrRCgluqrJFz1WK1Cacbdm
	QBFPYQRI64f/0hWR4q90KMZHnovn9D5XalpmY0609Le54oyjdxJlsA7cBjX5YmfKlVkWAOCaCeb
	s2QLL3bGejXhp0WfZw3VdLPyjkLh8gNWe7FXAkBZvPIqRyWuqKFmZJrJShoSFCRcvRDmKDPrXE1
	Zgf6A5ndhdFhRyNF6s9PEL6e2nVHgoQDosaQi9pGVctjfqisGzSh8SvClhAuKLeeTU8UPNIDyn8
	LVhjL2gPHDy/DTXvwQVWuuiDrkOaI+PI10B+/0jPIFwYM0Pqlo0FkSHS267u9pUFErFn9D06Mam
	rPUmg=
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1324178285a.4.1771325747269;
        Tue, 17 Feb 2026 02:55:47 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1324177385a.4.1771325746709;
        Tue, 17 Feb 2026 02:55:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f129fsm2234759a12.29.2026.02.17.02.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 02:55:45 -0800 (PST)
Message-ID: <5dd7834b-2e9c-4865-af6f-c362aa0c8287@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 11:55:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable
 values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5MCBTYWx0ZWRfXye0Bqzl/1NSt
 RDJrgUyOKZqY6iXPi7NWNYD68LombnCfDQh+Mzv3+fCvWroLS7HxoPMMhB4lUmt4j+NKc67wTIV
 Qs1g6iXeLAfCxG7vzF2YKyP7nlFp/LDL4D0LU07ouObT8DQ38KuMlEmbJQyDQW5v65Y7esDJK/X
 hLBjQWEanUnPw6aXuEYaGV+bgg+SzgE82nF6j4/JPN9AUlVopkegBl1kmwi2WFfQV0ADBGqU9HE
 OKRxTKvQKVXofrfczZl2QLTviCApKPFY+xL7z/4RC4PQrLdqEpPS51ZBoAQAXAR4w320SfhToN0
 S1aeNPWdgovys6IytWtHEgNxyVX7eJDvguPQZuGnbEf+OJbJFeX2S7AC7P1/LvvhE+C4L+WKbCC
 HQiksAY3ZuWd5THzzKX35Veef0KtVHwMfLbDdrzRMuJfQzJJ4mDX/5kr86gB0C3sC87+8/I10wR
 w/NE29cMXE0Mzleym9Q==
X-Proofpoint-ORIG-GUID: 1OEEE3Ch-vHrK4c4sHS3vtVuFa9ZRMSY
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=69944934 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=gMz6hfKilskiRDmxBycA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 1OEEE3Ch-vHrK4c4sHS3vtVuFa9ZRMSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52969-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5FA9C14B0AD
X-Rspamd-Action: no action

On 1/25/26 12:30 PM, Dmitry Baryshkov wrote:
> Currently the database stores macrotile_mode in the data. However it
> can be derived from the rest of the data: it should be used for UBWC
> encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).
> 
> The ubwc_bank_spread field seems to be based on the impreside data we
> had for the MDSS and DPU programming. In some cases UBWC engine inside
> the display controller doesn't need to program it, although bank spread
> is to be enabled.
> 
> Bank swizzle is also currently stored as is, but it is almost standard
> (banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
> being Lemans (it uses only bank 3).
> 
> Add helpers returning values from the config for now. They will be
> rewritten later, in a separate series, but having the helper now
> simplifies refacroring the code later.
> 
> Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index 5bdeca18d54d..f5d0e2341261 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -84,4 +84,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
>  		 cfg->ubwc_dec_version == UBWC_3_0);
>  }
>  
> +static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)

Should we rename this to something like "qcom_ubwc_macrotile_mode_8ch()"?

Konrad

