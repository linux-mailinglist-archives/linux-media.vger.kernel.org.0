Return-Path: <linux-media+bounces-58748-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGy5GHZb3mkyCQAAu9opvQ
	(envelope-from <linux-media+bounces-58748-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:21:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 633983FBAF9
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 587243010821
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 15:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D043E9296;
	Tue, 14 Apr 2026 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXyQm6dq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnCQLQ0R"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A712ECE91
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180026; cv=none; b=sdPFhu7kuHkwamB9uPg2xtKUa7DYNoBzpEhtY+H/gpzLkbj9vaKf+m8DLWbgIMv8rGzCrEk2RZOvLIhpaI9Of6Ol2DmZ7TvsI7iNfr8TJ94pDmoDCIIU4n1g68cMiU/09FYjgU4Jg1tzKttzU6z807QMqQkoVOclqkgALc68T7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180026; c=relaxed/simple;
	bh=ZVhgbifAln2OzcbNbG8e+t48xa3IPnq3A4MkqBC2ucc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYdkvhmorYe/I8BZ7Xs3IougSjmWQxqTtETkwFpwtvgdUnyT1w+ybiUi9bzQFT3w+fmW+i7MrInhyjz/IyJ4iuBUnY/4iUKivUUcjN1nbQ3VYWpyNQ7cUX+9zs6bQ7F5gj7eQOIv/J/qzcHyTj2X4IEgLBz5gFJKzs3YwZ1pqx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXyQm6dq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnCQLQ0R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBrt1e3681505
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eRyLpOe3BxkDfC/79y4mRDy2
	zo6Mqv/lVSOI/jQ5RBo=; b=GXyQm6dqs3c2KrXG0JeQqKuLblcaKvc25vRLgpdB
	p/hDom/XzWvcBuES8/K4MQjLNzj55AUP15ebX7HSketu3jDDHJIotKgl/BH1UeKW
	IQFDj0Hn1xo04LEqA9ZbEHtSCOiq9JOFTfH/kKLj7zcyBf3hHiZWEanwLIxB8GG3
	I+5kY46iJPqpYoX8PYicVau1UDbgvRWEg2R01CDOjkrp3IZhAkcbCkqyD7nPDJpc
	ZTZmm/ZD2LQVbND8jAlkpcwHqHLSY2k3SQznb2YAtXS7OK/i5Km0OmlgTJ+59Mz/
	pURjQBAanOS+FhWWG9dhijMCSmCxzjOE6/LiKekIYcw7CA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d38y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:20:23 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60ff08dfb37so1298921137.3
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776180023; x=1776784823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eRyLpOe3BxkDfC/79y4mRDy2zo6Mqv/lVSOI/jQ5RBo=;
        b=RnCQLQ0Rv1+QmUntSt5hd1ns0o6FnDGOdMSOgML+n6+gPL+XHRTajgQOBjrsXb22g7
         F3xDCoxW5gw2uQMwaRtBnqcCTNWn/jY07UU6gRr79+ElVc6ctEQzxcnT+K9BBtxLZJGC
         n89JQVNLzos72qsTV7eRfLE0eyYc0r/Fgzk0A133Fl+kcj1U5VX+sGkGoEUYUrIgtXY6
         Pd+L708lqmq6y4uV1Pt4Pdv+Fc19plTHwA7o+cKFoCQYuXBYDuFSVTv+V61794sv4Bw6
         WqJHU23HprBWBpij7x7AvGhqMFF0E7p7GMrgBLIyv6QoSrypYXtTpXOyotZNjFR+wUTz
         /+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776180023; x=1776784823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRyLpOe3BxkDfC/79y4mRDy2zo6Mqv/lVSOI/jQ5RBo=;
        b=GOM9cVZDmHNugCsg+XHIq2YzB6VZ5xNZhdhH73O4rS8c96QQ/sXGufh6jS9LJTBCE/
         UFGxBbqGbtkgqURyU2D5JnVpDr4drxEEMsOovwsy3buFI/OaGvODExxKG7RgFJkuGxRS
         KgMvWgDLUNhK29DmtAakHsRWSJ/vStUvIhDuIIQOqsijg9ir9JKer9qmj2mnNk6W+2aK
         Fz94k+MH69CKEagCIAqA8iaTJT6dDg9IwjV3WNQST5XorhykuxZcxO3uhAe7bGwGVleo
         0I1A8XCqsPcpEhxzAk+pHmDbkKtG4Yo+CtDE8c2dpiBl15u886zBn9zwTwqguvuxH9uT
         wZPA==
X-Forwarded-Encrypted: i=1; AFNElJ/dNL6BMEzmfIpozndqVkbtvRL2S6Y89PiA+gkfWEO/Zr7n7+kYK3B9t50hKPSgGXjjBYB6tWCI6pQePw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiFfvys239NBdWZ+UrScQTjjbJDyT7srumYh2a5wU9vtxWzIMR
	xguYpwJMzdx9Snke46FTsQY4wOGT5GH1mp08PxOYLGh9itNxrdE/w4KCF2e6kj3+CTpsdxu8RKW
	uGOylbHIyKi/80kMNFT9EbJ7PW61+joXq8y5aLuDinV8IC9/GaCAP5FdEtgrXfE32EQ==
X-Gm-Gg: AeBDievjEKNCLqM4vsgTTmU+WzQhenTbMJbuecwB0WxZLOHLVuo9lokGt/90lNQcJzQ
	aAoZwh21YZiQgP/XzeSC8ISO9VSdzDuD+Pu0Z8Da34sPV5pJVFWIjMOprm23TFcE1fIcBdCB4yA
	cFC4BZKNozj/jqNv7PWrm5F1P9KQKZERTq2CpIHM/7ELOzVa92mMExL738KQFYMpz3zPz2UenxX
	pZ3gNYu4nAwsgosxET3F1bD1ScFDAVy5OBcG+BNKfPHVQHNDYXU9ny1dr+dwq4inle8trd9HTyn
	nSmLx0ydDScQpAwpbox3LderbtYA15UhiLIopiU/aAgFplYC6FxQ0yznFHMMM6S1z4RLdwDjfY6
	gSs47cCYkL7yvGtEigYK97hZqph+Ue0ytL/Pw3gwMF3gO05YHtcqtkUn47Sg7faI88b1UT+br6V
	5Nde2vLAPU14wlOjTyCN4TQCQb6Zi7ZKhuJYlseKIFIpij4w==
X-Received: by 2002:a05:6102:5e8b:b0:608:759a:53bc with SMTP id ada2fe7eead31-609fb5713bdmr6999527137.0.1776180023197;
        Tue, 14 Apr 2026 08:20:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8b:b0:608:759a:53bc with SMTP id ada2fe7eead31-609fb5713bdmr6999473137.0.1776180022703;
        Tue, 14 Apr 2026 08:20:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8657esm3314870e87.12.2026.04.14.08.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 08:20:21 -0700 (PDT)
Date: Tue, 14 Apr 2026 18:20:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        stable@vger.kernel.org
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
Message-ID: <otikvdonnfakykra57z4fingdyfm7xebw2h3lmykzk6sbk7emq@xptiwpx5lvjl>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MyBTYWx0ZWRfX+/1VI4fLQ5+Y
 /Z9vKvPMvUVubJHcR5W4IHPOmf677ww73mKfUs+jzooL7mW65JUk35FSBh+14SgKYX1D0d3+AvP
 eFZDW1u3IYnNTlALnkGNemcaD2mz968jBGOBG2BHBwWS6pk31fTu8INOGmRGH3pg1ddEizj8jfu
 13zrR72jzEn+b5I+Dr1gZ8Ie7rL4EbtJ1Trpxny/75FzB5Og46+pi/k20pRp28tg5/Iv0QXZkeh
 r4yxaGYI8TRXCBTiBGzIfe3PIGc+cb7XFqZzQl5a3cZek5daxwwcJmGC89pmNJfhQfQgACrFISj
 TT8mGfmgnL8JApSrfvjDNjpJmfpwqorF1da4P/H+9CP6JSV7lf7kdvqzkQqGBD3MZQUXyNg7AZG
 uNK5cpj6B/SCR0sXlQ/o/CPAJLORJH8VmU/1nhDJgfQ41lfnuAHClryWd9igUyJY59mTFZBFho8
 hP7C54HbviPsjZsjaEQ==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69de5b38 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oTq01oph0ifE-MoszjAA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: dhgtxKlnh7m56eeDnJu8WmEzeHSDYYKO
X-Proofpoint-ORIG-GUID: dhgtxKlnh7m56eeDnJu8WmEzeHSDYYKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140143
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58748-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 633983FBAF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:30:02AM +0530, Vishnu Reddy wrote:
> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> the number of virtual machines (VMs) and internally adds 1 to it. Writing

Does this apply to Glymur only or to other platforms too?

> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> remove this write to leave the register at its reset value of 0. This does
> not affect other platforms as only Glymur firmware uses this register,
> earlier platform firmwares ignore it.
> 
> Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 548e5f1727fd..bfd1e762c38e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>  	iris_vpu_setup_ucregion_memory_map(core);
>  
>  	writel(ctrl_init, core->reg_base + CTRL_INIT);
> -	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
>  
>  	while (!ctrl_status && count < max_tries) {
>  		ctrl_status = readl(core->reg_base + CTRL_STATUS);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

