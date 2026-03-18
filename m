Return-Path: <linux-media+bounces-56211-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JLrEM+rumn9aQIAu9opvQ
	(envelope-from <linux-media+bounces-56211-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 14:42:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B86B92BC3C3
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 14:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9F3830233CC
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 13:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA823D9024;
	Wed, 18 Mar 2026 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chA9Z5T5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4UeUj03"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4562F3D88FD
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841355; cv=none; b=T7Tky07p6L25YYtw6fj/x6dc4cWek96GrS6BHIWca8/DDxsYfSh9gezor/9Dy/p7M+tEVq/BNNYyJgJVpNK+RP6PVEfVi0Iqjt+0q9KNfbgd1P9fkAolDhNtFyC4v+LzrD+twPiFK/iO2mL+1OQYksdKsUocba4n/fUeNopSkQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841355; c=relaxed/simple;
	bh=6UKAEHbQUV+rqmyLy6ysDbRXRcDRadyWM9St1la9Hgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2MGi18dnBClfj3bjdtxx542wNPM0qtgMhgSwXRBhyZ5sdrw98trej7fiO0YAXL+6G/bJTLC3pnErcJWrt6zygtzJ4OnKSclvFZgHO7SYy0ytIef3BRDrUX2eenN3C+R0g2wRdBzv3rUQnPdnrospmLftxoCE5/xUs5mlhArDPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chA9Z5T5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4UeUj03; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8G1UJ1050312
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 13:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pCAtfC0hLCseXSP5bboGxD0z
	M5V3DcLwXtrkaIFg6ZE=; b=chA9Z5T5+OaNwqW4I5Uzusl+8+mWRJlLKqWSw225
	UsKYt02bN8w04L4sU588+APL7s+cjaQ73o8Ny5ET8IcajLwYCYQx0Av4ud2muN7v
	mFljHlv7wiq6GAYybHCQz6PoAl/jZbpBJ8O3GQOyTPO5mQoMPJocC7jr/KnG24Xn
	Z7SCbcEy0H4TwpTNWuL0npo0ImqiA/SYHae4ePCzWPEgfIuFbTw0c4oPwiN1UA9K
	x9cO+qtDnMCJ0OI3ew4DZBU4n5IPGSLsksnl/EBbsLFSnbqYpJOvX2zWSFC2t5aD
	i1LBVXjfAEsISuVJVXEAlscrl1KxAA8455sfrcpkkGUAGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ejqc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 13:42:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50925fed647so14585651cf.3
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841352; x=1774446152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pCAtfC0hLCseXSP5bboGxD0zM5V3DcLwXtrkaIFg6ZE=;
        b=f4UeUj03EwoLp8060QwUNL4nwtfcinph3MhQiLn9XMDgvTJgeJPnLYg7zPgOLZMERn
         7VI5m9eNZI00SoMzJuaG1oNNFrJ4wxS1szTemqBg+Sc0kwO0IazUdem/u8M4LErgLb3m
         EGTE9qh3lzjoit1ySd5/BW4VT9PoywgctNT/e8p9oJ+MeJ3HcdcqyMYzjpRbz36n8/Dr
         KIfgMlT0uNvscyyiyk4nSugMCxt0yOr9y7S5f6V8DSCz41PKHOLG0AHCYgQ6Xl4bDB5Q
         1MZywCcMXX+XSDk6BQTJK4JJal8PUshl4bFQS3n2PkXzQ/MLqCxtnbOMhkVjkmI4HsNu
         54bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841352; x=1774446152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCAtfC0hLCseXSP5bboGxD0zM5V3DcLwXtrkaIFg6ZE=;
        b=ig6LhvQolu5k2/GRKFSvUWPqSd7W+Eo8zneRIEKkRWxn3JjndOEGeok+mAeLaWtDMI
         1QCCfhHHoBG4Op8f5XNLaPztKzL5nIaPjm4FN3Grse/qXV2z4x2ERsiz30rJwirJ3ha8
         4sAk3mY90ePWuHHIWjN/UJhUsUAfHrx2PxQ9eOHpHE4eKkkZXT1pbC05NHuaoTN41gYU
         yqF6Clt/SH/2tHRmqsDe8ikoX1ZPTPZZj1sFS1nDt4QCaQIJ4ORe2u3XovQywaVTU6jx
         hfwZR4O79S4aBVO9eazg4xk7gk53tAG10BASQ8r8+WE4OiELBjZjo8SEelJI6dRHBSxJ
         SpHA==
X-Forwarded-Encrypted: i=1; AJvYcCUzd6CVbVjrhGzRu7NvLFLi/UwtQRfOmboQo1G+ebSPGHHc+5O+8ctU7pSW+C7P97c/I9hWj6LTtsDN+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl1KsXcIUMkQk4Bl4V+pi0/jU/UKyFZPAOQwsOAgdBzDn9xrFD
	ro3PKWPc3xPWurD5fM4zv9UKY/AI0AfZ1z79SRcaxg9D0L0Acg7xrXncGZKTpxm0RQ3sF5BvLJw
	rZGMMtP+GcuNzVmp1+zM1pI4IS2LYq0/T0aaFVpC2GqzAs/gwQoKVhjrL3rAzhNq/Pg==
X-Gm-Gg: ATEYQzx0lb1/Sujzdn1h3x6p5UwfXUUMR9tQsHzBR8eGSR46rDcjfheDInCwNYloqvx
	EEUdp3j6DI4Mruhy66tWFnKTM6ecmEScd5WYyf2EEl56OUlLPwFMbLiemeSouYMSDmCaVzVdb1+
	LM6X30wf5ffabIAtQV1P3dsX3zBfHyOBRHUfXM1vmq7zjb2C6GK8Egx6DG8c3wcYnUlXr7QC/Di
	WS39vwyWMVI3ezVVazBjfXadCl0b2ByLKsMq3jDctwZlmIPaHFvgQgU1mFsOIvhb2Q5h/zLn6Wv
	DkeLAILvcdmtrMpqn3+AFQr+dGkN9t8ctaiCJLWXTaPAKcprpy/oLsHEOkCcpMkyp3t+PU28CbX
	rXkB4jpRyzUdNEGTNGf2du5oMPYyTkCdmjRBk4i2ZG233qGfpsLPalLjLzm/kCmadkXkdF/vwk/
	Izx1Him3vq0A3i9RLJArAEnPbT+AjDW7gVS8c=
X-Received: by 2002:a05:622a:108:b0:509:3c33:9d23 with SMTP id d75a77b69052e-50b1477e2e0mr41868931cf.7.1773841352320;
        Wed, 18 Mar 2026 06:42:32 -0700 (PDT)
X-Received: by 2002:a05:622a:108:b0:509:3c33:9d23 with SMTP id d75a77b69052e-50b1477e2e0mr41868341cf.7.1773841351633;
        Wed, 18 Mar 2026 06:42:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c743b1sm529953e87.58.2026.03.18.06.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:42:30 -0700 (PDT)
Date: Wed, 18 Mar 2026 15:42:28 +0200
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
Message-ID: <3377bs4xsxhevwhe2qx7ugkjyrstltg2av4kbjq7yakfogrjz7@gnrk5str66kq>
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-7-fc79f003f51c@oss.qualcomm.com>
 <3ee87252-6b90-a389-0621-5b0b8d2f87ff@oss.qualcomm.com>
 <yhkio67g2ka222lq72w5cmftczdsiugws3ykpcxuhdrhu54oh5@gjazz3j5lci4>
 <eff4fb4b-d857-5c0b-2285-946806e8e4cf@oss.qualcomm.com>
 <4jxzqcpgieq56orap3cu3trf5qpvskfuebvrojl3cemis3axdz@kocixkagmhbe>
 <2f5553e4-6d6e-2eda-abd7-97284336cd24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f5553e4-6d6e-2eda-abd7-97284336cd24@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69baabc9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KBlO3QsKoheqDjMevcMA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNiBTYWx0ZWRfXy7fH1CZbkrrb
 cj/3ddZ56HIUXF7x7Q6n4oulRTz6GS/6wHvXlWs7AZkSOOdY4BkXjXUIcTArmxna1rp1xdZGunL
 R957i5KMRG2T15VuCFCtEjFK15mWHflurNBLVSqz64e5OFCwK7p4s7tr34UucN66yjMOVOJzaZF
 Fn48ITQ5O3gUT00WUA6d6x6oksS96b/YGk+znjLisiPwyYwE9+ZJ3ae4FicK3mwI7rQq5L6Ulp7
 JPjAV0XYwD8MeHO1BrLbuRqZD88zlEgCsEUtxvSfF/JkMdG1VbVDt7six+6rvMmuzuosXVJuNw2
 PxAYb77UNShC0yNIPX1WUCmFqfY/Qb8J/Bdy/CsujI2R25Eu8tMOBY88wpod5bvsdrFjz2hqqQD
 P+KHTGp8GswXqZ7laVFKHUY74KbohU+swz0+vFQUX9T7vk6L7sJwx4z8QtKg1nAkZ4qxUXxn3el
 RC71r7e0NO6AVCV/+Uw==
X-Proofpoint-GUID: S2WmC6y0n0sDH8htKXVv1yrkrKvF9Z2X
X-Proofpoint-ORIG-GUID: S2WmC6y0n0sDH8htKXVv1yrkrKvF9Z2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180116
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56211-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B86B92BC3C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 04:12:25PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/18/2026 4:10 PM, Dmitry Baryshkov wrote:
> > On Wed, Mar 18, 2026 at 04:03:07PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 3/18/2026 3:59 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Mar 18, 2026 at 02:35:30PM +0530, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> >>>>> Having firmware-related fields in platform data results in the tying
> >>>>> platform data to the HFI firmware data rather than the actual hardware.
> >>>>> For example, SM8450 uses Gen2 firmware, so currently its platform data
> >>>>> should be placed next to the other gen2 platforms, although it has the
> >>>>> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
> >>>>> hardware-specific platform data is also close to those devices.
> >>>>>
> >>>>> Split firmware data to a separate struct, separating hardware-related
> >>>>> data from the firmware interfaces.
> >>>>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>> ---
> >>>>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  82 +++----
> >>>>>  drivers/media/platform/qcom/iris/iris_core.h       |   2 +
> >>>>>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
> >>>>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |   8 +-
> >>>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 +++---
> >>>>>  .../platform/qcom/iris/iris_platform_common.h      |  82 ++++---
> >>>>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  67 +++---
> >>>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 246 ++++-----------------
> >>>>>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
> >>>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
> >>>>>  10 files changed, 205 insertions(+), 369 deletions(-)
> >>>>>
> >>>>
> >>>> <snip>
> >>>>
> >>>>> -struct iris_platform_data {
> >>>>> +struct iris_firmware_data {
> >>>>>  	void (*init_hfi_ops)(struct iris_core *core);
> >>>>> -	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> >>>>> -	const struct vpu_ops *vpu_ops;
> >>>>> -	const struct icc_info *icc_tbl;
> >>>>> -	unsigned int icc_tbl_size;
> >>>>> -	const struct bw_info *bw_tbl_dec;
> >>>>> -	unsigned int bw_tbl_dec_size;
> >>>>> -	const char * const *pmdomain_tbl;
> >>>>> -	unsigned int pmdomain_tbl_size;
> >>>>> -	const char * const *opp_pd_tbl;
> >>>>> -	unsigned int opp_pd_tbl_size;
> >>>>> -	const struct platform_clk_data *clk_tbl;
> >>>>> -	const char * const *opp_clk_tbl;
> >>>>> -	unsigned int clk_tbl_size;
> >>>>> -	const char * const *clk_rst_tbl;
> >>>>> -	unsigned int clk_rst_tbl_size;
> >>>>> -	const char * const *controller_rst_tbl;
> >>>>> -	unsigned int controller_rst_tbl_size;
> >>>>> -	u64 dma_mask;
> >>>>> -	const char *fwname;
> >>>>> -	struct iris_fmt *inst_iris_fmts;
> >>>>> -	u32 inst_iris_fmts_size;
> >>>>> -	struct platform_inst_caps *inst_caps;
> >>>>> +
> >>>>>  	const struct platform_inst_fw_cap *inst_fw_caps_dec;
> >>>>>  	u32 inst_fw_caps_dec_size;
> >>>>>  	const struct platform_inst_fw_cap *inst_fw_caps_enc;
> >>>>>  	u32 inst_fw_caps_enc_size;
> >>>>> -	const struct tz_cp_config *tz_cp_config_data;
> >>>>> -	u32 tz_cp_config_data_size;
> >>>>> -	u32 core_arch;
> >>>>
> >>>> This can also be tied to firmware data as this is required to be set for
> >>>> Gen2 only and is 0 for Gen1.
> >>>
> >>> Will it differ between platforms?
> >>
> >> Nope, same for all platforms with HFI Gen2.
> > 
> > Then it should be removed from the data at all.
> 
> Yes, I was also thinking the same but this should be set for HFI Gen2 and
> not for Gen1, how do we handle this then?
> 
> That's why asking to keep in firmware data.

Ack, I will move it to firmware_data.

-- 
With best wishes
Dmitry

