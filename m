Return-Path: <linux-media+bounces-63262-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEsVLIuJHWrAbQkAu9opvQ
	(envelope-from <linux-media+bounces-63262-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:30:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2296200E6
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B54E3012B0C
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 13:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3613ACF1C;
	Mon,  1 Jun 2026 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMm++gvs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Do1XWa0u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D5E3ACA74
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320647; cv=none; b=KZenCAjzQjCCNKEAX13hkbx0PB9jfXSK/y5eq3TOxl5NCMahtZ0WSORPQ+IIIzp6KuE/BjuTdNOr0c0dBGjtqE9WmpXgFvFtdqxtWFuiwGYMBZF5S3O5ht1qhl2FshJtvWIgKIFfzcoGN4bY8NBL8h5T2t0IlTvF/sTUhRIe5Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320647; c=relaxed/simple;
	bh=UDmJ1k1aLBInIvFNqEcNOlLzi9eOR2sEjPHpu1oXk5o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BR13W44Z4NZpA4Xoe6n6gQ2tJURzsZ2HPZzkvzQH1cVFqA6Gba7xDATnY+hAI07E1OB+OgblM9yocoPs9gp96ZXBPuXsRPi68FJUChgxqpxpbVESiBayE/s5etUWzZeBpehdpSOI4VZX4jpcJKzdDsAs/w5QT/AM/dXQh60R31A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMm++gvs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Do1XWa0u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651AxGGu334647
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 13:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bhd58qYV5qQ5sfvU/qA2szyY/a3HbSOfNKYbjuYIxdU=; b=SMm++gvsFKSE5wBA
	g5VS7Jqcx7dcNO2P86vhYJWGVcerVWx0P9ivsVJ/5bPFjCoumIJr0oItSxwxL+Co
	MliHmyCSqwUR1fNrtr6SMp1xY07Xy3ydfng1lpyPXatpimcb7npllGgqe7pQ4aKt
	7h7cwcYwO5gbtd3kLiHku4DB5teQvOdbC8bsG0kEkAYzy/TyHZwXV8Vy2Yj+u3YR
	f3IiuxovmzbWED14m3FJkiUEiKMRcWCID7ajSWFnS/xr+zTZQ0C7ONhgPE+2Of68
	GrGxcFcnBZDVFMsN43OPuf0LQT3/5ffZWftqpJ7hayxl40W0qA4NOM7hFPdjLvFt
	oRJ51A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh8tfrkjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 13:30:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0bfcd629eso18133565ad.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780320643; x=1780925443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bhd58qYV5qQ5sfvU/qA2szyY/a3HbSOfNKYbjuYIxdU=;
        b=Do1XWa0ujBw20wCGTbZPGqOUBbAcsTsMYh5eB9cm0AK7GRJCVUY7BvYxUOVU+Q0QKZ
         6TS0UtoYuUCwWEZkDwgCqolgbNjNakz0LyGVuE4TXwMRKc2yFSmWzqFIQ2nGRYa7Xv4p
         y7CqOQnDmzaMsaIAniXs+2kTg52dbnaobtHtf06I5rCCRvJJSPDcCLxyk+XevugpCvGG
         AdW2hJ3fBdeyNVqfW59b3xsRdS/I7roQrrJfBmyk3W4fa/6huiXeLn29QMUso2LpgpKY
         uqGf7ZrTEozTpmOfhCOp6InR0+P0EI+BHkPMj0Vijf12p0VGdlY4/uA8l96xUTf5/wyn
         jLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320643; x=1780925443;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bhd58qYV5qQ5sfvU/qA2szyY/a3HbSOfNKYbjuYIxdU=;
        b=EaVIBTJFWt2Qo1STRlQgLwV+scBJsfqF+JHBy7WYVXnMbDEqcyNLVJVasEsllVObgQ
         VoT+CBPJKZFSp/JA7nceItngxtiNBT0ev8PTptDzls4hFom0BMUngG2b+bIUUPQ9N2At
         hggbxrzs6INyZXfvzsy0W9+kK3q1U4y/0Gqszdh/Lc7eo8sUlAViZVOYALERSi+8Sg0I
         KPHq7HOu7uZlBGQONLTI8fvfdDRXjDgYpuEnFNVkomyVOQf3ODoRC/9FvURaxdOClwIg
         lYsIEXDrcZKbUFntsRO+83OKlH1kYxaQGJr2Z7FB+BDxDeRNzZdKAk3X0AUS/7WOzwQI
         azpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4spNCUfgFbKCGXgYKOsdQPvmxHVH5bbh2hJ+AntgWqw91AlhMgrY58oU4eu5fKS2078oXdX+jmZ3pTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw30rpivaLYzNcCHS9ZMni/XEMJpd5S91IRVQtNQxiML4OnkIV0
	dk/aS76MUoIxfkXlu7n1Ba5llyidRSYskGN7KKvW4b7OOFyAgQe+ldBcHx7t+Xhr1VzO6dWwBjh
	SIvGb+RC5efneKspx0moxv3GhAMTEZKLPalpOUgLTa4E2qONr5dbvwv6IdaneON6shg==
X-Gm-Gg: Acq92OFmhuztHvgWJEzsfEP/Pf7XF6bIGGMPO+q2e/p/jtVabnUUHWfSh+t23d5y4fJ
	RJdCfmroAg3OdnjXZvXvdUvukO8dgivEnhPJ0EnGHlA+QQiSW6qdnqGUEDLAqE+A6zvdajXeogQ
	MGDSCCTjOTd8FRTOEXWKz4PXMq2D3ABvxCsvus0Z6tNl6tLD5+9IypTZbl5rF0fSmnaCrnQFe+S
	YxZv5l/SGRQla1Oo1Kl+tB8SHkKzSdvKZu962q6ED12UNP7K1Mb4pvTxdHW3N4W6T6A9ppRjeYu
	A0Q31YxtmlLFnNc5f7dH9oI0rueZZD/eUcxXrPu3zq+gpOZ3C+hC+aAwg925/TgNvIJF0RRF0eC
	jkRpHdjr4M/rLTE/4cnf8mrhJzMcnNXjHlJ13HRN9mg7bChsCq1hGYLte+Klqpw==
X-Received: by 2002:a17:902:d58d:b0:2bf:2e28:db28 with SMTP id d9443c01a7336-2bf368263d0mr123080455ad.29.1780320642768;
        Mon, 01 Jun 2026 06:30:42 -0700 (PDT)
X-Received: by 2002:a17:902:d58d:b0:2bf:2e28:db28 with SMTP id d9443c01a7336-2bf368263d0mr123079815ad.29.1780320642277;
        Mon, 01 Jun 2026 06:30:42 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6ff5sm143718315ad.7.2026.06.01.06.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 06:30:41 -0700 (PDT)
Message-ID: <c1d1a8db-9cd2-462c-ab6b-d14eb97c644c@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 19:00:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
To: bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
 <178000641103.4557.14582699057810501776.b4-reply@b4>
Content-Language: en-US
In-Reply-To: <178000641103.4557.14582699057810501776.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xbjME1JdBWprUpH4PmzTClx2dwGo0a1E
X-Proofpoint-ORIG-GUID: xbjME1JdBWprUpH4PmzTClx2dwGo0a1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzNSBTYWx0ZWRfXz84uOYFyXsWa
 OEetCEg8Q43TrA3zTIsCFsPWeQj8woCvpVLBym9gk+tEhbgLpG7gc8lnIQW+tLNOsODZEGsTIVG
 QZMxJu0dQAOO5VJ2dxNi8n2BmyCm+SLOuHd05UmI0Uljqq3H8LXLkjAYHPo7ybAKCaEyd00QIxx
 TbvejqLk1Lx3SZ74BRBMw9RZCto62dpLzaQLkmiOCXlbO0BJpRYVE9S573SCi+vjMoZXLKZz3id
 D5WWqShtNst/VjEgvrh03MMvgxtmnhtfGpRa7cpFrqVYTMz9trMFuvoZF8nV7iKvNE2+J9MaX3O
 SvGuqSvFOWS8OAoArSznd9bOulhNydNzYD0cAbpqxd8bacKvh4ZkAFIA/tDQCftY6iC/5VXEwBK
 RDwHm0motuHj37TqYoIciexuA5QN4ejEVLiOQ+G5VBo2ABS+n/y1HtENCLc/JyOsB/6wBCGdsEl
 oG9FjorJSh4RtRxGBmg==
X-Authority-Analysis: v=2.4 cv=P4YKQCAu c=1 sm=1 tr=0 ts=6a1d8983 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=FPLoCuxg6rETm2Q1RYYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010135
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com,qti.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-63262-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D2296200E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 29-05-2026 03:43, bod@kernel.org wrote:
> NAK - what is the point of this identifier ? It literally just adds a new
> define and a new string.
> 
> Unless there is an actual difference with 2290 which thus far we haven't
> see, this new type is not required.
Understood.

As mentioned by Vikram, Shikra will use a new compatible string with 
fallback to qcm2290, similar to CCI approach. 
The CAMSS_2390 identifier and the driver changes will be dropped in v2.

--
Regards,
Nihal Kumar Gupta

