Return-Path: <linux-media+bounces-62308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G/ZDvzJDWo33QUAu9opvQ
	(envelope-from <linux-media+bounces-62308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:49:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBAD5900CB
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DE9E3127911
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEA83E95B8;
	Wed, 20 May 2026 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJVdwe0E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtzF8S2W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93F53EB7E8
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287263; cv=none; b=usiU4hpAXroQB4xOhS/x5yMTl4FU49WSsL/56AM1hDSwNnZla0DuTmeBw6tWTHhGCOmQrStBOkI3lZkki+DYijlBYuOt4NbUG18ihNttr76fzqP18m7fM9/LeZQ7Jo4sSDogt+Tt3QISmJ+JXph19Df1MBC751Wiwx5IISz0p1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287263; c=relaxed/simple;
	bh=HhFXaI44qpPtebJLFLdgRIOE8w0ovcHLixgHIq3RmAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIxEkSIavWoOt3QGGxlJ02ZoUiUvmxFtST3N8I94qRySUBakNylWP0wMCscgGRIMwIQEeSMAg4JITncekWfZC1+0EdhheMfMyC9cJNbSTQGAJ8LojXu0TF+BTGG8oX+Juu5DzTelV2GM0pvJepOmjx5rLLM/U+FCu64hGq2Nks0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJVdwe0E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtzF8S2W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oRon1178126
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 14:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EFchA/PJgMyqdqvbr5p+Cpu2
	tYJVf4uyCXjeVVObaow=; b=IJVdwe0E9ak1iNh8XXD9rrzKn/RUEyEFg+TihlY6
	0x0kfwSksu6HayCdXDFAChikwMgdL3e8wUM0Atzfurz76tMCVidK95iSWV6cIqnG
	6F/bwCjvcC9GKTkjGx6iT/jnpaBOnkX3OR+yjFiER1R9nnaDOOYPHV+Eo4FnKRCM
	4aks3xgT098xaEVWR9hTv8+pp3Xm1POqGlIIQ8IF58ELY+HjaVV5iwCdQpuDUxuO
	1k5mZhCdgWi22xllqgMo/UolX+X0od3iXAWDRogiJhUHqi8AKuFPBQCQOYsVH9aS
	7Bd83i0RH9+7HtQU/S3XzCkBxlHhTRRDVUUN3Nc8CUD3nQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6s03t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 14:27:39 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95fc346e02dso9190277241.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 07:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287258; x=1779892058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EFchA/PJgMyqdqvbr5p+Cpu2tYJVf4uyCXjeVVObaow=;
        b=NtzF8S2W3V54GlawetpHP0GQXyypyWTqCu7/UKtyx1OTuI4KTAva5SVAQunNxw1WbJ
         ntAGKnXH8nUAFxPcDfu99yaL3A0LO/lpPRE2xLZ+Vu2li6SQE3vySpnHSNHDxvc/5NJF
         EdzSR/7SN/jyat9/RUl0DJPw3ejd4Wj9uvSIupJHUSQRxoE6qiUuPKPy178GAFd/S3zY
         JsGRh6kJNHNBqqM4BeVrZBctY5CTn8tz3jwJkJ0yk4KNWr4vpsd5zQGarpetjnzD6ctn
         CdYex2jgcHU0U3ARqo6lKWt0WJsHr8geYKCYe7YKEsIW+wor+qnSkGFERQSkB6u1iSyr
         FKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287258; x=1779892058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFchA/PJgMyqdqvbr5p+Cpu2tYJVf4uyCXjeVVObaow=;
        b=YNap7wqpXvzf8jOHDcatRmmFdhXHNPvVXXwhcr63UnMwC85pbjQ4usL443Pasp82L8
         Wqpw98+/dqAByQjJhUzAMDJXEH7Gi7bIhp/jKNaKj/7bK6h03M8KGRGoU+b55QROxXof
         uYHkv+aT13ggFlnm5Q3iV4hStX84R2Is1LD7dlkT2gP5kPHXWTW0DQ0ca8n2fQSgGBzK
         1FoceeoBYrcG526/3s0cCMqcL5PXP9XunOKUc5Ot/6h0vO8tgr4pM4Tq1Xe6nYyOS3Lc
         KgQHpsoLBlv+YCabRwjZe+u3TLIcuRr+vjCL47e7zln8vYaAMdxkIvoxddLjLZcU2oJi
         Y3TQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OvhTYG/yeYdrtuxxqLIGID0u9WIt4T3oQNUx9JI/Nylz+8Dqwr4pts/LOOgjZo5mU+sKM+77vywz2JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS3+Ab3PZ+lttqSL/xZ3K5Ghqnmm5ZoyVzScqjlEB1UOAZb4o6
	moCqYZLHUfrpxbVpuk+hvMZL6o974uDilaM0UO4qDnbFIDZFKkW8uuXfzBlNgorb1KAeL17c9Je
	e2cMJcxZ2WjidC4zaNBr4nHph8jOnJpdEpPJjpz0CmuCS5TudIjEL6+jGWv8Le95mjg==
X-Gm-Gg: Acq92OE83/HfumG6TZzrKoe/swOtQp6JcGen6uuj8QwzOgdswDxfLNFWfnG0rfX+yPZ
	GsStUaT3pabzFJI+IaLGCJJ8+ziwH2zxJXzhAuZSqjw5bXnN6op5MD/fW6iUfIVWEW0WAsq4N2o
	f1lijty7q+WCKv2Zz7Axz32KkfrXZ6AgLn6k4ImgTSenSR1HFI1taZ9ghSUab7vsaK55hX3EEE6
	m9iR3rZ9OmBCH2FnFvRe4vhI4Ygdd83J7vEYRk3rlWzadpKIIUsUewNml2yWcz7hNH4HGADIRix
	w5aY1N6i7yk1e6v7rFw0a3JVDX78MGtNo1MGEhH+mKZVWecc8xWkr+xMEXCMFUs/hVdt6bNbFzP
	LH28iR6qDVBih2EtqB3RuI3/bOBj9ytMKW11kzC66S5i56MYTL1eJmbtwCnJ3qZnsLPmK0acf+c
	Maxs9Oh89usZ3jBQqE9qQNldjD3tr7EVlR26EcsLDNuXsALA==
X-Received: by 2002:a05:6122:4b8c:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-5760bfb8ca9mr14235221e0c.3.1779287258008;
        Wed, 20 May 2026 07:27:38 -0700 (PDT)
X-Received: by 2002:a05:6122:4b8c:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-5760bfb8ca9mr14235127e0c.3.1779287257396;
        Wed, 20 May 2026 07:27:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc39fsm4991506e87.49.2026.05.20.07.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:27:36 -0700 (PDT)
Date: Wed, 20 May 2026 17:27:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 07/15] accel/qda: Add memory manager for CB devices
Message-ID: <a6n2qquynwzlquzqmnmjmkg6vkrldj42muuejwzln5wna2qmhi@ki2slzuyt5qw>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-7-b2d984c297f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-qda-series-v1-7-b2d984c297f8@oss.qualcomm.com>
X-Proofpoint-GUID: WJ57xVN5CVCHMpFveWasfiLRD1SaPa_k
X-Proofpoint-ORIG-GUID: WJ57xVN5CVCHMpFveWasfiLRD1SaPa_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MSBTYWx0ZWRfX1X7ncYUr24xA
 ux3eJD5M92OyKGbbiU9CENgpDkjl2/r1OkDuig4ad63yoX8DKtDW7/tiZgcOYDbuq2rcbajSzwN
 P5j84dABAWF0hT661uA5dwpRDmq25u6m2Z5JdhfgvoRPPoVrFElUf3IdiuCEwOIfMGiBXLT8PcI
 sEzCC8sXDbAniZWvRuTP1aCfQQbkvKWnjraTTP6Rhz6Lf4LwL8yWre1nH/sXKcZ9R1YB7GURSrY
 2Fc2q9RR+lOFuA4PoTCdSkhH2jVIIa2Z6fhncTvF06g78QSDDz+X5rmfKREEUlvQIOpMMlqnlAM
 zvcbFZWPck+rPFuFy2oqgSM9TfUQA3FDWimFwyF2xAfD4lBt/K7v6Zw+yjq6k3r55IaYofpKwAW
 iLqm6VcpV+XuwOMGDNvprUEkyVrPKA+EowFyU4P084bH+mO2FixcmUOBMzQgtq85GoBBrVsHCPp
 00WHj5MnJDgbq5tCo+g==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0dc4db cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=o1-M_76Tnwwude6v8VIA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200141
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62308-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9EBAD5900CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:45:57AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Introduce the QDA memory manager (qda_memory_manager) to track and
> manage the IOMMU devices that back each compute context bank (CB).
> 
> Each CB device registered on the qda-compute-cb bus is assigned a
> unique ID via an XArray and wrapped in a qda_iommu_device descriptor
> that records the device pointer and its stream ID. This registry
> allows the driver to look up the correct IOMMU domain for a given
> session when mapping DSP buffers.
> 
> The memory manager is initialised in qda_init_device() before CB
> devices are populated and torn down in qda_deinit_device() after they
> are destroyed, ensuring no dangling references remain in the XArray.
> 
> qda_cb.c is extended with qda_cb_setup_device(), which is called
> immediately after a CB device is registered on the bus. It allocates
> a qda_iommu_device, registers it with the memory manager, and stores
> it as the CB device's driver data so that qda_destroy_cb_device() can
> retrieve and unregister it during teardown.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile             |   1 +
>  drivers/accel/qda/qda_cb.c             |  47 ++++++++++++++
>  drivers/accel/qda/qda_drv.c            |  34 ++++++++++
>  drivers/accel/qda/qda_drv.h            |   5 ++
>  drivers/accel/qda/qda_memory_manager.c | 111 +++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_memory_manager.h |  49 +++++++++++++++
>  drivers/accel/qda/qda_rpmsg.c          |   7 +++
>  7 files changed, 254 insertions(+)
> 
> @@ -61,14 +62,20 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>  	}
>  	qdev->dsp_name = label;
>  
> +	ret = qda_init_device(qdev);
> +	if (ret)
> +		return ret;
> +
>  	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
>  	if (ret) {
>  		dev_err(qdev->dev, "Failed to populate child devices: %d\n", ret);
> +		qda_deinit_device(qdev);
>  		return ret;
>  	}
>  
>  	ret = qda_register_device(qdev);
>  	if (ret) {
> +		qda_deinit_device(qdev);
>  		qda_cb_unpopulate(qdev);

No, this is not how you unwind in the error case in the kernel. Follow
the established patterns.

>  		return ret;
>  	}
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

