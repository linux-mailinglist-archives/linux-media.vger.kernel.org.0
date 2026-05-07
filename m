Return-Path: <linux-media+bounces-60796-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHWFFmmO/GlhRQAAu9opvQ
	(envelope-from <linux-media+bounces-60796-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:06:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAD24E8E2F
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B97A030361B5
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BEF93F9F31;
	Thu,  7 May 2026 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUaWZ3pR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnWinskj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8843F7A80
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159006; cv=none; b=OflqaEyTcwvKuwxrNkkzbwmklhv4CFke2dUB/tkKBVlK7Z3x6Jf3cr/jOH887QDY4mWw/oIoymSgnyqrSJC/q04XMsrogIu+yobM34+cY11hk/mdiz335wDB66oa64+LW/ipNYNTSIA9mkos5VuRIjIEK8UO9zJJs5Cb2r04W8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159006; c=relaxed/simple;
	bh=vJiIH2pewqKneHp31TdZCQ+a0QMzbohY+H1SKY4b1dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Upf7dX3i4OxKCrm5dQNiQxZu+FW/QwLpcx9Enpgbeqw39XXZQUWa2ExpDopejNP4r8POZszVqZjgS2cAbI/ydg/qQcy8qSHGHEwkex93QmzfsZ4OWcC5v4uvUO2eERCHRpZ9pt9UJMBx+lHRTEYCKsKfDlrIVuj5+yR51zQggTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUaWZ3pR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnWinskj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BTIVK682791
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 13:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aF+Unu9Vo3GgQV6EEPlfZ35/SdyjsFQJgg1NBm1vk3Y=; b=QUaWZ3pR8E53eyfV
	pcyfe6Zy7wOmBCA7TQFvnVTgQI1UM2TmpzW2FLlYAHlta6FCoz6zPYcDg01thtLD
	Zc3xTXUY9JACO79ERnp6ETDT0vMA3TEUmPIubUq6Lpfa1OrfCOTG5zNx8E7Brl4U
	jREd6TsABSwTHHYxWkRr4sYXiis6lHmLMA1jABR1aFsIuY2o1ateoGea5YwUWZj7
	u/H4PxyZGIhu+vDYTtkE1h65F5Yt2t+lP4lXAuEsUCIk8D9n1QvpyS2alp5s0fMR
	VgSVUIF25eS6ljUreTVQp52G9KY+nE9wp6zh+lVRXNV0OYnolRBgOewFiLcPloZV
	lX/HKA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhasmwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:03:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365faf6006dso948366a91.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159004; x=1778763804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aF+Unu9Vo3GgQV6EEPlfZ35/SdyjsFQJgg1NBm1vk3Y=;
        b=AnWinskjRUGvofqlpQrlZMaXRqJbXcnM7WnArrpmJu+YXtXvi4M+NT/kQy0ypxJqcj
         1VCbAAsLeprcNIxkGawgQBAU0I7l8pphcLaK8iTS1HlaWr7D+wHFkHlWX0uWTTHrZdam
         ZfmefcXxRd/FQqHU9edYjUUqLnuhQpMAPJhP0+SQlDwfDgBqCy6V7G1yJOcwMwSC0YrO
         VisVttGcm0+V5tjQO1domzafebXrK4phFhnDoXjXK0jxhbAyTnytTlJ8bmijj5D859UL
         j+vY5tututhSPqyPlfsHiRGM/2gpO2Op1Js3aF3HzJfiOLCuaJBpfB5TqtxfFJG9J6OL
         eOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159004; x=1778763804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aF+Unu9Vo3GgQV6EEPlfZ35/SdyjsFQJgg1NBm1vk3Y=;
        b=c249QBMVVY5a5QUC1J8WitUTfgd+TZrA1o2YXjETBCjOCndcE30vt/p3WgjCgl5WEE
         ePB3T1AAeW9VVy8rSGbuMmEmH2Z/ReVpGBwaRqWrbuIHPgmUGcin/j6ED9h4KkftlRlj
         ALNWfQfO2fsPp+nP+B37BXdWtfwo/M/PPKXIFxLok/jWtrf0/U0/MQf/vrYzAhzcT0s+
         ilpJoLYi3Oy2AjlDHfVNsjK37J5X5Vv5ETXUNymATB90S1bboJ1ZBMF+zUVepzsFGSU0
         ztigDbtONZZrtP8KFNckqih9cdnHYVvMRGmH9xTWJgNLoq06NhtEkKm4jgXekY4IzOU+
         hZrA==
X-Gm-Message-State: AOJu0YxQdyNRovNw+jkN4E4u1QLrvXetuZcMDAdHPoQwr21ejAozGpJp
	lPZELK3lp9vyowacjYwLJtkBUIAD1TOcgrj6LT+si8SlZFQv7uBumxM2Eqg5j+cbIQmz0QkRYTu
	yK6jupeYp9ur1tenXnboi9LMHYCpIIc4gxHHT0M+YmmCwLehpCvPw/S34SSaay+WWOg==
X-Gm-Gg: AeBDietmMv9rUf80UDt+EiIedne4VbjXEynP0oA6fW/C90wLYBEZ/CN2m2opnFE9x0G
	Rv3fFOc6SjeYFLtX6JxRslFDyVwpIDPF8cyRz/7GLzWrEbpLs+ffVOjQ6CBLhG52/tnNTrIj/E8
	P1kmcWiRGjDAjEJaC3Rrk3q50yHEUD8GjUqvt173HW7p7XIoNcNLOVQGOFT4HqRX7EzTKNN0ocW
	jYQjlMuUhniJB6rVwl+NjsGoh1UwblFpiVzZyQfS87vKyMCgsDivNy62BUq4svFtC5/KwsThXw+
	qxMB24tu7n0VXiSEEg5c4bkeeT1J7/KtV+lGleBNfy7PkYTKWBudBRyyPsxEbpEHlJxnq3FmRHR
	M9gzV4F35FOmPGASn2Z9v/6jK5DqZ8H85Pjh1ok8OjXXC2BqJXQnceXF1N9XhjpxMC0A=
X-Received: by 2002:a17:90b:5683:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-365ac080573mr8033183a91.17.1778159003682;
        Thu, 07 May 2026 06:03:23 -0700 (PDT)
X-Received: by 2002:a17:90b:5683:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-365ac080573mr8032897a91.17.1778159001761;
        Thu, 07 May 2026 06:03:21 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4bc7558sm6142429a91.2.2026.05.07.06.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:03:21 -0700 (PDT)
Message-ID: <f84cbfdd-4f48-4554-91f5-72c90384316b@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:33:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] media: iris: Skip UBWC configuration when not
 supported
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX6GtveSmbIld/
 vobUknCvmO5jr2YbOZL7qrhEXcXmqvZLw7HYxEpXgN/FGpdvKr2xA5ERvq1VAOA1Zd1defpKVr/
 n8SZzyXH4MdlXHjwFj4p7TSPZjZIrpIxqwB4qjsVPo93m875SYNoxYAxbHSMFVPuV4yAUmhumeu
 bBFrrIghUkxM31UQyyl3oiBLl77crqXYl8qQEHrL4mZpuOAWT0Vlh2NcvINUpzkJXeMNEH6+xiB
 NKj0BLjutNZBmq+rnmwvZdYacdH3iv7+VpHA8JrGYYeKU9Nhs5GeLJBhJoQqwvCC8r+cD/o21jC
 pQ8g48ZC8KRT+urQyDlEhMqVsEMPA2bfqQFbE5X0O5onuc33nivfBWGFTaW2PW50dKR0FcsEj+e
 jPmHMLrZe0wxabVovPex0uUQ892r5JZeQQ0ohC9d+s1U1wqxgFHBJ80o0X9rwRNeavXgwytkskH
 N5WDhvEwE6BbvL6XjKg==
X-Proofpoint-ORIG-GUID: TB2mIoLDqNQuT4cbBcaNAsQgSReIFsbM
X-Proofpoint-GUID: TB2mIoLDqNQuT4cbBcaNAsQgSReIFsbM
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc8d9c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dl9dPoTF8b8Ju4ANzBEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130
X-Rspamd-Queue-Id: 5FAD24E8E2F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60796-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> UBWC configuration is not applicable to all SoCs. Add a check to avoid
> configuring UBWC during sys init on unsupported platforms.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

