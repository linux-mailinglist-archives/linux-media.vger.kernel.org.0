Return-Path: <linux-media+bounces-66734-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PuhzBG6US2qVVwEAu9opvQ
	(envelope-from <linux-media+bounces-66734-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 13:41:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D2A70FFDF
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 13:41:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XsySMgQX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QSXxLaAo;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66734-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66734-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C87CF301584A
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 11:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEC441F7F1;
	Mon,  6 Jul 2026 11:41:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9911B3A4F58
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 11:41:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338072; cv=none; b=A+KKGmWJ9Na96aYMcifXtFpSqQ6P53ULeGEkQcLpsDjCcehCqRYR5++v0EZvtTvgvRsLO0Egw2Jp5EBWwugJRMIefn+CCYPSNQf6VDzt4/ELBKm+nQpfaeX4M8ebTRMqhAFgZvOYPAbks15S4FBOA7QxPccjXL4kS6COqGF2jzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338072; c=relaxed/simple;
	bh=M2ww3vjExAjNaQO3jQvVY5phe/1Oft9gRD5oC/hyYXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGNUHPXLuO1C/UqnjEAkjuisczywwAuQ6cttnlZy3czlKtAvwm0m/ZaAVlaagItVs0+3YOS5zfTKg+4+vAlJ6w9TdbdMws9GrjvDz6rhCl4TU0VYh+OK+slGLGMN897uomWzRz904XbKIyETjjCIrfROKj5p/inNAl5S+HSudFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XsySMgQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSXxLaAo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLdF174947
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 11:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyWL2bmNSCp8kUWSmxLKw8OK4EFDlj3sVJl+0VzDp88=; b=XsySMgQXvfPgt0+a
	HXtcu1zM2rla/ZW5eTCxaMB6FICW13P1fwym0A/MsfBjDjqUGgXD1EHFUEySuOk2
	2z6rHOSeFOjg0Nyyc6VHixBwF+xqtTVaCt3ADnTB1IzhmU/aQqOPwenB2//RiLUm
	B+kOKlkYz6F03GNs7m211bs4Pr22Yuq9DZfFgJDYUjFMnF4mWSST9/zOrRBcEb9q
	n6vKECdJiMTwf5jgm2LcODgoUDnUe4767AbVeb1xNK1d92+uBCFBvMe85oFat7y7
	xZR2l3W1G+EwqCXOK7NjSKq0MIxTJb8OcGXxyUAjh0LR+gEqcXBvSvMPiveVOXbl
	yRJtqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxs24u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 11:41:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso9750071cf.3
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 04:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783338070; x=1783942870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyWL2bmNSCp8kUWSmxLKw8OK4EFDlj3sVJl+0VzDp88=;
        b=QSXxLaAot8Tf5U7R380npQth5nkmb/kPxXs8BUh8o9/n9AC1W1AlU0yM2dAV/WvZOZ
         h8XD55XD9NyoBT0awlUWqhsQ4s+74SOfm5v7nIt5uzBCgA8btqi9cvbZqqB5r7Rv1lla
         HEEoUmzmjlbDJjWbSQapi7LYM9TjOKgNVphu4ZY5vKQEAToL4Lm/l7UYO9UGOOJEYVjt
         +OFx0OF+2nDSQC5y5OypiPx7ZuBToacdWB73UDZ5zIZQMvDCTU/g1L5R/4JpIMQMMFbp
         sp6ZyfMVZefBZNp6DQBaLh8Z09qZWTrxD7xj3DEthNF+EXujlEoL8Svc4tFOVrskKJdW
         NL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783338070; x=1783942870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyWL2bmNSCp8kUWSmxLKw8OK4EFDlj3sVJl+0VzDp88=;
        b=F93HZIHC1iJs+IBGHBX9KITMaFttd9aAap4v3x1JQ7nKDFLvREmKO1Nd9xgg5LXvJG
         ypwVOBIrdpC2NuWp8hEn+CQ5zJ3WJUAe+5WcwbZkU7W+hmL6a/cgneMH0mI1PwbzheHv
         IGNCUbXl7IEQ+RkxMXmjHFv8gOSUL3q5zyBiRCm0BXioCr7UTZ025dzveJXUp2JlKl2A
         juPYCet58oSdakqimNXY62Djf8zt55u+13cPl/qIMh9UJrHsMWjVnClzuNe94GFfY8cs
         D79hgYA8EleSHmAd2GyK/6c7To0D1yZKJdOoH/g9HuTqm65YpFz0L2UjSB1JWcF2MgrO
         AVXw==
X-Forwarded-Encrypted: i=1; AHgh+Rpv5mSC6OjgxQhVZWVHXRNEC0ciyAu95Z2ChNXVWV7oreFua7pbxW0wg2ma0jBtXK8zclcFIxwPtZW92Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YybQoA8nyeYAx2n15+2PvIlqr73s2OcH+4qTDQMFv9dAoh+zQXh
	+y8/naOzAPLPVeFJ3FbAj9bUTSoG4vbXTJa0DvjgAnOjMX9CbahEmXSPD1/ON2U7NrwzllntX+Q
	IagNALitKsJPR7Db0AOayHHzphwE0fTh74kT1K0LQ3Vg4P7/CzY4iS2DZER5adICaewh8ZGWjeQ
	==
X-Gm-Gg: AfdE7cmW5HWUsXLRWrLWx3jhTJo2A+p4nWYTipUli8g7wNZo9twvYKLVJp/SeVn7dvl
	IZQs7s7hBa/5/QcDeYyb4Wif/Sc/xxoVfih198jXL9jWT5EWJg/wMPYHErBC8x2gpLC5OU0n0/i
	j2K/+MZ/ZbzBRLqcYrGOK6/eX0EvkfeJdF9uysiqvjHuc1ZjOhxt97LeWdaW8L99B14Rl4q1TVO
	OiG4EctcSddB8LbqWKuguPaXEb2cTkf0YrYM8PIiBZ0L4oW1dd0UVR5UODsoNwikGujf6qfdJAD
	qQJDPcxyg+3k8ZF3qCX0ZLzI2bqpxyZ01y8DxP3QJtVvJdt/ct0JphhIrNbqjs9eVikHsmAyuOU
	7CrjjgOZdQn+Arb20NhQpNo40gv7FmyWfSxI=
X-Received: by 2002:a05:622a:208:b0:50e:6311:7380 with SMTP id d75a77b69052e-51c4be99299mr82578361cf.6.1783338069800;
        Mon, 06 Jul 2026 04:41:09 -0700 (PDT)
X-Received: by 2002:a05:622a:208:b0:50e:6311:7380 with SMTP id d75a77b69052e-51c4be99299mr82578061cf.6.1783338069294;
        Mon, 06 Jul 2026 04:41:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cf68f5sm4059006a12.13.2026.07.06.04.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:41:08 -0700 (PDT)
Message-ID: <4f865aaf-a400-4dc6-acaa-80dc22a36af7@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:41:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z4HzSqRU6zux9EKjBs4V8Y-s6Ae8K5UM
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b9456 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=QdFQMySKPoxOC9Zsaq0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExOCBTYWx0ZWRfX8Xaob/1aiPb/
 6F3MivfcvTe8VTmsyOT2TVVQPvFW8gTToiRt+TIYBOVxT/01yWvIS2tFXgo4LUeRPr7BpZYq33/
 qufHsYXU+vrA9emCpzZF5tGr7uYd9/M=
X-Proofpoint-GUID: z4HzSqRU6zux9EKjBs4V8Y-s6Ae8K5UM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExOCBTYWx0ZWRfX9mRp+k7/aIMt
 M4rIAAm0nCz/4hOfbc2fnclIpF44CuQnl4CMa1bUi7oTPEOCOJAChUQRxXtXjKCBE03dmxApEcU
 qNFcc6xGuGU+/v4ZOlOGQT6dPI/MmZGiUZ+Y2K/mY3ivDu8cMOwv1K5FJ8S6ZFTZkTaYoL0tD8/
 rCgQlGUecFcIS/Q2TmZYAPFKaon4dUqm1Rg6+Bjox8Rxk4qD2wA0qlEWfTnbMfO3yElz0ZlVFMv
 VJhAYs5/U/ADqUxLwmh2p5Nc9jmABXHQgxe6lOna+oI75nz2zz65KAehjVmkF3ni3g4Dbpkojzm
 PkiM6C7+eCWQioQmhh6QmoRF6MUD7SFv0UOnMJ5L0pUWpPPntK7nBIfRTyVhcBRRDwCv7RZnEPX
 vSxJyA8WhaekWm64fgmTeFoPFZNFotdTY5LP6H3mw2xoPne/K3bR4piNmzOsQvsmy+KZ5xMy4vR
 2Um5aS6u+ObRGKxubhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66734-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:aniket.randive@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98D2A70FFDF

On 7/5/26 3:57 PM, Aniket Randive wrote:
> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
> regardless of message length or bus frequency, causing unnecessary
> delays on error paths.
> 
> Compute the timeout dynamically from message length and bus frequency
> with a 10x safety margin over the theoretical wire time and a 300ms
> floor. For GPI multi-descriptor transfers, use the maximum message
> length across all queued messages as the per-completion timeout.

What's the reason for a 0.3 s floor?

Why a 10x safety margin specifically?

[...]

> +static unsigned long geni_i2c_xfer_timeout(struct geni_i2c_dev *gi2c, size_t len)
> +{
> +	size_t bit_cnt = len * 9;
> +	size_t bit_usec = (bit_cnt * USEC_PER_SEC) / gi2c->clk_freq_out;

mult_frac()

Konrad

