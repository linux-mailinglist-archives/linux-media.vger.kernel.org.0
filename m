Return-Path: <linux-media+bounces-64440-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZjygG7RnKWpKWQMAu9opvQ
	(envelope-from <linux-media+bounces-64440-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:33:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D41B4669C6E
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:33:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k0zc5CRj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Rc7dodUg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64440-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64440-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1779D30FF8B1
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81C5409117;
	Wed, 10 Jun 2026 13:26:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486673F1672
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 13:26:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098002; cv=none; b=fZfpH3/CmQabqSugRJU3z0SS8RHroIQu/drWz4DtUI7xE1JTdQfERAkNa3lbpyyXzHsDAol6+/rIDYN82EygjokCYVEGTXDbi5p6iZ/aPzYMJQvolTRrA6HBvufy9AjjGNC0ywtSn2h5Nrg866ms5YXrukm4eh0Si6YNBsnUn7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098002; c=relaxed/simple;
	bh=2M2q41OtBWgY2Am2LjNyc0iL7gSnB5ihdyNkg4plOWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6/aDhxoMeNgwvi7UUTvQGYCxKfEcvMtyv30gFDicQpm4CQM7sHJH35E7hOp+/Q+SEhpycdtFjS1qtspkCIWXcUptRjPxdCkgi0wJ5ed466kZ1t/X/GT9GTWzOi9JMDfhdhO1bFaHeC5bjXYjiM6D/XJiGl0mj3nq7nhuZEYwBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0zc5CRj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rc7dodUg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACClgs1555324
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 13:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hamOhHe/t8QAdeAMj8Ua1YUB
	t/FdWZO2oEFl5p9GAOg=; b=k0zc5CRjCHshLDdhSryPwwLfcD19Yzzyd+QBUuKf
	tqgP1eyB/+mn2t/NOXK8YVnAF3NgMxbtkne15sgIZ9IaZouo7m2TW2gvt8WPUOMX
	F91AwMp6QuVajkxRaiSHlUoc/D14b2/a9v+/SfCSrg1fHDaJlU7wvsQgKA3apnFz
	Y8y5e3Tl5v9P27bNdTTAiY2PBusZ9JeSdyaV/qybYGVtFfhhpJxd+lK1Kza+IL71
	gOO9fuhWSoPXA0m7WuSXaRpzVQGL38PHgJAO/O0U3j3dnphdOOAApULPCAt6twOl
	UbAWdX0TlB1n0Frj0Pyq8TVqO2zUTyrWuHDGapLgumsrzA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnntnt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 13:26:40 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6e907a982f5so9784985137.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781097999; x=1781702799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hamOhHe/t8QAdeAMj8Ua1YUBt/FdWZO2oEFl5p9GAOg=;
        b=Rc7dodUgyZUPeLRusxK6kxSdPX9Axa+LvO+nW0mWAT4lIpIkznZBfyPNr+mFKdob6l
         6Wux2hLZQBrjlSpcnH0ZU6lEOPScWo6DWTJ4PvJyVnyroIIUAHPrJzbr05iGY5Ceeak3
         mbvIvYu1+0WCcXtcSJ0PZmmhHRWym0hzVzgtjlqZJyYKY7WCre+4el/9QBRQxs2ffyLs
         NwAOIUWZFC+6G2sYte5D59jWqok2zOeszaDWb3GvhOj5Vpr2aZLnotDTnz1eYX5GmemD
         W6iZ72kF2y9s1/cXieWcUGYtkN+WBN1DSeI5WoXJBPvknnT5GFRRRvipzpmBbLOKddFR
         wIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097999; x=1781702799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hamOhHe/t8QAdeAMj8Ua1YUBt/FdWZO2oEFl5p9GAOg=;
        b=iCKLXiz4+m7CJ1NBl/lRU152Vzk6JB+/E+GtvgUAtbYUywZNNkqjnYEGzsdaUoRtep
         ZS/rNkjYIy5/HF+y2zfbQRZJBTHfuU2M9BmV1gPPB5VElNHzSF/ZTsvlF9Y76yikR9vo
         fGfuR3A08aamT14aI4YTbqYobcsHVpt6MAtEdwJaHAm+wOv5ytCKanAZgS5mtYXbkr3J
         A2EaYjk3aKshAYBdYrWagGU7R9BGcCFwAEUDo1OSz9J3Fo46GLjnDVrqmgV3v5lKsJe1
         2O7GMt6OwBTkKdLhUdYn7ObeM42Ge0k/W9WRcnwoykU4vOtyFbpCxgvsRz6qntbdkRUh
         WD+g==
X-Forwarded-Encrypted: i=1; AFNElJ/KkrwmC+gebsmlDQS6Tmg+wmnVHy1bUsFZ7NXS5fuxnz3KuF7w6dHf3XNZTBcs1d+93dVcrDKFOowfvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtY3A+rWmjVlx7/VlIbzSzeJ3yRImDr5uOYRJd5x8va2XHZvU7
	HiYi0PO/MmUNSDnhGPqbV1UUF94D2jdGqXgcm+meugZZR2Ti5AfciRcoSghrIxK6Qzw7oZX0laR
	97LYulUsxsnhcoATgWkiRl8EdO/2SNXKGvgEfPKde5crbnN9wTdCfMR16xhmztbwtxJKuIakgAw
	==
X-Gm-Gg: Acq92OExH6NgsTJ/HzdSMgextJ17MHdj7Tkv+HFQZ5tLNTY0jFy/GI+XB2BebcRwyj7
	MLgWzd9nRoTRAT2X+BqFwyJWermWZhxXJvX4O46G3yeUISCJUwzXLS59cqSXgIlgYzVZX56I+qb
	LXFGxwZumny/HjqamOQT57XWSBZwuYv0jpHMNcJvRZ8Hwg55Oc1cleXXyOCXj8OwtOMvxsDIB+n
	RX3atDjF0VsXhp9UUUS+f2Vz0Skg8uNGkOZ7mEWW2etjMKdgz6HtKVjk1ZW/h01ZrfxlcQ8r5gO
	F9SLOCXWnAdUjsrQVeZj0Nnq25u0aSp6qXWup3Ri0NQlzxOyApaWRJmKy918wycHDRwRAUYKhY1
	hbTBwlr9jKNHzHeyTAyrMnEYJ4niHEugGnPzyeBMqyb3Fb9bDwWE04D4zqDcAVMqUt9HZsmkvEA
	duB5D3MOpBAGyzXszqSFXXAvVtHZso0hduwOoTyiqM8tf7Zw==
X-Received: by 2002:a05:6102:529:b0:6cf:2b61:3fa9 with SMTP id ada2fe7eead31-700359f5a86mr6477771137.10.1781097999509;
        Wed, 10 Jun 2026 06:26:39 -0700 (PDT)
X-Received: by 2002:a05:6102:529:b0:6cf:2b61:3fa9 with SMTP id ada2fe7eead31-700359f5a86mr6477740137.10.1781097998994;
        Wed, 10 Jun 2026 06:26:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97afbasm5570958e87.50.2026.06.10.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:26:36 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:26:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, hverkuil@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] media: venus: fix payload size returned by
 parse_caps() and parse_alloc_mode()
Message-ID: <td2t7blr46ltikytckufcqpdwg73ycgepqjc2pvekycp7o765i@b7yyvw2fn424>
References: <20260610125655.10517-1-med08elkadiri@gmail.com>
 <20260610125655.10517-2-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610125655.10517-2-med08elkadiri@gmail.com>
X-Proofpoint-GUID: Uw4zMw-_5QXPV6jWumspuJhZfOO4adN7
X-Proofpoint-ORIG-GUID: Uw4zMw-_5QXPV6jWumspuJhZfOO4adN7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOCBTYWx0ZWRfX1wB4MArZBDF/
 XbeR4EkrSfS3mU6U6OhLJicv+D8nVR5r6hvFE5mmOfUKKfMKC57HycFnj9iAR0vR3Y/fHuKOqME
 P0nXFUywTlITWir+TPdPiIFXmenenno8xYyk/Y4AVThin/yBfiUpTX6bQYpjl3W29MKZN/feXEc
 6gd0QpO6YIByVEk+X3IVxwLw0IdQER3ZEsVkX6p/SL88Tuk028oIxlnYN5a4MUyLzZ54kXZmTVP
 d2cGGCOyQejqo8c+/a+XdYTrq1du+U1qYQaVHVUhvnoidlk6mNNuI70qHLJs8E+ERkaWQvGMRNJ
 teHNjezFxJxx88xyYLkaQyIuAZwnbaYgxQPtyelvHgagIkZLV2GxcY3LPMFe9ImmqVJYkgzPkj5
 G1QOY1x5WVT9xfNpvqdG6kTbPAucJA/JfxgR3xKdhKivXRt5WJTaTPBSmgCzSX7owaAKLXUJ74h
 Em7HjeD25Ib2R90nIxQ==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a296610 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=yqHQtdB_UFgTmeLkYVgA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100128
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
	TAGGED_FROM(0.00)[bounces-64440-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[b7yyvw2fn424:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: D41B4669C6E

On Wed, Jun 10, 2026 at 01:56:54PM +0100, Mohammed EL Kadiri wrote:
> parse_caps() and parse_alloc_mode() return only the size of their fixed
> header fields, excluding the flexible array payload. hfi_parser() uses
> this return value to advance through the firmware response buffer, so
> underreporting causes parser desynchronization.
> 
> Return the full consumed size (header + entries), matching the correct
> pattern used by parse_profile_level().
> 
> Fixes: 9edaaa8e3e15 ("media: venus: hfi_parser: refactor hfi packet parsing logic")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_parser.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

