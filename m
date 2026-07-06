Return-Path: <linux-media+bounces-66776-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H6fHFuDSS2rEawEAu9opvQ
	(envelope-from <linux-media+bounces-66776-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 18:08:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EED713071
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 18:07:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pQMPUNIq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TRsa+aST;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66776-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66776-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D28873069F8C
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 14:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAC333C50D;
	Mon,  6 Jul 2026 13:59:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDE32B2D7
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 13:59:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346394; cv=none; b=aUnfcmqasCaH6fgwk/LTPWwTtb1fGhvCgBvMVhFJ/bG7OJB6J0eNyJuEPtrfoSz0NcRxP6i2A3ik4k7oryvdO0amdSsCQBcKN4K0gjnZv2Uu555+ch9K6+HEmrUuNzpSa9coL2JpUX4SZi4bku7DcuqcmF0snO5QnJu87Ol0bXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346394; c=relaxed/simple;
	bh=jXPeWbqboVixEnetwSWC5UEDFMEKnoWn4zr+JcaIatc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H10wWAUAGz/AOGyQkPjN08NAIeCuOERltYVtPS8Aion1f7sBmCTOqxiCdHbkIkbmE6JzglAIMjVj7kSkwOOaPzcPY9CD+p+VHGVO7CLeEUsDppKt4/XId4T95ygCVv4W24sG1+6mksnw5ME2UzOnNOHXKBrEegDFgWjv6iItlsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQMPUNIq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRsa+aST; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLkW387492
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 13:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ah2qZwWFY3bPwxLCdOZ4hBH
	jz9IEGBG34zE+2NIOkk=; b=pQMPUNIqwKhFdLcfNpb1d4jqObDcW3cnNaN6kVW0
	hRVo3irpUR5AkinBBBpyQ3WzrLRws6NOf0r7Ga3MTME2KiobV9OzuRHDESRsscoc
	a93BG2rJl5XHZB21i8D8vW6Y/7/qg4OZ/eXyTO1JVi4M8IhX/iJCAjybGg2co/RG
	hfuatSbBh8LIGpJfmdLxarnJSEl1vfyY/w4SXtug0cJI5MWqxrdr95hp0/VHIBzc
	llhzpsag42wiO/OcD6dmRm2JRSJNql0HF1E/6VRuNRFWxTQJ9UnFxCqRPEjM40CQ
	he6uqnIo9Ln3N6enp7ILkMNmLZzljIHM5CW2s1G55OoypA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0xyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 13:59:51 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9693c6fe1e6so3009116241.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 06:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346391; x=1783951191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ah2qZwWFY3bPwxLCdOZ4hBHjz9IEGBG34zE+2NIOkk=;
        b=TRsa+aST7OTTytN33mCC8DQdtoGkHgsIcpFs7Q/JSaCdcaEV+R/EB4OdBWSGz63zWh
         DhSa95mqgoaV6KexQ57SHpsdAUhv9Hea6G2HIPFKQF27nTj70Hym7wTyTgY3LojJxq7Y
         YVFLjF6+K6+fsUQRTZFjHm2qnt6HPAjQUk/9x/dhH8C3J5mngk99MWJ6/i2zC6a8Goek
         UtyqqivoA79xw5PKk9oC2L2FKVfsAnu0XjcFOEmmn+QZDO5Dq03HYHRWNtJ2zInNfac6
         wslyp4T4yvmiGHUNpb66f/pHHPaHZx6/tzQ8AGkJJaalXucVNim9HQAb9JLznVxb2UVQ
         xpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346391; x=1783951191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ah2qZwWFY3bPwxLCdOZ4hBHjz9IEGBG34zE+2NIOkk=;
        b=tJEsUsMnblWix8/SGVVTHMPiaqiJq+YBFjjTx+nlWdOGe6BQwGtNEKBcAWmoWg4/yo
         KMUAQE65j2/iuRjydA7vf1uHWQZWkyqcoyYzOA3TvIdheAF3UXHTpxrZUvBvLYAqAsZ8
         ZJCo2E8o1z5rxVNgy9YhVDbhiWydHwTVNb3TD10Fmtyrg8YV/ZlLeZ2gq7e8UALGxPoi
         KJZ8RG/tJqQ4B7aC7ew5s2VtB/SMiOVx+/teGvMLShPBTgVcQ2dgPKUnHVfKSF030KBl
         aqxeY9MoSWSSzajOb+ObcV+BCHkhzz1E6LnEXbAq9gyom3lYMm0gSxbns0HrNQgPrA30
         B8tw==
X-Forwarded-Encrypted: i=1; AHgh+RrUwEyFi7zUbFA+Y/yMhg+9a6qdPmYpJH2bMZI4HuZngFy9AzGIl8R287+W4H+rGIgF0K609PBIK0D6mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz50ZnDoMPo66mNMk1KHcQrV7vNcWC+ToQlgRiWURGmEPpq0l1/
	TEZUVvpPVAzREknnkn6sVsd6OT9RzWrKkEzHGc9zcpYmDQH0cv6AIqzkf3g9d2OP8xlJLRdxeN6
	N1Qel+UAmp4EHyD2BDKUnoihyxp5RZB8hT/tFFOZdKKycGY/Cca4RdEVtcrT+sKXfNw==
X-Gm-Gg: AfdE7cmMLk5aUkWwRrESOOk0RWuzW7RR8v5+Nm1hTrw5AiE9NcJOoEWIvJfvvRdZkAE
	/hspq/cbfNIPDSkjt6hNNTl0CDJRUCkrqgDs7LKsK+dIq8xUyUuVfU08y4BzWGxSo23Cjk8bHij
	yFczTd3lZ/uXuoefs3Ls6oqDnNK/qgztBPaaiVfGCpgP3eO539loIZwYUhdzxkm2JL+EKaRXk3U
	a9eMZZBIx4YPBvA1CqTwp0/Z+MVp2EQ6Hz24LMHsTIJsrRNnpX9XUYir1oqDNydz7Uszg8ZWzfv
	nboVWe5xPR9iaUS0YSoCRav49y7pynTqdn9iA7QrZQl2XJre+a8ngKGqZstbssbp7B+ghX6ntvp
	JqpWE3d0tu2rrusPyyWou8vT8vfc0MPx2qmuGkoMnvz7lLnB6ZwlxnFJGRjWIdyGr94nEedDJkE
	Zh834TazFpbLplwFiVerRUnQrH
X-Received: by 2002:a05:6122:6591:b0:5bd:c32e:b6de with SMTP id 71dfb90a1353d-5be908d732bmr354813e0c.14.1783346391309;
        Mon, 06 Jul 2026 06:59:51 -0700 (PDT)
X-Received: by 2002:a05:6122:6591:b0:5bd:c32e:b6de with SMTP id 71dfb90a1353d-5be908d732bmr354790e0c.14.1783346390851;
        Mon, 06 Jul 2026 06:59:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377052sm2893474e87.21.2026.07.06.06.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:59:49 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:59:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: iris: Add support for Milos (VPU v2.0)
Message-ID: <cq6g5btaybsaloxcnlpruqg7tivve6jew4f2dak3dmpqj4h3xg@gpaogxd7xwfm>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
 <20260705-milos-iris-v3-2-8c1353530f24@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-milos-iris-v3-2-8c1353530f24@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfX2yO5lWAbQpXg
 4YuNPPXDXBFhPEGodWzsT19OTBKWsOBmHqMM+iWJe4V/+4OfF0v2CwMZq9AlJwN+g2Ag4Evrl8n
 tpwcYqhOrkl+rT28WyjlcgG2AZknDhTkUKvz6Wdy2u8pXBFg5IQjlMblj11XPYBoEjqjefpMiMx
 0gvoDyrzKpcSUSY2059M6UBIIFUZRHQYpEek6CnHVIVBRQSvHzjss6ufKLlQF9CgQs0tPTuwYFx
 bup4d0WDNMeITutPgwOcI/q1getKL0sMEdEbfCOJ3IF7hqstbdk5fN19OW3isevREpN035iKKeQ
 uoteuEbhyRq1y5wEgXFGGW3ckEiZC50Awvp0nqFLor2w5aBhQfmRo+mmPBq682rxpvRdcp2Nxjt
 b+sq4O8CW4LglQ18FdjZ3yg2xMTEf76kCV1I5URMLCd4tCLI6JOfNyE+llFsT2YxN3CVeXmEZel
 o5kPy07NH7WTZb5ggZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfXz1gVC09UDaoj
 oE5ZmCRV1SzxDnWs8oBUHYkDeann8lyarLc5kvoXE52CcqDC99SxS2nUnLDAqrvP2fk5THZre5E
 Sk18X/+IxjG4dAbh/dDjTskz6scki0g=
X-Proofpoint-GUID: 9zud1LwVr_oRAY3hM1XTrs8GKfjh75_B
X-Proofpoint-ORIG-GUID: 9zud1LwVr_oRAY3hM1XTrs8GKfjh75_B
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bb4d7 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=vkwYq-XpzzMP6zU4_eYA:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060142
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66776-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,pm.me:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7EED713071

On Sun, Jul 05, 2026 at 10:10:35AM +0000, Alexander Koskovich wrote:
> Add support for the Milos Iris codec. This only supports the variant
> found on the SM7635-AB that has half of it's pipes disabled via efuse.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 883 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>  .../media/platform/qcom/iris/iris_platform_milos.h |  28 +
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  35 +
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  5 files changed, 952 insertions(+)
> 
>  
> +static const struct iris_firmware_desc iris_milos_desc = {
> +	.firmware_data = &iris_hfi_milos_data,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.fwname = "qcom/vpu/vpu20_p2.mbn",

Nit, please use vpu20_p2_gen2.mbn at least (or, better,
qcom/vpu/vpu20_p2_gen2_s6.mbn or _s7, depending on the MBN signature).
It won't work with gen1 vpu20_p2.mbn.

Otherwise, looks good to me.

> +};
> +
>  static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>  	.firmware_data = &iris_hfi_gen1_data,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,

-- 
With best wishes
Dmitry

