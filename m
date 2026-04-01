Return-Path: <linux-media+bounces-57861-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ/eATj9zGnRYgYAu9opvQ
	(envelope-from <linux-media+bounces-57861-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:10:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F661379240
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9D753101C30
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 11:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EC940148F;
	Wed,  1 Apr 2026 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M24NojE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBZ2LbkS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485731C68F
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041399; cv=none; b=Oe6SKG6ThTTqFwAkQo4p4aXo2HFHPQyWodagMW5bjujFlGBKGx8FCVCft/RwWKS5xVS3VRS/bsG6Kj/vHkuBf6CxqWDsFJNvWqo579/y1+S2Ib6OsMK6yhc0K61r2iNKDfvW/6hUZLPCRXexkqGHoaVu2IvaL2EVDTmAjE+O4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041399; c=relaxed/simple;
	bh=MB4LMwSHBiafUcSOtiLPU4dOU+C2pFEhAewMAne9QhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4YO4i8SvdP8/0mGWngbMU3fRt3a1/g3D2LBmBD9DoMgQ8p/r1jpzpdN2gmnHLnaTYlgTFBecdzDrreY4UpmbmOrMgJw9M/UhtNBegGNYdVNS28TXwArUWhGt/zjqAVLbJQkkTvD+2ULDbSNO9wHQtcV6vySokckZt2VIfQZMdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M24NojE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBZ2LbkS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319TtJn1579389
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 11:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SWnjJe8ds7N8QygyW4Df4rFv
	J0LrwnucUsnXNEwaU1s=; b=M24NojE2g/hqDt9cNm8hFNW6ZMoQGEZ0F/Exmmo6
	0KHFYpxNy02wYxSs8D26RplmzysK+e2Ch2aW8jvD3yC0LoAjzIsxyzY09NhGy1fD
	Y76t4r8wC5n5o4pscDt/zUVo6DElDICEZvYBxgWIYax9fKx+YhtM/VLWhPPJBmc2
	5XOd3nEXM/3v4o9X2gIHBNBIE8QIwRdYCt1+ZNy1SSmS0tqhRVvOAv/XvxUpJFvO
	nn/TIxv3h0/QZp4c9CBqRpQhwv0OXsNqVYfgP1j5AxR7m0YTbiI7+1I4DwhufCJ5
	0by6xx3ivdFaTcvho4+sjmbmR48MuOAHUtxEcIy4T7dCpw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2u5mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 11:03:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56ce9a926bfso4174563e0c.3
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775041396; x=1775646196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SWnjJe8ds7N8QygyW4Df4rFvJ0LrwnucUsnXNEwaU1s=;
        b=GBZ2LbkS3NWPUxX3BDpqm176zzEfNxU/se0JNHD+dqYsOKmdViQHnkPSEe9Yt8feMI
         CTuRLibOROVOf0mhj7NGm+RUZuJZgakwD1TvsJQSO2DTC+QdwkvK08+G1M1dv/xVnzvO
         mFbeRaeQXlNRwNYZVSTU4nGl6yrIc4aVbN5LfEFXcZ/k/H0uFx9DJAskny7A3I2WOc3n
         o/PU/PPACF2mwSjRuJJvpWIYAT7JHIlm+HaHPx8MctNgvPf2f8fWwvgrxrF5edLGdpA6
         kiiqaU+y5zVgldzaPi0NnZ48AVulCtXISgRlKvOWswXluZsABLBdCxOjghvA1OomtkuP
         7T5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775041396; x=1775646196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWnjJe8ds7N8QygyW4Df4rFvJ0LrwnucUsnXNEwaU1s=;
        b=HFBr7Vl7DsvZbNIIkE/2swzRb5Xc1AGqA8ktbS9DuboSbpu4stH5FuhjhSOaujJ0rT
         qw0lAFcN+ju2keFroYt3Vp59odQb1kPm7J4Qxo2SYw5hainYNg8X9hpl15xpMXYV+2Ia
         Ypbb/F47w5GnyJcTtXy2ZkaKuYGzDCZasnWAp3R3L7+e37Cm6czaNwKyJdm/mee0SXEl
         dXazPsTaYO63DITRt1dnAB6KAk5fwRQgo/2i9fo+dBoBwYtNIHJtk+XjucULu9ZVOWa0
         Xvovjh+McFsbV6BPTZFkVVKhNymRv0lvUgJZ8u9zDv+g03gfvfw9mAs26jd8X4ev9T/F
         YpkA==
X-Forwarded-Encrypted: i=1; AJvYcCWRPd+NL49HVgeDgB2tFnpmMZXjpEj0Z0UUiF/W9uyLdAX5Y7I04V5IEyCoCMOk2WNAB8lAgoO7ytw5QA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo8CPZMFxf9AhWlFhkYoyV0AtTyFEXrXDcz7yolyZD5Jvrl5xY
	arOHt+AIi7byXzj+wl/6XnCAqDPjupFA4VvHz3Ngk0kDzPgoVegRxriwwafBFt06pjWiQw7CV9G
	w30NjHQ/DQCYdkqoyHFrJbd8RtAnlb2Uty+r23PVJECw+5mHjv4MaGHTS8bhVaI4P3w==
X-Gm-Gg: ATEYQzzoALgcxKSW5RIHyn4L9Cp1QFVtddovppwPnMGWVdQIY+wQc0BPtAHfpiOC6LH
	5y5r8CLQ2q/rbSIGUDGtZVqml6bfj6PnstFHrtqKFcZyamYfPqjV3oCtgyrYT/CX3aS3f3EpmkO
	eFL5pxV//YlZ2CZ4wh+alc0nkbMFi5BsCZFjzXe/l7vCRs3V1XlaoHYmjN5jijG1EMw5dW4v8M5
	cat00E+TfDtgc5Gqsd5274lMKNJS4KtWY3j8qSUI76pMhrz/+ryWEIW3jUBt66FkgGeaYpW3tjQ
	JlmRyfuycow4LDs0Euwe+NrGFwQVxYRRkOGkwTjuGQGlwUjgLROKL1nmzw4AbvVWCSA/4EoR30W
	fJu3Y6Z033op+EMKAdOorp3DHF90pnDcACZDEgqsdf8IlJHVHds3Oj2G7HQVGtuek1SkC/Ch8P7
	s3Euif5ZyyBB4ziEESmeiOKlQhGzwTFudtUhg=
X-Received: by 2002:a05:6122:6089:b0:56b:960a:a4a7 with SMTP id 71dfb90a1353d-56d8a85f818mr1385088e0c.8.1775041396085;
        Wed, 01 Apr 2026 04:03:16 -0700 (PDT)
X-Received: by 2002:a05:6122:6089:b0:56b:960a:a4a7 with SMTP id 71dfb90a1353d-56d8a85f818mr1385036e0c.8.1775041395591;
        Wed, 01 Apr 2026 04:03:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1456dffsm3176792e87.70.2026.04.01.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:03:14 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:03:12 +0300
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
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Message-ID: <q2vthozftjqrfnjtm4e7b56wliniic4toqoeti7rzyqev2yupm@nxc7ejpfa74t>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-4-ca784552a3e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-enable_iris_on_purwa-v4-4-ca784552a3e9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69ccfb74 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YfhdKQME_ACdFzVZc0QA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: ScaChfknSgkS7QE8yQFNoUbg4ffKfNbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwMCBTYWx0ZWRfX+fsMowx866fw
 uL5u/s3bBv+CPBFvWplwxglbmZOkNXEdQCs8m2MoGGjtt+GOZT4UnMV52QW0g95bDaAar0m3FWd
 6d3VkagRyYwhh2+MJHfDe4FXFVWtuy0wWP8L57aECvpw6hJxA8WOqk6lEQeF3tkAvXjADHC4/Sm
 br0o+u66vMmg4/HUn0KhBcZTCE+j5BJ4NAyvgsBsB/jyTizTZmVI2hYNJlLG3xSomFIevrvMwig
 wDjnHSHIBSocy+gvCIKhmG6bV1cHM5k0vXuqKYtLMdPx3/7tq0VReFYohS+skCg9hsKiPeYBNGK
 advgkCgeFD7FII19dcsfSJ/Gi3ZwfAyT4nTcPj4oMcDm4pxIN23gOFBPhkRPTNZTef9P8XIu13c
 kA1d00/Ia3E/5rLgu3NfbOoqjmjbcwJAdwn1/U+DODQ9pJZBYaQexa7obAulG28NDygpfGxWdXU
 Sfmy5yJh5L3Yi+lR31w==
X-Proofpoint-GUID: ScaChfknSgkS7QE8yQFNoUbg4ffKfNbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010100
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
	TAGGED_FROM(0.00)[bounces-57861-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F661379240
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 06:24:41PM +0800, Wangao Wang wrote:
> The Iris block on X1P differs from SM8550/X1E in its clock configuration
> and requires a dedicated OPP table. The node inherited from the X1E cannot
> be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
> be applied.
> 
> Override the inherited clocks, clock-names, and operating points, and
> replaces them with the X1P42100-specific definitions. A new OPP table
> is provided to support the correct performance levels on this platform.
> 
> Depends-on: https://lore.kernel.org/all/20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com/

This doesn't make sense in the commit message.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa.dtsi | 50 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Other than that,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

