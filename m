Return-Path: <linux-media+bounces-54402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OulCndhp2lvhAAAu9opvQ
	(envelope-from <linux-media+bounces-54402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:32:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 820EE1F8011
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6796A30C1908
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 22:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D8016DC28;
	Tue,  3 Mar 2026 22:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOUoVTzJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKqYDQwW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE07224B04
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 22:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577096; cv=none; b=nX27mPlfU0+XPvgPe724bWEVmhPPZHAFmUye9+I1QT0z6duEy9LHWwkRzTuIHsS6+y0hzgFqRYDwOUMgeuABljIElghXOejh2nwc6op3iMWvU0qf4ooIKl9KzhDzjKBgELXetJP7AWKFTcIoBeCN+l4bupuocSbIiTvStVm0FTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577096; c=relaxed/simple;
	bh=GwNMax6d5D+m5kKMSn7gmSftOxi+NWgYbuGv9xyj/iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tjd5jMJyR8DggY1kvApj+4GouYw8IEpA0MR1o9Mb1Da7jWxRVYp/dAPAArTxkVQOQf2tMXjkb9nNJ6ctbYyA5i98FQFyldBqJuVBy+FTzzP/JT1QEne7LBUdrF6GGyT/EKeHV6y0gxxuE1CL4dcNfhHdCyAHu6+ZqAeUA8ijnRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOUoVTzJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKqYDQwW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623KtB19594408
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 22:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g5c0yPOmKPUzXOupNhKzfg/+
	Xjp8RH1qLTT5YyM/9ZM=; b=EOUoVTzJDgTno/EIu/Q8cP+nuBggf29M8LrS8gi3
	iVZcK5xWBh/XkZ49h/9yTGszdDQSsiQrc1nCxirFb5Rd5afY+0PC+2n8PhFd/r+a
	D/ZijR2x8zVDIc6UOCoNrHesVemPnKMVg2SvARfUHWYEwy1ZQ0889dcjpbzIt1Mr
	GR1MUR4D3KhKje1Ssx6JKzNkhoBV0K17MLPRUX/MJH7Aazg3nfEECl8SnoCbJd7c
	YSmvrz2b2aufxWWO/66HAp6I70T56cZ4kKSoEhqdrrgtadrGd59EACuYHPjbHAjY
	GsVKZ9vkruD2G7NYqLiVJjU1GxVQLtAJTfnvdDDicPI2mw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73h898b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 22:31:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50335bd75bdso531959371cf.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 14:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772577093; x=1773181893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g5c0yPOmKPUzXOupNhKzfg/+Xjp8RH1qLTT5YyM/9ZM=;
        b=jKqYDQwW42tuPVRxMdT5g4n4BECxeWvQEPjLs93ofbJOdy0Qh2/vbLP/ENhsKiJ85t
         918MlR+wYnadIHIsOEP1GPbvoerLBqIRDerzg8roCkdDAy2dV+sng8PtI4fA1vD0o0ts
         6zhz/IXXVfWZdErPfu6n0H4qtJqPt4+rH6T6dLyW0BzscsEG9924M3DY1KKUbT4rSaqQ
         ul21xKpwKal6DkKaYYjMWPDkh3OomYpqfH2NOtc/WgiloIAJokJ6ElS4YxlUqUCmKrV0
         bRi4hqXe4qYW1Z+Hd++A5aO3o7T4LW48NMbcyRfco4INqnUoODRYkWzUzYrDgPmQcnBE
         QdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772577093; x=1773181893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5c0yPOmKPUzXOupNhKzfg/+Xjp8RH1qLTT5YyM/9ZM=;
        b=t9/od8pdo46QDW9qb+G4aoV41+7I76P904Rftsp3GUpqiJw/tYaT3BEJv06bW6iNrt
         a72WDbWW5Poy6lRBTQv0KvQd0l60ML66fSGZu2KJUYIc81koPemAbTbSRIAoMyBsICwW
         Md2zYGHjuth0uPHlx4v/YZnTY7gsY4wPqoP6KYg3K52avHaE7QDpG/nkkimC1GrrG1HN
         sToxO1f46j+UgJKdRZE1h0X7d9mybN38YC5m3Mx8OvsSyFlFqR1I+xqOgofaBN8XFhjQ
         gHo1TbRCvv/KnvQSLTmWPQXqfz0IUpKD8LF0Fq/5xI/iRLw6XH1PsS/NMHm8e4zkWvz+
         G1nw==
X-Forwarded-Encrypted: i=1; AJvYcCUN5ZKL4fgK69xsqVu3Swld7sXFcC3ul6tbnP63UnjTbflv2cVBy0OXhhyoLaRJhSQJYvAMOswdbKLaGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/UQoi/9IVMYifmPDoEH2Pu9zTfpLmOO/DomC0Zui2qjYWXw3
	xw5JNUwBadje5RdtFJCSZFKidZnRNd2Rzc+api+QSNuQr3/rzVmDZyKgVxpKKN3kKB+X0/+RXDV
	Ym3zrgDiUxl4+nFXhlCAWritsEqV6S8lAtLh168CcgxwHsFzd3ZFjc2f/OwUz3FM0GQ==
X-Gm-Gg: ATEYQzym2BSEsGWY1VT41j1cpxuDVTz+6Db8cbet8fAdPCy+U6ZBZG5lPB1DyQ/Gx9c
	sEBpb1rpjxnmbJO2XSYxLCjXAkSDuGAX2rLbJB1JSiMltWCUf8RszCNe67WSc0ZJTTjfUOKupTS
	0QlLt7E2ATNIyc5fZjpw2eORcO3lQ+1lzn30V9meRBlRZxtP+krzdkt5iae7slE9QxYd8m/tuXI
	Vim5mRgkyut6LMfqxDskSU375hA4ndcoY0NWql5ZcGrVqQK/eiQ4Y1hU16W7J9Mhe866rrj5Ck2
	9ZuXywr7Zf+27UduQAEyFU7yQRSAB+3M1KLvRVgVgTG/phyCCBkCStj7MDVP9Ax3Di7thNhIvCr
	dl1cWkQLm2Vu7KYlqgKfEhNsn4Pwxc9QJAGYQTmE9PkQmnIIXW59xQTW94hwBfegjWeBqP4E0RU
	Y1DIEh6aZSsbT6NnAQttbZQJISmgyiHFsLzwI=
X-Received: by 2002:ac8:5a8c:0:b0:502:f26f:1388 with SMTP id d75a77b69052e-507528beb5dmr247648691cf.65.1772577093317;
        Tue, 03 Mar 2026 14:31:33 -0800 (PST)
X-Received: by 2002:ac8:5a8c:0:b0:502:f26f:1388 with SMTP id d75a77b69052e-507528beb5dmr247648361cf.65.1772577092827;
        Tue, 03 Mar 2026 14:31:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235822d0sm837948e87.23.2026.03.03.14.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 14:31:31 -0800 (PST)
Date: Wed, 4 Mar 2026 00:31:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <yhatx2iuoofvsqpu5da7ohpyvzhc2y7uq3bhuhfuv6pkfpqrnz@75xei3bawzza>
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
X-Proofpoint-GUID: Z1aEQPueJHRkoo1thNDbfdRKw66vcLBI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE4NSBTYWx0ZWRfX3ErcjQiQ7mBS
 Tf2Dt0F2C7acNlCpH4JJMKOZy2HTX82+KBgVCyDOuhNIMx7N3iDd2IZ07+k5n348UBygr7e6Wbk
 WoCJNTvfhSFrz6/lZ9BElQGw92JhlDqU5w+JeC2LjKtX6qt2+4CAQeugyGaZ5bzUsoW8z/wdS2c
 Pk5v5qY691GOQ3szr24Ic1WsX4EjmcTyV30B43TBuuiv0LoO4lI/6920HwqSs6SRxezPF+Kkugt
 9Wzfkx3YzkQtxvfRkUpssnglo0OAtiRSBEfwY/rNMmIZgy3muJJDAJyx1g1k3lY1yosL6oLbEhf
 wEJ5tTNA7oQZavwrWAlhYANyLPLtLm6FIvtFxQNU0zu5ddn4mK3A/FI1v5WLey98/Ozq869HjLc
 grQxpci6F9CeOQTfHepiJN+ZWrGjgrDOmXWRvUa/DCtBfEIpqauUVllgQ7X/tjvwIM1JHbWuE33
 +dtzXJCrGN9ubvh8HGQ==
X-Proofpoint-ORIG-GUID: Z1aEQPueJHRkoo1thNDbfdRKw66vcLBI
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a76146 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=oDyGrVB8f0aMB-Xt79gA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030185
X-Rspamd-Queue-Id: 820EE1F8011
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-54402-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:51:24PM -0800, Vijay Kumar Tumati wrote:
> Hi Bryan,
> 
> On 2/26/2026 4:34 AM, Bryan O'Donoghue wrote:
> > +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> As we are cleaning up the PHY device nodes, we should consider fixing the
> power domains as well. Although TOP GDSC is defined as a power domain, it is
> not the power source for the PHY devices. Rather, it is the MMCX, MXC and
> optionally MXA based on the architecture (Refer to 'Voltage rail' column for
> PHY clocks in IPCAT). There is no
> parent-child relationship between the TOP GDSC and these in the clock driver
> and it was just working as the required power rails are getting enabled
> by/for other MM devices.

Which domains are required to access CSI PHY registers?

> > +
> > +        vdda-0p8-supply = <&vreg_l2c_0p8>;
> > +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> > +    };
> > +

-- 
With best wishes
Dmitry

