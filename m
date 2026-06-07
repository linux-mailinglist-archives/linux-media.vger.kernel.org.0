Return-Path: <linux-media+bounces-64086-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bT0sB0roJWrjNQIAu9opvQ
	(envelope-from <linux-media+bounces-64086-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:53:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEEE651C28
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:53:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iFYQQzJ0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gFZjKPLG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64086-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64086-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBA76300DDF9
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 21:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6023F32BF44;
	Sun,  7 Jun 2026 21:51:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBBB311C2F
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:51:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869114; cv=none; b=aDhnL8t+5KINrKlniLpZBMlxeMvYVuI40KNGHHRtK7adGDbj5F57WGVRPr/LOIdGdXO2uL2p+GtQj721OChJLGd8ujHQnE16rDARgfq69r806Vv23AMp89YowFrXfm1PEAZj3ajnsSwIldscm7P6cVtjf6eND4UJEN1FEmGf2Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869114; c=relaxed/simple;
	bh=PJIHbeqTJsIe0PZwZEkydMC+Kjr73lehc/ylb/OIGBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXkup9Vq6wQ3q4gcfAs2usmziu9blXuydNEKbwHE9VCyIeCB+0bzjmyfwFptqeEUmHQZm+PP1cOM0BI9BiTjpDhnSksq4+QolL778n9kbMpf4suUQVfRxg2cS4Yci/6JG04h1HuWQD328L8dDLkMIWP/BATSyXk55nerO8wx6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFYQQzJ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFZjKPLG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Ejqwr373455
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 21:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rKDkQFtFQoRGgaiav3QWTOql
	+e2ZOVLUtvHFYymj/iY=; b=iFYQQzJ0q1l5Z3ghS2HW47KRQtbTEC3jmw/v2qB8
	YMcNMTP3ZPDsMAUQ1Zob4kt325WqrlRpiKEPgWtRM3YS73XSGj+TYTL6W/Mwi7EE
	VoeU2iO7mWYHtZjMkHCxCTUUHTt9GHAGASFnutanY2TRqNe45Zfwmupy+TMFDv4s
	EU4dOiI2+pmu8iR8hRlOs/pi+rWidkxF6kG5VoFe9qXHPAd1fI/K5KN/6hpV4ydx
	eNW416mGNWEUKN2xU0qzqFD/+Vj9ApabEJKk3pNwkM0f4Fz7JZcTVSqv9UsWIHPs
	MGWGbr70AYCFefBRXIIYR1bD7ccuNiiz4hKXJWUbTk9Apw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadvk2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 21:51:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8cea98a0effso60193726d6.2
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 14:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780869112; x=1781473912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKDkQFtFQoRGgaiav3QWTOql+e2ZOVLUtvHFYymj/iY=;
        b=gFZjKPLGgdkGqDBoJMxA/SM1y4KOiVlnR2oVp7mheGqBOye7mUfeh7zsqqCRBNtbTg
         wyy9jBGVAIGVqeQpv2iEsw1bRV6AVbyspVorSIaCYnUR9sHi+UbzYn+SglILFMviYWz9
         6V7q5JXEOwh0RWHAtSiTHOoKYjRYgeOVJr8XOG3TJv+ZH6Sc2VYXP5y/Q1mABOkk/Px/
         KGXbLvy9omthgZaCSlrIK4ce6gA7Kji2P8Sdh/Li28gVpq+MO7+czJJNJBvrLvs2VVa5
         64tx8dTE4qzdfWgSnKY2/6c9/+xBTmKRK3591ecxuUz23INB1ZNdws0nuDgPYfHjrZwc
         ub9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780869112; x=1781473912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKDkQFtFQoRGgaiav3QWTOql+e2ZOVLUtvHFYymj/iY=;
        b=iIcqgeJebaoi7E9l7CXL9Fx5kWVhW+N78EI2UFi/yu9QxQt7B8r/Uzms96cnRXvGon
         9xtmr3nqbNLzZ0WMlPhGAjNlDr8AdDpo7hOJTs3lai5i8hcYnLLnBT5J1QoVNxl/lmYP
         5tc86qfy+bI6zOPXFC7NiATFiiiRaJCguzx3LOMpqoEPhoD6qyf2bkpzcgcVkB6NEXoD
         ZD2b1cBrA+jdnSAhRQNTABaku9QA1SfhnmsmfoEcurh77fIZXw6VuAAZrBg5jOCcLs2U
         x1tFQnvO+w09+9SZyu03lLs6MAV7hYBOX+Gtgp+IxTiibpKQtmne/pMBn9r2gZVdq8u5
         PrAw==
X-Forwarded-Encrypted: i=1; AFNElJ8hFAFEP3o4k7DzK6p3VsFw2xlBAngKUItgviHt8ER9CYWI9mmViS5cy9YTjPqvPCZAmeJYaY+cXCMsHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDltYiZHJEPBYNizETt6EG0HXoXzMra6o7+dqHVnnXUjZ7QLPa
	9emTZxNCq8XNNzYf6YrgKSuJJNgRDEzjlYNELvYt2kIWt6nbHfBOIqn8xl508/qPB7wwSVRVm5Z
	jCP9EwTruOLQE8YL0WuJSpV8QrtrMJLvIxlLgHEMo95ciej2M3NOCuMnJ5o9EVF0+iA==
X-Gm-Gg: Acq92OH7HMoABWSQVR3RoQZfj8ebpV3bpcc0Qsbry9jXUE6BqysnXomVJke+aXTbPIW
	zhy1ave5GvPrR/45mpE2IeKevVb9pmnxcpAedU369+mckqADoQqrYDLMJrUDcNYzDJGnA4W/pHZ
	jcieHzgLFnKXZZ47HQL16G1AA3yNtKr5q8onh1mjvB2i/RFbR4IdVKjCKBTIK8YdZwIcxb35JIH
	iuOxLVM8LPSGfs5y0/o9GkkryhQyGytFd/JEfhM8JXnTNylH0aItS2no5R4Ne9vIcg5ug8F04qD
	qR6YM+7Gqfp+gmdrvjkTQPV19hhaEO2fGYl0kRbNyHCpmmIYvp4cw5Ehr5TRPLVVe0SuFY4c1V5
	5NmULLkxEJBJpVcK7l9briAMJnbzbNLlJMLkFV5zcwQ1sAJ3pfCkhS6GCRLav6ug2Z25s5gGmp9
	J+kIzuk74eUihKB0yDKlKZeuf305sviNguuAe+rRPzJtJA7w==
X-Received: by 2002:a05:622a:251b:b0:50d:e471:2d1e with SMTP id d75a77b69052e-51795afe590mr192005141cf.35.1780869112115;
        Sun, 07 Jun 2026 14:51:52 -0700 (PDT)
X-Received: by 2002:a05:622a:251b:b0:50d:e471:2d1e with SMTP id d75a77b69052e-51795afe590mr192004861cf.35.1780869111756;
        Sun, 07 Jun 2026 14:51:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d6282sm41201931fa.30.2026.06.07.14.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:51:49 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:51:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 12/12] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Message-ID: <mjmfhowcfc4vc4h4fbpf2psblnhgbwwt5qmmfb2fnkfaunexyl@c5rwjftmnlx4>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-12-afaa55d11fe0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-glymur-v7-12-afaa55d11fe0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a25e7f9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MCItce8SuK6p_Dj8i7MA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 2bxC7HOPeL6hSj4zX-C1wcy9kwQzp31B
X-Proofpoint-ORIG-GUID: 2bxC7HOPeL6hSj4zX-C1wcy9kwQzp31B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfX2aelGx2oU+pt
 erGm4SyhIpFjJMMb4BTDpfaPLatMlIBtDef+MUJcFKdgLgsb7tdO6poygWh0aQXMB2hE22P7+fK
 zeiTE1FNgcJf1rz6syufIDPe3BW7Kmsw1vErc2mpIq79KiHq4/JI9U8F7J69TFuG6CDtZ3Bs6Ow
 h0IVipGzsYa9nwxFGOQozJZUaHRlWA81wMGWFQrOn7+eBzSBA8HHAkRtx15BmrtTTFXaXMt9uuM
 8zZ+ACsC11tIriF1W9UIJEmKT1ccDnV5wFpK9Fad+FteSE0nefGHk8TMdLaDBY+M6CZshNq2SDd
 Gmd1TxQeSYwcH7hsA7CkBfGb1dj0M572eGV+V3xzfDbgtz8KQ0H1TkKQMV7Qv2DTh2YSQEXXRX5
 GraS4Mb17/q0H0AnMFfZtBV1z2qkHzhRcXlYGm9SLBVTp4E73tUamLtH3L8bZdHL1OLQD5VVUA+
 7e3W276sRLxolAm3WTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070219
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64086-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BEEE651C28

On Wed, Jun 03, 2026 at 07:48:50PM +0530, Vishnu Reddy wrote:
> The iris hardware block is described in the glymur SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

