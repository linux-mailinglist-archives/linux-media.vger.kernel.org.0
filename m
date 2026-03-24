Return-Path: <linux-media+bounces-56917-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MUo5FMsBw2k6nwQAu9opvQ
	(envelope-from <linux-media+bounces-56917-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:27:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C898731CD87
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF0A2302FABE
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 21:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BC434C989;
	Tue, 24 Mar 2026 21:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kfi//mS+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kP2kYhFU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B69B3537D8
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 21:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774387643; cv=none; b=ApdKhX7sT6uh2/axUNTSie1RayXVpBncCFMF8/63P/1BzScWCFYz2xaqopn8n8HtgNt+6NJ3WD4v2TBv3bAvlqK5qeMGbv1d7eEIHclj5lOhSHE9yhAa9i63nIPvNY3PwU0mRKQ+tFVvt32Ukim5OSEIvLhU8aK5Oq+FphFxYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774387643; c=relaxed/simple;
	bh=oUFQ9sIF7fKPX0a5zGIhmqfQdn2/Vcoqm1/nUEgvIso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srvfR8m3hVlwps1NL4/1FVb4IE43zxPMNromTZzP8DQWRtcjpY3K7wy15PjUMNnRvHshtZk+aTwzsbWf0r/XI28daHpckCkx3hYfSB1i7LkiG0MfmhZYvbbWqLiS5s4RcUFbufkQ4/fTKDby4CN8UCGRTxk6EuhtoQw5QLm8zmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kfi//mS+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kP2kYhFU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCtxs2807972
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 21:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qj0REh7yFCsbXeGvGp4+pn7n
	G/Wi6Y8obBIN/fmlGhg=; b=Kfi//mS+7yzdtBk1AxRZ/weThhpS49Cad+JQRWYS
	WXs2xZN+wiZPSMFwCC1Odh0XnTr62l0DPMXwF2+TvBtqQhWHDbh9dTulwvgx7XCv
	1lhlMvI1R5ZNXmCagFbmOK568yH36kjtzvgMdBjOjOpzwxNRyiR9f6gUpC157yWh
	Bgjmz5yQLy2/2dtuVT9wfMqx8+edAM0pyHczOT4VsUKlt+ZQkSR9CXxzMjVO0wiH
	MIYfOTsmPvZ1NDt1t1t4SRYzWGhBtC41qZHSw6cj3Mlwd6jBVDCYa+6J3NN6y+dc
	p0SRs6PkNUf2umzneUuMzPJKe1m2V9rFxZlm2RdPvsSoTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ej5bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 21:27:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b781542c1so35165971cf.1
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 14:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774387640; x=1774992440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qj0REh7yFCsbXeGvGp4+pn7nG/Wi6Y8obBIN/fmlGhg=;
        b=kP2kYhFUufva6e0eIFWt2iIw5tu0P8M/RsNBEHn57DSZMRrH109imHfFr8hGuWQJK5
         56XGJ9U7X8RiCHS59GEH7X5rfIHFa/c8r5TtdW5XyRXgw0T4xEkeoPD4o1CLM6AkmO4M
         Due8sO50Fv20fA//3xju35fupLVmvBXylkRKvcfILyrifFIeMsoOJgOziVxYvPP5AkZ1
         dKJK+/Kc8xqhVjkWjCDgCXg74uIvFQ/aeRYoidWpoo57YLRrEE5MIxsiYjWRJrmQ/Ajq
         MHw+EFPly0PJCbjcAQWkqjzAGV28f7HqpBESV5AlnKn6bUy6Rn8MPFZQNjFKGAAJ66K+
         INCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774387640; x=1774992440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qj0REh7yFCsbXeGvGp4+pn7nG/Wi6Y8obBIN/fmlGhg=;
        b=OQw4Xik62fwammaefKvl3Mi+kmAIldLDEtDiLMNILYOV1uqshXhyHm+V4VAVOasxLJ
         sYJvFeUlX2j4HzhaAkmz/n+cFZYKddPLwKYKSe+Joa9EKyJR2nS8chclLVpFyyXjkuYt
         KsLJN4nXSab+WbOUQwYq/9jZ/DVL3vQyXF7gpfksnXc7aa/2mUbVtqJBzWMJVEyTOu9B
         M/1eSRnOo0VdsFyZIOPoUdiAs3A6Ss9GaYtcV/z/f6zRZPrWA5kT74iEPDQLH5tQiEZo
         Z3sXp/McEzOquczSSJb6b+SkfZY03VIkdfBs2uhL9j6nGusC+TP7nV8v8S//oLFkgi4k
         WoYg==
X-Forwarded-Encrypted: i=1; AJvYcCVmXksxaKbo/GC/6mHf5FNWc+GJnmVuzAbi9yco/KMBvdHjP34kzv96TJ4AtT4w6eYf99CntB0YtTr+dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Z5Bmq1a5uK7KgeYzbcgrt2QvJtPwDm9xxvZDI95B03O5LMlj
	IukNoPlLzXwAUz7uKVKDBAO8uHsCZGKg6HrJDBG1ww4bg9ijuLT9Wa06nepEpmgGA4kl9/IgBz4
	gb0J2InyZkjO2Gr2+wOlgnE6Gq/OWe/g3m8KcP26NKmsIKO86lafaL3TfFX+cpqM+Lg==
X-Gm-Gg: ATEYQzzZ9Ozxd7sIl40MguO7g9a9diyIoUZX7lf0/n9+SBgiVyJiQVFmE/44qhF/eV9
	RhBBQuL8OHkyOdqPyFUkQGvbH9M24gUMQ8qUWyTKMWBbzn8G7wXQvXFuQyay//5gxkXrgpgkDaX
	ZYyIWYFBu5UdOrRYW4r3RF0QL10BwjjrI4+AEMYYdqf6nQ8dZEKMJnQ/miI4ybDCpJLa/14MSTs
	I5UUdNfVGVaP2tqbasXuzz/zosHb0Ekz2rMcLz7Mdnyw1vukobnVRkIogQjKlnlDRP647PwZiWf
	1eCVBoijcDPjrG/yEvc/3hEEnVoMVwaSmq+Nw9avFr6hyneIyrKc3Ttczqg6/AREbLH7F/meyIY
	xcdkRZ26NV4UAsWgWSySSSWd8YieY/2sqio1z+hAMh4yEUuiXuHjtLSTZkgQojLS5BYXt8Asy0C
	XVnYQOWU/bhUWmQD5arxw4ewxgttsrAEPPepM=
X-Received: by 2002:a05:622a:5e10:b0:50b:4ccf:135e with SMTP id d75a77b69052e-50b80d89e4bmr18668891cf.31.1774387640403;
        Tue, 24 Mar 2026 14:27:20 -0700 (PDT)
X-Received: by 2002:a05:622a:5e10:b0:50b:4ccf:135e with SMTP id d75a77b69052e-50b80d89e4bmr18668661cf.31.1774387639965;
        Tue, 24 Mar 2026 14:27:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c3aa03bccsm5014921fa.17.2026.03.24.14.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:27:17 -0700 (PDT)
Date: Tue, 24 Mar 2026 23:27:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
X-Proofpoint-ORIG-GUID: HXtoEifLGloZDQerh3LqammmTx2-J0Mg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2NSBTYWx0ZWRfX6JvN8wddxzjy
 dewFNVyNYPJGl5JTUUmvypxfc5MwxHeYviCTL8RyCxcVgQgzAL+abbY5sHZybon0+7Nu2bBPqGA
 +zsXBSxKACv0oBFd/1G56RFvfrX2hYK3gOAAdQZMhP6/AWMi+HLoBXTJUpSdgNIRPq+zUmaR86U
 OU7RxsfXi333dbt9wZl/NMQRN53yEq0FB9RhB1Hb1EPo6aSdDm54k/8brz/PkzOJbXy/Qjv2o0C
 l6Rtfne03/LAwdLxnw2HsxlXeZmRcXCQboeCPLVUkDHRLpdm0a9tUHrCbOiPFBSxFY817j4poiS
 U+LuaUljcmUvtnbqPbJYQGEWPkL5mT6ikNfCBka5adg8cUOdmXjfzC3g2eNf3hWhtK+b9hb2pZx
 VaVedgd5mHagsHFsvnBsydEtYTao23IqiqQsLnYlvNL2hdxvagX7kIBdgN+fwQ74piN1QjlLdjV
 yykIIYVYirR2lSIl6XA==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c301b9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=l4Carxc1wWiaQxiGSvMA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: HXtoEifLGloZDQerh3LqammmTx2-J0Mg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240165
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56917-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: C898731CD87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 11:00:21AM +0000, Bryan O'Donoghue wrote:
> On 23/03/2026 15:31, Loic Poulain wrote:
> > > > +
> > > > +static void ope_prog_bayer2rgb(struct ope_dev *ope)
> > > > +{
> > > > +     /* Fixed Settings */
> > > > +     ope_write_pp(ope, 0x860, 0x4001);
> > > > +     ope_write_pp(ope, 0x868, 128);
> > > > +     ope_write_pp(ope, 0x86c, 128 << 20);
> > > > +     ope_write_pp(ope, 0x870, 102);
> > > What are the magic numbers about ? Please define bit-fields and offsets.
> > There are some registers I can't disclose today, which have to be
> > configured with working values,
> > Similarly to some sensor configuration in media/i2c.
> 
> Not really the same thing, all of the offsets in upstream CAMSS and its CLC
> are documented. Sensor values are typically upstreamed by people who don't
> control the documentation, that is not the case with Qcom submitting this
> code upstream now.
> 
> Are you guys doing an upstream implementation or not ?

And there are enough upstream implementations, even coming from the
vendors, without (or with the minimal) register specifications.

> 
> > As far as I understand, CDM could also be implemented in a generic way
> > within CAMSS, since other CAMSS blocks make use of CDM as well.
> > This is something we should discuss further.
> My concern is even conservatively if each module adds another 10 ? writes by
> the time we get to denoising, sharpening, lens shade correction, those
> writes could easily look more like 100.
> 
> What user-space should submit is well documented data-structures which then
> get translated into CDM buffers by the OPE and IFE for the various bits of
> the pipeline.

I hope here you have accent on the well-documented (ideally some kind of
the vendor-independent ABI).

-- 
With best wishes
Dmitry

