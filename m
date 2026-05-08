Return-Path: <linux-media+bounces-60959-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AxoLpc3/mkroAAAu9opvQ
	(envelope-from <linux-media+bounces-60959-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:20:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7434FB0BE
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDE5A30421C3
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FFD1474CC;
	Fri,  8 May 2026 19:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5gglEjc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXY1ca4W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EED2376BD5
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 19:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268039; cv=none; b=txfBJ/2HPKKMbmnEUxEr/IVzVBxbQ+p03935inLH96Ac+DV+ieWC5Ch0W5rQtWyGmgq6yTQ7JxLpgPxyjuNpC6IRTrzSpaWeUV0wnaskRd91oY/4QRyU5l1xhZoYdq+nEhFB7d6uHjrPg1FXJWfToikF9KIUUxMAfG/wFeVjs7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268039; c=relaxed/simple;
	bh=UAMVwWLPOlb06OiGlUHEI7yxWTDO23kLGEMFXjCn5vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdxo6osVpIlq48P5zqbLbXm7Xrl3jlQKuXQCn6PkACQGpn82P/aRrEnd8+l/foT6b2xZ4nyiczOjZsfiX9087km/YvUEAaTElZihPPX5u1eU6VSd9Kf9Iu/tzn4UtSmv30ktUa8XJ6dzP6Ocg3m7F5V6RTCFnn1KnXJeeX4ZmI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5gglEjc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXY1ca4W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GTfEj145190
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 19:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cMtQJYJVO2Gf9M/V1tEx2sOU
	Xhro7LsTOX7c9UtcKe8=; b=O5gglEjcEVXSpfd3j/yiolJPtp6hq8KO2hTF7sPR
	9sVRMaKQ/bwlBqlnnT/apkrzBTQyvNU3wi37SxAjGQkxTBmR4ExF9b/prHiqNSqc
	a4MoSrVjbM7SyH8yMaxttzTwQKTxHqsD99d/E+luciQOcF/UUE1migTltYPmcrUm
	k6na5Qhw0Kbyo+fsnVKiIZ/bUwlWpKDVQcbCSQc2VtqN2iV9CXxGepX+TlnLyHM8
	wQaDvw1AqNCHm5bY0JYdH5o2LjbKeqKWli0VALnSVwOAbULO1YsEe6oINke4ZyU8
	rPAz1YEI0Yef5r57W4Zjfg1IvBtrM5lZhMPPaEWZ+xTWcA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1kdc0jtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 19:20:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-62b9e51689cso1643546137.3
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 12:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778268036; x=1778872836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cMtQJYJVO2Gf9M/V1tEx2sOUXhro7LsTOX7c9UtcKe8=;
        b=WXY1ca4W2nzWExAHgYKkKnDqT6ZfLd2NZq1WJ9JVXoheixv9EI9JTSGejsJonoVRI8
         Xwi7u4U2n3kdppOHZmSkOxKqeaWzqR4fY/P/qTn2CS1WXZV16akhDXwS0hvYfpM5ca6L
         Ol0GcZ4CEKtIsQWjT2ey0ARByRWKwJjI4kTPURN9zMzYFep9d6dBqF1EKO0wDyBUj+Nn
         u3PFNzdW8ByXm1wlZdEwre/r80Ve5OqLsffRW9AqDWXZTfc9NJIX+MIZGD66Fy/8chLO
         V0+2pMFJ9AFptnRtPVVNqKEhHjeebsh1YSixudTxcdKj7vnrIgFsWQCKQmYx1tE89nFm
         weuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778268036; x=1778872836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMtQJYJVO2Gf9M/V1tEx2sOUXhro7LsTOX7c9UtcKe8=;
        b=D6EfvLIj1wR5KD5BEquRqio4QifZx9e7BKC11F6N3slC7+Y5+/LP51KHtOTT0P8mM1
         cYGDLzFaDROFvkJPXwuJdUiJswtT19YJHKKUEEriRqvJgYVruSuubb08GkHmNa3vGLy7
         vmeusA2R/OS3COh330vrE0N7uPl+E5PTvx89fgV6H4MDruyzOk6uuvxyx1G6shEAkPK3
         Q+hY/bPWwiYoS859ARqrCz999i3P8RTHbuw0rGQ1I1+ImEMYG3NNSB8/5/jcaUKi+wcN
         xQJYGjAc0mmLXrGrCUkQ9pGJeLaOInI+/PidCjyUvPVf8SdPU37WxKq3zaF3AOY4/y9z
         8oUA==
X-Forwarded-Encrypted: i=1; AFNElJ/c+D16ccu0TbWhWNDeRLRzg900oxVMwy5KijvGtSLQRI68XxMZ5w0EoW/Q6/iPvQUG5iGPCAQzj56a5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcDdjcg1B473w+8QH2xFiN0x3Bxe8RuAziafIDIgAgr8QF0oMA
	/osT0MbSiAdJDNlOvwVJTSTyzZxk75OBmOjXMVLZvkGKKWmnMLfKNBBgfhC6Il0YgKueyLfZ5GY
	a8+lCCF/1ob/adh1Hhm0Om2LiKyMYxYODYRPFZg2AZy+q9t1F59vXKdhv7CIVwSet9w==
X-Gm-Gg: Acq92OGUHSqqXwR8uuYg6JyaG5uU/4K1AlJeyDH9MAbz1RhBbjbrBRKlTM0qb2NJq5E
	EVukJ5zCgalx2dSbI4kaCsNd/NsEdziA+wD4umkOQsbfER5RzrxmOqPeCLC+b4mCzzfUxtB2iJs
	OikYxfp5L3VI9kTgJ7FUxfUB7gxAPQz1P+fV4s8aowJt00yE8uNNKADRtsmvbgJiHQkZtqFhPaB
	Un43KAAGe9x4tM9m1tFUH8jEUqBx8w/DzKtuhJWAHjBI/wR1qo5n7djbMjNsnc34PCquAxsArHQ
	x4+bx1+K0fpD78NF1stKASd/+9cANua9DrCMr0vAwFdA39yHn1K4I/77Ufq0LioiUtajdiDkhKR
	3CuL80a8BRTCfQFZZBuwWK2TB73Jd3CQEwR9mk82JeT6bfhfqDb2auMg5WFCzrN6fEBfOeXnnRR
	lu1ioCaOb1h8XDFndfx8ZcZCAiQ5OEpSrO0mM=
X-Received: by 2002:a05:6102:26ce:b0:60f:928f:bf98 with SMTP id ada2fe7eead31-630f8ff11cbmr7365911137.17.1778268036295;
        Fri, 08 May 2026 12:20:36 -0700 (PDT)
X-Received: by 2002:a05:6102:26ce:b0:60f:928f:bf98 with SMTP id ada2fe7eead31-630f8ff11cbmr7365894137.17.1778268035868;
        Fri, 08 May 2026 12:20:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951520csm747036e87.15.2026.05.08.12.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:20:34 -0700 (PDT)
Date: Fri, 8 May 2026 22:20:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 03/14] media: iris: Fix VM count passed to firmware
Message-ID: <zfh3hb4gowxejxeip3l24jub2z3xh26pzl5xmjhjos634c6e3u@y26yubeb7v33>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MyBTYWx0ZWRfX5pLT0n1Yus7L
 XfVjP72EsmEhcGiCRsO+QOuiSKMekVwEdW2yKIPEsdN4qSc7JYw4zN+uz4OOUm5ldFdgYD9sz9I
 qMT0+HdWIvQ4edwoXL9+EGcDfE2l0s8ceQcvxKct8q2MAvt+x4aEQlQR/ipJArsR8/IY462TH/K
 wkDi66/24OGOHnEoqCNsLWUbNobfBK4S/f6CwdakwNJdotcrc+famLATQ0JC1p+rxkknJrDYWvl
 PlWz30Zk2cRrBraDDyDhL19iIh1M65bROrOKlG9DidHXie81LjervJQzq7RDAT9Qdkdv+fHrtMr
 ap+hCoow8HNnS3wq4qOXDeXocTza2PwEN/tL8bnkMgwjeQaES7ocLiBMjhoBI/l1PcP3Csnw7F3
 X4DcD40QxOLuwgrQs6WyYNlXiPWOZu+HqbWnhvUy61AUa2lQdxV6v5wwS0UwJr4+6XqDJ9QjVDx
 LlzynPUTwo97HfS998Q==
X-Authority-Analysis: v=2.4 cv=RZOgzVtv c=1 sm=1 tr=0 ts=69fe3785 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lCV4VpG5okPm4yurM3MA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: CSAcVWXxc9-u5AC4Miug1DheQJo7FdC5
X-Proofpoint-ORIG-GUID: CSAcVWXxc9-u5AC4Miug1DheQJo7FdC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080193
X-Rspamd-Queue-Id: 2D7434FB0BE
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-60959-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:29:52AM +0530, Vishnu Reddy wrote:
> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> the number of virtual machines (VMs) and internally adds 1 to it. Writing
> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> remove this write to leave the register at its reset value of 0. This does
> not affect other platforms as only Glymur firmware uses this register,
> earlier platform firmwares ignore it.

The explanation is pretty suspicious. I can see this write in venus
sources too and it was added in the initial submission, dating 2017. The
driver targeted two platforms, MSM8916 and MSM8996, so this write
predates Glymur pretty much.

> 
> Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
> Cc: stable@vger.kernel.org
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>  1 file changed, 1 deletion(-)
> 

-- 
With best wishes
Dmitry

