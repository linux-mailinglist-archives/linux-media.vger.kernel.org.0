Return-Path: <linux-media+bounces-61374-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHO0DhZVBGqMHAIAu9opvQ
	(envelope-from <linux-media+bounces-61374-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:40:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E46531741
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3AFE305978E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75A33E7157;
	Wed, 13 May 2026 10:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9ldTnEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eiqP9Ahd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411C639656D
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668801; cv=none; b=L5ZcMn09ND+jSk83DdDPZzIwGaXgg8BNzqXCFz2MpZDL8ivO6n38gkX6fEc0BULyoLuf46ldNBT/8gvtvxaW3pxfb3yOtWoupDOfXM3Bv8oIgSSoeWsSt1CsiQVc0YUi994eBIOknl1FUZcW/YqSdtq028MJM4apOtEmez1aA8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668801; c=relaxed/simple;
	bh=LmMlAWfOHponJ5NadPPNi179OuVV0BnqGf+wAfktPgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2uLagV56V6VfG+VCg1gIbXd3M56+RXpkis5hOSI89+fiR5gvQT8IbAJoF3hiFWWZstB0oqZtHIaPFBMrLEKrjoSAvnKZirGqOuQKV4GrpvIZz1A7UsWKWescVp4BmD6NP0il95U+C62shl2S5dkmd19rskNTDdkprM/OaG6vFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9ldTnEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eiqP9Ahd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D5JRZM1393072
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NhziQD3I23uQmmb/464nQidA
	k5Ck271CFtU+xfIGgWw=; b=J9ldTnEuCPlz/ebQLONqlqw39oSWBFgP3x1pUC9S
	SDUBN1REBm+wA1/82WlZr3egw/d4QJyOMgJ18K2vvKaLbDEY7uuQI4WPS5jZvEA8
	0FwiJa5K29vJpb0tt1y/i2e6uBbxG+otvk/E9jeYD+ChAp30tvvOVUOuxKyf7ewR
	vNpzOzOoEzKc40PhIUbimfT/tPN3V4vBTDuEak/yo6prl3gXBKVt+ZMdtB9xhbnj
	NmCZyXsOBAXHMY3/TfDvQXZg1+62t3y0RiT6IawbduQXZJyuxxhkwQN9iOgsHpVC
	M6E2DKxKElUgkfIItmwTAEfx9H8xwy4LGocl07H+7xRcbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k26181a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:39:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5162ee45a77so13997921cf.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 03:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778668799; x=1779273599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NhziQD3I23uQmmb/464nQidAk5Ck271CFtU+xfIGgWw=;
        b=eiqP9AhdNgOtILfvqg3RxZT5BovFMilM7Ug5Jr3Lw8fGQNKxOxKfrYOo0sp6xnwE+a
         2Ik5rUOsq2ST+442HRcWFFe/buA2yPhMlPoeYE/GdfLlCI7sbmL/jox6AdZ0XkyIW97e
         G2+rrnPJYT84+WiHscRQx25XGVon1iBETUFoSkiCegXlavWbdEX36s5ZngMs1Nm+ZviP
         fiTnMRlgnvoZ05oeP5UNC8l8+Cva68kz/4T9/41+IJCwN8EiFc9vRGSYLEC8XKG/+yY8
         nHab7ByaNTw6EAYPnuRO5kUcm+250eC0a2WN5kSrsBdgOTXp9Uih1fp6JVaOMH1d0hdS
         skFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778668799; x=1779273599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhziQD3I23uQmmb/464nQidAk5Ck271CFtU+xfIGgWw=;
        b=EbcQtqOYxivOo+9Sx4zNvHAnaCle6bn71lHu2a1tuN3BG+rIcdgsGROMWGVwE71zCE
         PF9UNLOtsa2itsBIRD7LuzdZlHy3ATOAmzvslrZj+1GJt37QB/dzvtnqEYd5rQm8nR53
         lDJkZQd+ID1QGdWTHnj60iAasG1P2JmS4l2eM/wQd999fiQOs7GttnR1MTJtmMyYwlDm
         43E4laCpN5R1FaYAHRFB1P2dlmXUMYwPZFEfWuZsAqXIIr3HEWM2nciKe2hKL+1OFeFK
         vVneFUDZ/jZCvZR2n8BLhGiEpjqIsebBj+CXQxeW1SRn0klDVeme7AWwZegIoMAtOWfk
         eFCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WKRSZTLieNj+sui5Fo+YQf0sgvyQMlB2UaAtnyMMSNXzOHmip+AUs3Qn2oKZvZ+DbZe9vKuAPipQ93Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxao8wL5eiK1nELTekGNF9SgSDi4OK8CXktdZqzwUwF6ZjMfI3D
	uiMfglMu2VyzB94Oz+MS3/CZE2wlq2aWGwfa+t5olTtdC3LxxLR36cvPWjv5eUjdZdipHIadUUF
	WB17Jwy6y9GWUJdfmjT+C5obQdO2J4UKuhCWuIV6IWNopPTOo6q01oLvQ8FVQN/0SPg==
X-Gm-Gg: Acq92OEbWRfVExJHfqRSCV8ZpjWyyRqlqgtD8L/IL9Te3VLbdYvL9TWhtigg7FX4BMc
	eG3AlbO36PaiYkmQp4cMsItvg12JrQv8qJPowsBZR9kmDPJBp+p1vYJ6XqAwh0cQYWEBIgdy/8M
	IyexXWx7K8FW/OB07bAlT/0sCM0zOGLLUlCaF8LMb5fB5IAApEZcD32KbrqWUh1n5u0rVdB3uSC
	tnj8yTwF66caThJGWhevhSDLDQj5FchAWT9kzxOI6mMtltPF2tT8BRZacshSQONnoFQvPSU8gKq
	jybgyEthQqfYrfFxJwzebTkgZOxkJvJF9MKHRfoYBkyIz4WGqR9sWUwQqmLRxzBHYzTa8lZSwfD
	AbiHOwMi0K7InFlKAKi+C6t/MFsgYNRpqc25vYRPC+wc0TmRcQLyA/b35m/ktRnGEZK9baR49DV
	9RQXbzkj9KbqL7v+b1vRCVzr1qjnVjvSXxgDU=
X-Received: by 2002:a05:622a:1906:b0:50e:5acc:e792 with SMTP id d75a77b69052e-5162f4c06d6mr34020791cf.14.1778668798661;
        Wed, 13 May 2026 03:39:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1906:b0:50e:5acc:e792 with SMTP id d75a77b69052e-5162f4c06d6mr34020501cf.14.1778668798233;
        Wed, 13 May 2026 03:39:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db4fcsm40450251fa.19.2026.05.13.03.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:39:57 -0700 (PDT)
Date: Wed, 13 May 2026 13:39:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
Message-ID: <hzmcaxuajqvfo5pidetcplhe52e5cmppecy5tm5dx232cgv2ik@36shiw2kqfvz>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-4-7fc049b93042@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-4-7fc049b93042@linaro.org>
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a0454ff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=70vGjhv6m2chQG9CenAA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExMSBTYWx0ZWRfX7j81avmFyFNe
 y/4rHVvwU5vE6e4EzbPhaW434i9AEPHlIJ4o0wrgcaNXVL3A8/nktZ1dcPdTPegpdpmxbkhTTeg
 7bcIuPsiAEX/6UHDaRdjho5m8b0R15cA0xK2GFceIiIOsbM4GG03xTE5QtzKGigcmRa43k9/k4L
 pPSaPk51sSm4MYY+SrKQcCQweSBvQPwCJrrvIf7ea1/fFB3xhpLlRG0NSxDEq1mTjled4KvlBw/
 /OszmliCNlnnhKrhCv7LvIKng7jpHfUZK5MUvIhJ4KlyJxj5ru9hw4TgZA58EQGjzkgNMLjT7U2
 rxSm+ukIs3Vj2HY38hIX1k66iw9sQXb4Dv7YggZGt0CsbDYGwPRxG3Hq//ndCeOmisiJEmzh4es
 Tx06FOTGA/laNmj5b8QfYAA87CA4sF1yHsfp1Qr/TEyDBni+kHtb/g3bBZwymOkWIpYR0d7ucqs
 ZlZqQyHiIpk2yvNRZHg==
X-Proofpoint-ORIG-GUID: PcxNnibzzbs7bqOQlX_fFM5_TXfo-avC
X-Proofpoint-GUID: PcxNnibzzbs7bqOQlX_fFM5_TXfo-avC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130111
X-Rspamd-Queue-Id: A7E46531741
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-61374-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:20:29AM +0200, Neil Armstrong wrote:
> Update the gen2 response and vdec s_fmt code to take in account
> the P010 and QC010 when calculating the width, height and stride.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    | 21 ++++++++++++++++---
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 24 +++++++++++++++++++---
>  2 files changed, 39 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

