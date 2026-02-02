Return-Path: <linux-media+bounces-51959-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DoNCVxGgGkE5gIAu9opvQ
	(envelope-from <linux-media+bounces-51959-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 07:38:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90596C8DB0
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 07:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41115303432D
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 06:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA54F3033CF;
	Mon,  2 Feb 2026 06:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6qoVYRg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGYfv6WL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0A527B33B
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 06:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770013842; cv=none; b=r58m+LgpR3eghoZDuv1FqbLLHvAyk1zXgpNK7lFFeP62cg9KKHYMG2CdKnqHy+CwnMoRCfV2wSS7p/qcQjSeg8TdbyOdxNFDykHBL0JCeHCHnCQqy1NFleCEeFCk++dQ95s2XsCNb8PCpSVVD55K3xiGTEJSLjdKM+dwwU1P3r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770013842; c=relaxed/simple;
	bh=a0QfRDYdqoZW1cCRKs/5tdMZEf909uEpljaG65C/KuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4yXukZXYPzJPiB4mie8TVIDJcWeUi6Jxo9PEFDkG0qYOY0Ww/UH2KBHZ0k34hsSHI8rubSSLky1PALvVW637fmL9vvRIj6XmOSVQXI0phs+DzogPqLUPhHtB8QMs5MjIG912R42ViGtUKzVn/EiHcP9o1saOCWSJXo1gfB+T8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6qoVYRg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGYfv6WL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NHISU744938
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 06:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d7uurbaHlCXRf2rgol8G4wd6M5ObAVafkPY/8udIrrk=; b=O6qoVYRgPq1Pbddr
	eLNEMEeZs6ku2hG7L7wGJNagyqgZhe72HyMRlz5t8fqt03U+03qINtwN5nM4hgJS
	+c0FFSn9JTJqejdiDC39Br1ILRPt08CoBxHXlvG8mK8RCc5zyPTcixhyqskDIYqW
	xdXZZwJBHtVPdG6jtTib4DJbYqd0peN4lgtMPUcR7Ex1zByxi9P8PQ6ArCuqv1Or
	DRsAMAhYpXQquqjYxN83P9ikitNJ+Wf3YcPqqmuXD9U6JZAt2uMM8ppTwkaWCkPW
	fPblMauT6lgP8yh9KWWfltmU+iZBLds7PhiF6u9KwD8EWPIp5+dU1YCYjIl0DmmI
	7Y8pEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx45k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 06:30:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a377e15716so112146925ad.3
        for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 22:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770013839; x=1770618639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d7uurbaHlCXRf2rgol8G4wd6M5ObAVafkPY/8udIrrk=;
        b=XGYfv6WLYLI3J1viZErxM6UJp3z8r4JhyaRCfOwKdSPho5eV5MwcfAP6FOqM/SaOI7
         xHDbXeTrlajQoI6/1O74ClEmR7XirU7Wy2M/gbYG2cYvc/Jo4KeM2k5kxhWpPwjcSI8U
         +1MNm4SkoHaGBJvTf8e5YfuQGSdiR1WlyKloHP6lPWiIHowSeOM+FFZYR3JP8bKyAsI6
         TKA4StZGcY4npuQ0DGp2oTW3z32GYO1u6X9+0m5KKC1zYzPcrho/DXNiY3cdSamdiqFS
         5Y50pAJD0jMNN7mpBr1Zte9XO++MxXT5GpSyP4TBnel2SDmYOHIQWyrgVBcJv+Pm/Fyf
         Zuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013839; x=1770618639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7uurbaHlCXRf2rgol8G4wd6M5ObAVafkPY/8udIrrk=;
        b=OfaUFnuLRe3x8gOHsXuc2XeV8LHSqexoOrKSvcysSMAGCsQteXJAzrkzJlMOT9ghQJ
         34sr3ac2OuRNMM6PMvsexuAr06gPXGtTjqer/WzJ7eQsfraChv2cY4hd0a3C5WXsJh7s
         RZRyMKnwVSlHQCk6F5U0pxv2cs1bbT7eGiJL+3shYxnPAyl2Wu/FcmAXFzj1oreIi+vr
         7+NN9HpbEVi5TRA12WmrJtwzIs7IesdLvIAF9diwiIWeuFHHv5E4i+5/G+w7uL6LWRyu
         wnKsebkPth4zJnCp1qdjMIzgjZkdjuvNxm/8jZ7i4GqylLmoffIxDnuX5CBQMN9EYrsw
         YPPw==
X-Gm-Message-State: AOJu0YywQPV46s4idu1euUx91QbcwPdTCfMVoba8NKFx2qrlDmf3Kthm
	/jRZ8S5syWLk3GGRuX895qI0FCiBYRGKC8/db1ek/3xBstUez8VIJ3y6vdVYE2FXNKif0GCbyR3
	mhZBKhd/oOmjZ6YcRiu7Z/Xks8QSqcmM2UYMbXsJNl2TNWeSZe90PXzlU0EfmikdxOw==
X-Gm-Gg: AZuq6aKEA2d9EW39qcxO7mk5Q1utMIxCPgx6NdoXxXyryhdtWPu+XCOLsVcva0bbbRs
	XSkjxA73NZ9mmM6+3GzUEvlG0gph7E/qOF5ShaKV9VHuJbwJiOw76xXbMKhcziGt7YeaK7EFQS9
	PN5kYRtlPZ3xyNENfiPHQ+XX9rOCtQHO+OsW47uVmg3sgB2j7Wyzf30utPkb48j5PzSk8M1WqxB
	ihW8E+kEaVauqoxWawy6pxLS6kHnlWs0HwGWSzZrOr4O7G1R0bzMEwMOinG6c3DT5Qig5I0Q7in
	dlJ3B/xLpTt/9XNEuEfUAebIh9eFfo5v1D1yvZX7C6z3Wijqx4PS52z1DbtDKnl6ZZhGBGALl8U
	vF7/sRsJR3Idu9if6oOz+4tW3nyKB0Sg5qYMMrjgpjg==
X-Received: by 2002:a17:903:f8d:b0:2a3:1b33:ae11 with SMTP id d9443c01a7336-2a8d9949210mr115215295ad.53.1770013838911;
        Sun, 01 Feb 2026 22:30:38 -0800 (PST)
X-Received: by 2002:a17:903:f8d:b0:2a3:1b33:ae11 with SMTP id d9443c01a7336-2a8d9949210mr115214705ad.53.1770013838090;
        Sun, 01 Feb 2026 22:30:38 -0800 (PST)
Received: from [10.204.100.98] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d2bsm143075415ad.53.2026.02.01.22.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 22:30:36 -0800 (PST)
Message-ID: <f8179247-80ed-4bf0-85d8-53441f0d9311@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 12:00:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] media: qcom: flip the switch between Venus and
 Iris drivers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MFRvj16YHUcebp7_ocO_uLa6fdJRaNT_
X-Proofpoint-GUID: MFRvj16YHUcebp7_ocO_uLa6fdJRaNT_
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=6980448f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=DgmlmlulvBJC0Q8_JD4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1MyBTYWx0ZWRfX2A6fP11NGzkq
 oqa3uj8RMT4dvESgVWLJ+I8M8jDMUxP+GQUZbdHjRNA6uzGp1dCJJWO6OZ0Bq0KDbxHWuyKI8II
 NNrOlCg55IJOFjK/DAsYHwTdlnSxBFYX6c8SU7loiBFIeg3iSuF5c409NpLCxtXPATa+ubLHaCT
 A6c0vqg7fn4yBVWr2Si9XEwSDFDdsnd2YX7ePvpqS0VJ1rJq4ET9uKFauPqiUEkQBBWkuB3exDG
 pAiiDkc/m61io9Hj+VFLRFUzX3mO7L6V/I8X95fd0XQNStgFS4b9XvA5aJl4hWMnjCdqt7z0jy9
 R/QaDUip28bjkDJcsz319TqL0hnSr08sCiTLMTqVeFnolOlH1MVgkI/h7nF2d4xAzF4wJi+QIY7
 q/uXzbNQNlSfjTwP+75MUjhDMse/6bSgMzyzry+D+JdpXByGKRmFozAYx0HMHjbU+ws3g39kfgB
 ER8FpCty45kYRjpA6LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-51959-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90596C8DB0
X-Rspamd-Action: no action


On 1/31/2026 7:28 PM, Dmitry Baryshkov wrote:
> As the Venus and Iris drivers are close to the "feature parity" for the
> common platforms (SC7280, SM8250), in order to get more attention to
> squashing bugs from the Iris driver, flip the switch and default to the
> Iris driver if both are enabled. The Iris driver has several
> regressions, but hopefully they can be fixed through the development
> cycle by the respective team. Also it is better to fail the test than
> crash the device (which Venus driver does a lot).
> 
> Note: then intention is to land this in 6.21, which might let us to
> drop those platforms from the Venus driver in 6.22+.
> 
> Testing methodology: fluster test-suite, single-threaded mode, SM8250
> device (RB5).

Fluster results for SC7280 is regressing, which we were discussing in 
earlier version of this series, need to be fixed. All tests were failing 
but one for h265 decode.

Regards,
Vikash


