Return-Path: <linux-media+bounces-55283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHmLIiu2sGlvmQIAu9opvQ
	(envelope-from <linux-media+bounces-55283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 01:24:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA677259BD8
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 01:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B83D83011C6E
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 00:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A713218B3;
	Wed, 11 Mar 2026 00:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvwjBsyo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G6r6P3Do"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41ABC33F58A
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 00:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188623; cv=none; b=CJmPzmoOKBKFs5YFEw4l+HY/tCTC039JqroOllncA8lKmIf0ask9xM0VAgTN8ZFS7DBP6ufNwFyNt2tdX5NxrF0sxMeUydO/AJmHM8IYT+6AtIx+Q0E3wRzx3UsoMXCwTwV3aaNPZX9os+mV7ji3t+om4M2xToyr8rO65IjI0Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188623; c=relaxed/simple;
	bh=yDKABWnMSVKExRkVfuX4Vy3AGKf9nb89Q5HuKRcLQP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Us83hP+dwg1fpf0+RXMTRW4Vn6A+PkUF9V9Je6MJEP6WLbs3AEGRjKQFDWITFX65STv+eUwGrkfq+srxrm95ZwP5QUYbnPHaZZgc2JXSMwnb36BSCXFldb7yt1MBfDhhwjTzvCb4vJv15LtzfK9VzdVVnIQMgMC3FwXgWXhgl1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvwjBsyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6r6P3Do; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIsCNA303868
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 00:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VPhjEtaeT5qzLf3ImkfiJTTXmU3WJ3dDLVOAxUk4GsA=; b=VvwjBsyoZDRm1N76
	FXt1v7YO+jeNxFUzceFZrgl4g0BgfTMbnLZz6inan/hAi/n/P7+Ln89yd5YTj6se
	GJRbJhUisrFZXX7Mc2Y+KMBmBDAXHjceiM6serwI8RFbYzD+ZMAejF4/XpZyZ4FR
	sUXhYzYGD40WYX8dmyrak7jpD49VkXUyz6DJvtPg15iJUu8zq5MRQjKCdqf4OixO
	KOBL2Mce4r/I3Qika+zZf9iTB5Js7l13l3eiug+9xA50VKHVumzCRlgB1NGCkxa/
	Vt8KJxAsrmhq6PzdwukV/TtNjhF87zGpTZX80XHqs1A6JNRbQLU6njghwErsNuwY
	fVH4DQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf2yrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 00:23:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb6291d95aso5291010785a.1
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 17:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773188619; x=1773793419; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VPhjEtaeT5qzLf3ImkfiJTTXmU3WJ3dDLVOAxUk4GsA=;
        b=G6r6P3DozdH+YwxX1IP+i9tV4enp7OTI6u1jM2FZ8CuX+xkb6U6NZwRxDFbLQ0cnxY
         Y9jmoLZicc7TM3JLpwzkzUd30D8W0awlkvn4D8FH9LBst5xHhWLXMsuxVU6sDf4PTyas
         gD1T+6dPlK/ptth7SMWnSF/aFlEh/4PaguScnzIntoLwOdHnLxJoStLinXnFkJ7yhqMv
         c+Ea+G7vVJTuys6gBU0PwNT11b6KxfUUOKzwIcXtHWwJSMs00jz18eGCee1fWVUvVoI+
         U6uftuR1QiF7BJGDViKDclgY+CEGHDsvppO/BPG2get3UliHSTnck7MVqSSqU82qjFrk
         5yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188619; x=1773793419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPhjEtaeT5qzLf3ImkfiJTTXmU3WJ3dDLVOAxUk4GsA=;
        b=NyZB+eFqITo723t8LUpsIzy+nDl+5aEvlJyqP+ESlzz2S8G4aQAiyk5n6Ep8VmV4Hl
         CnFPBIajkjaXZcs/SguczUo9pPT9eh4CEd8e6xnFrFNUrtuuMVC7GPuYQ//OdsaF+JRw
         rVr4mpp4RHjl05SDdWH8WXLDylizYgirHUSVq9VCWgdemyhZlqucLZnJ0CSaUnkQR+hH
         iKvM6YBTwlW79YTGp9gx4bfsbRhHwuwrehK+AN0BnzMvTABLS4jms4tAN7x2Dl4x66X/
         ChljdNVyJgaFGotwzZdzy4/TkzOT0TvCG64lbxZec124CRTligqK6bTaHndU5ESFa9Nn
         cG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwY339d3nDYVOMYhPtsnaW78X+qdJx5WCVlyFA0l2Bhw0EYRtjIFSr/hgwChMHvGDf1Afqzj/hxM5K3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVln2btnxDlLuQQ31rqATaueTDYhDnzBjv/Lgd2JZuG1EDxyMC
	duNYsWAM1M0V27N4SvuCMoPR1+Tq4iYSkiU3fK8otrU6ftN5/fjT6ETudgKDSktdL6yuRfR0WaL
	hHprayGEUt3QTsCl5eWqugB9C8rtDi7oOx9GxHGHTQxuZxpOWOEgOFW//udBXtGOFyA==
X-Gm-Gg: ATEYQzxAoaScJWFBFWkXtfirkOLhbcRLudS7p+noMugxvgA6c1xRUVOWWUj5AG3ETDW
	YefxHqQpAC77vBR5cE1uLH6cnxyYAcwGZDexJVfpV1CTRPJ4mkyqbBKsBgJikG9BgPlQd78zafQ
	p6zG7pIj6lCX4Gx3n1BQoVr3uwNiAvAcmjaIvX7gjEV3AaNKqqGo4v7ktO9I8eNY3580OSxWzfE
	v3Ls6XGR9MFvhsqTSWFVtW+J59fIayo/wuV5M4DiGFyyz5iRknU9b3c2mwRBTV473TpTVEU0swl
	twzI1/sgI6U/of+05/N2AUEGqoVp2cbRJvehBIXjqiV4reKtphmive7/IZfFrJ9fKLKYCEj25qq
	1fW7e+7hslaOHH9zlk+Ao2e7qaJx0dLjWm69xrARFiFp1UZKX763lat749zEy8C6LjKi4z2zl/G
	f3x7joR89ZFECERYTT68RPNkVk+FFSOAOPoNo=
X-Received: by 2002:a05:620a:c50:b0:8c9:fb69:e708 with SMTP id af79cd13be357-8cda19f7a76mr107204185a.25.1773188619187;
        Tue, 10 Mar 2026 17:23:39 -0700 (PDT)
X-Received: by 2002:a05:620a:c50:b0:8c9:fb69:e708 with SMTP id af79cd13be357-8cda19f7a76mr107201785a.25.1773188618779;
        Tue, 10 Mar 2026 17:23:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33be6sm107303e87.7.2026.03.10.17.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:23:36 -0700 (PDT)
Date: Wed, 11 Mar 2026 02:23:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/11] media: qcom: iris: split firmware_data from raw
 platform data
Message-ID: <2w4urjzvo3ccmwoggjzzxxjhfgmplfgd7ojj765yulnlkesoit@nfancaoqqvzf>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-10-acf036a3c84c@oss.qualcomm.com>
 <c9ab511b-c773-fd99-45e2-54fe619d3576@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9ab511b-c773-fd99-45e2-54fe619d3576@oss.qualcomm.com>
X-Proofpoint-GUID: QIyuFvdEZJXpJDnWTe4dIWsMhMTVcO2t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAwMSBTYWx0ZWRfXx7p2XCD8KWan
 Da8zwfFTdafJsbPB5+jdMgWTdjhiDijEfZTIsUI+YxSrOBLMcDhDKxgk/B2JKnWUHAm/eOMn/3t
 IRz5sgdLhRVTzMWGC+uxoWkHFIm9IqUr5bcaBmbee8U0IPNmegPy/fYGnXSr12EWAu5qCtTTElp
 6OqdPtO6JgmttySUKIVBe1su/o7S8owIIAkd36GqsEXb7LwpxjH5/1I/BTSvHKxxcUk0VEnk7mN
 /xqWppzEXsOMRnTelsUEn6eJwqxQKybED5FKn3AqOqSAqwKfc5W0fFD2o+u6ueRY3TAQNAlz6Sa
 xlg/wp8CJQatt7GykKZF7ch991EFIN37rn8CO60dYHY8ZapODeOxPWA65TDGwhy0odb6Syd9mpE
 cAs9Tqglp73ETdJWm9EQC6EwKQiaiw4iDQr5nTTx4VfZR4p4emfrKzBULigkJW0kFKCIdCxEU8i
 WIQLzNL2STsmsAoTe4Q==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b0b60c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=Gqhk3HSNDyNpLDZ6Q6QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: QIyuFvdEZJXpJDnWTe4dIWsMhMTVcO2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110001
X-Rspamd-Queue-Id: DA677259BD8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55283-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 04:28:48PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > index a936ab2aedaf..be3449861993 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > @@ -201,9 +201,32 @@ enum platform_pm_domain_type {
> >  	IRIS_APV_HW_POWER_DOMAIN,
> >  };
> >  
> > -struct iris_platform_data {
> > +struct iris_firmware_data {
> >  	void (*init_hfi_ops)(struct iris_core *core);
> > +
> >  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> 
> Makes sense to split firmware-related data out of iris_platform_data into a
> dedicated iris_firmware_data, one comment though, get_vpu_buffer_size
> should be in iris_platform_data since it describes the VPU’s buffer
> requirements independent of whether the SoC runs gen1/gen2 HFI firmware.

Not really... Your patchset to bringup Gen2 on Kodiak points out that
this callback depends on the firmware: we currently use
iris_vpu_buf_size() for Gen1, your patch have used iris_vpu33_buf_size()
with an explicit comment that it requires a bigger buffer.


-- 
With best wishes
Dmitry

