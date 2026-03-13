Return-Path: <linux-media+bounces-55761-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Jn2CHhPtGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55761-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:55:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B97E32885B2
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA5E9302C728
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7A13D6470;
	Fri, 13 Mar 2026 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bM03dwxr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VB8Ozwya"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2093D6478
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424497; cv=none; b=ewUPj4PIuS4VoLBDjqYClPWANKsap182WK3n1hiLfWKTRKcoxPyhtyuHCjdp7Xs15V9GsCZTKBezRVRJv3MOgPTMk2tIeRsTho8nX3ST01i80J4fyRaz1C3vxZw1xYmmZ2WUZdGkYT+5SwL3lF4Q28sPmbfqMoHcrBk4gwWpS0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424497; c=relaxed/simple;
	bh=Bp2M7sSZfRF+plmr7ty0KKNhjXKHyWfVTdsuLufilp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3rIe2YIPofXdY6h1m9Ot8jTOuwNmyzOvyRq48+v98G6k89TbEJctzJ+g/NLSTyHRuU+7YgGkmoMeG46+fiHj1Bqv88Y6+f936tMP04xzH7yACudsFGZJVaCs8bmw+RcGyIaS3J6qf2ijep6Kr1GWYRcVkSQi8zwvJZcFtHI46g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bM03dwxr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VB8Ozwya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAmvj92391118
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 17:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cYu+P9LwBMsQaaLA3dtI/fDh
	5gGTPcAFuyKYQ49R2QU=; b=bM03dwxrTzkqFagZBCY1y1gq0ijLsMpkFkn6t17e
	Ii5cxNK+kXUsxi2EdKBAnCQIxaKGQKr/Qgeq+HjEyowZK13lnGbXkIzWhlFrog/l
	Jk9P13VDwanErtVKtvBRkvi3oTJMqhFurKMVMMIB+T/e3JljBAkSNvSqrptAaph5
	O7cnapOralMwKm18zQw4jpmR3Y98SpfRf09WyqjO24XreJH/rh8EOGDzVWUvlLIR
	pqjKt6Gwl2ts/aV5HRtUFzdXMl9TLL/h1Lgbw9C2Br80JR8RL615Upc/hJ9U11WS
	bFHaHx5Wz4933X/TVVwWkePaCWDQZPp77AJqcPrypGvweA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m9e4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 17:54:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81506677so1407405885a.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 10:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773424494; x=1774029294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYu+P9LwBMsQaaLA3dtI/fDh5gGTPcAFuyKYQ49R2QU=;
        b=VB8OzwyaLyY070p9U9J9W5J+NB7LmHJsk6XSFSYz+eHiDvnKVH4lhdQql4nRlGqcy9
         wea7mYiEFP2k2GuMeojm3HMjEk1Sw6eXUDyVweD42g7HTYOnyp/0Fx6jXEqXEQ9mNq7T
         TLHf3ZBjPom8PkRUH5htH9osC0tKNtVtGaNDd9+ND4Av0U7hQ7L16kTP4TCs13CkqQbi
         ZdsFB8077DcDS/Sce8VsNrfi1rEM9Lh1AYzC1bf3jHHuKZ8AVsdFtsvF18ftGa0W/JGM
         9tJAJsgUB0LQu++p1tuhnkRTGHidmA7sC8FPx8SXrniKJZPFP3bUO5uFsOADEdDGdH6B
         IgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773424494; x=1774029294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYu+P9LwBMsQaaLA3dtI/fDh5gGTPcAFuyKYQ49R2QU=;
        b=PwjvGisIc3Rljibzsd7JqPBg6pcQOgWE/0CdApjB7yXH5rXWFQfipk3GwpQqG0j9DL
         EdLfnQ8ekzIghCKl2DoJOOIed3nYmPSDFkyIwLot8YoX7T9aXS6M4QV8XyypMnyzrtTr
         arY3GNHHD4/MhCf3L0pougtLq3neKtzWoyD0YeBr4wzl6hbe6ToSIUygp+I+rO1StNCL
         HEsNoKo3S4rrx9IF0icE5Wbz1DjlaMM2/BcPpBXxQravUgqPXeFy4zuDZ6a788/SK3rs
         NBfmfSS62PIOND94CVgCQXFgeis7vee3mFhn8Hlw0MictQCLMAg6sBVrGApR7fKWUzUR
         JkqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfeiJgcIf6cet8qjVp/+XWlP/RKyQzDLawaoAyQHbgNkkKEk1vlsnwHTODp5sosTHyhUExrlWemiF4EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/lyEV/RW1SgcS9GG4z+JJ+BDmdoOwSHwDC673Pym6ULAEf6GG
	Lyz1ksl2EGYMEIkFh7ogqeO0UhqNFupMYYRYKmQZqf7Pvao5saqRBudg1RXml+zLw2atZhIVlff
	U3el9++ZZDve1MAyDcddcLm969HajRcTG5r7EIYmpACmD6qDLmd/sh8C8J3f+rIH91CVNF1v4fg
	==
X-Gm-Gg: ATEYQzyKs8B7ZehSlW3FtC98NTSiwbyGJutSRDoUMAN3nqxFjXReK7B+ivuOuiIJl/O
	w2SWqTPkNjhE7mJutEqqf88EiacNOlqNUaMQXtnqFAh/BHJBjbjAxGbjPTGXx9L5xcSjrC2EnZX
	Ge2+y+lQrsbG04ol7jeGn+x9YdxWqVp9qK4slVyE8DdIEZDy5m86qUYCAyPMbqcV3JpfenhSTp1
	Qf7OPw+/CzT/X1286BeqOJE+pPSG8G4+4xzIkpP5uxtBfP2/DycEFU5GHJ05DUeujaMr5bAm9HF
	oyXTLesZrST9g1SBv6d7ksjOkjQIn5+jJcqQ5ennjWC9GnzUQejFFkJMYDVSf1Y3oYcKST4odWD
	oAGj8eB0HkoQlfS7wq3x9sKQT2Gm9ErvdGnJYNeoTIOamlCKxTc9qvMyUw+emD4nxGcltX4hOrU
	fUBDfdQwzDt6KyuVhvBqlUMXRciy24KN33Bnw=
X-Received: by 2002:a05:620a:4443:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cdb5bada99mr600402385a.59.1773424494386;
        Fri, 13 Mar 2026 10:54:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4443:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cdb5bada99mr600399485a.59.1773424493930;
        Fri, 13 Mar 2026 10:54:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33be6sm1676656e87.7.2026.03.13.10.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:54:52 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:54:51 +0200
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
Message-ID: <k4ldvfvtwqn6pr65sjk5jhgqmkdy53klrifszmj7fsv5gzcf4c@23kt4sr7cba3>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
 <20260306-enable_iris_on_purwa-v2-3-75fa80a0a9e3@oss.qualcomm.com>
 <owwpmly6i6djvocnd2co42x67a3xd27kxem7x4hl462n6t6dv4@hpjljecmrlho>
 <c023b313-ab57-4fcd-92ce-c3ef3be95256@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c023b313-ab57-4fcd-92ce-c3ef3be95256@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rBReo3ASs3ATwHoqu3CZ-Ps7_EUjTAvN
X-Proofpoint-GUID: rBReo3ASs3ATwHoqu3CZ-Ps7_EUjTAvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE0MiBTYWx0ZWRfX3cl9FfZbkPMC
 rJfKdRY8fa3aX28Oe9/b70Hxrur5FhGbPx4+iNJj5YLWv0Qv6nET6wQNC5yYLEeFjzCv6QWdOk6
 kBpkUnfvpb/4CWzHN/fQwpHLF13QxA3jHHjfc8GpYTPuKkiz7T/om+p/95KHYtnxiB9wWkW0SCd
 nlxrrPogbAenGxXrbHEzoN6SnayKa4TMGaT8gWIK2I+6cxUsQbp6S34mkXTDDTm8YC/Pevx0lLy
 zez+TI8jCbvnmmw72Aye5XKDNHtVxRAgAgNxxI9ROInIEn3SRYe6ET++KKiEilHaptgXsQQcR8J
 YeGQ8xgmFzcWKlhWyWHPisALmd4MCwnBnm9YAmzn25EBNzHWqSYqXCFKz31IsCxAQF4r5IKS2Y5
 CRRwMcHtzrHngaNdZBeNrTndtlrxlQ/qeR8yxR9Rwe2gjRQOKGJaUYoYGzASRMWZP4rOvrGijwF
 gIavNO8jn14X7hzZV0w==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b44f6f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=RryONDYhwSCH4b1mebEA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130142
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55761-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B97E32885B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 03:14:37PM +0800, Wangao Wang wrote:
> 
> 
> On 2026/3/10 7:58, Dmitry Baryshkov wrote:
> > On Fri, Mar 06, 2026 at 04:44:31PM +0800, Wangao Wang wrote:
> > > On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
> > > the power on/off sequence.
> > > 
> > > The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
> > > of the video codec hardware responsible for bitstream-level processing. It
> > > is required to be enabled separately from the core clock to ensure proper
> > > codec operation.
> > 
> > As far as I can see, Purwa is a one-off. Why are we forcing support for
> > the platform (and for the BSE clock) into the generic code?
> > 
> > > 
> 
> So should I add a dedicated power on/off API for Purwa, and name it
> something like iris_vpu31_power_on_hw() / iris_vpu31_power_off_hw()?

Or iris_vpu_purwa_power_on/off.

-- 
With best wishes
Dmitry

