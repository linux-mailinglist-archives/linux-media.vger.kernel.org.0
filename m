Return-Path: <linux-media+bounces-59971-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDnmF14J8mlXnAEAu9opvQ
	(envelope-from <linux-media+bounces-59971-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 15:36:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3E9494F18
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 15:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CAFD306173C
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 13:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC733FE646;
	Wed, 29 Apr 2026 13:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4ShSk6m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TH774clm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE689324B1F
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469540; cv=none; b=C6JWd5k7IyvrUuCmiTVwQFtl5fdtONRTzF55VTBfYaRRQnL4QF7YBNDkkF+unV+xC6lQ4PnFKhArR2pN+xheoUtrEAyJDil0+nJj5ht0wHLIkCuLhNfqVJjnvgr5VMvxvD6OROamNH9Hw9o+3X+1Pjux2wRneEWSUJG/srYwoMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469540; c=relaxed/simple;
	bh=8MlgmCf4zwoh87Y1YqLlhl00eWh9D+mSMPCZDrhBsPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZk9T8cdEdkOK2+ul22AEb+bgbxOFDohlh3RQ1PqRKNfdt1hCEU67VtsQbPjvOY/T3CP+G2Ij2PBlE3TGPmb9l1iAHFpziHm3eZNeV2af6gpIn/GK4PDRozSRH7xdfMHruv1hatY05nuGAOdNqjcWe0xnzGNptmWEhwqPAivxWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4ShSk6m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TH774clm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pma0901592
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 13:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zlXmXqOMWysl75wyJsPWf9ub
	9kxU1RPWgNiLMjMjO54=; b=b4ShSk6mKXAOrKXOdRb8rgeM9x0E3AOsUVpGffLX
	YHTR3NG/VHJbPyYcC95HQFsUhNe0VmjCUK0JBtUkd5xLFcFUvZngpyRLOUulQDSn
	nhS0ymk5Q/TAqTVAiCkTu/K2KoGMmZd4ITeT38pEf4r1FLCOVVHy8E6SudEJgvCz
	sI9DUmIPcJBOLQH36FG8SrtbCgHiNJttNS8RBr4nrKjz79AgT6VAzVj2EmgqUN5c
	AYY8mOcO8yx/QLoMEJWhB7hiq7WTX1D0YnsBoA1Ov1EpE1a3KvY9F8ZZNhTwA9ez
	4ag4G9vhGXxwOxTZimD4kr4NPA+7utKXEk+8SArbJOKdPQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9hv65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 13:32:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2eba42b8dso112355335ad.0
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777469537; x=1778074337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zlXmXqOMWysl75wyJsPWf9ub9kxU1RPWgNiLMjMjO54=;
        b=TH774clm96wZPhoGmpJeY//uhWuVYJU+kxkCQvnbsNEhyC0I5RdCJw58cgiocmfM4R
         CPGHJojodux+Co8oZMFYUYkQnU1xfclbiJnWfiJvtvuGPUrxqoSLoyYrz66KDp0ifvob
         643q1R2MTYJ07/sFr28PVUG08YF5fTkoJm1wvgWslrWgyPMlVn8MGVhVkqIJFKRwersq
         l7o8DdO3BQNGRIpCIburz7m3jD9bB3iOPXLLtz1kZZFKMlNG0uILlmCfhWdwP1M9Y/iL
         300moZHWS02tcREKfnNLgHTNgayQuYIpmQv8KxyTQoXuZ45QCHR5LJjthuOiiG9z79t0
         5GYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469537; x=1778074337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlXmXqOMWysl75wyJsPWf9ub9kxU1RPWgNiLMjMjO54=;
        b=Xl1H5FFmzISacKgbt8fWDbNjl0fZyap7qUfhV2nV2Du291snbRDk8Mor51xNAsKPtk
         qg6DHvmgZNB+ytuj5/jRaj9elJ0BewTozredPRHOq6DqL3Znq6ShBib5xa2iM6n31L2n
         D1Wa4Qu3RsH2FKRsFuV+phFoc8l7X8M9667/g1Cdx9UTihDATbYy8gDs/WYcxK8ErVk6
         pJ1ozk0yUXUwQWEUHYY9cIe2CYP6iYJqKc9W799YCixS+JC+QcjOr+BMK8ZMq1HEwEj6
         r/c7GFzI5TO16EwyQQ4n6z+Xxc2TcSbSHZyRF/3JMDsQGY6aovm8NeSsZ0BLKpBLGXfR
         6mUA==
X-Forwarded-Encrypted: i=1; AFNElJ/qt05hNhbgnOEGCK9wxBTwTcZhq37SY3BWuC7ybpfP+8/UP++UutvBK7Ht3jLMmp9kHVwuF1SQ1OFCHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjN88JlIqebz9XG83p+PyLZR/46dg5Tkbb7h8zD8Pqcslu+D8E
	igTnrDDtYMniE6/KCAN0qcGzbuh+OeOFAc0J20Qted1hzldV8BAA9Man0LXJCgI3kGJfYRro/c3
	iv3h+vtfhMlOyZ2QB+/xbsUfAmBFXadGFsXHTiq+AVuRDA9AqQTDb5iOYDLp1Qc0Ngg==
X-Gm-Gg: AeBDieskkvuh196pmv+V8i/CP5qIwAu9jVCBqgxaGX1sW5FKraty4m2Vao7RiwdRjey
	wwkVYA5oWTI1/UvKcLi/ld4lUoJ5fGPLssg/FHZ5JGvasU2SrofwL9oemZ6CgVLUWzpNg0QxnTf
	vhiFNBdetnqqu+5eHI/8nTPPthFrfDcwDPutEw1zCU84TNlYtFn7t1lxchmKJ6ZTX6PUSQQvZ7I
	DHebLcZ/Ee32o3T+/450bHmnuImoCuBMNjzazNlmLwJT19lHOp6LUusCNsWuc+tpGFJLUseoAyz
	bdv/ELDjcQrMiClG/Yy1WMi2qgqH4kR9AldJ0DiaEFLgIZ0lEEjxst6L92BRbHIn2AOtuTJtrLc
	Sj8CbIzbJRZPYvYVzAdUYFKz9aM7v7I0I2WxnFwbTZe87dqT0LBz2nSBaFgM=
X-Received: by 2002:a17:903:2283:b0:2b9:86ca:5bf2 with SMTP id d9443c01a7336-2b986ca5cd1mr44795525ad.30.1777469536350;
        Wed, 29 Apr 2026 06:32:16 -0700 (PDT)
X-Received: by 2002:a17:903:2283:b0:2b9:86ca:5bf2 with SMTP id d9443c01a7336-2b986ca5cd1mr44794745ad.30.1777469535665;
        Wed, 29 Apr 2026 06:32:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f0b7sm25818105ad.40.2026.04.29.06.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:32:13 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:01:57 +0530
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
Subject: Re: [PATCH v4 06/15] remoteproc: qcom_q6v5_mss: Switch to generic
 PAS TZ APIs
Message-ID: <20260429133157.lopr6n5vaik36466@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-7-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-7-sumit.garg@kernel.org>
X-Proofpoint-GUID: 0eGYFRkB2sElU37T3-IC_9hSbJRLA6j9
X-Proofpoint-ORIG-GUID: 0eGYFRkB2sElU37T3-IC_9hSbJRLA6j9
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f20861 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UXi9AHVq_sPz40Hf2JYA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNyBTYWx0ZWRfX8RkTkkE6WU0+
 WnQYhRlfG96XIIVdlLC9230Yz1o/g6AOEaekYpWdofZEi9s4C/hlqe33YofZWPVqFB4k+GoyVXc
 Vph+YUrOHYiQgU+DekeFwHQYp4+vayVxDqXwyddxP4MDEQDggYWTDVapaoHTSR+YV5T80/kV7vg
 HQJc13qHoFE1cjy3sEXFJyN7bKVXxpB+0ZBaRPI+VNywMSLenx4CIhhs4uzFockuQy+ye7KKeeI
 +H99pIMr8C+QXeFt6gJsT0FvtniHg1eM7NGmxK8yhGzJwexV/xz/rKkJ2DehG05m5DOkI2w1EWs
 DiPZ22NBQ3u8CcSxU0lNUF3gGwcBywqXOh6q+KKmBrfFgNlPwUEUu2UKINAbqezpl+Xuyw7yESS
 bTvbrdvlqRKPWxb7PsCVksZiV+pNtjOvoFD5PChDn1lFa0QVemXfxSq5G1ZZUQBtPi4V+h6AwTM
 wwkJiGl80g55WIlZNsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290137
X-Rspamd-Queue-Id: EC3E9494F18
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
	TAGGED_FROM(0.00)[bounces-59971-lists,linux-media=lfdr.de];
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

On Mon, Apr 27, 2026 at 03:25:54PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom_q6v5_mss client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index ae78f5c7c1b6..96888007faa8 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -34,6 +34,7 @@
>  #include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
>  
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>

same here., whether it is needed now ?

>  
>  #define MPSS_CRASH_REASON_SMEM		421
> @@ -1480,7 +1481,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	}
>  
>  	if (qproc->need_pas_mem_setup) {
> -		ret = qcom_scm_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
> +		ret = qcom_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
>  		if (ret) {
>  			dev_err(qproc->dev,
>  				"setting up mpss memory failed: %d\n", ret);
> @@ -2077,7 +2078,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (!desc)
>  		return -EINVAL;
>  
> -	if (desc->need_mem_protection && !qcom_scm_is_available())
> +	if (desc->need_mem_protection && !qcom_pas_is_available())
>  		return -EPROBE_DEFER;
>  
>  	mba_image = desc->hexagon_mba_image;

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

