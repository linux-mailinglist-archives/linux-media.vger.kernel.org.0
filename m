Return-Path: <linux-media+bounces-59958-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIvfHyvi8WlZlAEAu9opvQ
	(envelope-from <linux-media+bounces-59958-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 12:49:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B146493234
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 12:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B4533005993
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7854B3EF661;
	Wed, 29 Apr 2026 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3wGSxX3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VdPRHplV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AD23B9D81
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459742; cv=none; b=d8wmuh4oCTj8N5vJHdkKRbCOHAhcRAyHb4cDBkjsAbjH0fUgPkZCHkHEeeVcqbQsbchKumIGxBJE0VT7EtidfFVEealyvVPzp0qsdGrvNi7Eg2c4FuMcYTJlpmIdG/7HTDXeoeidNPrktyDDuvsHbn+gldciGPcUx9lMzzvtW0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459742; c=relaxed/simple;
	bh=jjmJrB758CYCD24viT44XCAE8uRBGi9jjnmA0gbuX4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTrz1QVpuCQNpZDUJVQJpuDvJVfpN71xBwmjxB8ASPsF1t2l0Z30mKPZ7ejS7o0yW7N+w0mpd4Dz476j5fHTStXpAEY0uGyv0JnY0N2GWyl2pQnZeIHcgZ++m+71EfTLCjGyh53TUFSvvQPrnlP7wMcu5Jg+FgY9H3Dh7kWheP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3wGSxX3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VdPRHplV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qj272016286
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 10:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X8c+lvAbQ7Ws5viWfaTwa2KB
	f/Urjd7LzdBWr5hcgv0=; b=G3wGSxX3Ire0RRtDcR6BU/9RNKWidgUJ6TsSADmw
	xrxp1qHpeYFNjG6+YtyjI+Q9Pa9t2R/DJEc3rHEjvlgNWKX/IG+lU8EG2j8odTTE
	2hbfZMIJ4gn9L/dP/F8DqWz5cIG4bh4qvky4jAjC4tHzYSofbh0NcEh7J/5IJIu7
	2qozmO94T4KI7u7nNz1XHN7YTp2Hwmec+jbFVG6veiJyXD8mEwnJJkVywQxD4szR
	UQCUdXkH7DlouyjM/v3OmTJ1jfcCW9QtrR3c33S1feAbB8F0OU4VUfOU2BuJYiJ6
	FKFWDkhkZnzXZkCVHCIaBSWbW2+ZqExlZ0Xc4CbZ0oZzLA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1eebdu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 10:48:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24af7ca99so167528755ad.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 03:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459739; x=1778064539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X8c+lvAbQ7Ws5viWfaTwa2KBf/Urjd7LzdBWr5hcgv0=;
        b=VdPRHplV5hupJHrLgOmlh1KOvu/y8K72nhF5TZTGwqU8ByDln3pp017tDhzmURnLtK
         D7rpZJyrxlUVjnpLWxqrryzwpcDz2A4NJNp6uPna51YUGU2A3vVcSkqNt7SIwuNjMrEb
         FzhD7lgYz3Zn8cQf197aWqUau+tXb+xsDIWx4eJyUqwpto85wJkfuiCkQeFHjv2w5dec
         mmx37QRU7JJKOhG+dWLoBm9lEs/ZWCrj0SIN5HMlS+vzeKeP6PT9KsnNfzcTfZCEP/u2
         Q7RHFykwbzQA5LiRy3N35wYTlIkDoVX6XAhn2xIz0bH6RUhdpX4akM6J7m4t+fZcUHpz
         OeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459739; x=1778064539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8c+lvAbQ7Ws5viWfaTwa2KBf/Urjd7LzdBWr5hcgv0=;
        b=Gwjfvz4fcP+KodQFIY65GULOLaO22MrXivrzB5HPTYG5WYU7JZ6DlnOPYRunZPUrez
         MhDiIebmIbjDa6zlsfR6QoKd2zlOmL84bTMW+/yu9we5ci1HxTV2capR353COYkfkdMJ
         D9zdeQ6HUSV/CaZQ07uK+qxEQ2MpkVUDvVdxhHvgNyJPGakpW99MQvbv+r9ZNd7O3hCl
         A5PCVL5+nDbV9LKu/UU9Osht7gXatnjcB1iK5uJr5FWILACiicVo/8v6Dao5BP7uZyr4
         avPmeOJbXK6z+ublYepQa5BegAWhfteTfUkRf/C0nazb3WBQibDmH4Ikc9yEfGAtsWSG
         NSbg==
X-Forwarded-Encrypted: i=1; AFNElJ+R9/pjh5Md/jYlTuLUshm/NcxQjz7zwMO+YXNBHNy/3FTkENOfAzimjsyKtMbgtHYy/Cnmrr0rRTaM0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YybVnst9Y0CfP2b5ehBvg6pvpiTqXKY0iagIPBHXMvWs16mH+Cz
	7wTG4L+jotE0qehhe10e3rIfr4yVm6hAmzVrJpFX/c7Efg0rX86iEYgU9CKqsUiZsPc/Kx+okoP
	ciKBUobUEYp9Sdh75Dt1zpCoxrFoJkeomqXw5RKPS1x8JYKSiaE8vEWyueiHeNGhYEg==
X-Gm-Gg: AeBDieuK6agIZFyffijb06H06qt7HYBzaf0hmxrp7U1IT4KTJ1hlY1E9ZCcH3zV4EI0
	Sk6YBHFOLMulzWbCjN6PeEYixru9UMi2FvpoH2XGn8qdVGpJOCXFKxWB79mlDKe46euP9p4aWyb
	rrO5TuA0tt91CttmQm3MAOLYXp6pgwlkm7rhRtd1lrsfDaVt939SHjsnFplHxqE0g5lBA8EZnx6
	m2wOw4se8V868SLA+cdD+9NOMM198VQT7GgbQrHAa7j4iEg1nzSg269vlNepa1+O/OeTk0RXFIZ
	auzh2rMvm/vxGTp0OPq+PjHtFbMfsAXTvls53jtIsYCikjTVLkScAHNSNSLBC1A7xCPyBn5fixN
	zDTRhMPYAfPO7ukcCbARBn5y+x4L3/ZQb/ReXnZIy/yAVSoF9YJSiXmtEtMs=
X-Received: by 2002:a17:902:d2c8:b0:2b2:a6a2:c8ca with SMTP id d9443c01a7336-2b97c40028dmr73257065ad.13.1777459738183;
        Wed, 29 Apr 2026 03:48:58 -0700 (PDT)
X-Received: by 2002:a17:902:d2c8:b0:2b2:a6a2:c8ca with SMTP id d9443c01a7336-2b97c40028dmr73256475ad.13.1777459737219;
        Wed, 29 Apr 2026 03:48:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98895ca58sm18952115ad.60.2026.04.29.03.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:48:56 -0700 (PDT)
Date: Wed, 29 Apr 2026 16:18:41 +0530
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
Subject: Re: [PATCH v4 03/15] firmware: qcom_scm: Migrate to generic PAS
 service
Message-ID: <20260429104841.l555xd2izoyrqjp4@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-4-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-4-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f1e21b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uE9zhxIwyCxUm-kfAmwA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfX9xTm796IRORj
 VWnf1Oq2rCPq8Exo0q2VzELwCRGc6PxMSUIDyPcVMtoWKtNcxFOOEswcdA/uZCdBe3AuZsslXC7
 f6cYgyCyEql5tmvSVVsB2yWRP15f9/5bwlsdMVYcKJI2MF0ODLKHpVpk0HtKNoRc1I/C0MYmucR
 LZTu+fYwA55MQPxdssxlYtetI3clAoC0zFlnA478b0qrFm63Ckuspxc0NOg6pfts8ckZawH/PXU
 xdug2TKtkJKENsV+Cvd5zkNrx7RwdMl/9eTVtt+dtiY4aFvZCOUJjtKkkp2BG6U2qlsq0EHoITP
 9/N5qXOEORc1Apoha2ex526eTchPw0WMByhX6KfekUivpoGUIIV3Qp9zSTza69A7/sCu04f3D2v
 loW0D6PGPGeJXwf4r5OWSBhoNtDEHWPkE/85x+weYBwlGOWFkWsQaBTkyu8aWqfSRiIhBv0uQX9
 LVTOn8gw68IAbqndgwg==
X-Proofpoint-GUID: VaLLtFPFHhKhorkziJrvuPaoyCctqrYH
X-Proofpoint-ORIG-GUID: VaLLtFPFHhKhorkziJrvuPaoyCctqrYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290109
X-Rspamd-Queue-Id: 4B146493234
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-59958-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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

On Mon, Apr 27, 2026 at 03:25:51PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> With the availability of generic PAS service, let's add SCM calls as
> a backend to keep supporting legacy QTEE interfaces. The exported
> qcom_scm* wrappers will get dropped once all the client drivers get
> migrated as part of future patches.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/Kconfig    |   1 +
>  drivers/firmware/qcom/qcom_scm.c | 335 ++++++++++++++-----------------
>  2 files changed, 155 insertions(+), 181 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> index 8653639d06db..9a12ae2b639d 100644
> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -15,6 +15,7 @@ config QCOM_PAS
>  	  TEE bus based PAS service implementation.
>  
>  config QCOM_SCM
> +	select QCOM_PAS
>  	select QCOM_TZMEM
>  	tristate
>  
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 9b06a69d3a6d..d87a962e93da 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -13,6 +13,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/firmware/qcom/qcom_tzmem.h>
>  #include <linux/init.h>
> @@ -33,6 +34,7 @@
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> +#include "qcom_pas.h"
>  #include "qcom_scm.h"
>  #include "qcom_tzmem.h"
>  
> @@ -479,25 +481,6 @@ void qcom_scm_cpu_power_down(u32 flags)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_cpu_power_down);
>  
> -int qcom_scm_set_remote_state(u32 state, u32 id)
> -{
> -	struct qcom_scm_desc desc = {
> -		.svc = QCOM_SCM_SVC_BOOT,
> -		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
> -		.arginfo = QCOM_SCM_ARGS(2),
> -		.args[0] = state,
> -		.args[1] = id,
> -		.owner = ARM_SMCCC_OWNER_SIP,
> -	};
> -	struct qcom_scm_res res;
> -	int ret;
> -
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> -
> -	return ret ? : res.result[0];
> -}
> -EXPORT_SYMBOL_GPL(qcom_scm_set_remote_state);
> -
>  static int qcom_scm_disable_sdi(void)
>  {
>  	int ret;
> @@ -570,26 +553,12 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
>  }
>  
> -/**
> - * devm_qcom_scm_pas_context_alloc() - Allocate peripheral authentication service
> - *				       context for a given peripheral
> - *
> - * PAS context is device-resource managed, so the caller does not need
> - * to worry about freeing the context memory.
> - *
> - * @dev:	  PAS firmware device
> - * @pas_id:	  peripheral authentication service id
> - * @mem_phys:	  Subsystem reserve memory start address
> - * @mem_size:	  Subsystem reserve memory size
> - *
> - * Returns: The new PAS context, or ERR_PTR() on failure.
> - */
>  struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
>  							     u32 pas_id,
>  							     phys_addr_t mem_phys,
>  							     size_t mem_size)
>  {
> -	struct qcom_scm_pas_context *ctx;
> +	struct qcom_pas_context *ctx;
>  
>  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -600,11 +569,12 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
>  	ctx->mem_phys = mem_phys;
>  	ctx->mem_size = mem_size;
>  
> -	return ctx;
> +	return (struct qcom_scm_pas_context *)ctx;
>  }
>  EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
>  
> -static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
> +static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
> +				     dma_addr_t mdata_phys,
>  				     struct qcom_scm_res *res)
>  {
>  	struct qcom_scm_desc desc = {
> @@ -626,7 +596,7 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
>  
>  	desc.args[1] = mdata_phys;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, res);
> +	ret = qcom_scm_call(dev, &desc, res);
>  	qcom_scm_bw_disable();
>  
>  disable_clk:
> @@ -635,7 +605,8 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
>  	return ret;
>  }
>  
> -static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
> +static int qcom_scm_pas_prep_and_init_image(struct device *dev,
> +					    struct qcom_pas_context *ctx,
>  					    const void *metadata, size_t size)
>  {
>  	struct qcom_scm_res res;
> @@ -650,7 +621,7 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
>  	memcpy(mdata_buf, metadata, size);
>  	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
>  
> -	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
> +	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
>  	if (ret < 0)
>  		qcom_tzmem_free(mdata_buf);
>  	else
> @@ -659,25 +630,9 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
>  	return ret ? : res.result[0];
>  }
>  
> -/**
> - * qcom_scm_pas_init_image() - Initialize peripheral authentication service
> - *			       state machine for a given peripheral, using the
> - *			       metadata
> - * @pas_id:	peripheral authentication service id
> - * @metadata:	pointer to memory containing ELF header, program header table
> - *		and optional blob of data used for authenticating the metadata
> - *		and the rest of the firmware
> - * @size:	size of the metadata
> - * @ctx:	optional pas context
> - *
> - * Return: 0 on success.
> - *
> - * Upon successful return, the PAS metadata context (@ctx) will be used to
> - * track the metadata allocation, this needs to be released by invoking
> - * qcom_scm_pas_metadata_release() by the caller.
> - */
> -int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> -			    struct qcom_scm_pas_context *ctx)
> +static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
> +				      const void *metadata, size_t size,
> +				      struct qcom_pas_context *ctx)
>  {
>  	struct qcom_scm_res res;
>  	dma_addr_t mdata_phys;
> @@ -685,7 +640,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>  	int ret;
>  
>  	if (ctx && ctx->use_tzmem)
> -		return qcom_scm_pas_prep_and_init_image(ctx, metadata, size);
> +		return qcom_scm_pas_prep_and_init_image(dev, ctx, metadata, size);
>  
>  	/*
>  	 * During the scm call memory protection will be enabled for the meta
> @@ -699,16 +654,15 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>  	 * If we pass a buffer that is already part of an SHM Bridge to this
>  	 * call, it will fail.
>  	 */
> -	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
> -				       GFP_KERNEL);
> +	mdata_buf = dma_alloc_coherent(dev, size, &mdata_phys, GFP_KERNEL);
>  	if (!mdata_buf)
>  		return -ENOMEM;
>  
>  	memcpy(mdata_buf, metadata, size);
>  
> -	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
> +	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
>  	if (ret < 0 || !ctx) {
> -		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> +		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
>  	} else if (ctx) {
>  		ctx->ptr = mdata_buf;
>  		ctx->phys = mdata_phys;
> @@ -717,36 +671,35 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>  
>  	return ret ? : res.result[0];
>  }
> -EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
>  
> -/**
> - * qcom_scm_pas_metadata_release() - release metadata context
> - * @ctx:	pas context
> - */
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
> +int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> +			    struct qcom_scm_pas_context *ctx)
>  {
> -	if (!ctx->ptr)
> -		return;
> +	return __qcom_scm_pas_init_image2(__scm->dev, pas_id, metadata, size,
> +					  (struct qcom_pas_context *)ctx);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
>  
> +static void __qcom_scm_pas_metadata_release(struct device *dev,
> +					    struct qcom_pas_context *ctx)
> +{
>  	if (ctx->use_tzmem)
>  		qcom_tzmem_free(ctx->ptr);
>  	else
> -		dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
> +		dma_free_coherent(dev, ctx->size, ctx->ptr, ctx->phys);
>  
>  	ctx->ptr = NULL;
>  }
> +
> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
> +{
> +	__qcom_scm_pas_metadata_release(__scm->dev,
> +					(struct qcom_pas_context *)ctx);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
>  
> -/**
> - * qcom_scm_pas_mem_setup() - Prepare the memory related to a given peripheral
> - *			      for firmware loading
> - * @pas_id:	peripheral authentication service id
> - * @addr:	start address of memory area to prepare
> - * @size:	size of the memory area to prepare
> - *
> - * Returns 0 on success.
> - */
> -int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
> +static int __qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
> +				    phys_addr_t addr, phys_addr_t size)
>  {
>  	int ret;
>  	struct qcom_scm_desc desc = {
> @@ -768,7 +721,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
>  	if (ret)
>  		goto disable_clk;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
>  disable_clk:
> @@ -776,9 +729,15 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
>  
>  	return ret ? : res.result[0];
>  }
> +
> +int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
> +{
> +	return __qcom_scm_pas_mem_setup(__scm->dev, pas_id, addr, size);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
>  
> -static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
> +static void *__qcom_scm_pas_get_rsc_table(struct device *dev, u32 pas_id,
> +					  void *input_rt_tzm,
>  					  size_t input_rt_size,
>  					  size_t *output_rt_size)
>  {
> @@ -813,7 +772,7 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
>  	 * with output_rt_tzm buffer with res.result[2] size however, It should not
>  	 * be of unresonable size.
>  	 */
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  	if (!ret && res.result[2] > SZ_1G) {
>  		ret = -E2BIG;
>  		goto free_output_rt;
> @@ -830,51 +789,11 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
>  	return ret ? ERR_PTR(ret) : output_rt_tzm;
>  }
>  
> -/**
> - * qcom_scm_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
> - *				  for a given peripheral.
> - *
> - * Qualcomm remote processor may rely on both static and dynamic resources for
> - * its functionality. Static resources typically refer to memory-mapped addresses
> - * required by the subsystem and are often embedded within the firmware binary
> - * and dynamic resources, such as shared memory in DDR etc., are determined at
> - * runtime during the boot process.
> - *
> - * On Qualcomm Technologies devices, it's possible that static resources are not
> - * embedded in the firmware binary and instead are provided by TrustZone However,
> - * dynamic resources are always expected to come from TrustZone. This indicates
> - * that for Qualcomm devices, all resources (static and dynamic) will be provided
> - * by TrustZone via the SMC call.
> - *
> - * If the remote processor firmware binary does contain static resources, they
> - * should be passed in input_rt. These will be forwarded to TrustZone for
> - * authentication. TrustZone will then append the dynamic resources and return
> - * the complete resource table in output_rt_tzm.
> - *
> - * If the remote processor firmware binary does not include a resource table,
> - * the caller of this function should set input_rt as NULL and input_rt_size
> - * as zero respectively.
> - *
> - * More about documentation on resource table data structures can be found in
> - * include/linux/remoteproc.h
> - *
> - * @ctx:	    PAS context
> - * @pas_id:	    peripheral authentication service id
> - * @input_rt:       resource table buffer which is present in firmware binary
> - * @input_rt_size:  size of the resource table present in firmware binary
> - * @output_rt_size: TrustZone expects caller should pass worst case size for
> - *		    the output_rt_tzm.
> - *
> - * Return:
> - *  On success, returns a pointer to the allocated buffer containing the final
> - *  resource table and output_rt_size will have actual resource table size from
> - *  TrustZone. The caller is responsible for freeing the buffer. On failure,
> - *  returns ERR_PTR(-errno).
> - */
> -struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx,
> -						  void *input_rt,
> -						  size_t input_rt_size,
> -						  size_t *output_rt_size)
> +static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
> +					   struct qcom_pas_context *ctx,
> +					   void *input_rt,
> +					   size_t input_rt_size,
> +					   size_t *output_rt_size)
>  {
>  	struct resource_table empty_rsc = {};
>  	size_t size = SZ_16K;
> @@ -909,11 +828,12 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
>  
>  	memcpy(input_rt_tzm, input_rt, input_rt_size);
>  
> -	output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
> +	output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
> +						     input_rt_tzm,
>  						     input_rt_size, &size);
>  	if (PTR_ERR(output_rt_tzm) == -EOVERFLOW)
>  		/* Try again with the size requested by the TZ */
> -		output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id,
> +		output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
>  							     input_rt_tzm,
>  							     input_rt_size,
>  							     &size);
> @@ -943,16 +863,20 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
>  
>  	return ret ? ERR_PTR(ret) : tbl_ptr;
>  }
> +
> +struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx,
> +						  void *input_rt,
> +						  size_t input_rt_size,
> +						  size_t *output_rt_size)
> +{
> +	return __qcom_scm_pas_get_rsc_table2(__scm->dev,
> +					     (struct qcom_pas_context *)ctx,
> +					     input_rt, input_rt_size,
> +					     output_rt_size);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_get_rsc_table);
>  
> -/**
> - * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
> - *				   and reset the remote processor
> - * @pas_id:	peripheral authentication service id
> - *
> - * Return 0 on success.
> - */
> -int qcom_scm_pas_auth_and_reset(u32 pas_id)
> +static int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
>  {
>  	int ret;
>  	struct qcom_scm_desc desc = {
> @@ -972,7 +896,7 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
>  	if (ret)
>  		goto disable_clk;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
>  disable_clk:
> @@ -980,28 +904,15 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
>  
>  	return ret ? : res.result[0];
>  }
> +
> +int qcom_scm_pas_auth_and_reset(u32 pas_id)
> +{
> +	return __qcom_scm_pas_auth_and_reset(__scm->dev, pas_id);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
>  
> -/**
> - * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
> - *					   remote processor
> - *
> - * @ctx:	Context saved during call to qcom_scm_pas_context_init()
> - *
> - * This function performs the necessary steps to prepare a PAS subsystem,
> - * authenticate it using the provided metadata, and initiate a reset sequence.
> - *
> - * It should be used when Linux is in control setting up the IOMMU hardware
> - * for remote subsystem during secure firmware loading processes. The preparation
> - * step sets up a shmbridge over the firmware memory before TrustZone accesses the
> - * firmware memory region for authentication. The authentication step verifies
> - * the integrity and authenticity of the firmware or configuration using secure
> - * metadata. Finally, the reset step ensures the subsystem starts in a clean and
> - * sane state.
> - *
> - * Return: 0 on success, negative errno on failure.
> - */
> -int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
> +static int __qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
> +						 struct qcom_pas_context *ctx)
>  {
>  	u64 handle;
>  	int ret;
> @@ -1012,7 +923,7 @@ int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
>  	 * memory region and then invokes a call to TrustZone to authenticate.
>  	 */
>  	if (!ctx->use_tzmem)
> -		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
> +		return __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
>  
>  	/*
>  	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
> @@ -1022,20 +933,45 @@ int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
>  	if (ret)
>  		return ret;
>  
> -	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
> +	ret = __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
>  	qcom_tzmem_shm_bridge_delete(handle);
>  
>  	return ret;
>  }
> +
> +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
> +{
> +	return __qcom_scm_pas_prepare_and_auth_reset(__scm->dev,
> +						     (struct qcom_pas_context *)ctx);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
>  
> -/**
> - * qcom_scm_pas_shutdown() - Shut down the remote processor
> - * @pas_id:	peripheral authentication service id
> - *
> - * Returns 0 on success.
> - */
> -int qcom_scm_pas_shutdown(u32 pas_id)
> +static int __qcom_scm_pas_set_remote_state(struct device *dev, u32 state,
> +					   u32 pas_id)
> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_BOOT,
> +		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
> +		.arginfo = QCOM_SCM_ARGS(2),
> +		.args[0] = state,
> +		.args[1] = pas_id,
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};
> +	struct qcom_scm_res res;
> +	int ret;
> +
> +	ret = qcom_scm_call(dev, &desc, &res);
> +
> +	return ret ? : res.result[0];
> +}
> +
> +int qcom_scm_set_remote_state(u32 state, u32 id)

s/id/pas_id

> +{
> +	return __qcom_scm_pas_set_remote_state(__scm->dev, state, id);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_set_remote_state);
> +
> +static int __qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
>  {
>  	int ret;
>  	struct qcom_scm_desc desc = {
> @@ -1055,7 +991,7 @@ int qcom_scm_pas_shutdown(u32 pas_id)
>  	if (ret)
>  		goto disable_clk;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
>  disable_clk:
> @@ -1063,16 +999,14 @@ int qcom_scm_pas_shutdown(u32 pas_id)
>  
>  	return ret ? : res.result[0];
>  }
> +
> +int qcom_scm_pas_shutdown(u32 pas_id)
> +{
> +	return __qcom_scm_pas_shutdown(__scm->dev, pas_id);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
>  
> -/**
> - * qcom_scm_pas_supported() - Check if the peripheral authentication service is
> - *			      available for the given peripherial
> - * @pas_id:	peripheral authentication service id
> - *
> - * Returns true if PAS is supported for this peripheral, otherwise false.
> - */
> -bool qcom_scm_pas_supported(u32 pas_id)
> +static bool __qcom_scm_pas_supported(struct device *dev, u32 pas_id)
>  {
>  	int ret;
>  	struct qcom_scm_desc desc = {
> @@ -1084,16 +1018,49 @@ bool qcom_scm_pas_supported(u32 pas_id)
>  	};
>  	struct qcom_scm_res res;
>  
> -	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
> +	if (!__qcom_scm_is_call_available(dev, QCOM_SCM_SVC_PIL,
>  					  QCOM_SCM_PIL_PAS_IS_SUPPORTED))
>  		return false;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  
>  	return ret ? false : !!res.result[0];
>  }
> +
> +bool qcom_scm_pas_supported(u32 pas_id)
> +{
> +	return __qcom_scm_pas_supported(__scm->dev, pas_id);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_supported);
>  
> +static struct qcom_pas_ops qcom_pas_ops_scm = {
> +	.drv_name		= "qcom_scm",
> +	.supported		= __qcom_scm_pas_supported,
> +	.init_image		= __qcom_scm_pas_init_image2,
> +	.mem_setup		= __qcom_scm_pas_mem_setup,
> +	.get_rsc_table		= __qcom_scm_pas_get_rsc_table2,
> +	.auth_and_reset		= __qcom_scm_pas_auth_and_reset,
> +	.prepare_and_auth_reset	= __qcom_scm_pas_prepare_and_auth_reset,
> +	.set_remote_state	= __qcom_scm_pas_set_remote_state,
> +	.shutdown		= __qcom_scm_pas_shutdown,
> +	.metadata_release	= __qcom_scm_pas_metadata_release,
> +};
> +
> +/**
> + * qcom_scm_is_pas_available() - Check if the peripheral authentication service
> + *				 is available via SCM or not
> + *
> + * Returns true if PAS is available, otherwise false.
> + */
> +static bool qcom_scm_is_pas_available(void)
> +{
> +	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
> +					  QCOM_SCM_PIL_PAS_AUTH_AND_RESET))

QCOM_SCM_PIL_PAS_IS_SUPPORTED ?


> +		return false;
> +
> +	return true;
> +}
> +
>  static int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
>  {
>  	struct qcom_scm_desc desc = {
> @@ -2836,6 +2803,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  
>  	__get_convention();
>  
> +	if (qcom_scm_is_pas_available()) {

Use qcom_scm_pas_supported() and remove qcom_scm_is_pas_available()..

> +		qcom_pas_ops_scm.dev = scm->dev;
> +		qcom_pas_ops_register(&qcom_pas_ops_scm);
> +	}
> +
>  	/*
>  	 * If "download mode" is requested, from this point on warmboot
>  	 * will cause the boot stages to enter download mode, unless
> @@ -2875,6 +2847,7 @@ static void qcom_scm_shutdown(struct platform_device *pdev)
>  {
>  	/* Clean shutdown, disable download mode to allow normal restart */
>  	qcom_scm_set_download_mode(QCOM_DLOAD_NODUMP);
> +	qcom_pas_ops_unregister();
>  }
>  
>  static const struct of_device_id qcom_scm_dt_match[] = {
> -- 
> 2.51.0
> 

With above changes,

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> 

-- 
-Mukesh Ojha

