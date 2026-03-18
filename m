Return-Path: <linux-media+bounces-56194-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MNLKK1+ummTWwIAu9opvQ
	(envelope-from <linux-media+bounces-56194-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:30:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED32B9E13
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3347F300CFEE
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE68236920E;
	Wed, 18 Mar 2026 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e73oU7xO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuxMRpu7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE51135B63B
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829801; cv=none; b=gWd9LoXHeDkKkfzP1c7JcP4USlIgMpLGK/0RF7ZbgEqZVKf18wDrp3yuek9oKZd+lTL0TAonTn584MtFEemKFldloxeUeQ/xCG3Ois158iE5VRANC/3lViaSCQLzcZyUZhROViGn+F9WXZ+oCu/8tQMT2rssVbMEt1bQii8bfDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829801; c=relaxed/simple;
	bh=pcvjEcVNzSAnEiqoPtZ8M2841K+nf3pSI/Fzv2jVLuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=az3kmdZSVheEbxIkM5o2YCbyLvIOMGxWkKWyaHTbkz52CchaDOhNcQpA7l438gKokNAviM5cPWETcX178ZgKED3V3DQrwUtu9+MC7rlhFNqn9C6RpUxPjlKMz95eRP8fYmebYjYBVwuWa6nq3rXtnAaqLJhuqczgtnkaCK/tZ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e73oU7xO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuxMRpu7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9NJDk3281366
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eGcSleuiNdoP+tnFCObTLYWD
	Gv2o7qeEGcDL6kcCW0g=; b=e73oU7xOSnpk2oAFnTbV9sH90xrzehmo3eOMDB9E
	YLx7ene3ZybXaGGS8L63tEluRSNV8L5HPstArfYmISfk82anaLI+2aeWrItvBcDe
	Z2WM0hZgzgURBNoxFqx/kGRgoYnGoI4/A1LzkzThWwKnwCN3NSAa8IOSjkcvzSsm
	2UlzrnCMMsDt0m+Ef9iIqDhFHwlIrbG6Q6Ww8XiAoa7Qh2Vr9T1UprlTkSivZviw
	PDekdy69EwmtL0fXmNRFtsbEnShbd2y+GLzihwImaFCJMGE3kKUYuI78SJhnKuym
	kLJBM2SQb3eGrlUVJQnNu7o97xbc4+oXvFSYHis3XK3FCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62v0sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 10:29:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5092033798eso309282661cf.1
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 03:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773829798; x=1774434598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGcSleuiNdoP+tnFCObTLYWDGv2o7qeEGcDL6kcCW0g=;
        b=cuxMRpu7dOOaGxCGPc7CAtXNnLhWeGyAiFKHs2tZxk6gge5zjd/cBgqLt9RakAIx0r
         HdGc52CRqlqx6IyKUziiutEAUuSiSb7giwLEHLMwfShM4AeJCPXQQvKoAg929jmTkDJX
         Plzu0pALBA7oDexV0yO1OQtJ6ASt08BxUF5rfgkXuVoXXnld8pAh2pAq4Kzln8rgQFZy
         nZoBwi2QUadkxpdMPVWMfXMibcZnfffMexyhUd3LD/Qb6CvQDGZD6YhB8TfVFib/E1gy
         Y0TtDUlLwCzQyqUPQ1zm8Iksna/atypdkWKZWpcH8+vZiBp7iNmsyULIlO9inhegIkuW
         Gzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773829798; x=1774434598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGcSleuiNdoP+tnFCObTLYWDGv2o7qeEGcDL6kcCW0g=;
        b=IQ065mXWR7y3ph0eMtVBQzElnN+N5sTQF9v/AVUUlYFr72y9pF3uActRNBnmYjs9Rf
         R0Qwjzpt5GUkMyL4k/6zZsSsej6TnYJ2No9E5s1CoAMf/3J0DKShreM+EgksYcjM61ZH
         KTi3AP0ARQOVgAbL+GZLbx4OGcwTS/T+FG8XczzXIE4ZSHemysOwgHEE61rPuC8jupVA
         UANutCLkKDw5AlD1R+u8pRNv2G/O90R38ub8s1Q62pHiw9ZuY9b3FBxzMAptRfdJHtF0
         kC9dMgQam+01BVvjuquMHGsxI9zI+5efg75Y6aCwFQfvS4v7MpM3FWW+Fgkyx3DSvFT5
         rlPg==
X-Forwarded-Encrypted: i=1; AJvYcCWS62+Gl8Ge3u2ptV1lbDfwRNsUmMkDeTh5vJqOro9TxlAfvMrQgH1xxZIWF073fMqwgvsb6RoB7dU8oA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhu6qAGeA7UbFXE/zmZ0uk5zeDHNaIpkHgHlxAWoFP4SIQ+z1r
	GZW1n4rCbu/tdmyLAapIn9Q/4iMG9DI/2l+ak76SE4XpqWRNSAme7W3fKcxAyWnuhVq0gj0lNR/
	ajDcoWh/FCGN00DmwpTtgp6TmjopEO8r/JUidcmKj/JOPWodcVmyEuvcZA88QuXw0cw==
X-Gm-Gg: ATEYQzyidPLA3XY9L6Kk/Yn/F6IeWRcESllWpbXkd8AQlLYFUhtFrpXhGGfoPtCeBcD
	EdYyQcO8SMzGmAWUVv4Sa9FM44qiYNeGJJ3VVBD79tGPIgy9Hj5aZgMhCQqxZ6GPgPcDBDKVGjK
	fzAOJpM0J2aAJqa+VQnY2fHh7WXJ3HbiHlCpXowCDQvvG0MsE8OfCRmd/nxIis1oq528Yqn+h4/
	355lFhlLfu+fmm2oIOTub62shFdyvYUf/rJJCYtpsCR8qD9sE2PyfFDfBahMJ/ld7bsk/Z+aToA
	yMEsV6oYTgurqQNr92jhyBOFGQWMq+q2TD02GkGYHC5Go7YsV89Dypxwnd4TljgEa1s4s8ADx1m
	/5PjamWrYyF+t5fBkNGP+wCNJZan5XRCGS7fioK9ICVkkIao5jYDgFvTJxISj0adPsiSWRErGH6
	yYKS4PQdMqPezcrvTL8FfQhz/3RmQ/s2lhkU8=
X-Received: by 2002:ac8:7c52:0:b0:509:1dc8:e9e8 with SMTP id d75a77b69052e-50b14796c7bmr33639831cf.27.1773829798183;
        Wed, 18 Mar 2026 03:29:58 -0700 (PDT)
X-Received: by 2002:ac8:7c52:0:b0:509:1dc8:e9e8 with SMTP id d75a77b69052e-50b14796c7bmr33639651cf.27.1773829797744;
        Wed, 18 Mar 2026 03:29:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2c487sm448039e87.27.2026.03.18.03.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 03:29:56 -0700 (PDT)
Date: Wed, 18 Mar 2026 12:29:54 +0200
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
Message-ID: <yhkio67g2ka222lq72w5cmftczdsiugws3ykpcxuhdrhu54oh5@gjazz3j5lci4>
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-7-fc79f003f51c@oss.qualcomm.com>
 <3ee87252-6b90-a389-0621-5b0b8d2f87ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ee87252-6b90-a389-0621-5b0b8d2f87ff@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69ba7ea6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=BffldlsCjLTSzjMsJo0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: JK8_s5bIx_UYRASQ7JsJi4RvMezgHJXQ
X-Proofpoint-GUID: JK8_s5bIx_UYRASQ7JsJi4RvMezgHJXQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OCBTYWx0ZWRfX3yU87LeSsHe5
 fU2upLGgufJ/ZieTgjD+Tk16+S9GH30aBmqzYsnHgWkF14hIC+Q/t46wL2VfzmMgu4pxI7Hm1iF
 uHAVD7km3RMP4QhwPTia5vagTGysoVPvv9f5df58HxYRYZKdTbbLjrLtseb7zQ0O4nDDtfbzheS
 JW6DsMMQvlZb4D19GfZ8GACYnuj3e3XnDsMQr19bdj3UGDvs8xl83jUQTR/pAncYwUoPPZOTpi0
 HhRSKYgaaBd/ns1FYbLwnpsqosPS8sFTlf2riFp1zATsj+dZyKbnHwJHca+LZP/gyS1TNbcE2ap
 8NJoxlfhkLbtuZXX9i1gGSaR2sNE1dvgm4HHaj+F/b43Kyxl3HfPx+E8TIVbsBIezatTq/rueGm
 RJWKG0oN27x820g0lDrIgqRufDS7dpewhGGP8Cw4g6KZ/QdVM+Ux1XaEuC8PEduxIu7N8K3pabV
 kEbFNPtFciQQ1K5o3Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180088
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
	TAGGED_FROM(0.00)[bounces-56194-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 1EED32B9E13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 02:35:30PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> > Having firmware-related fields in platform data results in the tying
> > platform data to the HFI firmware data rather than the actual hardware.
> > For example, SM8450 uses Gen2 firmware, so currently its platform data
> > should be placed next to the other gen2 platforms, although it has the
> > VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
> > hardware-specific platform data is also close to those devices.
> > 
> > Split firmware data to a separate struct, separating hardware-related
> > data from the firmware interfaces.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_buffer.c     |  82 +++----
> >  drivers/media/platform/qcom/iris/iris_core.h       |   2 +
> >  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
> >  .../platform/qcom/iris/iris_hfi_gen1_command.c     |   8 +-
> >  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 +++---
> >  .../platform/qcom/iris/iris_platform_common.h      |  82 ++++---
> >  .../media/platform/qcom/iris/iris_platform_gen1.c  |  67 +++---
> >  .../media/platform/qcom/iris/iris_platform_gen2.c  | 246 ++++-----------------
> >  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
> >  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
> >  10 files changed, 205 insertions(+), 369 deletions(-)
> > 
> 
> <snip>
> 
> > -struct iris_platform_data {
> > +struct iris_firmware_data {
> >  	void (*init_hfi_ops)(struct iris_core *core);
> > -	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> > -	const struct vpu_ops *vpu_ops;
> > -	const struct icc_info *icc_tbl;
> > -	unsigned int icc_tbl_size;
> > -	const struct bw_info *bw_tbl_dec;
> > -	unsigned int bw_tbl_dec_size;
> > -	const char * const *pmdomain_tbl;
> > -	unsigned int pmdomain_tbl_size;
> > -	const char * const *opp_pd_tbl;
> > -	unsigned int opp_pd_tbl_size;
> > -	const struct platform_clk_data *clk_tbl;
> > -	const char * const *opp_clk_tbl;
> > -	unsigned int clk_tbl_size;
> > -	const char * const *clk_rst_tbl;
> > -	unsigned int clk_rst_tbl_size;
> > -	const char * const *controller_rst_tbl;
> > -	unsigned int controller_rst_tbl_size;
> > -	u64 dma_mask;
> > -	const char *fwname;
> > -	struct iris_fmt *inst_iris_fmts;
> > -	u32 inst_iris_fmts_size;
> > -	struct platform_inst_caps *inst_caps;
> > +
> >  	const struct platform_inst_fw_cap *inst_fw_caps_dec;
> >  	u32 inst_fw_caps_dec_size;
> >  	const struct platform_inst_fw_cap *inst_fw_caps_enc;
> >  	u32 inst_fw_caps_enc_size;
> > -	const struct tz_cp_config *tz_cp_config_data;
> > -	u32 tz_cp_config_data_size;
> > -	u32 core_arch;
> 
> This can also be tied to firmware data as this is required to be set for
> Gen2 only and is 0 for Gen1.

Will it differ between platforms?

-- 
With best wishes
Dmitry

