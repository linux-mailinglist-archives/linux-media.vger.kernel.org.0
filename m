Return-Path: <linux-media+bounces-33712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 116AAAC97C7
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 00:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4536172220
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 22:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B1228B7F3;
	Fri, 30 May 2025 22:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOPGBC+d"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5084527FB29
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748644573; cv=none; b=CXOsJLwzCDZYgUrFF7d8uvSpt7PZRIaBlBH65vDz+9QqbGD4ueOI3tSg+tbNVN3q5UH78zYVcqPfsHuEFHRyXD+BOrcNy3MSumRf5RWAWcDLVW62DEbKd10jP4mn57MVkducJDx/fDA59d+nFjjGKVH8mvMk3jSfICF2/aXRJ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748644573; c=relaxed/simple;
	bh=xGS6k4blEjy/i9Daac7d4JV0CcqtR97OXUHxEjcdtWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9XsyzFVumJdf4Umx61JQqMm7jJ9Yj7k7oxemYjU7Oyc0O8ybVzLe0ogD7baTUqoMgzohf13zYEUQEsQ7+njEhLFVUHdZOAxte+el0OHDwQiQcOclBNYsF+RVD3LunpfnvkW2yZCzEmuYBRtLvJoO064OpbW1f64TD4aQ/lMgSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOPGBC+d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UMHnNe013153
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 22:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNkiIfiTftNXJgdiuHT45+fDScK0Exk36F66VVHtQi4=; b=hOPGBC+dzZz2J2LW
	eaVhf+vXxwjvSFz17q0txgp+yESeVz0ecMaYP2pJX0DGig43UY+btmCONH+azc4C
	DcdBz40pPL1HJYFAmYZpCiQhI5Jjb3Apb4EZ7XDOFkGfvhbUrk8BFZRlyybY0mJU
	eF2uUMgvEUWKLy6mOrkYBSYetd27a5g7oxK5+58M+Wj7O+HOmyG6+sma2vArmcJE
	zM4Rlf/yl5K7Zd+MuW+yD76L/9tMCyGPSaOssjVf05MOCsZAycWWOFC7IWXfCesw
	Z8iBvY31sO76n6EAbtw/Gf4XWBtogzd5NasEEKHUG3RbfN4agrx+HLwKdB1pS4be
	EFg2gg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4ysr5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 22:36:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fad6c64397so1656066d6.1
        for <linux-media@vger.kernel.org>; Fri, 30 May 2025 15:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748644570; x=1749249370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNkiIfiTftNXJgdiuHT45+fDScK0Exk36F66VVHtQi4=;
        b=t5iKYU5ZcqDJ1Go/WWuDvdDm1fp3KIwlg9Y573SALdfcE/NzN8+kIzuLp9XLitNWMD
         ADJLX90AD5WJqKV97xf08WJ+T6Kh7tAnGJwdRcb5QmIGhMu5F9DU/ScOq3ylcfLMIqxh
         dxTO8TUmkIkF0mAszVab35w5TBoEJhTGwgpy2gPBNfdOwqEaAB+u5MhNkBm45aSdYojD
         MZFlojNpq+zxa8CMPQFNC2Oy/uNOlZ056qXisvsK9/atiNWcwCQ6i6tTHzQA3DiwQ17I
         Xbs66zdkPXKfmU728+XH9w43gM6qp+NHkWEF01rDbiQIW7eoD8YTsR1B7PA/lNrtNzTH
         EJtw==
X-Forwarded-Encrypted: i=1; AJvYcCULCMJcuQmBrrxE4Q/LE7vn7zfEgmXiveOms3r0hLa1NBfm/oszmSvQGNxxWcjcnli2bTNd1nr1XuUIPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOleXWPk6Uz79l6SgfaWqEBbUziLVdmgHME2DNH/78jV53kZ+I
	qSOpnRS9RJ2uDSAaBZnzCzQCOt4jWO4FLrQqGb7ZYHudLBVmaGgt0fQWl2wF0idZXXBhQsOICoU
	dSN7kM/TNrG6TZw3HorgA29t2dGItjmuWRVTMdUV+3V0OVEWTOwlO4SHbaNjn0qtwJA==
X-Gm-Gg: ASbGnct8XzrvyKspfRFB6N3JHbQxgfogSa4vtBIZR5K3uu2FbxEF0z1TnB9p8LBUnLk
	zOHYEIX3R13Z31uguJD/2zPiIQM2Ov3De8h4Jt9rOGjnVIwZSC42pdhPaq1B5mEzOyRelrEpFhx
	PQJOiiP7WQL4J581JVU3J12LfXRdA/88LfOMzHKcyYlH9kmUY8+Lr6miwOxLZnJTNb8hyCF7A3K
	jja+xp1Obf81/7Hdd+y7lIzcxTz1K5rTUhNXJ6B6kuRurbS+3FOtRGPgHyB62GDteEWTKuMEZE0
	LrN3hot/yARK1dleYAZ9Sdj2I3yUn02g2n9LXW5YXWHP7cQsA26pzE/UNi/tlE+Zcw==
X-Received: by 2002:a05:620a:2a0b:b0:7d0:a00f:3583 with SMTP id af79cd13be357-7d0a3e0f2a0mr241774085a.9.1748644569833;
        Fri, 30 May 2025 15:36:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpR5ujleZaD69xfTnf0iaRv5b46kYN8mhROKL6XszWVaQ/FlxVmb9Go+0V9OPlLv+rfLSCqA==
X-Received: by 2002:a05:620a:2a0b:b0:7d0:a00f:3583 with SMTP id af79cd13be357-7d0a3e0f2a0mr241771585a.9.1748644569450;
        Fri, 30 May 2025 15:36:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb4292ae03sm57383966b.80.2025.05.30.15.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 15:36:08 -0700 (PDT)
Message-ID: <20d0e138-1b35-49ef-aed7-b9d37fe8d264@oss.qualcomm.com>
Date: Sat, 31 May 2025 00:36:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: qcom: camss: Add support for MSM8939
To: Bryan O'Donoghue <bod.linux@nxsw.ie>, vincent.knecht@mailoo.org,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
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
 <20250530-camss-8x39-vbif-v3-2-fc91d15bb5d6@mailoo.org>
 <e28b518b-26ac-4d3c-bfaa-21a7cce63366@nxsw.ie>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e28b518b-26ac-4d3c-bfaa-21a7cce63366@nxsw.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIwMiBTYWx0ZWRfX5CSjUTei7Sk2
 h08SjSrkjOxxkaWMbJVQjVugA8I5tiKJKDouZCNcMruCxamaSYu447FTx177+fCoJunTFnrzihO
 9guzvbv/KrZkOD2h5CUNzf7pCcQf/BW7etCfGPDnLVScKxfTleIc2MdwRiTrzthIvigN4VqZZPy
 ohNKMm2EtQKTOK180MOPZbafWz6Ds49wkhF96d8o8IoL2SEhbyStq3LQmdb6S7SnbLFUGsmnWoN
 FDekNDsJILejSzDaaFvLkxbuRC8VQaOG0L5Fxn5+NRfMQRWA/d27iVBJjGZplxvIPYSYKEGcPL4
 gRIeCUNneB4siIW4duX4THEAoq12ZLwJxlClXAyd/pCugGxqUgPfu+fZIWz/uJdNRWr2hfx2jig
 hMpO/VxPTbhlTyg8a7bVUCI6IEx0vi3H7wDgfaxVRbg4YOjmzVIgiIrviCUhYp/JfAiQlgBa
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=683a32db cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=okvWR7n1QOkNPS1Vc-gA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: aNq-Qz8L66kHLPgY5IqNTaohGhrv7f8V
X-Proofpoint-ORIG-GUID: aNq-Qz8L66kHLPgY5IqNTaohGhrv7f8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300202

On 5/30/25 1:49 PM, Bryan O'Donoghue wrote:
> On 30/05/2025 10:00, Vincent Knecht via B4 Relay wrote:
>> +	    camss->res->version == CAMSS_8x39 ||
> 
> This is not correct - it should be 893x since 8939 and 8936 are ~ the 
> same SoC - probably 36 is just a binned version of 39.
> 
> Anyway the x is the least significant digit.

x here is the modem config, but we generally agree to just use the
most obvious representative, so 8939 is ok

Konrad

