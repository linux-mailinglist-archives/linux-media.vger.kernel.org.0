Return-Path: <linux-media+bounces-64957-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tiU2J6SfMGo3VgUAu9opvQ
	(envelope-from <linux-media+bounces-64957-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:58:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B62368B1EA
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:58:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="c7ge/V1F";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Luhk3rd6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64957-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64957-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3CA830069AA
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EF3276049;
	Tue, 16 Jun 2026 00:58:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3393325A640
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:58:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571487; cv=none; b=DVES6DZNelugIdF8cOzY0PhwKllObLymbjH1MDid/69dHvb3/lnuzDk1ET58BB9AvpiGv0PPQA7JAtB0fZAlUUP+n6u82lQP3OfpXMJKkKpXO4Nqo+RxDVMd28td43HkpbryJW1twqt2mDYxT4LpNWtSXzlNgc47STZZPSXPrXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571487; c=relaxed/simple;
	bh=V2izehxJHiz5lHOcnoDYAHcF/YhGu+nIUCvOKbDgH3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbMJNclUta/wMUCkDVXk4+E7xzDUGS1KbNHmWJ29psRNs4UoS4+5Zq2LQnhLp0sPtXpEVMSa5cKL97jAO4V4AGCx2KEE8lLJAubdYy8SsWdSMutD0ahJf8BB7jpb0/taPJWlnhpy6fWtk36XGA+3619RavR83GpLpwLl1Ib0bps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7ge/V1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Luhk3rd6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0Nuio1584860
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OiyIJgSEwfIFbV0JUiz7Djf4
	fEFq9snfYC04/f9wwkA=; b=c7ge/V1F+A+RO8G2+cW3mG52ytI1zAoYhxSqdq5L
	mgv5DprWep6Y51lqjW0owMchRhC2g45k7MZPsbkMlh0HouPwnQMDWwitCRqFKX+W
	WnIq0g33dKn7UQAi8UsZ+0dIE/INvcdMFEzbfIg710FU5/3ebRGETxvND4VCsvnc
	gU+wjIGLGw3mOKc7A874s0VLqb1XHHPA+oaVjOuMOJ/vZqetKovB3aWcrZKepK0z
	twphHXyrQAOXZHmJF7RE10r4VLEjl2UV0+pOhlgCr1Srz/fvIXdkGTs/XBQFR3dZ
	Jp6lAdo6/BRyV6wl2W1txsEDBe7LfBX4T2dJhtFvvtNyFA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0kwax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:58:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9159bc52211so386996685a.2
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 17:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571484; x=1782176284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OiyIJgSEwfIFbV0JUiz7Djf4fEFq9snfYC04/f9wwkA=;
        b=Luhk3rd6Vi9qBXMKrZbKv9r91SZ4/0OvwFUYgr2QaxMPcuIqqpA9vErV8K7a2tzUDy
         gLY/ilB2y34IhvDF5fPdiMlFMqYNfMK9PPaayTYwBH/QaxKWRHkNYIaVhRMSeeF+NiuX
         NZaeD2xYqtyzFZNhWxR5JXwTthLqW1UzoJv6QKZ8UdDMMwMDoPQlEP8FWJb5rmXEAo7F
         ERYgrh8GLQ8CfQIutoSuadP4Ighvq754p/ptJ4cKLiio8dkAh6YDdpbUmBNx0/ae/+S9
         Wq/ecdhrDAFJZXi+uUVOFuwuhjPb6k5IbFPdPKW8+LZzD8sSfY2QDIYdEcul8dBziB0U
         P8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571484; x=1782176284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiyIJgSEwfIFbV0JUiz7Djf4fEFq9snfYC04/f9wwkA=;
        b=qoah2FhDv6ANNX7K7axKhE8FRU73gcqQ/vsx8SWCJv2RKLjLUGEd5QAzTi7XH02wIU
         N/Xldd809ZSe4ioEXQmvpsCqrKzA8o5fRU/hQAa0qn8HEYE7DzCg9+IWD+WMDfQKHw7u
         PAqluqMUQ/iuH0AKQBJS3ZXrg3iz6aaWuc3FqF6qpXjR6tzrvRjoNoOmlAbfB3VjYL3R
         YgmNouzLtE0q47FvJhWQ2L7aOW50lT2tiOXLNzUVDh9GwvUl7ohBikDTlO7Z1m5Ggxvh
         VppAe/lajRjex9yCbd7FdOl4SLjb6dGebyCkjea4nekb4qhyCO1UzISZqsvCKCEd4lrx
         XdQw==
X-Forwarded-Encrypted: i=1; AFNElJ9kH2g5ZpaQMzYgQQgfCnegF+byzaPSEnjW3uhqat2nWHL7MJworDKyBTCKfqfFSpOGYtp6WD6zwPdeAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5SgqfVz7DuHjhdiqYxNis1fLmF8dJXdOYAYFedhFveoJteyHd
	dZUjOS7QF8F8bUcD8bRiMdPYwx/CKtVvM+DmorU4RVIPLhCUfEm0iznmkYyf9eyP+fG0UNyzzTs
	iXK2bs2dyvAyJnP8xbgw2TPIzYV0oNceVsebk1mQmOlvLOcsv5RRUhidEGDtVbfnLrQ==
X-Gm-Gg: Acq92OFpP6FvNuK/jYaL+D52AxJu8NwS48ZdCfwXXrlzIoGRJms/8YBOxJVu9gqQmes
	4X2yJ9BdN2cLkVnVkEfAi0pjYGH0KhmLWfvHCkFG+G9n9epZhNu0hliDYWAR2oDmYRhG0AguNau
	LHpeubftdW4byGvmBoL4shKVIsMQQbjm6BcqP6uooHRyd5Lbs2jLDhOs5SWrBZEIWXV+k7fRach
	s0+SfYVskBE2EryoF8q/w/WKqQJjtgZjjvufwpeaqZzUQDv2Wkrf21gkvf36kYuSo4N2x569LW3
	z7DaBn2l75SDiCj+xpUu3f1PNvi0iMO9okMpXneIHyQl+LcGrUZJ7oX8wYovd7G0cshNXTzH6RG
	Q9fTbAgz+jpI5l3NOlOKM1zVUInPwR3VgpOdNN23VRowIf+fsSpy/YvV8Se2VjTMvX57MO8KoHG
	8IhzphAX0f+A5rudYzbDzIvEEmuIYu1t6z0yY=
X-Received: by 2002:a05:620a:3185:b0:915:cb5c:7f70 with SMTP id af79cd13be357-917f0a8a62emr1951643385a.29.1781571484393;
        Mon, 15 Jun 2026 17:58:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:915:cb5c:7f70 with SMTP id af79cd13be357-917f0a8a62emr1951638485a.29.1781571483893;
        Mon, 15 Jun 2026 17:58:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a6fc0sm3153341e87.51.2026.06.15.17.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:58:01 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:57:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel J Blueman <daniel@quora.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,sm8550-iris: Allow IOVA
 reservation memory-region
Message-ID: <ipemz4xvo5yr4wmrkdepsglxtwa6cgbwayjgoxu5br44yix6w4@jxpc7hz6ugtn>
References: <20260614145113.84243-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614145113.84243-1-daniel@quora.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfXw8H490ic7cM5
 aixhvWZxMmZKQCQEGB3cDo2TBmkHurpJ3EMFt3deosm/DcoJwerQPAn3Wp6+yRaNmWJWe3qEENQ
 Qkw4JB1ptCPO+cPhSGmtWUv7kCjfflU=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a309f9d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=t9ty7G3lAAAA:8 a=q59RblQhM_AjlM9mRcoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX0dSI271DpzRI
 aRy5HRmqQlLHsxW1PHRY5S2bT0fcLV0FRIRIyzhnC30an/ONG6oQJLaowi9aQ5UZAgc9DJNEMpS
 Wjbdls7bZShGd6xOTVJjJy7YwGeZwpRFXk2J4x8wcaWLgGnKBAG5jwdYgCxkbESsv0AIjrej9os
 vIJJ6vngt9HcQf60gR60wfZHRrGRMjDuno7Msv5t2pZChAH0lEhl8auMrgh9pbBjHjiQNRk+O2F
 YIqj4U1UDNfzDGgK2f+xlfRZkN97Dn2BxtNQ1QSkHuMO7hJpg71Re838AqaSNfzk4UkkRS/lU6b
 +Sm6EF4N2XVpBytlQTK5Tk3mPgH+aubFGUEdu6nSKyep5TK6rw0TxGhkcrsn5ITuPeTsWfc+WO8
 ULcoFp2oIhXmaNJlv/v0DsGmQJ70q0zEfixXcNCOEi0EIrX5hbp6JbPt+LGUQ1YUpV58vWfeci/
 bbM8ot4QYfZGs1DJ/Ew==
X-Proofpoint-GUID: MVHY7x7MOKTyhRHbvs5F_BXnFHJt0O30
X-Proofpoint-ORIG-GUID: MVHY7x7MOKTyhRHbvs5F_BXnFHJt0O30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160006
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64957-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mchehab@kernel.org,m:stephan.gerhold@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,quora.org:email,jxpc7hz6ugtn:mid,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B62368B1EA

On Sun, Jun 14, 2026 at 10:51:11PM +0800, Daniel J Blueman wrote:
> In addition to the firmware-loaded codec carveout, some Iris platforms
> need to declare an IOMMU IOVA reservation (a reserved-memory node with
> iommu-addresses) to keep DMA away from IOVA ranges that earlier
> firmware stages have already mapped through the SMMU.
> 
> Permit a second memory-region phandle for this purpose, and describe
> the meaning of each entry so the ordering is unambiguous.

With no driver changes?

> 
> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> v2:
> - drop redundant maxItems, keeping the items descriptions (Rob)
> - add Fixes tag and Cc stable for the backport dependency
> v1: https://lore.kernel.org/lkml/20260601041336.9497-1-daniel@quora.org/
> 
>  .../devicetree/bindings/media/qcom,sm8550-iris.yaml          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 9c4b760508b5..5abcaee4101c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -80,7 +80,10 @@ properties:
>    dma-coherent: true
>  
>    memory-region:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Firmware-loaded codec carveout
> +      - description: IOMMU IOVA reservation region
>  
>    operating-points-v2: true
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

