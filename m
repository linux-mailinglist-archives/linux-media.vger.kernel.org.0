Return-Path: <linux-media+bounces-59919-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLVvHHWt8WnTjgEAu9opvQ
	(envelope-from <linux-media+bounces-59919-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:04:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ED0490299
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5B883082803
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 06:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8BE39E167;
	Wed, 29 Apr 2026 06:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g438JSka";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrWOAyrq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D363439D6F4
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 06:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445987; cv=none; b=shZ2abWBWKCAUx4CWXxhG5q3UzPGNAhZj03M0U/AQSEtM6u/Hm/+4YsA/IdZ5L0oVFXRp5Ilm5Xoe7w8kXv//Asux6WCcYip2bOxlRhFmObWWwFoffQWZ8Y4LzWqg6/7Feo4YueDr2Gu7EpDIsiQaj5WA35vUS/jIQpNYtbPiSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445987; c=relaxed/simple;
	bh=1o8QqlAow6PmoPIT9dbQVNVo33WTouwEyxLpj5AEVfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdJBEzj4PpebmclmlnAWZWkSM4FmPEoMOS6pcvoas8az0EwNoB1D1vICHUSALkhrLUDF9g3+WX8pbP+9aIEWM4zJ/iHQtPmDz6HpGTgImGOziNJBIrWMMOpwcT220E/Ii7nf67GBihay+6PGQ14jRUlqznUl0ZEPLTFFst9FJiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g438JSka; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrWOAyrq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T20S2J3705208
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 06:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rpnLGvqaOGowhqbh0BhtKXXR
	xHvBmmvOGqR1wADwXo8=; b=g438JSkanjOpVQqT4BPx3R6bpd1VJbbmWFD6dKOd
	jFfFB+w7o2BFIQkM8DUi3dk+eLi2MmG2yFu2mvJoaVjZRpuKpKC8SOHGN1T4k6HZ
	eH9ZrtpUlQslZMlhYlYVUFi72Xrodhf1bXWVnE64mFiuiPhsLVRgk76DPLSLdQOe
	3wpSPbqj+929j7SchNlWiT/Mvmx2f3w9te7+sxffPyvR3SZ4QpMR9dvdKxnbHoHd
	r/5cgF5H5psWIcz6rpRnrZ7KiVHDlYy0AVG7IKRCWWDzx4ABdZYlug/nS7Nc/tDD
	/Al6A+BepM0Qxu+178Yh7cY8Ecg/Vm71wutdCwmhxrioxQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxhc3f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 06:59:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e06219cbso146125325ad.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 23:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777445983; x=1778050783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rpnLGvqaOGowhqbh0BhtKXXRxHvBmmvOGqR1wADwXo8=;
        b=TrWOAyrqtDiU/MXc6Y+9LG0ZO8VG9RGtG8RzWnSdkAgO0+GV64oDu27Zk7kBgmIs5D
         oco9LKyBSAoIysviSjTvYB8KxHpepNvVGp9uTRSZomF0zcSOCQmbDY9K+qn3OkUDjWFM
         Tc0Tv21gugU1ia6cKUsrBVOLDAhBomO2CuWoLY7LFSQoxXMZ3vzn+RUoj/pS3nSfMPd6
         KQzdI9z5zjD4zMJ0aAtd93zTYHrrBPURiQ50Pb+PxzNxvW8WNJBfo+CBrxq0CpVmoJqG
         lDMVJ8EVESzSm3xfsOIPtr5DzTo1th/tHyJrX+u/TyVOVoOCJF/byL/UI7eEguh/SD+V
         tyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445983; x=1778050783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpnLGvqaOGowhqbh0BhtKXXRxHvBmmvOGqR1wADwXo8=;
        b=Zl5/ERwiAzAv3lZXPTdCl5sNDd0lxnQRV6KMWQ2lp1Z/cRe2YvslAZpzLB1OVjuHn3
         P0IIaXM2UVbxrFj1quqqRaCED4zK70vBBQjEDJcSuIUxoZCM1FlunKxHLicStKZWMmHM
         O52qjqn86GCcHTnDf+mK+KbBlNMON7v3XqkNEbY/k0EzVtk/IweyZAmPlSRP/68TpvgG
         Tf64GEzI5BHthjNeqRqvlj2DeKKwKG51qfC5dRX4i3gw6o1/yzqXWPrD8q/mg8AImqhO
         mVqXZz6tGHszUybq8D8NvbOXfStCQ4c0Qh36VtJJiulw3it6mJ2MuJlN8FxAcJPkLLcn
         LHsA==
X-Forwarded-Encrypted: i=1; AFNElJ9t40E6o26PjkDrHebVujZMpn7djmEUWQFnU0JtbW9h4HN2B7B4acS9mVjozk2Ic9kRpd5oW2WElevjVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaOR0HaKXDvwFdVunKI0hriHULaa7VMTQ9GwfGZzIEpAN3WE9u
	NABRlVCmAW0/ew+PLpDCiZZy1hqE4JKrSaLT1zVlToWLCoqyN9nk1hNK1B1M3hfNXX4m/y2ejqu
	a34RNCsKD0X0AJoGOT5bvlr6NVM+o+NMrpdrLDE10havTSpduCAa/BV0oy23DY8KrAQ==
X-Gm-Gg: AeBDieue+V5sNMB5lwTXnr0oZeW5SioN4mUvVx67g23DiUXlnwm3BJ8kNRGH/eBL5Ky
	Zsy4wcg/Bm5UyZB/qi8czF4BUrtuXCj7S2Jco96oPBE6lqgAZ7kO68y0YCSl39aqqo1A8jo+q6T
	Cw92qIQmnzoZ+wSfFqQ/l0fCFNHzWf7B36kL6Q1EaIGBl3mhejTyhvF9h/xPUacPr6Rb8U/aJrt
	eNaK40jD68QIRI0xeZSMGD4iUfvG9Qu8+KWuyXLQ2tFsTYEjFahFA4nCLVsr1RRqZfo1JCpp5N6
	A/3lq2Z+a2JXxz0cZrrXSiGJqodofimEMwGRYkSWNWdDJWr/5EE5cW95S53yqODtmENH5AsY+Gg
	iiVdi7S9sG+6za5cOWHjBrMi9h7y+3UnbhIDBgK4BfVpq+uartr3+8kZZ3C8=
X-Received: by 2002:a17:903:984:b0:2b2:ec31:25b0 with SMTP id d9443c01a7336-2b98741da0dmr24709275ad.29.1777445983176;
        Tue, 28 Apr 2026 23:59:43 -0700 (PDT)
X-Received: by 2002:a17:903:984:b0:2b2:ec31:25b0 with SMTP id d9443c01a7336-2b98741da0dmr24708625ad.29.1777445982436;
        Tue, 28 Apr 2026 23:59:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971938sm11669805ad.71.2026.04.28.23.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:42 -0700 (PDT)
Date: Wed, 29 Apr 2026 12:29:26 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/15] firmware: qcom: Add OP-TEE PAS service support
Message-ID: <20260429065926.5iliebd3d2j6bong@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-1-sumit.garg@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NyBTYWx0ZWRfX5SX7lsipUW4d
 8m8p3Qq9xPBB2MCmoO4O1WNOnKI00eTt72sHc04r9HIPkRJYx1JSGsF/h/Jx++dAQCNAWXXQXrw
 tqTzhDMlyiYr4f3Cl5zyarAL1qbHtkftPfHFtHrl7NVx60gixEWu5l6Ar/s2bW73UsLu2nhgewI
 rTItTyI0wIcZtiax/QSM0aC3TNnuh3n5weywsX8uf/doi0KBXr9hT+6lJ7MwhYquYxoUFmag1go
 6QxmbnH97Du4VGsidVzP5mw3IRq49QUora6L/ll2RNGVbNqB0aGWWh1TPzJh0GIYVzBXRi5KeEe
 h4gC/o5vYqsWM/+6ghqiVL1bKRoC/KWkNUXPovusAk0Ella2xjqEenYMuPRli+msLFeawatfGVa
 ZD7QXY4ieDlOXXJjXIyxgbEd0p2ZXFcKRIcvNgkJ5qpyfVdib0t807XACiHsnwZCJ4GEZfJRs5q
 V6K7r5BEn/0oJIZsjxg==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f1ac60 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IpgJVh4PXWExouJfQAQA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: wHL-uZT-r8Y1g3ndnw8bvjwKsSnTX2yF
X-Proofpoint-GUID: wHL-uZT-r8Y1g3ndnw8bvjwKsSnTX2yF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290067
X-Rspamd-Queue-Id: E1ED0490299
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-59919-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 27, 2026 at 03:25:48PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
> 
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
> 
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
> 
> The TEE PAS service ABI is designed to be extensible with additional API
> as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
> extensions of the PAS service needed while still maintaining backwards
> compatibility.
> 
> Currently OP-TEE support is being added to provide the backend PAS
> service implementation which can be found as part of this PR [1].
> This implementation has been tested on Kodiak/RB3Gen2 board with lemans
> EVK board being the next target. In addition to that WIN/IPQ targets
> planning to use OP-TEE will use this service too. Surely the backwards
> compatibility is maintained and tested for SCM backend.
> 
> Note that kernel PAS service support while running in EL2 is at parity
> among OP-TEE vs QTEE. Especially the media (venus/iris) support depends
> on proper IOMMU support being worked out on the PAS client end.
> 
> Patch summary:
> - Patch #1: adds Kodiak EL2 overlay since boot stack with TF-A/OP-TEE
>   only allow UEFI and Linux to boot in EL2.
> - Patch #2: adds generic PAS service.
> - Patch #3: migrates SCM backend to generic PAS service.
> - Patch #4: adds TEE/OP-TEE backend for generic PAS service.
> - Patch #5-#13: migrates all client drivers to generic PAS service.
> - Patch #14: drops legacy PAS SCM exported APIs.


Gave it a try to test the series on Lemans with Gunyah as well as KVM
hypervisor and all the remote processor are coming up successfully.

Feel free to carry 

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans

for the Series.


> The patch-set is based on v7.1-rc1 tag and can be found in git tree here
> [2].
> 
> Merge strategy:
> 
> It is expected due to APIs dependency, the entire patch-set to go via
> the Qcom tree. All other subsystem maintainers, it will be great if I
> can get acks for the corresponding subsystem patches.
> 
> [1] https://github.com/OP-TEE/optee_os/pull/7721
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/sumit.garg/linux.git/log/?h=qcom-pas-v4
> 
> ---
> Changes in v4:
> - Incorporate misc. comments on patch #4.
> - Picked up an ack for patch #10.
> - Clarify in cover letter about state of media support.
> 
> Changes in v3:
> - Incorporated some style and misc. comments for patch #2, #3 and #4.
> - Add QCOM_PAS Kconfig dependency for various subsystems.
> - Switch from pseudo TA to proper TA invoke commands.
> 
> Changes in v2:
> - Fixed kernel doc warnings.
> - Polish commit message and comments for patch #2.
> - Pass proper PAS ID in set_remote_state API for media firmware drivers.
> - Added Maintainer entry and dropped MODULE_AUTHOR.
> 
> Mukesh Ojha (1):
>   arm64: dts: qcom: kodiak: Add EL2 overlay
> 
> Sumit Garg (14):
>   firmware: qcom: Add a generic PAS service
>   firmware: qcom_scm: Migrate to generic PAS service
>   firmware: qcom: Add a PAS TEE service
>   remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs
>   remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs
>   soc: qcom: mdtloader: Switch to generic PAS TZ APIs
>   remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
>   remoteproc: qcom: Select QCOM_PAS generic service
>   drm/msm: Switch to generic PAS TZ APIs
>   media: qcom: Switch to generic PAS TZ APIs
>   net: ipa: Switch to generic PAS TZ APIs
>   wifi: ath12k: Switch to generic PAS TZ APIs
>   firmware: qcom_scm: Remove SCM PAS wrappers
>   MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
> 
>  MAINTAINERS                                   |   9 +
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso      |  35 ++
>  drivers/firmware/qcom/Kconfig                 |  19 +
>  drivers/firmware/qcom/Makefile                |   2 +
>  drivers/firmware/qcom/qcom_pas.c              | 288 +++++++++++
>  drivers/firmware/qcom/qcom_pas.h              |  50 ++
>  drivers/firmware/qcom/qcom_pas_tee.c          | 479 ++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c              | 302 ++++-------
>  drivers/gpu/drm/msm/Kconfig                   |   1 +
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   4 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  11 +-
>  drivers/media/platform/qcom/iris/Kconfig      |  25 +-
>  .../media/platform/qcom/iris/iris_firmware.c  |   9 +-
>  drivers/media/platform/qcom/venus/Kconfig     |   1 +
>  drivers/media/platform/qcom/venus/firmware.c  |  11 +-
>  drivers/net/ipa/Kconfig                       |   2 +-
>  drivers/net/ipa/ipa_main.c                    |  13 +-
>  drivers/net/wireless/ath/ath12k/Kconfig       |   2 +-
>  drivers/net/wireless/ath/ath12k/ahb.c         |   8 +-
>  drivers/remoteproc/Kconfig                    |   1 +
>  drivers/remoteproc/qcom_q6v5_mss.c            |   5 +-
>  drivers/remoteproc/qcom_q6v5_pas.c            |  51 +-
>  drivers/remoteproc/qcom_wcnss.c               |  12 +-
>  drivers/soc/qcom/mdt_loader.c                 |  12 +-
>  include/linux/firmware/qcom/qcom_pas.h        |  43 ++
>  include/linux/firmware/qcom/qcom_scm.h        |  29 --
>  include/linux/soc/qcom/mdt_loader.h           |   6 +-
>  28 files changed, 1115 insertions(+), 317 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
> 
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

