Return-Path: <linux-media+bounces-54082-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIusIYdupWlXAgYAu9opvQ
	(envelope-from <linux-media+bounces-54082-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 12:03:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 058541D7215
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 12:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B0C9303C532
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 11:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E612361DC6;
	Mon,  2 Mar 2026 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kd4wC906";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aArqNgsc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54DF35F61C
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449357; cv=none; b=HEqDBwDp1rqSnetQKmjXt+C1pBAjsiXHDqPh3p/PySslXoq1+aU/cGKa5CZxLP1hKGv9nxogMfl+UptzGRhsLVjxbfbqgDVQCe2ixjQ9i5hH73mKa6PPTafeaVe0bPOH/WHZW4csoYKSwv90oNRdbUzrbu9HGidOi5AJpWmUbC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449357; c=relaxed/simple;
	bh=WWpPUwAj4CS06acq3iN3Q4Su4SjoKs+slkPMej6t5hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAbv1oSgOzEL7HSmnH6cBQp3E7hcrOsF51PUijuDqYi2n2yYyyUfs0CX8tfv5cDNzJOAxRieooFEIrga10x2icR1Q8BKgkKx3JLXLVAbW28IFa7vKUIjCspim43VDUJm2dJ2h2g7KVTNU+T0NluYlGWAIKrS5FzBTUTicIAgmVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kd4wC906; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aArqNgsc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226hDG82504678
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 11:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRCkO3MSlIchL4f6lA/3jZcOle+YFQfJf4GZY0Mlwmo=; b=Kd4wC906OUObQNVW
	BW9NiUIYMpwVNyNjMarw4ABWd+BFHc+oMgIFbRRUNymVHH3fhOpS9vjrJan7/nS+
	Bq6juHPpvK/qgd7Qjyv2C6Il6+Oho8CGRKDJGeDN//vnlBmRytRz/RbLZaZOwKjB
	fuoxPrqZvphCUSGzKZbGBR5XeT3XThovbxLIeK2uF3yWMGjwCz3XaZ/lCKFVM4YE
	vG+f1Pi5Q4PTxdG4e9Ux7X4fqPVBwEtFPDnwKXjgFczB2EUDXGBtcjaW4gMOzZTy
	uE0BC+TZQBJcq5W6ldhAxpJb0msb4sWZ5iocyw0Pvl7vR5E1kLRJLTneB//8xuw5
	oNxk1w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5herxqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 11:02:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae3e462daeso8666685ad.0
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 03:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772449351; x=1773054151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vRCkO3MSlIchL4f6lA/3jZcOle+YFQfJf4GZY0Mlwmo=;
        b=aArqNgscTt8OAP1kvLceb8A3V6V/7rDwoKCdq3CtXGS3ZLNgffLpcf4S8KxBH1lLlN
         RBkCvnF5+UniPUChPKy2J5JjKwtgn/mvGEwGFw8ZSeE1ly2zkyf/hJ6lnhZDA+IVS2JC
         0s8RQUujzQ1OSdmBqxJWYDCxczbEffU+r0dQI83tPB1qnvO8kVnxP0oDY2bA2UeW54m5
         a5eCWYBHU9faaafHtBy3inrlp5yAQKOCahM7Y91dGZFRv5/2WJA+v1UO5JE4XX/M22Ra
         ckxyLYCVSJ8eO2uidmyohTAgyar8I+FFjHJeVzWyOyGef1m4odSiKwAOelgSuI4J4AgP
         N/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449351; x=1773054151;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRCkO3MSlIchL4f6lA/3jZcOle+YFQfJf4GZY0Mlwmo=;
        b=fxzFXo11t8oqnI9BXDj79pgvweiw47AK9aHGPChWwEoKFm9K3Ow0p6+jfz+kikMIey
         tWpgDB4jWK1+tOBZAQvxc8af3AkTsanCPn61drDDF2Domj/t4xk3TaLv0HPXfZx2afKm
         Lg7WDnYtnKBHb+IYJad8KIW7XyKWWn4Vj+nD8OUpP3GRJMX9qi5SUGjlqLUclbYquAHm
         9Yxc6W5oJiARhkBYGAIjwqoAO3euzgtG+TjRXCUrXum/l1MN0jlpduBH8z0e1uVTYBeO
         8gGXSh6WbFo5f6TufM5Ff1ssQ+o8VPIUVRQkWBfpXuZ40tshvOWKXkAnRaRc0DC3wrEZ
         /QJA==
X-Gm-Message-State: AOJu0Yw0nBKCPe7PmnhUwxCmRNUVCQsfbvS/Buz61pQqtpZl6Cn1YthN
	kd3A1QbKhGog9uj60mJIkgWdU8P9q+z0dDWR36d2y+baysNDd16KSPo6c8+CueXtfXN0Yl1+2nK
	HtelWuOHIP+TsC7J2lU924Ajmy/ltMCoVGaEvBAeHwrMjbTFgXgBySWYZkhf+RLBoXA==
X-Gm-Gg: ATEYQzx+38zFSiQlpVrEatBVITNH7mvVFYqrHxpgvAHG5euscVK9/470YvOQHezxDRI
	/grdqbqD+7WQCHV5SoJiKAaujXEfUzRhtwK4O85pWmeNlYvd11nzhJ944a6qFK2FAumRjb/cymb
	1j81lti2QVfx6i4ZX1b73rpqmzuJYwkYqwcvjq668dncuLOeM5gRb2toDA89xf3R88Byl0UCnhB
	Es9ZOWca7jluR5QZPTJJXnLOWZly9GKd4xBjpIqdCJqvjOKPM5zqtPxKGk5IiyfCdHkzHFqxJN4
	mKlIDBgjn8Nd8E/z+G0x2LsBf9sLGlciTeukK7DcemQc7xsBGcCpCNjknZjFL13osfCg22Hqplq
	b9O/JJp5FX1gvwb0JjWVHf0+g00m5d/xhBlDLNbL1b43cIFQ0sPNReQ==
X-Received: by 2002:a05:6a21:4c06:b0:38d:f405:709e with SMTP id adf61e73a8af0-395c3b3d787mr12125017637.48.1772449351377;
        Mon, 02 Mar 2026 03:02:31 -0800 (PST)
X-Received: by 2002:a05:6a21:4c06:b0:38d:f405:709e with SMTP id adf61e73a8af0-395c3b3d787mr12124977637.48.1772449350875;
        Mon, 02 Mar 2026 03:02:30 -0800 (PST)
Received: from [10.0.0.3] ([106.222.233.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa82dd09sm11878434a12.28.2026.03.02.03.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:02:30 -0800 (PST)
Message-ID: <10d89c55-373e-9e97-810c-fd088f42480f@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:32:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-1-acf036a3c84c@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-1-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a56e48 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Rcr8AszoUWCL+GUTnXSVkw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OinizHH6AUJIbddlOokA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5l4geVgWhgnND0P68ADFwKRsUKmhDydn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MCBTYWx0ZWRfX3U/zjJqAAL+r
 dlkFDfJTUT91Ix5Br+uWGMxFTBwPLfx8bSQUntGKmDcZlFwX4j3VvXtlwFI+b5sEOPvdc/lvu+p
 HTT1pxyM34xthJKtcLtF2vIY2m7eK3zmZc17AzWJ/2G2Hbq10hHv0stDyBkaK6WZr5JbmWfqDPo
 FeX2RiZVPzvn+8FFIvkKmWmuid1NoEUzzeGZWdB0bsVNiXrBg8kxWcmuRJyrSIVUe8noVXyk9UG
 ruu7c1L+oQmMoBx9HmpaFDXiedxEg8dGqgQhJxFZVRYN14/1GHNipuawNEJvi5hht8caZ4xKjOU
 Zca+nJ/2sHpMWW4aI9mr5WVJN15cV6Nnr7jo/Etqn/RwHf4X2UmYm9vfTpxudAofg6tBnIh6FZS
 jY0zqOSjinIm0qcprqZg/kt+76ENRF5bieHuXaHfGvK42zEXqz5K/X+XIhIMghd2MpeHli42ZVC
 4uGLJ43WC6PK7RSUV2Q==
X-Proofpoint-ORIG-GUID: 5l4geVgWhgnND0P68ADFwKRsUKmhDydn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54082-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 058541D7215
X-Rspamd-Action: no action



On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> The PAS ID, the authentication service ID, used by the Iris is a
> constant and it is not expected to change anytime. Drop it from the
> platform data and use the constant instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c        | 11 ++++++-----
>  drivers/media/platform/qcom/iris/iris_platform_common.h |  2 --
>  drivers/media/platform/qcom/iris/iris_platform_gen1.c   |  2 --
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  4 ----
>  4 files changed, 6 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

