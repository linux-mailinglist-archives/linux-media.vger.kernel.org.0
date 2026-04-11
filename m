Return-Path: <linux-media+bounces-58591-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BflIWJz2mln2ggAu9opvQ
	(envelope-from <linux-media+bounces-58591-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 18:14:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D65663E0C5C
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 18:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6274301F332
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 16:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D5D3B6363;
	Sat, 11 Apr 2026 16:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sqev2Pvf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2UJJWEP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5BD3A6B66
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924019; cv=none; b=rUxmUmAnInQzaNNndZ13rmJYyNLCiPj8sHWGc3rvqwqXt3kwCP137AfO/iKIQzDmxfVDZdUQLIKsAwpT7wJKv+NaJJTxpvu7dG7NS+GpYRcUXiQP9bqZU/v8m/RF948iPM0PmzH2vEOE9ztUFZVA0QkowNHy5BKkNB4xivkhjvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924019; c=relaxed/simple;
	bh=XPPk8xVmWig19KGwQtcNAlRM8tu8IDnHngD5mjhrpNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxcSZ4JYUhMH9dWOoyA72fgy7PXX+L262G/LIJHyqKOJrKeJR6cyQIvUMKAWDKRdkIGFX6N/6AIqcJsj2x01ulcm2ZwFe6L0AOJp3jp56iFq7cRA9y4D1mQzy0P2+NQOmED9N/OYm1Cv7PXLdLNxL87Txe3Of6O8VFIGnphzUgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sqev2Pvf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T2UJJWEP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B9deSb287673
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 16:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dYtOThaUXkjyjb+N3FgamB0q
	5USepL5VcBjzyb4LiJk=; b=Sqev2Pvf4qeLg6bgvbnjQS4xel7qArO9j1WEGMQY
	a7N/syoPWxhP07ILdLFrQlaNFuytIEqgcjY1GZQwM3r8y5+h4zhUwuqFkuDFy31W
	7+aDKePebi312FUyIUxVRiPMGxybLcr6siqiXNCYRWeB1uk0rsYPJ2ZKYtXhml1l
	9CHjiMcxOgQtigS1K9+3XxInmWqzCTCLL9OdHmOkwYO8pLUY2RiyMx0shpMzCln7
	nT7jJPiv/bKTSEEACiM7/lbx4gF28KZQacA7ii4NFebDcO9DWPU1xMDgg1our/Ek
	HKsW0SGfffsCluHOHe9Zrn4Vmoo77S8xCmIIqIt6cHsgug==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhry27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 16:13:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b34223670so122331861cf.0
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 09:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775924017; x=1776528817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYtOThaUXkjyjb+N3FgamB0q5USepL5VcBjzyb4LiJk=;
        b=T2UJJWEP0RR9PaEiFAuYc8QrHpqFSeZht4+tV5gqyOEXCI3yIxhDmJ27Zb1J523Zx/
         Oq/W2KTroHFSs6LYKjSj1Ce0CSCaoQaXYhR+CMLcujGfjOYNNcYnGzbX3Bdnl6N/iWcd
         T3gDNf0BjSR4zz9vvd2L4HkE0jk0ka7iqx7W5MKtnHu7itAChhRnwVRutiB27HJI0ie/
         KSrQ8jSrIZ3qPSTHI2ZAtljnu3yTG7LxJi+N0hIVAD+wevkQg/8ltpRaiVeJwswAoAcM
         vkLCNXInZSAfUt8hGZM4gM704FJ2tnM29U0Sy+8UsOxQIJX9SPOjpSnrnrC8T/3XB6yV
         pIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924017; x=1776528817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYtOThaUXkjyjb+N3FgamB0q5USepL5VcBjzyb4LiJk=;
        b=NCf9RYQxqe1a6iJHzkIRANG7W8mn3pI+tow/qSb9EV3TPcuqkLqd7JwrIwsBmnRbMc
         Q9wAgg2lQjMi1X1mg9iyak74uo/nDIg85DvtRD1vQeyTRN5Rs01Js+UK4qu6EMuW9hEO
         7HWCvNpH0QKLmCBlPYj7yTzMQ6Gpyk+9tTfxfSjbJjZA2TZjdRfSdAn7+n4NYu0T3VF6
         bJX+vopRKUJpV0tbbB1tKi/MAznsNP0RDIGfTAf6HusSSMtiqhc7DSQgDFfZQxl7YnG6
         p5UOqkVAleIiSXT40Wqn2e8XiPBDWIXZizJzjXrdfav33ZNpYOo3FqCD9JyEx5Mjukbg
         PwxA==
X-Forwarded-Encrypted: i=1; AJvYcCXHhjJkEyyPXFwSCbDw46LdrQ+ymAoQvl+5bDLJGa4XwnJYd0MaOIKaGdRhHxXrwo24nxYcuW40mFdhiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymw4TS6RFnUwlxceTf7cq5iqnd4nn1T5S2aVBWRKA94KP+XCrJ
	hSDTdw8Yl2/odMt2mgu8P5He8GJ7TK5WhQCnY1+7tll//innXul6laFB5iWN/EEVHKSG95v2qC8
	l+NIP36vD1XTR8wdWgCE86V1upp7/Kn4WqhBD43fkm0rq6Y82xU7Ott6S9GOS9wmbqg==
X-Gm-Gg: AeBDiet6NGc9tJSSgJXbNJfH5cq/29VGxO0MsSSL/o4Ge90Uc3nIvFuITjh22J41Iuo
	RSDZl+zGoWHCfsZ38uYPyvuJWbsIf+w0Mapizah8WYTmDagJIXaQV5Y7E6uupozmipL+1tYLujj
	jD1oVH/X5Z9I8npyI39WnDa2mB2MKYgKG6ydO3vBDQlkXMY03PRZB1xkaL8mg3n40OYYDw9zPkZ
	2hcQy3TpDgXrF5BUSn+4oBNiha+6F4N8uef4Mv6qOoosXOnSTG06+GwAnTjER2lm6gggurfdOTB
	1w/6khTzbzXwd5xU/RJW+TabihFMv2wk+t6+sIYbOsboYjeiwKLYQKI3PSZDnV8Q3SaayPsrMKy
	2Z7mj5N4Jh1auV1JWC5OsofDpUghZkVIDUdQ+yRVKLGjLK5Hi8jWeHmdFFydoiIDvB+q7TXJjFr
	KKUJE8TtCpZO1r3KyTh4v0WREP0ELUptrJH94=
X-Received: by 2002:a05:622a:8e07:b0:50b:277d:efca with SMTP id d75a77b69052e-50dd5cc6a72mr86356361cf.38.1775924016582;
        Sat, 11 Apr 2026 09:13:36 -0700 (PDT)
X-Received: by 2002:a05:622a:8e07:b0:50b:277d:efca with SMTP id d75a77b69052e-50dd5cc6a72mr86356091cf.38.1775924016132;
        Sat, 11 Apr 2026 09:13:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeef3620sm1490179e87.57.2026.04.11.09.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:13:34 -0700 (PDT)
Date: Sat, 11 Apr 2026 19:13:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/7] media: qcom: iris: add QC10C & P010 buffer size
 calculations
Message-ID: <jeqhravjwd2lnea5eqejvqfzb3v47dmnfgq3l47n6raztzlsu2@qd6ecrz6nxmt>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-1-428c1ec2e3f3@linaro.org>
 <753kndrdrq6j67c3l7uvwrsj2ino7vb2chmvfwzmppo42kcd4h@x5wcdhdpzje2>
 <bb7abc44-ead0-452e-9429-6c6350ce69ec@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb7abc44-ead0-452e-9429-6c6350ce69ec@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE0MCBTYWx0ZWRfXydGzP1yCNYT4
 uFP8+uR2pu5wVNeCUS3uvHC+9wbzuFarcXGMNMR2z81obXuT5U2YYfl+nK6NBvktwYpqoRhC4j4
 LaK6QFWjjX2f2EUFzFdiBvIePWslDtwuMzfGM+rfW9Efhbne+tVG8gm6LDJeHp53d7rgfs3r4MX
 GgG4IfXum7H0sFg2JgaW5dS1cAUbhwCw91Lg0WG6RoKaTyzRlYizV7Gy5GVW7SKicxeV3y32SSk
 5OFpa/VdSZThlQlf5dDl4/rJMrqN/4Nao3hTeuUaQ47qQFwo3pm7+OSoKVfCYdy7kCl3+bGy8/v
 kCDiCorceQb3+i4hJoauT7/W4V8ly8AZyE3CktOCVcMaMUD/Hf0oStNznRVAVH6o65LeMBw1eSY
 PHaTWE3U97RuU2Y6Ez3bqzwfQLFmp1JxxpuS2+81BT2HnfmIvBTTnDppi3TStNt7EMwymomsea5
 vOdv5FXc2VWLkVpvoPA==
X-Proofpoint-ORIG-GUID: uGvOT3QITxqWi4m4SvC6eIrVa9AodTcv
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69da7331 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=FiFl1KPSSaRvcISL4aUA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: uGvOT3QITxqWi4m4SvC6eIrVa9AodTcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110140
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58591-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D65663E0C5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 09:25:04AM +0200, Neil Armstrong wrote:
> On 4/9/26 01:59, Dmitry Baryshkov wrote:
> > On Wed, Apr 08, 2026 at 06:43:54PM +0200, Neil Armstrong wrote:
> > > @@ -204,6 +226,55 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
> > >   	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
> > >   }
> > > +/*
> > > + * QC10C:
> > > + * Compressed Macro-tile format for TP10.
> > 
> > UBWC-compressed format
> 
> I literally took the head comment of the QC08C buffer size function and replaced 8 by 10...

You can be better than the previous authors :-)

> 
> > 
> > > + */
> > 
> 

-- 
With best wishes
Dmitry

