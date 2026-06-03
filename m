Return-Path: <linux-media+bounces-63594-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BTcIAX8sIGquyAAAu9opvQ
	(envelope-from <linux-media+bounces-63594-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:30:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E93263810E
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:30:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ioiuzigx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TuP5kYQG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63594-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63594-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F98930DB29C
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 13:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5125347D936;
	Wed,  3 Jun 2026 13:21:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A7447884D
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 13:21:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492913; cv=none; b=h4GlRnZtpW7vNQmOEcEy/kPTOLtJpsvYSc/aqIOoUCzcsmmFZzXj4PasHFikPNmsfk+P2PHJRz4KsmGpzlvkkgjkLzSjNhYBwuZX1/AIgCoV7XRJkWgwL3PIf/TTPcjPBHBxyifmB2sOx+vDRPCczdY7gl+Zih8DSyplubd1vX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492913; c=relaxed/simple;
	bh=Y6ScvDnI3Ddnj5NK+rP4hsBFGEDd5ENJuZLnhmOHh+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsLa5NpbhZpum2luz//snjDXZ/6UMQs4qmDP4lTqCNRKz67ZAh6X8pETG90IfyIZGJyI9zUfAXIPM3AG6fBeQ6ptDLf9I6geIwJjP2ho+KHRZEsYVraLcSEd0cz0tCgPy1z3BisxgB/OBibkfslMby/z/SIMM84nx+rezAtzHb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ioiuzigx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuP5kYQG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395oSs780679
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 13:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MxuYYMI81SIcGX3U1gf3ulIW
	iG9ue60idPNLizmLiPQ=; b=IoiuzigxW8CM4vGBLpgO3QZLoVvS21qDHC3XgjJV
	n2w6KjIQqxUFQuqhpCBt5AzHuHY3Wj66vz9MqEXdsbMPi3w/GS7tVErVmfwSjSnh
	M9ec2cbzedOaOwhvLBb2NaANVfcHboCrXutbxx/coktM7Rr1DVxT7Qg5UtC7Exuj
	fnNBokCUkOitkzv2odN4B14ppGc98IT9SSPf7/aBQpCsGMnLWYVfA9vi5hTAMXQ9
	gE2ikJCwhIzKoNYxfzf3NlqSgKfkr84YUXUwYpWKKpMpZyvfoxD7P+qb5l3gczMA
	i+0zlqWVQGi7M70jU61TOB6dBMeyEfuKRpkHKxacJG/5Pg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb0y8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 13:21:51 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963eeb6f2baso2927221241.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 06:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780492911; x=1781097711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MxuYYMI81SIcGX3U1gf3ulIWiG9ue60idPNLizmLiPQ=;
        b=TuP5kYQG1mx10e3FmZbCQNbnVGSqPp+n6r36zCZDEIv3Wb4Md32wtqgMjSdxFNlMkT
         jS9lN0m6Aiey0sGjFZX7aru3mo2TMhGhe4XIEfynGgr4wsM418fUAf0QB3unZ4wzftJi
         PfOSM9Rhb2jzhPRWVMKWtgvi7vVEjYdt/Cn36B001o6/Z3GLvTpg7HCFF8eTqYa4QZ4H
         B/RGNzy90YeVFbQlO4DHWYmCPBQ0O5aJTF0+fqUKmpmW/Re2wHGTuPcA2xOxg1aKLJA3
         PljjnZLfoJEf+KYKsceHC3e7x1HkjtSggd+bNb05QaYcf2bWkeaC76s7aqqSuAU3ApId
         FOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492911; x=1781097711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxuYYMI81SIcGX3U1gf3ulIWiG9ue60idPNLizmLiPQ=;
        b=parDsPtO/2CazR52EQ1v+LXyd492tWWlERUC0lBAoPp8i3bIhPxfyMGI7Hjpw1cTSj
         H+qENecBxsy2gop225gYDL4e4VA5vl7e+adG00/uu1V4+zKppf/h+gJVhCQubhc3TfQA
         hBM3TYOUZbdPYmHVuaoPdpUODLBCafGRhOI20PoEJjeJuvt+AR+5/F4RUPZ+l8hqk2i/
         bySMrmacCbuLpvgxiNJnS32EZtKKMpPAxn7cRM5jBF9PzHCVj3lkzHos3+cZkBUZYiRy
         BhpjkRFYQkvr8XUwj66wuNZQCzJaQUgDzHstWsWimq2TCdvzFohh+lMgLFYMXj/wAkg6
         8rfg==
X-Forwarded-Encrypted: i=1; AFNElJ8sSC9rbiIEsSq0b1ZnBhtz2/cP0uOAWTrY7ubfU4Ceg1F6QzWEturSZV4c/mcWpxPTqTxmp2HkT8Cy/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ckfRjBg/33dFBfx5dp25RtCTDzY8cSkjsc7vSSiVg21p8iRq
	jkQb/lMTBNTMDSBQnU9uwhh0DPJ3ev8sTbAdUZtvEyDTgJtPOZ6dAMLNdGvIzGytirmIGT3X+7c
	4OJkinWfz+wSPkBQqX3zQ9kqKnU6rEJ0QnPgY55Jn57SHbRwPHWdxLLsRnikKHwpFfQ==
X-Gm-Gg: Acq92OElbg0qrMqgOBG+5WyQ9cpDl/VwD26ikPn9yGm81BOEouyYCmB6xvfxHAjKwGs
	ZEK/ZT8bHW/X/Kkbcjz+8g/tur3HlKUPhTzrekcv3dkNVkKppVbFAk/VwuiZScQRvxkOZx6BmzH
	Ag05mJmY7ehCy80tcaJnczCvJUgwEmPP9D4AXToTKo5/wrlc4qGqTIfugqZ3k6RBDdmPpFKTDPY
	666bwPwygDP00/bpChwEowkQwfLKqQSaspWayQmJXl1x6x9htcNjfr1TIwHIMKydNJvaq9gRFMC
	R6U7bgAarD4BO75u3Qwwh3P/Qj8F5nBnhkQCP31XrGevjnuXI1gyVOpwP4ixdfQPiFzfY5YYDr3
	BmgLZ82Q3QpiV/IHzmxQ9VBWY+FqFNMXUlq0UDkBWyPDpbO5tFEj/0NqyVgCtVDycVnCwd6FlVk
	uu2iWWv5ytxxfcZKHeGwDq40grBNU1m6VumEjD0cxUxjwH8Q==
X-Received: by 2002:a05:6122:311c:b0:5a0:c38e:6199 with SMTP id 71dfb90a1353d-5a6e3f99f4emr2032554e0c.1.1780492910954;
        Wed, 03 Jun 2026 06:21:50 -0700 (PDT)
X-Received: by 2002:a05:6122:311c:b0:5a0:c38e:6199 with SMTP id 71dfb90a1353d-5a6e3f99f4emr2032496e0c.1.1780492910316;
        Wed, 03 Jun 2026 06:21:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b0f5sm651785e87.41.2026.06.03.06.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:21:49 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:21:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] media: iris: Fix FPS calculation and VPP FW overhead
Message-ID: <mzjjwa3yhp4v67eyxopgnlsn5ujvhjrvlshk6q7gw4tx7cqe5e@cmbppnfbtxvw>
References: <20260602-fixbranch-v1-1-b8eccaad6d17@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-fixbranch-v1-1-b8eccaad6d17@kernel.org>
X-Proofpoint-GUID: -RlGXEGRhtvaRdI067E7yyIhwSJljenP
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a202a6f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=2PWsFjt7Tze8jpAMuKUA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: -RlGXEGRhtvaRdI067E7yyIhwSJljenP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNyBTYWx0ZWRfX3wfIK+CWREz+
 fvkEIBSJb8cw9fGH6C9cg0iL9vJno6HTKw5yhXaU1AEpiSGEvRmcR/ayusZQYpogBnQP8PVhdh2
 azrhQHu+2BEA005lmZka+pO50uvhzklUpqaCI0A2vkhK3aPJJpfooVAxEEyiZFWAdItL/0l3qDV
 BoHq6oUj3MOFVxbIk3JFYAVD4sOQrz/tszIov+9MP8CxvZ2KuU0MrwBKGSl0ooLOokxKTzsDW/C
 P8COQ0E6hTUhP/6kGaGjKPFYkZEystPN9FsZGzpWbR420QjyVmJvE46Lq+PFDTkfqsSIby1fRRA
 a2LGLvQTKwrgYDD92d4bjVu8PzK1PbLiWuivmUnTH8LDXOn90+jTSY4X8eRMzNP5k+iQ3scjp04
 gkrPRNL92Y8dSbX84oS8ZFkLkjsqbp5inIfTdhhfZ/B/Uxw4eIwdyqFFXWdwDEuw76OaVLEj6uK
 WN7uVEN9oD64PZGFqAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63594-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,intel.com:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E93263810E

On Tue, Jun 02, 2026 at 10:01:24PM +0100, Bryan O'Donoghue wrote:
> Use div_u64() instead of mult_fract as u64 operator division fails on 32 bit
> systems which don't link against libgcc.
> 
> Fixes: 5c66647a5c3e ("media: iris: add FPS calculation and VPP FW overhead in frequency formula")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606030132.qnBXVDkM-lkp@intel.com/
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
> Quick fix for u32 bit division error in -next.
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 5a85568c5ee1c..37dbfe433a085 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -444,7 +444,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
>  
>  	/* 1.05 is VPP FW overhead */
>  	if (inst->fw_caps[STAGE].value == STAGE_2)
> -		vpp_cycles += mult_frac(vpp_cycles, 5, 100);
> +		vpp_cycles += div_u64(vpp_cycles * 5, 100);


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

