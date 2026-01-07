Return-Path: <linux-media+bounces-50081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1279DCFBCC2
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 04:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54366303F0C9
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 03:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5001B2571B0;
	Wed,  7 Jan 2026 03:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHtNnG27";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMFWdFvj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F4523A9B0
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 03:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767755160; cv=none; b=COcuURBWdOHIw9XEjX6O/yIhHIE7D7MzdLCIVNxV6LU2ayhLTygCfxG5iITCsNhRN8aWwx/Ox6KpU4vXqiPN5Re/8VGHBoU2rf34yPoUPHTG+S7feQUi6WRwvl7DWVXo2KGH4dGEKfJYWfKelaOo54c6T8CkgpC7CXmMkjKqx1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767755160; c=relaxed/simple;
	bh=rAQ06Z88Hwn2LryWnBTCSbjtOJsxXEV5IZvr0ON6Q3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LdJntlEGcYaoaJlAdHDtsUP9HhQRwSGttp+7ypb8Tll/tIa7daYF9Hx7TSBp5xPgEKynCWFN7fuEm6vQOEIRJWqTEt4AK/P/TbqPP9yUh70BWF/BmEZC0Fy0n9meD/1o8tlsTSlK1rVYCNThloZqzzqWUZ9gtbA+ATOgsGugblc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHtNnG27; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMFWdFvj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606LHAjb4048526
	for <linux-media@vger.kernel.org>; Wed, 7 Jan 2026 03:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AvGndKIb5N4XZL3A8Y51r+7DP7X343aP2AKboj3Jbl4=; b=UHtNnG272vmuOg7+
	rZ81zhv3ldQSaSchWeFiASIaYra+GN+z0DRAlot8wkUNcpwxcHyeWuQ81CMkVjhV
	kRdJjaSLbSnZt8cSErdraG4JJq4gKiBg1IJs093G/Xz6YXqdpr/b+ac4XAm8Y1Sj
	JOOcS8XLiR6Uw6phwbomNl2BNz69ZhBYqz5UbRYwlYhAoDpCYp8vDL5N9UNt3vrR
	GlyzjyKTb6XRPYsgDmZE1+G+83GbXESlTIeNPeY/k3c+9x6nSfPQVqyngOvTls2a
	TfNUaLYqzzJVkqswdftkY9MzQaquJO0SivMuXWqebBYqy+/HBq1c9iaK1sG/JF2q
	39pm6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh25rtbjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 03:05:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb6a94873so30045361cf.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 19:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767755156; x=1768359956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvGndKIb5N4XZL3A8Y51r+7DP7X343aP2AKboj3Jbl4=;
        b=jMFWdFvjZhW4O6yhcYS1yV8uhqYsO5vFUt7hjEJXgznsNMRLrZYG7B2Wp9aveW72rB
         VA3Hoy6awLwFLLYZw6xvkDKBgzm8PVaHMwI1z496fSiLXbEGrKyqgQY6mK4ZnfWJH+od
         aensz0DttT7yxAIPJJ/q6FbOx2GHGf9cK4W4NC9/CRl1vB8hsdBU/vEse0WRYo9DPs3s
         ymg/CQmejDMXC7Y/eGE3s0yTjXBzGHAzffD8aKsWqqsPXxEH9lN+mV3c+2eXxLZyPOKD
         XLBBLOTGAXrwJW3ResTE1yw1Z4Z0nKC1fEOokubeSt40/2GH9K78l3cjhYY9vlT5G/BW
         i4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767755156; x=1768359956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvGndKIb5N4XZL3A8Y51r+7DP7X343aP2AKboj3Jbl4=;
        b=f4mw2nLz5e/qPqLoHr2+gPUApj3CTxWro3FRUvw00gHKfFStQ0u9JPVGKsV1ko2E8D
         WWck0nhL+SBIlAb7CoUH6B9YO6Pw1a1ENHWq2UEnxlQxYpM7yTi9OcMelj+ABm9YiSEx
         M84t7m+dhd5oRv79kYQ9YjSzqzTKLeNWxFTYHdrRqtMZYA8JZ+mJefqh9qRe04WVcrjL
         4/jvuYeIh0RiveeOP9v9meDsoXPaojXRgOnl+Xw2kqUu8W5ZPyHl0FkppsZ5WXlohu2g
         2KamooCCA8um7fk18e19fZfRKpikoG1bqftEejgRvywZZlYMc7SsGls/RgUFm9PcCOZ9
         BHeA==
X-Forwarded-Encrypted: i=1; AJvYcCXowcgTlFMmcF9JMfs+IRPZIMZNi8JL9HWryedfIkzU9kClejps8bmNbQiLk7eaNonUPukm5/OmPvEaCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypC1Te8y/CE4S3tQUZlxSPirdCJnsvhp0y6IcvXWAAkA6H3afR
	Q4d6EbQUdx+54ZxjvJFE/aYl2n70CCINK9xaF3BH5vcc54J9ZPGhScXiNwzj0oKaBoH2IXJ8MKe
	hQcPgtMnasNtUptwc29ny3yCbl51VYmDxHJBhZfJd7H2dV9RUiEc6AbdHnVMKQhR4Nw==
X-Gm-Gg: AY/fxX7EAwF9yCJ64OKtDFIeoTQHVfHCpbKmUz45bEt1FB7AEOqXrqX0vTwVEXglHJX
	w0hukI15+c6wSYpn6+/H5JpbyovoBhQAf5o7nNgPjjvoz00Kf+/op7veIUjbNS1ozoeX1+WPx+F
	C7pmfg9RqGVEdHjeE64bF7SSOdfZQbNrtEnh03K3ljy7RL7cUMXVaSW6uc7XcbPZMtc/RHxWxD3
	eMSPT3IS1xI4UJh/4GdZoOCbmVQ/QbD2dGgoEYCM4FxH1VlH7zsgHPczH6ELlnGpW/fhD0AeA5Y
	vDyvJ/i4cxsVKD3gfa0hereEd8hqxtQnkWJDwUOCgQlbFR6gpEfM3cAeKZnrDH6LZk+juOMuxzu
	t20pFJn9cVF7lgNDHDH7rCuCnmRvcaQzcAtIsiuzz/8h5dQCTyS7zuDOYsoWQC69+Tl4BuhmQ
X-Received: by 2002:a05:622a:110b:b0:4ee:1ec9:f947 with SMTP id d75a77b69052e-4ffb48658a3mr13464571cf.3.1767755156028;
        Tue, 06 Jan 2026 19:05:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnvTM2P6VEISLeWEQbnH2/SIfYFi6hqR7SJ3jb/JPTEH7e8kWOEzE0kVLRufVXTQwxCso0Yg==
X-Received: by 2002:a05:622a:110b:b0:4ee:1ec9:f947 with SMTP id d75a77b69052e-4ffb48658a3mr13464361cf.3.1767755155568;
        Tue, 06 Jan 2026 19:05:55 -0800 (PST)
Received: from [10.38.247.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d39230sm23060911cf.6.2026.01.06.19.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 19:05:55 -0800 (PST)
Message-ID: <f09670ed-1aba-4622-94b2-85ade831f7fa@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 11:05:48 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
 <ndexzb5bo2rxjsj7jkf3bevbb6vmtjpuuhxbonpf3v5csxnjtu@sotufkkvfc4r>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <ndexzb5bo2rxjsj7jkf3bevbb6vmtjpuuhxbonpf3v5csxnjtu@sotufkkvfc4r>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vadFfZmmi5bQuCxLd-nNQRmPuN-jGhXC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAyNCBTYWx0ZWRfX2IfbPsgbw92y
 zUDEPG2F6DVnMrtJkzGgijeuQU0Luwj5tNnnn7ni5QMD/OJgn2ciqNJs8qXtuWhBx+emoxFQqdW
 aq5HY8vjXpeFdSvrxZA8sFuy+gwPBVqO1mSp1xtkQCxxz1/FonbEHMle1jtjvs/0b36uQK9Q3qX
 +OIMvSbo6ItN5i2qfnmBtGtZ1JAtoWIN1IsbxsnV5DKe6OvwW6anBkVZG6pqXv4TFSlQ/U7xbt0
 wSG4e6P6e0KI28xeDUyJ7wx8FDokasXOQ7cXaLQeQuKtmrFmrrQyNO35pUC5dHHVpBM3wI5gazK
 on35fP/E+9xefUXVPmD9pCfTaekeEQLjWteccJCoYBpZM4ydQ5UIMLfi9abQ7TUFTJyTu4ngwPV
 OY/AiICKpveXg/4gw33N6fnJ42kyff7bPxtjpVSIFxhf+6po15iaxOu7/O54MmmRLxt79coiok6
 4jjaYir8D2FjO7vWWAA==
X-Proofpoint-ORIG-GUID: vadFfZmmi5bQuCxLd-nNQRmPuN-jGhXC
X-Authority-Analysis: v=2.4 cv=G48R0tk5 c=1 sm=1 tr=0 ts=695dcd94 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1lMvVU9yvT13_2MUe8YA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070024



On 1/7/2026 2:23 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 06, 2026 at 05:39:56PM +0800, Wenmeng Liu wrote:
>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>
>> The Talos EVK board does not include a camera sensor
>> by default, this overlay reflects the possibility of
>> attaching an optional camera sensor.
>> For this reason, the camera sensor configuration is
>> placed in talos-evk-camera.dtso, rather than
>> modifying the base talos-evk.dts.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile              |  2 +
>>   arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 ++++++++++++++++++++++++++
> 
> Is it possible to attach other sensors? If so, overlay name should
> depicit which sensors are attached (compare this to the RBn boards where
> specifying "vision kit" defines all sensors attached to the device).

Okay, we previously had a discussion on this. I will rename the file to 
talos-evk-camera-imx577.dtso.

Thanks,
Wenmeng

> 
>>   2 files changed, 65 insertions(+)
>>
> 


