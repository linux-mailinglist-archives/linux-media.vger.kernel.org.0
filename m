Return-Path: <linux-media+bounces-47239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 09660C678DC
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 06:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C2E33661FF
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 05:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A474D515;
	Tue, 18 Nov 2025 05:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f25IPHPN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTOjUvK8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0302D192B
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 05:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763443337; cv=none; b=LdZOJF4vLNAMZHp6u92wDBYkfo4Nnv01sESxPHemPmzx1MXj+9/A99c2w9TRKdx6Rce2mr97p452nkEOlWMPJ5ZVPgv004xgDBqGwgnZHV0vteV+bZxHZQNCe2xyU1WuwRrzmSKQkBiCwmzBTIL/yJzAZmhIEgZ/2u72jyGfITw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763443337; c=relaxed/simple;
	bh=xRSbUtDjphASPzi77zs/SWi3MvRmI4rJ7GDIFx7mpLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NivxT3VrefbtsNauV5fP+Q1KME71EQVRxAIzBgLrn0FkJO1Ei84TDTjZaEospqEnKgmEE6cDKTjeTrFL/i4Zy5uzDidDASMI9K9AZOiCX6jMJ6y/i9pU5XNVrzRuuY7fPc0zc2VRXnkZb3AnHG2EDDfHqwB3mL8uzqKT42dHTqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f25IPHPN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTOjUvK8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI1MKQ24166706
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 05:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xm3j6ZAQUkCoBb5xNFFOGfHblUIkSU7KVoSsfYylsg=; b=f25IPHPNxsWB0tYg
	nTrImnNALkjP//PXl7k1FKWxdQJ9IKkT+32JeDt27IGdsJpV4lIuzgBBb0uQpvZ8
	WJm5+cwOH7Rs7yni/FRuYytjPr4XGYHZC/yN79LIngqRsc4A4e4bF0n24D7xT9qG
	mXqXr2Zw8SXzak2GlQVK5iwTBlv9O9hO2GMKWvNl4hn+JCH1wV6jA8PZ04k8V0w5
	WwisxfSB/d3t6w2IcbiwBnNT2XoiOhfK/wZH6YRbSEvvstDlvO0Wqu0rgkhou6rW
	AwPnz+jSZ569Yf9xszj+10x/lsWCtBoEWtl+t5za0PSYz9p+ioWRBwm7SBfIkXti
	J12SaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag593t9g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 05:22:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f3710070so94732895ad.2
        for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 21:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763443335; x=1764048135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xm3j6ZAQUkCoBb5xNFFOGfHblUIkSU7KVoSsfYylsg=;
        b=DTOjUvK8hdI+zykEN1xey1/jNPLOtduCVEkFDoDQqsKrplwsWwaH9HgLWKRpJOQR0X
         cNDsLWi1PfML8rPKZcBWflPnRL32GF12bFKhyoEHWKyRYy7n+uybtS4nq0rGt2v2ggcl
         NaChaK4wyIkCDZ56TdU5HRaALRn/79rqcK1JTMI+bFdYNtqHGBpRT2V/MEljMTVSl68m
         lGjHmORum1r+mfKzxshNClV+IdEU1nkB3wNyWkEQ9dqv4atbvLtm8kKepWyk2KPh1L4X
         3do7RV2XAfpS3DrUE3FEFknblHA9pRgGlh/uCytWG51jNZr7laySnbe23NI6rPoL8fA1
         yW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763443335; x=1764048135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xm3j6ZAQUkCoBb5xNFFOGfHblUIkSU7KVoSsfYylsg=;
        b=s1LuC//ff/3mA3ZIqVAnxrA1YfA3knrqHUqY0uRbSOEtCt08j02pQtuu1+EDbkqMjV
         cWWzR/baSRJXZBNs257oj9aHhVcMarvujGaePuwj6M0C+fR+Xm1YDgTbIHtV7vBEfMFP
         beslf471hkHfL9uuEi8PBDSsvYjcZPwLh2eV6+ZOarhzuV5d6aK+M3lylVMfmG4xyT59
         TJWomIqYF/udmauWOEGVHSINyyDADSi2U0SycZJiIBTwTxAnpUka7bjeiHMcEg77NkCv
         99Udq44gWp9YULgWQTH6R48YRbHe6PYohbgEhxsgSxjgHce+bmSZxJ5tPAL2jQAHlw2P
         0sYw==
X-Gm-Message-State: AOJu0YyKqKV19AmJUJFULQzM5+dDG1hFQ7SXCM+7k0cttHJpfhLaZlHz
	WVN5cAUyu51HYgp2jAyGoF201rqtjkOj6q7xjoOVKOWYwv9dz8RpxIA9Y+t00JA3fKZd/0LwAh0
	3DwNZk1tcWpm2SRLVb8Tc1rHkMY4i7T8jzBmsFikTAaEBqMJEelCsU7OKpPlSj8IzYw==
X-Gm-Gg: ASbGncsjkXeRqRXoxgUuWcXB9RQv5CsLSDMvSoznugX25GBzbFM0nEgZcC57q/M2lqy
	t6jwx8fEoUu386j0EaJr1J0N8H/4/4LM7S8IPKZbMGyvBOhj0n47+ZV11ZivYHSWDWx9Ko+1iA7
	eW+1ZVk9CXwmSpora2l2/rvkk1RIrT1uA7R6yUbp9j62VPEfkCAoNCpgVongTfKYgYHoRbA736D
	emFhG95xeBkUcetCLTU9tmqCL+ih0Noi5OQbU3qOsz0F6MJjD4FkLPvv39x9Ybdj1iO0fRhi4H7
	l/GNXzQsJhtYhjJqloGFaIRDsmCbSpAjm6fc3I1dDUVcq7t6v8LDxqH7Riyz/NPKVl0HVof4gVC
	nSqkAJyU7KQzWARq+T2ZW+3JvBmf8mf1H7Q==
X-Received: by 2002:a17:903:b0d:b0:295:ac6f:c899 with SMTP id d9443c01a7336-2986a7556bemr164116685ad.47.1763443334654;
        Mon, 17 Nov 2025 21:22:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErawagGA4MsAgntcV3g3quJ1MdDXXJQL6I8uQOZUyaPuZsZTIqVVXR8SqrMIcDgRS+JSrbvw==
X-Received: by 2002:a17:903:b0d:b0:295:ac6f:c899 with SMTP id d9443c01a7336-2986a7556bemr164116375ad.47.1763443334170;
        Mon, 17 Nov 2025 21:22:14 -0800 (PST)
Received: from [192.168.0.171] ([49.205.253.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234870sm159705935ad.12.2025.11.17.21.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 21:22:13 -0800 (PST)
Message-ID: <2d377b6e-0ee8-4017-b0a5-f6e4e5622674@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:52:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Change psc properties message to debug level
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        =linux-kernel@vger.kernel.org
References: <20251110072429.1474615-1-busanna.reddy@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251110072429.1474615-1-busanna.reddy@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=691c0287 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=qKS+5dAnvCMTy05vH4hvkg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uMTuLg9HXLKMnMOSmRYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA0MCBTYWx0ZWRfXz+KViZdo4GIM
 u6Z16LXBWYHyvGLijOsH3CPZtJvS+wd/MI7wvnVFMttx6JZCfHqsyfwso1BcQyDK8QYbZzs3TQd
 trp2oQRWqWrG9kk0TnKK+dP6Gll0CvzN00AB+iZhxA1qlLT/gcr3z6OT5AyuIOxxsRvXaah4vSa
 IHUj6jKOzbC6AfHuVmoZvwqmBOyukjb4D6SrIx5kJF3RBY/BPPEM8nsXRAkMYUAPj7Vd9UFsiUj
 3aeYFRUOFwjN6KFy8Ks+7Bl7SvYR4fGHU4bl18Vu/HkQ3t8jYnKf6L+1+gqJ1g3SI2d+/N7oJzd
 6p1JXC/79H7Q3RHomQ4ZsU//APr9Tc8BMEp/gWJ/DRVX/6f95vRjSEG2W8Ftda8pkpsq7T7d6rm
 L8HVHocn6lk8Us9/H9AwjW04Jsj0xA==
X-Proofpoint-ORIG-GUID: seEorCq6YYdQ2RiJAkBpQp5XYbPBm0vr
X-Proofpoint-GUID: seEorCq6YYdQ2RiJAkBpQp5XYbPBm0vr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180040


On 11/10/2025 12:54 PM, Vishnu Reddy wrote:
> The message for attempting to set already configured input or output
> parameter subscribe change properties is not an error condition.
> Move it from error to debug level and make it more descriptive by
> indicating which specific input or output psc was already set.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 6a772db2ec33..ff29e8a4808e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -760,7 +760,7 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>   
>   	if ((V4L2_TYPE_IS_OUTPUT(plane) && inst_hfi_gen2->ipsc_properties_set) ||
>   	    (V4L2_TYPE_IS_CAPTURE(plane) && inst_hfi_gen2->opsc_properties_set)) {
> -		dev_err(core->dev, "invalid plane\n");
> +		dev_dbg(core->dev, "%cPSC already set\n", V4L2_TYPE_IS_OUTPUT(plane) ? 'I' : 'O');
>   		return 0;
>   	}
>   

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>


