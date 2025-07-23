Return-Path: <linux-media+bounces-38259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52736B0F2BD
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 15:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFD835484AF
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 13:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706A82E762C;
	Wed, 23 Jul 2025 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hpa0DRnu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661B48528E
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275713; cv=none; b=bZRmHkIVSTA4eQjMVV8CU9BLHLr0TXpp2q2AD04werw/2lLbv6JHMQV6LQMxTU0jCRRRU05siPItf4mqTa8N9FGP+/1h0U8r0P52BVQG00FVXtzEmau1opn8HzgsRtBmgzRtWfY9+wk0QLIbN84o5iS7peJULV240pYvOIoIJLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275713; c=relaxed/simple;
	bh=dRAk0o72e+X33KIq1LpoL6MfpiBTQz1RGTe2fzqE5FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UB7XWdCE9b1Z2E+pox1noWNHxf8+fRkdd0oxOTaPrXWfeFczlJEh0iWAyQbfVLWrSvwcXKpxEPWecZqM4lIYkWIuLO/e2Mc3fAX6cY6vJ7sI1TdkyKAJbuFKpXgasNosDPxPwB49zAF0PISFzQPgsXRV8pExwu6nYMYt8HF51uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hpa0DRnu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9CEWo024763
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 13:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1wPevboyTw5NwvNz5iHDyoVz
	DX1UybG8R0FxydcjI4w=; b=Hpa0DRnuOU88PnbYNQ38/T3Mu4FVgeRR/v8904uk
	xJdfCBisz64OSOHu5mc3OGS8mxV8yzgE7wLlz7eMqf1xBbfPIvm1PbpD5jwRtwR+
	V9qEC7OMlmjIHQRl+8D/m/8VB9KKBoVzLotuCrgfLHQ/59hkyth/ydQJK3jN0GQQ
	cp6PvlPJP0fBUZmCLy0SuE4ro4ZfQ7yJx29YahA7BUjSrslvMC41BDJ35xp6P2RZ
	lynwOwepUcEWlseWadWTF3wzU5DESPvNydujJ8TzrqqJmSNY+J3aCocphGqYxIlG
	1d8TRBQVv3AHNCuqtyDGOcQsVu2UO3Pbkyb1CpLKSH/UXQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dn12h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 13:01:51 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-427850a77a2so161302b6e.3
        for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 06:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753275710; x=1753880510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wPevboyTw5NwvNz5iHDyoVzDX1UybG8R0FxydcjI4w=;
        b=PA7zGYIN1e43qS45duKbmQZXbg7MnXP3E8QHDivBqqC1kKFNwGLO/1lNfZWfopHKgN
         0wnmYlz4MPYlFKEDJWKO24noE/ELJSTIV0AxtDXMXMwtHunT0mSroDMYQY063Nio1Yhn
         rHIs+TUaT78XJ6uNs1vIserytKslR4xwqsmXwy94C3cMINTsCpa624w9VAnKu4fQoFL4
         DLUBOIEjPLGpCHJcmjL9FxbABcMwEY9RzF+RcNBK+ZDxaR9Qenj/M/N1A0hvWb5QlI/z
         Eoedl5YbVC6UFELpm+bQ1ESNVCgd7xtrPen2gO8/r9Gb3cI9iQKj+Fv8a4yuwACZXhBI
         pkcA==
X-Forwarded-Encrypted: i=1; AJvYcCWhtvY60FCwdFKwgMwnTceodOBVK7c9/NoV+pUr2n0p/ocqI4g1gMVKuGL6by801SmofbJ90NVg8Ke1Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywix9iFtyyMEqTjVpVvCNSVEv94+XRr/gaKiLY3DyCMvVql3TZ9
	HrYmgACBwIT/YxefkoypmbhhWO9Pds427uGMTw9tg8G9l8NcytVUN3OoJFsT+xbnjp31jcgqaLY
	ji+chtNJ8wf+Rn76NggDioCgZRFTBep2xIIvVXLMuqCd7/tF7qZyL5BMx1WMx9HlYXA==
X-Gm-Gg: ASbGncu1dyB2MiEbIKpnUtiVAF0SFa2nyoQybm7g1BFufPHaFM5Z2dF0WLoi0Jy2Yoz
	L/GG0GeE2iW0HX8El5+AK491IpQgIStNjI/flbHJhl1tFBwbEc37fo24bSwwTJ241aaboL5D1r+
	520DmbEuasdb2mZFmeVNgODJMPPxadh9LekpGSUZt6YfO+GinVBLQjivRnAGOIY/7UcVBOUnsQ2
	32aq/iHT1z7GGqmcx13eVy49v1iYW/5EE3AvevAjqnnmWdeicCXv1WiqTOjO0eAZqrG73BrTK+Y
	Q1VTtI06YK+wSe5Q1rRwkMpfG2Q9IVLEfScxLks1b24bQbj70UHAl7EDFaeF/YGNgdPaTK9yB6o
	dg8W7I4ceWI70jkqidilv3z/zaSJTyWR0GcosvATBaTE9r6MPC8R/
X-Received: by 2002:a05:6808:2203:b0:406:7cef:46a with SMTP id 5614622812f47-426c642f047mr2288846b6e.19.1753275708741;
        Wed, 23 Jul 2025 06:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGneR6HtJeJALFHOLFmNSXyrHOofiM8HoHdB+oxIXAcXdndJc6GaB0Ve8NkfrbBMs8XEHgUuw==
X-Received: by 2002:a05:6808:2203:b0:406:7cef:46a with SMTP id 5614622812f47-426c642f047mr2288580b6e.19.1753275706737;
        Wed, 23 Jul 2025 06:01:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91f12b0sm21241281fa.98.2025.07.23.06.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:01:45 -0700 (PDT)
Date: Wed, 23 Jul 2025 16:01:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: quic_qiweil@quicinc.com, quic_wangaow@quicinc.com,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: pm_helpers: add fallback for the opp-table
Message-ID: <k6umaq7xrfma44vm75ea6m7vqd3hn367xdymsjylp3zcqn5vmd@jbvgdknnc7ri>
References: <20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com>
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6880dd3f cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iWKRvkjQqEvONqlByQsA:9
 a=CjuIK1q_8ugA:10 a=pF_qn-MSjDawc0seGVz6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: VeAIyTZ2sS22ykn1KcHAwxxUxWjDtcQC
X-Proofpoint-ORIG-GUID: VeAIyTZ2sS22ykn1KcHAwxxUxWjDtcQC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExMSBTYWx0ZWRfX74t5NBBHcwgc
 N4MVEFEQ/d04a9fBZJ6smS7x6wHJczikvPnYFWH46GSQEyrnGzbQ0Y9Ax/HsQcDtLF73ySe5Q2s
 Q8SmPVVmIs8QLnIa4p4jTbtqzDFpNoebzGxcgL/vZDlScM5GIDLRhsT/12DY6SkJLVe5koyUlrv
 oK/gZeDLOaP/IE4OQRr/eVnbwqJKDGmJFeBUwXXFOpQBcThNdCGpj1xcT5lr8E2uVPTv5bfFxAu
 /rNUfngsD8u4N7cijY2sspFInodgqWaTR0HLNwBHJ3hwj7GlLGs3g+XIYdRBiqVJgxdOPo2OJa6
 jmwosp4K948ESRMhsUCaxxu650sP44cJ8xIxbiFJwL64trT9/dGA2icAgDaBz0/cUjF3uoLFfHi
 Cw7SPiwyxJ3vYZjIy9cgDtIPY9r450gpfnJVAnm3OFeMfZtrPBUhguaOaXHDfJz2ljBWKcgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230111

On Wed, Jul 23, 2025 at 06:26:02PM +0530, Renjiang Han wrote:
> Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
> do not include an opp-table and have not configured opp-pmdomain, they
> still need to use the frequencies defined in the driver's freq_tbl.
> 
> Both core_power_v1 and core_power_v4 functions require core_clks_enable
> function during POWER_ON. Therefore, in the core_clks_enable function,
> if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
> it needs to fall back to the freq_tbl to retrieve the frequency.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> Since device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX do not
> contain an opp-table and have not configured opp-pmdomain, they still
> need to use the frequencies defined in the driver's freq_tbl.
> 
> Therefore, if calling dev_pm_opp_find_freq_ceil to obtain the frequency
> fails in the core_clks_enable, it needs to fall back to the freq_tbl to
> retrieve the frequency.
> 
> Validated this series on QCS615 and msm8916.
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Fixes: b179234b5e59 ("media: venus: pm_helpers: use opp-table for the frequency")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

