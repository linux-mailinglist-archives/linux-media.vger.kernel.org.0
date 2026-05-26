Return-Path: <linux-media+bounces-62789-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJloKmCVFWpSWgcAu9opvQ
	(envelope-from <linux-media+bounces-62789-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:43:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD45D5B65
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08F1F300EE84
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 12:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A283F9F56;
	Tue, 26 May 2026 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWHz2xB1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KaufdMEG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52223F871B
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799383; cv=none; b=tg68QhuqHKNk3oZFRFsl660xtsgF67ZwY/uDJYIesY7OkHpE9DS5yLh7lPGnk35JWMe0X2Onj1jqmqS6Rkex5sCofY2AQwEutd+RNacGkl0V80F5ot2IhTcXlGZR/1lEG/QIKB5TjaiWgEGIiJGefgQQSNoBeBNM4z4nH1oS4Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799383; c=relaxed/simple;
	bh=JzkTMsq4LBq04bNQ646Iqxa4bdXXTQ0v2PavjRSkSG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJseei+SNjIheSnclGfG81NOMAkkeVLzjh0gwvFCIMQlTZw4C8vCc20JxBBnzwoJ7fI3L37Hpg5MT0npWCSmnub0EOdyVZPThQ2FiJV96hHjuWSNlWqUZ6Hp0+uAuqjJ2+KWqVZH/BM1uXEHDPrFB+w8ck+E6mKQHgpXU/l+b9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWHz2xB1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KaufdMEG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q9w1Rd004979
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 12:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihX8W0YEq0NRQmElD7pN3QdBk0a78u//vqr8HXQVxBc=; b=fWHz2xB1HOToHPzK
	gZw/bdigtCD77u+bLi8I3O6mBvAarxoPMEdlsN0QKufYKBaY9C6Xn+0kp+0A2X1z
	Xbar4Om9jCfz89SgQuuXLlZhCeNlqmP1/MsZtEHVUbtvRUPs6JKb0D9uKW5adnwR
	Czzd15kLuZDM38GstK5aPRZcfRoJLfLGqiaqO8ohXxkeE1UVPwUjttXD7wEngmGq
	Pl3J3hZTOnnxIfD94L1EwDELWXilD8hxXdPje1ya0v8fp8qebdk6cwlsSDrXPXgV
	PT1LXpCM8Sq9vLp0sNFWUBxAO/4x5b3qSDYC8UIGNP9iCPvdAMPobG/AODX3THYj
	nxDX4A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm03ngj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 12:43:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee34588671so11524663eec.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779799380; x=1780404180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihX8W0YEq0NRQmElD7pN3QdBk0a78u//vqr8HXQVxBc=;
        b=KaufdMEGM+/MqwoiY5dbXezjjONUibEwEvYbCqnS4KxrTBt9Dn6sxkhY7NILd8l/wz
         mHM+2DnxOAXzqMAU+4SFedt2MkETFkdfq/3oOz7/HrXkqXsJg5bscCyD0PfXyQFz3q4H
         JHcZCwns+Uk3xxxvmn4rxonN4f97BwEFs+ZkWL4M58/MGKV9meOMHzhYkP4KAssVuLzS
         g90oohMBB0b8Z1kLKjA52FxDksoVpI0eGfzOmOwidDlPZuFyG4udlsum/q/wmofYKoMg
         ZgsgoeaGE9pYauZkFx/R/Bk2+EsjpNEPk12sFDGfB4eNJPW3eMOjCHD1VzGq3O9eliEl
         +04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799380; x=1780404180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihX8W0YEq0NRQmElD7pN3QdBk0a78u//vqr8HXQVxBc=;
        b=dq5jwo1X/ffFIxSCUtfYYw464hIVob6wWxtH/b7XJMdudU2D/IxpZnRO7HhPMYvYiP
         J6Hxa8deGOVoV4lzkDpX9hwyPcSn8+tJAeEvFXasmUjg92Z8YdROr7gDS10hMuS4Xzlg
         01fO18AGtJgDqsZxkp8Axy4eA9N+Cihz+uLFvyWIppK80YBecpOAJk5G5Ly1LtCo+Esi
         X+fvAHQu1M0/adQVhiY1elM2yZgatJWIZNpjL3qbfADY0KUGM+TmzESvyUenY5l+RIvT
         KXLrrk/JMVuGkyJ118hxidhezxAvVmBMyVp5Vy//ea1ZZs3FbQssPkJ+yf4HNUGLa7Oh
         4JUw==
X-Forwarded-Encrypted: i=1; AFNElJ+rQKneeQlsVZ6zvD4x6BkbPI7RxnaO800JaDtUoIIMSjJ3bB6TxwHvtLDN8+yjZzVt+bG4xzRFJsd4wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCfVr7Duc9hEh5d8bv5ikPh3420dYrMLGcS10x1wUdKDQG+A2e
	YOi6vJQziPH6JfcFMDaKbN0kgDw0Nu4hx3oiUNAqxzIIyVYy3QMfCLD7adkuakdEyAMn951P7+3
	6p88/yHhpNBLXw7It4pYtzU6fiNUEIBx0vJ/KBp3Gx+FE4w3rSzVsFji/Bq3Cp9vdWw==
X-Gm-Gg: Acq92OH9E3pw4K6+T6F/G5/GIoGbNz/IS93fQaN4rQNV2OgQeYqdGkts+Loe1gsqGs+
	bsd6emQeHmlOK75BUvcuDd/tMOke843BsW+oMy51cR5w0Ep0FPbnnlrGdiVZqEYtGr0nlQ3YXB7
	vnsNt0CRqkV7RaqCf71C65ZdenUj+1jDKQDuNq+UDoNcHsNbiPHbOqyulFg1m6JvNFVlAbZvUjZ
	hYIXsV0GU2Xug6qfmjbM+J0N3fZgtvAQc4pY0U3yV9LPTpWwzmeAKx89BER+VbkoXA0+gFQ4vWr
	sv91wMLn9jxXuEWRwA03ZtqeC5fPBqSyfJAy/GQ1Jy7d7MFj1P9H/ToHwucQcbIn6IL172MNHW2
	cSNukT6paG9+0EG07S0UmCCD57iV/DVGUT4nHOQHKoROoAW+3fTEU
X-Received: by 2002:a05:7300:b507:b0:2da:a813:a5fd with SMTP id 5a478bee46e88-30449103797mr8471601eec.22.1779799380226;
        Tue, 26 May 2026 05:43:00 -0700 (PDT)
X-Received: by 2002:a05:7300:b507:b0:2da:a813:a5fd with SMTP id 5a478bee46e88-30449103797mr8471566eec.22.1779799379552;
        Tue, 26 May 2026 05:42:59 -0700 (PDT)
Received: from [10.68.117.51] ([146.0.28.136])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245fbeesm10486758eec.30.2026.05.26.05.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:42:59 -0700 (PDT)
Message-ID: <9ce2ceda-580c-4c58-b3e0-8d497876b7e5@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:12:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: qcom: iris: increase H265D_MAX_SLICE to fix
 H.265 decoding on SC7280
To: bod@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
 <20260327-venus-iris-flip-switch-v5-3-2f4b6c636927@oss.qualcomm.com>
 <177979911665.6300.11726562589723045774.b4-reply@b4>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <177979911665.6300.11726562589723045774.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a159554 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iVdU4/i4LgW7qdSeEk1S9w==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=bawNhQOPlEKnDeaCJUAA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: y7VM8I5yErhwkr-X-pFvxO0CXT2JzKTy
X-Proofpoint-ORIG-GUID: y7VM8I5yErhwkr-X-pFvxO0CXT2JzKTy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMCBTYWx0ZWRfXy+L/4yQmPTk8
 x8RxAVJ9inGQGG9USttqQhNsI1I0qfgPBA2Et7k9zl5YBg1iRg3Sp3FqtN1QImifs0tLoMfcCrZ
 dLh60XNa6K4qvnpU1Z8jk0KyIPtaT2y87+wRyhGnfCodVFm4iIXGc6X2UVjTunrQ2rnTDSlFEyC
 BaQqVnCcS98Scc1ypEjDWqsij/idc5Nh4NYXpLynUXeYqBzTD+PSm7OG7PjBLMdcrBxmBauBcTf
 nwZ98HK4mesoCFa1Cz3h8ymSY88kajmMVIBJvqvPW4CIDataYz8r6tJSvsgz+RmPEcvZO5euIAv
 Y5ZonDOCKHa5NXsGfR8ztzp30+e7Kss/uGG8PLFLJKAw9jAJ1eMLwHExHoK77evtaO5E6j8/teu
 rLkwgMlGY+WH6ehG359+byjbpsiC9oba+iIimCjQt2epZYjgnCfRjEuCK0+tP+4SWl7/TAfgIzP
 W4JoIrHVA7k0JDSK5gA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260110
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62789-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54CD45D5B65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/26/2026 6:08 PM, bod@kernel.org wrote:
> On 2026-03-27 22:19 +0200, Dmitry Baryshkov wrote:
>> Follow the commit bfe1326573ff ("venus: Fix for H265 decoding failure.")
>> and increase H265D_MAX_SLICE following firmware requirements on that
>> platform. Otherwise decoding of the H.265 streams fails withthe
>> "insufficient scratch_1 buffer size" from the firmware.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> index 12640eb5ed8c..8c0d6b7b5de8 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> @@ -67,7 +67,7 @@ struct iris_inst;
>>   #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
>>   #define H264_CABAC_HDR_RATIO_HD_TOT	1
>>   #define H264_CABAC_RES_RATIO_HD_TOT	3
>> -#define H265D_MAX_SLICE	1200
>> +#define H265D_MAX_SLICE	3600
>>   #define SIZE_H265D_HW_PIC_T SIZE_H264D_HW_PIC_T
>>   #define H265_CABAC_HDR_RATIO_HD_TOT 2
>>   #define H265_CABAC_RES_RATIO_HD_TOT 2
>>
>> -- 
>> 2.47.3
>>
>>
> 
> This seems fine to me. Vikash, Dikshita, happy enough ?

This is good from my side.

Sorry, if i forgot to add on this one, adding now,

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---
> bod
> 


