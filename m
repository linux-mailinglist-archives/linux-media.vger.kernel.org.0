Return-Path: <linux-media+bounces-65944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S1k1N/RvQmq27AkAu9opvQ
	(envelope-from <linux-media+bounces-65944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:15:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B376DAEF4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:15:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="CxYoStG/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="XpbA8/U7";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65944-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65944-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E5C7B3038A36
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA69409107;
	Mon, 29 Jun 2026 13:06:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F1D4071F3
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 13:06:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738410; cv=none; b=ZaKX/Row9bGv5IDiy/ufm3XCr1k6KdnRvZJrmRdOLpD0fHcLu89/M00sg7ei4n3q+nFq1GkyhP7B+wNzmdUdpFv3+czkHlIPT9XlkLPT9UFMpIPGcGV5qHn6oB7IxUpZH7s16tI41SNzaFR/RfVfcluWVunyNPdVuxF1qa1xxao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738410; c=relaxed/simple;
	bh=l8xmnKZyogtxblVYuRExx3KDcBcxzaoxeA0hboGd+sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixuDRME9H28fp8WgtufJdG040IukBveUhAHv+0R/Z4M2EBRSejKwHUr+cGZse1I6RiqyIEBlPSPqULhCkc1B+8IcYBOMfuc2oqeRMsp0H/iSSa/Kfh+wjfJlKlp3PYi5DYZabY6G8NKH0OSZR/J25hCTfr03pOUVnqVRJYY41Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxYoStG/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XpbA8/U7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKgG2656125
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 13:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V3Ubk+UOHQ19y0xPujiPR9uA
	upfXfjgvmCMxsopvLFQ=; b=CxYoStG/c/8W9UgQ2yCt8y4qytS4I+rH/zmq/dwd
	vIGMaLjxpshv6ucAHCBqqkL/TGjJQGq+3InBDbpDeMqXNdh1r0YKL8nIwDnYCNs1
	wsr/gomoH6fAom8iWApOvIGGt8VPlZCgIQ1ZLUKcFxbnhW8+T2Wx7WbMLgcTI6a7
	xYMM/7IFStrFTi+zMjLFR8rrzma5lpKz1ITD9H3vRcXH2u1xzv356u0eIyezDu9B
	bac7ojOO/ee3Mk5QoypjCwK+ruMevlEzsIENhG9cuDWLeL9kZEebTiADQHESh6Uf
	3EWdKJJ6Hv1hbFZpBtU9Xj9plcGscwFMXCA9XSjzqTB+bw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7gwvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 13:06:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738b76cfe03so1225524137.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782738407; x=1783343207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3Ubk+UOHQ19y0xPujiPR9uAupfXfjgvmCMxsopvLFQ=;
        b=XpbA8/U7Dqk0fP0iyqSaDiuuC4OjLWcqeXq9M/q5KZO3RKuRuBTXYLPnYgAbv6xa8I
         ZipoA8NZZ39uKh90OctlR5buDtSt/9LO1ZmY0fADuzuQEeXTwiALa67PCUyNel5Rv29A
         MOtaW5mvEP6JhEAzQZG508b7hNdix0L9GNhv0ABNv/VGvhkAueyOsNdOhgaFAS1opLIa
         tvnL2sBwKFgq7hIMWGaGs7V9whCwT1ZHt/JXyDan17mZSvrmnKNnqm/OfFQYHO9g5Xa6
         f4qtwQTBSL9PqK+JCIxC72uhLHNG0KVPioXfFwSCPeiBdTM3FnFdTAuwxSDN+ZuyCfes
         GkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782738407; x=1783343207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3Ubk+UOHQ19y0xPujiPR9uAupfXfjgvmCMxsopvLFQ=;
        b=EvI/N3gOZGZ66nl6b9N2WDB1k9Xj3v1pO0sjOWVMLfCtCQgknmZof4J2vI6939ARFw
         jbHeoiLGsP+U343xNdXaAZ/Gk3QVOPPfwze5F9ibvJzMZ22pq1uDT6ieNsQ+L0zDbxPO
         06bqIXz03wuJmrNsLqSsX3Fv8fMiVrZI2T+KEByxqQQRjb5zXSgoTtbJg7/o9yPtpHsj
         7FgcuNlWniSbhpdS8wliVtEwShOgWDSRGq8WL5iK5J9sWX1eT/wIv+BhLtZwQ1lR7yik
         9lYPjsT+b6IGcx770iBgQwZkmOdrRe6a+BTfvvj60LpaBAzQCuzQh9opcwVxH+NBrEsy
         x2Kg==
X-Gm-Message-State: AOJu0YyYiun6AreM+IvaJXHyaSyh0eDh5wst+3oo44PRCaevoLlMdbli
	l8sdA1DE7o7goqDl3GDkJa0H5oZ/A0SQHJeQ9t5Cs0RYBUAcrgxU4HIyCbjOqZSKzIeeUyaS85C
	1Yrsc+7xlnylG+DRbOs8+g2g4t9+3Fo8t9Z9sEsd7E0zhuluO4fWXtLRbeuv2AxeyKw==
X-Gm-Gg: AfdE7cms5/3GoFuiXmv/8SL1NsnSlvZ0TDypyvNVAJUoRORmo8piF6uPeUBRoDkT7Js
	pJcHF8+gZ5+adKsuyAJ1ppn0imZtY0oxVA7oQuOhrZYajrzQOvdcMxlLEbgKCTPDBiO3xQROKLd
	ADI+TdR8+6sSPXID990KzvC+CJs4xDSV1Gfn7xq+LMeDh6JfvWjVVTTY2KFbJIeb82skMmcFqax
	45Uaj2b78+0gNuesNaWHe4fuBYEu3uop/OMHNQGEDC0aoyvpnuJIAWKVXFqP2MUVXuhInKNJvIm
	pbGx/DK2NljpfNXSDRM2HdARurJz/NwkOJepkstOhKHsVOtZF9pytGR7udmCkJjLYM080DyVr4J
	ItDSLDUbyupsvYouFY5Z+OFQjm0bXd00yJZuBg8ikv9/U2DYbCSb50Ofiq+OYg5GrBzymb0nKQs
	eUsCcK+joRD2zsI26G71nNJIvq
X-Received: by 2002:a05:6102:80aa:b0:6c5:d55d:c093 with SMTP id ada2fe7eead31-7343444e59emr8018155137.8.1782738407163;
        Mon, 29 Jun 2026 06:06:47 -0700 (PDT)
X-Received: by 2002:a05:6102:80aa:b0:6c5:d55d:c093 with SMTP id ada2fe7eead31-7343444e59emr8018089137.8.1782738405311;
        Mon, 29 Jun 2026 06:06:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a8b6sm5851946e87.39.2026.06.29.06.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:06:44 -0700 (PDT)
Date: Mon, 29 Jun 2026 16:06:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <uyxnmtfrcwmgz42vhegr6t2arra3kebrvs2vxo6252czdw5jip@lt5uw2ge76n3>
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
 <20260629123359.3469724-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629123359.3469724-1-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOCBTYWx0ZWRfX1rKeOmeNEi/a
 9pZYqBG1gTehlsaX9cEQO0zquUFA0KU9olkXXaL5Ragt8NzDJzGCnz39FeDUBNpeFIAATqQxyGv
 WC1W2kro0smDunMzhYmqicVKDqdA5FISET9KD+Whs3pDAut6MaZR6Z5/3d7bmfzodoVIzx5cFg0
 U2tKOM2WgNqtVpPBtw1j5+YFGI6+JHI7jW2Dy5s8pPAR1wCsc0m8NoUtKbyTWiHqENACX4OEM6y
 rpHpgV5rwpTPR4U8t6qhhBCj68sRuGi9NEf9ccNXA9rjcZxap92c+YArYoGJ9lza6y2iVjkzciP
 Hm9GlX9t49U9J0B8qUd+ubK0lNX4Iiiky94tPNikfA+l5Jh8x6w/sNWRwD53+vmpI14r9VJElli
 xqVH65x3uKN1vVOrp9FlrLftLtVyQBiQ1rgcYI/TA5G37Gpz0HpOz8awLNZEqOb14Ft1zHRdikW
 BbcBqSDucQbEeBECv3g==
X-Proofpoint-GUID: J7kTZfM8Oyg-M7u2zOdl1mmTszeat0OF
X-Proofpoint-ORIG-GUID: J7kTZfM8Oyg-M7u2zOdl1mmTszeat0OF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOCBTYWx0ZWRfX4kzoICjNox6j
 J83BgD4C3FtOG1UZTrjFFApJMDkq8+V2tXoIOP2S5VsJfsJ2O3fp3r1ke/MJ1qaxNQzSoDTb/q6
 sRTxwY90AI+gliuaivFuMMHUAacM3B4=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a426de7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Z7R4kEFDkqlNfSA089IA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65944-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71B376DAEF4

On Mon, Jun 29, 2026 at 03:33:59PM +0300, Atanas Filipov wrote:
> v3 posted:
> 
> [PATCH v3 0/4] Add Qualcomm JPEG V4L2 encoder for SM8250
> https://lore.kernel.org/linux-media/20260629121110.3469048-1-atanas.filipov@oss.qualcomm.com/

No need to bump all threads just to point to a new one.

> 
> Thanks,
> Atanas

-- 
With best wishes
Dmitry

