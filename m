Return-Path: <linux-media+bounces-50066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06793CFAA9A
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 20:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04A9D3174326
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 18:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E40B34FF6C;
	Tue,  6 Jan 2026 18:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2ftelMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LE5Iqfqu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121D734FF64
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 18:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767724852; cv=none; b=QKORB7E5C5K05yHQCeK43J6R8pFuKNZsYhOGO7ylE62fV7kMo0RPQ93o0q2sO3ahbJbLfyH0dsbmysTp45G1yXavbS9/dpCf52rZFOsMepav8AVfss7JVQ54XKUbqn8y0DrVJ870SkHirthv+kma1C3eD3cBa6gIHPtt7IdJqQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767724852; c=relaxed/simple;
	bh=++DQGKnOZXg8YlFGgSsaTnIuRLTvbA/gdMLcbw0EMEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBu6GYKp4khu8rG35HO42ddpa5eWuOrVIJjvmGE44jGi1WvpZiK4RRbJvBs+eVvlbCu7vDLthCMMM0Gr8/Lrw31aihISvMh/igIMw6oh0YIRRoYPBUpKgchxwX5zJT8R9GyELAJIbxeFOI90+en8KgqasLfeYP1BizgP+JAliLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2ftelMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LE5Iqfqu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GiiEG4137181
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 18:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5PxAPouMyA//31qIYJm+rklBoskPqlYIqSfK+Bd0RZ4=; b=m2ftelMRML/dFZvl
	ht2KIE6bYMfPbyV+j9Wm/WIqiBh6MuAaKMwUl8CnHzk5AkFvA4SoSohfNPfa2Thh
	rKDkMYCx7+vWS3QqsTbmHquAoIaMnj4mYeErzGEsa21OpVVSSpd8XxNyIDaMj97Y
	OfUdQpMIiQl7mwyVJJoTHH1ie+a9iYnVx1WDBAN/epH8rjuEYuW9saUtbPkOjkMP
	qdhrU14zP+6bTKqifZw54iBJIqOBtJ3wzyx6dBm5zk7ERYJzQ1L4DFu2/ZCGWvNc
	holB8CgEM6ZSAatXT2br+vup262IRixQILXlE82dV+3d7CVY4NxwUIgLGcSXcaK4
	fPohzw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e0bxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 18:40:50 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12055b90b7bso2460027c88.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 10:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767724850; x=1768329650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PxAPouMyA//31qIYJm+rklBoskPqlYIqSfK+Bd0RZ4=;
        b=LE5Iqfqu3CvAz97I/A/aVD5ymgxZ4fL8E1s+h9fW+nm9Sgq437VGjm21QTVjfbIk8q
         KhmF8jkzM09zCbA8GqAn44mI32X+NU4oIL4J8d5cXXWAvXzhYFSH5K5/qrVGPFenTBVE
         BvXwbHJCofprgHxyfZ9dZcpTKPKnPHaQgdMSIlIy/zha/biEIgrCW1LGHhiNLivFmkiw
         6ba0RYB5kU9GqOKrnWEwY6USNnk6TXUFXJcUs21pOlvZyWuujqrhMsP22dwQQ+4x7nCl
         7uD4OW3flv0DeYZKl/BD+gThuy6eBUiywvlA8JDxvQUVZ/erxW9pMAGFHmHPhRsSg7UK
         W6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724850; x=1768329650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PxAPouMyA//31qIYJm+rklBoskPqlYIqSfK+Bd0RZ4=;
        b=tL6YJ27eH2ZlJFkbfhpvpHh+L/dD8DjLxDDx0WBqQ8BlEWnUtGYjIQbuEeV5phKTjz
         SLPMTNqpEM52A8gblHL0Um7rPZEfVY/uOiN74W8DPmM4PSdM473MF+6522m8imyjcL1Y
         Vy2DK0qmVoOd88uxyYZqoQbFCIxG13rugMsDGAiV7KnfKFQnXNeReEFIKWo01PU+LdXj
         isD4fJzTneyaniA5obF6xQ5C6ccnNO1v2xUHHNs6E2nO4B/FaYz4cQwxhv8jLkdPOFvz
         2vGQc1wy3mevG03PbSJThMnGQoVGOemdE7b7HUCLIWrcE+oHpc5EnfcbhnlclyHI1ruc
         M/sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnhI4rXZqC7WiUO7kCR4KwKoOhp4MeSKCUhuJUX/WgFjXEzkdWqXOqaLxBAKeefJY0UPln7OuzI8u9YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdL9dlCgt1XkUR5m6ACasUG69+ju8WgfbEPi6GkddJxfQ/JIdY
	SqesEl7b0KaMBGXuSQJ0PS7ryQVa18GhsqRiF7s1vuTufYYjmOxMuTlxOZ4bKsRM6vy/WycD/Cp
	QyLU8/NxoCem33LPQsfn8SK8nHQi4L0MosjLtjiQuXJNZ0bHmhMf6A/hNJ/YSpx6q5A==
X-Gm-Gg: AY/fxX7tTUHui6m9+Ak1tuhqq/rDwUCU+vOWzX8wzPC6uLOr3zAHNY2bF/Cg7eP6FTU
	doCxc4vjZJcDS7rkDO72mzmnyEkzeC+GJ2Hz7FecsOFghKYwWzDWWgF2zxvrGArWIspysgFQhCd
	tnZha62BwmFqEvSr+8TdDmBTSot93HOKbp6/+eYPGfZj6lTjFuajxs8K0SjrsrHygDW7DFWKnCy
	JRZ3oiNrTSAbw0OkNDxTmzpFM43U9g69FBq6U4jNp+4a3PXrDdXhV6hunW4BR9+cLIhAWZMwAga
	JoUvEtx2b5YvuqkMH7nuxC8JUMuv/d5UnwJF/x7qyXBUcIUfZ11+YO9h8B+eAgYsDWCzQAM9kng
	s67gbOi4NCBkceenhzDprsGfGuccWqxj3Q0aQRn4zaCuyrLlersZSycozJtdrE1M3zw==
X-Received: by 2002:a05:7022:418a:b0:11e:70d8:5dbb with SMTP id a92af1059eb24-121f188e0a6mr3234839c88.7.1767724849564;
        Tue, 06 Jan 2026 10:40:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSlzX+i3g8MbsJ2Eno/vHUKFXWMpqLnsUNOpaetZ9ZfpcQ9g/t+UHkyP6dmuOdvPwPx2CiQA==
X-Received: by 2002:a05:7022:418a:b0:11e:70d8:5dbb with SMTP id a92af1059eb24-121f188e0a6mr3234816c88.7.1767724848999;
        Tue, 06 Jan 2026 10:40:48 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243ed62sm6788547c88.5.2026.01.06.10.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 10:40:48 -0800 (PST)
Message-ID: <6aa8ffc4-2fe5-44ad-8ac8-581e0697360f@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:40:46 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Add support for camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-7-646fee2eb720@oss.qualcomm.com>
 <20251127-steadfast-red-koel-8c9bc8@kuoka>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20251127-steadfast-red-koel-8c9bc8@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MiBTYWx0ZWRfXxVklVugVSSm5
 Z8aaWl9ZZ8nc2Hqmk2PAR7F+4R+1XyNNetojZJlUF05glKARNaTvohYdA3HVwIZltNvyFmxLzVM
 6yCUuPgAVIj5zSIpcVVzMVOkivBQpJ0fBssz2+48a7lOTInemqHY1deqYqfR+UmWpaj+DM/CHRN
 q6M3sd4yVh/MzfCvXbkvYreersOIJQyZ0u16FtZoWvOCNPDsW373hnd42D9YYtOam0Ws6u6tOKJ
 PlyuZthJmIE4yjN9Um/CRBP9tj//g+9ZJECjpKQzkJyOf1hss5ZmTcISDriCXuPVFJp0s80VtJI
 xHNllThwXf8DyTUWx27vVikVhj/ELPkZ87OiitebPjTm8baTDXABpWqf6ZGo36Y/CE9o6G3CcDs
 70kaOsCWJ5ch5lSqL8CDWUJFk6b03ecQ447d4mBqZh7ffKnR+P56rgJCZU7bffY3D7p0v6Y3A0G
 3QVMCrMpXhy5If2qmDw==
X-Proofpoint-GUID: ghuxWIAmpT2gZo_0MgFvX2SaI-oUkcAr
X-Proofpoint-ORIG-GUID: ghuxWIAmpT2gZo_0MgFvX2SaI-oUkcAr
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695d5732 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jRZ_Em-5SMcKJbQpHL4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060162


On 11/27/2025 12:12 AM, Krzysztof Kozlowski wrote:
> On Wed, Nov 26, 2025 at 01:38:40AM -0800, Hangxiang Ma wrote:
>   +
>> +			cci1_1_default: cci1-1-default-state {
>> +				sda-pins {
>> +					pins = "gpio111";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio164";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +			};
>> +
>> +			cci1_1_sleep: cci1-1-sleep-state {
>> +				sda-pins {
>> +					pins = "gpio111";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio164";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +			};
>> +
>> +			cci2_0_default: cci2-0-default-state {
>> +				sda-pins {
>> +					pins = "gpio112";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio153";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +			};
>> +
>> +			cci2_0_sleep: cci2-0-sleep-state {
>> +				sda-pins {
>> +					pins = "gpio112";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio153";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +			};
>> +
>> +			cci2_1_default: cci2-1-default-state {
>> +				sda-pins {
>> +					pins = "gpio119";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio120";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +			};
>> +
>> +			cci2_1_sleep: cci2-1-sleep-state {
>> +				sda-pins {
>> +					pins = "gpio119";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio120";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +			};
>> +		};
>> +
>> +		cci0: cci@ac7b000 {
> Looks completely mis-ordered/sorted. What are the nodes above and below?
Hi Krzysztof, sorry, not sure how you mean exactly. The ones above are 
the pinctrl nodes. Each CCI has two masters using two GPIOs each, one 
for clk and one for data. The ones below are the actual CCI HW nodes 
that make use of the pinctrls. I believe this is inline with previous 
generations. Have I missed something? Thanks.
>
>
>> +			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
>> +			reg = <0x0 0x0ac7b000 0x0 0x1000>;
> Best regards,
> Krzysztof
>

