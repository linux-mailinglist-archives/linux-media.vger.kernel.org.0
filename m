Return-Path: <linux-media+bounces-64084-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2JtbN8fnJWq/NQIAu9opvQ
	(envelope-from <linux-media+bounces-64084-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:51:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7DE651BFA
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:51:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EgPUd+Fc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XoYtwj5G;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64084-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64084-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21D593014BEE
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 21:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A2A33A718;
	Sun,  7 Jun 2026 21:50:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDFA2F7F01
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:50:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869044; cv=none; b=Gb00zZoHXxpEpjhoWKP3RDLZR9yXiok7+XRw3dxsIR1wofUtXizpZcU5f4WnxGBKspjnB6x5p/1SS05W9wN/z6f1tRfx3hIi51iCwLsICE3gl6WQ9IaEzuW5eeB9uNhQ42tSoQRuJs3vZA0LiKbdAgntoFfNybF1QyO1TKHno4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869044; c=relaxed/simple;
	bh=UomSXRxMTAKvyZiKT+NoMtsFruOw0/rkwBDWsx5ibcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfxOMeDUxqMVfCs3ZJ0f0kdGxa/9woypAsdXl4AXQkqbrO12+WbyUwvOdzbU5LzdiU0Z0QY/Iz+wKTxYG1uL0RJZ/JBaYYv79mvxMvmQqCTakgMXte3pIfqGUnQ6z8WL8tMFAVxXccQKrI6hQ6mbXU2ZTT6yv1ArMpfv9fsjFjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EgPUd+Fc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XoYtwj5G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657JMC0f927092
	for <linux-media@vger.kernel.org>; Sun, 7 Jun 2026 21:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TkLy2ZXcdqLANqAf1PiLH1iG
	ICYsV3dWxbIjnbk1Yz8=; b=EgPUd+FcdAB7PL2qPJ/vI+0nESXL6vFhId9IOAtq
	7jeG2dhxQZw8aHXPbbYw510aUBNhtVlg+NYcODu0m258I3OV4nkYJXWk2VhRlLxg
	WrUGK6o/jvOIg3sM8ZQCsT7U+8j7y0P0Z4GAcaKhYY1HaRu8GiJlJ9DqxvF0XSSH
	AY7wrYWhNwXNcJ+GYSidRcwlzuv1uaCzpjByw5geP6odR/skmt3Dfp08krzlFEfe
	VoyIRRNQIW4fykb0zxC1YhQAZKOZKirvLS72A4FYBe/D9uWVD8ebwkQjhe0WmE6M
	3DA1YlX9GDINfF6Pblz8Q8z6Hu4+x680zlKVoB064wG6rg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadvk0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 21:50:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963b099b539so5853692241.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 14:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780869042; x=1781473842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TkLy2ZXcdqLANqAf1PiLH1iGICYsV3dWxbIjnbk1Yz8=;
        b=XoYtwj5Gc5QW0qw94eYyRegJVzx+uUj/kIFg8IYLaiWqtFLSdFuMXuUcTHJL/R1ggm
         BdbLp5rP+ukqh05eLMJPlbLGrbAihDQPXbk75VC7ojwuapdJqu4oor+0ca6GihMn7Hv4
         XzxkytRjEyhiyI0W8VOkw6+h274gKxzAsF1z12J0ibpg4qaYhmmUbb6YDpxkgQIAn95+
         0zCjhxy7Nd8lY0Fthqw8Lqb+TQXMkn6/4RSIQhthGDtdKgD2eSd8j2i7Nkrn65qqFV4T
         dFMG9hP+vIDMkSHzD/QmcYuFq4WslgN/ez/DZZtWjuD6aixUpkICV54OGVmCqKA7FF6U
         MotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780869042; x=1781473842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkLy2ZXcdqLANqAf1PiLH1iGICYsV3dWxbIjnbk1Yz8=;
        b=MVd8EmSwus+bgtPmgPYOpVabNqhW3GD4fGVXQKa4KZX0Weu8RGQJ32KhxLkeBybRnn
         Ksz2KhUmiNp6xYp8lqn3CQf5GRIuhqFIsYEMCMCJdA+Tf7/86Ovk/fE/MtTuEN3a5tw5
         1rw9EXWQ0TDkhq939YXtlQkQ4nG9iW8OD4SI3DxPh+m8nbV4duAuIv0Eo0ff5w6sm83q
         qIZs1778m7HhOpqxhYEPBfjUZaWCxsbww3TvArJjxzYSpi/xuOg6gi2LhgGGKRiUmYuM
         MtQrPtdl+q7vAwLRXHUev0+o+ZnXqhIMPpppgq+shZdu4X9PyhHQTW3O+18rnoRIMt5Q
         HiKg==
X-Forwarded-Encrypted: i=1; AFNElJ+BZjsPandfEb8IDGcKyp6AqWcGpsPlKpco1gMQW4uhgzdY0dSAEp2egivWnyflFALt+ZmQTsYtW3LiBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGq7v7lwuYMl44Kf5Pw+zWU9VpaOnwx1kfl+cRFYCdFcJJ50C2
	q5v5tgt0iZgSV6w3UU1S/geGLNsLzxk2kNufhDiLNSab4rHycGbhvnLGTYm0cj+41lCiozi8trL
	X0Jhc42hzzfH2Jm9nEn5XNGDojAEPgLHxxfzXwxI7V9XBYeuk38jTgRMSuTcduY8WdyQ2BK1HIw
	==
X-Gm-Gg: Acq92OEzWfpej6bPOAUMCAjj9EDo/vbTsFl1ayWmvdHeiBOPvf4/MnaJ7ifnQ/KBWNz
	ImnNVRAOD6/c4ro3F+MzCzIkdzm7mNXQfg6uZwXn9sOrKChGFvtrfb3IyiLokT9BaBzWP3Z7eqH
	NiLbgNe1be5VkgWXwUVfItXXfv5VAMWhmoRBk6WpCc5XX1DXXDtPD8wjBJd6G4FqSCyuyu+XMWl
	sLtSgsK6qs6Fh6gTBEez7OsjYlbgyNe5tqBFa4u+0qKKQ/CECzv9nqZP8p1+YgYIGQ5rp5tXyQQ
	QcGX5qZGq8goG6F0hIRXwQunYZ1GfP3qPzX+OYl5wLCSzUfRRjgU6tyOqL+A3OIKcZ7QVgyvUIi
	VOlU/9wl8whvfm42M1c9ePdNOkN1x8dMdQAgTHEREmpqJ3bhmE9CKQ/aIHzKkLv7noRpqKrdYC4
	1Vt1SpCWHbpDaqy80viBZBl1siNXEWGnq3yWi8uY6/bJG0kQ==
X-Received: by 2002:a05:6102:1849:b0:634:d97f:7ee7 with SMTP id ada2fe7eead31-7002d6b6b88mr2938809137.7.1780869041601;
        Sun, 07 Jun 2026 14:50:41 -0700 (PDT)
X-Received: by 2002:a05:6102:1849:b0:634:d97f:7ee7 with SMTP id ada2fe7eead31-7002d6b6b88mr2938794137.7.1780869041184;
        Sun, 07 Jun 2026 14:50:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b985ed4sm3271776e87.55.2026.06.07.14.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:50:40 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:50:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 10/12] media: iris: Add platform data for glymur
Message-ID: <7s3vxq5pd4oc66hygmpl7ku4kh4jwztls72dw4hswxyusrzfrk@p7s7645qjxor>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-10-afaa55d11fe0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-glymur-v7-10-afaa55d11fe0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a25e7b2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=CfngaO5SQeOV7zP3I9kA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 5BdaUdTlzn4bNvgU-k5B0p8sHYtbKEEs
X-Proofpoint-ORIG-GUID: 5BdaUdTlzn4bNvgU-k5B0p8sHYtbKEEs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfX3jnd9exgzFQa
 3qXgWfBKXqFNmiCgE7zBZxGX1O+k14lz/PB1i3p+UbPRSOxamJydd2aX4hLhuDN78KqjiXIGwoY
 B0c6Nw7pU6i5vc7mgm1KTr3V0/HN0aVOFvpe2SXYHCw7vdOni/N/sDAhbEBhYxKBb9n48gFtZsh
 C+jNlNMIH45BCaRAbiU1Jr0xZhIRCgnBtM67pPbjIdGD+emmnb+8qKnQJZ3N0d3Qvkg1x3MNQCp
 /T3hpcxQk3VBgit66ZYtrKoDJwULvi73Q6IvNS2Ax0V/KIG6KRNRW7aeSl2Dbw9Wwe0pKYFNDhT
 fl98LdW798K+l0q/wp6Q63MiPWWE+7UuAYmpBaAJOzFU1rkhfGIOXrFoPVOFR4feiQnMXlfTEGw
 t6y02ibDzFr1BJ9UYExam5z604YRZvFHUp10TVTI6CygsSluiVhBG3B/nLt4iX8Xwlltb84NkDr
 +jBL7rU8ln+UEJXA9sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070219
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64084-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,p7s7645qjxor:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C7DE651BFA

On Wed, Jun 03, 2026 at 07:48:48PM +0530, Vishnu Reddy wrote:
> On glymur platform, the iris core shares most properties with the
> iris core on the SM8550 platform. The major difference is that glymur
> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
> one. Add glymur specific platform data, reusing SM8550 definitions
> wherever applicable.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  .../platform/qcom/iris/iris_platform_common.h      |   5 +
>  .../platform/qcom/iris/iris_platform_glymur.c      | 106 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_glymur.h      |  17 ++++
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  35 +++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |   3 +
>  7 files changed, 171 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

