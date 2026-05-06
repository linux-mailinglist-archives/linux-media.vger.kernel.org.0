Return-Path: <linux-media+bounces-60508-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B8VDPnP+mkHTAMAu9opvQ
	(envelope-from <linux-media+bounces-60508-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 07:22:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 895664D6471
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 07:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C14E13026A84
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 05:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C90F25776;
	Wed,  6 May 2026 05:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBvF1NmG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ji4Be3K2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE731234973
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 05:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778044903; cv=none; b=NdlsgCqvvslOTTFJdcVp/Vh1cS75ZA3cHKPq2nurdT/C7BcK3iBwUxqcACC7SCIIJpmNoUT+JETgRqhywVabQV4Ojkqfx3sjAild5zMuj6yoV532UyavVeMIgsqAZchy/EyShADEmwOMvq4eU5UM/73tfpf6cu13Rax1FK1Jql0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778044903; c=relaxed/simple;
	bh=Sj/Uu5RP+53mJvN5YPI+Bqc0Ki1TaGCxMvlnM8akErY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSeDuaeTk4SVTGVm03gK0/PgGEdUKtvWXJkyztZnc5QiM2aoRomljNtKvF74kA7dVK/79MwFJ8qoi6ddKl2jL7rtrOj30zgGr/Yq7s0CMQ+o9Il7HjwLPSdn9nIhJO1BuhnYXZM+XvAGCMePAGzm15i8dJ3b1EcGFASSXVjrvxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBvF1NmG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ji4Be3K2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645NsSh64028276
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 05:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pBdh4/JvYKUMPV4XE6EJA/hH
	7ueJ2klFaJ8ONNXBNbU=; b=nBvF1NmGfNwIwP1ohqzFJH1WKXEZTQGwMsaVNLzB
	6oYB6qlIUj8c4FzXyjS74ibGUuJO0ru7hqPeCnGlqVKkYfjgzUv/84XdmS8ZTxao
	ktdasOQQQBTYYy2W0sBX7VMAgOKYujtYJrftD7itHVZTqCWZW2AonjdnJoNUoxv7
	z6vFYK97VDitmhEwUBZ8vW0EUsEfe1nqRkhpRYcT+63rWgffpPoP8wR96fMPrkfL
	PdIz9cn/XxicoIlkzoe5wrCgySytujOGxCgQAyGyhpiYGwiK9oCVoNagbFifDm0I
	N7u27EPH4uJjRIfXlg9sjt/7NHS92QxhfgeQUnG3tW5dsQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6v7mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 05:21:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba838c5ff1so3534365ad.3
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 22:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778044899; x=1778649699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pBdh4/JvYKUMPV4XE6EJA/hH7ueJ2klFaJ8ONNXBNbU=;
        b=Ji4Be3K2NmxMRSrhmoQX3hn8tfErQMdMA+oqnGCdgx/q7xz/damWldCVBhKttkLrk0
         sLVd+a5YmziaAl4LEBDReRMPq9YZ/fDc3BDV4ArRFq3bdk+iHB1rSJS7Ekd3y75XLHc1
         3D1dXXMIXeI3+pm5QuUgzyuhI2leapFO3ERTxAkDd5Mp2plMwEuza1p5fCYdScvqusur
         1oYsTlFVl+X7aTR4m5pROmPEn3B5rq7q1ncmLvyuJyOwW1myTSfUoC1aX0lN1c+4OhWq
         XryC9Y1Qvl1LibH2e0FDYFeS4ndNnorjPO6e1gLwFjXhM5zS/GBvtWhJePgJNaggYSSZ
         pVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778044899; x=1778649699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBdh4/JvYKUMPV4XE6EJA/hH7ueJ2klFaJ8ONNXBNbU=;
        b=phR9LvBjZM+oqUq/eEnOawjrxr3S5QnBsaqJwO6jUrSs8SnyGbzfRIrkPvWsUg3Hki
         DcLmE6gGDyEBcJ/ea19EoUjh51qm/XoGf8fuqAjKy2i1JlerCN3weKLcl2ojA/FFEB+2
         /F6LS1vd+QT9l0gzd2IvHQQHdWJBrLWHrjdaXfVuJH6nvQwTNrVeavMycB8QDcEophBx
         9xMgk9Knrg7GlcVpuaQ5c9y9+8QHL2BeIsBUPXbn9Fmp1CSQ4pzm1O+NpnqfhHrNKNSm
         r4XOwRSmqGHO+ebN4iBFQXlaJuMwEgfpYqZzH5vceDcyqIFiQHtA22kohKNv+mpirX7d
         3/ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/AWNsW4ERLrxULQ0dQw+C4CDFqBHHtewXgkYXvUTIggXUXY+MA2MrNjRKn9RU9ffvWKHE+yNIJ4G0DHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWKUZzqJiUuAiyo3wdKKNQZ6iP0Jq/82TWwUn28e4WhdOXBlkB
	RbNoYl2DzZYEfpxU1ewu01NgGrAWlZZYP7VP/yxZgPBWBVvyrDUg2UFCy4+dvms8+fNmJ9uIaJQ
	DBq8ZFlLhsoXnIIigazWQRPe+YyXna9eSojPV+IEBQkzKCLQxxb/0qhtyrD6XUF+mNQ==
X-Gm-Gg: AeBDiesp/b2Xk91FRis14wT1UYYAkAgUlEOoLeLjWStK1uVXOzIpjNsT7FXPkilvOwr
	Yap8X1aGZCzqEytju/gringnsOrI9kw9iEmjdcvXUdTL23uGqCt+GeQLKvIKsq459nV6HM9OwwS
	crrrdy7MRPlp1n2EDBVp9TxbmxUuz2PHX0GIKwlTC3uRbTm6FHJmbldS+CO4MQ9tzAAl9n9m5Sr
	Yj+YjjRtewCwpXxXTQHkJ9gL9dsqRuyf+/jJAsiUxOj7H5dYubWo5wKeCrDQeY8sL5kyuJAR3uI
	CfabLuW71A/kd90hnfQtHUbq034hn370H7tjhKTuEH+Qjl8QPRD1HBgyzJp0Pu0sQ3xokgCG/F9
	bzmwlFZpcJ4RAnbtIyf+Ue4dGvJgqXQg50LeQTZYSexKqt7CsCJ2uW7fkRtk=
X-Received: by 2002:a17:903:1b10:b0:2b0:bebb:1081 with SMTP id d9443c01a7336-2ba7a20ce22mr17270255ad.28.1778044899059;
        Tue, 05 May 2026 22:21:39 -0700 (PDT)
X-Received: by 2002:a17:903:1b10:b0:2b0:bebb:1081 with SMTP id d9443c01a7336-2ba7a20ce22mr17269975ad.28.1778044898470;
        Tue, 05 May 2026 22:21:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7ca3bff3sm10280225ad.84.2026.05.05.22.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 22:21:38 -0700 (PDT)
Date: Wed, 6 May 2026 10:51:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH v4 07/13] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20260506052129.4kahdrcxxrvl53hy@hu-mojha-hyd.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-7-17571dbd1caa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-glymur-v4-7-17571dbd1caa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA1MCBTYWx0ZWRfX65/TNAIOFegr
 Z49J+Vp4Ld3dknr4axr7/HcFa+aYp4w9H2pu/XNvE3eW0aHiRZS2+9IRQFVRO01vD5Mso8ezmuG
 BCBZOCA+RqqBxoAHZRQ5Liou8rcyjAPWqISoSw54mrB4gpoiBCA+mG/UWouUXbN6HQ8JJ5OS1S6
 6N4zVCvKycEDV/GJgCqHCjXobKN3YeyfZuU7VKQAz3pUQVU4pionmRge60SO5RV9DWEjQxVFBsv
 E0ffciueD3578Vsxn5seaHA0n0g7/f/fSg00Nzk2rSuNTPc13Sahn7FVqvrdQ9Wr8s8z9W5WD3E
 dcWdUcEVndsCSFw1UgI5NxuGxnZHK3VOFvWVI5ozH16wCRwm5gHUu1w2dA7PTTZYaI2Kpl6q3G7
 vh3Gl3mwMaqI/O2nZ2dHjgZPyoHDZYT00zdR2D9WYdtjFVxrBwcqQbW76X6LdMf3iGAjOSqPzEp
 oai1AyaRpBH4pL73LEQ==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69facfe3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kdmdhyyA-vVXd4KnKA0A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: b_T0wY3Khg-Su_5hnJohkkSUdKmw36yS
X-Proofpoint-ORIG-GUID: b_T0wY3Khg-Su_5hnJohkkSUdKmw36yS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060050
X-Rspamd-Queue-Id: 895664D6471
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-60508-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, May 05, 2026 at 12:29:28PM +0530, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> or QHEE), which typically handles IOMMU configuration. This includes
> mapping memory regions and device memory resources for remote processors
> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> later removed during teardown. Additionally, SHM bridge setup is required
> to enable memory protection for both remoteproc metadata and its memory
> regions.
> 
> When the hypervisor is absent, the operating system must perform these
> configurations instead.
> 
> Support for handling IOMMU and SHM setup in the absence of a hypervisor
> is now in place. Extend the Iris driver to enable this functionality on
> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> 
> Additionally, the Iris driver must map the firmware and its required
> resources to the firmware SID, which is now specified via iommu-map in
> the device tree.
> 
> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

I have posted https://lore.kernel.org/lkml/20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com/#r
for resource table extraction and the API to map and unmap and now you
can use the api similar to below
https://lore.kernel.org/lkml/20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com/

> ---
>  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
>  drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
>  2 files changed, 66 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index fb194c967ad4..b396c8cf595e 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -34,6 +34,8 @@ enum domain_type {
>   * struct iris_core - holds core parameters valid for all instances
>   *
>   * @dev: reference to device structure
> + * @fw_dev: reference to the context bank device used for firmware load
> + * @pas_ctx: SCM PAS context for authenticated firmware load and shutdown
>   * @reg_base: IO memory base address
>   * @irq: iris irq
>   * @v4l2_dev: a holder for v4l2 device structure
> @@ -77,6 +79,8 @@ enum domain_type {
>  
>  struct iris_core {
>  	struct device				*dev;
> +	struct device				*fw_dev;
> +	struct qcom_scm_pas_context		*pas_ctx;
>  	void __iomem				*reg_base;
>  	int					irq;
>  	struct v4l2_device			v4l2_dev;
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 5f408024e967..0085dd7ec052 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/firmware.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/iommu.h>
>  #include <linux/of_address.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -13,12 +14,15 @@
>  #include "iris_firmware.h"
>  
>  #define MAX_FIRMWARE_NAME_SIZE	128
> +#define IRIS_FW_START_ADDR	0
>  
>  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  {
> +	struct device *fw_dev = core->fw_dev ? core->fw_dev : core->dev;
>  	u32 pas_id = core->iris_platform_data->pas_id;
>  	const struct firmware *firmware = NULL;
> -	struct device *dev = core->dev;
> +	struct qcom_scm_pas_context *pas_ctx;
> +	struct iommu_domain *domain;
>  	struct resource res;
>  	phys_addr_t mem_phys;
>  	size_t res_size;
> @@ -29,14 +33,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
>  		return -EINVAL;
>  
> -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
>  	if (ret)
>  		return ret;
>  
>  	mem_phys = res.start;
>  	res_size = resource_size(&res);
>  
> -	ret = request_firmware(&firmware, fw_name, dev);
> +	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, pas_id, mem_phys, res_size);
> +	if (IS_ERR(pas_ctx))
> +		return PTR_ERR(pas_ctx);
> +
> +	ret = request_firmware(&firmware, fw_name, fw_dev);
>  	if (ret)
>  		return ret;
>  
> @@ -52,9 +60,27 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  		goto err_release_fw;
>  	}
>  
> -	ret = qcom_mdt_load(dev, firmware, fw_name,
> -			    pas_id, mem_virt, mem_phys, res_size, NULL);
> +	pas_ctx->use_tzmem = !!core->fw_dev;
> +	ret = qcom_mdt_pas_load(pas_ctx, firmware, fw_name, mem_virt, NULL);
> +	if (ret)
> +		goto err_mem_unmap;
> +
> +	if (pas_ctx->use_tzmem) {
> +		domain = iommu_get_domain_for_dev(fw_dev);
> +		if (!domain) {
> +			ret = -ENODEV;
> +			goto err_mem_unmap;
> +		}
> +
> +		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
> +				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
> +		if (ret)
> +			goto err_mem_unmap;
> +	}
>  
> +	core->pas_ctx = pas_ctx;
> +
> +err_mem_unmap:
>  	memunmap(mem_virt);
>  err_release_fw:
>  	release_firmware(firmware);
> @@ -62,6 +88,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  	return ret;
>  }
>  
> +static void iris_fw_iommu_unmap(struct iris_core *core)
> +{
> +	struct iommu_domain *domain;
> +
> +	if (!core->pas_ctx->use_tzmem)
> +		return;
> +
> +	domain = iommu_get_domain_for_dev(core->fw_dev);
> +	if (domain)
> +		iommu_unmap(domain, IRIS_FW_START_ADDR, core->pas_ctx->mem_size);
> +}
> +
>  int iris_fw_load(struct iris_core *core)
>  {
>  	const struct tz_cp_config *cp_config;
> @@ -79,10 +117,10 @@ int iris_fw_load(struct iris_core *core)
>  		return -ENOMEM;
>  	}
>  
> -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> +	ret = qcom_scm_pas_prepare_and_auth_reset(core->pas_ctx);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
> -		return ret;
> +		goto err_unmap;
>  	}
>  
>  	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
> @@ -93,17 +131,31 @@ int iris_fw_load(struct iris_core *core)
>  						     cp_config->cp_nonpixel_size);
>  		if (ret) {
>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> -			return ret;
> +			goto err_pas_shutdown;
>  		}
>  	}
>  
> +	return 0;
> +
> +err_pas_shutdown:
> +	qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
> +err_unmap:
> +	iris_fw_iommu_unmap(core);
> +
>  	return ret;
>  }
>  
>  int iris_fw_unload(struct iris_core *core)
>  {
> -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +	int ret;
> +
> +	ret = qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
> +	if (ret)
> +		return ret;
> +
> +	iris_fw_iommu_unmap(core);
> +
> +	return ret;
>  }
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

