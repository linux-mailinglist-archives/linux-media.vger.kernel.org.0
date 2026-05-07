Return-Path: <linux-media+bounces-60803-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMqDKuuR/Gn3RQAAu9opvQ
	(envelope-from <linux-media+bounces-60803-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:21:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5067C4E926A
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED85C3004D2D
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C423F7883;
	Thu,  7 May 2026 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0A2tmoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRl/Yiqr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125913E6DDB
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160098; cv=none; b=To0f0GOB1wNKOAQr8OaPa8Qv6vLXeZlIgBjwlVchhm7MecGLEV1IQz0W4fcue+uSlWXvf2XDUjak+bRda5t/pes9LZp+FzYuFvvFU/YO26BM0xmrj/U5w6w/cCVmOLYbyU5S+nt0PZDNoY0duqwmU38QM37gmfR7E1UBPGAfPWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160098; c=relaxed/simple;
	bh=lrnPnFEbAQ71qKyoRi/oTl/odGj3BbrIpPuyNquAcUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W1rl6o9ltbChwFVYN4lNlGNyQaWLG2gz18EttLwazuN5Ek7a/z/NC/yLzH9ukPp3SzO8c2F2kZDfSENKUhJcTYJomEOLyz4mrjE03WPkDVVuox1NJlDWRKOKP+JXI6b2OCDfQBQUlT1kGH++FKtqJ44cmyAe32WxnyAhh1D0w4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0A2tmoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRl/Yiqr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647C5Xg61971721
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 13:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g5vv1I/V+A5zTMBuWbjN/T1XXIXllvN0Icg53W67xC8=; b=X0A2tmoZwkN6rwYc
	Cv5/zWMrESzFiRugCw/fCcoeN138BxC9BkM6etNrh6mT52XFjFh54C6mv7oZdZ4o
	UE3SYwnHZ7zlFsQSMZlE523RtoTObiSlrtq4Ksj9ViuQ6X9uTZf5XP5iFeUCmBhH
	AzWYffXFH+9Ht+GFIx176H04CFHjCqrbhtDXmxLgJSEUTsMOIeqmI/bAo1oeXPEn
	QkgLTCF0Ky5J77Gtw+xxHPpwy0w30OdZouQOOul8G3Duo8kTmD6Ld/BWz7oWSYuv
	tSdy1wZxZlWZ9khBuiFRHoqq6ZtNUJHev/7t3eOB0Paa4Cr2nEiwnrQjD/ezr2nh
	LQkiaQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tej88qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:21:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-835417ba8c8so472641b3a.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778160095; x=1778764895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g5vv1I/V+A5zTMBuWbjN/T1XXIXllvN0Icg53W67xC8=;
        b=YRl/Yiqrcc4kIp4Nbupxgq9lI+G1/EhqH/GQGuPQqZXTr4Fit5tKzygPR+tLs5agFv
         3QddUx8eWfNVhSvYcK+g4Sg4Hg3VwXksGNtvQawrv9z/2J/1LCgy3vmLCkc5bq8Ojcgn
         BOE2ck4JoOvjFqkf8xEBSdZ6KGTMm+jCcbM7gquBG9MBH6b3PikO1gicr6PzN08xgqZP
         XdE1rfGvwMv14tvfMJyzzlnV+HzS2Tt/BG5lHwHit/123d5VuRjqRzsXIKiUpK5AlQrO
         XMOH7M9aDdyzGzDOaSvxYyozJojJ2eVFrML7FxdU2Td+4ig6zyMzo/xQcBFYVs4PSrb6
         O/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778160095; x=1778764895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5vv1I/V+A5zTMBuWbjN/T1XXIXllvN0Icg53W67xC8=;
        b=guovb8V9fAWoT1qdQ3TR0zjcx4ckjugS2n/6CrV6aF1JZ/GtBsaU7ZLTFUBUGMc2Rn
         cQPiAEtpeVlQSI+6dd30OwGq45da8fZMLW8xGxgBEogDjgh+dtjSC2YCczXkiE7jm+tF
         rQaSHLlfiSqn4WIQTPsu1cggB2t0+UhewD3LlCbSLrjyE7+PiIL+/ICEwp0b3EDsH+/V
         rLZs6LsglFwJNRWGRGov7uzxL2kZa4CmzD+F/GWSLK8Mu+EGYO4IS4QqRxlbsE7hVGm6
         1oIt5+/7xFb6mOqUy3aHqiXDLW19eV+DgdrOpB/yR+JpgxVsZetLZZLaQQ81ekHebRID
         n1Mg==
X-Gm-Message-State: AOJu0YzQBz7qxtJXhp/cDvrZw0U/4FlMqrz0SU4PlorEZNR7xbiTe6Ju
	5xXJb3m622edL2IR6b7yvgaPCcczE9+eqzb6Vxe68Ka5JukjuwzgaNttbJr8QiD4Hk0h6Dz0mY1
	jyRPljAAzjV3NSDy+tt8g05zZaANSogofjKQ5qKPb1iZVj7ydjd34Zv4n2OsyLLM3cg==
X-Gm-Gg: AeBDietLMtxTrcUol/ieGj28V+S1Ec1PUJ7Zeipk4Teo5srT7X8EjfCP/5iF69pd2zG
	ZN2JcW3nAM4LJtZRp0Ko1eurHb7hgus8AeRzIcAp0UgaRYDoieTX54Lc5AVTHgY4/MNJCVX41v8
	25NZwys6d4SU2KnwG/hQvR6BTfAFJE3gKmoVgt2iJCNVBaMCchxbbw4NL8PU813xOxVVWCIlVba
	39Sc64cvMEmkOI9L+ei3OSx2Ypd8/ltqjdoF0bZYTm+dYBX7EtBpIFn5sMi0ImstlRRgpXjUTRq
	AQS0t+HgLCWbd8lBwp6F248Cvvq7BRWXSTIw3lxjvoowWRd4S4UnHUk9QrkU/rh70rD8MEmsMN3
	0yJF2nyBS5SefBislh2SVJOtG615XlenMM0JwO/RxmSG9Ot0uyKbJHcEBDLIg/S5WSKU=
X-Received: by 2002:a05:6a00:12e3:b0:82f:453e:3863 with SMTP id d2e1a72fcca58-83a5c2b6857mr7738883b3a.22.1778160094559;
        Thu, 07 May 2026 06:21:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e3:b0:82f:453e:3863 with SMTP id d2e1a72fcca58-83a5c2b6857mr7738853b3a.22.1778160094005;
        Thu, 07 May 2026 06:21:34 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf7d2sm11894566b3a.49.2026.05.07.06.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:21:32 -0700 (PDT)
Message-ID: <40c9039f-1f23-4d7d-b6e5-3f1434875f26@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:51:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
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
 <20260507-iris-ar50lt-v1-7-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-7-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMyBTYWx0ZWRfX3t4G2ho4yzLh
 GmK0iG+/M6rgPZihECuizVGRzm3LJV2QCaflABi58JA/0bTx+0HmD3KL+P8UHED4wuGNIGr8obH
 xVpRsQ2RhYGMPd70aP+myAofgu4vm5aRCCl7/prtgb8iaablfTxn8AUeweSsqZorARXxScbmh3Q
 chWTrxQDX0Mktwpqhup44yX800mMWiLser+JRT9IwG3OZvwBnjeXV/A0WjfrfCo2NTgNtzFU7kH
 BalEupkL9H1Dqe0KHNCYp5exan6yC4j4yRPmyKoVVbVV3bQvOAkJcF9jlGvujBN5pXA0tWVghbK
 1lHSeIrkPYlbfY13KDqsYAJJtL1667cAble6g2tcFlTAv8ovYYVno+aysr4yphZM9koJYwTlX9C
 nzgiSH4yO+lJcNUnuRKd7CU14l2nhb9BDiJzxjvcWo/87BJr0pbHwNS2je5OLlFZgnkIWyVj6Y9
 ciL5jcNalkyzBOIBcbQ==
X-Proofpoint-GUID: 4KvmO4IraRWR85TgHtQllR4KcIFgcmWv
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fc91df cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hIPIbg4ErQybsv8KxtcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 4KvmO4IraRWR85TgHtQllR4KcIFgcmWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070133
X-Rspamd-Queue-Id: 5067C4E926A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60803-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> AR50LT require explicit instantaneous bandwidth (IB) voting in addition
> to average bandwidth (AB) when configuring interconnect QoS. This
> requirement is due to QSB (Qualcomm System Bus) 128b to
> QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
> which is not needed for other IRIS cores.
> 
> In preparation of adding support for AR50LT core, introduce
> platform-configurable IB multiplier and enable IB voting for all SoCs.
> Existing platforms default to IB == AB, while AR50LT requires 2x peak
> bandwidth.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
>   drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
>   drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
>   drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
>   4 files changed, 9 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

