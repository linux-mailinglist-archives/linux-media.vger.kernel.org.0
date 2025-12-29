Return-Path: <linux-media+bounces-49640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195ACE6D5D
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 14:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 601713000B6C
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 13:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F08313E33;
	Mon, 29 Dec 2025 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArypPUYP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ca3p8/8l"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BB6313551
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013802; cv=none; b=bpkU1/SAKVfPQRv4Yb0/fQJ0rWY0K5nSjudC4qQ5YnePQ3HIkZyCzoJSSdM/Y9apHmNKpCwcCKhY/eBUkVwZ8+A0lT7ZLM1VIHwgd/4VWOQhtERqh8sV2zSjoLIUcK95louFzg0LyFZJl2x8f+iGwFNN66rKBhkk0ZSqUcNYcJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013802; c=relaxed/simple;
	bh=uzRIwvYsnyggvosgt2+KHtoM9B0+eZ6xtRrRv4Y3FcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2r7ESLhVjBh+C4GnbhOIC7286aLYJnBv1rTYF55YMedH7aMxezjkhycRF58lU/6msteW2LQ0V/bvq05cDgBgSbwfRnafSh9gxAd4Pq+SlnvNMfUG2O+MhRAkijplc0+LB0Kx0TnWO95Z2wHvDKXNDqbCT4zvGBm+n8n0oy5EDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArypPUYP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ca3p8/8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA398c3825984
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 13:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1U2KevJnmKY84jN42Ic3+RugWNFdMyVeLE8MTpZ9s20=; b=ArypPUYPJymm+FeX
	ot84me93MTAVg0bKv0v3vYkVHfj1gkXhfUKwsWvlQq5eSRNrhxjjcoDKX0d4uYv6
	0XgmH6kvZ5R6VvWD77hqN1upOfmXBd0BjkvdOH1b9zA1x+GEqgiC9FLLIfuZ+sn3
	gf8dE+cduWrd6TiEKIWoyiY0yjYWKnV9ge2t4HG4Eu3MFF/lcgsh7Cgx4LeF4408
	OcrqSh2kvP0G7xNiPnrJnKwGUYfxuJ8DBzSa31qQqtQhtmwaUElEJX+ARk3xF3wy
	Y2bekP7sy1WNziNqamVG2WAfoWyuD7NeQlMtdBX9kYduQnOhsdc9jAJCyY9Lc7EM
	B6a74Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg4e6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 13:09:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f34c24e2cbso30795691cf.3
        for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 05:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767013799; x=1767618599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1U2KevJnmKY84jN42Ic3+RugWNFdMyVeLE8MTpZ9s20=;
        b=Ca3p8/8lbi5K79oY1HMum42fRDJxq3w3+ExdDtYZmkq8O7DkZ0LI8Yw8LBVa4ZS8iC
         Op/qADKnYCr2sVdX9jhc7CzacIPIHQ6NwLwdLCfe+FUWhksWTVQET5UckKAMMHeqxiaN
         Y90Xot2SmYuvjj95FGZ9MRv0DGR7n934onB+IufwuTjS37KmWgdDHCgWBhpwsbkt99DT
         IXRYXqS1UnXkVDEUghBmbsGU6Mawu6ZEApIQpyIVZbSbeyPg2HVdhjkC4dqwfzEmnxiI
         IGihnKSfKBztDSwxtMMfem3Hpwy8bMneZrB/H3QlYKPPWKqsXqWNrKm3blvJy3kPaT6W
         BypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767013799; x=1767618599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1U2KevJnmKY84jN42Ic3+RugWNFdMyVeLE8MTpZ9s20=;
        b=Vqkbu5R0cqobgcCFUbIOFDMceq5chX2YTtiI+01KM1czO3Yr8Vg9CTm+tv8caehqiF
         usVq/IZDx4XEXB3q595SGzEhF2sBMhoUfje41Qy0deCaBV3v6Ui7tGzdkSuWHX8DJGqj
         kkQm7cXgK9iGxtLHU4/vBcsOPwINyI/M+ezoRiMVvPbYdja7kZnNP2XD3Q12J4A/mJNW
         3OxDlG0OxS9R8yFfkQwEyaT2B5W11W6nX6iCH2fL+fnzGuqAu8Qqau55B85uLSdKbyXy
         Urxu/9Mq6OY8fbWuXKyC8XSWaVEiAgxaV4ydVfUZR+Gf9FQmiczH/dzL3tZEUo3RLlHE
         7dOA==
X-Forwarded-Encrypted: i=1; AJvYcCXnKZfSs7M8IKHMY4AQjSKfrS6LkRMsVLVWyiKS9hzFxKjgR1CpOpj3B1tXmw6u64EC2qGiMJdg980jtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyu1zGSPUn1hKJ3tnCXQeoGyK1Xv2HEv+TjCCHUwmJViLxO1Vz
	uS62yWPD8bksKO+7JT6PAzDOfEHOCnDgVSIMXBloYWaCq3lXcXuzES6LeL6SvriwXOC0e1H6KJP
	DufZUPYSgvkFXBVINsGlQ0BB/90Ssw0Ub7ZZy1D1bipj6ZQrIU1RhKsXgIYWv5GM0WA==
X-Gm-Gg: AY/fxX7OzAz9LhkpOE4i1D6o9msyJG3TSM7JXCCMGkpvUwKVyM0F1sxnvMhRWIdidl5
	GmAq8NUoJaZ8iw/08Ale3cSWEQvJqCmLr0xdeODJmPnUZvg7NhGUjoS861Jdc+0JsG4tIk+c4u/
	cG0iKFnYZ27Pazu2Y8G9agNyugx9FQhZpl7D6ZhLpGXKqLsm20JGgOvR1GaCQeI1nILdkojLZ5T
	TOnobBrmFSvJBycq7eZGD+ozEprK7eNiJLc0ZJC0qM0B9Y60a0ncFE+E3HOC1hLu+qttownq4d5
	RPDOWU/2pCI7JCB1BcX+C8Q2XjsQbO3WUGg/xuKLQy8+T7YQFEeZWeF+0C6c5u+q5x60fU91Ku0
	hvfnfRKhQnCRyLvFwq61pyqsboZqhvaZE2XMZ+KVg+TXUz9ESO8z3cIBVI+gfughveg==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4f4abccd72amr343273711cf.2.1767013799165;
        Mon, 29 Dec 2025 05:09:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeFn+ULom0MaqOFCpJdzSzf47AT9NbQIchSG4rj+Gfty0bp0BAWaFjA8ywPw14vBH4HYDXuQ==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4f4abccd72amr343273221cf.2.1767013798757;
        Mon, 29 Dec 2025 05:09:58 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c0esm31675297a12.20.2025.12.29.05.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 05:09:57 -0800 (PST)
Message-ID: <47cfbdbe-1b73-4fbb-aa55-fd1b29ddbb18@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 14:09:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
 <20251222095914.1995041-6-quic_nihalkum@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251222095914.1995041-6-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6wIKwjrZpJN0Ved1Hos45kZW3hPlzWOV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEyMiBTYWx0ZWRfX6XN16odNrblV
 Hz7g1rM2Iv6EnWy5ic6QyU8xRjqIwp2eEUzbJ1bmzKp9BqiEM0uTSlWkzg9WhzdITwIbP+zjFGV
 sOWZp5o6niEGUxGTgQMNsjweawbwLeHB4gqjFbtgtb6Lk+BzNr47vCVWQ7jC3WlgVWeFeWkHMvf
 Ae/PfddDy4zAkN6wogxHj0MGQPNtesMbtN9FNkIjGoHZPCye53GesdaMrYAitMwSkKEcaPi9UWe
 aXe0600YDY9TA+nZMjsBoNq7AOb6F3rf2yRGtkgAsmN3YdrrFcZPwiPttwS8xv2dJc6728vzjqH
 Bnq2ZZZocp9AQoaeQABdsDL1p0vbuOjRxT5nZbBPD+td0eEp7bm6Z+7APwc5QZLktdZnuVsKNjh
 bvAsWJqqgvLd1U8Zr9GFUF12ZbTwYao4miVWlPx/7nGfXj4+arTTe9QtWCiEUoHmcKXWwXXA0C5
 wj1W0u7K+uqKMgA2Vnw==
X-Proofpoint-ORIG-GUID: 6wIKwjrZpJN0Ved1Hos45kZW3hPlzWOV
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=69527da7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=dh2O1nY2NKEWDLYW15gA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290122

On 12/22/25 10:59 AM, Nihal Kumar Gupta wrote:
> Monaco EVK board does not include a camera sensor in its default hardware
> configuration. Introducing a device tree overlay to support optional
> integration of the IMX577 sensor via CSIPHY1.
> 
> Camera reset is handled through an I2C expander, and power is enabled
> via TLMM GPIO74.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video1
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

