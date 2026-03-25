Return-Path: <linux-media+bounces-57075-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOrpKhoAxGmlvQQAu9opvQ
	(envelope-from <linux-media+bounces-57075-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:32:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 519703280A8
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15A5231520C0
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 15:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F325E3E4C7F;
	Wed, 25 Mar 2026 15:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBZWJdn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dh/QOdHt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EE03E2757
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 15:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451689; cv=none; b=mLIMdiOyGKpuxau6LdLJQKO63fpe3nnXhkDP2wl1XZ5ZrIZWSdUUMZohUEJlIgRfFgcnRPHU9B2lFBl9i7rKX+nmGevGhGC/LGb1xKno6lQy0FdAwKJzQdvLOuNctdYJA5OUPrIJweivyjm2W6gqgNOWFfw9TnwlvPpEDlEdwms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451689; c=relaxed/simple;
	bh=rcShfDxb0SWVUoYsT+a4OUOe9fGgAM8/hMD9dz9s7Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOSG6eEvAg1IWxtoMhH51xi8uW5MRHtGT2YrUVfvj7Vy7z3d+r6B55taCxL3TC+0GV9jrdWzW6U2AOhYFVKyeGuTGocMySk7T0oog5Wdi4INZhFTgIMeoeTobW7SOBiQsacQq+vukWy/zE+zkY6jxQeTHjbI2Py7RjW4ha57l+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBZWJdn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dh/QOdHt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGGwx4091333
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 15:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7j3ryAcBMvHA8/N9VGk+JyVdzzgELfi5f6qP5tgez8=; b=iBZWJdn96S7kNo0K
	kQu6HMNiVVJBhY1PYontI5d4cBONCTnOG4CqdX18E2iP9s7y87dXZgdZeOLCdpzA
	6qkHUiaqgoQj6lh8awR4BMrnR6KxWAMTlfx0UV+F2wrMw7wOgw+8ARweBoG/3lYb
	1HNb+ImxHYJJQayhygppfqeDTrH/4oFZDMVhEZ764ymVQKLbyzVtVRIafzo6F0DV
	54N1RwPZ1XF26jEJr8k6q5bCKTfQIDlSdkeXZcoznRVPGew3vy/haW7hTygGsqfq
	FgWJ4zqbfUK+li7wsSNCwgZSmQ0xH/oDi7ILHlJ0OdwjfyJRGjXRcJXVdwWh8xiE
	zXQisQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41413qx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 15:14:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829bf6406ecso16135375b3a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774451686; x=1775056486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7j3ryAcBMvHA8/N9VGk+JyVdzzgELfi5f6qP5tgez8=;
        b=Dh/QOdHt9BynPzYzScu6vWgau/yAqOdwiSwt7XTmXN70xXpVE690jB3PRaMJ3CMWnj
         sm3sEKD2jnSTp6y7LLL3dda4dp/wUMyF05/5c+jb7iCUDA18Xabb4CqjWw+cTyOM6myD
         xa76iR/jBjsWkRmLBTxUV4ZJcOoL+Rwh9L3bl1rxwOV6QqGxj+V8mo3VBRSkDgb7vE7G
         Z1LACovobXaCp4XnW3mhBhamb00JAus1b38H4HEwxXtfqfenIGG3cCL52RX7wK47KuJy
         IumFOyDzaRrRcLAPWVAWkK71o6QnIEjweYOHMRobMX+v9z/gcLTGzrcNtAmvvgqXFfAf
         yJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451686; x=1775056486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7j3ryAcBMvHA8/N9VGk+JyVdzzgELfi5f6qP5tgez8=;
        b=LQy8kvy22nBxja8+LdrZUH6e6uPzhFjgnwnvIH6oiQNcIKG/mSw56X9pF/jQ8+qHkz
         CwO5RcfrxBmgPs/8+xVCMZiPQtErXuz43R7BLltKOCoRzHC2E+/l4kU3PwGN9rZx6rx3
         +CGRXherANZPpMsYLj1DW6IKrhrLAyu10D6YxdaHFjz9uGuQichYCV6njoE2ETgPuQL8
         pJbXYZAroz5mRr0MHcxvxqgSWF8uKLX4zwaWQinNsb5SnE/y9RXkD8D+DXSs3Vob4wkk
         mRJXzNkLDexIFPgxgYBuWmsiI9HzdhceOr7E64t6bCpxCMJVLAgrr4UiW8pWY1b9nGgD
         tnRg==
X-Forwarded-Encrypted: i=1; AJvYcCVXJbpIOs+WqHelHbdJnQFMdlFZ5znvKCLklI3IKQhaUujp6a+/ElZEjo/5oNugp3Buep8Mt3GvOXqJAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyK+4jl7fInUpmI8vpUhjsGUC9SwL+Xu8JDWW7tBdmuyzC2L3vZ
	e9QI1jeTnN9WLpYVivv+vQTzRqNP5W25pKllE2vjGmho1epVixZHcdC4yCM/RBCEvFIK+mMZtLv
	/ATtwzpXuYhQbI71xtOUYOErGmdfgUJsvGSa0og5dhP1v1dIod3NxxDIR6yei8xeD2g==
X-Gm-Gg: ATEYQzyuQjY188Wc6jeTNcYVnm0Xxg6xepWkk9aLjVO+YigiYCkF93KyoNrFKU3bOqH
	v4yq8xD/aW7PmGkkbLWJIAUzpbHsaixAjuYOqW9eStQwEU9ffQRU0OAh6j6dY1Q5KZVGpzDVN/9
	D1WF6U/baGxRQ/EscQGAcgtifc5RfTNIvvEw8x9fG28Ot17PX6iGzUcHdUobMMsI8uis8zHS2js
	8ZC+a31Z8K3WfMddkLpzMVPKQ184mJ+OIDJwum2g98ZytNiW1uatGDCJMCSIecwoSgLrPo+9H0/
	AxL9xedDOvp+RWQznVU+4mTbWTpZt0y/fnFRUUZzyiGvWRj9+Jx1Qhb7m6eewms6POl0IZ2XJIa
	chzToaJiFqZw6InNalhpRnL2NFXFLl6w39icIrFholLCtxjNAbCoZrw==
X-Received: by 2002:a05:6a00:4147:b0:829:803e:678b with SMTP id d2e1a72fcca58-82c6e1039c5mr3966046b3a.54.1774451686571;
        Wed, 25 Mar 2026 08:14:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:4147:b0:829:803e:678b with SMTP id d2e1a72fcca58-82c6e1039c5mr3965989b3a.54.1774451685929;
        Wed, 25 Mar 2026 08:14:45 -0700 (PDT)
Received: from [10.204.101.77] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d1e619esm68019b3a.9.2026.03.25.08.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:14:45 -0700 (PDT)
Message-ID: <7dbf7a23-7a02-4e9e-99c8-6716e3dcf7d9@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 20:44:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: iris: switch to hardware mode after
 firmware boot
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3fbe7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dE1MpONsbtOZy1RxgbwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: F3ILQ5bjTvGLmf5r1CE8opxxH8rTrLMr
X-Proofpoint-ORIG-GUID: F3ILQ5bjTvGLmf5r1CE8opxxH8rTrLMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEwOSBTYWx0ZWRfXzonuL2sLU5yC
 LuE+AKbv/bu7YXvTNFsWD5sE9K7dynVZWe1+neJ2YLXXbtTPHav0MG/xLkCxx7Rn6Lnu7FtwrAD
 PGcvhpU7ZotLQtm3JsH8mWAkE/MnKh7dmMiVwQg2UsLzckqbkyywwRUIwsDWq6WiLb85UGx8unf
 0aR5wAR9utpGPlEBGGWO4Cmod+OWXah5U9qaXNgqbW0y2VCCToj7faOP3gYmKtV0GrDFBjOHeTU
 BXwIf5H9ILTzQKcxQMi2tiB60/ERAVSQB9yyARBowsDgiOILLBeSQKubWeg8n24WSsduod+bnUC
 WuJYZgfYwxSu1/R9JcisYEcuKPbNM0TA3i0l7jFff/QVX2ByyLKOb4czwxEw4rPcqz3JOWwcqpM
 4VnC1eXkMwJHAxe4tF3v/1I7a2ZVqqBXPLI6KDp4zCL6vtxdtyBcLQjMTLpD6fVSYTh2J8lyGp/
 o1iW73oMRBoGAd2OO6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250109
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57075-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 519703280A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 6:49 PM, Vikash Garodia wrote:
> Currently the driver switches the vcodec GDSC to hardware (HW) mode
> before firmware load and boot sequence. GDSC can be powered off, keeping
> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
> carry default (reset) values.
> Move the transition to HW mode after firmware load and boot sequence.
> 
> The bug was exposed with driver configuring different stream ids to
> different devices via iommu-map. With registers carrying reset values,
> VPU would not generate desired stream-id, thereby leading to SMMU fault.
> 
> For vpu4, when GDSC is switched to HW mode, there is a need to perform
> the reset operation. Without reset, there are occassional issues of
> register corruption observed. Hence the vpu GDSC switch also involves
> the reset.
> 
> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

Hi Bryan,

Please pull this fix patch, let me know if you need me to resend this 
separately.

Regards,
Vikash

