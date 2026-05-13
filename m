Return-Path: <linux-media+bounces-61511-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJszBNDMBGrMPAIAu9opvQ
	(envelope-from <linux-media+bounces-61511-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:11:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3363539A78
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC0B3302E95F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9243B19A6;
	Wed, 13 May 2026 19:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QISSdNBo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eh/fL4Ku"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EB43ACF1D
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699370; cv=none; b=FEaMPkvwy21jG3z6tHiWseSQlwdkPo6vt7SG3m7TYWMzpgO+cO62NuQwf/uf/xhkhX/oGKAP5Zeui6UdiGSpYntMEqLrs+TLH7saN+y7Z0FmoRCVU84sZ33gTz2VaCjFieF2JlFFxcJuh3zCqn4ZaLXQE0znUC8UzxBBlFznH+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699370; c=relaxed/simple;
	bh=TLEgs2j+NLTxvHfvADiUHg4zWka2Qm9LSD4iAcUsgVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rX76Oxdf4Zexu3ENYxq4dQyNZjDwW8QrG8Eb7dYZ34VlmxYYZt/yNfCIW7qWvVuunyyq/gvS1UjgNlsTgkBfxq2k2w8TIxJ6+nlp1gGDFo/OB3FGEOOLwbPA1zRn//9XmaLT+3fI7cKQkzQeXd5rkcM1K5xx2NwWtXhh4YpZir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QISSdNBo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eh/fL4Ku; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGXv3m2321468
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FQL5G0XdY34vSKAuhLaAvXdh
	NyGZknux7fG6J+8FZ4M=; b=QISSdNBoMhsdNEDhKG623GlSz8f8eJdoFv7deP9M
	g0qUPxfy2J0RHRgs1hXpAQ6TumnzbsEy06AJrv7s142cS+29QjG/y2tJKdh19+lQ
	O7izoHXAKb5NsPe1Oa8gh5AsSXKh/gk+/h37MfHtMgkhO9Hx36PlUP0wBFIO9ufK
	DHmyFUcDYdKqT9tAkia4K1RrXZg+xQ1SBYGpJLa3Rcgvt8i/+Tl3jiBQyNLYmLch
	ZwYwsLSXZqAJzsMunEIZUrDLirnrBu8K7J18h5pNt9aAGRqlDAM5mqjrrGtzihVX
	MWAmzTigDvB4/8Sbi45+vkLWs/aTaS5QNraUSA6SIPHhTQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgubmy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:09:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5104b861649so215518111cf.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778699368; x=1779304168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FQL5G0XdY34vSKAuhLaAvXdhNyGZknux7fG6J+8FZ4M=;
        b=Eh/fL4Ku7ghgi7il7ntWxtWbO64APonSNMTw+n8Pjwc+vWTzQ9VGJlW/WOfRgHFq3d
         CsXnc+GgkWT/mV4gbYjnGu7ZKKhhn7KHDKYPLa7zco+sqgSV/Ua6/e5s+Cbi6Os0sE1i
         3BfXngCdcze7DRMyKHVosUUU6SoKVWaJkHve3pFzuEoFkmVrezzthuD3aoX1Xg51LUKD
         r/UD1KppmJtciglaPciAKkqchnE6g8IiiXuQ67yLFHOTlcaT2mpmKENRwgMrNzfXaeM+
         9kIs/2fWWL5wzCy9zUoDFtJ6712GrRUcMNCm6k2go+2DySj7owKs1DXMolCjcvxJ1Qwv
         P3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778699368; x=1779304168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQL5G0XdY34vSKAuhLaAvXdhNyGZknux7fG6J+8FZ4M=;
        b=MeWLTtQ/SMpV7Dn1FoROZJrqByF6WtfOpXUKvx2L4T35euWFfb1WxwoFtRjT4nhI5+
         twMxTfJkcaERIb+FO4N0SDko5fs6mlALfuK0MloiClZVD2xMR/qq0Fi87cEh2GLmgjmO
         VuyDr50mYcb9df3bfYw7FT2OyXDf7KnkZ1C8DK4dVuxteR2MRv16jizGIcLSGEgJEe+k
         yKM18GpTA6fORnw1OBmN9ybkRqImPtZTUW9dJkYhw82+rsAIboTQMDA3/ennRIMonMOa
         GFFK6wmYmW6ZkbLvwDEBlg8eOH5qr5hzcZml/oRIXIrI9Sr5DldqqeIi6nZyd7FaGMJa
         GZkA==
X-Forwarded-Encrypted: i=1; AFNElJ9gt49tTsl6IpJeIPZBhDpjfWIW+ioCHJ1HrE52F77y+kkZvQimJEHr+sVB5NbAs7r+x1cu+/kc+HdCSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjgH4wUeKoqUEbPc3p0ieXJcxTOvFOSt5wkp6Dv5xKbT+tFmq1
	jVKEdnjuAP7PI8x76zUwTuyQQI4rmI/jdNDbYmpr3HaJvvU8iUtIAUlUsowWH6Myo9ccCKfezPE
	lVLluQ6Frb3pIg/f/2CS5tXWHgcHVZfrUWAMWVNa9hzJxCgUmQcjlZKy4WJXXHD3uWw==
X-Gm-Gg: Acq92OGayUJQVGetYiNJnNV5Ywru4WSizoDCdbCzL84F+5ELBiHgFL/cV8Res3M2CaU
	z7xeNf2WSYnognoyy918ELOCfJIKvw1RgihDZMPAxAWmXPMiDyCsi75+WJvhYqoYOHKfbuxdJNI
	Qbu8lIAhOwgVs6Unt524gb2WoNTvBd6EEdBM3AaPpLs0/3HW9YQoI7vXGSu9TNtpSbks6i41ULH
	DW7tJCB6QjNkN9g9J3uHAg20SFF9p8izG4euqA2olXepGaOQM70NlZJwUdKAavsLdB67fMgwKpR
	9+Fienuhek7xmXG2PXV0cF5vDBJP8Kg550z5KBrUStWocvQQ9HzsElt7zUxePpLHcOPAXXPRqsa
	grH1ZGbZCx7q0ZjNySQyNyA2975zRKGB1aqFJJTdnPKcLR9J9jPSHP4pRtESMktoCf38w9hFGhC
	ofdJcbZg2mSDVS6uPdkm+ZFpEanc2qZ+mZLgA=
X-Received: by 2002:a05:622a:199f:b0:50d:7135:5631 with SMTP id d75a77b69052e-5162f440d10mr61584591cf.6.1778699367524;
        Wed, 13 May 2026 12:09:27 -0700 (PDT)
X-Received: by 2002:a05:622a:199f:b0:50d:7135:5631 with SMTP id d75a77b69052e-5162f440d10mr61583951cf.6.1778699366968;
        Wed, 13 May 2026 12:09:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11ebb0sm1313e87.36.2026.05.13.12.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 12:09:25 -0700 (PDT)
Date: Wed, 13 May 2026 22:09:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <csiicospkjf6xmrgpzzxkto3antp24jlrrptg5zzchbm3t2xkm@kalgsyhg6i52>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
 <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
 <20260511080104.c4nhhmm2xgzm67fi@hu-mojha-hyd.qualcomm.com>
 <zaq7evuw6la6p6zcv5zgv2nuehc6yxt6xxojjdd2rdflxtk73e@wr2w2kbxamv7>
 <905f5677-5daf-d6e9-437f-7b928036ea95@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <905f5677-5daf-d6e9-437f-7b928036ea95@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04cc68 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EVYz-rHPzUa4Vbhsd_4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5Ymrg1m1aiukuFX1yyAQ71HWty_pFbuR
X-Proofpoint-ORIG-GUID: 5Ymrg1m1aiukuFX1yyAQ71HWty_pFbuR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4OSBTYWx0ZWRfX5jlk/JI8Wql9
 w4uxwk1dy+UzuALG/OyGkmpx0eXdq5J7KdJ3d9k+VsVY8a4ReI8BtE0IsEedSEIV5Th1GpsVgPL
 3Xki0O+BQwe5mYs6yBAncBoHmCevsWsE0Diu9dTFehR/DqswmWIRQqivr4joJFpmS6S/XOPQpPw
 GXPer8BzqMXgta+5PpHAgFQ+91ubBlnsqt4xIF9R09+toGMneXsFr59UlOTM+FAS/sjknFmPtzz
 DPGkNXWS8IFq803E6Y37sVp+h7J+KfAU/E8qgc/q6MqXQPZgnYsNGGEc/OTGgWsjoSADlnx6z19
 z/xuxv8ONtmq8454+osJA3+NeFZW3dfJbjTlLRA3UdZeyqpp+fA6+7tEPclrJzrs/bT4C9uMMg5
 e51mSgQpGn/skl2cRNAGnNvaWihY4foCwhfs0EoN6n0CrKwCLqy3fvzMTXTuhheUZgCsDLnLIHa
 9gejyvG18LWf/Sk10AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130189
X-Rspamd-Queue-Id: A3363539A78
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
	TAGGED_FROM(0.00)[bounces-61511-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 12:24:55AM +0530, Vishnu Reddy wrote:
> 
> On 5/13/2026 7:12 PM, Dmitry Baryshkov wrote:
> > On Mon, May 11, 2026 at 01:31:04PM +0530, Mukesh Ojha wrote:
> >> On Fri, May 08, 2026 at 11:20:06PM +0300, Dmitry Baryshkov wrote:
> >>> On Sat, May 09, 2026 at 12:29:56AM +0530, Vishnu Reddy wrote:
> >>>> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >>>>
> >>>> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> >>>> or QHEE), which typically handles IOMMU configuration. This includes
> >>>> mapping memory regions and device memory resources for remote processors
> >>>> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> >>> No the calls to those functions are not intercepted. Doesn't hypervisor
> >>> simply implement the SCM calls?
> >> All the SMC calls are intercepted whenever Gunyah or QHEE hypervisor is present
> >> and in most of the case the preparational work for the TZ like in case of
> >> qcom_scm_pas_auth_and_reset() it does create/register SHMbridge over PIL memory
> >> so that the TZ can access the memory and then calls same SMC call to TZ for
> >> authentication and once done it comes back does mapping the PIL region
> >> and call bring up sequence of the co-processor.
> > I see, thanks for the explanation.
> >
> >>     SMC  SHM setup    SMC (auth)        map memory/resource and trigger reset sequence
> >> HLOS ==> Gunyah(QHEE)   ==> TZ    ==>    Gunyah(QHEE)        === ==>      IRIS 
> >>
> >>
> >>>> later removed during teardown. Additionally, SHM bridge setup is required
> >>>> to enable memory protection for both remoteproc metadata and its memory
> >>>> regions.
> >>>>
> >>>> When the hypervisor is absent, the operating system must perform these
> >>>> configurations instead.
> >>>>
> >>>> Support for handling IOMMU and SHM setup in the absence of a hypervisor
> >>>> is now in place. Extend the Iris driver to enable this functionality on
> >>>> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> >>> I fail to identify, which changes correspond to this description. If
> >>> it's about the PAS context creation, could you please be more specific?
> >> I think, commit text is trying to tell the Infra to support any Secure PIL when IOMMU is
> >> managed by Linux at EL2 and the dependency related to SHM set up in Linux are done as
> >> part of [1] are in upstream.
> > Ok... I'd say, this part of the commit message might need some
> > polishing, but I can't give an exact advice here.
> >
> >> [1]
> >> https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
> >>
> >>>> Additionally, the Iris driver must map the firmware and its required
> >>>> resources to the firmware SID, which is now specified via iommu-map in
> >>>> the device tree.
> >>> Why? You miss the most important part here.
> >> Sorry, I did not get.. are you looking for explaination here, why via iommu-map in
> >> commit text ?
> > Yes. Why are you using iommu-map instead of listing it in the main
> > iommus entry?
> 
> Without hypervisor: iommu-map is populated, so the driver creates a firmware
> device and handles the IOMMU mapping.
> 
> With Gunyah/QHEE: iommu-map is omitted, firmware device is NULL, and the driver
> skips mapping since the hypervisor takes care of it.
> 
> The main iommus entry already holds other stream IDs (pixel, non-pixel, etc.)
> and cannot be used to distinguish the firmware SID or infer hypervisor presence,
> hence the use of a separate iommu-map property.

This is not really an explanation. Would you be able to understand it if
you were shown this text?

> 
> >>>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >>>> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
> >>>>  drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
> >>>>  2 files changed, 66 insertions(+), 10 deletions(-)
> >>>>
> >>> -- 
> >>> With best wishes
> >>> Dmitry
> >> -- 
> >> -Mukesh Ojha

-- 
With best wishes
Dmitry

