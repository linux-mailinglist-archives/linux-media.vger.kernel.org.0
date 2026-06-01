Return-Path: <linux-media+bounces-63239-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id e2kQBP5sHWq6agkAu9opvQ
	(envelope-from <linux-media+bounces-63239-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 13:29:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 985D261E549
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 13:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2BC73012272
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 11:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA41938947F;
	Mon,  1 Jun 2026 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGfffAwe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UuM9Nhmj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D828539E19C
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 11:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313053; cv=none; b=a+9WQq5nggKYpuXg5s1OBpymLQxP8vaN1//l5SIEEMTn8C/JiBKzrCEJGGq/H0swmqlYHMza33/7dyx7dL8/jidR29xDW2HlIsEt5s9Uafoh0tmjD/22l3Z7Ja9Om55E90Sjtal6nk4oHusJpLZYXacE1mq319d179nwsDIDctA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313053; c=relaxed/simple;
	bh=qF0Ufo/CjIRzKBzBQQtd19XCtcP1aSRWrtVrk1k3Gg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z78p+IR5DjonW8RP4PF3G673bXgCUMS10hHb5V8RmotROEn2anwkxbh2Nhdz9PIF5MDP0Vne1ZjJ8TpGvNoBYg9qvkmSr7KMtk14DmbcQQalDriIM5XoNirDKs/voevWG1jJB/KE4gOeVpGYJR16o2R0BzLGwjMpnxpaYLTFawU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGfffAwe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuM9Nhmj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fE0D1257502
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 11:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ArCUJSu0p5Rr7kXoBPCR6AQJ
	dxQ3plRaRNA21LoO2vQ=; b=kGfffAweEuFI61ksMVOgeMQXVInhen1UNYG1849B
	gwrE6W77PzXJ55F0VIo/G6QE4UFr4VkNBqcNCgraI/1O9owetKwsDe+zvxq7xoQR
	JYDcjuMt1IauhlADNOZsoSQaXTCXxeXtFXSOXr4Yig5qYSbSkYDYlSiSl+IYoTrg
	jMrVGCQesGyfSSSgReb1/L0IAgdQvm2ohB2TTzFN5ulheYqsCVycPI5x19OlXZUJ
	5dN3mHud3khZdJe/Co/J2rlGF+fRWBWFwcVan5WhgZDEXoXgvhzRgN+zGj3ljH6k
	x9rhNv4aGp3tYB5iT8vrovY39fBM4dC0tMc5/RiBrRS8bQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6ssrn6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 11:24:11 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963aef8141bso419580241.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 04:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313050; x=1780917850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ArCUJSu0p5Rr7kXoBPCR6AQJdxQ3plRaRNA21LoO2vQ=;
        b=UuM9NhmjQwFH0QXyrNFau22D62X8VV6XPvsz0TbQXI444ON8Yb+JXzSemBat1rTFwV
         k3nDhRL0+dfSVirRraP8G4nh5o0z9VlGA2BhMSXGLatpkbFMR2XGoFIoFnr1EvOMdP/l
         +Jt+ZZSnWo1MsqL7uhFWByNFQGLfh+TC2jBLIq2c6hPELkItmYxN2/dDs83YTts1htQl
         /ZwwmekKx26Qv0ZkRK2HMVG/WXmYodAb7jZb37MBRJNiK979I+nOtr3kQPHMzf99EEyt
         JhxT8WSVpX0NdUtPW4PneWZP1jBrAoPRdd96+u8aGaHQoLpbuH3gbg2yXG8ug76aYcmt
         QJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313050; x=1780917850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArCUJSu0p5Rr7kXoBPCR6AQJdxQ3plRaRNA21LoO2vQ=;
        b=WhBQ3W3oC89lgPRpVS52BW9nujeykwGYJsOOpMv0R7An6IP2rtbHX9XmnkbXA+7Yvo
         uZaIz9LG2rq6XlNeVVxlQaeT/FuW/LKav+xHURh0eyypxCSmvqsACmwG8GwzbJOMj6Jz
         4nnCAJDPvN+PK62gkEg2HRQGAVjQsXLd2LsxGPWOZRWHeF1uOQqWW3xoJSpja9PQIcxq
         Y95uUYtFD9vVRLrxe9QcgGhQtGAyygIRBsRkSMohMZKWgVdhQmV3tAV2n+m2g3bH/GFq
         sIavWPOujYxlH89q8Ah/i7QJGmgYyTkaxxRk/t9arA/xyJb2rBrAlzjPYvy3vI5yxMKn
         fYcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1w3ouX4qwjzQy8c46SogS78IQWA6/plu7jJsvz/2FtbsHeSSQ7c3y6SNj1ma0hpTwbhu2dmwtQMyLAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUFvu6b1HbUDxKMn+0NQMtspcuGTP/K9WQEcur0JTSJst/uJWz
	TP4lvsCqiDU5+PMcvFyZaPRN/u9tgslM4G/i/wNGlVO5z0O9scUeD6zl5vT0v8jVY62G5MYZWXo
	XtIczQqhv1KNpjvMd8H8UZBZqM3CnRuQ2k91j5U3GFRxIFVi7DmRJIigiKjcQDwyXfw==
X-Gm-Gg: Acq92OFuACfljVVnzEuz/y1uRbw3HFYTMDN1fKUvWApDVU70hAgZUKSIKmarm+k2USJ
	CDq7+UwQ/XAm+3CtiQ1zLSmhfMVWil1K3WxYOf1wVOr2Pl7f49xF+qsbLm0ERcgiThKyDuINBcU
	DqkoaV4VKez0Eba9o6hkDowqvMXNhvBRF2cxNZpfhQ+NhkSgIn1iqcQfdFQ2zLrCGD06IXjOx7Z
	RLEhPwD9EjmAZFHukNlK7qr51BmFw/ysP4Ou2CnF20bFR1eBQfnfko1iqLjWirPGm3dbE6kHsLa
	qw8nrRk/umBXycB9LBv4S7iqlNpTf8AEQxjQIeFrphCpxThc2ctILsuh1j3kqZDhrI+pbVI8KCy
	UbXoVQnSogur/jFgLqg/INhPlfV+j+n9g7FzrBGh/J0LtgqJ2Y7qRM6TNMefmqmxrVMEz2Tf8bF
	O1Fqskz2DV2eKOerzD2hWt6B3OC5ovljXxMC7dW/c3eamF8A==
X-Received: by 2002:a05:6102:5049:b0:607:4fde:1921 with SMTP id ada2fe7eead31-6c6976d1327mr2867665137.24.1780313050087;
        Mon, 01 Jun 2026 04:24:10 -0700 (PDT)
X-Received: by 2002:a05:6102:5049:b0:607:4fde:1921 with SMTP id ada2fe7eead31-6c6976d1327mr2867647137.24.1780313049688;
        Mon, 01 Jun 2026 04:24:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa70b75865sm182056e87.18.2026.06.01.04.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:24:08 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:24:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for
 qcom,glymur-camss
Message-ID: <5fdcnv3k7w2r5at3oun4eldgbmh2o25rmb234urksy72le7an5@ddl4aapbjexg>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-1-bee535396d22@oss.qualcomm.com>
 <8618255e-ecbf-4f55-877d-09cb2faa6f50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8618255e-ecbf-4f55-877d-09cb2faa6f50@linaro.org>
X-Proofpoint-ORIG-GUID: RQeyS_k_gMHafZnUVlnS_Gq-9cx_29xi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNCBTYWx0ZWRfXwoCNMV9XQ+T3
 gMtl4p8+xKHTpVyl/vuxcoKdyp6A71KJcMeS3/V93WBkNvAUZ6imp1PWf5cy+cYL/Jo6O9vYM64
 E6n66b/KDCrw8+0gxiqXUsNWuS7MrWnvSMFmMxS7AKLAGzadRxIwKSxPSr7nPnPUsH0sfn8gEmE
 h3KBPQroxdGl0SUoNxFng8dB9OmGGL64nfdllZFbdrVXbag5bfHnEWeH3wsxYbZs3FLY6HY80DO
 QqExyoxHVr8CPffYnhIEwzn2SlgbBOdAftxSZMB0hhIMFLaUHnqZZcs+Jn5Ydgx9ZZGmq0DAb4n
 ZyX7KcXWl3TJHl8HA7UPGn8AEQeKgJ4Bt6OpDOJqBBqFlRWizSz+AnbFIcSXOxsq1yQDaGmgU8K
 9Cb8lkvzaA8DdeagSO+kwTOe0Q8/ey4R6pRMJNLndSBGhSwuiwMJIAgF7Q/+FaCo7SoVuE0Y0EZ
 xvbEH4oqNNmMtyHJkrQ==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1d6bdb cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=YcgPmG4jwsFezTXk2NgA:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: RQeyS_k_gMHafZnUVlnS_Gq-9cx_29xi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010114
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63239-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 985D261E549
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 04:07:38PM +0100, Bryan O'Donoghue wrote:
> On 29/05/2026 15:37, Vikram Sharma wrote:
> > +
> > +  vdd-csiphy-0p8-supply:
> > +    description:
> > +      Phandle to 0.8V regulator supply to CSI PHYs.
> > +
> > +  vdd-csiphy-1p2-supply:
> > +    description:
> > +      Phandle to a 1.2V regulator supply to CSI PHYs pll block.
> > +
> 
> To be brutally honest, I'd rather see effort and buy-in from qcom engineers
> in converting to CSIPHY as a distinct sub-node.
> 
> Pushing patches to hit your own internal deadlines to the detriment of
> upstream quality is not OK.

Can we please get an update of the the CSI PHY series? I think they were
some time ago, they received some comments and there were no updates on them.

> 
> This binding should be predicated on separate CSIPHY nodes. I've
> published... three perhaps four versions of that patch to radio silence on
> your side.
> 
> ---
> bod

-- 
With best wishes
Dmitry

