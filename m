Return-Path: <linux-media+bounces-64128-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8IIDHMVfJmpTVgIAu9opvQ
	(envelope-from <linux-media+bounces-64128-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 08:23:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF59653169
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 08:23:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MwaxoWLj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LjfBu7z5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64128-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64128-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 391DC3021B2B
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 06:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774F3386C2C;
	Mon,  8 Jun 2026 06:22:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5242609C5
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 06:22:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899734; cv=none; b=H1nb6IWNgfoVml51LU2rP0+oPq/LBIS33S0ANbYHfdRlTqUnoK+gAlI+BpYzvLS3h/u9WC3WOcnG1rse6CvI+qWScrxEFF0e0aIs0WbEs1FEdPb/dLI46babXcjMjh1AYykY5UQBSxs8a07OTaKbMw6OjVXSRddzto2OWC/YUUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899734; c=relaxed/simple;
	bh=7/r2dFANwJ94J2Ax0DcUj0P+2XgUdRU3744Qs5bCj7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2pibgMxp044xTql7dEiEsxURi9897qs3wT+3IoXL2yj2mGaVEdD8waD5jRHlI+F/KsKTVemEQIgjtaBtENkwJMCF691qIaDKIWu2It83GNPo9btkH0zLc0+cr4PZ/uw+wWKT9vkljrxq+JE94m60ArOr7XK6+hMpg8ohzN+wdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwaxoWLj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjfBu7z5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GmAx2025142
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 06:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXV5eOedzsBR8n4Agn6k2oBXAflNJaFrBDP9DJ8wYZw=; b=MwaxoWLjWh7vD/xi
	lp2//XPaTUk6bMV9NOSUN/+EgCrGOz2567LCpku5a8bBI02BhQjatj/VrWdaFd+s
	X7pF+9y0utPOlbMA1Oa6HuvFI5iO95+BAyMy82od3+jbn9b2ZWJ2qdg7MTu5Pv1q
	fpyfSmLd/eDQCcs6CmlLxf+Jl79zJdtVobwnLTdXuIAT1K24sDh1ajpeVFIjVXLa
	2cKXkhE59Tfa22XpJqpK/IlPWvaFPagx3vqfnZgYzaLWK5YspApSDC8EbKb7NuLO
	t85IP6cvqD4Ac3D7CZiHdU/Z1vjzxWVCjX/nFRY0L9PyWu05lu1ohVs7JksJhnuv
	A23SVQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmre9p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 06:22:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8596e4272aso4733664a12.2
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 23:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780899731; x=1781504531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXV5eOedzsBR8n4Agn6k2oBXAflNJaFrBDP9DJ8wYZw=;
        b=LjfBu7z5NWvMErhsqbFLRrYSrYF2RufH/pLGzufcUtZgQyLS8I1YdOj2Gk1Rpq6gFj
         N98tyVH4PwwQeMKy8tW3q8oX11mkbghQHNVkUhlJrIIrj93lOpcDgia2MNn6eeV4aqLT
         fScF7geRe3tYo86Kpbfv6xLw4qlC7dtTKEiOUZlgEX9F9Ws36I8CF+5d5nQnU+ETIf5U
         vMVRgV0ap1tomiWT+u4azBHsLwWd6rehfNgDP7mrhEm8SdO7z53Y/Ankjkty0wPwGPxX
         E0TE+wCYehIu3WBDvrzY7UCjialDNH9btk9zt9qaEMkMhAPmksehdmCeuxTYoy3pqZAl
         XE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899731; x=1781504531;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXV5eOedzsBR8n4Agn6k2oBXAflNJaFrBDP9DJ8wYZw=;
        b=QdszUVnUAwOS+hr9b3UeMMlBEef1ErJMxQR18IYvmvltCXX3sPmQd8hVsjGQaMODIT
         7i2VfTdW7HtA5tB/ZRyGm0jQzwzJkvllZRBod0KZeGBI346RVrTyvC1vwcKz04qKdi8T
         +af/4QDRFfzxtUvRVq9CoxjgUeCtiWPuYf2bJNU2PXrYUa/0oxbBoGB6wII2txxje1JZ
         5ruBJZyLCPgWMY/RzsTjwBgbEPVOZwDBkyD7g6Gt8Vd3MZYWOIklnBA5njRq61qp5vX9
         O4mUv7QQngiYUZdL8q1YpEKzLgZp/4tIYkD7qwekBRsX7ZMf7ISQfzbYWinrkJOwYGG/
         zp6g==
X-Gm-Message-State: AOJu0Yyouajidl0xI1Lkarglj/5exiqucy64Eus2skCreoR9y4rBmrdA
	Q9XouWbunn732GxuXz/spMDmPlkgm4XUwm+xn9JlnMl5+9sHmzq27fIpN2agp6HcpkZFZ4wM4tg
	3LAwtgrSwntWfNeRun/koouYbyUrZni/iEutTsgS9SGC/8ro0IUW/fafZFSKzCrr6qA==
X-Gm-Gg: Acq92OEP8aFCSUogFjA4ytOs5G8/jWGObAonkPbba/IZUHBOpcJ3SC4a9GDvQ7lrQvi
	j0YrXFXroRSwbtBZa9dWwCkARFHgKX/W02ZTTVDvdrsEyphnSe6ZnZKfA/t4ys2aQj1jsukDvBa
	8RfDCjS0KIHxe5AfE2rAJbVL6hhTTMU5xwE9KCabTF5eIJDLpV1kRLX6LQ2RkPbo6xc/cBNk8V3
	gkJFOCstqEeoHUBsQ8ybMnf8i5WV3bKPmBNYd5i675+gOCzK8bDEaBiWRMmykNzpFv/lT0kYFf2
	K7T9CR42s7jgfVfD7PyCUmNZhzQ+tiDjw96pJpG7+oAIugqLa16/99rk9V+BGT7ZE4La0VIcUHi
	TjaEZY3MpWXnfkl9bp7tc8zWhkfILACG1zbEcwS5tdGa22jPWRX+YkGWzTr7zCzD3
X-Received: by 2002:a05:6a00:a383:b0:842:7992:bdd6 with SMTP id d2e1a72fcca58-842b0f09549mr14744921b3a.36.1780899731133;
        Sun, 07 Jun 2026 23:22:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:a383:b0:842:7992:bdd6 with SMTP id d2e1a72fcca58-842b0f09549mr14744895b3a.36.1780899730701;
        Sun, 07 Jun 2026 23:22:10 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e1e5bsm16605322b3a.46.2026.06.07.23.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 23:22:10 -0700 (PDT)
Message-ID: <94d5ffeb-05fc-5bc5-89e9-9381f85c314d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:52:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: qcom: venus: add callback parameter names
Content-Language: en-US
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260604001859.33353-1-dennylin0707@gmail.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260604001859.33353-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1NiBTYWx0ZWRfX88RbyjGRUicb
 JCImsyQ7Vly/IBRfrtwA3HGuh8UFokcv3B0fHMwfp91G3QUhFrxO2Al8RFcA1O/pYQFYFuWLTHk
 pghr5HSxzP+hvJaCjRCdEkz9FySAhl6jVbrTMxTvgMtdsfYutvEDf8J3MUdsGJWanv7EvmknlSV
 sEw+BaJ/ZwKsPgPvIOyounu33liJVEN7JKrEe73jzvTebOhtPKM3sXS81gvnFEzyxtsq4YxMzg8
 GyyvKmohb8elA3oB8lZy7j2TRwxxYy7gbFXulrr8FGbyqeCIu82LHse+9mpOlGFZK9DGeSqbYut
 hfJhokVTltqmaVskK12GoKBYirncBiY6+uf28VXjorjobgll0fWIqBmEcPt0Rfv2e+RV4/5Zwvl
 EDMgUy24tesHae1+VGm5zW4drVSJs2UJjlw6iqE7ZylgGmEfeS5xVKolYvEMfQouZxxLS7zA+bH
 wK6gwvBO6yMBERN/nlw==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a265f94 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=D_lHRmgbTm7AOjN1lH0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: UR6TDDzJd_UnX6sA7rNEsL6dl3dT_ttE
X-Proofpoint-ORIG-GUID: UR6TDDzJd_UnX6sA7rNEsL6dl3dT_ttE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64128-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCF59653169


On 6/4/2026 5:48 AM, Hungyu Lin wrote:
> Naming the callback parameters improves readability and resolves
> checkpatch warnings about unnamed function pointer arguments.
>
> No functional change intended.
>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_msgs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
> index 47b99d5b5af7..5c2025c5acc7 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
> @@ -690,7 +690,7 @@ struct hfi_done_handler {
>  	u32 pkt;
>  	u32 pkt_sz;
>  	u32 pkt_sz2;
> -	void (*done)(struct venus_core *, struct venus_inst *, void *);
> +	void (*done)(struct venus_core *core, struct venus_inst *inst, void *packet);
>  	bool is_sys_pkt;
>  };
>  

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


