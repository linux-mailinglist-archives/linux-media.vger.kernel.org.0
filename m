Return-Path: <linux-media+bounces-53767-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMfmAyD2oWkwxgQAu9opvQ
	(envelope-from <linux-media+bounces-53767-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 20:53:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A338E1BD1E3
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 20:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0ECB7304202B
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 19:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8968E46AEE1;
	Fri, 27 Feb 2026 19:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQpUZ1u6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdBAM0/j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E8436F402
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 19:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221979; cv=none; b=P6bNUd4fnMIFawz/0OYtHO4StclpQ+xCis52hQOVephHqgiUmgZ7GGKnYhcyb+UdmfsMVT/zpplktfl2hU2Ko1GEhLInTLR93HRVp0DmoP+bVNwPM9tBwGTL9WbswlUVedypBOz0g0eYBpAftJKB43kDYUktNcED3aTTl/diosM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221979; c=relaxed/simple;
	bh=xQ04bpy5cT/HPxv8GhdIAXyz6uWldP+TKSsvStO1lsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlJ4z6stk0LPwQbGQo2LBxPZhavdeZUnlcramADJiBTcVpuQdVWUV6PJtBGLqFIY7xPTXUOtWoyQMYkphFGY2NBKPlJ4T7Q9yX474Bqdne+Q7+VFoHg/pm3GRVYeZCii7Srq2QHMbZIrxE3Lmukvpqs8ssNMGgpSPVb9LnsH4lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQpUZ1u6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdBAM0/j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0IMD702172
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 19:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GV2vdzc/TRaF4f8dfG4rJXZ2
	LFeRYlnAduxU+Ay8fN4=; b=DQpUZ1u6OkALzwe1XRol5kLad0bXNl8C3geIxs6O
	wHtIS5+mvtmDkIpnYSs5MM5NVFhzRqA4JbQq+mEsORuGb5/JtLx2Vz7vRHZCNg4+
	4gYzvWTICbkau3egFf7Nj2S6X/l3aeXc39zN/GBXgPVXNfsPtiq3K/eRHsEZ1sFy
	Xcq2nmr4NLvH/o9QbA8eMPHjbQVNkoBbMET4JxE0YGqyppBdG0as3mdUsCol3OvU
	SyC2ZRcd+wpiUy4ksVWeDvD+ziP83QOLaDKx1sLKmP18HACo2EK1AhJFmcQQsr1g
	Jztt0JvZ7GSJ9dcjuB/2ICRxLyqUDyBCro6uk0d1x15waQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck8x89yen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 19:52:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3ff05c73so1854502285a.0
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 11:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772221976; x=1772826776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GV2vdzc/TRaF4f8dfG4rJXZ2LFeRYlnAduxU+Ay8fN4=;
        b=NdBAM0/jn6vJm91KRCp7IfoDo1QF5u00irMtGcKGUeLISj0Tqyt+vpdz73lSeMu9v9
         an1lPE+OBQku76C7HnIW1qTK6Xc1RuhYro8iOwXAvbAUV0WVX3rSNm+EmcFAC5Fl2Dtw
         EsdSE5lpRFr2xKwD01JwLKfrwq55/US52DYBmlyYIv0twETH5VdlBuLw3DqHwHQlkUaJ
         gkiMJVg5MO5SO9VivmnZtoZMU7kPen3X1OYXsEoFwXJyB/JeREGcTHxEwSJgrJh767SO
         /jYqY2zL4kC6wcmqqSPR7xd5NSIXS0Zvk7HKwvP3SfDZVi2nV1JxpyAUWumbcOj2+T/t
         SK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772221976; x=1772826776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GV2vdzc/TRaF4f8dfG4rJXZ2LFeRYlnAduxU+Ay8fN4=;
        b=wLdbM9Wzxzs+H1rzd79urSH/UX+S0gkbZhIqRD9wQw3rJUR/A7yfj+i+PbFBNUu7/w
         WSDAxQqTe22zBvYfK6E+YeXGTSBEX0lSxUe4KiQS5e/XzXW9t9TAEtn4ttvsacZJqs1H
         WZzECtWTzHHpcC3Zjbw5f2Dv305PG9fTQ3j0v7JRjH2upel5J1COFjdctoQGD0c6BILu
         vVv96rgyIVSHg7PbB9gbDXXzl1DjWalhFR3i35bsv6F2wNwj7m6Vqk7DZ82M1QqF/roU
         0Mev2YMzrGlRxCHPh8AYATtQaXq2IkQ9bJYDYzggfPkrG5lyPSCUSzxmVf4SfqoHjTm3
         57fQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5IC6p/8w2YnREhF9rn7MsHTCdVbX281R5DuhOKmpaSViYC7pfBZt9htWKG5EYR0syUYZVL02l4ijRcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJxvcMwXqU/1K32oCzpu6qbwFfH4Br7xkrRZA1sPGw18ceASjS
	LaU6H/o5ggyS/AZ5S8mjLwMi+4BK7qc+qy0kwUzTDmj+dDD/AI4XjWNKbAzVKziMl8ARYfZs7j5
	bJO0TTLaDvsbJ1/vJ1N6VncPu7TffvL2dvaV1x5gaeejD5CD2/tYj5n9RaR+Io6FU5w==
X-Gm-Gg: ATEYQzyW1hjeFre47cAFWzC1pwZj6VcmdavHs3y/Z5y0sUxeUMb1OVWXRiDkQxKRlft
	09arn434GB1Gx9qQ72rJzyrrrS1Z0Ae5HMy0VAzzOcNbOnHPTgas38GeBxzbMfv6qllsR9a8jd9
	etC1w8yVNRnAf+FbQtH1zafC8igAY/RaYE9X+RB22HaCAA+iF/vbugQGjUgr6XqnoWtw7NZlSTg
	01tiLvEgtOsrkG3yKbK2tKDsIMJnAN/mRyU1G5sG2naGuuko+JyKHDGJNnvHwzceC40/olvy0jB
	Tv6ksN5QvSU2ZH1iDKp+rAk7vsgFLK6NyBfRGoWHA1d3Fx0lE2Jq9oSqlspRfoHa+6ZqMGX6UsA
	MSKzux1dw4cr1Wkf+ruqyp43QYaVdbrMeTdenRGJM85GYP6vhoFP08KEjv67UJnfboD6GNAbYq0
	J7k36jaFWhbaSoTWlz++gPsz2uj/RmfOJ1rqQ=
X-Received: by 2002:a05:620a:7087:b0:8c6:d343:79a4 with SMTP id af79cd13be357-8cbc8ef670amr482959285a.40.1772221976091;
        Fri, 27 Feb 2026 11:52:56 -0800 (PST)
X-Received: by 2002:a05:620a:7087:b0:8c6:d343:79a4 with SMTP id af79cd13be357-8cbc8ef670amr482956385a.40.1772221975562;
        Fri, 27 Feb 2026 11:52:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b2b8sm15082771fa.8.2026.02.27.11.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:52:54 -0800 (PST)
Date: Fri, 27 Feb 2026 21:52:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <nen35eqhwbikt7jlpxn22hvur33chxibrbmzd6awo425i3mujf@f2cbncxpcatc>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WZwBqkhX c=1 sm=1 tr=0 ts=69a1f619 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=c5cdqb5w248ZMfMtUIkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NCBTYWx0ZWRfX4GtCOb6yEdUC
 jyog4rD/2U17INK4G+ODbliM3yQoa6OH690OMazDPG8bO9+dWxSNtSLXSZsEvAlZFF3KSbRZia/
 dMDeGEeojjO30aCVdkIn+/+x83EzS0S2ks9dyItjH7US750gb9bM7AAVeffWySBp6FMDM6VLtg4
 VHn98d/5IA8TGNAsQJB8Pxak9ZjfXVMCp0GV9+3hIfN0qeX+uXGIE3hQgBBJOb5RqIp5fQuHpmo
 5JmWa2wxODzjA05TgN6B0LKfHCtW5jpSllcM/fHOR5obltoRgVJ0oBJ0n7ce3mVWgLvH2GuM0oT
 GjRT92+V1nQPKUmGNu+3Kj3Hsggh8ckn9GwuQvs1My8eyr8uaXdj0blmTR7m2fE3135a3SDQhpc
 ZrwQOQW0yXQL7Tqo71P8gmnNb/MG4Df0L9gpOZBVnL8tTPwlJMCTdvar7sDOfosWgtyA22Li1vY
 SMh8yZZKHhlYFIYA+cA==
X-Proofpoint-ORIG-GUID: YBcnYReqjwgaaoYxZbfe6WvkOrVjMrcy
X-Proofpoint-GUID: YBcnYReqjwgaaoYxZbfe6WvkOrVjMrcy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270174
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53767-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A338E1BD1E3
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 07:41:17PM +0530, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.
> 
> iommu-map include all the different stream-ids which can be possibly
> generated by vpu4 hardware as below,
> bitstream stream from vcodec
> non-pixel stream from vcodec
> non-pixel stream from tensilica
> pixel stream from vcodec
> secure bitstream stream from vcodec
> secure non-pixel stream from vcodec
> secure non-pixel stream from tensilica
> secure pixel stream from vcodec
> firmware stream from tensilica (might be handled by the TZ / hyp)
> 
> This patch is depend on the below dt-schema patch.
> Link: https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-iris.yaml        | 261 +++++++++++++++++++++
>  include/dt-bindings/media/qcom,iris.h              |  18 ++
>  2 files changed, 279 insertions(+)
> 
> +
> +  iommu-map:
> +    description: |
> +        - bitstream stream from vcodec
> +        - non-pixel stream from vcodec
> +        - non-pixel stream from tensilica
> +        - pixel stream from vcodec
> +        - secure bitstream stream from vcodec
> +        - secure non-pixel stream from vcodec
> +        - secure non-pixel stream from tensilica
> +        - secure pixel stream from vcodec
> +        # firmware might be handled by the TZ / hyp
> +        - firmware stream from tensilica

Why are you providing description as a list rather than describing each
item separately? Then you wouldn't need maxItems.

> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      $ref: '#/definitions/iommu-types'
> +      minItems: 5
> +    minItems: 8
> +    maxItems: 9
> +

-- 
With best wishes
Dmitry

