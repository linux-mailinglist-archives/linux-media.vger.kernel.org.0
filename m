Return-Path: <linux-media+bounces-42309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EABB52F03
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEFB6567B55
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB593101D2;
	Thu, 11 Sep 2025 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkGXXzC7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC5E347D0
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588252; cv=none; b=gJqMch8R9uGYgrkohggO3CMyfPCr8YbeVzlt8nG3WVbtqJFV8rG7499PdbpWCcC8QulKX4ZyFPxBlhATGuIOIocPKix9Ha6Rw4Wf5XNlKuMFfql8/yahEJ2/xyWi5PcldLwWxDkKJLlVAj88iWovxx14jiUbUL6nZfj8wLDXvGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588252; c=relaxed/simple;
	bh=w20I3Or4zRoNyF774X/Fgv8TN+IVZ+rO/jEo5fzcVzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4uS/nXuGx7u9RDe4cmT0ektF0R/3W5z0pkTZ1ivuz/jka2/mjZfswNlqPd9cvf4S17xNCJkUWTGJnNILhnB0daYiriKzcx+aEqX5fZfZ5hYlrqkzkY2Dn1Y2Awz4LKudAWIhEDh2Av1RIEl7thnSDF8dnYFn0RXG8JZQj8v1YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkGXXzC7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IkmJ031037
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 10:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w20I3Or4zRoNyF774X/Fgv8TN+IVZ+rO/jEo5fzcVzU=; b=bkGXXzC7osxLiUED
	rB7nmC2VILhkx5rMILzT06IFeDLGM8styZehSnsAEhQ0urhJRLxKP2a+dEyYfdKc
	oVrVKpQgGD+GI7ckTMLUlDNCnN33bjnuL50qmHkFyohR0gnJabd1q+3dvePDaSGS
	CslxrWLJWb/yYwtyhmmyxW23RCTvlADxoikmfvTMrLxt++ZdmKGiR6dlBhGsO3Io
	i1OYxuo45I6A3hAWOwuZ3BeaNi2E2FIblLnaGo2SctKE557YQiAIQG0nAW6+jiJi
	NPFlnPisTYU1Sej6jGNq5wmGpCubSS+8Pw/LBDVg00ZXIMmBBHgaiztikwG2fhkR
	hpAt+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg73w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 10:57:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-252afdfafe1so7354995ad.0
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 03:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588249; x=1758193049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w20I3Or4zRoNyF774X/Fgv8TN+IVZ+rO/jEo5fzcVzU=;
        b=l3IqBH+C2yH8Swx7B0NZMT6LeeKPvacOdAgdECr6GcracnfkT2/p49s/RNCg7nsWSa
         RQGhkPSukP6VYGboDAhvzMCP3Qini8paACH+7dYXMJz8NF0c6ndheIaLj1iT85ThzfcO
         wUbAiZX4M2IzDGEbI2keXUEoCdttJFr5mE8zdiZfbwD91LDkfIgk6hBp6qtiWyZ3S1P1
         h39qeGFILg50qTM6pKXIC4IfZA44ru/Q4t7AHzAsDnezlv1JwLuBbWtZ4xEDfhSk5sqV
         JnxsIX9crWwi3X+y+lz33hLNr1Mz7KMxX6fjm8eYho24rtmW6XV+FfhUcEMQ8rzQVev9
         dwig==
X-Forwarded-Encrypted: i=1; AJvYcCX/saBns7zXBPTly0lyIBfxJFJLH9T3bKFBJ6PhxbJsIPveKEeXa9Fid2wSqIhW3K2gEhxaH4QiEmKItg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB2SlZ9H0EZALQmOVApLmgay5GFYyxA3LNbGH+MDFHg6Iru/Na
	8RIlePIYwrO8kstFTtrUuG3YRc0+YtNhziPf9hiZOroGxR6TLQsH1wBqYRSIa+T2kHgchCBwd8n
	4hxcRHxCoBH6OCNTSPlgNk1dG5JXw9c/sWN25pEwXWiAtl0hEMVjqGL5MQioQYI0s4UJPB9d/6R
	89/jchAJhNlIsVHJVO2zu9NVvuTlGaYaIzK2TjwFcO
X-Gm-Gg: ASbGncty4YPcglo/V2aRAwNJ5JN+S/xTvtDpHcTa5BYolxOtIUb78n0FnASiQH/QWs0
	m/an/Z4aql+MlhGK2eRt5/zNxGchKiZwFodScOHm6sYDPBK+QFc3hFHf+tdaZVFNU0obp4RsfAn
	Vrs4uwK+PAeBJe202esZqV97+75y0mSdDARlY=
X-Received: by 2002:a17:902:f606:b0:25c:8005:3efb with SMTP id d9443c01a7336-25c800540b9mr9214785ad.54.1757588248913;
        Thu, 11 Sep 2025 03:57:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAH11JD2Q0IWOglR3V4QiPu9OVEC1C5tZSFPqr+NcxPJGuPbUCJ+dsuSyVMVCW06uEy6k6eSWe+gjk2lD+b2U=
X-Received: by 2002:a17:902:f606:b0:25c:8005:3efb with SMTP id
 d9443c01a7336-25c800540b9mr9214575ad.54.1757588248467; Thu, 11 Sep 2025
 03:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com> <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
 <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
In-Reply-To: <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 13:57:17 +0300
X-Gm-Features: AS18NWDL5Sq7WXLmyGnLpCSE5BXnWmdKo1qJbjlndUcI-PeO2ah0x-l-T_QEjBQ
Message-ID: <CAO9ioeWLrYAFG2cN6w0uOqQE7K83EAyN7om6+QEPUWRZoZ3-Nw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_svankada@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>, quic_nihalkum@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: -DiCKYV6-CcYnByWPhhnyeiyiitrfw50
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX8RgD1ENZPRSz
 FAx7a7d0Or6Ej1JRsWa83W9wBLl9m4Hz58lfnsMJHYRkED3FKVok3hxBsL5CxWAH17Ih7xWvpL4
 g35pCFrr3yzBG5CynS4RxLlKsg5FrdU54VIcOsgSvCQtvvuTMaJI45H1Sq8I6KYElyZmp4O6/Ww
 uV8rCttsXXs1uJsGf/+0jBYGFrRZQ02ME7uWZ2hCMc95CO2f8Koh+OBl5KBLDnzov7HPBTm2ldD
 a1Zjl3JRjs6r8ZJiBAG3Q0WZt1e8qSBW4N3THIFwyj3lkKxD7LSA3VTyQZqJlNRadwLh4iT9ucl
 ztTt4mRtBMwaK2H3swSi24HxLGtkmHdSgS8OF+PFW+E8tt1ZElTJs98FzeZ7JdmcPSOnNmAAerG
 IAtSxPF7
X-Proofpoint-GUID: -DiCKYV6-CcYnByWPhhnyeiyiitrfw50
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c2ab19 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=COk6AnOGAAAA:8 a=OL7WMRyR3eFSKxD7jRQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On Wed, 10 Sept 2025 at 10:03, Vikram Sharma <quic_vikramsa@quicinc.com> wr=
ote:
>
> On 9/9/2025 7:31 PM, Dmitry Baryshkov wrote:
>
> On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
>
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>
> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
> Camera reset is controlled through an I2C expander,
> and power supply is managed via tlmm GPIO74.
>
> Why is done as an overlay? Is it a seprate mezzanine?
>
> It=E2=80=99s not a separate mezzanine; monaco-evk does not come with an a=
ttached camera sensor by default.
> The overlay simply reflects an optional camera sensor attachment (e.g., I=
MX577 on CSIPHY1)
> That is why camera sensor is configured in monaco-evk-camera.dtso instead=
 of modifying the base monaco-evk.dts.
> Please suggest and alternative approach if you feel this is not correct

Okay, I found this email. Please fix your email client settings and
never send HTML emails to kernel-related mailing lists.

--=20
With best wishes
Dmitry

