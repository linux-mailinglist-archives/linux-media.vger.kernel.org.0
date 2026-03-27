Return-Path: <linux-media+bounces-57225-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAmVNvZzxmkCKgUAu9opvQ
	(envelope-from <linux-media+bounces-57225-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 13:11:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A19344027
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 13:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2D7A302DE68
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 12:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70638395DB4;
	Fri, 27 Mar 2026 12:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Up21IAxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvUxO/VQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DEB3939BF
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613434; cv=none; b=LVyym71wxvDgZkocqEa/dMsXIqwh1/43GcUBwhkJxRC7mxZQJfp/nlbv3vOPBuY8ztREjztJB+cSyku5NiAAE/DVFQfKhmniAxIW89/NnIn+gDQqMXP/9gBJAiS8Qq0Vth26SOUolKnNWsK6XBk/nsvPaHBvEJLvCfqBCvdum7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613434; c=relaxed/simple;
	bh=7RB9EZqPtA0omj+QCweCs4rq3RGq8GMapB5Xh18U0eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEB3eBNNeGWOimqoN8Hk/g38d5Z3hZQ29XPWU+hlCycLPxAdEdja+G8vLulv/cuZ0O8nVgS2Wu3f6hmL4iepmdBwUd1PpETVSFCvgrRRXsCWbE9Hw8SmWaT7TaI5f23Wg431+E18NhU0J47/4bgh5e/yL7KRy48QkXWiEPEAQWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Up21IAxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvUxO/VQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wvRL2846339
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 12:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EE0yGsx0mvjT/GTmYnfC7r+2Fd45Q0DeobTk/gC7vvM=; b=Up21IAxvjvhnBku5
	1WEMR0plcKU/8LVRwfLOzTqQcWm/3I+FpNYWTAfJE0dN62SjCAwOLiTXkpyOBmi1
	F03PkTNDHh3WcdrldG8ULdMLmcQ/Oc1kjap8+L8KgAcO8jdGI2IPNhmq6/HEfpLN
	Hx1h95vFsrzsa8PP4bVyXCHqy6IdyUtoYOcjZ9fVYdltJ9tbzr/xQ7sFTf2LHYD/
	4rqENwzKnPuPHAvJD0+JtODzjxU2VRtX1Vdi6PlvOy8X1W+bHnHXA+pCGN1JHGBI
	j58bnigDIr+KkVbhN90OmOsKB0BKxod3uqxB7+n9v3z69FMEDlvgerGGDdh7lqqG
	2Kv71w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmxeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 12:10:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso2641794a91.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 05:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774613431; x=1775218231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EE0yGsx0mvjT/GTmYnfC7r+2Fd45Q0DeobTk/gC7vvM=;
        b=fvUxO/VQvvL/PziZXF+Qs2ai1RD5lOKeDkatgXIzIftSVeQ2vdNNI+soJmTBj2bihq
         DeHHtrDWbfYNIsDl8wHYewXXSZVPvZNpH2pJI8nHh3oPlMeftrguCOzmKsEhBZ7BDKUI
         irLB3Zn5onIMXrQKK/cvScZIApgrL8GDWxt5cyodXEfhbaJDJK/t+E9Le2VBP9s++cE1
         mzxK6Yrsjiob9nVhbCT+z6s6OyyByvQtIvMLFBOr4JYBjaQ3hIPiI+O4N7M+1zeEd1Id
         VG2EA94hQKdyyuVhnP1iXhUc9BCI8/l1RJ3kr7mvzev7FVx7+cl3ThDwWqR7sh/jWLms
         ErGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774613431; x=1775218231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EE0yGsx0mvjT/GTmYnfC7r+2Fd45Q0DeobTk/gC7vvM=;
        b=lW3afmE60xF1Ju5P034HKiuATLGKfuf8dQmSwn6pDx38lQGil454qIifBHOUJVqbf5
         0nQKf2DTWPW15SK0hQdwQXLaL8jtDQyH1PO1E2K3KYxh0txi6rK8m+RsdXU/EHhgVsId
         RYTyGoIkaT6BbevJxk0Ljk6wjK/P2CK3v2/191GFR7z5CKT30+7TA7cW6lNxmJ3C1X8I
         4R17DvnAO6UNrWgNbWcl6PzAp4f8JIwNFlChEv/JvuW/WFVS0MlY2P6BJ5yE+IromE1K
         L6i4IsDxcbxcuoA1NPp1zxnkRhu/JiOJlRmhPzXNFpIhIPGVDfukW1gOTuyh+1Y3tFWG
         45nw==
X-Forwarded-Encrypted: i=1; AJvYcCU+m4P+kSMDA7xA56uLb9kGomez00fI7Cd180W6EZn5qZ9N9Qp+iYxbe6R72pcyP94Vlpa2okLs8l4Vaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyop/KdLih8+FNytezriiohGg1aBf+V8sxtphnqgXg1YVezZ9Uy
	GgcYwt8zbgN/vbzqa1oJIJmyWZhBF2OHAtPWm9qsT+mAybcn7Jfim6i4VZhPzeN/6numX3PDVS9
	f4qZsuGp3d3fqjXateDLV4oQ3c4cyRoiJ5Oo5advQ3VSFYey6NepEKHpxqbUGwYZVJg==
X-Gm-Gg: ATEYQzxESptXX+9Br4v6OPKpdpG1qdqNe/rI1DLlap29/XM7qBjsoWb870XKm/C14e3
	jKkgkkm+G77M26X4ZMReNcZasIA3hON3UuNxwmMssoa5bqcst4INuICnPGRv+aKVaa4CNbSOdPX
	flXq666BVCMpJRuCItGzzX5b3Dwk5I+qCe6NbeTgT7hkVrTHK4p2kwDCjjjF/s+fZk8rEbVGE9b
	PtiZW/uNUBqTjG4N7GPoOMQVBC8pLxeFz2eLv/+ih7gXq7autPlMG3ULqtxdndTNYSK2SyuHsPM
	euN1A+amcWkWxYEaLi7Lipyl7PJwlWl8y429tYLyRvE4csXSpiQ110yuPuL9LEk/4A1susLKZgX
	DoCr+Q3rtGL5yehmk0NyywdnjAfkTnpJ3WBMVmBy5j1g9uR9C6Vs=
X-Received: by 2002:a17:90b:1e51:b0:35b:e51a:85af with SMTP id 98e67ed59e1d1-35c2fff2c76mr2299332a91.10.1774613430856;
        Fri, 27 Mar 2026 05:10:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1e51:b0:35b:e51a:85af with SMTP id 98e67ed59e1d1-35c2fff2c76mr2299260a91.10.1774613430257;
        Fri, 27 Mar 2026 05:10:30 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a81757sm6204402a91.6.2026.03.27.05.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:10:29 -0700 (PDT)
Message-ID: <bc7b116d-de41-4b9a-9c84-1010e226bac8@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 17:40:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] firmware: qcom_scm: Migrate to generic PAS
 service
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-4-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260312062756.694390-4-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MyBTYWx0ZWRfXzP8JUCJT4lkW
 s9tZOZQJiTZZuHYWKXl+YYGxl2kzvM7gE4XtTyiXgJEmV32QWLaUOTTuZlRJwFSNAVGV/T0hXOY
 LHOu5jdITG9su+FF7/rm8Q8souQey9oIxiKpvpC7q8KeNMllqi3VD51ann3yQNJtxL6lf/oaOFq
 lj0/T5CPkWFcOx0oilfhbEMuVxhllKVZ5GZQTbFsZje1AvI2WJC4g8cGEWbjGbexkRstaam6ftX
 CDt02JpuS+AhY2o2dtRcDZZKPBJE30kU3M2RPBZCTjwxxmCsA70TfaGPmmmzOCr6HQtk09mYoH1
 p5wMakPqM3efA/KzV4NJKjWaXuOATeo84eLkTEoa7RqQCqHsFR7tMBlTVvw2MbLMljXS5Ke/WJZ
 gc1ckaRCqz/PhVL+uQOnBP97qqHFKubbwEbUxffBNtF67U+uZYCTj1HpTKcaq0t6cNlwkXhTlUt
 HX7ujkVTo0yliaFBC7A==
X-Proofpoint-GUID: Z8Y0wwCmNYdWdresrvVphippsy09rZ_i
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c673b8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j567PbXuXaTzagYqJJIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Z8Y0wwCmNYdWdresrvVphippsy09rZ_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org,vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-57225-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94A19344027
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/12/2026 11:57 AM, Sumit Garg wrote:
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
>  drivers/firmware/qcom/qcom_scm.c | 336 ++++++++++++++-----------------
>  2 files changed, 156 insertions(+), 181 deletions(-)
>

[..]

> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 8fbc96693a55..2d7937ae7c8f 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -13,6 +13,7 @@
>  #include <linux/dma-mapping.h>

[..]

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

Shouldn't we drop the documentation for the exported functions in this file as part of
patch 14/15? After this patch is applied, the devm_qcom_scm_pas_context_alloc() function
still remains exported and available.

Regards,
Harshal

