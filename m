Return-Path: <linux-media+bounces-57676-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMrWAoDHymmL/wUAu9opvQ
	(envelope-from <linux-media+bounces-57676-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 20:57:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5536007D
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 20:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A81F5303FA9E
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5646C3E0C49;
	Mon, 30 Mar 2026 18:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9g2ffJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtCXWk30"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D103C3459
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 18:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896930; cv=none; b=r6Spic/wbhk9kTKz1HAPXAqgc0qa/+q5Gw2Gzu23I8vqo3NS6MaLjhTdyt1vtVUWPNTEwCIf0DixGWMRXpY2HsDNK9B2M28jXznNIpZoCv3JX/AUDE+S30th0K4GPQ0tcxYjCDMhACiRBMuEdjKYVqokhhwJMBAp5CBgT5m/PYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896930; c=relaxed/simple;
	bh=lGafHO/0r8WWuHXe/cXHLeBbaM19s3GZJJKUga4SWRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Em3M1a4G5SyhitVhjsuY+QcCAEIAYYtR53gZd6VJDdzTNuxs/6PVCXXfjYpDphRxyObF3Gttml0z702+Zj4QPqbtP1WtpQ4mwStl8W7t6SnBQWWmvFIzU0E2kpqOy7JWwRHrB6qCzy5o5yFut3o9IBDmcGdGLVV9eybEUBHoPHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9g2ffJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtCXWk30; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UHc1gh703473
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 18:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j0H9FaWAU93pFITtwnjoYm1P
	ksncwdbCPSGTYYrDU6M=; b=S9g2ffJN07rxfiBSAuPyINoDRi41z3+uf5HL/fLT
	LdXcTsi0p0YeGGCzNlfMXKO/0fUWi0G009ec3cKgPDUZ9YSk11mvB+ha8H9/9l2U
	WZq3od3gACQ2+DTc8mM7Bjsj+S3+q3+cewvAjaf4p4yADJUlXdfYnw4349NyjSya
	xP2kJkkk45dCOfeJzX8RL6pcx2JAH0uA+jN6sRhw8OJHM/eUqTq445MBuxwfU7yO
	iNwi/CdYuB5qgNUEXt0vGaNeOBa+Farp2Fw++MZV7IK9QbCtsy4coZAFMBq4QD74
	hrXbb7JBB9/0bqFERsvCYCb/g1momcwzdCGM5S7N5TZDqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sansh44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 18:55:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b802961ecso65219271cf.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 11:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896927; x=1775501727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j0H9FaWAU93pFITtwnjoYm1PksncwdbCPSGTYYrDU6M=;
        b=NtCXWk30mLkQaKm/9v0RRoRQlZ3ERswghlP2/7hd2J8gLsxJHhjImIzRFu4Kx6KLLH
         5FnHZgp0WuarePAieJfGmbb3QHFRh18S57m9VChU0HpdQdjKdKZYUHWYOXyNUR309xNb
         Sa2WD83898892P3yYkKW0u3KaSFzZprdD1iLB+XuRd/0mn9asNyP4UGt5jad5obhevIn
         o0fHlYsJuQqe28JZ3gB0oHiFNbJKqelmG5vUZ89ta/uFtjaKG0etCTTdclNFlHvaOlEE
         mc1UuofBdMDPpY4qHPgq4D6JKJFU7CT+ixUck2yLjW/ZylS9uSalqtmSuJBNzhQ4mUay
         jXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896927; x=1775501727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0H9FaWAU93pFITtwnjoYm1PksncwdbCPSGTYYrDU6M=;
        b=cwCM1FB0RgPMGnGMuuuaIDgrLW83aLkDIhYm4h0f4Jr99SPX/VcWdnBdRN/i7GiS5l
         dy/bqLprH4e4Dnp/eVwhnf3FV/iYZ4fzhCf4U0OobucfeFyQE+MP4eRnvtJZI2RGdVLv
         UZBRCMECZxofF51+mKmJplSYYcwLHDt9u1/WZ817u2e2dFXfpSIGniYEUIWM0QbWGdwc
         EDqY4vvNlqKzNEt/bS7ke3+2VhxyQnaNSUOkoNOJVckQSSx6R7SL9PrZmamCPEuCA8go
         1UKKp92tpX6BeJ03FQiR9TEFs/XtycULFgagI6z/f+qlyVMMLPSfUm5CxOp8mK0AX5Mu
         mXow==
X-Forwarded-Encrypted: i=1; AJvYcCXEuNh7FyaN7P18nrI+MKCRkXverDlDRyAFtqk1unUL1TgWubK3kJSz23cdQwpoSt+HOXjuWzzxUnzE5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF1j6FESUqkkBSaXG7Kyr5x7N/dTb3PInVriVwnOWRZtaftKMw
	k8cfWWL/Zfo9zbxKYpHq8fsbpxmITfaIG51Mr6UeBuRDbmBJLC8QQ4JOpzTkpbplcUnezZV/MNh
	AwaIh8UqzGeRlaXVv2KoeGgdrOn9qYqS9ry/c5MnJBYPEMGoiTZZCi4CSpxZUo68iq2w1FsuPxA
	==
X-Gm-Gg: ATEYQzy8NoUUMSYvy5rIqOWqXZBzxjv45g9FEj9UNxJ9yuQp0bCEOpkC0yfGCpOMwMq
	28xqGWgdA9QyZCA5psNngmpVxBW1BiNdUoNCDwKe0cawrVYHfru14zUKjB6lFNYofIVXcE6RRko
	CN0qBILrDRvSU/4jIV8/GMgMs6jKcXKaZ+PnXd5micg0E5DiGLqqcHuz7yXeJypwYmK4CBFKkUt
	MtBlVZurLKOVuODmRPnEeQwqUARZ7J9FlZSdIEtbGotziKVtMK2bNeoCpRw985T2WSqIa5mel/Z
	EJqWUhn8QwA3NdJ5TgdD+nynAPU42sOf2tPiJTmZg0S121MmlmVHf0ThK6UR80Jl+9SHQWkdn8y
	Ae/sOrW3R6DNLs//9gNkBqdsJ9bZ8RZY1/CbJ6G7p0aGRPn0jgCsm7fgWZx1VkAGVD0KyaNjAe/
	imhzue/eN7WSVXcWuieqF0pv5Urxr4vIRv0kI=
X-Received: by 2002:a05:622a:4d09:b0:50b:52ee:62b5 with SMTP id d75a77b69052e-50ba391933emr188510651cf.41.1774896927317;
        Mon, 30 Mar 2026 11:55:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4d09:b0:50b:52ee:62b5 with SMTP id d75a77b69052e-50ba391933emr188510091cf.41.1774896926744;
        Mon, 30 Mar 2026 11:55:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145de35sm1839702e87.74.2026.03.30.11.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:55:25 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:55:23 +0300
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
Message-ID: <4hasliun3wkook2pvfkntjlzs7elu67ine5q7nd7ptjthx5qvw@rntvb7lnajpc>
References: <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
X-Proofpoint-GUID: DtbWQTTP8thDB-tG2vcNvn3E0mlQ4hli
X-Proofpoint-ORIG-GUID: DtbWQTTP8thDB-tG2vcNvn3E0mlQ4hli
X-Authority-Analysis: v=2.4 cv=NofcssdJ c=1 sm=1 tr=0 ts=69cac720 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Lj28aCL1S1MqH9smhIUA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NyBTYWx0ZWRfX1FAU/dkxdUA0
 P+ioxXv97+j4c9/9upO+erhuyiwVng35v2mn8b6eelm21XBNzkNLZWWfkFn1b4e9/iCCfXzWS5/
 36AiM1RZ0bTYf5IAwPlPu0HaR7ioUr2DPrVEDa17+4VTha0g9j9bqmVDfWiEnYSIOtAZo/NBlE4
 Kw1UvTocirv7LpRlpdbpjsgPSEPwC/spTlUuNYDeTaK9B73plRAwV1o/FEZQz4BMzCsTQGCJVgY
 c7CD1W7djD9e5G7OBDzIglXf+JNyM2KBN/iAbiPMekBvJqyPHOlGp6lJxmLfpACfdCeWP3bGjR9
 gz/V0SJwj8+0muRs3r6KUTNsdq/yISZ8u7EkWkCXHyj40PH7M5JC6Tg6/cKqgHxLPtvmYq1s/yq
 wIg4AxUALnOGeCrZhc0Oo4qXrZFRvqA7qeJhvNSNag8jQ2vqpVbQhSQzSnzuQBxf0bUS9sBuhsI
 RQzlQ2CnXCtDfp4ujxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300157
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57676-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 81F5536007D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 03:11:58PM +0100, Bryan O'Donoghue wrote:
> On 30/03/2026 14:46, johannes.goede@oss.qualcomm.com wrote:
> > > > And then your CCMv1 or CCMv2 helper will get called with
> > > > the matching parameter-data.
> > > This leads to userspace having to know exact format for each hardware
> > > version, which is not nice. At the very least it should be possible to
> > > accept CCMv1 buffers and covert them to CCMv2 when required.
> > Yes, but a new ISP may also have a different pipeline altogether
> > with e.g. more then one preview/viewfinder output vs one viewfinder
> > output for current hw, etc.
> 
> My scoping on HFI shows that the IQ structures between Kona and later
> versions have pretty stable data-structures.
> 
> It might be worthwhile for the non-HFI version to implement those
> structures.
> 
> I keep mentioning CDM. Its also possible to construct the buffer in the
> format the CDM would require and hand that from user-space into the kernel.
> 
> That would save alot of overhead translating from one format to another.
> 
> That's another reason I bring up CDM again and again. We probably don't want
> to fix to the wrong format for OPE, introduce the CDM and then find we have
> to map from one format to another for large and complex data over and over
> again for each frame or every N frames.
> 
> TBH I think the CDM should happen for this system and in that vein is there
> any reason not to pack the data in the order the CDM will want ?

This sounds like the most horrible idea: letting userspace directly
program any registers in a way that is not visible to the kernel.

> 
> So probably in fact IQ structs are not the right thing for OPE+IFE.
> 
> ---
> bod

-- 
With best wishes
Dmitry

