Return-Path: <linux-media+bounces-63745-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YruWBP0UIWrt+wAAu9opvQ
	(envelope-from <linux-media+bounces-63745-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:02:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0026D63D1F0
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:02:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UDGob3Cj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=E4YPp23u;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63745-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63745-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 390A73024198
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 06:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FF13D47B1;
	Thu,  4 Jun 2026 06:01:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47D53D47AE
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 06:01:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552913; cv=none; b=NOhClhqth/HrldW4fuiOq/YAPaeI+/9w8GUTmof9xXD1r+it6mFW/eRBnKItCWQJSIIHsHTLRC52EDdr0myyzDuzxdsAz9fkONQH40nvADWvtvvpcy7o6sp2Ki+bCPW7uhSWc3MLPDVHf9nBKEYcBJPSlR4tmbYlUPfMc8dlYgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552913; c=relaxed/simple;
	bh=84ayR4B4aJcO8wg2iVF9z+mIv5zWJb6AyHz4PJZaKKw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gStjhUzUn8plhSP/mBmEbH4fi/lbKVAtLxRYQ1/gNYfY/g4W6qIaco9rwseMBvnVzoOQpaICAPFgTnSIwhItErNAy4EYOW++fafTl/JMYgsT4rtmppFcIvyGYkeSrhVchMCZLZDRToYm26m17l/dT+PFpc7LL9IP+t7wVSgz/ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDGob3Cj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4YPp23u; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542S6KK3552128
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 06:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dgiKFbDkeqTH5aR0tttNrB6PzO3jiYE3qdTpFLIH+I=; b=UDGob3CjXLWnXR8g
	a8MND0HbYIqj8rzuTe2NfSH3/m0NLBo9WOqOdf400ZJ7caQa1WfPWd6Y1GgTHMjt
	hOn53rzZAjqzi+GOx3k3QzfeAJEXOQOqHRVf+rmhoh610M7ygUGcSXENphnJ5DS9
	Pd7/aahzVbCBsXrKPLiGkfX5812wIOHCosnhjnFDiCF5+q9ZY6tCUYIwCDOeiNIb
	DPiMMoiTct7RlOJOavRtDk0btDlq/fICev0kTIoMqw67iMkz6aL1p0aM/bZeMpzu
	hsRYk/D0NGP7OEneTCR4uq56B30G4/dHa4r84/72GZQumgPKBLzaXWZYdOeOAZrf
	I55u6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mv88k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 06:01:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32faa62so8030435ad.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 23:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780552911; x=1781157711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8dgiKFbDkeqTH5aR0tttNrB6PzO3jiYE3qdTpFLIH+I=;
        b=E4YPp23uBW2BsbHy/W8BQ133y0nUvg062KY/abctjKkPWpFSpbuPGg9/WqWAhbK5+I
         NtarJZdM/UKWBt2PfQQojlM30s7LlJDFq9jFCgg3zRMEtxPfcrLrmWsZ0glkUGg/yYXc
         E9Hx59KWuZQ+ZHRJDlvarhW699A7L2siTsSXMWOjgfOwTy0orWzX1qCt5+oSkkQ/KtRM
         RkRJf7mgRA6/9ulpDXLcyxASx5Tn6hm4Qcy8N/xmN61DWLVjIbyZObYSVr3zcyMOWlTC
         X1G3IWZW1HihongoK5IMhL2ywMQLXwkxVXcoOCHts70M2SYh426nkcthoy5D6jbUKry0
         urKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780552911; x=1781157711;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dgiKFbDkeqTH5aR0tttNrB6PzO3jiYE3qdTpFLIH+I=;
        b=KJgkALzxuw8c8++bRwtJQRw/0fdOukq6TOK9KVEPMerAbSGrbpEb/OtaXwb6aTE2Ip
         uBcjFbJgwtRLi6aw97/617Qrz2cJ9q8WKx+uW8JsKdEw3jREsgeMKzjx3jXtwEY49Rfl
         2P6G+YUw/u+vki30lh2LgBpCUg+KEwq+m0yPAYliVQ6T/K6t12OOAKENqw/M0QtovG6D
         18wOweZEPEw17IEZ00ozNIwcB+JlL5u4rdOp9UOihuXIwhdo1BzbyFSE2tbPmjz2oVSU
         RzJTF16ELJcbOjVY79v1hS4cyUDUFS7NedlznMEzkb1ajHzE8habK437A4RjFxYB3teW
         RADQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tr7kIXqDGK4T2KK9uJUzexJYwsig4AEZa0Z7nzfgeu/6h515+xbdkPsNsyUyqecXmejBjC5f724ZGqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3FfH798RpYJJsBZec2MvjdLZvoQfnq0brXrwESoFZ7cVw6A5h
	KtMIYQ4BIJBgAvLbdeyBbAwSOMVJa0e8G7rz/UBy5Y2Gid7GEMShTjLjTQAvqfb6OV2iWKotFBv
	+puBTwVVvE4vJzOX1PV7kBvh/8WHPbSGsTvLasBYKfAjIGY8lypQ9SQWs8keT2Nu+BQ==
X-Gm-Gg: Acq92OFwzS4tM6quRXJOACWH1RO5RJqxorl9cY7nrZRZW5+2PeoStfO4rHYxj6EK5d2
	oULHP1MT8KeGYRcBfTkSK3iLfOpM2uCKcmB0xTtSxeUqm/J8wbDxhs6fck7JzofPgspvTdntdAe
	0MvEDQIiU74gogDrO5qGX517klqZv1VytchsIBm0qqyXiexBMWMXrPavJyMVmQL5NqGXMmZbQNr
	RuKwHoqD5MgCeB9sF9/NcvHmcIA7ct3DHCO0k9WH7T9X0BPou+CSfteRQf9Xsqs3VOEuldT569T
	m3bozl5ZzKyIifUxk3qrOf4/bQ8yclbfCbE04NBYRGPRWXvJQL3Yan3QblkOn+fR8tdevLH0Avi
	bfwpikwWRSJLi4FwPAjX2e6oaF28njxGuZWr8Ey2pxy5lidpmeZiIIqWn6rigI5ch
X-Received: by 2002:a17:902:f547:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2c163a3d1b6mr73809015ad.9.1780552910459;
        Wed, 03 Jun 2026 23:01:50 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2c163a3d1b6mr73808695ad.9.1780552910070;
        Wed, 03 Jun 2026 23:01:50 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609ed97sm44346975ad.41.2026.06.03.23.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:01:49 -0700 (PDT)
Message-ID: <29b9b286-63a0-f659-8407-9e8b5a9487de@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 11:31:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for
 video GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GtpkmJmS0hYbPEq8fnC6ZEvnY5hpkRF0
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a2114cf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=V4j3QN97b3vMt8JjJHsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1NiBTYWx0ZWRfXx1z0a0gHwMMM
 NtnDbDk8RqKJ3QwdxtUAXZD+XMlb7Oj2fHwogGTt0VVjwREOOiBNUHZX/Cf1ldsRDewKD+mN3LC
 yFnLgZJmLChD5liLj1KJZ6fsh4SW9BCEBXLBXgPGnMLiZzrotyi+eyan8xtqo7t5XxJ8gVjU1i/
 Wci1C4XCLucB2y9XgMhVjRaZKHLs+Nk/5qoP2oZQ5imwpjfW8zttT255gg3Ppy1YGYip7Krplom
 UbPBX2hzMHowS05KHcqpsHuNOR4UK18ebQzRMBDMSn/1qpIOhpaHRj34KUF3wdKrno+82olrGmK
 +kD1VX5dYUj0pOmA70YaJOAdamAQP8evVBhfOFw9OCam0ozeM3p/9bAUNTWEicoU3Q9T9QIYkNp
 zvcDjIFx0ALH/iE9C4jpLATRxetBFapPgSwHMY2v5Wgd/2XI86vLZdNg0d2qcM6PkbVbrKRo+Bg
 a+xK0rgvOugOvwumdIQ==
X-Proofpoint-ORIG-GUID: GtpkmJmS0hYbPEq8fnC6ZEvnY5hpkRF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63745-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0026D63D1F0


On 5/15/2026 5:29 PM, Dmitry Baryshkov wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm6115.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
> index 4c3804701e24..c5251aff9886 100644
> --- a/drivers/clk/qcom/gcc-sm6115.c
> +++ b/drivers/clk/qcom/gcc-sm6115.c
> @@ -3218,6 +3218,7 @@ static struct gdsc gcc_vcodec0_gdsc = {
>  	.pd = {
>  		.name = "gcc_vcodec0",
>  	},
> +	.flags = HW_CTRL_TRIGGER,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


