Return-Path: <linux-media+bounces-61394-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI9gEq1XBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61394-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:51:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DB7531A6C
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13A7F30CEA2A
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EF0372042;
	Wed, 13 May 2026 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JH6A64rL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cj8ZNT5+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F410C390998
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669270; cv=none; b=FbgC1y6vUSWrizz46+mADdKQXC2MIFviW0tPDpw780VxwMhTutvzDPY7EUb+x1FbqbjPVhZwdUynem6yD/CplZBZyPmKnhpVLyRRwHq2OpZ0o1Zty+5Y17+6qYh2FfLNLvYEOzqInnElWqzBFEXQFJXZGttwiPUcan3OGpvHqms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669270; c=relaxed/simple;
	bh=/N7wD6EDn2QnmU4iofDKub/Er/WkLOeAxZr0xil5aXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmaavRP6s834mIUaTvRJZ9465qja55POO3V1CoI/25tPlOm6zEi0umMpka2xdTx22okWy+LeITOnsfN2SViP7eGm/kc8L/cMTv4MSlxxL1sLBH5Ome2Knu2+d+eXZAexHRsdtT8e6+1uXbW4thjjc4oc69KC1CFUW6UrCPOpZb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JH6A64rL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cj8ZNT5+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAGSDw2321233
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m4YRq/BGboedIrLtHZCID+NC
	xpsQ7QlOG035C9bl6jU=; b=JH6A64rLXNLzdwIJ9P+bK3a9z0JurehEF0gRaxXW
	XFueZuKyg/hso2X9FlGtaNid1kiVOqQ1OHEmgeIDzUoMiE88YunnpGae9D9Rqbot
	SqkoztxSyPsDjouT9xpSdG2cRSmQzih9OgiXwNJLzfq6qz9IuBmmSi9h5HdW7TBe
	X98339Ja7hPwa7QtFi/FfcqVOx+iDaGYLTcJr+lWwS0okGSHve23vp6+ZeIXugT+
	VKedoLs8RH7TBtcTUjtQfgzzvpseEULy+jOXIAZ1IalqTWt2wGob9wg9q66rGvrb
	3GNRWmO0P56nj+EtHY0Im6ErW8PN8S3CcYVJaUlpIrdmYw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgu9jju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:47:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc70cfbdso158434781cf.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 03:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778669267; x=1779274067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m4YRq/BGboedIrLtHZCID+NCxpsQ7QlOG035C9bl6jU=;
        b=Cj8ZNT5+SbNqGvQ2pXqPFyhYLHngPnSjDyLe3qxqVdM/CvEOcAdrgiY3XV8nT28VBm
         tghFL1vwEowgMyNgHgkEPOCwsQau+1mPOxFe8DFEwSD7EoVYVXMFyg+zwWtHr/UQjgoU
         OERZN/MNLpFZ7PuOO6A9cWI7K6WGfp24dJcX/p1NVLkdud5YUh+9e48LsXPy6kFPy24K
         U9Y2eODMovoyBqJKtSg1veYXYvxqsrYZBGWVGETosH17gGLcosJPQtKJ7oPQBmVjN9Yh
         aoTrMhTzwtVAjcGDsMw3on65u3arxJQGYiLRD9G0ZLNj27KVy8N0Onjn9oNCchFPN5g4
         Sndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669267; x=1779274067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4YRq/BGboedIrLtHZCID+NCxpsQ7QlOG035C9bl6jU=;
        b=eWx6Qp859SwdlKS7+l/yFuHmfNjp1eFes72hOicF6+emzIyIt8+ntfWBmdBg+nefk4
         e51MVl+4GFfzkS66sE2D5rO5TjVGU82DfbH+6tJk1CyhtctYqjftNY1EAvnLzc07mblF
         mkKmYnl+4knxOovdYjtxikxRCeIl2VlbyjAIyi6NzF7Y9Z2kBz1I68LtpvN3ZL7APWfr
         NFHW8gkZLGLxQa+sDIZ4ukY4ocAztds2bvNQKkla8GYXsZJW+7+jE8JUcvAVnjCl6ymo
         uATYuvdK4DiagGYgzxDTU4GhWE6IPoTHeCL4rXrS1Qw69j2uKI6c8pMktQ3sGK8a+4VR
         HAxw==
X-Forwarded-Encrypted: i=1; AFNElJ+ir3s8W+vp6MLBk9xn7kJCRYqMO2dlAtiwOReqGGoADQ5Cp6dde4qa0dHcaDaOmDlSPS0TzSosWusBCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVlJCsZHPsNR2itGWyVwn/CC9dQd6MM452e9uh/wzPyvp7XHjq
	AfmLIL75DljX+TVKJy6vqAaaOYjSScZ40MuLX1E8XvKnM/HE21VSzw7CRXQdu/Pu9u2+k4KSkUx
	aUAwMuiV4pfY1GcpuRbtce5sEri2Gd7krTB/Oy5J1BkP9epFcAhb5FmPOgI0v7SDu/g==
X-Gm-Gg: Acq92OEAmvdGrGtQB5btj8o+VZMFnKs8qOifpozghPiT5U0iOXNL2rHw4eiOa4fex+p
	YjFXrTrm+K9SJvaCxm459Kiwa8HREPMmRmI7DcQWOqI7VCjxDOxup5d0YLB2fGpUPfY0VbiHs2h
	80Fo5ZVJSgnocXHsfo6T1MtGcSPMeQD30RSztzMNQdQyO70zgD2fkMg729tgv9MJ5VBRzd9yLD0
	PK9D3qQQUymTCT85UDF2HhBPkEtMRAzCFkXYLsBh81OTcIHooFcCflL4wIGTUx/E96928wxHvqI
	80tum+mQvvu4s4+f6vAUaPjvExyYDDJNLjwqNL9uqjiikQWBy0cyYqEKRNI35gSVAUG4A+XQ0mC
	Sdj//rhza2G6C9O0We4nB09TeBzyediwxCp5iEbXcuGaxtMMRk05+ZEVmYN/ncdCYuP+F2YfCz1
	qXX4+A40fQAl3UrMBbm7Z9zOXvU0ogUjZVOgc=
X-Received: by 2002:a05:622a:1a94:b0:50e:5a87:6c0c with SMTP id d75a77b69052e-5162fea2b7dmr31961511cf.24.1778669267296;
        Wed, 13 May 2026 03:47:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1a94:b0:50e:5a87:6c0c with SMTP id d75a77b69052e-5162fea2b7dmr31961331cf.24.1778669266911;
        Wed, 13 May 2026 03:47:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18d50sm39593771fa.4.2026.05.13.03.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:47:45 -0700 (PDT)
Date: Wed, 13 May 2026 13:47:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
Message-ID: <zw4uy27x2twktstoryf6w7rldgkzymajtqhxpg4ri3rnwicpug@nwtnvbrsc2hb>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a0456d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=BOoEFep4dHZxpVTRRokA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kGBobeLy4vdkPLWBKMxbj58YwtJ6ee-D
X-Proofpoint-ORIG-GUID: kGBobeLy4vdkPLWBKMxbj58YwtJ6ee-D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExMyBTYWx0ZWRfX8RLmx+nvQ6CE
 uzq1HEOXqR2VAR/BaTlmakC2JDvvgu/DsucOeIRXL41Ciy8t/Jk3iFMWVJsBOrDMTRmWBIrQx9I
 P6HevD7kZIU6DSX0V/aWUnuHcWLQRDbvOduOaE2/WxzKbnuCU1CVgjhmY7mvGn6pITa90iE79Gk
 AjFIssYea+CqjRoPYO8BzY57JlRQ7y8q4aYROco8bjEZivHMyOD4sTI/4AGDi2sfD7kJ3PC6qPh
 o9FP9zxTne0KySAl4ZK/7sLvHJKdODnchuNMo9IZ/q1Uvi6lSKATvrDkwiqtprUrOPcHLH/JeNM
 1Ax3Ei9qu2YOqn5HuAtJn2uH3HYwUduoiR8QDaCuctqNqHyeVqZRWdEexZMWvthDjTzU+p9zG83
 2GvZt5NKwKdwECupjO9dxPv7ZE9XC8GIvpB3p6j9UQNrgzDi8dVh8jvXp15T9z/dA/KpGQ8xZgK
 nLPbKdLZuqabzzSE7xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130113
X-Rspamd-Queue-Id: B5DB7531A6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61394-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:20:30AM +0200, Neil Armstrong wrote:
> The 10bit pixel format can be only used when the decoder identifies the
> stream as decoding into 10bit pixel format buffers, so update the
> find_format helper to filter the formats and only allow the proper
> formats when setting or trying a capture format.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
>  drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

