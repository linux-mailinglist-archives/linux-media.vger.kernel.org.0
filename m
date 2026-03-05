Return-Path: <linux-media+bounces-54582-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIaDOblKqWn+3wAAu9opvQ
	(envelope-from <linux-media+bounces-54582-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 10:19:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A6120E399
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 10:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35B5830C2DDD
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 09:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A12E377EA4;
	Thu,  5 Mar 2026 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0Hi5Pu+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xu+hSCZw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13A7376BEA
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701900; cv=none; b=oBk5HbQ9YCu9FJlok+VMqaOyLkB9WUU6s50lykZy2TxXZRHmFGdlgQfbbu9UUvPafVDPL47n8zYWZXAKmeN7ZTyrywT+eqJ7LHnfRD8KiNavaUgZ+RgLGzRKll4H7bUACgr/Vur3mmt4BC2gagKwO1WXYqqzTjP+tuyisT2CLWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701900; c=relaxed/simple;
	bh=FD+sJlAHc/TYMCXoO9DaI4EA/KLKpeTcc4suUXKQBTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wf+dvvwbylt37ZrnNoxJzmBACrpOdvF3UHV16K37M/MRfFccGTgV9zkNcqgrsJCMEJX+oVOn/pOaQXhjc5MdupO21RVjuYAAJSXUI08i07sx+SUZP7hNLkBlxU5opxa9JbYptmGBqagIFxZnbz9lq2BzYi6FDfMPdmPFd9UWPgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0Hi5Pu+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xu+hSCZw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62597CkV2665096
	for <linux-media@vger.kernel.org>; Thu, 5 Mar 2026 09:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=; b=W0Hi5Pu+/Kx9rub3
	1LuwoztTEiyin65jy0AFa9w9CeQosyQeKJh8uCqng/kW+AvyBzw620uEIw8ElxxS
	p7DgJXpyHxlQCgU7ZnXWh1fDC2kEZgsF+bNRtHfjWvvQQP20fzVlblnrbJN5YtJj
	cuXRnfwIw9A1WDVd75f5iR90V/hmIMXMAApDkJvz92wPoO8C6Cah4UDdFm28qxbm
	JkVKYxCSPSIeuDpcvHiSq5co1WnUKQ63+OjUFG3+cpPsRMO9kCFdRbA5AXYlIq+/
	D3NF4cr175vifDznzJXmfwFBgZlGYxgAmz/Vae9OYLQmqMJp28j53fTOD1MekVJb
	WfF0KQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb2375-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 09:11:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb399597fbso467151585a.3
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 01:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701897; x=1773306697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=;
        b=Xu+hSCZwFjsWOYrN2/fJVUVV2JVinsq51AzuEJMbaRXQwTt+xPUsb938Ts2fQ3uU4K
         qQ17yWqnTAmVFVEoPgf4apBQSb257u64ZkhiIZ2/oUURYBex/De4jLKIVbC9CngaFiHR
         UIkEpF9QZyyWl7Vyeg6viBbHRNnECX4/zWgdK9kPtfXmqfHlJXMTb8RQumiUcyHSp+0m
         VuUg4mKpY9yFpWZ0Z7KadpHalk9ZjwKODOsPmHI0HmniU6ylTQMOlDGGDceCe+1LRbYB
         MoHt3X4lIHS556q0U6GcHI+UzFKMVsDVoEHUfiNjxXgMtGRiHZerrqgFeWB2w8pTKegg
         W9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701897; x=1773306697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=;
        b=jFIr0UG507XMGEJNf7xF3J/GCFyCLMYPBTdrVD9C6TaK1d+RBtU+x+xtG2L8ZWYntY
         RRMwI3x+gfrvHelp5BxwEqf0JswztPHgxMGHjYeL8u+j4BNMJhlV+CWOvqdg0NAd044g
         sqwNyxLZ4bFJjTdnp2wmh+vouG6ttaO07+x1pBB9QyogemJ8PRf74Oo+43+noytXTGbO
         RPz7TX+HlRyDKeg0b9gpF/6kzMJ8TjCuu8QFBMPhCRv5T9BI0QrQD1QVNcQlSCHDbQYu
         3Jo7t4HyqAdU142C+9Z9/6PUvKMbGgnXUoSOE/OFLyaRBdys/m4y6KpZxkgm1E6Htcn1
         B10A==
X-Forwarded-Encrypted: i=1; AJvYcCXIJZ1JPLTtXeAeUKMWOvNX7WFvOt+ANY7QNvOBJASsgc35YI9dRpf+p/4pU4dR8Zywcdj754HDGjEp/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Rk4iF5OjD9087czTk4p3xEPigNVyjqYOlC4Hk4Vm6kmqaQfA
	lZLQ27x3/L3t/W/Zgl6/tkhNjPjcvYd6pg66kQxlDAogJ/UcjybK3MlOZMeioiGZmGPRcVuHkiI
	ONblrFWAUG6glGFF4yxSzKsX7mWHp7nI4zaAcrNs2KZpzwZS6HHsSdHAfZUnMQOx7RA==
X-Gm-Gg: ATEYQzw6eG4dfp6Yie60DzicfAy9/ouk5RAxG8Ae4Rbu3+ADCKvb+4UNuFGB4I0EndG
	zhuMWqtedvI7LsSz3aqj00EcRgYDlTsUuvyRE3vyhG7xs9xdtZa6ctFVQWKvLvyWCAIFXdZ/C/9
	5OwnyqJl+vygoiiOxA2uzZIHmvPM/WX+j3Rs0Mva7qDIKxk/IhAXikCWRVBN1NQA7eeOC7obEgo
	iWY47pG+2oEnM+8TbBaSZaw4dqNXsBOAegocMQ3b/8p5INZxxDObI2hj8PZhLKjBoQRT/Uuwifc
	EPc/NvcXKZxjcfJVPvNTOKXwXOnSfuedW3dlyQH1dXO7r9wXWw5qX4U4Ys2539YqZzfBHAVeCsb
	/0gbHsRUY2vonMsJ+cnMiCWSWRfLVhzhskXhjKOcgFuB4ithlmU8bAplHfa8dgX3VMQjJxjGXR/
	+3LzQ=
X-Received: by 2002:a05:620a:4156:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cd5afb0224mr487946385a.7.1772701897188;
        Thu, 05 Mar 2026 01:11:37 -0800 (PST)
X-Received: by 2002:a05:620a:4156:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cd5afb0224mr487942685a.7.1772701896576;
        Thu, 05 Mar 2026 01:11:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660bf4d8249sm2589351a12.17.2026.03.05.01.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:11:35 -0800 (PST)
Message-ID: <ebee2fcf-9069-4a9f-ae72-86f4471cd4f3@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:11:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305085148.7cwo3yflp7vcfldf@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfX/WIpT3xa1Kmc
 hOCctT06mj/7q/lTnKI22pZ2bnVZyPXUMG4mPKcP2iiZQMsMCsd/qiJ4Jp37cFJSbW7XZrklHKS
 xybjv7CpVDPHwqtNYPEKx/xtvGE57qgim3hfMsATp5QKlt83aoY9QJ2cqkcl2EarNQCTt1bh9ar
 MyXdDyu56PbjuJJHm9ApHUXiFlsPCsdfAyV+2/7SN68ehYbqI9cBFZftL/2Let8ugrWPn9yh4DR
 od1S3L3OFAj4KUfmFsZpUZz6YjCUJEgEpDDg0bLwwnMa3GwdZFAuqnrmSPxY/UjxoQa5A2U+xf4
 4xevnd06KzoqPGtkU19fy39HoZgQV2PZr+RLYa/b6DEmmL7dl3aC+/Nb619X9U6SOBrqEScvfoM
 g6RUVo5xCmceaNdPbgmQX7D942mtT1mC7li6zqJvVjwaHcCdPAz681np0ENc0esZVJZwuDdwMTI
 mbjCtNDB1PDcKoquxHA==
X-Proofpoint-GUID: IQHM916Amh-61UeXTpemymsYU-vzN2XX
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a948ca cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UIR2zDuwlqQ-mzEo0xkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: IQHM916Amh-61UeXTpemymsYU-vzN2XX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073
X-Rspamd-Queue-Id: A0A6120E399
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-54582-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 9:51 AM, Vladimir Oltean wrote:
> Hello Konrad,
> 
> On Thu, Mar 05, 2026 at 09:39:35AM +0100, Konrad Dybcio wrote:
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 55af015174a5..bdfa47d9c774 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -10713,6 +10713,7 @@ F:    Documentation/devicetree/bindings/phy/
>>>  F:   drivers/phy/
>>>  F:   include/dt-bindings/phy/
>>>  F:   include/linux/phy/
>>> +K:   \b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h
>>
>> Would looking for the devm/of_phy_ prefix followed by an open parentheses
>> not suffice for the 'has function call' case, instead of listing all
>> currently present exported functions?
> 
> This would maybe work when you run ./scripts/get_maintainer.pl on a file.
> But I would like it to have good coverage on individual patches too. And
> since the devm/of_phy prefix only matches when you "get" the PHY, not
> "use" it, my fear is we would still be missing out on the most important
> part of the patches.

But that's just '(devm_)?(of_)?phy_[a-z]+\(|includes.h'?

Konrad

