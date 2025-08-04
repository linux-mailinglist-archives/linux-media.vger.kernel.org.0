Return-Path: <linux-media+bounces-38853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 069F1B1A2F9
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 15:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C41751655C3
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 13:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E7E253F3A;
	Mon,  4 Aug 2025 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSBcPGe3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E322A25EFBD
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 13:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754313265; cv=none; b=HxfecM598goIpolmHrUi2oQpyplCF9fdCAh3AbUrVuKyfDT15u8ktnj4pH8cqYk6hIy8rHHTlbNKWf705mnfbRMiDXwe6JHbtISM+ajkGbj597aHBTta2qLiurlj+aHaxfgyOxmtd3b5Iga8ZcMXFJVlqnzp6q2Jx7nqp/NcSHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754313265; c=relaxed/simple;
	bh=nitCmAavgS3eup+SMOcSyyiqncdlMa5i+nammlA7TIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dM2D9SLDxhyKwPgeDmi4O92KYAZoyGwP93hzqzW4s4zd0coctacQQiiyMnpTE4bizrgIyQVTpEaT292ufmbWYYIYUNjjkTKeRhzgY7VDKjXicvZw6sotJ/PiCICVavdYKMwxUHwsHHZekoaXX8zrzC8EtWaxIhXv0e27wtSgKDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSBcPGe3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574981Ua012229
	for <linux-media@vger.kernel.org>; Mon, 4 Aug 2025 13:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iuqkYJEHU46HSu5bF/1m8NgiJsyaKNVDD5t0GtyZPKU=; b=dSBcPGe34hwe5cmj
	mNB3LlId72lzaYJtZSgzsodfASxhHgARWwRu90eZ1psCB2Cxis7dqc4ti5c19Bwh
	fS5Ol7nj6L/cPPs+hAdS0M3wuTukXxrxLvwdKWUhaKLuSfgzj/9XQ0ZXkaQ7CE+y
	TxJAZGADC6zvrzGWl+9zyEvsArtjZgCVl9c1z7tUMCfR/KC4VbZaNny4SVONspCj
	GO3WIoaOu0tLyRvMmtdxBoK0Fl1HxZkP8D7KTxc3htCsBBT2kevwoVjKQswWu9pO
	2Xjn7p/TxO3v+qi6ZnXmUO8ed/yL0nckSKO0rKjMumMPR60y7lltL86OcGSro+2d
	1BbibA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48981rnb26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 13:14:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e7f74bb018so16632485a.0
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 06:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754313262; x=1754918062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuqkYJEHU46HSu5bF/1m8NgiJsyaKNVDD5t0GtyZPKU=;
        b=AKbAT5rG1mL/YHLbMr5XJiWXIrmy2VGRGJtHSTgFRM6RzyyNoTfsVU4qYsBxuvWrBI
         GTrOjcrAbn4ePZunLWDBCZSdazbGg0EOvD2IPFJGlPBr0mZi9Gm4whUAUBWSCVb7bqzc
         oXQ4YJ+aaK30/psaAPRvTaBusxR0H/AB3icBqptvth4dXxtLsGXHNgsAVF5IO7N+e/cG
         mCBJZs9k8tbKF4RAu6TKAV0yaC8gQeLtwxIdByo6IcNbrBDWjoJl5jHY8o+/XQOFnLnV
         aL9fRYEORUdcUQDNyGxp5Cp60FgIFmvvvPzFr6nOJghg4iH5V+mSB5ZNX0RHLCP6qkCM
         dtJg==
X-Forwarded-Encrypted: i=1; AJvYcCUNGLDJ0j7DGMyFQK6lBRQBQ6+bMAaQuIxOKS/kq4arGRbAo2l93J8DeuWv6snxMF+14v9OJoQKV4bd5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3NrnVPf5sCKgOxZepii9foVHJNYWDI1nKb2dbNZIwaL77hYd
	lJsfcYrJ1bpJBgiH7mYL0Fvfor207isBAXYQV/1HMbW7/NYh7kHzRbv0mGWOLbmzFtwnOrSMQTT
	+Cm+NlP3zoF2efUt6fR/+22Q42oxgHgL1muvjBTzsiXE3qrHrRdhcMMaPpYm4sirdeg==
X-Gm-Gg: ASbGncvNwUbOkXrVtt4mfzKX0d1RbXcoE5fpj6xts/+hFwa75qVnLJ1tfw8EDFgqX4i
	y8b/tgazA4+17hFOigv6+cUKq1BN/EvgGd3hzrPssUNPv70j2Njkeqeh8QWXV/CgDMF3UDGMHcJ
	YrrW6+6OMZUvSKUZgbKHCPoTyekDqJjwovdFwmjmvImIWmyjk1bQMP6ID2h6Vud0zKfNoPJaJje
	GvmX2sJqKligjLGyzfjV6zGzEdH4dPwsQLl6/qfRqFxf3svoZ6vTpJRyeBqAJijEb4433bgo04L
	oupNdkXtCEBPsXngUWVvI/0SN80VLOAzIDXyT6fxh4x9t+bJdl1FjINhRKSnntJKoV+tL4EjKdk
	XfpnSqAoUNQWuhRAvgg==
X-Received: by 2002:a05:620a:40c6:b0:7e8:5bb:b393 with SMTP id af79cd13be357-7e805bbb656mr127003585a.4.1754313261967;
        Mon, 04 Aug 2025 06:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQKfXoAA4iQAVx7vrakGz5rhAfhLmMpyLiivrawj8ql8YqoebUHyRY/Z++bxkV80jn4cAicg==
X-Received: by 2002:a05:620a:40c6:b0:7e8:5bb:b393 with SMTP id af79cd13be357-7e805bbb656mr127000885a.4.1754313261562;
        Mon, 04 Aug 2025 06:14:21 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8feaf2fsm6810919a12.38.2025.08.04.06.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 06:14:21 -0700 (PDT)
Message-ID: <dd278225-6680-4dc2-a0d4-e110fb2cfc20@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 15:14:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: qcom: mdt_loader: Remove unused parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-1-5e74629a2241@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-1-5e74629a2241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: skVKUzpwTFye_WHwAfRC5nW0n94wCF0H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3MiBTYWx0ZWRfXzz7e/fVTI/o3
 4WhfysAmR6W57EJPkfVTiHRoJBT6UMdt0U7hLw00p7l0M+rw9gwHKXwcOC8TI5FySna8MPjpglY
 hOuaoFw09aUqQuOgWEIZHaaq+byDvwSH8RCt/D2ABE9dJNWvxjfVupuNjJZIKc5GazSdvVFr4FK
 KEiaGO2HsfbHPpxUUc1hv2iqYWDu/YgH2EfL9ZOapsWz2O8f0YwSHUDSNas1Vq2fVMsEBrNCFFv
 gH84SjNXg4TdtlZVbnPXgJQNcqpMHb42MxgqrGd9WRtMjbFxuk3WJKjo4iC0yIs/qU6G7Lwf4xE
 nu++L97XSThcSvzoz+GTaA1cXATt6ptUQAGew+Ld5ThYGCofSVWcbJ361vvh61uSL8E6OTKkvtr
 8pZKZSCtvq20xyk5oV41hldNgIDYf78+hddh5Lc7cIhdKcwTWKvCrRuS3iuEI50keTdU6uJM
X-Proofpoint-GUID: skVKUzpwTFye_WHwAfRC5nW0n94wCF0H
X-Authority-Analysis: v=2.4 cv=a8Mw9VSF c=1 sm=1 tr=0 ts=6890b22e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=wXYMRSRB5Pq2Cuyld4wA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=925 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040072

On 8/4/25 2:41 PM, Mukesh Ojha wrote:
> commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
>  operations") move pas specific code from __qcom_mdt_load()
> to a separate function qcom_mdt_pas_init() after which the
> pas_init variable became unused in __qcom_mdt_load().
> 
> Remove pas_init argument from __qcom_mdt_load().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

