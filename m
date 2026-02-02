Return-Path: <linux-media+bounces-51981-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M1mKJN3gGne8gIAu9opvQ
	(envelope-from <linux-media+bounces-51981-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:08:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBFECA90B
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 005C23028100
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52742E54CC;
	Mon,  2 Feb 2026 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G93WKS+A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RelfcC7/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C87F2E6CAA
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026559; cv=none; b=hmHu/GPV5ccB4KryVEQ8kHeC0puAkI1Bg9JGxDWH6KE8hIE9CR8CYPw3oadvG/Zk9MHt6stUwIVMTgfe40kyx1sFpAMiBpRXfNb1KS+p3yp8C7xd7ZYzxQbdR6R+Y8fZjv9LjaJeFrZ6FcY3Fm9XrU9McmbgxMH37ZRjdqauzPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026559; c=relaxed/simple;
	bh=JDSeexC0+JEFNCPV/nFoAtVuXSlVMpI6OdGFK/M9k6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJRgDt/k/tFKzw9h/dyEhHc9XscHymCSFn8VhDVfN0IscX4XCi9GRdN2g0PB2JbSezDYzjANJdH6vl+mZhi5moSOaKp8dUw5gEfXVEcg9W9MwVcIvaTfZCI1QzvGEH7oLRI+uHNf5dZHJgUs1EXTfBdRVDTdIRtfwc8xNs46SMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G93WKS+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RelfcC7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127fgFJ1189735
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 10:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCAadpfJgT9dXEEIgywaUL4bC6A8NzSXrVe0HfftFtA=; b=G93WKS+AhHzdPX1h
	z3wSHCpza4u4nh5QC9t9MYGDXmNpzeM5weAn/OFUK4H3V5tY+YemhR/u+yxEJB+3
	AE5hc8QSiJLHu1T8Augtvt6kAnkBkN1F3WafhhJ0W1JSpNCshs2ifiIqROdeci+w
	ut8N75TQ0zvBDOB5q3PPZjuklNMW7hamV8FwNslmuDEfyNuC/llZn7GzE2j4ng15
	1HOit32Mf7BW8eSE+CnN0DXFCCAru4qeZJsVjABhvciolM9sGVZWeww1CVNOM5hy
	QL03uzyZC02tDlaehPzUkNEyZau+vAk0ypLGgno1aIMvrIagwPgA8zmfLWGXUl9Z
	mQb2YQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnw15u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 10:02:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2fdf3a190so30285185a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 02:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026555; x=1770631355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCAadpfJgT9dXEEIgywaUL4bC6A8NzSXrVe0HfftFtA=;
        b=RelfcC7/uNfcNbB0mQGG/KoTcKCOpdbUfFtSlkMlqDIBV4VHqt5R4lmpttq8PNz9P1
         T3WIPDeRhLnUvuZ22W4qa6GqbZ0rUbDJMXs1cwDQ/sBiP1b+BcSJ3J7+8stwR55F9FD5
         y8Ekt1UNyDx36CglR5TOyClUJu5XJ6CYry0FMzk5RamkBvrLYtW0FkDHQeP8ugX0/hJB
         8T8UtRBkj2C25Bkv+V4/ICxBpeT76JC+YPB+C4BMH0hwKir7S/+izgnH9cLp4uAf4TVY
         mokOAjLpr7J7Aepln3wl76zrCLlEeXk9qjLicuqH86ZeJ1m9RZEa8PqhjFV8XpXNAUNr
         f1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026555; x=1770631355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCAadpfJgT9dXEEIgywaUL4bC6A8NzSXrVe0HfftFtA=;
        b=buOAiGlMUbVRn8HNkENF8Ln9HQBNXIRkJUpVxRDVBfMI6KM2I0xQEiZTNhWp2IDvDD
         Q+gkd5waOzzhR/kDbC+9dUPyDdQpvoRFecm6YE8tThBDXbf3gijcSOmBj90Iw5KQ73aE
         dhXrM59A4W4Th9Hfnaz4lKLWV1STsWrtKTo+7O6MosiDHpA09PFDGTsIe/i2VV3Em8Pw
         1m7O1EdlzbYyJ1P0a16dLxlQlQcNThvFYG/HRjwMhzivat+UfRyALHufl6E1Wmye1Mrd
         rqKPN50P9lSDJsMt0nopXeHjES0vH2IWufh4tc1ARHvpkePZ3SV4FMogwWS0hmEnYIme
         oStA==
X-Forwarded-Encrypted: i=1; AJvYcCUVCNV4Gdd0cdCOC6XsWZsod07b2Wv3J3puCjKikbrhBw9UFFbJ63H7vWGIMCGMWtbTEvOsKl4WLW7ZDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxI6yhdIXIra/upT+r7OKUjdCcspSHGp6FCZGxs654iUqCAxmy
	8b6Q8cvi2XIabXAx33qShml6HD2wmu8JKw/Ui3tBGX8r/mWznUo+pe+uc0SIGxqTNf4NaxvvDU+
	iRkjUQIfMuRFTzovXxYdX4zSV27DZMqyWT/yL4cFykwOu6+WSs9IslN8kGgBTGzfcOg==
X-Gm-Gg: AZuq6aJ7egMoNw006Kif80wb5GXVwa/oldSINdxyMFe4m+p9buRcav/PMeO3HMAwQeL
	pUt1G/iECavvO452R+qK5cg2wXIoNf/qIOCgiKArxoJxX6Vqs2BNeEh6215V00xzJzieQg8uxGh
	TeraF16SIfyHqwxR+2KXjE0KeTR0ixc3lieazf2sNSV2vOIxyDiNk2JMV+CCvDTPnMtILiH/DyN
	fRj3AM+G0C5DT9noDQpVLTRNsriGrNGjMKn73/xE9LYfLU7XShueV/EWim6C1IcnpxxuujGC8dG
	wgIpttfXOHNxH6MNJY4D55p3OCPyD10x9z5j5z1rJ3VUMitQ0rMOFtDbO1DBue7zkOBx44FR0Nz
	jcKx5GKS8YoXIsMEKJT9fg6QoPI3MVGNRIIfFdxdjRNSOYdxDHLvLy1RpbsFuhwfUzyk=
X-Received: by 2002:a05:620a:4009:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c9eb10f0a2mr1033783685a.0.1770026555507;
        Mon, 02 Feb 2026 02:02:35 -0800 (PST)
X-Received: by 2002:a05:620a:4009:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c9eb10f0a2mr1033779985a.0.1770026555002;
        Mon, 02 Feb 2026 02:02:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c500bsm837501866b.54.2026.02.02.02.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:02:34 -0800 (PST)
Message-ID: <231ae9c2-bb3b-430c-990c-deab6a8a0d0b@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:02:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: venus: scale MMCX power domain on SM8250
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
 <20260201-iris-venus-fix-sm8250-v2-5-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-5-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=6980763c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=v07b0KzaqYqj_yNn1HoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ZJomSc9G5q-3IWuoki2fnTMZgyGnmdkn
X-Proofpoint-ORIG-GUID: ZJomSc9G5q-3IWuoki2fnTMZgyGnmdkn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfX5XcIUNM9b1o4
 dmznMnA/7uYm2AgJuVEdiqa2EH1sexLnRhyLJHcXyMKfogJneae4vPbcPSiZglnr1KJnC75ITsG
 uDT7v746Gze38o+P8QlNJ94HSZXthCB0OcGjjRSnnO0YbNqAN5BbiRe642gg5Km0/Sb4chkOYmY
 FhGerzoT7V0XjkhhxxiPtKjuhMMy2LiBMZevfK6i23Y8IVvHUW8gfakjcfKKTl6Kh1TkH5Dh8Uz
 5eVl4rWlG1Qx5yIGHEGaqTWCpNHLTlhIYOIajqLbqVVe4aCRf6MbqNBZpN+sjoSlrQMyYEM08Vq
 UdLHP7jK7ykwVWHgYYeZSOqjPyhH7wonoxSnxeoUntpgi1+rrl9tzOhXRMmDkEvR6P+T0gXthjv
 swe8EB5ewKpvg4sLx1MQK7GYUKrxWOW0/pCMubJInrsw0Hf14eSMyElI11ErPeoQutapyj2IJDB
 Pve8dQXzq1t8YSP8AmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51981-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CBFECA90B
X-Rspamd-Action: no action

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> On SM8250 most of the video clocks are powered by the MMCX domain, while
> the PLL it powered on by the MX domain. Extend the driver to support
> scaling both power domains, while keeping compatibitility with the
> existing DTs, which define only the MX domain.
> 
> Fixes: 0aeabfa29a9c ("media: venus: core: add sm8250 DT compatible and resource data")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> @@ -904,6 +904,12 @@ static int vcodec_domains_get(struct venus_core *core)
>  
>  	/* Attach the power domain for setting performance state */
>  	ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
> +	/* backwards compatibility for incomplete ABI SM8250 */

"eeeh", I'd rather error out since it can't guarantee to have its
power fully on

Konrad

> +	if (ret == -ENODEV &&
> +	    of_device_is_compatible(dev->of_node, "qcom,sm8250-venus")) {
> +		opp_pd_data.num_pd_names--;
> +		ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
> +	}
>  	if (ret < 0)
>  		return ret;
>  
> 

