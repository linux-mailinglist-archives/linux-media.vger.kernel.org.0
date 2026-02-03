Return-Path: <linux-media+bounces-52093-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L3yEUK8gWm7JAMAu9opvQ
	(envelope-from <linux-media+bounces-52093-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 10:13:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5324D6A4A
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 10:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AE89308E50A
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 09:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CE630E83E;
	Tue,  3 Feb 2026 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtfecnF7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D60oRpno"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C87274B59
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109759; cv=none; b=brem8o5Eqvq57kptNHHG0RcBg0GrcEndjDLDpfUmFMiHS3Did2mJxPnkfk+jqOk4JXB84jvRWyjDC5j4OeRrff/+PrIe5TYJZC1XqNvT0FtFLQJJeRAJoDbndqBT7Iz9bOkrasdK2riDAPoRHoN4/kyCHPtRjjfo5kpKgCQdVXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109759; c=relaxed/simple;
	bh=RbnNXqqnHRQty5lgihCl7aAK8zsm6/eeHNN3+SXXnnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWt7eA/lLKYoi7A5BxW+F2Z/BKj0IW6O9Z6aUyCpvYPYjt9PsSMUAj5P28gFrJ7aqtSIsnfjUJQQBYFSPSEF5CMYN+uUJJykEGSjeqP4ZET8m4In604O90cqJWSeQdOQZ6DflRboHaevA71b0dO37ArBx0MILIwgMg7ISp+ILrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtfecnF7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D60oRpno; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136DS512848579
	for <linux-media@vger.kernel.org>; Tue, 3 Feb 2026 09:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	128vGHTQSDAOeGqPmCzaWsYzKlabB8tkqK5y6Wcp4Nw=; b=XtfecnF7b6lSPT1m
	Al4z+2S+cRWod1cTVYfLGdrIi3mjdNBnLxfJhRTY7xyoog38AUtwFfVCS4lTvzNQ
	v1Vxn9XbKF+jjOIBgGfoP4q/v8egm+tBWW+5cEPi6qexdpYczhnudkmF1NMH1Wyv
	WeejUw431yxYLAL3wPOCSPD0qForMCau2vwDCx4Y9XB3jJ7jXqmvFU8SSYwnwOQi
	5xCX5eDmgXk5EDhFoKVgVm4+knF4DfFdafZsSGEf93M9iAipt2QLnRDmw7+rq0ea
	KUmIYp5BBiiJs2zhwnjrq5DH7glBfj5zfCWiFNWoQFT+PKx5RT9GH52TAYjVSiiA
	sfJezQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tqtkrnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 09:09:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-890072346c2so11800316d6.3
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 01:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109756; x=1770714556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=128vGHTQSDAOeGqPmCzaWsYzKlabB8tkqK5y6Wcp4Nw=;
        b=D60oRpnoBnIAqHRvuEKuscbO1993nORDKwbF1EDYFrEJq2dcBkqEIKsWX3J+rhV39Q
         AWg75JrSKcOtxdsGn4I+2ZaZ26bMENP1IF2qqAwejYSEnj3py7cqr2ra8wxm2qZ7IL4X
         m4NqcrG7b3XAeTBxQVMGKEy6S1iqADe0T9T8XE6Ecp5bZo+PJv00Tun4sbj31FPfRDqZ
         NmqrMs1bUmHUl3s1O4PwhubiX6/LlEsIiCR7/OxGovpFXM7ZUharwBcFdH1kZMNZ10FI
         eNBtwXtUKE2HAp7WTDQxdzMQhpkGa64UPoSKLO3CYm5adtZ2ZWcR4R6j9T2DZCuhYEKw
         jZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109756; x=1770714556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=128vGHTQSDAOeGqPmCzaWsYzKlabB8tkqK5y6Wcp4Nw=;
        b=EZ2JmUMaTuXuzpL5X5AGmxtCn9ar9Gdg1CZTouZu7zZ7qn/jFFkKPyS+VoU03GSv3L
         phanfPWcZSz4u6suSAkbG9yqTuaJpRdIslrtDwHyR9IhZ+zCZ4TQwqE2/09VHLMrkq4I
         Lv+ovOSIrQiOy4g//fpE9Zaatm8vgmQdPBgP0J1LYemHCTW50ygIhtN3wO+1V3C3uUUN
         E92vz7G+CZEtKM/FppR+FcKpgkWGlUaaRunoiTNm56CppTRvZnux+Tc+QsCjWK1Thuh6
         9heWM8zbm+jI4QOEBm3SBBMB60oEtKQyAikkauj+15Ny3Eo8BXPS6Cg1bfY3e53Ov4S1
         xkUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU23bWpGAJOoGDjTPofRUwz4w4YZ1UvXVVi18ExrHpfrGbiGlbHAfBWa2RYBKg51gVMvqTaSiQfgYBkbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDPfMrxuKdcn+qGeYirziagik7mem9oXiFkut+1OMVtGjf9MlE
	0goNu59G7Wdrjo1OYRW5+yLQ3PtPA83KHSTO5SY91nqCcoVmUvqgzJ7w0zDWqI7CbXhlMHUj+Wz
	0skzs2P0W/+TG4AT1fELCFl0CjFvOa4oE1OxDhDP8jdHxuoYWixVIo6UvwPK0Pm9bEw==
X-Gm-Gg: AZuq6aKQMKutcfiemydalTXPOjcC68NK9B34l8t2uaUUZqlDsFod5VoGZkpznf4qr3j
	qJ+kuAMylOBcM2zsoFnQHuOUB1Nl2GzP1en9Mi9AgOpI8W/OPrA8ZW2xXAycimxyrhpP1j8gtbJ
	+l6mBJXNiqQy3Q08RYut0Q9AyOkml+zbqDRjEZvHQCJ5QLE9/z6SSOcifcfEV7mR76D4WGB5FJC
	two4ZGyQDGu9RZE1RVymJtij6QseO+fpiXJyY9RE/kUW1VCstqOugslDOTkpCsZZBnnfUgWOBV7
	HO3q2bPD2jvXrfnEZsYSz0FJ5i9X+juy0MtMQuaAjhs9bi7FvhkVM5Tp5jEeaVwBtprN603BeGI
	AOExB8bPEnVp/eOjhqkqgqp3Mh4KLsoIUgKIhRkwk0z0eiMAKkzAbGN0Z1XWcyjKa0B4=
X-Received: by 2002:a05:6214:808f:b0:894:e24e:5b8c with SMTP id 6a1803df08f44-894ea02a720mr145594296d6.3.1770109756603;
        Tue, 03 Feb 2026 01:09:16 -0800 (PST)
X-Received: by 2002:a05:6214:808f:b0:894:e24e:5b8c with SMTP id 6a1803df08f44-894ea02a720mr145593966d6.3.1770109756225;
        Tue, 03 Feb 2026 01:09:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691d0asm9195354a12.18.2026.02.03.01.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:09:15 -0800 (PST)
Message-ID: <6bce3bc1-6833-4701-b8d9-7205cb769a4f@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:09:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sort out Iris power domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XP89iAhE c=1 sm=1 tr=0 ts=6981bb3d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K8E2y3tpqAm5I2OsxKoA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: vsdob7hvVlPz7O_eZ5WfoVwUraQox3IG
X-Proofpoint-ORIG-GUID: vsdob7hvVlPz7O_eZ5WfoVwUraQox3IG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MiBTYWx0ZWRfX3ZR1URwc9v5R
 ftRhNS7sh+MWBTyv9IdRGyuloCrJ1IZ39G4OotflH7vc0UTqAuB7mOj07ODVCsk8bV5JrHIrvSw
 ginpi4EFpiQOil4f7NymTgLFPtmcqWPohvNAVhcICeYd+Gj+P0wf0H4vG6q9j/z0xCz12EdFCs1
 3ALbePJXVyqWFV1I0YNJTX+q9S3rJVtXlHwsikndDfN+0kUol3+CQovKHSkCOSnnqns5jYgAQYz
 zS0fqBfeNvVz0/ymAtBbdEzYiu6mvaxLXXU4OE0uVxUfLoI+epyohqMa9ztccB7GFVvMpGvdHr9
 /Tw4H7/cVrAZpQ5HmsYqm8lbZbmfsgj8DsRppwfJLrunxMURRKCxqNA4ZX2cPxTq/3UK2k6iHuZ
 xU5G49kGxqF6y3tZiIWiTvi/cg8lVD3ihShINmoqvv00NHfW8+nE6CGAemgpQ2FHAdbsoMZTb8Y
 OOEPhq+gA7tkJVIlByw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030072
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
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52093-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5324D6A4A
X-Rspamd-Action: no action

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but,
> strangely enough, using MMCX voltage levels.
> 
> Add MMCX domain together with the (more correct) MX OPP levels.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I noticed that the subject lacks an '8250'

Konrad

