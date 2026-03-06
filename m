Return-Path: <linux-media+bounces-54807-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PGSG2T5qmmqZAEAu9opvQ
	(envelope-from <linux-media+bounces-54807-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 16:57:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D51F322460F
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 16:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C027E31AB2F2
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 15:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E2F3EB7F8;
	Fri,  6 Mar 2026 15:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEnu/OnA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSKvvwhe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C054366569
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812153; cv=none; b=ML+n0gAIqly6Lw04pvwTGFmcPUq6pScSFrDIonDPFEjxy6Pi5XqF+FekOhA4NWt/Ck/pMWSabPVIHHKORtFng/4/+/XolnTfbDrEAGHkdr3jnhLcsbMhqjIG0H3PXwSRSXcTFiVhBSOGAI6ewMB1oW81fvzOuJMmlk05LYlRSho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812153; c=relaxed/simple;
	bh=HltvsgB/V32MMRgrH+wmQKGVLrI+i/tqgjQTY4Hm9Xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLaFKMT1AOMqmzvFR0I250451KO4auf10ePqcQPb0cP0JeF8fJOJs9Jt5UVcI6YH38dp5Z/BHVw7mgk3ozg2P2v9sPhRDM56V8tqFZkZTbTDYn82wRWBxK0IUsuRFQotx3HuqX4kPRYa+/jA8404IaOFicTCGdmG8vdI/ZKUZDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEnu/OnA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSKvvwhe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FT0Z71130693
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 15:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/756cthtUIgOJKo1UJZNjKGTLA8f8YYmW1bpSBDIWY=; b=cEnu/OnAC1cBRLNl
	4oQ9YSwsZrvBAX9vdKjIs9IzdOxhYHFFQ0EAkTpagLjsb1DfxR5yMosUQ3mz5pDo
	S0lStsQEKOV0jFVu6gcYfnTboyaow+s2cJOaGYaQfpvaYF+RmDLZPh/Ec3Q4HHzL
	Z4ms2RHS4O9mHg1ZDJsSdiKGKAVEjPMiGp0rVjpjmHAvTmzI7XmKLHrZcEGy0R4O
	1Pn0H6H086qujpi/XmdmZdKzDTWEaQZJn0ctv0+8fOqWxpWuTHXaPT4sSIpbZi5c
	jEt096fLWsPp3uPV3vFuKCWSlMp0pyiUXcI3mQVepsO1b163WXom9joVA8/cXTl/
	cA1vHw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4sb8yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 15:49:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1275c6fc58aso17579824c88.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 07:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812151; x=1773416951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/756cthtUIgOJKo1UJZNjKGTLA8f8YYmW1bpSBDIWY=;
        b=kSKvvwheaYCL5qs3+i5/BvfecewIjzCRavjPYMdGGQmXchcsbabCeuCIug4SFzfhPb
         Aud6seKfQKmfhB9N4mNo6/1aq3P+hcCJVOhXi9TROOZ1IWGxBL3c+bqzJwSajPlakodt
         qV5sQ1377h7TDQx8cAQrYQBLXnDPTM5D9Q5ObtQWH/XDgEmwz3xi7jjs+Q3p3pgf6xEF
         pQXAtlCgRc1fdac43qr1VFguXWsisLs7sw/XwowqDeXu3/i0O9ZQwgFNmCl8jEeqCdOr
         IETAKnCN19M6ZypPuQvOS9BI6laD1a52vU+VTcL2QPgZqd5yl8/vC5b1VMdPwe8Ev59/
         bU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812151; x=1773416951;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/756cthtUIgOJKo1UJZNjKGTLA8f8YYmW1bpSBDIWY=;
        b=bMIY70kbPwG8I2Wx3dhcpBFjXYAIMj3qIrxn4/L4ovL6LeiwFTHWLZqzIw16M0tHzE
         m2vyfojWrfbz/1q1zLhqPHO+sCMSNxnROSCC1hza/gxoXiCqUkCuFiB5yb+2QSHSQvw5
         2Bmr+2XDdn6W7AdY2PUMtzfozoHIFXZxgsp0+fImO217HYg8nNaHqmwKqjcL49be6pmF
         CZ46Z2h39bPiFfqwRqJr69ZtcDnsU52IkQjjib3ocWtqfAYeml3TGQwzYPCYgyNj8l0Z
         J24KdkASEl46aPYjeHEcThoY31GXw1P7xihXRHYqJdt6WQEUva9u2njfTPGjI3etQt27
         PTGg==
X-Forwarded-Encrypted: i=1; AJvYcCVPqVPYJpUDchOH181IPdQ9eM81yBiLsGhxfwoiuYn7E691RRjSNZ5lKOueo4DJ7ykq0QvuABYDZ9ZPkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7IeRY/zwn51CklBESVx9BF0UcZNm5J2NPfi6M2Wmt0JGYsMoN
	OVQ5z8F6bDvFVsGyR+cPINsXlIfJnUQynJkq+7SDgZjT8FoDungptcAHH3VyEg1cYEnECKs4Wri
	DKYbhYpBLpcTv3XqsBTtDv+Bv9v9yveRG/GUaRtIScWfJLMprwcCY5LXmVmK4xxRBlQ==
X-Gm-Gg: ATEYQzyKJ+p06+TYcP3vrMXD6O4b0qJ46Igxdx+tBawKw08SCpL47Z8Re63ahp7erZi
	plgPkuSuWb99yiGMcjNLkG9r41b+PLoYmFq0V7tUj53lm5NLlZwBJFi6yVvdHF0b8OQ78o0NdH2
	pzcyDEiusCIoHD7JGt7uPD7vw5tFSxjbtntfvI0bPyD1A1g/9OSHbgHOp66XSMltdfZGAy5DOOQ
	2/aWSEmz0gEMWOHvfs3aFBW5ssqigg3Uu5h0tDEkuT7yvPYsPzoetJdW33kGnfwTTpT+uz2jn9a
	Es8cEbIudWk40iged3qFmQLXFB7pehok8T8HnRW/Ryy4Lwk0FQZjL0xVN23mL7cRkCi4y96eK1/
	6dOq10JsgMQo3MA7tYytx8LLXcRozjBSQZ5OwYZKuBFox1Bx4Z43wEo9sLYOeeXQ3BqW1Zs9GLr
	NI44QplENlKCq6cw==
X-Received: by 2002:a05:7022:6898:b0:11b:e21e:5653 with SMTP id a92af1059eb24-128c2e0c967mr1056272c88.19.1772812150837;
        Fri, 06 Mar 2026 07:49:10 -0800 (PST)
X-Received: by 2002:a05:7022:6898:b0:11b:e21e:5653 with SMTP id a92af1059eb24-128c2e0c967mr1056220c88.19.1772812150163;
        Fri, 06 Mar 2026 07:49:10 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f58d24sm1497977c88.12.2026.03.06.07.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 07:49:09 -0800 (PST)
Message-ID: <00a7e65d-aad3-4029-af51-ff0870e65595@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 07:49:07 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260306105027.290375-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfXxaBlPYS+PADp
 atwecYdN6fxRm9LoL4HUT1OlzZfr377DWGykH0whbjvgGtvspMICX6nvJVY8cshOKJDDq+YjDEh
 TQjj2IoUOFz3Bu8YG1JV409V1EpEXuWJS8ZI+XRB1mkz8rC0O+nYM/JDPGipRvYNLuC4EW/+Sog
 HwQ43ipClGn5J3sDb4uDAj1GkQEARsYvQhKUAfqonr7cb2SAH4EVJP+p4Oop852M104g2ptCm/b
 Hzd4xmq1SY9ZVjmPpf2JM6DUpfTgcv1auhsRK5LjxSV//Z8Kdwxjl/hxZDLLYsYUISkaDQLuqI2
 W+6hRV/vSzZskQ8VdTOEYGL8lV1t7t4duBRAlgVQPBT9MPdyaWjNebT/Rcps2tl2Q860hgx0AXQ
 Ev+rltwM6X+mQS+GD0mVeDcF+9SdLovMX9NGC9oQRWahrGGzxc5l4jr6XzFrK/ARlYSG46+SBFq
 lYGen5VDkLyMUhHv8dg==
X-Proofpoint-ORIG-GUID: Mks3lM5FJmqkj9XX5qEel9ypLyyXwo6V
X-Proofpoint-GUID: Mks3lM5FJmqkj9XX5qEel9ypLyyXwo6V
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aaf777 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=PJDN-9afRshu8rMoDvAA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-Rspamd-Queue-Id: D51F322460F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-54807-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/2026 2:50 AM, Sumit Garg wrote:

I missed one k-doc warning...

> +/**
> + * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware

s/scm_//

Warning: drivers/firmware/qcom/qcom_pas.c:173 expecting prototype for
qcom_scm_pas_auth_and_reset(). Prototype was for qcom_pas_auth_and_reset() instead

> + *				   and reset the remote processor
> + * @pas_id:	peripheral authentication service id
> + *
> + * Return 0 on success.
> + */
> +int qcom_pas_auth_and_reset(u32 pas_id)
> +{
> +	if (ops_ptr)
> +		return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
> +
> +	return -ENODEV;
> +}

