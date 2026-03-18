Return-Path: <linux-media+bounces-56196-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LJMHjCBumldXQIAu9opvQ
	(envelope-from <linux-media+bounces-56196-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:40:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A02EE2BA111
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98FD0300BEA3
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D077439FCDE;
	Wed, 18 Mar 2026 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSRN89Lb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EgVWF53a"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7E13921FA
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830429; cv=none; b=DXBdx8x3fIDDxnQXOjvTzVyRvMpWEHANhJugVfXI4KLsVm/QBVJ3kAmiHPSJ+amnMhoRi2YvxLKa3dlVdpcNoxn11I8p4e0oyQWZnCXcoo5C42TUGwLfWzEZ+qoukI9M5fJxE8zs+xn+jCXaxSorqO0h9hKOjlCKjxT/c5c981g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830429; c=relaxed/simple;
	bh=M+UlCgHy/igR1wT+0YrffDFBPnPVumdtoYKIXLlCGUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uE64a9/hrKcFL6qHRsc9Cm3pM7F2aM73WaaQ+MExDjJ3ijsMKo13+UpfI5SB991umboT0MJoJL2udjl2QBCRWRvWkvzf8cAXJGf5gv8oEsYl6IpLhR2Nadw6FLTJd4y2c2dXI8uviA0XWhnFiG95OIeJOm4eH7FSsZVL2ZzskKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSRN89Lb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EgVWF53a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I6ZEdd2878100
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ee72bAKFFC+00oPDw0ap1FMG
	KGW1ZraZJq356tl2Dms=; b=gSRN89LbWPMco2KxLy1T/yLL/ZaQlSp3Kf1/UKC6
	7eiGHKhpqqIzzbVvRQ8xFpTLVP6Wjpb4UUHTrew/Abr56IGl2/RvQtFV+uxJY3Er
	5JlxNWtN1ilnUC531BGSYzcqhVK1Nt2Kp1kUsUKsK0R8VmT50IKSC8yRv74+IMXj
	CcVR+MwtjXYQeflFtTTchQtloH5wbriwWzOQEkZrW416wSHJocgKDxDkn1wG2tk6
	LpbnzhZTeH1R3N+ZQT52a2+U0Ab9p6TB2LARLfXr6+7mercjQfd05j0vPPr2Ltw2
	K9697N9F6m6mERJPh+c4fdicKbC7GMH2Zc5jBJZFulyzAQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr12uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:40:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090bc4823cso173259501cf.3
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 03:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830426; x=1774435226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ee72bAKFFC+00oPDw0ap1FMGKGW1ZraZJq356tl2Dms=;
        b=EgVWF53aGaL0HuTh5OBF7Arr2sna01XELqZxFpADo9LjST1o5zNyTfZXmZjP0bI00F
         CV8gR5wd/hQ283hbDaBuo3h4F8Ine3qpoI2Hpqnx/1cgh6PfHHwcP+5CG1DZYVChxt41
         kFbDjch/Z4l6jmKMN/12Zv8qkh6d/8jdK28FEFGCkyZXNdNeaBZ+KGdqnYvW2lL8qQLG
         11nATzlQZvKxck2hTxd+gEHcYp+DByThelykKQkV8oKvuC67zmKOrYMCM046kOI5u+WA
         7SrTF3yyc3whWcCQ5ncMSl+6tFNdwO00KLAgLrbdMIy9V6qaJLAW4I0Ja0i9AdcnMHFm
         R+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830426; x=1774435226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ee72bAKFFC+00oPDw0ap1FMGKGW1ZraZJq356tl2Dms=;
        b=GmnRHn/nAYBCIw1Lwy501MahMUVC5ra7Y0MKSFZ090+lwmkzJhqyaS5+d+mcOPhfOp
         od7k0jqMXL7byTXREmBrOJQUn0GdDJShYlpljVv1Aq1nZ25xX1uIfhyN4UmVm+Rk/O+G
         0DQn9fbT17Vj/x8CwGS2SJ25kAJ+9UPqimpTNxwBy151xUk7hsCU2l6wn+BjCMaGfXQ1
         z6wNPuCWVg7XKs99wlJHHsHoLJxIzm1Yxx0RMq6oDlLiMOAD7kbBtnhsfARg/zxEFhYb
         uMU/c3R6gpQ+aLvZ2HsPNAxx5oz8Ehjup6Elhb+W+LC7tqUwz70nF0l35/t0EUFrj0r7
         pe1g==
X-Forwarded-Encrypted: i=1; AJvYcCXfL3fW82GiMHGhi6hpjQdYHv+tsaBd9MsmMCCZhknw7lhDtQVfobGQMTwEnxIdHVJQ9GqEqp4aqbuB/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB12wTpsAG6/z3qO+4ybdvYif+T+HX2Vm3Hwj4cM/JoUP6IbH2
	ccNNfDWUQIjCKR1B1yL4FnZ56khCWi+Do9Mvlv6iqrb5pmKSLBVrjqPsx/fqC0aL7Z9JgaqFz/v
	W9v47VxFH2a5tKfiAeCtQNPAPY2zeOe2/HG2f5pYUS30+wcwx6Osf1edDnQ/V0gBUHQ==
X-Gm-Gg: ATEYQzydGPXute45Hd7VVaYEO/wLwXPgbpSh6nGiu2k8fqV05L07ESxNnvdnuYEA9Jk
	A2qjZPJwEhhcmZXtavlwW6eEZJeOwIUzGPqE7yqua4VOZIFSFxBobs3l+Xm/cbaqzfKmQR1TGoQ
	Dqw6j+xsHZtIo5R3Z7kHE5qwG/l84zYcUrfi4trLatvkt5v8T8AbY/q+syVSuXD3GhrTVAgx0hI
	0VAsfKnYvMNF8a+QifnHax7CM/kBmGJG4bJsRL1uqcrdRSuEFT+FylIujDcucT6eLGfxRiCHdmx
	iNQMO5ZLoX68Hyz0X+6Ni5ddfwZ3KWgo4wDF9UGBd4VAHRHU/oGRQPuDmpJOP/ZFPa4coX5uds7
	HcEwaNB074jhPruJ3KPrpmJGBUuxeAXlDs27YcH56Ggcb9jCGNM6teB7q5BNUCmdoIy0AlXcbQR
	1DVy/vchbdQtft5cbc9Eo8kZyF5pwyl43wgZQ=
X-Received: by 2002:ac8:5fd0:0:b0:506:9e57:8ba9 with SMTP id d75a77b69052e-50b1485dae8mr32975741cf.35.1773830426327;
        Wed, 18 Mar 2026 03:40:26 -0700 (PDT)
X-Received: by 2002:ac8:5fd0:0:b0:506:9e57:8ba9 with SMTP id d75a77b69052e-50b1485dae8mr32975491cf.35.1773830425848;
        Wed, 18 Mar 2026 03:40:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd5488c21sm4878851fa.23.2026.03.18.03.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 03:40:24 -0700 (PDT)
Date: Wed, 18 Mar 2026 12:40:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 7/8] media: qcom: iris: split firmware_data from raw
 platform data
Message-ID: <4jxzqcpgieq56orap3cu3trf5qpvskfuebvrojl3cemis3axdz@kocixkagmhbe>
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-7-fc79f003f51c@oss.qualcomm.com>
 <3ee87252-6b90-a389-0621-5b0b8d2f87ff@oss.qualcomm.com>
 <yhkio67g2ka222lq72w5cmftczdsiugws3ykpcxuhdrhu54oh5@gjazz3j5lci4>
 <eff4fb4b-d857-5c0b-2285-946806e8e4cf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eff4fb4b-d857-5c0b-2285-946806e8e4cf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69ba811b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=AMxoPQaXMkgVixLD-tMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: _L_OTuKzlQ80jiCZ6WlTQotuLupAMpzY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfXxEz/vG42+mtd
 t0ZsbocD70Au7HPXuYqTR4eQH9ehpO0+sYK3jwaHy2rnZziNpxUjcu5EvqNkvYLJkuSKEsFunFV
 5RkUFRQlPmWlTPjT5eTGUJFc8qlrC9z98hA+eAFlA1h1Dgi59w+qdD5vejjpCay2U/BaHAdhFAt
 p++qNOLZxzbg40UtYdXBeLgRBCk7HkH5P4M47XNEozNAiyHcww4C6D639iV9khBKYfB+lpXZ1s7
 ZnLsh8nWxgB3v6vc1ZKdwQLjbv6zQydWYanNG8BXLpwUT3ZVZry2WkOFBNKrl7QEesV/PAs5hie
 /xhM86qAj/5LzNlW9clzvsKOg3QXWFM8E+59+6TEP1ugzosPE4klfNC5a5PgHcPni/Y6huomzpV
 J5t4rRzVp9EGaix6sl/CieHTuTpu/LSM6j/dg4ZqSdRWs3y8+gcCMtNP3Rs/Yd37gz0UbucxY8S
 eEf3Gtmb9pX6US5rwlw==
X-Proofpoint-GUID: _L_OTuKzlQ80jiCZ6WlTQotuLupAMpzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180089
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56196-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A02EE2BA111
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 04:03:07PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/18/2026 3:59 PM, Dmitry Baryshkov wrote:
> > On Wed, Mar 18, 2026 at 02:35:30PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> >>> Having firmware-related fields in platform data results in the tying
> >>> platform data to the HFI firmware data rather than the actual hardware.
> >>> For example, SM8450 uses Gen2 firmware, so currently its platform data
> >>> should be placed next to the other gen2 platforms, although it has the
> >>> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
> >>> hardware-specific platform data is also close to those devices.
> >>>
> >>> Split firmware data to a separate struct, separating hardware-related
> >>> data from the firmware interfaces.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  82 +++----
> >>>  drivers/media/platform/qcom/iris/iris_core.h       |   2 +
> >>>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
> >>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |   8 +-
> >>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 +++---
> >>>  .../platform/qcom/iris/iris_platform_common.h      |  82 ++++---
> >>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  67 +++---
> >>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 246 ++++-----------------
> >>>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
> >>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
> >>>  10 files changed, 205 insertions(+), 369 deletions(-)
> >>>
> >>
> >> <snip>
> >>
> >>> -struct iris_platform_data {
> >>> +struct iris_firmware_data {
> >>>  	void (*init_hfi_ops)(struct iris_core *core);
> >>> -	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> >>> -	const struct vpu_ops *vpu_ops;
> >>> -	const struct icc_info *icc_tbl;
> >>> -	unsigned int icc_tbl_size;
> >>> -	const struct bw_info *bw_tbl_dec;
> >>> -	unsigned int bw_tbl_dec_size;
> >>> -	const char * const *pmdomain_tbl;
> >>> -	unsigned int pmdomain_tbl_size;
> >>> -	const char * const *opp_pd_tbl;
> >>> -	unsigned int opp_pd_tbl_size;
> >>> -	const struct platform_clk_data *clk_tbl;
> >>> -	const char * const *opp_clk_tbl;
> >>> -	unsigned int clk_tbl_size;
> >>> -	const char * const *clk_rst_tbl;
> >>> -	unsigned int clk_rst_tbl_size;
> >>> -	const char * const *controller_rst_tbl;
> >>> -	unsigned int controller_rst_tbl_size;
> >>> -	u64 dma_mask;
> >>> -	const char *fwname;
> >>> -	struct iris_fmt *inst_iris_fmts;
> >>> -	u32 inst_iris_fmts_size;
> >>> -	struct platform_inst_caps *inst_caps;
> >>> +
> >>>  	const struct platform_inst_fw_cap *inst_fw_caps_dec;
> >>>  	u32 inst_fw_caps_dec_size;
> >>>  	const struct platform_inst_fw_cap *inst_fw_caps_enc;
> >>>  	u32 inst_fw_caps_enc_size;
> >>> -	const struct tz_cp_config *tz_cp_config_data;
> >>> -	u32 tz_cp_config_data_size;
> >>> -	u32 core_arch;
> >>
> >> This can also be tied to firmware data as this is required to be set for
> >> Gen2 only and is 0 for Gen1.
> > 
> > Will it differ between platforms?
> 
> Nope, same for all platforms with HFI Gen2.

Then it should be removed from the data at all.

-- 
With best wishes
Dmitry

