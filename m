Return-Path: <linux-media+bounces-66780-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SQD2AI7GS2pFaAEAu9opvQ
	(envelope-from <linux-media+bounces-66780-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:15:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EA6712722
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:15:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hgx7C2tE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JyYhxoIe;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66780-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66780-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7850B3158CBD
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 14:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE0837B40A;
	Mon,  6 Jul 2026 14:24:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A207637996B
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 14:24:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347868; cv=none; b=LdCBEmVoQ3cFNqZEk0c9KKFrPOvoMMdiZxwGtIxKpjFeKXFDFsbW6mRbKWPFtmb/9ZvBQv6G2IWfsIzhvu1IuJmhCr7HSWuc9mvYulmkvBuE4p1i6MzfWK4SGJOa5hJXVlkXhPXvu60SunnbgA92BxB9/tqxOZfQY9KneA7ADug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347868; c=relaxed/simple;
	bh=RqKk5FotZtKC8C4ZhewaFiPzVOmJRvPjCEVbeomkK3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBVD5gdILxQ3LU+vvyrl4sh4Cx1O02w3jLXKQx8PuqP5lDEWQzWSxrUUjjhKam8RT48loPIxahDZyb5d0l1y8IchRHEM5kEXhePp+IL7qCRsWhMk/Cp1lm+UwfBcD0iCr2QIz1XCD59AqrdE0vxhHIdCdq3empvkumLi2LkqDjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgx7C2tE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyYhxoIe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EDuiC810659
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 14:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yXFv2mECvN+xZKWYVmzpDkFb
	Ja59AM6qd/7I+4lCZZw=; b=hgx7C2tEAY+nCJtHgG95o5yvkp5BfksiQo/5UGvR
	eXxcAXeRNHE2F5H22rtuZUVravngGe7Upt8L7nt0R+0WrPurhJ57Q72U2F6VRSJX
	LGdHiV9Kk0Lo7nbwkSpI/RrO4fTpocl6dELHgIFDfx9tZhKAaNqczQjVwNESPaH6
	zGRQFGnkqw9tUxlKaEbnwO7e6RBenFgKJMqh6xSe8rZmV/1h3hQakqLe39NrdqnB
	y91OtPgPCohzPYya63ivbGB0+GZPvnKMj4pAQ3z42e7U4aEKlZV2govQ3VpL5QHl
	sqoYMiADZmBje316Zd8Ha4iDtROsOPcxyZONcXPwM6xmCA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891usdq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 14:24:26 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96925b219aeso480359241.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347865; x=1783952665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yXFv2mECvN+xZKWYVmzpDkFbJa59AM6qd/7I+4lCZZw=;
        b=JyYhxoIeXxB+TWtdmfQnc8Omo7QoXssbUct5kbhoiC8TNpbqPKoMDzJf14bdUp2fiW
         CDPS5Dk7YGmnH8jyUd9PORc98kOPz2+n6iGlrxSJPe6aJVXbto8+LzjKM06gDcmcToSE
         4G03xWhVQ4sdHI3InS1A3Z2jVzmu16Z4dkfV3wT3dQJxa+IWxujAb+Wqcn7nmg7y9q1t
         29opzBclxb1tU/nsa6AWOQ2T7xUx7/imRySQhAqz9sCmyyO3Cxe2MWxc1Y/DWWgPqAAD
         S0HfHWq5CfLVdZ90yMEuzEjOKPb7PUC20ND46OJbWMn85bBu2CBOe44WFIv7coFuEYlf
         /J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347865; x=1783952665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXFv2mECvN+xZKWYVmzpDkFbJa59AM6qd/7I+4lCZZw=;
        b=YZxy/uv/IEEj1gLMcSm9MWwKR4AJUq4rdvuYoz7xkE6bfByCQPROQpcQkbjeHMO2Sj
         vsC83jBmiLUR9musWAPyJ2mZROrzr81pZN88gpZDCB/9OfISyDQ1y4fb8DSLeKKMzPO1
         vK3qKVnoOJo/TPY8zM1sU4ssLYvMpIv+eE7Vmf1AJHN+awL/tvOID5I32efWoIcZ9FmL
         KbILbwAOo8kmVkexs0jzNV/h7t3R4c6DLSETKRswhnsK7syPn8XA+gY2XTLJRS4hHCnU
         kznJqANT1EwpYcp6KgG3uggU4qbKWxkRIqU1UgqXKsdiUsEf3b64JglnKhrait9seqrJ
         grRw==
X-Forwarded-Encrypted: i=1; AHgh+RreRTRo6da3E1XJa18ypy2qNS4tCP8Eh4O18TBvba0CF1Axh/O7jQi3zfafSodfLPRnDUw03m8T0fy+4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7k5Xcw4deOpgGvhtD8J2wUbO1uCWO0f8z927ldcwMzCOAmq4c
	ggNikBRjFfSMEnjjtHY8iX6W+hgX+hihM/usuxt8DeF9sWrfjcJSMj7LFKUfiV/pBCtDiR4XPpw
	RvJtO6G3b0MwvernuyUWqWBsi1XfnXpc+vefoBc+iavbm6mSLc+bDdED8CEyPf9768g==
X-Gm-Gg: AfdE7cnzr3AbJM1eyHG1as9WQKgle/E5Vse+YEjG1e4GS9gDmrsY0PgBoTMJhFOr9iS
	tXGrIJ0hPc1gf3dIUTm5Ab/r1tSD84AbotXQhr0C43wVy5cNAzPOaG9pgcfYfMG0tRBoEDyUC8+
	4PT5tm+22Fb/xJkl9VTfapUqxqKbRFs2olZxJPNYC81e1m8EmmuJVEUafiDeGRqV0UXkMaQgTWp
	CatjxQ0uRW+rzZXo7phbIByW1i9xwlNIV42A9nUQJfuGFU5F/5v+p8paff1VLwS9dXzzpvfiADA
	qflbB/PGwmvUKt04zBfM8QQNrxLf/5BciWKsWBSaVGKiCpp1hYtEukngK8z79514VWIPJ9a0zbo
	QHJN1qHHwtO1raYbZ+FHdB3nnV22T6xZZ5rjw1DdFkGrLljhdz185l2Mn6Jlc42QrRLjUTt9qxW
	/BXjZ92QHJ+yggWoHGTfk38QDF
X-Received: by 2002:a05:6122:4d05:b0:5a3:5938:6935 with SMTP id 71dfb90a1353d-5be90743468mr454366e0c.6.1783347864965;
        Mon, 06 Jul 2026 07:24:24 -0700 (PDT)
X-Received: by 2002:a05:6122:4d05:b0:5a3:5938:6935 with SMTP id 71dfb90a1353d-5be90743468mr454346e0c.6.1783347864484;
        Mon, 06 Jul 2026 07:24:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1376ffesm2968872e87.24.2026.07.06.07.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:24:23 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:24:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
Message-ID: <k7dizyxxj2gk2lyz3ru4ffuckbh4vfw2z4hkn72ygjqouundhm@gwgriymkpg6b>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
 <20260705-milos-iris-v3-3-8c1353530f24@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-milos-iris-v3-3-8c1353530f24@pm.me>
X-Proofpoint-GUID: phv0pXIMmBM2xmUxTAqUnZXkURKspqtY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NiBTYWx0ZWRfX55ZVg8avp0ry
 sTpkZMVsesLr6lyJ0ju0EXM2nITJqE3deyPGgixvmxc8bBZKB57qN+bNvRnIzPqONkkgrGgdvCo
 ZhHG4ctbBLTQhhq7cNkey3wi1r98ZyY=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bba9a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=_c_tBz_40JZhELx2ZhwA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NiBTYWx0ZWRfX3ErPwmwTx7RN
 JX+LNU55UnYZ14b55zyjmnNTlFDXbNXA9J1iR083k8Y+Qoyw9iEgPfEuKmd9t/u39xH9lKpTiRH
 VIePtpGk9vq7ZrGl5I+owkk/CvsuUzI57k8BOqHYGoUJiXV5FhJf/8XzAQMYjIM6jaU7x3tRZHV
 0ic5Uf23BtNhXvrh7dkF3ekuQgnKCZACQu/33sekjlXpshRxDf/9Ljv901YtjkfiUA/YAO4RpzS
 Db3u1gNoGnu1vBvo3EZ+UUUAWycAcQFcw8QJoFdjLTMhbPz/OrnZVk/BhHOemi2yWKhXJFJdi4P
 /x/Pw+OtZbSrvY2fxMbb88JpDDYcWuP0Fu6GgT1wLyprfRbx2viC6WOeiwPfpZlf1L2aC4WBSZX
 C6QTIstF2AIJdTvtaCSmjJrkwUYUc2WjEU0+oR6N8/BCj5Xw1aMdVklladBBUIeAjOD1Xm94HJG
 OBlZkhPGd+9ZfSZENuQ==
X-Proofpoint-ORIG-GUID: phv0pXIMmBM2xmUxTAqUnZXkURKspqtY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060146
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66780-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,gwgriymkpg6b:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5EA6712722

On Sun, Jul 05, 2026 at 10:10:43AM +0000, Alexander Koskovich wrote:
> Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
> platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 85 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

