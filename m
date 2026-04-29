Return-Path: <linux-media+bounces-59972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIo0CNMM8mkynQEAu9opvQ
	(envelope-from <linux-media+bounces-59972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 15:51:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB7F49521E
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 15:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08C183068491
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 13:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFD7401491;
	Wed, 29 Apr 2026 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpSNPWuN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqP331y8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3A33FE656
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470153; cv=none; b=mkE80eb9TMeNGD0mYm4+5ztUWCkAgMsY8q+L+iePYDG8EeRaJsrmgQBnFfYflur/Pw5eXisyGNSfokNsV+JFhBMnpVtKTtBmLb3bU9OD0wtyBa0cIYOgxAUWZdPrJ8HmAPKtFs0G3LT6xjkmfQ4l1uvy9eKdBd9KPDmsn54unkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470153; c=relaxed/simple;
	bh=DJ67pB+inv26z87nbeufl52/CsZL8UMBwYrlr7yDzHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHxUgq1wIGMnlU9luNJqe4lflcm+lbGsCoFZNIxxqV4FTOmc/rF9aFYxCrjclvmMMpvtqCCOx3YRyJpliW2H6WfhA7o3O1Sp47XstvKEJ1gNFBG7l6+flAOMWWrbjhuUOFvnCudHQIxg6RYg4admFaf7gUbXtzo4dMbNu9SMS3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpSNPWuN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqP331y8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qWrI2889818
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 13:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ey1EcgzCeETB45FN3v8thWWy
	TAMm9RZnJD/dBNt9Ayk=; b=EpSNPWuNBtzVb7wps9/JYMuZXXliIyiIhRH4k3b3
	fNbr63jYxbM6FPtTcoxEhgqF/7A2aELesDquLAiZclTStoHzt6/jtLrKDqLTVyPz
	ihccrqEd9vpCcMJtPsTyOpb2FETVfGm2/yGO4BRdO2sdLwNltiT3l4mP/kM6rvhT
	PIt29gg+3GzVWDQF36bVgTd++vrhGNLtntM5AhNu8FFafIpGsn5FSwJfJG/5vB44
	EUUAK/0foOIhhioQVurmZe/YnNVyNBigsyPRuwXPSjSLfg3Gek8QAN5Cqkg4/+Xz
	4/TFxTuhm5AJG54FtMBE8YwplkQ6ASXW7APdLpczuO4FYA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqc4gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 13:42:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c44bf176so14860905a91.0
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777470145; x=1778074945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ey1EcgzCeETB45FN3v8thWWyTAMm9RZnJD/dBNt9Ayk=;
        b=SqP331y8kNmV4eVdF/Jb48bFzvJjak+ZES5xN7b9OlDOrImK8I1kfMdJpctTwXq8Cg
         BEQTUOcdYGzqh/pPeuSnVEqFdYvgYm7uqa77xv/IOh/59hEGKQoQ63iQwev/c3OqrNH2
         GBo/y9Qac9nA8sEBkVTMxY9R7Rng7uePKdSHd3ENM0iY7LM4l00jjFZTMZOAiutl3Vdv
         SnPP6Hd6lS+8KbDMpXGcH3rMrN3N1vB9aqT8RiNpg3RGn0yqteTA40Qgut7aravSe/H1
         DtGR2SC0b99qSt8Q4M++l+IKHeYLlvY04rfJYVWQ6FjiTdoj3svQ8ObKd6Gxf6hkrrVs
         JYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470145; x=1778074945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ey1EcgzCeETB45FN3v8thWWyTAMm9RZnJD/dBNt9Ayk=;
        b=Et9Ft3brUPFBLFIxZWWHsudmo3nh1oXnjWXuN+QSxXbZuKBUW5sceBqjpoqfF3kQ/S
         UDAtPL1DLJ8ib1HtcT/L0Yz2zjXWrGslXeNgzGn8PCEby6TcDARKn8RwlqjScuYL0RrP
         yxgRS9zLq/B9BxdBOsChXEzN19yK2+901cbyetquTKWoMga9hnOJDSKFcnbBWUIxJCff
         SuHyWtnWgRhYvf3oYJKMTrmMqAELZqWLg/7UQ0NYNulaZkCUSAnoEoy/B97kA//hYVCN
         gDU/7WSc26TdJEYNsXwvKN2DPYwgML2QZCxmYXy7vlDjQ9KQ/gJfV5eiy1wmjk1NQ4XB
         0Zng==
X-Forwarded-Encrypted: i=1; AFNElJ/cqqiDNvICJxjCjUsaMJxSA1+dImEtQ9g4580QntvJvWUCYBr1Z+jHz4qddCQkdn2kO6fKtKYbDBqhKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfrWAldIWg8Pp3ya/yfgkrK6xckL//RdbYyghZiEiuBwmjiYX9
	ZDnxP+StieWFF5jPou1JRCniHYaILPur0fnG2p9p0OQ64ftBeiiXoEDg1PdEPTcyIKT5OXJ4a/7
	fCHcYbUE1T5yVOkT1+7yxmA27PpjftWoeGw8Z+M2CAOv7pOt5ON1Q2oxdVVIW8RbGmQ==
X-Gm-Gg: AeBDiev/hnJsr2j8k9AZhjxhhVG58rDmHY6z1L8DT1Nkrbv2TS/23x0CKnwkn5pHV5G
	79POhOfpZgJpjIjPfUx6J3HvAotWAmBsBeSZbOATOOGxqlolpoiTm2KbuFYjo5hUjAmvbWZ5lCa
	x291IzQ+Bm0JKnz2g3/Pl1j0ZlK4i/j5fsmjnb+DWRyG1djOlqbjiXMxEmA2z/PJ3IxxSlrA47h
	4e/4U2Ouc5XtOHs3LzRdYgsYLElo/VXcpznwEdl1fAMzSmgdd2vIoZiD+0EruuXSRk2GbX8avz2
	/LxqqxfbS0tdgXRmwEZ3OZivRc+88/RRXzEQW5Khnm4X4lLD/+s2qaJ1Q1MOBp8qX+2dfZ/Lty4
	+m0kN/iH/t2ApqBCkd6UitXGSVW74RTPHK+w0XXBzepPYEGNsbuFvnDf5Q3w=
X-Received: by 2002:a17:90b:2ccb:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-3649204fb32mr7693634a91.21.1777470144728;
        Wed, 29 Apr 2026 06:42:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccb:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-3649204fb32mr7693557a91.21.1777470144037;
        Wed, 29 Apr 2026 06:42:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a27f32b1sm1370451a91.5.2026.04.29.06.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:42:23 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:12:08 +0530
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
Subject: Re: [PATCH v4 07/15] soc: qcom: mdtloader: Switch to generic PAS TZ
 APIs
Message-ID: <20260429134208.pqo67sh3jkvsa5ka@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-8-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-8-sumit.garg@kernel.org>
X-Proofpoint-GUID: cSQTgLKkTFDU-q0G7q95Y7Nqknys98A-
X-Proofpoint-ORIG-GUID: cSQTgLKkTFDU-q0G7q95Y7Nqknys98A-
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f20ac1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xqloa5d6wBXDvm8eUWQA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzOSBTYWx0ZWRfX04YxePXBZ3gD
 IJEjqdg6TC4EZN9fp8mJeoQRDeDihNBVAS5agOpbo4nAkk3X3p5cIHUJHoMrms5AbveJfFymqw7
 uLP69gjQLbAz4a8m9D3d5Wh2WhHMNRQSlgYMJg8Otm7MDDGbRTZWgUZH4nPOiEwRGHlp5fsdBNn
 DSkpfeYm4oOGI5U5SpZDpo9uBq9AjqxIC1D0fJxAOSuBwK/SkVyzC7D+DtL/xJuWMyYzRBdeoHE
 LdO04YzTHeGSXXKVBUfHRxZYQjRRFlXwoJbOh0WRs8RsxiEnx7jfsgvKl2WKVTSMMAA4TYoy2ch
 8r/PERM83b0kG/GzxI+s2raq0oADKg6+G9G3PGkokMjD3UIObKXXhooTIwz+5zStRK/quZM9uCd
 2QCnveRLxR56AMJnTgYUEEXELa1pwV04aXJY/MYL1FsVaGF3BOGhZqOver+qoDML9uDAuFpOcbd
 50UzMVy2q5xzyTRED6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290139
X-Rspamd-Queue-Id: BAB7F49521E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59972-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 27, 2026 at 03:25:55PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch mdtloader client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c       | 12 ++++++------
>  include/linux/soc/qcom/mdt_loader.h |  6 +++---
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index c004d444d698..fdde7eda538a 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -13,7 +13,7 @@
>  #include <linux/firmware.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -229,7 +229,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
>  
>  static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>  			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -			       struct qcom_scm_pas_context *ctx)
> +			       struct qcom_pas_context *ctx)
>  {
>  	const struct elf32_phdr *phdrs;
>  	const struct elf32_phdr *phdr;
> @@ -271,7 +271,7 @@ static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>  		goto out;
>  	}
>  
> -	ret = qcom_scm_pas_init_image(pas_id, metadata, metadata_len, ctx);
> +	ret = qcom_pas_init_image(pas_id, metadata, metadata_len, ctx);
>  	kfree(metadata);
>  	if (ret) {
>  		/* Invalid firmware metadata */
> @@ -280,7 +280,7 @@ static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>  	}
>  
>  	if (relocate) {
> -		ret = qcom_scm_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
> +		ret = qcom_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
>  		if (ret) {
>  			/* Unable to set up relocation */
>  			dev_err(dev, "error %d setting up firmware %s\n", ret, fw_name);
> @@ -472,7 +472,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
>   * firmware segments (e.g., .bXX files). Authentication of the segments done
>   * by a separate call.
>   *
> - * The PAS context must be initialized using qcom_scm_pas_context_init()
> + * The PAS context must be initialized using qcom_pas_context_init()

Should devm_qcom_pas_context_alloc() now 

>   * prior to invoking this function.
>   *
>   * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
> @@ -483,7 +483,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
> +int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
>  		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
>  {
>  	int ret;
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index 82372e0db0a1..142409555425 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -10,7 +10,7 @@
>  
>  struct device;
>  struct firmware;
> -struct qcom_scm_pas_context;
> +struct qcom_pas_context;
>  
>  #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
>  
> @@ -20,7 +20,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  		  phys_addr_t mem_phys, size_t mem_size,
>  		  phys_addr_t *reloc_base);
>  
> -int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
> +int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
>  		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
>  
>  int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
> @@ -45,7 +45,7 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  	return -ENODEV;
>  }
>  
> -static inline int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx,
> +static inline int qcom_mdt_pas_load(struct qcom_pas_context *ctx,
>  				    const struct firmware *fw, const char *firmware,
>  				    void *mem_region, phys_addr_t *reloc_base)
>  {
> -- 
> 2.51.0
> 

With above nit

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

