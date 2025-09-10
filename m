Return-Path: <linux-media+bounces-42207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD7B516BE
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 14:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59559540F18
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66B03168EA;
	Wed, 10 Sep 2025 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wj/r7+F2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0AD31770E
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757506911; cv=none; b=fNQ3/Z+mjpPIQeB0Xl0a20MDNVtafbi1e4hApDGmL+ARYR51FYfEoQ1ivLblK9XDG01o4xZhgMKcMMuMSjjDtkmugsQyWTtn63kBptsRzuBf4y1qaNkirwPmagO6Gbxg8t+/h+AYvhenSfCH1wC/Xlbl88VVL4QptM5qOc5y5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757506911; c=relaxed/simple;
	bh=X6KFvaVVEp/dLB58ZazXkEEJ/edkPXleLAnQlioyPKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XO067joMPRIB4whVT4/VsppJ3OzOoWQW4sExF0Cc8CQFYFtY0VBfJF4bZNpEbNOU2ByRO6YhG0dYHVBq47SQCYTaLMYtOel7vsxggxBm73jvGx11Qi1BKa+EcINAoBXDfW4yLxcVqlHESS2KgWAGIh9pjhYYrcd77jhm+B0sqqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wj/r7+F2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAF7mx022078
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 12:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0vMWTcElNgxy4rtHU4PlXXcjyINdBlSlLR0M7KQ8Dho=; b=Wj/r7+F20oSLhcZm
	gR7IlHEw0gGVfncRIWGRYXpijto16adl9ymBPXPuthfLEojRI5Av1bSHNvA49oIj
	aCUo37w1MOdFQk2HGeF+I4PlPmtIitFaGpFFNZwwkJQ+sYMmaUVYmGwHwgduKqyo
	88dNq3C8/tWeLOKZiMmzocJYh2hsmr24WCHA86087SNLdxn07jII9v5S86iR9b5s
	WTNpjisCL/gnTjGLu6uqZAK4S2AVnURN7MXCr8nJbzcj6xRTrDHQK13KyqOHy0g3
	9WWrWrFoZiHu31WeP+ksnlF1BMVx2VVBarAQln7F8AZZBIiMDx5iQqldQ5r5t+4/
	2YFssw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0urwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 12:21:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f15a5f3dso9971281cf.2
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 05:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757506907; x=1758111707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vMWTcElNgxy4rtHU4PlXXcjyINdBlSlLR0M7KQ8Dho=;
        b=UlOOebZdQdNk7zAJX1hfy55PunPIzHUqEabVnL4t/GYSGHglpNhGWwrbvYZYGbQb1a
         7U5l07mEyB5hwBPyFecqQ2EaFWUhNVPOha+6alpcy1NIDC242A1UgpsBhy4B/MEffovS
         lHhVsgQzTkwlfEDbMA745Y0bFb9y5tyfPBeyXpT6z7bIoQKvbkc6NVvcoTgUEpc6lAJL
         XpXlok23fe4dr141N5rwukZiwR/Lps5dATGJLq4h2yAf1jEBfzknldOnTDe9nPoi5hej
         zLbdBm2DEfOaMhvzJpBh2I+XbjIIGMOjz8rWBxEWMWMTRlBECSOPMkV5Nl4hsucFvRCM
         V9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnY9Pm6ve/HG9ZLiBIT2XSJslShEnfdX2dFp7UterzkIalGgsRbbeQSJ94NcWWSnDe2xOCXw+29cDKwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwdhaWO8VKaKWRxoWn3x8R+vEYyvK3ke5GmN2QXaI3fLcHX75O
	yfgby9iGbj5ZENM50rkUkc7NfaWw6a0YEmi2FbeBj4zatlRQr13gtXpbtg1AE2Lhx35eSKwIkXl
	OyaMMJCMvAOiIorWmuzMX+a+//GOGlT5dw8XHoNoo+NUd1Qe/NzDYFax7SWhTjdh/3g==
X-Gm-Gg: ASbGncuVEQK2jyub5SK8VLz4rKngr7f82t9PBjQNUyGqk85i8DEYTchwFUTpiDlAB2X
	PB+LfvXZc52ryr4so/i4eAxzKmfiy9Y23oVT1SPq9vdViKtxh75g0CzDR9xBLc4ruJWHDQg2t6y
	fo2MWGjOsvEghC9PhLvL1h88pR8Hps4H6k/I5qw6VA6vf/m50euQxzUsrMAzCWAwyLEomn3fME6
	JBPIEEm8ZYL31DXgz16snssRQOq4Cijj2xQXMKjcgTWHUA4xLW0XvQX2pw5SfwzT/AQzvF8BWRR
	lG6HIfBcFTfHFrOpUMNxNCqpZAnTa1nxiPPVOLHqnOhsNhUJOBNxH3XmpO33M4PfN4GiZXOctBs
	f6325IgCwIsFv35D6AlkxgA==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4b5f848d05bmr107672691cf.7.1757506906951;
        Wed, 10 Sep 2025 05:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQM2ETnZwgBv+qedS1fE1v5n9TD61CTWqUhCz41J601U3LDyveBpzWSkY3wpyOOnfMzFjhOw==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4b5f848d05bmr107672451cf.7.1757506906461;
        Wed, 10 Sep 2025 05:21:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334e86fsm158892366b.56.2025.09.10.05.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:21:45 -0700 (PDT)
Message-ID: <1f979b86-b45a-46dc-b926-64f5b1b84f7b@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:21:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nq8z2ISjwX7YNE6Ol46BVwSdNx6BvUc2
X-Proofpoint-GUID: nq8z2ISjwX7YNE6Ol46BVwSdNx6BvUc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX1YG36VnH+CqT
 xtvN6OsTG29rhvYI6F91KU/PUc5iic40BXUs0RU59em53aIcIwy8t3eIMNQcUm1P2bTkfP4gBpH
 z3dP8vlr0EzWdCB5rlmfJFabKzt2AjhW5Al7XxVJ1hqqVrgxYJ5xDH4W8HPF2u0rItLmDwc/U3B
 GoxWcLtKuFQGS1mtigjglDzLHRmEmNyKn048+H3NoetzNfzRZc9a/X3AJ/Qo4n1qO9y0VvxsrTc
 J6OqwwIxVm57QGxKja6UwHxVRo98gzR59Io71taVwGU6ZhSJukd3YJvsjYDBh7Ac9A+1XuvF/4x
 T1ZzlSAmgV3XJVBLkPH9RG9yn1CvoAmPLMui1uGvGsgbI+yhhizGv90WCMWYKcVbWsIn2GQIbbW
 BJNv20eh
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c16d5c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8
 a=q3hGUckLsqYRD40seJgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On 9/10/25 2:01 PM, Aleksandrs Vinarskis wrote:
> Leverage newly introduced 'leds' and 'led-names' properties to pass
> indicator's phandle and function to v4l2 subnode. The latter supports
> privacy led since couple of years ago under 'privacy-led' designation.
> Unlike initially proposed trigger-source based approach, this solution
> cannot be easily bypassed from userspace, thus reducing privacy
> concerns.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


