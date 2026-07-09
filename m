Return-Path: <linux-media+bounces-67154-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jOVJBFCcT2oalAIAu9opvQ
	(envelope-from <linux-media+bounces-67154-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:04:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7967315C6
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:04:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qw7ua+O+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="CA1/HDe3";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67154-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67154-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE11C304AA30
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E582625B084;
	Thu,  9 Jul 2026 13:03:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422C52472AF
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:03:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602221; cv=none; b=N4FvcOzzyWC1dIlLhM4qoy2pSqOmjpUwJo+EUSYsmfoeC8nujjYY6QN1+ATEX24j0MAsM+eMjyzXVQYAYl4DIFRj3ERS/SIav/9t/TqrZ5O/BslmtQz6gSQOJvzwwOQALdtJ7+o2uRw1N+LwNidEa6q60Ie5cwQBXTwDrlqo81U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602221; c=relaxed/simple;
	bh=WnckAIHlaTmAFvP6s1AxpeWPyK4BmV81YD7bCW8Qmuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPScdIyXsvdRhla3O7rD6q+yFSjEyTdb8zPZXhCTeLg0w7lWUc9B+F0IQ0nAp18D22MOwW+DsKM8HL3OA5ysFXagQxFN38FU5i58NNYJPSAy4iid3ZWaEqQ8xhsqeUYxnmAfCtsUQ4FqowYDJkvYJltK5UDWF6UT+UQjPPO/Nlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qw7ua+O+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CA1/HDe3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNNYe1488881
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6hes+AyfmlrE00EiSFN67s5z
	YH/93a114Q8pXjrH7gY=; b=Qw7ua+O+UB3grvP+67fYmPnISpR8ncdbPMkGqkdF
	QUdqZDCzWKWoWeJAaby3Gic0piPCsP7cOB9cIOgyxDkGeUwzQpCfviJntm3IuQmg
	wl1dSOx0btaMqZylZOY2UUCqWqs8fqPXoR8CTQXOXUh8St1qncbKPK3eR2IYP0MG
	HoDBmROOcjC9JUoALmWQixEL/EvVUkZu2zNJAzZoxjHgcyfcN7qNLfsHHkA+pgRh
	T8nO5tB2ggpTK4khhUnQtHQvGGxzoqacwv38pvFcb0WCANIVXL+jtsAZqYcd5JHO
	RbXDD5KeNC5sltWs5VJwQ+Ez1AfyuE7DWsV5hE5QBUrwkQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfua65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:03:37 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a18bd9c3caso2345862eaf.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602217; x=1784207017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hes+AyfmlrE00EiSFN67s5zYH/93a114Q8pXjrH7gY=;
        b=CA1/HDe3EXjLiJcAiu/7vAnnkuk3CZIzsmTjCWhcyqJbb7lQGDtTFIPrpACtu+jFYF
         ONb/p/8RaEE2vFmNIGYWbnwmAUuM2TBNsMAxxlx3pxgS66VV1+835HFSoazn/aFPUOvS
         Cd6tGALYdr1mpDqd9Vft8FT4If4NKSWh0ANWixkeIv8wUp7H4G2sHyHlxo+skCNKzWay
         1XjXABCVwKoHoB4exBhttLiaqRBCWxlVrBu6YV4dwxXOMPH7hpltCRBmc4jl9DO/bR/A
         Va9SO15kPGCuaJN5p5dJJKmj0ZX6kBKW+FMUVPErUL+TzZOCT+qZXmdATXbkH3YqzJO9
         R5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602217; x=1784207017;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hes+AyfmlrE00EiSFN67s5zYH/93a114Q8pXjrH7gY=;
        b=DMRLq4KTHu640dL8jATMU0shKuv7qjjo/GXqk2Zqme1gVtDOMNNRNWQylks+cbagow
         1SAJkuZTsHYoRuasf/Zt1m/vMsv/DFixyfs/c25fKG5v/w+176tfRMvv/hPOWpgmpC+m
         3vKg0Wyxk6V4k24Z9Rfp5LvhekCVCjD6+F+ChVSBrxeilCjF8r0V1yssi2AQq2FMuW00
         s3inJ6yoQO3fsEYDe/nK0YZxGb8SRFp7NREDMTXIal3w2hfNDRQFuXVIDJC/x8La9QKX
         hjzqEw3oBJxbs0IbjCvtWd/gO9P4C5HLpSZuzMN+wxp8pAk6uDHaxcOTf/Gc6mrAieKc
         Yz8A==
X-Forwarded-Encrypted: i=1; AFNElJ9tp3p+D/IKMNk4z3xPmuvfQWooMFvWAc7pZftW1ixKb4UwnvzT32DeP6UH7rYMEqeyHwJ+p8Z7Q597QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTnisy32eLtsHU3EKPGpG7vhIkARYWvzg+J0EiDDiB1eU11fY6
	oNunEO1ARGkN6by0p5G1IwZnSYCphd22nMvjXaTNbq64oVF746rIMHe8EiVwjHKOMRnHXMGpoNZ
	mgbtO5a9EV5kZ2sVYr5+HB5viVRX8W6a8eAR/eb3NipzElyiS8Q2r1qDuXi7iNaZPnw==
X-Gm-Gg: AfdE7cmSJksYFD9SNbCHCsauljJHgSivFLGtN4pZobu333gqdRSnjn+xRgtG3scgXam
	jasQQwi1sZgTZAB4cQZldxzNjmWujBfbczkDdaI9pTMVzZ6uUOZI8O+bXk/DhvaCxNf7zispTrE
	gNBIjL38yYiMSaZ5mbpHVce3HF9ZvuirlB6WsNTqpudxkH+fDcJPu46MoXnhXrIZXBm3r9venM6
	ySG4zccaosPRAmOevQCvG5fN83hcxbrj376jemuEEayoBVW0NQiGYpE16YKpUEwdOf0L8VYcrYT
	7DPBGBpJz1rKTrDt1cVge6mf/Qik0eUmGzL+uIqYvgk+GGGr7JyN9bzXROash4fcRWUWzvcVyeH
	8BYkr/Upsbm82phKLbGhN3AkUV6Wxi1Bx4dPr6aAQKJwGFVeyhIIUbXAdE12RX6ksqrmUcBT1Nn
	MlzTePkP8V7jQ3TOktgnnLttco
X-Received: by 2002:a05:6820:2d42:b0:6a1:7644:772f with SMTP id 006d021491bc7-6a36da2e65fmr5613938eaf.63.1783602217185;
        Thu, 09 Jul 2026 06:03:37 -0700 (PDT)
X-Received: by 2002:a05:6820:2d42:b0:6a1:7644:772f with SMTP id 006d021491bc7-6a36da2e65fmr5613861eaf.63.1783602216506;
        Thu, 09 Jul 2026 06:03:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849180ddsm3055701fa.3.2026.07.09.06.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:03:35 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:03:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
Message-ID: <3t76ahxtn6e7rhxzxtwhbgq26tdztgfow5kh6lxgtmtr7mucxh@dydqcmawo5g2>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfX/FtdwHlBJoaN
 3KU3JJXaruEMezhJH+lu7Gokazw88Bs2p1+ZZXvF3utKkxhS6p14HSlxc3QdVniKxv0DpjZKlZy
 Us7UiDOTmc3up5Ej5fMx/qeS1x2o8m5GU5VXTFhG986OFfjhxEqIY4eV+1+Y2ltwJHATtOl2mbi
 4RvAypLqW9I4WgTsqlFrt3+K8HXq68oGOrPdgGvrix85D0W/PU7JVLKzOawqlIBA4CmE4I2t8Kh
 1XAbSBigWbY6LgoWqpEQKr1IbvQGJacbppKLWodsROGchhYpnV2bA4iaPPKLchyN/7VMQShggws
 /awKI+6bChQ/37bRyC2rlQqH2F6Dn0W9KK5JhXnl8vE2sq/LT7F4wmNX/okx7dwxNdJRxfrPDHf
 VGhYl1rf13zDsL8Sz5HGLmr1DVZG5+DmgukXvPJLI66LpQbQWSy2sa4P9Zut4F4FgBGh/Ho5INI
 mzfpsZQWqyjrv+hkUDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfX6oqWUIwjTadC
 xL4GJLQDai5rUA/K/V6Ellg4mdoCbNxfaV8ns881SRMMQPZHSjLsf+LQRwWhJBk+12zatsiAOkh
 hXPlQpLbcatSSDYJFViE/HpZ7/1fn/A=
X-Proofpoint-ORIG-GUID: 5TUuQylnmhA5DQy1fDQm_Azk216nUpVa
X-Proofpoint-GUID: 5TUuQylnmhA5DQy1fDQm_Azk216nUpVa
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f9c29 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=KY5bm7jO3qav85b11RkA:9 a=CjuIK1q_8ugA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67154-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,dydqcmawo5g2:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,gitlab.freedesktop.org:url,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B7967315C6

On Thu, Jul 09, 2026 at 06:05:53PM +0530, Vikash Garodia wrote:
> The Iris VPU has separate streams with different IOVA constraints. The
> non-pixel stream must be limited to the 0-600 MB IOVA range, while the
> pixel stream can use the full IOVA space.
> Using a single set of IOMMU entries for the Iris node does not describe
> these per-stream limits and can allow accesses outside the supported
> range, which may lead to device crashes. One such issue was reported at:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Add non-pixel and pixel child nodes, move each stream ID to its
> corresponding child node, and add a reserved IOVA range for the
> non-pixel stream.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 60f485a4892e062980d01f0b930af4b02f36513c..a2baa2c9f46dc19c3db11dc784358223a035475f 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -657,6 +657,10 @@ smem_mem: smem@ffe00000 {
>  			hwlocks = <&tcsr_mutex 3>;
>  			no-map;
>  		};
> +
> +		iris_resv: reservation-iris {
> +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
> +		};
>  	};
>  
>  	qup_opp_table_100mhz: opp-table-qup100mhz {
> @@ -5435,10 +5439,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>  			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>  			reset-names = "bus";
>  
> -			iommus = <&apps_smmu 0x1940 0>,
> -				 <&apps_smmu 0x1947 0>;
>  			dma-coherent;
>  
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +
>  			/*
>  			 * IRIS firmware is signed by vendors, only
>  			 * enable on boards where the proper signed firmware
> @@ -5446,6 +5451,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>  			 */
>  			status = "disabled";
>  
> +			iris_non_pixel: non-pixel {
> +				iommus = <&apps_smmu 0x1940 0x0>;
> +				memory-region = <&iris_resv>;
> +			};
> +
> +			iris_pixel: pixel {

Unused label. Also, shouldn't you specify the IOMMU region for this one
too?

> +				iommus = <&apps_smmu 0x1947 0x0>;
> +			};
> +
>  			iris_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

