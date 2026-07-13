Return-Path: <linux-media+bounces-67451-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5dVMEjOwVGoJpgMAu9opvQ
	(envelope-from <linux-media+bounces-67451-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:30:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A346749502
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:30:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GIYxyBky;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U4Df+p1o;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67451-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67451-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F3BA3045ED1
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7623E168A;
	Mon, 13 Jul 2026 09:28:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AAE3D9533
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:28:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934936; cv=none; b=FjDQHVwJg60NCGPouL8UFkcKB4FWME8bOQPMMViuv9CQKticbAH7GaXu6T+VUC3BhxcFU+YVwTlTlQ1MXBCXhZX1DqwLs7oQbfd6fIiGoaE4LALWBHugXpts7yQ4DokdwiwPLljX88y5rl5DEwjI2LPFZwdaJ/b3LFOKbmwrF9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934936; c=relaxed/simple;
	bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5f7LWjW+cxevdoOEgdiVXljHYV14OBsT0Hu+XL4EDu3RJsP+kkasvtch1YJs9dVqpIt0mLyJCf8W1QcKDsNZsk9lkaA8uSLk/S41LWe13I80IDsU3f19kgZbohlaNpEuBvvAUGSCOYr+BsYgCiexMdGorS2qFga4fL15KqyXMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIYxyBky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4Df+p1o; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NkTb668628
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=GIYxyBky5m8eupY3
	/FMWpds89QQ+q6BcylUebA41TWzsLJInO1OV4uQLUK+Iw09i4/MpKxJF7sQB2kQg
	UBhx9vwsdb9gWwC2Q0qG6/0GWNGkKIm0Pj91x84+ZAxFeoN76yv0L6PZEa4u3L3j
	z2BpAF6AmoUwyXQnxIl0ZV7pTEkBWU5Fq585FmzVXuek6zKwFW/XHPhyFhvRDnxL
	yYJdlAD2G6BipExsveIbR88kzyvWf+DwgYhVYZgnCMRd5tmicsltPKq3fXOhKhf1
	fNVnCiZ6V5qjHpK4nAA1gJIB25WIk7rBdI5aufxkmwnR9KK3qvzUlNJDsItx80T0
	zu0fhg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1vcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:28:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so2328874a12.3
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934934; x=1784539734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=U4Df+p1o70+vLqcWS438FcMycrvIwdmq/YRzQDTcKF39lPBXXpiacLbXn39EKj02ZC
         9G3bSL2wcbqE0x9A4siFG4Y3e/HwSDbyxZeBdpGa5cANFAev3wtF+FEBA9wc5yBN53uQ
         zj6nhD1k05clx9eHGv2/pCb//Hi7/R5bao5iq9w3iGZTR97Jg9Fk7wBvAgl/CC2DuWXC
         uXBVDotgW0Ah9fLCv9eP+wDOyCrGzYp2LwEOE4q7YORyJnSqkSTSRdNsYJlK5Ckv5jVS
         tVeulMu+oshmGyjMzEQa2IYhYkSuX1Dr/G8CNe0Fkfi1MSFNITJAMLQL3ysJFYywOfKd
         84MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934934; x=1784539734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=m4ZlQb03Sx90/VeWNPLIDfswfg2PFhy0Odf2xfYQzrLxaotp1C4Zb5MOOuNnURiIE8
         uTXtMl/5oaDSkoX8qYncym+wFDXbgCuCJXQS8c5TzQUioFkuRbfWwhb47THaz+Mmlijq
         r6sl/RCbD09Wa7vZ6l+TPyZGxVADTkV4ycJYL2Obs4pn15so26ujkkZ+xbMNPkUMI7z6
         hnkpYBn/E6J/MKE2/536WZrXB/NM/L246GJu3jQ3oKafjJD3vCoB13ZUqVbwdEY/jeOi
         Ff/muTmtv5yRPKaShaz+DEAdjF6xB5zhvi7KVSJO0wlNqvwU2Cn6v3fiU14GLWhBIu+N
         yvRg==
X-Forwarded-Encrypted: i=1; AHgh+Rpq9FuClZQaj5e0KPErOjClPd2Z/oZtI67aAK/R9Ko5RRuCAemGio7U9Xe581bNtJVZQuXPodZIsVDQNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpVXEnXUElnu3zwknMqhc2YDEo1ZvBUHINkFMwFAADMJD9r4I0
	N4vcsypKS6p4iDpAbYeMiBWyDAtXLdCrpkMZaQOLI/yewgf+OfT6uysyQlIOQNp62IetDTPSuFl
	kNz8yBdpUizfIij6QKRoQpFFFhLqHNlQrSRagA7FlifDK3X5xrZAdVqTUCSwouCzryQ==
X-Gm-Gg: AfdE7clztDlStEcG5LSiJn97fsKhsJBbDojTVEVskt4NvjLhz5V+HRkk6TocSbBru8n
	vruUQjvEfK5qBcvNAHpYDgca5DzGaE/SaLWOCNI+LYY8akQWkUZV/JzfIzcrJq91VnCETWX+oUy
	3G2WX9XdoATXGR7MqUGxmMZ6Ii7edHthX0BIwo83lYrc8j2Htq0ie/MnH2+FcjIbMMrYOpmk/pQ
	BAtZm7ZpT/7ZhavTKijQzHMoTpmYdKBlRUlVotcO5C7JjuAPh9Ut8ZbRTDzbGRMSmWbQfOMKORY
	gsEZXscowU0nJytnmM+IG9Yd6bq3zNM8tUm/wsD45nEAIr2vMO69IjbARJXLpuUSCcdaE3dwBl0
	7Fkz6O4SmDI6PBJ16jnp93uNRixamM0iM5f3dzHoX0A==
X-Received: by 2002:a17:90b:3d84:b0:38d:dc13:6f94 with SMTP id 98e67ed59e1d1-38ddc137054mr5567313a91.37.1783934933931;
        Mon, 13 Jul 2026 02:28:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3d84:b0:38d:dc13:6f94 with SMTP id 98e67ed59e1d1-38ddc137054mr5567306a91.37.1783934933515;
        Mon, 13 Jul 2026 02:28:53 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:28:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:32 +0530
Subject: [PATCH v5 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-1-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=+t8Y8RcdzA2kLv4JripQYvKr9E0fZ7/IV7iHkNwE7x1Q81Z3ydtjnu0AhACBMTPXnbayPkTm9
 ZDCRrTDZrY/AXCpFjUng8Y6HC6anxDMgvAUrsXPlzZIGB4EelIZRIOf
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: vE2pkiq2Bwzx-yjBPn9QYXWyx2FUBLUv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX/ID+132jBz96
 B2SyQvXRZ7+uFiA2f3M/noGlhqAt7atkb2fZrk45awvcroPEYAG7EfPhc14v+0fgPpsGXaL8XeI
 tPRvwhTNojuCFlckmjxUyjARkINO27zDeX6/nrDp8r4fFe3xkuegjYf4jN9jdpbpx05tBAALYnE
 xG8zmUoe5uuteyjT7z5LurzGuBZWz0n+5kGU7+Op4pHXihK1/+UKEDUr5CbiJsUmkXu6flOZU2U
 qVCohxPr3t0MB281TLjMm9toaunXpo6nR6WTu3qXag/XsMlfCXRhNdP3cVtw/XZAbPJSy0oBppL
 7mE0Lng3F9IxG/Uir8mv8A8TYYnpqdfqZ3G2tIJdW1xp2aun3JOCQq+B3SUer/ulSAlMYBxzPzk
 SZ1LdT9WXCYXWahVh3dJgKyOZWZNBECPMZjfScOlTwBxO1jg0sfOCr03JYqLh572rLaUh/eWVyY
 6yuTRftw9jyWNsRFqIA==
X-Proofpoint-GUID: vE2pkiq2Bwzx-yjBPn9QYXWyx2FUBLUv
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54afd6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX3l2gW7tTlLvP
 3QiD+8piIBCvCODtUfo7No0cHfu81txxYzDPo3G4LN9Tzaqz5Q+aPo9DpOZ3BPIda1CsfcxoEE1
 xmexpVXtAwroREZRHFguQ+RceD+jqQw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67451-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A346749502

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..490a7f3a8c5ff9c624f46150ee651793811823de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
 
   reg:
     maxItems: 9
@@ -76,7 +80,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1


