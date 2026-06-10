Return-Path: <linux-media+bounces-64441-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5rXJMdNnKWpNWQMAu9opvQ
	(envelope-from <linux-media+bounces-64441-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:34:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDBF669C7A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:34:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BgDWq7BF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=USPM57Pl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64441-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64441-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5BD031143DD
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113FB3F824A;
	Wed, 10 Jun 2026 13:26:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713694071CA
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 13:26:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098014; cv=none; b=FaCQwb8ppbcFsWq7VibnEhrvVOdj+9IebzNu+JLwgIbZf6Kn5w6VmykuVFYk97Dkli1stdgJaLRb1bqCv6q5I4YLXApHae2Vqu4DAzgOUIfTjK2G4wNFgrDxMuiGxu+jqtn0I5P4v6Dr00eX/cwDXDLNnu+n5apnAJhiWGep2tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098014; c=relaxed/simple;
	bh=m+xt0OKMYFPGrtA47zn/bJ/T1qaTtH9D6LA2llCivto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSchfKVuIuBEY9Tjjj8etH1ffZzAZpAXPnqAUN7iueyGaxwPEc7CDiapooO3oGsl4yrT7bvP4Ks2L5v1bybiGYY9Ki6YCmN3eNS2DMww9HCBfCLinSHAxQdGYxLcJ1zc4QZNn/Ixx8ukoCGsDojWqBDZ7nhC8KHs3El9oBR+lNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgDWq7BF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USPM57Pl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBd2k3763375
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 13:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cPyo9aCMcqtXkO/xZlkG2ODm
	crf0CwEfPgyHB6erVLw=; b=BgDWq7BFEs61H3EmbBL49tTQEvoLxKwLqx6iz9e/
	R19ukDcAFzK9ExVmDINW5GSoTXXFIfWzxVuX4WXDeW7Qx54adPgfEXKMp4Azf3uy
	Xofd1J/BwOnFuJxR1HK4fWCNDTFvGmT3GVy3X0fpofj3vHft2/xknsk6ClVTshCr
	TAYkOD6jBkTZEyaJpRs7XKxfBKlwa3Go+mPc0o9GpgTPGSS1pS03/E9Ybw0Hs/AV
	YtpzOsqQIx1YjQaw25eC8+8Mt6mYVLpdxNLC0uOITOaEDJZZRar3lNIlwvGnKdQQ
	9Nz4ePhUNhSxyG4NhKFDbBlwox29dZ+4omgBSoat3idBKQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnetmvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 13:26:52 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963e6319d22so2104354241.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098012; x=1781702812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cPyo9aCMcqtXkO/xZlkG2ODmcrf0CwEfPgyHB6erVLw=;
        b=USPM57Pl1I9J27vHOQRszQhFC6WozfamqU9M3KKeYLiexQkdtmjDul/s4w2vvX3Ik2
         oweLWN/TRJ07ReIPLhenJHT8+y9eVmctLw4EpJ8RldgQ9da+Tsb0ZfLORJwPRFNgOdB5
         s1RnWE7GePOeDj4EpRM7ArL1aXuGXEUC+BL2lluO8Z+n58Edfjfrwp9++ZvtoTzYJxQK
         Bn1WETdKsIfFzCTuFTaRwKOqkEZzy6sWQzzsFEj/hIVurRsurpLG3D38rOchWFFNO6sx
         R/Yn7yNBHSQZEq58RgKr68V/Bh8WIPi1S7yB9arfn3I8Kh5MnKYPAoNFJlSkrZMCFCH+
         xquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098012; x=1781702812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPyo9aCMcqtXkO/xZlkG2ODmcrf0CwEfPgyHB6erVLw=;
        b=kyaOOSgKKkLNgxP1tXZuf4Q4XOEOilGqaNDgWGGklu13j4WbycOl/ELAQfoeK/3zKD
         C28/VQbfkRGtvg7vN3x73z5lk6j7MUnlb5s8L3p4N8O9NjbuFZwR+BiDky0g6yAQGezZ
         vg3oMCPd/mugW0gicvztDEMuJFKX+pOWVirNg4Rf/X3PRMYUmUTsD/RiZUTPl2oqgqHs
         1UWZ+JVxblD3OK0IHlnY1VqDAhaZQlGzgLaoHY2KHOavhzWzvQ7/DenvzwzCslQAai66
         c8aHATwn5XCKxk5m9vZhVUHuyKsEwrnBJsXZXYEdjiUVuKiJODZ4RDj8viNlzChvPVas
         szEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jBKUkdBQ6dmGa5f1ajd86kUEDT4NQoaUZ2kTGFI0Fp0V2cgL1M4y94Eov+TPyB4agXlhhPuMF5obQrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfPqfWEN7XnSczY0z4jLNjCmnVx/FQErHfPVHqmMuOPkl/Szsg
	RJyfHsTG5yvbW4Arl/aI771UdqDqJ4975MAtmDOCPcryKEeJs1CO7vkqQi3WiKYDYxYdWn0pY4I
	VL2ghONws5pluSh5CZBvaCZ6tVbjGQ4/JpEd1D5bAhcVl/XwKog6j8vs5ZkSgbtCvJw==
X-Gm-Gg: Acq92OHmHdky+oKmLyH1gI6DuMKWJD7uLAx+La4zgYSJaCeln9wCthLOwT7q5QwiQWj
	FY1kxRBCv7GFEcSACxLnUWnihW72sO0QIDvl3WdnDr3FcF9T4hrGYAUxMmerlEWNSecQgS2hweN
	bKzEpPViGFraAE+WyEpTXLyK9+L9oI2qOW/d2wSMrHfrRyIn6+mWvn8zWkMNXPEZznWhy0CqcEQ
	UbNlsP+y90VYrHppzwYd66iJT0LhJqPczAshwmyiuQ0U6tB7DF2JKYVe2sSfsgpbsf3J6aW+FSL
	zomJ+fzsdnQaaNPTvWr2RLn9q/MCQd34LDsLVKRAD3FcOqgAeT6H1IgZeNS+EaavZ+05YfNIkKy
	pRdrJY34HDipbWiObQyqBbENwU6Hk0iWFoTI+cdq8Md71CD8pyFfxDJy/+z5Js+KRMUvOGjhKLb
	Dmb34M46kV6as4Xwx2go3DU8Fn9xsxrDpl3QjREJkuJSrExA==
X-Received: by 2002:a05:6102:510a:b0:612:c135:1b77 with SMTP id ada2fe7eead31-6feff62a683mr13342347137.27.1781098011508;
        Wed, 10 Jun 2026 06:26:51 -0700 (PDT)
X-Received: by 2002:a05:6102:510a:b0:612:c135:1b77 with SMTP id ada2fe7eead31-6feff62a683mr13342318137.27.1781098011112;
        Wed, 10 Jun 2026 06:26:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990486sm5332813e87.68.2026.06.10.06.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:26:50 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:26:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, hverkuil@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] media: venus: fix payload size calculation in
 parse_raw_formats()
Message-ID: <n46tdwyiol3c2br3epxh3lffxmxey67qt2xbrbwwwtlolvcdk2@4r5mj4hmy66e>
References: <20260610125655.10517-1-med08elkadiri@gmail.com>
 <20260610125655.10517-3-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610125655.10517-3-med08elkadiri@gmail.com>
X-Proofpoint-GUID: 8hmrstxdR2bq2Hf3rfQ3rlskSItma6na
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a29661c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=uTaGIaT9vMJbWL2ccsAA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 8hmrstxdR2bq2Hf3rfQ3rlskSItma6na
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOCBTYWx0ZWRfX89WmweslEbli
 7/rRXzz7kEerfI0BwMOD/z3O/arHBsfWSHZle0QR8RimvItrWHFa0fDDrDyAl178yk4BJQNzmIb
 4R93grBOZnA+pIZcnePNtojg3orouXoiIT3uc2wLO3Y9Wb+3CdW4DfdRjC5TKPjbu0+gtUWyJBE
 QH6JqUaQ1PohyBi+Iq9gmkxL0EXnBOcsp5OcyAOiaPWL854TjAzoSkTJOLdRRBd8ClrgQO3pafo
 /f26TMo/a3rth1wi9tJLDsY0peZpvY98I3IPXcFvOutVkvPu5+PLZ1mpzzgv/fkF0ydmuUTrFLA
 Z5ws4FM6YiIWOypITsUFYAcNQMwAQppB8faRNqhSeYliqRypIxjIoxbLzX+EmY0EzIAjEntRNBU
 aRUnDJDIM5h832evPqwyb7IBRSGtxqknin4b4lCioWi+BQrH978YHos7MQJ6nC28g13ejvOwd6g
 hKO8sgQ8ENFJ4eCazbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64441-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,4r5mj4hmy66e:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:med08elkadiri@gmail.com,m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EDBF669C7A

On Wed, Jun 10, 2026 at 01:56:55PM +0100, Mohammed EL Kadiri wrote:
> The consumed size is computed after the loop using the num_planes value
> from the last iteration for all entries. When entries have different
> plane counts, this produces an incorrect total.
> 
> Accumulate the actual size during the loop instead.
> 
> Fixes: 9edaaa8e3e15 ("media: venus: hfi_parser: refactor hfi packet parsing logic")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_parser.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

