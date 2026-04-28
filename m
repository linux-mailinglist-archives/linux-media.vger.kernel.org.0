Return-Path: <linux-media+bounces-59821-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIHPN5B+8GmUUAEAu9opvQ
	(envelope-from <linux-media+bounces-59821-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:32:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B334481790
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 327ED301FC2C
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0B838E5FA;
	Tue, 28 Apr 2026 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GomCBRJ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePVQOd1D"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768A438B122
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368562; cv=none; b=uM9VnoM9ntr5z25PKnVs62xjPyRMD4EUsNHr+5XVnp5aqusRSC4bkfOS2S75Y3Oo2bLEOkeUXMpZnLKGNSh/rhBvDt121qdAxCffS0MFIt4CiKC4f6QORaSGVT2ohWb/PFXXYnrxDiEF8fGWYwJfCiZa0vUlAbEGTw/ml7SRKeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368562; c=relaxed/simple;
	bh=6ooJNRgge+wNLJlUOuaPSpp1aSiPjspeHL9WZD1ACL8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YtXTeiHA8DU/fQGQ4SCktHdetle6qjvoE7myL8YaMJNJHRhEzC0KhTqCbQ64s8P+oKQWvXo+gNtknVr1uzKoKG9gKx0oiccviRKLU3bWyeWYCLeXo60z7XQbbZegptLsA8Ug4UUHAiZ8alrHu5nsioos/46QhoXw3cX6fS1SoUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GomCBRJ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePVQOd1D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S42xxQ1329658
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZg1hGGlFvSeiNVnfEHti/0hPNyXIozsJ6khf4BIes8=; b=GomCBRJ5niXATR2h
	58JNfsvF5YZtFcCF/+qmuihIjWBANSNTMqmwNSZc67O+LeAKvPI4QfquzbCF0LkA
	W+ZenYjhrx+OOQHp2QbAH6RCOweNa6UJE+M5n0FKBkB3+YnGFReBIWIt6k7nJTtk
	lAnKkhsI9+ugGzOujfS7rYaLmFsCk8aiXtEZUScK46rC+PIbv64CZV4Dguvxq0Kv
	q3uJp2+lrBdtEBrf6Mt/pE+alT0HZh8As5PAqpe9WZroZnCCRHzLg9ORo6GE9OcH
	uFeCdyf8+tqSeS/i++cUxd29n+rb0rqNtjYkh9wSd/jfZivT/p34t2PEFrp6MedY
	TO250w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhah5vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:29:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e136aff17so204220091cf.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368557; x=1777973357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rZg1hGGlFvSeiNVnfEHti/0hPNyXIozsJ6khf4BIes8=;
        b=ePVQOd1Dv0Uwp52S+AZ6NrsfDPGhh8JLRp8u+cgbuJQa+Qqdt6A75kHo/JiSggYpzM
         rcDDDvD3h1O+j0BHa1LtyQgpEUYETn1Q3IpEG6T2h1WJKgkagWCu0Zjpz8PrepfI4A4R
         0d/gvMrJjsHatCyixCHc3rQs3vbDABdxTQBtoyeKNs1YBDLsOE+hVINCapKReSZl5KKx
         niCxmQDRGaVd7b4WojDbVWSkTPFhjGNbL9sk0aReYJnTtoP4Mq39AJz7PFpSU/qfCJ1Q
         jntu3Tt8Ybin+UxMMp2rvfsUp63NsEueHr5NdWjfjnZV2tppisfxPpoNf7xXfjYOZu+V
         hELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368557; x=1777973357;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZg1hGGlFvSeiNVnfEHti/0hPNyXIozsJ6khf4BIes8=;
        b=qXwCUmCpOVCQqU260JBj9BkhF6aE3NR0iP1HN6UXBU59SXgVVzx3ovg+wJen1OESr2
         0ySs51zIuMkvW3+M/NwVXbQZt289Q5KyaCFhVlZvK18Zb3PNLD0gUJc0Z1+MQ7KF/0gh
         Gi+AEoCQCVFu/hBUVZ6KHYBOIYxby+3WbZJUIvbBLvmJd3op4xpAJUQvS0ezHaHeGKDA
         dBnMdhxdLmkAqeTUpCYl1YR8fJ/jRH06BYutj1HZFndVD/WiioR3nBJ7pyp3cKp2rxfP
         7ZZYXKh/uMRH9m/fwfYf2bqBG+RJQp0oT83OZcmiSJCTu2apZ5uD3u1N9qj8oXNWlFfv
         gLKg==
X-Forwarded-Encrypted: i=1; AFNElJ8HgTXtZwlnAc4N83vYZ3s64lRAl1uVq6xtpfEZH7uZmmzl4MR49JCDZu1OvbHPLI2sP3xu6JSqOCTysw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLrXd/h0r+QY6rgxiYA1C5Jd+7blR2bH+aYfehoEHfLtRO9/bk
	0bRe3tBXKSvow4Rpq5pjba9VIY2GukY38GfiNlwAQ3FN98p5fHKT2PfU0m6k/+57OLyJM6Zf5R2
	cRv2i3BJW2995p2+WlAJBwUyG4iabHDBRTziAl79zKnLKCAbW994e674IjIq/il36Kw==
X-Gm-Gg: AeBDiesdaP1GTrBIjFetwDAF34fSS+oB5ZZ3a998ITFl0vPnz/Qt6y1ewrnQgHcZDDb
	H2fbnw4i5dHiYnmroyMeoSIy9pogqRZ67T8z3thaWjR8hO8sq+jncaOwyM9JNAmppqA8D4HiaKT
	B97B9p47bD3Fh7srluOCX8LHJcbNI7ari/v9O4iudS81LRwq+DBuoDGQR7Hj4ccRJOa3Zhb1e/O
	0YWXHcC3CBLEtKdEKwITE+8OJPnOrB0zetBu2XOcXITc80MAYBMD2YqptA28nTtPn1Yt++1oYob
	iNPV/2MnmJnuZmm2lyLZrizsvGxPqowP3zyHs/8Udfg35/SOi0QG6EeYa/elCQaAG3wb2BKqbJx
	Xt/wxFQHbpAJ3iU0If2Q+CCJNPjowsvuzebIQRg6S0TgBV00vKQDnJZH5aeG73NmiipJIue1lJn
	TYLivF6DCk7w2/ZAwUWj5Ju+jTlTWKiFDvimFXYOfj1gaTMvBDgfTgyRKsLikN3ULZ792iFNj5x
	j2ckq8dpb4+lACt8q2AZlv+IIA=
X-Received: by 2002:ac8:7c4b:0:b0:50b:4778:ac60 with SMTP id d75a77b69052e-5100e107b18mr29463191cf.10.1777368557492;
        Tue, 28 Apr 2026 02:29:17 -0700 (PDT)
X-Received: by 2002:ac8:7c4b:0:b0:50b:4778:ac60 with SMTP id d75a77b69052e-5100e107b18mr29462961cf.10.1777368557095;
        Tue, 28 Apr 2026 02:29:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b2adc60sm71374666b.30.2026.04.28.02.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:29:16 -0700 (PDT)
Message-ID: <87a8063a-bf41-49dd-bfd0-505f4284709a@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:29:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v1] media: ipu-bridge: Add support additional link
 frequency
To: Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, jimmy.su@intel.com, sarang.sapre@intel.com
References: <20260424021913.48020-1-serin.yeh@intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260424021913.48020-1-serin.yeh@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX2UGZke/+n207
 JECQoAuqEBKDVKMSjox27b+vhzSe9N8upOBEkL2TVDkqYYRTSoYOToVCeiAWupPOYNeIGAi2MaE
 8GqmBNHeO73MkjXiegC0XYnwC69v+9GlSddO6m9zF0tkxc0lUlcK9DLrhEs3by6tOx7/Z5Cw6fr
 5v/4Ft5ya1DjcySvX+X2hkw2Fm7SvrD+NAeqFIacyNtWFfip8/N/XL4tWkYvA1J4wL2tb9FxIvs
 7P8FQMGSIAPRSAFXYmCC58VMwcgDhY+s9hxpwkUpmK5m5LEKUN+Nh7zo+CAk2jhuDUyrCT5roXM
 j85igYg2hIGXFEeyM0zkJQga5rzrzSCLp5d4CZ3QQ7D/V8SI4Wev2G/WDP70rfyDFnT1W7Nod4v
 L0ngei3ZqUfvja2d7f738k59L4Y1WVDCvo+YjyMwEXXV0kDOAQxGCiXfJ0e5vgojE0wAKd8VKuU
 g6a1GopcIx4e+gMj51g==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f07dee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=1cQsPNLajN4-O8LluwYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: MlPadrMRcULLRqZ9rzQOc8v7CntEKxRz
X-Proofpoint-ORIG-GUID: MlPadrMRcULLRqZ9rzQOc8v7CntEKxRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280082
X-Rspamd-Queue-Id: 8B334481790
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59821-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi,

On 24-Apr-26 04:19, Serin Yeh wrote:
> Support additional frequency 900 MHz for the OV05C10 sensor
> 
> Signed-off-by: Serin Yeh <serin.yeh@intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/media/pci/intel/ipu-bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 32cc95a766b7..f4828a691737 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -81,7 +81,7 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>  	/* Omnivision OV02E10 */
>  	IPU_SENSOR_CONFIG("OVTI02E1", 1, 360000000),
>  	/* Omnivision ov05c10 */
> -	IPU_SENSOR_CONFIG("OVTI05C1", 1, 480000000),
> +	IPU_SENSOR_CONFIG("OVTI05C1", 2, 480000000, 900000000),
>  	/* Omnivision OV08A10 */
>  	IPU_SENSOR_CONFIG("OVTI08A1", 1, 500000000),
>  	/* Omnivision OV08x40 */


