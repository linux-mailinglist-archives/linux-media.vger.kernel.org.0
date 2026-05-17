Return-Path: <linux-media+bounces-61866-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MUVExwGCmqzwAQAu9opvQ
	(envelope-from <linux-media+bounces-61866-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 20:17:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE493562FB5
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 20:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E61D3025723
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 18:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629973CBE95;
	Sun, 17 May 2026 18:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fibiNalo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7hY+iqV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608493CBE96
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041560; cv=none; b=Tu/eTcRyRgnkvWTppHSoEjjuzzQqEQ2j2CFe1jpf1kn3mAYuSim2OxvZweDyvvwZrUhuz42ePb0SXM1Wo2roa+rgO6K0CvoHrmr74l5SaZm20bOOMklzg0mZ5mzZEwdm/ZppedOKhyLyZHuWIvhsRJVYjje3GLZBUYmAlufomMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041560; c=relaxed/simple;
	bh=Xp5Ixk/UrdXHcKamwm4bzOPo9EV535L7yyFC9Vwqp6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyQFnx5GE73rdm+xuu0Qihfz4aUkQ8PDYJARPqvGPyCBxNJkHBRhjaO3BtR9vK5W3n61J2WnEU65bb81pvDh7SlEoHMSxBaTYGXKvgh07axxUxB+eVvP0e04IoXmDkoMk71J4vDETlZNQuRz0RczThekZFNnrBInyWw7j6tG6Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fibiNalo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7hY+iqV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GLuE9F1779072
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 18:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+84c86+BTqUsmbfvYyoIFFXp
	0JFmH796Nm7BJ6t7KWM=; b=fibiNaloGlav2yQbI8Vhd3ypyF1GgAmwx86qdW0K
	qIBRJOf8g2LIfiPWKdU5ZS5qnM6gMNL8dzGmExzJ6/375sHinzPSRMOyMYmO8CqS
	zYyNfmR6yqxw0RHLHwpb5EEl6SKoLDSejHOr5PSw1YlJitxFkFx8I1IREh9rteDQ
	7LxDqechJkaxr0nEWcVOLMlUjKOr2txvuvjY7ofy8gsB2WPgrV5sRmnTvrWwDzKV
	6lOjRxfsyZ+sTLvrIx70KYzhQIHNvLEjceVID+0TyPZafkX2udbxwR4wOYXMQy98
	Dz8PrySb/9VP31hb/7maAK+O2BXzY62ssWqiJrvw79w93Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw3b5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 18:12:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514b5d6bb45so29231041cf.2
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 11:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779041558; x=1779646358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+84c86+BTqUsmbfvYyoIFFXp0JFmH796Nm7BJ6t7KWM=;
        b=B7hY+iqVSjKA6sKeXzMBJZSKMC59CpXz9Te+wZU68k/GRLuZqVpHj22WJ5U0V7Oxny
         oBgYDvjSTfubbftaFcji85bd4JJBuYpfgb7Cdu3qMzbLGug/pYxhnees3KL4SLdsctYN
         /PcCGUcBXFl9yzEAT4s5aWjlXVFn6zdH6xtx4xkz13CV2hOMnV+UIqcIgaAZpJC5B/Nm
         t2HPz22w1I0vw21WLzaDJoShV11azkcuK8JZmkfM3aMMXrfBSzbGwKKXD6YAIJUBwSoV
         Ve28W/ywsBPNzZkIFsWjf43ETZ8xe6k+SgyKTpK8IGJHc4FqFNmFedkk4Hjm9iPjSgAT
         pPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041558; x=1779646358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+84c86+BTqUsmbfvYyoIFFXp0JFmH796Nm7BJ6t7KWM=;
        b=W3qdeCbt6hTejj2udCv46IY5DpsfA2rG+9GcxmpDiXc7VPBwnQLbxjiVdTHwoqfFt2
         NYtF+V+D/jd1wV8c14FKqpqIErmkO49G3M96edSVmY+dC5JVASfie8LMhU6MG+UIyzrE
         uoz+d6zo3upNd89ZNocYb0tGOSnpq96xQ9zoEcMnIkmtFVLglcbZmCeDsI5vfU1yqzFj
         Zn9zGLwYdmupP/ELoy9IfrmYrTJXOp6/W44ZnBJ9seb9dPVWae0WOvkp53Hp4jT1kowB
         2laraaV08cXgC1U/ydoZFd4vKhIaw8pHejn6HjLNHwPsi9jPK5V/519PZKBWtW1dCxip
         F2GQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6r0843YMGPV7/s5MfLuFUMYY+flMS+T/1CmmSuJx/FdKRd/yrHnXvFAghKpWCH9b0H9raIuXIyVFhSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF0YqgWxNK8NQQD7lBgb+OnmrMNwY7iO0l/K7jUbIbRDWvTPPj
	LGMlq1r+sXLbFDJsiqMjjeAVorZq9wlAXUWXsBHmG0qWZ5/WIRUoHEZZjQZFGMtna+PtWJappsW
	qVNeWM0/SvbwZCo8eYF48ZdG338hrSLiEXxhvsLvse3yqygDX6B9c1IbVDH+qqBBnIA==
X-Gm-Gg: Acq92OFntrYNeIxFSjUKxAjthhPC2RvhtJ95GjA8GjFvp85nrn7M/XKBD4yyky3Rv3p
	OeYiYhfyau59WkRGm9mkS4nLxX1FuiCNtM5B58ocSxq+zucT0+3t9ozfNlYDyxFkJpnqzpzLg0J
	lH8wJaULwHjd+yey8u/ll/WlfQW9G23BlZ5hUmawB5unSHCAmq7sS/Jgk2QRl6l2ORyQDMLNfcE
	fpt5eMsbJdFf1DACrSEsZP4C8HR1jc1kCyqH7HmtzhMCVYyrohQdZg2ZPuaSSe/gVJOu3aVYsMP
	AEnS01jQT+LAKq3FTiRLM0C8tmYVNSZl9RmBp9xTxjjsGlNDw4F5wOomoDcI3MF+bzQl8O7Zs6+
	IT5RmzifokDWLItXdYXqLZ8UJmXFB6G6vgY38NPNtWoB/bTHPhsyNSl653+FcP2GyjO4WCkLH2o
	yvslNhkV4GYi5FkekI3qaBpN7dnNk3EwE7JPM=
X-Received: by 2002:ac8:7dc2:0:b0:50b:3831:417f with SMTP id d75a77b69052e-5165a2c8c00mr167619361cf.45.1779041557765;
        Sun, 17 May 2026 11:12:37 -0700 (PDT)
X-Received: by 2002:ac8:7dc2:0:b0:50b:3831:417f with SMTP id d75a77b69052e-5165a2c8c00mr167618911cf.45.1779041557200;
        Sun, 17 May 2026 11:12:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c0c67sm6568821fa.10.2026.05.17.11.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:12:36 -0700 (PDT)
Date: Sun, 17 May 2026 21:12:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Message-ID: <pockc2vpoobmhk6pwy5wluekbdgon5ndtltbs7lmq2s2hxwhxs@qp6bhwl5de7w>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-14-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-14-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5NyBTYWx0ZWRfXycGNbWacEgoq
 9f5tSJUBZId3cEePtQKQiUhwQT/Qx415YlwNq3eTdmZ1KWYYqsyTokvhza53fZBRt7FEZj/i1my
 TlKYipVyTi5E23jUItLzdzDnz31ZuGKf4m1X3MsR0gFbZvkIp3mWVHAfGL3fs4WE7DisotBAWHZ
 8cJ3NHCOPDq6iMAyiRoAsoF6prZYUEP/03dpV65Vd9KvA5rC9GDONltSL4bKCOg2FE3v+lf8GVV
 hG8giYEH0iiGjoITLzrwG0bQRpcDTZ6ja+GpLgtbKtmWp4P49gO1FzA+80/P+wh8HTJilkIyjKP
 s8WO4D0c3zhyh0XjGWzzKYPcYB3o3mdL77rAZ7Sls0EsLALEwSttNs8mobPbEc+fhjYdZgRZGEK
 /PtCd68j5BNUJ9wkQ6qAop3Ncic5z2g1CZphemqRafxhWnFCDbeXERzoJ+wi8CiRLxPzZM3sA/d
 47Fkd6Z3JUzde7dZyVA==
X-Proofpoint-GUID: 4R6W2VBk7Bz_d13XSVai3UzauDQupohI
X-Proofpoint-ORIG-GUID: 4R6W2VBk7Bz_d13XSVai3UzauDQupohI
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a0a0516 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=1OBNivUE3TbfJcvUgGMA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170197
X-Rspamd-Queue-Id: BE493562FB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61866-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.47:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:51:29PM +0530, Vishnu Reddy wrote:
> The iris hardware block is described in the glymur SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 35aaf09e4e2b..8d6ea857634b 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -198,6 +198,10 @@ ptn3222_1: redriver@47 {
>  	};
>  };
>  
> +&iris {
> +	status = "okay";

Could you please make life of distributions easier and include
firmware-name here?

> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

