Return-Path: <linux-media+bounces-56808-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGDXKl4lwmlOZwQAu9opvQ
	(envelope-from <linux-media+bounces-56808-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:47:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 356A030268B
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3E7C3056B5E
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 05:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DAD12E1DC;
	Tue, 24 Mar 2026 05:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHBgmBlo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erSA+aSw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556063A4528
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 05:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774331174; cv=none; b=hoIOKJiO3ecuNDDs6TUro7RaP8LVI/FJngpL2G5EraYoKRqbLiKQeT8Rs2xNFD8V45CWDHSzfmPsdY2jEt0CrTtijqQ3ObIGirGX5lMBGRxorzCCjVN1rg/Qw6csNIoi8Vs2tXnwUnNBLd8Vi41Hh0oMptwpFHTh3iOa/gbk1VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774331174; c=relaxed/simple;
	bh=mhRBTwptysF9JNl9u86v42nktnUR7haDgpBPxNG7d3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdJSOTGfIzMIyec/rWYjZWV4QdeVrNNJWJLNzxtAdwWvIeYhijDnE389W5n9RednKChUycKkNEsPfFzK1rGrvK/hQ1OD53hd2GeK7Xeql7m78qwU9IxwUvMGT5N7H/EKxQE//nOvePCZyOIsek3QTdTzmUCZoU1qDCh/ZBfKVqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHBgmBlo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erSA+aSw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3cltq362526
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 05:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4uXhAnSSGY4kJm4zK0iSCHMV2uOsj4LTcab+KE2uMlQ=; b=eHBgmBloYcRM9u6R
	MZLky2+ZXTsDQWNH7n1FiHziFmUZtrQFJGZBJZ5iCJ+e7Xq2XdVENClQ/A+DGRiT
	BZI5QtbbESdcsfoR6FYvP1BuZS5Dq2NtiJiTs7GjScR7Jet45iZvoHDjKc0toiQd
	UvzPgqVjeYIibgpAmSa9NxM6JAHho6zc7R5MsZOqJtQmO1k1zDNi3AGrtpbhcLiq
	BfnHO3cFyOhbl5lCjR9drbt6WLRCq7atkwXJ1uEla9nbwOBU8iV2RwkJmJe14UcW
	+9hdDGtP++3kYfcKyQSlUCJOTaq5SB9fRsac7dRLHoLaY7fCr3bp78ZZ81C6R2DM
	XyKnjw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k33pvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 05:46:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c3e0be5ccso12761096d6.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 22:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774331170; x=1774935970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uXhAnSSGY4kJm4zK0iSCHMV2uOsj4LTcab+KE2uMlQ=;
        b=erSA+aSw9lTuM2cnqiizUQoq09JgazNvh/FGlEwk8ch5n2anq7YRk6iEPvBKabtFky
         syYTsTfoFHN6Kx4jM8/SmgTEOYwvE1WrKAxzxD8j9257EfC7DQZQGtF9IephEXl6ini8
         5Aol8oPzHnKmcQ01uEPenx92joKV6nfMRwq62tO2/G7mbe2G+kOTSpD+9MoZrTCKGLvu
         zZLx95iLke1XrrBQYaVR4ewkKbMuQqk/E7o9ZuLzFKTdd9lj0535T6igwLHTBWnjLFtg
         qQ25IEXJ4/yE22FsIPbYAOX788wvdhmvjeibiLItBXYDOzlc8JeLCxpxwjG+Z6NgSaiH
         DmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774331170; x=1774935970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uXhAnSSGY4kJm4zK0iSCHMV2uOsj4LTcab+KE2uMlQ=;
        b=Qw1zD5su69OzxH6njp6IuqzTzM4yjUUfoIwKXQ/R/D0xY4fNgSlxN/Kc0o/qONBDp6
         cpCx1zo3TGPD1opn/vcwLTeXrNNjJSv/2ha73fB8rhMDt8swT0D7OYRkr09kcDimM67E
         YSLk5WIUYkne+woWZ4nxHOmvqshZp4HvGj9pnnTcpEbW21sS4XGEXTkphFl/h9u0TLzZ
         EwoRlUcVqnLUo1zmXwRKtnk7LJXryxTMd7D6e/7B9gUvScDuQE+XSe/00eJ84ZN07I/0
         +uSdM2ec+DSfKEYGrZv3goVMZIBW0e44RAWe7vRu24yS5A+9x9AVZ6SQj1h//qAtaSzk
         6TSw==
X-Forwarded-Encrypted: i=1; AJvYcCV/qlXHeerE8gY94B2UpDvC80PtyDeLJAw4TRSFAJtbqSwU1bfsdjVhL8Y9/F7zdWEcKWPPxrv2MXHblw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywq/gNmga4qHYtQ5z9lRqVP4mp6Hx9vZG9fDs6GUEbRwU8Z3mJ
	FmfbMM9USuGbrYVaciZXjwW4DPPJB4XgFnxFvCe2y/1tb6xHaVBVA/2q+yjQGEXsDXJuvx7Ull8
	zSzl9XC2KbqM92ZoYaoE3igfyuPukvFNi8HMafzU2l3xiQ0/h8Na7123271y4rcQmQw==
X-Gm-Gg: ATEYQzzZaxNeAJZyGg9mHJY9gM2g2QImu8F2G9t8vHczw/vOHrCH6DbPi3WC2DTBclI
	2zCe5LFgNyfAju3x3Bh93mxpkmHTv452TBmKKdUEL+sW8FP/364/qOuJ1qin+1gt5rfoZ2isj2f
	QK51VIG7w7Og1wLUoJ5zBgknBTEyPhQnVmk/IeMNYLmJ378qFqhHlIlBHAAyYCHu/Eakv0XNd7c
	DbNufA8xWdAQl5Ecq8W5Eb+L263hjTpQvaurRU2KDzaagIDJ5xxbtOHSbbIN1Tdk63GF1noatgn
	877XsuV45Q/lwLz1Mc/7/XVzgGxRXS4P0h+FBCeb5ksaIUlZ3fYFCj4m6ET98YzHykYuT2JJf7n
	nQc+J2OU5gcUuT1Uz7MhcLe4wgWXeTlJdlz0+1LNEL+7uCfpdFulK4D488tS+X0dol/yRssbA/t
	FLaK3KeKCcWA==
X-Received: by 2002:a0c:f101:0:b0:89a:e77:1f7e with SMTP id 6a1803df08f44-89c85a9537cmr186281166d6.35.1774331170567;
        Mon, 23 Mar 2026 22:46:10 -0700 (PDT)
X-Received: by 2002:a0c:f101:0:b0:89a:e77:1f7e with SMTP id 6a1803df08f44-89c85a9537cmr186280926d6.35.1774331170106;
        Mon, 23 Mar 2026 22:46:10 -0700 (PDT)
Received: from [10.111.162.220] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85335402sm130932366d6.25.2026.03.23.22.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 22:46:09 -0700 (PDT)
Message-ID: <2a786e5a-bace-4442-93ba-ed27a13e06eb@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 13:46:02 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: talos: Add camss node
To: Bjorn Andersson <andersson@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
 <20260112-sm6150-camss-v4-3-0cd576d627f7@oss.qualcomm.com>
 <acH_30LE_xHXneqf@baldur>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <acH_30LE_xHXneqf@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c22523 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=8aYgeAFh18_nvhlzcWEA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA0NSBTYWx0ZWRfX31BQQYCNBkH8
 gVPYGRkInPTfs40tKxKOfV3nxQCdR2zr7h0zD7FEeLxv3m1wK1OJH0EvqHDGAcQzkMtikYfQEFO
 NU5m6SEJKWbLr7We4E3V7ovisYSuTbIT8dfwa4WgglZt+QepDUCUQ47HMCmcqgf5WX/1gfpg7a3
 cwpn7TBEZo4+TT5PzL4mLbMNMSPgIypcmmT7dU9bLeWBT9AV1P2oJ37OLns1n/lgXlK/yXbw8I2
 oVepsb+x3c7F9EYxHY6zce+o1wUkh62TP96AS0nE08vd9jmh1fXshg1WRbvC14+QOrifXXbPf7q
 PaSegYQVxLiDiH+x/sPP+jgnTln9ZODB8RZd7hmXi3o4ucMEVKw4T3cOKhnohCiVdOCm8oes7Rk
 X516ACKK0NMzeIyT71O+YIHLjjsJQTsSF0+KKNTS/qI2uN6ECpgFzcp2oILicRlCk+QW2iWJcTo
 dRRwoWYxSlxkNiLtBOQ==
X-Proofpoint-GUID: 7RYhGO0VCEbvqcO23PdzYvxwB-JvVfkd
X-Proofpoint-ORIG-GUID: 7RYhGO0VCEbvqcO23PdzYvxwB-JvVfkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240045
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56808-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,acb3000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 356A030268B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/2026 11:07 AM, Bjorn Andersson wrote:
> On Mon, Jan 12, 2026 at 04:04:54PM +0800, Wenmeng Liu wrote:
>> Add node for the SM6150 camera subsystem.
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: isp@acb3000 (qcom,sm6150-camss) interrupts: [[0, 464, 1, 0], [466, 1, 0, 468], [1, 0, 477, 1], [0, 478, 1, 0], [479, 1, 0, 465], [1, 0, 467, 1], [0, 469, 1, 0], [459, 1, 0, 461], [1, 0, 463, 1], [0, 475, 1, 0], [474, 1, 0, 476], [1]] is too short
> 
> Regards,
> Bjorn

this is old version, v6 has been posted.
https://lore.kernel.org/all/2e13c91a-6d87-4c2b-8a98-0b58f97023ed@oss.qualcomm.com/

Thanks,
Wenmeng

