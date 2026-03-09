Return-Path: <linux-media+bounces-54939-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DXcK5yqrmntHQIAu9opvQ
	(envelope-from <linux-media+bounces-54939-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 12:10:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9443C237A27
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 12:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0695C301C157
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 11:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D902396B91;
	Mon,  9 Mar 2026 11:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hauCw3U4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cq42dW+N"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB66396B94
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 11:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054617; cv=none; b=KFNaGtuK0nH2wH1QkEGllzFTmZE/J0qAiVfe4JOyOgozl8IOBCjZBJeBoq842BTyRrf1/iV6/QmOYmTww2OKKTeo2n30H9MRz9WkO6VjI/hJ3FnSWmP4bNmfv22GWyDusdSWpdO4K6zSd7gw6ja54isKbQu0ujPRHyOwoMw7yRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054617; c=relaxed/simple;
	bh=iyAEtYcmGsyywqIMraEv73+h8U2IOp5hiEl7qsT6WRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M11O0Lq0oSw3MfVpCWLlN2syVqTuapAgm0TAyI6ovtN5bLiSu1E/Q4C/MV2yECl54EyJfqZA514MhVWYOgVv2ABfJ4eBrXOhw80SNqxYZ4wyV7VA/kV/UTENXjpSynSwoimzZjpmYtEFsEbYlgdx1fvl3Qslmjfe+XstjTffjWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hauCw3U4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cq42dW+N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629AC7Zp1128815
	for <linux-media@vger.kernel.org>; Mon, 9 Mar 2026 11:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fCIwqs8E8Q7VHLpSSyfHaG+lQ+pJmP5Ydl3CjV26bRk=; b=hauCw3U49n5p/ZgD
	zSX5aoN6Ozz/g7sN+5DiRAEwmPhgEouy0m10/5AYeCEtgdtMZATRpH0A0lup+jAK
	3egRmZxX38xDg5Ccmmx9rnQeL8L3sagcVeatO9TV8nCQ4btqwZdfZUCKUBsE0nbY
	FI/G9ZZa3h9s4wdyBzdHdE7wXnxrSA50HKIgB+sM+H2XdkNVVRI7qEKzTa6Oaq33
	tBh/8wfYfl5ICQoYcroI9SflpO1M64LdOA1a1gldyubSsWxQMOgrQdTyXKG7aaT6
	bDHzkTzxsH+PKstG/gQaiPf4wn5GMqrKpYsm5fkQPyg6qAK3FDnPxICqxU/rp0CV
	9IWKDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8d23x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 11:10:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8dc8b434so36939285a.3
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 04:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054614; x=1773659414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCIwqs8E8Q7VHLpSSyfHaG+lQ+pJmP5Ydl3CjV26bRk=;
        b=Cq42dW+NTUcbYxZR7RqRLU25dn5t30xbGN7tniJTFRCROZj6irIkYGB+4V22J7nIQg
         hzVkqNpJNZUhv4yaDOxlXoHlZGis9/t0hbYqYMrXp4QwoUW+LRaK3SpL+Pb/gJCo0gPP
         MNAe2/mQ4BrVG9b0ih5w3DLk8Y3/9lHh91FWZDuUm5FdC9cdyX9UK3vjWHJN/MMGkCIf
         a8PcNeXzVONTAQHXT+UBmXmV9s08pw2np3qE1/X4A1vT8JcFTzfZ5hZFdZtXQrW5VLyC
         tD4AQ3PJg6HdFCyNNoY5C2YPsCSPPDc8cizuYdfcr+CKCHTjeEtER4umbCwGQJe/h8/b
         rsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054614; x=1773659414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCIwqs8E8Q7VHLpSSyfHaG+lQ+pJmP5Ydl3CjV26bRk=;
        b=e//d85TCaA1M6CDGPCE1l4O5HNi+pJKPGDT7juNQqJLWvGTHVg04tzQqPEurTmt54+
         YV+dxjWeVkO/Nbf4KARw0sMW8DPMfSWlV43DcpLNxDej5gOfs40aXXdm3VG/g41fKWJt
         UGOKAFDTdWQ8ijmqW4tE0/FAY/JSxfwz2hEtlDvV2ZKKLwZDNLMXAemzVjq3IIZY+Gxs
         3DTiI0PHj1scRrBuTDYNx0Hb3/xy8nRptlTOaDhxNImXyZUJFVv9gyWDhXv++PBEkfLa
         8wO+oWD+Ywazx8GhAWVewOI25jMwobkfIO0vPz6DO0S7hP2bc308ZKiAK6+djOkQloz/
         zy6A==
X-Gm-Message-State: AOJu0Yw8LNXh+JK7mKNBtDa8RcSoSKHbexjEy1tmguM4p5Lv4mceE7vb
	wVQ2qcFaFMAzFDPxMHti1c+c2FJKqH/fHEAtLWspB2Vb5l2HxKRinaSfkR1nhRIkm93DpLl5E7g
	wB5nXvLihQ9cDPbky4MB878S2IXCkysoO8NW6rIjCes15Jimh9MjBIQoSOPXHM4/Sdw==
X-Gm-Gg: ATEYQzzW5vO4LxzA94ql8yuTDjlKNbzz35tLhXMRzLxfq5lzmBtbvvTlyMX4KWndSgI
	NWOJTbMHhiFoTdYTX/N/K2tqD7TLOfkgi7S/yQg65LbJV5sa3Q6pTFBHGQPq9Bk+pdL3C0K0mtG
	WM0rNlkvVfXwkns6yqScoVPka7CC3ADGPTE0qQ11eKho5PwheZZ0uscMmeZrCeF2OWGqHT4TO/n
	xHqh7QogqIhqN1LyTQ0PLwB6DNVIBHdI5rG3jPkBzx9TpIMKp7Tc52c7Lxvpp/KaCc02gaJZ78s
	XDuN61IxJUUtIkPTYVAlzD8v8GEzPRf+t71QKxtdXkArmis4c2AvssA/aJ0ut78pmhNA2nLx/Fa
	7TA8LBzedcdt/bp990iWx2EnN/1YuQfVdIC6+YiZQpK2wcy76vM+lxaQD2zX3zxAFEx5oC9Xzzb
	hOrGU=
X-Received: by 2002:a05:620a:28c6:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cd6d49bcdcmr999577585a.10.1773054614119;
        Mon, 09 Mar 2026 04:10:14 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cd6d49bcdcmr999574885a.10.1773054613709;
        Mon, 09 Mar 2026 04:10:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a4fd5e87sm3125513a12.18.2026.03.09.04.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:10:12 -0700 (PDT)
Message-ID: <d60503c9-0bf1-4cfc-ad18-66ee98a24d8e@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:10:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: camss: Add per-format BPL alignment helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZOwUbMQuPt5wkldUqqIMIJGeK3ZtTx9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX1x3oIkf19NbJ
 vHy00VxpVtVtR9sDLTGuII4UMXHMXRvgg1LtPxfgnh1FsBjXmAg3yYGX19YHxlimc4IffeYAzH2
 uH1EiQ9gc2vZJ1rrob/sN7kNyzN0QDHQquek5dq/zwkjSP3NkS8NaCVt2wTDg9llUZP0psNu3wM
 PDglb8zBYIIFGMRrfwp5YhYrujdmKpwsTTVVD/j5eORGqi7KDqqNgiDKuuj3zMSAOB/KDdPPLB3
 K6UD63z0m81QsfR5rPLS8lN5CMAqvXS4Z1H1HG/fg4ih2/O5aitbA6+GRXg/ROCn/8LZrYE7+0T
 vqPxDtmpbM5Ei959ywsowEkfrcHNJRvYfJ1TtdjxjAFZFbedlit+9MqwHBr8RBd/bQrrMm7lIET
 gtFzLqjDQEdxgQHU8tTvL99Xxoix1rOEm965RXgjvDrRB48knjkdJihIt2VHuZHYk/ICEt3Y+7Z
 BqyXApAp3NK+iA6K3aQ==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69aeaa96 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=D8QFBKxsMTPPdba5kpUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ZOwUbMQuPt5wkldUqqIMIJGeK3ZtTx9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102
X-Rspamd-Queue-Id: 9443C237A27
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
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-54939-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.950];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 5:00 PM, Loic Poulain wrote:
> Add camss_format_get_bpl_alignment(), a helper that returns the
> bytes-per-line (BPL) alignment requirement for a given CAMSS format.
> 
> Different RAW Bayer packing schemes impose different BPL alignment
> constraints (e.g. RAW10 requires multiples of 5 bytes, RAW12 multiples of
> 3 bytes, RAW14 multiples of 7 bytes, etc.). Centralizing this logic
> makes the alignment rules explicit and avoids duplicating them across
> the pipeline.
> 
> This will allow PIX paths and buffer preparation code to correctly
> round up BPL values to hardware-required boundaries.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/camss/camss-format.c  | 28 +++++++++++++++++++
>  .../media/platform/qcom/camss/camss-format.h  |  1 +
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-format.c b/drivers/media/platform/qcom/camss/camss-format.c
> index 4a3d5549615c..2cd0f3a0bfac 100644
> --- a/drivers/media/platform/qcom/camss/camss-format.c
> +++ b/drivers/media/platform/qcom/camss/camss-format.c
> @@ -33,6 +33,34 @@ u8 camss_format_get_bpp(const struct camss_format_info *formats, unsigned int nf
>  	return formats[0].mbus_bpp;
>  }
>  
> +
> +/*
> + * camss_format_get_bpl_alignment - Retrieve required BPL alignment for a given format.
> + * @format: a pointer to the format
> + *
> + * Return the required alignment, in bytes.
> + */
> +unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *format)
> +{
> +	switch (format->mbus_bpp) {
> +	case 8: /* Plain 8-bit -> output must be a multiple of 1 pixel (1 byte) */
> +		return 1;
> +	case 10: /* Packed 10-bit -> output must be a multiple of 4 pixels (5 bytes) */
> +		return 5;
> +	case 12: /* Packed 12-bit -> output must be a multiple of 2 pixels (3 bytes) */
> +		return 3;
> +	case 14: /* Packed 14-bit -> output must be a multiple of 4 pixels (7 bytes) */
> +		return 7;
> +	case 16: /* 16-bit -> output must be a multiple of 1 pixel (2 bytes) */
> +		return 2;
> +	default:
> +		WARN(1, "Unsupported format/bpp (%u)", format->mbus_bpp);
> +	}

The intention behind this could be better expressed with:

#include <linux/lcm.h>

return lcm(BITS_PER_BYTE, bpp)/BITS_PER_BYTE

"take as many bytes as we need so that we get k full pixels"

There's probably an even smarter way to write this that doesn't require
BITS_PER_BYTE to be present twice

Konrad

