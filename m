Return-Path: <linux-media+bounces-66801-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /zM/NcYvTGrvhQEAu9opvQ
	(envelope-from <linux-media+bounces-66801-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 00:44:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAD27161F8
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 00:44:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h9x5HKsB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CsTlr24G;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66801-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66801-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 132EF305F71D
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 22:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1020A43F4D7;
	Mon,  6 Jul 2026 22:42:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EB8436BDF
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 22:42:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783377770; cv=none; b=C3fuThLw+u4ddXocoJK+QX4u93tXI1mCNEFpRaPvm1zfAjFV9jzSvmkS7qrT4MD8NuSmvdf8h9WE3qqAzx3j61ay6qMudTIsO9Tys6Xmki8OK28bRIj7odOUYyJj1lV7l9+d+iybyI+w6Fp6Xfon5A14r8rsCwQSOVKS9hOpejM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783377770; c=relaxed/simple;
	bh=Qfy3OCempN4Y5BVzVpnqq1Q6tQlf/ESa/KYkhk8eoKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQ2+gZ6FcWZZae8yVHm7kJtZBeOkAJEVRpEEnhA/HSaEXfU7iPsPThxFd+KLNXOYWSu6AxbEuA7QOphcH/rDIZkoxgHtXEKst4uzWATAZJHe9XW3JsXdzYFo0erwph/dFdPFaN8X56TfYVPy+JEyNUFmr6YAtbYWkwNAkKLlYKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9x5HKsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsTlr24G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDp7R1650184
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 22:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CV8kDjArac1le7/qQ33TeCbi
	KgouB0vf4bqv8CS58Ns=; b=h9x5HKsBzdr5r8agibMcmLcHDr44R+6nz2MDrABh
	AnwSm/8bNBezEsDMRavMK5gzdP3r3U6FrmbMRiD6kM0gqGM0smVDBArndjwpP6Hv
	65kRd6F6fzpyFIOwu+KZQ4OuAaQtT3+liUKSm4IeKTv+uFicgzxO4Nm2JotYKczE
	99PLAg0FGoXETYNCkVMMIO2J5gMuOuLfFCY8t78mBJFxDZmGlnBU3IRwBsBGIuJ8
	An5wUt/wKbHaFvMDdIHc9GZ7xVMIlinec12TljPZZuURWOeE6ZriCNkwzfOp/y+R
	4V1P9qS0GXbPIIqD61dxoD7cV0ORV+yJjilgNWiP2NSwCQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgubct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 22:42:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738d9935e23so474004137.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 15:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783377767; x=1783982567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CV8kDjArac1le7/qQ33TeCbiKgouB0vf4bqv8CS58Ns=;
        b=CsTlr24GcAytTAlyYLuoGz3cYQ/Vfo6UeSJ92AveTsOm4ZSFobBcrm6B+aMVuTBUR7
         IpU2YC2OaKlCQb1ahgWFQwHhaJeXZKbQObCG70CX5cJuOwn6HxmTAi5NhyioOQFwWpXC
         1xqHPB8c1Hlq/89UjJ2N6gMkPmIk6lnpZq9n/OV7r1FtTtQhJeQF3+uBeQQtKXZUhU+d
         Ewu27INdXg5qH5j3e9wnrtPz9NXEiOaw9jZ9TeVlgwnyHE6YziMgGq/fNzlsASCTvrrp
         DZp4Lqh/XL6Q4IcuVPxzY5aYE6LffsWiIYP4us8lKsyXTTpv11BEq4s7kVppvEsEGOB9
         Iniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783377767; x=1783982567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CV8kDjArac1le7/qQ33TeCbiKgouB0vf4bqv8CS58Ns=;
        b=BkD04lD1eb7dpmfYLNTyvXTK/vrubpwAFSWVAGwEjYwucq3uZuDq4fEi2kaehGRjp8
         pcm0p1jHQLXb2di6W0gQUds4GvulLKA+6c4BOMo31j7OVd5knOzbSMW9AZUZIUESrcju
         RXQsaGiqjg854p37+8whFqMdfZRQYDlYQlWDhsJ8QjSmqn4Bdic0Df6m374kx3mr4dc6
         2S69OLcOni5nlIhRL+QMAJxRT0M/ISIxKZX9x1J8+cntz9PkqMY/be9mqHHAk1X67W0g
         q1UDAFB98lqyl7Bm8uMMIFnm2zGyRqWncNYfEp+Fc6HRf8pgsoR1uKQVaMszGCil8A9x
         2waw==
X-Forwarded-Encrypted: i=1; AHgh+RrMbjDmrI+2YkrcuD32hPmMpwMyoKTR/283sLNclXMi5CkYkuaZg6ZB1P7GAdOSuIRGCrpvt0w1ieXI/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7DI1+MKtNJolg5Ce0Zo11P8agy3PVilZUHwdPbbPy76DCsWfh
	WJ/Qzl7KA257CowugpG+Pqa66iVKpVK6o7g6fDqgv7r9I5T1ms6DbKI0qLsPuymlrH1THKWxs5u
	/qYfBxeGW5J90DX0SIGA7fn2qwmg/J4jXlPHMhXTilYQZtMrEcC0z3b5tdaymG2fQwQ==
X-Gm-Gg: AfdE7ckN/1SSOUeThkzKQtZlhRbj+k2d2gGizLfvqcb0J2FGu4uPLkpMZHrbicYqX2j
	RPjaf2f8M0GQb/F4u+zgoxX1UvVWGqeEABA5JH7+WGzSF2UT5ddtCo4Q8f3f9o/7NQAwDi/I66Q
	6lL8AxnSsr/dRyEL/34yxxAfxJ1lwRzTC95wUUL6nOqwFRcX5LlxIQp9P4DosXxT+PAiCV9SMRB
	NmxLQ8kPXc9ZCs83Q0grPvgCvazvy/2XUrGK/BH4uG7tQBENQduZszxm1C5nI9IufrIDwZrx6yF
	aN8bPLQxAoKr8jTas7C2QbnM6ZL49ezqubiEg1iNjZHXgOmKSnPp+R4k1xbNSdZJJb6VCWTfdAn
	Ztc/m72G6MM5hfjVRkV3Ba2aL6XOEDuyvAQxLsRey37bP3jiMLyn0uUG1GtyqP0bi8HM9RsfDRa
	od26y5mxoVDA+4NHX5lVbB/UVu
X-Received: by 2002:a05:6102:6889:b0:738:9c79:7513 with SMTP id ada2fe7eead31-744b7a1f1b1mr1297935137.7.1783377767458;
        Mon, 06 Jul 2026 15:42:47 -0700 (PDT)
X-Received: by 2002:a05:6102:6889:b0:738:9c79:7513 with SMTP id ada2fe7eead31-744b7a1f1b1mr1297916137.7.1783377766929;
        Mon, 06 Jul 2026 15:42:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm3223744e87.32.2026.07.06.15.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:42:45 -0700 (PDT)
Date: Tue, 7 Jul 2026 01:42:42 +0300
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
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] media: iris: Add support for Milos (VPU v2.0)
Message-ID: <p65zg6zyrclehc7lghth3qafbedfegicx7lgmia6aabslptzpj@emfkk3fuiz4o>
References: <20260706-milos-iris-v4-0-119cbe0a7262@pm.me>
 <20260706-milos-iris-v4-2-119cbe0a7262@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-milos-iris-v4-2-119cbe0a7262@pm.me>
X-Proofpoint-GUID: B-VTOPdknbRXpVR3qFKhboLKKana6t3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIyOCBTYWx0ZWRfX+pD4dmmAkfaj
 o2Dszy3crIkl1avpweciI8ozwWkACRz8ehblx+I03M1k5dtWbPhK4Q7dnL3YOFGzUVNNCJJlb3e
 r3MmUOrhe2roDQL/AC6lnVMh47sR5tbNOyws+mqzLoj4znCp46LHZ3xc92AdU1yQlnNgTP0NOo0
 Q1vd9MrBLQtNO1kw4jnxXSZ3Ak12pLSEvk5Pz9+mYmIWXMc72H3SeIK+8dv9oi3Mk5Shyeu+eV5
 9nqID153iJEVPuK49ar86Chf3XcHpVKBf8f1haVlAny5YSeArXny3DEoUlTByKzb4cClgfwFUWe
 zjCPlpxJPVl3Of6aPX8zbpViLC6BldaRGB+QmkkG5TPUkE2loWH0jSgNoxJ7H9Fc8k9f0ghT00n
 BZ4K4QmTUFpEqXTm/k+aKPfVZrcHxJI3CgBc6lDBJffic/2emO+sDn9SbfgJwmt8EAsQ7vTm4QO
 E8Ws8eRJfevXC3XU5cg==
X-Proofpoint-ORIG-GUID: B-VTOPdknbRXpVR3qFKhboLKKana6t3J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIyOCBTYWx0ZWRfX5LDi4kJ8eeaH
 L+mzYeEAXu+OuSp3jgTWd0kXJtRkzplc0GiU4epeW/dWi6P2UL4AAwv5lskTrbc/PL2DaPxyTqx
 pf1DPZSNDMadM1uMDmQOFzuqRz3bWdo=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4c2f68 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pCneGzjeH-oKQgveYhUA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060228
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66801-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,emfkk3fuiz4o:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AAD27161F8

On Mon, Jul 06, 2026 at 10:05:57PM +0000, Alexander Koskovich wrote:
> Add support for the Milos Iris codec. This only supports the variant
> found on the SM7635-AB that has half of it's pipes disabled via efuse.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 883 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>  .../media/platform/qcom/iris/iris_platform_milos.h |  27 +
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  35 +
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  5 files changed, 951 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

