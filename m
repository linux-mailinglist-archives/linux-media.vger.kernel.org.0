Return-Path: <linux-media+bounces-33732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9AAC9C63
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 20:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FED417B1F6
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE121A0B08;
	Sat, 31 May 2025 18:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnZK+hfy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C0918DB29
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 18:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748717327; cv=none; b=jSsTIzlaZGtnfU3c61ftIz2qgn0opaQx915mhZD3y6CBZQ7rhlcfPlpRD89KOOi2XpyQgzXJhUPEGImIyh6wFfRFFU+ub4bWbVd9iuPMUnC4uCPBtu/XnCbwnBuOWpRj/VYkBit5N1EA3c1Zr6PsmZ1+6kSRKpfSwlAD5dbiC0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748717327; c=relaxed/simple;
	bh=twnMRSAjtTxRsTLOV3TBRxjz+geOQMUR7QVp+z8lBDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0WRQeqUznhHYQpE/m/1A4k0hE6c9TH/4yJJFUX9Tzj5YK5Qa7b+dyjrxp9RKSQu18vxkecHu0Oc49XcHodfkjTgkqsQZWpTCOsOXWJ6STsQTgbRWB4eX0EsVFPxCEdC6qEs//iWB180IMQ73r4/eoxKjH0dqUPrmq0LjO6aBXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnZK+hfy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VIK98G002653
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 18:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fq6UVpWTFma51ctoNBqE7AuMMwmya04U5DV/dQ3iAq8=; b=JnZK+hfyv1XyuO4x
	5QKELThanYZBqy59WIWL1V8nS2NJ147LveHw+6bJ7QutoL+kEqsqNzaleLRzpqFm
	/oAepbXDPLK5Xl6gHfRVnGij5W2VJn1QPY0TUmF2s0rlm1lpzVb4nqtwSLndkvYg
	B3hWGLJfteLFuEjt0ZJ65U7FfiMJsd7WZHOushh1sup2Ck/eB2rG0jsPgDZDkhys
	y2iZLOkitIUEvMUzFzhZJqmKRBWF+BL5pRlSxvI63EESPg5T3l+pVaj2WU2G/U4w
	0LbyDISVPzIbsADafH6OooG/BcyLRcEpggYdCHrmWGrWrDMiXWOUxdKx9wFq1nMf
	jyOfHA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkr17r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 18:48:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a58580a76eso258131cf.0
        for <linux-media@vger.kernel.org>; Sat, 31 May 2025 11:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748717310; x=1749322110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fq6UVpWTFma51ctoNBqE7AuMMwmya04U5DV/dQ3iAq8=;
        b=qKpWjaRk/MN+lW+nkMI58pYHSnlPXzWmNv4JjB7AyFftIdFiIoyzgugHu+hihHradd
         H8IvzFp8oqOI7HaPttUiUJSPXgYLw2OfxuV+Xa233iNfTsAF2vS5LoQ3QlxfipE8kYhr
         MR7b3eHA8UtMY+vye/KX0g9M5UBWWN4S0ZrHL8Ps/mo1qYiIg5bkhl5Yq92p0yignEna
         ufYTxqT90CU9oP2APb41eKlhvEqI16lFnzxgt6VfpN+RTfXlQ3EFW88D70S2aKBSXpjK
         7GpDgcxuR12R3yJowC/OMD674n8B8KxlAjliYdNNLWtFK2IkRzXkkiN4WiBtGw89JQoy
         U2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrHth+aMglICNWSH9v5oJ8XfeB3mAdfEIApau+YHkrM7MoFB9kSIZHXIv5uXjPUwz8wK0QqTIwHEE2FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzziestXEKoRUVjUHhlOyfmnACOMsOFbWAN+Sn+Z68MPc82FloZ
	XkFB+S1dfLa2/Cwb3q8WBXLeoRFVJenlXJh4a8IyTqtn/uIVdnQh6a2iJaMHl1Dj0WgcwhXXi7U
	L0oAT80qnH+3RMf8WGuSppONY7yWMaTHX/Yr39S73PSUhrtvpITUZJvLeNsukygM0Dg==
X-Gm-Gg: ASbGncuejt3wByb4j1TLowgvsk9Ynf62B5VYwfk3tU7nRimBRuTWFfFFP66zKSSopiH
	En3BYKpcH7xCus/Oz/fCR3s+u47SGSUrDnpAPRaMnCvb9+Fm+l0GoG1/nUiaQ/uVtpAHZ8U8KEN
	1G1bNNtoPHGL+Lr0m+J43hEMngxcFt82tSh3ifVAzxhgicjf9jctZlxQSGbTxs32dgcmA9vhTTA
	6OlEI+CnnDvyQ8liCXIAOXUCB6fiHKsEfs0lTNNnKmh3B74Zvk5pYBytdQSMMkQnMHLzazScZVa
	56cokCrvSDv696Ni/JtPDKzOJ8n59SVD7ebTuP8LaFwt743XRLB3hM+3B/Aplmpm9A==
X-Received: by 2002:a05:622a:44b:b0:475:820:9f6f with SMTP id d75a77b69052e-4a44315f061mr44406851cf.9.1748717310673;
        Sat, 31 May 2025 11:48:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS50jxW6Qje29AU0C9sBepph7zG42LOAm/3jLmwP8x0sfmPiEZkOM44vaelCgiKPREG+C6ew==
X-Received: by 2002:a05:622a:44b:b0:475:820:9f6f with SMTP id d75a77b69052e-4a44315f061mr44406631cf.9.1748717310234;
        Sat, 31 May 2025 11:48:30 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c756d2sm3678883a12.43.2025.05.31.11.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 11:48:28 -0700 (PDT)
Message-ID: <4b4925ce-3a01-4295-9864-a43c65aab530@oss.qualcomm.com>
Date: Sat, 31 May 2025 20:48:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: msm8939: Add camss and cci
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org>
 <20250530-camss-8x39-vbif-v3-4-fc91d15bb5d6@mailoo.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-camss-8x39-vbif-v3-4-fc91d15bb5d6@mailoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nNuxc4mBLk1zuzyHDjSp0bKIPH2yMo6o
X-Authority-Analysis: v=2.4 cv=OMMn3TaB c=1 sm=1 tr=0 ts=683b4f0d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=EUspDBNiAAAA:8
 a=siKOB1rTJ_YAM3DqF24A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-GUID: nNuxc4mBLk1zuzyHDjSp0bKIPH2yMo6o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE3MiBTYWx0ZWRfX6rQiB22cU/7k
 ws5adNTzFg27JvwZll0jPasLw2k1h8FZfs/7RUE2jYQdi5rhPSJ4Tr7Mn1U8niP2MQi53Pfvfq0
 eJdiTwT23iLORWqTKFBv0SWbVvjbTIcp+rT/OgSkJqY4gce/2o7tGZGBH6d80moyvH8db2tgqxm
 GX/CqIxXIQyYpzQ7QHT5ZBX+IrvwjfRb/hRdwoVAQNO6zeLsak+JY8L6YzE9NJZpUdGqwPH10bc
 KGlDRNSuUnofu5V0TBB08YdpOGx1f7qu8yxJN9rIAyDPAgVcCpuLcQZ+L+qLQhGoV9Wizr4jh2d
 +SJ3KITc7aY1GM2xIFNAkfhKpUxqCQldLHDArXwYmiE7Y+idxC2QLjIhyfsodgVoE03L/KHeYEJ
 4ebpoyixVt32j4AslTYYvG4nXdYJbNhR/sUnLEdC7M6eKnYbVee1mlxzuk5TN8gl/y91+g28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=725
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505310172

On 5/30/25 11:00 AM, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 615.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

