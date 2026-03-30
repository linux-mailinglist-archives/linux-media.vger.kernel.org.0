Return-Path: <linux-media+bounces-57677-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCb9IwrIymmL/wUAu9opvQ
	(envelope-from <linux-media+bounces-57677-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 20:59:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 780BD3600DF
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 20:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB9A93016723
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16303DEAC9;
	Mon, 30 Mar 2026 18:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZO8P1B1W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="en6EP9Ky"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C5B3C3426
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 18:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897156; cv=none; b=izQyy7Z/6PI/aK+69Ii9j1w2Bnx1uk0/qY1CtduxT2gR0a1Ubih1no5oi0GdQCWQzARDOj2S/z4z4HO+TpAmOVtIvGp6duHRf7mKvDubV30X4PbApj4gnMusgMtESjYzovx0LZnbUyGi1uSm+Q3PQVrJDXhr76Psr6GwRieQlog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897156; c=relaxed/simple;
	bh=rurzVOhNWsOISWAblSnsepOxzaSppT28rKrxnlWZzOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bp3ZOZuY8+qJF/8et3SnSPe1F+HRYyEvmXUp28/oovwI6tJB7v+gIaoSY1VpQ/Mo5Mas1R/0/MHOp0+m+4aOAzqiovAmOwIDBLEZAWcmvssCLB8MK5lsYeovPcN1BpklozaSvhjnRtJNELEOO+PkHKA/SWavOUW+nDW080DNjGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZO8P1B1W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=en6EP9Ky; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UIwfIo4053882
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 18:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5L+MSC4tlWhH18ltQL/d8CZo
	1W5RELdIZnlDlCgEdXg=; b=ZO8P1B1WQtykLm9L7Tgb1LwHKaGrrpWLsZdXSZNL
	z8OvUHBdsHKT38RjSzxB1BmhbcVrhzv2/TfHa5Ea6E0cd2kRX79Co1ZURBUvt6yd
	Q9oYAuIwvIX1Xw0+G4rnXrXHmw8ZaSxqp881689B8fNx2BCTwT2c8W5vZ4+Jwqav
	rjX2/nARk9Rud5L/nsuRcyJa2w8ppTm3ZJLnd9yvy5/UVgyDdvHnCqUdDzVecm0F
	7JzcScrGC1kr75xyV3AMoSC9vZ1DdGNHkSJrSvNbk5lmk5wBtKTgGvWlNjkKvAiU
	Al0cjo4gCmzPIl/ojhoA8NL/iVDU0Dac60HIA5czkwFlvQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx38043-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 18:59:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093787e2fdso240694091cf.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 11:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774897153; x=1775501953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5L+MSC4tlWhH18ltQL/d8CZo1W5RELdIZnlDlCgEdXg=;
        b=en6EP9Ky5PzPVO/PLZHTGsSkriDO9wEXre4h0rlHRUQb9V1JOxTmtZxzlpoIOyDhwN
         buXnYsfncyveI7UWGpn7Sy1rPejN4Ujn5HToSE4wvOozxKU+pusk9Q3mYlcjUuuSceR3
         c0nyFNMZoFUsgHsXybTIicfArqzskcuXtREKGpCOpIZZyQ501WUCVi4zv9XFUS5kk6YW
         TuX592qAomiRPk5K1Hu8ZzJeq2hUuom/I7lTZ9K94k7iAKGQ4l5em7YeRZnwKQbJK4kU
         n5zfWTEVL+WF7elOlqg4/kS/+YrQG75xDUzyCd77Yz245veuBAiw70ibhK7yV6jdFQrh
         40mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897153; x=1775501953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5L+MSC4tlWhH18ltQL/d8CZo1W5RELdIZnlDlCgEdXg=;
        b=mayBgdh0hHWEVq/NjSyEm3yoCvSPP8OOT7vou7oOXTLyTwt9z1D5lszllxHZLvvFTi
         OnfeDXsP1bKbxXolN2f6ojvVYHrFIPdlQnhdeBYZXkNmnUDvIbFnHE0hX69+Tqz9zpxp
         DpanUmkja0DfMJi37tDnfdsxCvus8ySk/9DRUq9YVJbmqDYAKf1fspyhRH+EOH6Cl5m1
         BAB9zH7or95EJOFdmA8oU6VSISIVLKgWEu81W0CTfxKjfR68q8XCods3Nlqn+PDdUQIz
         gOaoGlcLs+VRAwForiICVUbUCMVAiHy4mWy6jbAl96R6h8G52f2gWyyeQfyw+gaEUQzg
         tK6w==
X-Forwarded-Encrypted: i=1; AJvYcCW42dO0L5JDmEsnV8UK7Y8v334DV32za5ISm4aXxVsLdJTV+WyOBl4VowL9XH5+DbvhoSfJv+n/5Wb1GA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6LIC/j2sfb+4rAvy1gaz/oDjUP4OsBYb90e+F4oVFp5mx2hAg
	U5QZ3CybwLioQqKLfC5tSkRJLA/MtshHTQXXK3WB3h2ylSsfonHa0GvzEpU2ZqnZK39D7Cj23WN
	j2qrPzGNLgJSUk1gaFyBBF9KL/fK2WZ02Dnw/wTYM4RUVX+lVqc6b0XGp6EtMXeGy6g==
X-Gm-Gg: ATEYQzxkKI735cVa8ZwR/oicg3IZP8D5CPfkevDK68oHMdJAlSWKd/uCu6I5pNfdNrs
	SRiRrjmAg4gIaTKH9ylqitRwTxcyVScfR9Shnc4r0wuX4Q9kPuiBVmrzuRDA450SOUAoss/wK0t
	OT8A+33wrXCkAAa+jAH8711V5fvX4DveRitawgEACHSBw7vJkHs9dyxX3rKWtuJc2r0+WLAoYPg
	Nh9hb6pMIyHteipYSqHKZ0NKMLLhBLmwAkjZW6UwbqCyV518p5SPv/qx1DY23KHKAAtlu89jqYj
	Bc8iCCFPDblZ2KLG7zHc8u1PnVf/vDoW4E254Ehqyh+8sRBkKuQlla1R5Xik6Bmcfialqk33TNB
	LZtzc9dLvC516gtV0yscJ3f9CRFrrYKAo4hxXq7iIxJZjF9ZbZpEnmL6IigNNmd5o1UF9BnKDtv
	YOV1wAXEuBl+PhnDgazu+8gHyaFQAomIN+7CA=
X-Received: by 2002:ac8:5cc6:0:b0:4ee:1b0e:861a with SMTP id d75a77b69052e-50ba37d2555mr204548591cf.13.1774897153410;
        Mon, 30 Mar 2026 11:59:13 -0700 (PDT)
X-Received: by 2002:ac8:5cc6:0:b0:4ee:1b0e:861a with SMTP id d75a77b69052e-50ba37d2555mr204548171cf.13.1774897152925;
        Mon, 30 Mar 2026 11:59:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1444bc8sm1803053e87.53.2026.03.30.11.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:59:11 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:59:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: johannes.goede@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <eid56vtzvz5bvbmwcscn7a5zzc2cebivvjk77ofbonppu65pfw@45vfv25lx6v2>
References: <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
 <0RTUgDf1wbD0phPk8qAcojZovgMA_68R84FRaL_BHfjzupSA6c_8S5ogVerViYPFNJtvup9sOvL_uPx2t6-KCg==@protonmail.internalid>
 <2e4c4641-f631-48fa-b5dd-6efd70110dd6@oss.qualcomm.com>
 <e2a4e9dd-6a45-48dc-8757-244e201dd4d6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2a4e9dd-6a45-48dc-8757-244e201dd4d6@kernel.org>
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cac802 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=TWhWyw5ojoweXFhmMj8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: f8D8Y1KSHVy5JeKFYpKuv9nxkvHeiHih
X-Proofpoint-GUID: f8D8Y1KSHVy5JeKFYpKuv9nxkvHeiHih
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1OCBTYWx0ZWRfXzbsu3/LyO6ug
 RSFji62l+F1RfheRhd2SUI8SRZkVHzLGceECZCeoulOUiF5+UqxDTMEAad1v0Zl7364shwEZs5a
 mdORJ2CEBUKGOmNyuROn5WDPol3lefIMmb8HIZ3dxpSco51ABv52r98v0GKGSOkNJm6th6eRC/g
 GT9Y13CTSkWAM7vyHKzqCY7dRrioHi6IHaj3U94jUwrSo8IOZV47Bo7MHGj4my8mZnD+PDdIQH5
 42PlZdgM/8g6CbI8fNrWwE3ok/xORdtH97NvYG3uL75fA5fLRsK2bQqI4kj2WZcIKhdx7cUcsMF
 zgWmif6Is6OPi//oO9sgExXILUDeA3ajAnR5fOZ3mtT3EV9JXYEovA4kanptSWmiMXoIOASInDx
 aSSvhrJeuhswAOgvy6P7gsrMvzT9TpbUiu/HUQLiZEGaCnXgRZdknOC3yGmPkVOpVlF1vHnj+m1
 9ZVnEmZoXirJHca8KdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300158
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57677-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 780BD3600DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 03:32:55PM +0100, Bryan O'Donoghue wrote:
> On 30/03/2026 15:27, johannes.goede@oss.qualcomm.com wrote:
> > > That's another reason I bring up CDM again and again. We probably don't want to fix to the wrong format for OPE, introduce the CDM and then find we have to map from one format to another for large and complex data over and over again for each frame or every N frames.
> > CDM is a much lower-level API then what is expected from
> > a media-controller centric V4L2 driver. Basically the OPE
> > driver will export:
> 
> My concern is about wrappering one thing inside of another thing and then
> stuffing it again back into CDM and doing the same on the way out.
> 
> There are already 50 MMIO writes in the OPE ISR, I don't believe it is
> sustainable to keep adding MMIO into that.

That's why I asked about the ABI. If we have a format for OPE
programming, we can reuse it for CDM. If we don't, we have to open the
wormhole. That is unless we make OPE driver utilize CDM instead of
writing registers through MMIO (and instead of userspace directly
programming the CDM).

> 
> I'm aware of a project in qcom that did something with making the CDM format
> in libcamera and handed that off to kernel, recommend looking into that.
> 
> ---
> bod

-- 
With best wishes
Dmitry

