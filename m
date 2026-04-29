Return-Path: <linux-media+bounces-59973-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFAUESkM8mkynQEAu9opvQ
	(envelope-from <linux-media+bounces-59973-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 15:48:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A6F4951B2
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 15:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8AAE6300B9CE
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 13:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC0A40242B;
	Wed, 29 Apr 2026 13:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGzhSXE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVb/tOpN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1153FFAB2
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470234; cv=none; b=c0BoNPn4h8+ji6/rmJCK7wFhGFBhLwBtqBqH0Ddk2bPbqLjz4eWMOMKZSB4citi0EaQTl5UiVDXxsG8KhssuH4k30wQ5Q0X9bGi+xsVjTE/421bZNCOTRkHMXrp6UAD0qRM/ToLhpWwliBfs4iMDM2c3jqysJEhWeOcz79NYAeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470234; c=relaxed/simple;
	bh=+f2W0byu+VgJjsIBhy66bJHyN85fytLh2R/43wSGVUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCdSIMzVbWwN1A7UVoKhGmJ5KzeK+VVr2zGuRxsXSyMwMYd8+/uWeE+nwBBXw4JKnncGh4M0CcKaZrtlvEZZbyTSmyqJpOcTQs3tEWTdVC9A3JI7nP4duNjT9QLAdCenBnQioSC6Bj788Y2JSEwnsIWtXo4FBAgLuwpjLCGg880=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGzhSXE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVb/tOpN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8ppnf901799
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 13:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cuo4xCs+Nso8hPGN5nUCptMR
	sALAnh0wyrAaKAyxQ3Y=; b=UGzhSXE9TYwEoCe3o5G9PQphC8ttYY26Fo2LF0O5
	+66oGW0pUoGEOA6LZOG3uPuBclDYD3+Goy39d6kRD8bPKycGbACg/ZIsruC4EbW7
	LkOmnmtGJo20nIPdCJW4B137JylhFtiJ/Kyixc/X+z0gTrF203Ly7o/Nhhc2sVaL
	EzfLVO+pO3UCZHmCuycIN/CtAZAcz4LcuVeiUAAtCnh4fFLawDXoIZZeYi5yZT+I
	czUD3cguivawcB2g2tnYE+vVGgBRGuLh3FUE3+ZHjwETRXOnAUVcvaEkE5tgl732
	JJnQl5xEZ4x28C0O6SbW+PhJ6Vd/871B7ZfqnV6zwChS/A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9hwnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 13:43:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76cb2dce57so7805051a12.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777470224; x=1778075024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cuo4xCs+Nso8hPGN5nUCptMRsALAnh0wyrAaKAyxQ3Y=;
        b=NVb/tOpNXU72lP2/LU2E3lRZz8dOU3X7j8RAMrfdPGdObQyos54FwR4U6qu0sSi6/T
         KGzjgyTUMJu+nlWT+lHuAr9S2h48+aE1uNgME7/po9TCkCc7RK866PkiTynmBCrh8suv
         3AyyvatxbAIvH+aihcFTjWRLZnm9Kg2gbRiM8nDEpKnq43ZDc1s6Xh2vgi25/jlMqL+0
         50TepSN28knWQ4f8MCqfAUj8CKRvYksEhdskt86U0D4r/PJaRBkLxIulCxCcpuZe3aWs
         BANBzVDa0MdX+f9bs4cs8mkCKk5VgDT58SOfshZM+f0mwRjBduqUwSigs3Ar5pSEnJ0E
         RZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470224; x=1778075024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cuo4xCs+Nso8hPGN5nUCptMRsALAnh0wyrAaKAyxQ3Y=;
        b=OvrHsMnRF+nqT1VUTIoZnvOoOQN2c89LI37wAHff8zQGjXFbjMiGc2DlMMyrdH2pzR
         jDqplwX5C2o2INV+RwwE/1t/xjvRVXj+sW3Yh0IYXJ5QqbxRs2DaKajbVlrLoMqQmisP
         YBlUDXO0pu++uE2hp1sd9TyoJ1Ce+3ES4Kcark8eCOHI8K1nBK2HEx1rgQWXJzY0B/Cg
         8ixoCASxeKtRWE7/HedVDh4Qdf562Zsjc9kVpAA0Wg/KfGARx1RTH/A2dg9OW+rrj2Tz
         qONz1/qnkR2aj9OylTkSLtsuZUi3M7dO2js8oJ/6ZZQO6LZGXP9RZJETHQf2aMhrCGd4
         XKKg==
X-Forwarded-Encrypted: i=1; AFNElJ/GAZ+An63842m96geUkMN8O4fY29yOS2z6ns1NzSAxRGCN2UVHsucBnDyBcy+PpBYXlCxz6B9J+4pSdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx83CBDT9zQU0YzxfYcikn6VGw7YGl+VW8bOorEmpuuIPI9yoHj
	yV8BFgCNUUjKvDflJhPKNCtndGV0I+zY/eylkS5Ajn88ZqfZfvPtcGVi3xF1RICdvJeeN29AdlE
	CAk0i6JbvUdGNt3LS4yOGLedI3ivIyABOiJ5EXZ4/W4E2gnWZdoxHx5nEoBmsrRUMog==
X-Gm-Gg: AeBDiesfXYxcchaSsQorPwguI02YvepSNOVTIqtgubftJdlZ5Sr5i4IKgQjIWJW1tTq
	CtQlvu5sSMeeqQQOXsZPWKA7GHts0QXqtsY/hB71fwZ5LsTnk96aw7cHy+X/F8wTGuEww2kT0bk
	7f4IIQzYlYhYyfpVaSRpWZeZzIpC0Of8+WsuR0kLpByLFqEJlncS658+d3Kw/AWeXs/s7RJDRc9
	kF846WtKFoJ6t9STyY0wRKrxh0e1jKp4oa9XbftIguzu+b69EUzC5eTmfpKQogQJuHbUdUzJEhq
	OZ7h7Oq6l0zZSIjyGDcpVtJympPFMNaLpfMEm3xUN6/amXs19NDLDEFc/9AXlOGSb3+mJdFvGQk
	d5Z79dPhXiYwgWyyMUMPKbwo4He7JPyYeUI+zRU4XCDfbbI9eSo0NQlzONuc=
X-Received: by 2002:a17:90b:268f:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-3649202ea13mr7870192a91.17.1777470224427;
        Wed, 29 Apr 2026 06:43:44 -0700 (PDT)
X-Received: by 2002:a17:90b:268f:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-3649202ea13mr7870101a91.17.1777470223790;
        Wed, 29 Apr 2026 06:43:43 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0115143sm3071343a91.3.2026.04.29.06.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:43:43 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:13:27 +0530
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
Subject: Re: [PATCH v4 08/15] remoteproc: qcom_wcnss: Switch to generic PAS
 TZ APIs
Message-ID: <20260429134327.mna45febpcpakfbl@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-9-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-9-sumit.garg@kernel.org>
X-Proofpoint-GUID: 42aLXFgOQpuddBKz1MUAomoQHizRo39A
X-Proofpoint-ORIG-GUID: 42aLXFgOQpuddBKz1MUAomoQHizRo39A
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f20b11 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FjfCcBgXQK_UEADaTeYA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzOSBTYWx0ZWRfX17Mjj8mggY7k
 7k0OW0zmnfNTudeA9vFWx8LLMZUdHhpOVYKMB+SlpmvuXnrPykYLX26AOaumL+2Iix9jLCrJkqe
 K+JGcLw4GsyDVzw5Dqwx/hfNEEYLYUXZjLRzqhhusAno1JUVSdB8n7fJ2VMEba9ICXLbO55wHil
 QmEmEKh/pGTz60DfWE6DF8a5wY5oXZDUR+zp7wY7TdQrXNCqrrDKWGxnCHmt0AJnU3pHca7WZE6
 FyRrLvH78sSjraXzEqDT+Oehh1q9yEQkop2zi8xHpLO0DN9baDJsLfz9mrLfxPAixO3csN2awlJ
 RahTUMg5VhRVEm8oub0A8kmWwHdsJ3wYFo0qX32MlQbxawV6ETafJbXrHfODwfFZldD5ar8Dnds
 oUt0U0J23JibPSqORJ395rLn8bnBJ4fpXOXibEOT0kVsmNBKMFca++sSAqJG0Yy3bVD9iJNdk/9
 QcF4EgaORhlgR4doUug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290139
X-Rspamd-Queue-Id: 05A6F4951B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59973-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 27, 2026 at 03:25:56PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom_wcnss client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_wcnss.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index 4add9037dbd5..0dbdd18ab3dd 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -19,7 +19,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/remoteproc.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -257,7 +257,7 @@ static int wcnss_start(struct rproc *rproc)
>  	wcnss_indicate_nv_download(wcnss);
>  	wcnss_configure_iris(wcnss);
>  
> -	ret = qcom_scm_pas_auth_and_reset(WCNSS_PAS_ID);
> +	ret = qcom_pas_auth_and_reset(WCNSS_PAS_ID);
>  	if (ret) {
>  		dev_err(wcnss->dev,
>  			"failed to authenticate image and release reset\n");
> @@ -269,7 +269,7 @@ static int wcnss_start(struct rproc *rproc)
>  	if (wcnss->ready_irq > 0 && ret == 0) {
>  		/* We have a ready_irq, but it didn't fire in time. */
>  		dev_err(wcnss->dev, "start timed out\n");
> -		qcom_scm_pas_shutdown(WCNSS_PAS_ID);
> +		qcom_pas_shutdown(WCNSS_PAS_ID);
>  		ret = -ETIMEDOUT;
>  		goto disable_iris;
>  	}
> @@ -311,7 +311,7 @@ static int wcnss_stop(struct rproc *rproc)
>  					    0);
>  	}
>  
> -	ret = qcom_scm_pas_shutdown(WCNSS_PAS_ID);
> +	ret = qcom_pas_shutdown(WCNSS_PAS_ID);
>  	if (ret)
>  		dev_err(wcnss->dev, "failed to shutdown: %d\n", ret);
>  
> @@ -557,10 +557,10 @@ static int wcnss_probe(struct platform_device *pdev)
>  
>  	data = of_device_get_match_data(&pdev->dev);
>  
> -	if (!qcom_scm_is_available())
> +	if (!qcom_pas_is_available())
>  		return -EPROBE_DEFER;
>  
> -	if (!qcom_scm_pas_supported(WCNSS_PAS_ID)) {
> +	if (!qcom_pas_supported(WCNSS_PAS_ID)) {
>  		dev_err(&pdev->dev, "PAS is not available for WCNSS\n");
>  		return -ENXIO;
>  	}

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

