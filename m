Return-Path: <linux-media+bounces-48313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB156CA70F3
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 11:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39AA6319CAD4
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 09:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA422877D4;
	Fri,  5 Dec 2025 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISx7Fw35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ljm0A5L6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80FD3081D1
	for <linux-media@vger.kernel.org>; Fri,  5 Dec 2025 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928761; cv=none; b=VzPDUM/rHAyEthd/mSZjtpnDhkzWWvVmg5ob2yS6B17qjSv4SAR1faOpj0erf2i6ZB4Ee4wWkdtQNVAGnCIbdtiqLu2kbtqerVH9IQEpXYqtH0lsqTTz+lEubvPONjVzDRqbw51kUXnfm/pkPNb48AkQoRBEx15wDRFrzQ6m9xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928761; c=relaxed/simple;
	bh=7bfq2TSle3k0LnaRhJTXusG/gbDjmiprkSipMvwpQ3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4PcFpYv8Lrwno4yDjBzWvSmcy3ygaFD0MPcHn0zRCF9bGuR5CI5udjathBIMapjNWuKUSvQWR20rMCfd8osnP0GfdvwdKwLNddudD0dIZ4t+7mQYQgOfKGTjxjlNfqBCiQ5B7LUIqo40SK0Sn0LHGXTaRm0fR4u2Dj2hfxoMVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ISx7Fw35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ljm0A5L6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B55DI7f1917643
	for <linux-media@vger.kernel.org>; Fri, 5 Dec 2025 09:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfjkxvihORQQ98r2FuMz6ihB2BvCC0Y9UxySzLl6k1A=; b=ISx7Fw35AsW4SF00
	kubrP+m3LnxDLNrzhLIFw/L7edyoRLeO/6Hfx3T3nuVZhEWBPMDcDzWpAk5LADTk
	1GfS1gSzDEuscOvsh3d5mL33meRRtAM0wyFV6jUp0CpL4Tk8CV4WrgqgGWor/4j6
	x/jo+AuJC+QMFzSb6+nPmJon8qGcs1BhlelTi9U4s457aSNEA7K8RBtzSC31577i
	CSsGhxuzeTbVFkFjGFAM6ob6vz01k3pPWDEpGpvd3lCH/5Xdg8PzKOPYQi03KFMK
	EJoRIDdB7mH7HCiyhfgF5iZI5zYwn9gEnlsOEEDL8BVoHYPueQUHdobUkfDePxH8
	9gKTvw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auec1tf94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 09:59:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88820c4d03aso5211706d6.2
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 01:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764928749; x=1765533549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfjkxvihORQQ98r2FuMz6ihB2BvCC0Y9UxySzLl6k1A=;
        b=Ljm0A5L6SlxgXyywoka5lIhGv9IL5yjIVPibZkAvyTAaayozev0YjB5DUvjaEok3UE
         zVaX0+irx9ZaF02/5TtVgjzAA+dIs7imkZw0X/6o0CSv3g6XHRx0vTo/SSWFxROUO/8I
         08RG/+QWhnVr9SYqiJ+23TfO97tmFMNKIWUXiz8lRGlSYvbkBfmnKaTDN5ZIgrZTRene
         q1eROqFAjx90AC8AGP6soc24njNuaX8RjmAiGoiuGBRd/UZPSzbyrRQTEPbjkv2s5Hep
         sJQ3hpPqlxRjeFjfEP1JM4OwAky6eSxxLM6tyNV30zIfPKFkMe/dghQKbWzvgc1kPbRg
         G0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764928749; x=1765533549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfjkxvihORQQ98r2FuMz6ihB2BvCC0Y9UxySzLl6k1A=;
        b=oUmAGZhOJ2rUb6Baa8IlGtkERdLLwBu9Rko3PKNwFC29Qpcdir++gO/2DNhrk+KMhy
         heM9vHk1IYXTreqF8ds0FFJcZ71gAYRQCtlUe/n90QJMM3YxMOIKC7AIXZIuISTkcHuT
         LoLvd51MKihskB+ysdDxTdTofMBqbMxCtCZKkpbzutARF3w3oLTT07us58U5wSI6NyP2
         V1Nh1BwwxKxDbvpF53Cwcmd1NM2fdB9ASyfowWy2f4O6BXKqG1BAp6rEnE32YSMa6XUE
         5EFgjrZYgJcyVjI+64eTEWJKrECkMDwePcmaydwopxibM0yPOLcLswUcRk3+9pXYXy1I
         JZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmqxYTsJ8d86JSZdnbEn9s3dFDpVyiMyJ+qjMRDI4jy9LSz6G2Vbnkk9xBGFhXXwzhbOjX+q5Sp1KNMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE01YX7yG8ZYLNYnxPV6uGvPGvTCoOwIWw5ZuADsdi8PATOqZ5
	/cx/ojaQRzDDWj/WVlTx81d8H+R1iuXpc03E0TzLC8C9po/qVxegQY0Kw15SCuVNujAzLWlHF0w
	axPLJKewdhRLGG3wFIb07xDFEwjk/pKbOXj2H3Q5S3QuQy07ZXpTmxWff3zMYV7sht7Pq5XYMAQ
	==
X-Gm-Gg: ASbGncst5zcNule3Exc0SJqjdcNJkbbf5FGAyJ/zthDMzTnEW2Ky2zl+f5eeDdDllCn
	t1ucE5mcGwGrn7U1t63IGN2a+UzldNhm3Gp5ESWQSOOVjnkkXVVMBpD1s/3Y3hJont/7LKs1oBb
	Gabo2lGkM9oxVWDe+DnX5d4KTkWHSFkd7EhXryt2T1eYIVWx237/WKKqFS2nISvXCrZ1R/s1iOp
	fQzsvYw2Y3lkKDhm04ExHAUf3wf7FDjmijFtwxRa/vIn/qSC00ZlaC8tgEbNyRr5X4XpLYnKh/+
	F3ReWpO8wLQA6iVVNxMxoTy0GpX7tGQ5VPRYaSvEE3Ax5SFu0ipCiukl4kiUn7o/gikM15gaQ9W
	rCLbMCJZvGWWYINvrkS2+31XDtxEsfie8myV2n0mZu19v5lS8Kj5NUE6G69XU59q6gw==
X-Received: by 2002:a05:620a:269b:b0:89d:4a69:1502 with SMTP id af79cd13be357-8b5f8c0c5d9mr868902885a.3.1764928749450;
        Fri, 05 Dec 2025 01:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpspM+ICmsmP9vWvYbDUrEEZofcGz0pLj1H9yb6JeVlYBv+ycT9u3vhjBrWF01Uj3As0jMDA==
X-Received: by 2002:a05:620a:269b:b0:89d:4a69:1502 with SMTP id af79cd13be357-8b5f8c0c5d9mr868900785a.3.1764928749071;
        Fri, 05 Dec 2025 01:59:09 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49772c6sm333401766b.44.2025.12.05.01.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 01:59:08 -0800 (PST)
Message-ID: <f556c32d-acae-498f-8abe-d79e99bb0d9b@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 10:59:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 6/8] media: qcom: camss: csiphy-3ph: Add Gen2
 v1.2.1 MIPI CSI-2 C-PHY init
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-6-6b35ef8b071e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-qcom-cphy-v2-6-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HeAZjyE8 c=1 sm=1 tr=0 ts=6932acee cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=ZFB94F4s4OxtCDoo8YAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3MiBTYWx0ZWRfXxJDWYi4neGPw
 mLTsUMeuetnV58c1I48MkDrYQd8mV4JhMWeOrG/KSnUjSErRiNcRM1cqaYvfnBqAJC1f3BjNrTf
 OzDqLIoX3Yfd+xaH7+MqvpozVrbEswUu5u4dM7PgejDOdAceCMCh31Xq7QGrXreMn/z0pXY0kCd
 d/SqB8/qZ46/wi1GIKxQ6E5d+VBwaF9X3R7am8sllsmp+OmQgRKyY1FyMOoLrzlx1VFPnnJB6Tg
 aOz84Ary8Fei5IHMzyo3zjd2OPr4Ft2VpsQM9rUoMbrUYv/7KlwFDF+wWFoYQqNILy27KoWj82T
 LeyYw06nKQxzY5m7mNi1kwxGLQdHNcO7yDCsY9GEJ3a4avNvimW7ASs1XxlwJEI3/CPf4+tswaS
 9YbW1dNNrim509F8xkeOq2m1Ae/Ipg==
X-Proofpoint-ORIG-GUID: 1sQYoqRL56BkFEcyy4nV8RAtHlRL4OgK
X-Proofpoint-GUID: 1sQYoqRL56BkFEcyy4nV8RAtHlRL4OgK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050072

On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a PHY configuration sequence for the sm8250 which uses a Qualcomm
> Gen 2 version 1.2.1 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports three-phase C-PHY mode.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Matches what I can find 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

