Return-Path: <linux-media+bounces-58208-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIRuIdEF1mnbAQgAu9opvQ
	(envelope-from <linux-media+bounces-58208-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 09:37:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5363B8674
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 09:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F67C305F80D
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 07:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5E5385522;
	Wed,  8 Apr 2026 07:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nW+T356e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8s2Gcfg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4634C3822BC
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 07:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633567; cv=none; b=OdcjxjBMnGfnrnhGCbvCYl2S3AvnyvXFLOcIlAvt3TqYPUl1QqNjpAzs4mNG1Q2jxt6D4kGiqc/4PiSrPPzVguolgRL5L538KhQdxwKytW6Ch3o931bgRscBziFGE2H+fbg8+KMCW1a5omnMNQ7+e6isr/XBeQRgS8zt6lNx0GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633567; c=relaxed/simple;
	bh=OveXBMU2Rs8ereI1m9UptjRMaYvkzfBMcmK+hgcieTk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uR/bdKEKFkZkcWFzgJBMZuH6RRUTrubKl3YDRC8u5yA4mn/YF5LkF0rgtF1UoKRS+o7WL7aaNie/EGi02oNLpeZwBhZgWlMATkBWxr81e7AgidBcLHiMQYPU9rg9yXrnmsLWKrvdsvdGb7FpxK/5pazJARVTS08oxEOUPyQUCBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nW+T356e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8s2Gcfg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387GelV2860429
	for <linux-media@vger.kernel.org>; Wed, 8 Apr 2026 07:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xckB8PPJx6+/vCorN26HvLDM
	xAJX+r/dYxdwC1AmZgc=; b=nW+T356eFEiWlNV25OIPnYucbssv+TRN/QY2qRAf
	QPRvHVVopBSmj/fSXs0NgBVDsJ9QE8h2ok+x0hvLsG6TiUlkCg3wObmLBv3a7kyl
	m2nzw3uI4iNng+JA9e6cvv2Wr9/bVrWoP9AgCaOtYp8dKr0uxx8E/hlWlK1ZeVQ3
	WEMSL+o4zXWOunDSRMY8navjM9E6q9a8BQsXTSnLcqh6IrTx2LaLgYKULpd1TeUY
	/UDWZ7IRiI7V0ojXtEFPxFq2jCCBms5mBavoeF2GzEXNoWRAmbYzsK4rZpqtAOP2
	9hwyvyzYAsDYq9cz/CCF+9umhTFAznHxI/Lr5T7DlLXzWQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8sjvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 07:32:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d831e8083so70745541cf.3
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 00:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775633564; x=1776238364; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xckB8PPJx6+/vCorN26HvLDMxAJX+r/dYxdwC1AmZgc=;
        b=G8s2GcfgR3N3BRGa/eA7J3eg62OdrDfrV8Z8FYnzHmvDsJHPp6ajS31K8uMIrOIGra
         ghHUiQA6pJWPLPo7+CsyDhb/fpMY6HyJoyPTo1Mw2qgGMPBUIf+Pow6o1DM50L5FQZnF
         drpFKklQe/3g8Id7wbMpRbjIZyEt1CSQ1DqX0csM16Ve2Sq0NMebaepg77wGptc0fMc7
         ZV4tj3RUuK2WNkfDGpbNpc/wmKlKDytILdEkdKGeSwzwgSt1a9+nIU9ToPl2ZyX8nxjN
         Ff8EwCqWeUbcv6SMeIsOgya5U85eVwvpF2zr4uY1VqXI5IfSMiDp5Iw4affzIz36tXMe
         79sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775633564; x=1776238364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xckB8PPJx6+/vCorN26HvLDMxAJX+r/dYxdwC1AmZgc=;
        b=nsV2FlwNZ46TMeoWZZ6yUefYRarVvlWhhlEdn8PufYxwn+nf2l00rDK15F2zRlz7lq
         530Ft7KZeFV5pvxtoY/N9velu6HDR3bcwMGdm1CvMaplGpJ79JVurYOhJ/Xnb0HKkRgM
         GeXf/XcZR7TPUZXENwjyzuh1ZdbvrW/+/7xxflFM9c3KrNy9aI4ZgAjvwwSdxX9goJN8
         L6e3D3IGONpVv1xUg1QzYm59S5nm5k2T4ATpuQJl2fxgXDBpWUsk3TVRdAavoWDZPoSE
         W3W8WJ2JWblfSQkRkDmUQiFzDEXTwf7MNH8YNjDvrEwOK4q8ijPBHMZ0+FR8iilk87dS
         fuDA==
X-Forwarded-Encrypted: i=1; AJvYcCUyMo4kAdWDtXtx5vNpB5tTtqcVhTMUcGJBdlP/WDcKD+ucbb6k2rlA/wweJvEFKzBkNpcNJHdx2rpAeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC5KQkeeBxuHITdCmeNXtBXeNQiQ0kqkWBtWz5s2D0oJ9Vxzp9
	YE1JTrTGZFB3FuclFvqG/YXf+tR5Q6sFMaa9AqXrEsH12IKjV4ZM5lGlKhSZxCHxSxAhL8V0hkE
	oGkmu8XfkkThsob+TJPKSIgZ/LQQG/URp4Xmm2LOMPp+TabfZbiZyRH/fzRkzLL/Jpg==
X-Gm-Gg: AeBDieszyrdgKzV92+Fh2chUhQNDv1JRaBEEZaWZiF2U8m00R0BSbIS9PSCzA4A3z7T
	DdAjSsUiI0J4gr5bxI9tM6Bv9YJvnovGVrO+G7Qv+sPEor6QfLSL4REgiHTno6XntRFwN+b/TFU
	BsDln56aZ5kEeaieZFoQWBrvqu1lDIos1wx5tzdaiidpJRyhWosdovh+Ui+Kh/ihwUHQOX9xjkq
	gdDV1GpnFcZkNDpNcuaRIq+E4AGuJnvr1c8yw/IwYDE0MqGnIaQjltlVIpR6pKwqEN1E1tcV5Cf
	v6ejPQ+Qn/ki2owo/w3dtHYgqaiXXCsLBwNPP0GZbqtyazDQ0N+8bONLFeZ8HNF3pVJa9ZX9nVm
	ZP5oiWzzaXYGrvtTmagzGSgCYi8d4konyu+XiLt71FK3cJfrpTB8RJcuR
X-Received: by 2002:a05:622a:124b:b0:50d:83de:4933 with SMTP id d75a77b69052e-50d83de50cfmr202934441cf.20.1775633564136;
        Wed, 08 Apr 2026 00:32:44 -0700 (PDT)
X-Received: by 2002:a05:622a:124b:b0:50d:83de:4933 with SMTP id d75a77b69052e-50d83de50cfmr202933731cf.20.1775633563612;
        Wed, 08 Apr 2026 00:32:43 -0700 (PDT)
Received: from trex (187.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4889cb46adcsm383692655e9.4.2026.04.08.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 00:32:42 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 8 Apr 2026 09:32:39 +0200
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 11/15] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <adYElwM6eT5T8hZM@trex>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-12-sumit.garg@kernel.org>
 <ac-KQ7e8-syph1Zl@trex>
 <adOcMsk8a_Clb4WZ@sumit-xelite>
 <439f9bbf-1ba1-465f-b5af-01ba0ebb86d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <439f9bbf-1ba1-465f-b5af-01ba0ebb86d4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 17wp0g0sMIbMImNehFW5_Jw6byaWfUUn
X-Proofpoint-GUID: 17wp0g0sMIbMImNehFW5_Jw6byaWfUUn
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d6049c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=VPdg2FrOqWfiVCzsz0q0YA==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YTLieAA4xaQwPRX2avwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2NyBTYWx0ZWRfX0hv+MJckmE8J
 dpdKB9Hy5p1R8xy0kCnNeWaf/qAWqLI0f59UyOblhLKD3S/AOcX0i8SGeeYPfd/b81E0SkaMYTI
 IqA/YKZ/yiIhorBCkuw6KNHicBPALAfTP2e8BCydptCttq+9dmQplCuwEINRRQP1AdIuEwEXoeX
 rKBQ/ufQwwLacwnb7Qw/JkpiPhOkww2c6cMxhh3VmI4LvDSv18cs12zNH8XnbxejUkbZn9/Fu9t
 OiH5r3GvJj4uhS2XxTXO5uPgmo1B4dj9XQc7dKPEPVyOHNpjVZEkyllgfdEQrFChP7V2SF/HqIf
 B1QNZZIH4qZEBkRRI8funfWFEkgK1N65RZBma8Nly11j/tmgO7180azyw+ycMEDKR6lHsz+L3zr
 4C72HQfgsdkDS/abSNJCcYGuStKsN/XY3HoMACCpx+pV6uu11klcM2Q5o5MLLRNXxOISYE5a4Pv
 mr6VkkkftvGgvl3RRJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080067
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58208-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorge.ramirez@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED5363B8674
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07/04/26 15:14:22, Trilok Soni wrote:
> On 4/6/2026 4:42 AM, Sumit Garg wrote:
> > Hi Jorge,
> > 
> > On Fri, Apr 03, 2026 at 11:37:07AM +0200, Jorge Ramirez wrote:
> >> On 27/03/26 18:40:39, Sumit Garg wrote:
> >>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>>
> >>> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> >>> TZ service allows to support multiple TZ implementation backends like QTEE
> >>> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> >>> backend service.
> >>
> >> OP-TEE based PAS service relies on the linux driver to configure the
> >> iommu (just as it is done on the no_tz case). This generic patch does
> >> not cover that requirement.
> > 
> > That's exactly the reason why the kodiak EL2 dtso disables venus by
> > default in patch #1 due to missing IOMMU configuration.
> > 
> >>
> >> Because of that, it is probably better if the commit message doesnt
> >> mention OP-TEE and instead maybe indicate that PAS wll support TEEs that
> >> implement the same restrictions that QTEE (ie, iommu configuration).
> > 
> > The scope for this patch is to just adopt the generic PAS layer without
> > affecting the client functionality.

the patchset cover letter + the commit message + the OP-TEE pull request
being referenced gives the ilusion to users that with the current set
they will get something functional (they will get a broken video
platform instead if they try to use OP-TEE).

That was the point I was making: IMO the commit message walks on a thin
line of "completeness"

QTEE and OP-TEE at this time implement different use cases (Venus with
QTEE runs with Linux on EL1 , OP-TEE runs with Linux on EL2). So maybe
worth mentioning this divergence.

> > 
> >>
> >> I can send an RFC for OP-TEE support based on the integration work being
> >> carried out here [1]
> > 
> > @Vikash may know better details about support for IOMMU configuration
> > for venus since it's a generic functionality missing when Linux runs in
> > EL2 whether it's with QTEE or OP-TEE.
> > 
> > However, feel free to propose your work to initiate discussions again.
> 
> Vikas and team depends on some of the IOMMU patches to get accepted 
> before they enable the EL2 venus support. Please reach out to him
> and Prakash Gupta at Qualcomm.

isn't Vikash in this thread, he can ping me too no :) ? but sure, we'll
synch later 

