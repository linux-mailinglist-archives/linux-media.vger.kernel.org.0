Return-Path: <linux-media+bounces-55024-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DzeGcRer2nsWQIAu9opvQ
	(envelope-from <linux-media+bounces-55024-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 00:59:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E76A242C82
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 00:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2CCC308A40C
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 23:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F413C396D01;
	Mon,  9 Mar 2026 23:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osiObXUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvvGTweF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3E3793D7
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 23:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773100728; cv=none; b=am3kuZOzgBBc/RuIw3mg9aKYwgbaNTRwZs1By2VWIz0hQa7EgYNz2lqZn4AAoXfEjogt3he9u1XjODA29tlNIe2jB1Tc0yP6at9zqpVvRG9yueS+F+vfZnJbOLfZrij1Jtfe9tVSgUBFZcsdYQ+rbxrVOU4w10xSXEG+OyQlB2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773100728; c=relaxed/simple;
	bh=zJyyExCogbWwjrUB/yLhejui605wOGNLWsINalKksco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7X4Jq/ZBANBCEA3e3iYYhM9NgTNmZXQk7siuDOUH36Ee0kFTYwbRu9xAibNMA6bVZBbwhnKi34ZiXCI0c0w2wl++O3q+V9XaULjIQlNkoKPh7XkalowyxRUdex7NU2kgXKVVCx7QU+Y1TRbNc4iQ5IIX37jAf1gDkhUZ5FiTI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osiObXUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvvGTweF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629JG06i2872860
	for <linux-media@vger.kernel.org>; Mon, 9 Mar 2026 23:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O6OyB6wITiTd/NdERGhiJjNq
	kDVKIeaS3m+zEnNywP4=; b=osiObXUIucpUf+4YjvXFdjjTkLzuCrWaG6b8f5Hv
	+RGCJsn1Ki6V6Lo0T3cH4ZUBMKArMb3NExxWDjQafDZ6tpcjOBjT51r6rq26aeWl
	Lekr8VjY6qrwILRC35tldCHjXVE5D9O/049V3DHUe0sozakKvJxWaO/bV8IBsC9J
	8HDIcyUYzPZ+M66moRcqM1ufa1sjtSmUU4Wh/lU3CGG+givkSeDZWizsKViAaHng
	bDTgG3mq0lS0ALzVJEOMAfs2ZFmtgJcIAQBOX2XNmQuH2wlO0Y14TZgrHsIDm5vA
	+ygkg7/FmWVsCESR6FKdv7IIjfKUH2jfyhTrCrfjwPanDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477gpxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 23:58:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509011403a7so187678661cf.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 16:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773100725; x=1773705525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O6OyB6wITiTd/NdERGhiJjNqkDVKIeaS3m+zEnNywP4=;
        b=fvvGTweFSWYMS6Vnd0RxmUJStydp3TgHWHIVnU9kgOxRDftLGbTSWUU78qGxugHJ9n
         kUQfrbFS6dJSAh20DrUSB/vd6fJ5dInLw5XbK+NpjcNFMLSwzjCiK8Hzpptvmmj2G3q2
         iX4GndgXWX3uzx9nNZ+dlWmEJiJYMq4gypb7C+n9dQUJVoVUa47eriAs5CfWx9bWMd0n
         iCX8q5nE9B0NQJDLS0MJYOFowq/I5YiBSVBV/zbsDyfOwoHvsFp6EKNtHbsasifThTBV
         5dPIe2adNvP80e8zTr+aMMtWDx8z6ZhammjgxJv3lPDJRAO7sK194zNEz9aBR5sbsJtw
         km2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773100725; x=1773705525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6OyB6wITiTd/NdERGhiJjNqkDVKIeaS3m+zEnNywP4=;
        b=XKM1O/orzxoYxWUeuIt1Ytxdwc2Zl6rAg8wQu3RHIDWTjnlhHVEGM/stOcHNxjSNLG
         p5nLBBNIAxtVkMKDqNndZOjVaOFfwNPGN0w4yZzUYhQe2tM5eq0AGmmwDaypDsCQaDHT
         00AWOE8sZLfrlGJVHaxYZjRAUE3XeOSqdIcYshMnRkeqb4M3xMMTjdzU7S0tENkq4Pra
         lGOvHrC5LZE+UNEqxvgjsj7FtkgecTDYXG+4A97Yydg0l2FyK1CY1xAVMYKZoyK2I2al
         JcYILmflLvFKGtX49X6/5P+TWW4vDSjwXQyMbPboUmF41Y5vwd+FH4qjFukKTna6lDcd
         CjGw==
X-Forwarded-Encrypted: i=1; AJvYcCVbhujBTKwHqHt/TmIKKklDENKlfnmC2bh5YB1/qeI7p4KnyWTfCoPOBinnMwC4/n0FNPe9/sSdwp4TSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqYwtIAKQGPx8PlpVDZHwhDw9VgFTFiBAzm4OyVJ3VgoX3Nuta
	wfPfIu7/aTOfHh9fU9X2Bb+z1AxKwyQ8O/iKkEIKSV/e6+bwttB87YxcWQl5MBFY/x8Jsl06j5f
	mkNAS9FdYV2BFazHT7O6cQl66xsAZSEz3+H4w/CLqJ1P09ZtK0Q+oMzHAtPZwH3tZxQ==
X-Gm-Gg: ATEYQzxVKdsw1Ch4TBvUnt5T0+dc0FunVCq82XL/vh4At+BslRVvrbZcS8lb8Jjikho
	tzSwjS+qvqdMnohHlvonDpbMBgvTsT+AulrNhqQQW/jV3C7Ju1uHtNLM3Za5DBdFQn2T1obCXyv
	OE392t6XGfO/xelNTtX4cqXHSTxRdKWCt756DZDOi1ozCWFUeSDT8uLOE1MzLUdXBx2vPCBnt1A
	IIQAKWnmmBTr8spBP/LVwydYH/yDkUhhjEkriW7Qzm5K76E7XNsPp+7tXM4D1Dw5FHuWa7/elCj
	mKWhuf9VUDVExa6ymYpuMWLzqNETWJ/txi2XJw4YroVF2zuzlAvWADahUMs/yqFDx/YFKVrBeKx
	2h4P765oosfH3QbG1WDgwuZKADAX1NfKjK9LDuqiVq7fds4bKb6u82XqYkv9vAcqddmAVLeKFe6
	yozRXDS1tIAPC2fkNjkRn04NjkU+vfRCYp07Q=
X-Received: by 2002:a05:622a:5908:b0:509:2:dac4 with SMTP id d75a77b69052e-5090002de52mr133102701cf.7.1773100724836;
        Mon, 09 Mar 2026 16:58:44 -0700 (PDT)
X-Received: by 2002:a05:622a:5908:b0:509:2:dac4 with SMTP id d75a77b69052e-5090002de52mr133102551cf.7.1773100724307;
        Mon, 09 Mar 2026 16:58:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08c1cdsm2463545e87.79.2026.03.09.16.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:58:43 -0700 (PDT)
Date: Tue, 10 Mar 2026 01:58:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] media: iris: Add IRIS_BSE_HW_CLK handling in vpu3
 power on/off sequence
Message-ID: <owwpmly6i6djvocnd2co42x67a3xd27kxem7x4hl462n6t6dv4@hpjljecmrlho>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
 <20260306-enable_iris_on_purwa-v2-3-75fa80a0a9e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-enable_iris_on_purwa-v2-3-75fa80a0a9e3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX17DQf4PtxUsT
 39SBvrvr7wI4L+LheTnfjbzUyU1z/8eDxEVI6gxIKXTvs3bOKFlcdUxZMJ2uy2SYV3r7LQIC8p9
 KYsK10nODGx5Wl3BaxRROwXLskPHTOaNztjlZN7rab2egMpMIQ7UeN6da0r7XogxJdDNqY5ydK7
 Rz+67gTNgtn8WgRCY919Jjn+yrIEOPcahI6yP+DmbZWxbKusXR8w0zXG7TlDm3xV+/PvbRII2vI
 GodAg5JB5RuRvNibo1HQyAPE/xJDJjmDtkJmCxd10EY1VpnWO/RWmcsnGGkPNyutDUA8ybEu+o2
 4P5NiBj6hZ3KmORqqq2Ij3rPUg5BkncofdK83IdjSiYJgh4GcO2RB5vpFEIX6R27Jd6Yoi4trqM
 gCvuJfKkH/ZPstRcfHI8G+f+Ig157pppeRyOBLmz/AUQOHV8TZ6zTvHBiGU4B1sPT+6rnNtJTcv
 Z9TFjMaqM+2TZrfQuuA==
X-Proofpoint-GUID: zhZP-CaEqktMESpbgvUHD0peWJKwbMeu
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af5eb5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=eU6U3Dr1E6bMOLEkkrsA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: zhZP-CaEqktMESpbgvUHD0peWJKwbMeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-Rspamd-Queue-Id: 8E76A242C82
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55024-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 04:44:31PM +0800, Wangao Wang wrote:
> On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
> the power on/off sequence.
> 
> The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
> of the video codec hardware responsible for bitstream-level processing. It
> is required to be enabled separately from the core clock to ensure proper
> codec operation.

As far as I can see, Purwa is a one-off. Why are we forcing support for
the platform (and for the BSE clock) into the generic code?

> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c | 55 +++++++++++++++++++++++++--
>  1 file changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index fe4423b951b1e9e31d06dffc69d18071cc985731..3f9e67604ef6aad773837df584362446052e34c2 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -27,6 +27,53 @@ static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>  	return pwr_status ? false : true;
>  }
>  
> +static int iris_vpu3_power_on_hw(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_hw_clock;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_hw_ahb_clock;
> +
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
> +	if (ret)
> +		goto err_disable_bse_hw_clock;
> +
> +	return 0;
> +
> +err_disable_bse_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
> +err_disable_hw_ahb_clock:
> +	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
> +err_disable_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +
> +static void iris_vpu3_power_off_hw(struct iris_core *core)
> +{
> +	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +}
> +
>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  {
>  	u32 reg_val = 0, value, i;
> @@ -68,7 +115,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>  
>  disable_power:
> -	iris_vpu_power_off_hw(core);
> +	iris_vpu3_power_off_hw(core);
>  }
>  
>  static void iris_vpu33_power_off_hardware(struct iris_core *core)
> @@ -131,7 +178,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>  
>  disable_power:
> -	iris_vpu_power_off_hw(core);
> +	iris_vpu3_power_off_hw(core);
>  }
>  
>  static int iris_vpu33_power_off_controller(struct iris_core *core)
> @@ -262,7 +309,7 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>  
>  const struct vpu_ops iris_vpu3_ops = {
>  	.power_off_hw = iris_vpu3_power_off_hardware,
> -	.power_on_hw = iris_vpu_power_on_hw,
> +	.power_on_hw = iris_vpu3_power_on_hw,
>  	.power_off_controller = iris_vpu_power_off_controller,
>  	.power_on_controller = iris_vpu_power_on_controller,
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
> @@ -270,7 +317,7 @@ const struct vpu_ops iris_vpu3_ops = {
>  
>  const struct vpu_ops iris_vpu33_ops = {
>  	.power_off_hw = iris_vpu33_power_off_hardware,
> -	.power_on_hw = iris_vpu_power_on_hw,
> +	.power_on_hw = iris_vpu3_power_on_hw,
>  	.power_off_controller = iris_vpu33_power_off_controller,
>  	.power_on_controller = iris_vpu_power_on_controller,
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

