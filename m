Return-Path: <linux-media+bounces-38911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1E1B1B1A9
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 12:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C18C17BED5
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 10:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4253723817A;
	Tue,  5 Aug 2025 10:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aws6MzIz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3920C21B9CD
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754388155; cv=none; b=Br1hTjXorLKz+ckoStRtrCrARJB8P+9gyMFaPD7Lf256U3fcweTJ8xArBxocP1okkkLvmehUPw31Ie/9zr2EVcSHAyz+cuJKp6SbmROIV7F3kvmit1USz85kxRS5HW/NyYBiuDGI9fBOk68fTlMmi/zu9+IU1oW3bBvhDG4yC0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754388155; c=relaxed/simple;
	bh=UQfs52X08rztvnVgM1FhOc9rwkKBAgP7cDsq7fD2YqE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzIIrlw+++uiDG4Z9nC2L8Pywvmav6RWYWpTeMoJ589k0aiBoIeuMVEPVP0TBt1k8GLHUZj+8Jzjsqn4b77H4fxr0Zir3wZVNv5G+VkNFnyoVcbQdwA+1OOGycNFKgac0P1Py9EmzhwiKvQvP2MVlu3NbZTy3qQFAkHLkfCwKNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aws6MzIz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5757p5Zk018845
	for <linux-media@vger.kernel.org>; Tue, 5 Aug 2025 10:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r/pN5KRlZzw8ea1w7A8SZKyE
	RmRggaLryPkCmJYXwUw=; b=aws6MzIzuClxtzyT+DV1mLZr8MtAqM43ffErt9jO
	P5+Iq1ORKuAVfbvL6oEr2wCTRHr94eHd6ZetIutgGZfXz6NuVKuuGOzF1lv+xLr5
	DmV6Tso/7PobpC2PVv2uTDaNXVc8iNhckyrNje/pwS7gUr2+daXTePw5skS1Com5
	xily5cnuaJE9zVaAGN+PIg2Vmz+mmaMkluKCwyVq0LfR/6erQlMYwp5JVyH4qx8x
	T65XuLQ4OUpu5EdOBfaJzIDgIIdVALeyf/Aa/0a2no5Wl1pYLOQ/dwLrljlfMxKy
	owXj0TicAY8rQJzehffzgKb/15IYxibEAehUWyWG5sHblg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48avvub2a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 10:02:33 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4fc2f586a55so3329905137.2
        for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 03:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754388152; x=1754992952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/pN5KRlZzw8ea1w7A8SZKyERmRggaLryPkCmJYXwUw=;
        b=KzVHBu1lEsaP6yos0p7ydD7VNtL20SieEoSeZcnXOv4M6zsxt+J/ovq5WR6YG9wlEZ
         sVzVTaINuSmIJndJWXN/6ey5a/5LqfKa9rsm1QGw7zvNZZACajBJmgYCiRtxeBnzRyOM
         gN0ArEfMRISt8W8WnCbk+fG5cVIJPZz/bh/ekscAU/oEo9cv01zKbR8Yh8fO4pTOpI13
         r34J0a7FZUswLE255mhAPqJIJWg6x1p515eGrm+0JZtjLqT5fpfJnM63TrwekLtEUupS
         ZQCIzhhpbz/elKmI6MONY3yh8VyrdqGhSyDvxxX8M1lhIbjLJ2aTz0Zk6Fax5PV3R8nw
         zB2g==
X-Forwarded-Encrypted: i=1; AJvYcCUE45q+FYZ17EF9nkMcmXs0IYcHYNNlri+7Qn7WerUid8xaId+cG6yCxqpxa0l82yOuTTko4nBDR0Gm0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyERD+QPh8GqPfPko039H+ayZ+1/SHHgLZdV7x590dS2WAX0rvy
	tiQscFEhVGQqhKMNc9H0KJOK3RKPtks5f7u1UxbCQlY/tU7XAskxyntZkIoYQIyGqcUTg86bwbJ
	+OhbzwkH4tXmmrzWjROXTxOdj3RDepJZOx6oAhLPDwZAKO+5dFDR0OQ09j6ttKPlxtOBQJmWqLp
	A1
X-Gm-Gg: ASbGnctJWml5p4zlefwVc7SPmdU/3rd4xO+PXpPmxPaxfkZ96rIeTShNa39mEdpOQMs
	lrpF50j1r2lkwoLdes+MoSQOxWDVru35lvWAlaFZPUiWQHLRyi8DQflWuIH15jwDMuccuCzT+tW
	PEBo20SlKf2/EStAv4ywtg9VnIoB0wuE5E62YK+epi5akGUSksMhH2bXn7xeBM315v4MTtV/FBP
	mNcOUq982iDYMibw6E1L3NxZ1QbaJJUKVP2Gx5P/ynkVBeDN/DOpIVRhnPt2MKWqhWwKkI86+fi
	sX9JVXQSRGkf/ViwweTyiORfeneQdbwXD1ZaiFFNufZt5DrIDMCn05uTfMyRn4pcpCCy2g==
X-Received: by 2002:a05:6102:a53:b0:4e4:5ed0:19b2 with SMTP id ada2fe7eead31-4fdc2243659mr5411383137.9.1754388152103;
        Tue, 05 Aug 2025 03:02:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLQKUVXH95EUZeQRDU0eF0Ohtf/ON/jVpxNZP2FzfGcVyv6l60sKTLIkYICkYA8jVIdaoEjA==
X-Received: by 2002:a05:6102:a53:b0:4e4:5ed0:19b2 with SMTP id ada2fe7eead31-4fdc2243659mr5411335137.9.1754388151721;
        Tue, 05 Aug 2025 03:02:31 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c470102sm18416825f8f.53.2025.08.05.03.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 03:02:31 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 5 Aug 2025 12:02:29 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/7] media: venus: Define minimum valid firmware
 version
Message-ID: <aJHWtaLung8Ubdh8@trex>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-3-jorge.ramirez@oss.qualcomm.com>
 <a5c292ec-e59b-49f0-9681-a990128cbdfe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5c292ec-e59b-49f0-9681-a990128cbdfe@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3MiBTYWx0ZWRfX+DtUPqvrD8LS
 jPbK1VpP9CqDtYUpn0m7mZzsF+9inZocKQH57hW4STzawz8eV4P27stlrWfNv9vYeKxgVjzGGGX
 GcK2heKCUp6XVQuvzDxlYg4qEviuQF073GGubgmU5wmjZGHakqS7rnqd+CmFzmqfOhm5LB3sHgE
 GvgAE2MeJOYzMeKutH771QNtdIvKQFQL85Yy9ARNOY21hH8yOyavNPeB6fnaBno2UBHXcz6TW3s
 qzPTBXR2LtHej7l37kuszI/qAsFmou6kSNtJ2SO8uOV7G9Iu1zoIaZgy/ugoxhuQkbx/9bNLkPq
 av1FM5I4U3IO1euNNXWsOHnb2x/Exz2HXuLZ9AuLSU3SZ6tD1H3+uC5WnVp/i+EudNrJ/z5olPI
 9r6tBPmlJ+/ed6KU6Ye+nRQJQNDQNSg9/ogkv/c8XFfW8sTiMTXnIHPSZIBreJn140vf1OJ+
X-Proofpoint-GUID: OGtsqn8PNVhqE-t-_lsZZCz_oNFisz_I
X-Authority-Analysis: v=2.4 cv=OYKYDgTY c=1 sm=1 tr=0 ts=6891d6b9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GmUu7VV6tgk2skhn_1sA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: OGtsqn8PNVhqE-t-_lsZZCz_oNFisz_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=919 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050072

On 05/08/25 09:29:55, Bryan O'Donoghue wrote:
> On 05/08/2025 07:44, Jorge Ramirez-Ortiz wrote:
> > +	if (!is_fw_rev_or_newer(core, ver->major, ver->minor, ver->rev))
> > +		return -EINVAL;
> > +
> 
> This is the sort of error case that deserves a kernel log.
> 
> dev_err(dev, "Firmware version %d.%d < minimum version %d.%d\n, etc);
> 
> If I were to try booting venus with an old/unsupported I wouldn't know why
> the probe was failing.

ok

> 
> ---
> bod

