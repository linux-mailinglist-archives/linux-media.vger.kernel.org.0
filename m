Return-Path: <linux-media+bounces-53408-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFg+AcJKn2lEZwQAu9opvQ
	(envelope-from <linux-media+bounces-53408-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:17:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A257919CA6D
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D5A3302FAB0
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 19:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42A53EDACF;
	Wed, 25 Feb 2026 19:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCm1INdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIxt7NQi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1167E3EDAB8
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046740; cv=none; b=iyYWzVS5H6IvagnXpYzYy65utYKBNEcwMB+AJaGchlsGxa6/CQewOfJ3r+kV74K7Hus2rBWlJh10fyBBN9y4v3Jc1YghwdHUgpk7Ob8dYOIcKJ9H+bmeWmXpDbaQer8nk5WhBhlqMXO8VIK/HR+AKMQ6pox218ZZrnJcSyG0pzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046740; c=relaxed/simple;
	bh=3UffeSYJ90UKEt6at8F7y8k8ed5aDBg4BiH/dDRiY2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTFUokCWOBKueXtUDpzeTlyjKGeApKFrXwQO6n8nkpqquhX/BlkfecG40Ty7Zde+M6qjgyMAjAiMDu6cxI2UETHZINjvR9SoSVaVnBw4eriCdv86C3MH8w2HKaQTZOjtDNO2Y9hU82gWrqQ9vYsiEEBZvxv+763DId49ea6IQ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCm1INdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIxt7NQi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH3nBA1196028
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lg9srVmRK+oZJLWJq17xoEHm
	pPxqRtxhu3c9PChBOMk=; b=WCm1INdNRRhbh84DyjMSXzpeUoIeQXVsQgHBlF1h
	Ndkvbhvx3lXr7E9lEF/C2lv7P1XNL91hKJWoBQPh0Ju3cQ8qDmL8N4hvHi5mx4Xb
	xpvtgujVzIept+Zev/RH/7hr17o5f9CCDpLLq/c7ZicXw3Ga2LdzZX3eXzwD8av9
	9hGSbTuWBNDjgYpAJRgqznmnbhInDU8kIHwTTvMK007WXU74W2nrIUXjgZRCiyr8
	ZDgLf3CSVdKV8UTUfhoIJCPhtWkXt+diNrnOdGZ/33Tl3HfsLLImO8fyTA3KdLeB
	qw/AJbDZk+cn0Otpvkc1kuFzAmdGKQy61y9ZbdjiYvRPZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559gdne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:12:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ca3ef536ddso6602299485a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 11:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772046737; x=1772651537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg9srVmRK+oZJLWJq17xoEHmpPxqRtxhu3c9PChBOMk=;
        b=OIxt7NQiEcxBnvzPuX+d04UqICKMVDJRR1azYUpyuqDA8VQ0nqLouPkmuBlD7lr10A
         4M8syQClZN8tTjxVaYS0pETgCWkPZ47BQaQX2TaHsMuzmk1MpOp+Ipj7hZcysY2j17zU
         7friol3a3M5cbYkzA6mgHX96JA11Lt0+DB+3nDf2eJ9DhyHrd7QHVdP2SQ3riW6x5/44
         oDqJ1cCpyl/nwGm06etbRruWzZT7fp/7mzPhwj66FJamQg5QUzjti6SPc9PZIRIfrWIf
         1xYI3oCGAzy2eGi+amS6EQYn6ZZ+jsUHmwAEk/DAc1qB9jBp9S/fYQ6iKgHex4+DyqCv
         O/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046737; x=1772651537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lg9srVmRK+oZJLWJq17xoEHmpPxqRtxhu3c9PChBOMk=;
        b=MqKTaQO1XU6pZkNK2e4/+nHD3z24QEbYJrNQYMa/LtS0OO+oEi0w/hB6PYSsvZhhx5
         8oG5POSVFNY38fEbdZuXcesjFpMWbXfmVM+5GMRE+whi5RAoj6QEmXEyHCWAroR/O1Cw
         6+KZrtJngt835xaYX2jxX2URbKlGp691BimcNujQkL6R3wmyNsfu9dovu6d4R96nvS3V
         aEwZ+xo/F4zDQSZ+C0pcMTnYRcjUQ6E4x+92+Ox85a7DTiphXM3uM01xIl44ZAZRPOXP
         8Np26lQyLtqEztRnaCSlLJ+PRp3jrgwdQbDqaVxnW1+HSJBggGuoxZSj+RB2tskDirnc
         IVEg==
X-Forwarded-Encrypted: i=1; AJvYcCVBO/IsbdusRfLJJT1oEr5bkb48lPkFrQdeIrP+hc1F7QFrp+EF+Fm465yfV9ngIWsj85Dq/9Tz46VgFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDCEVVO+Qtfkaye+mPZGlyT0oZu7YVkSijCTvA9oMaoTVtUY+B
	HIEm0/mORIFpOLEPAqb8ZyUfhEXxKeTM+yECY1VRMI3p9wAEYWU/08yowazVRSCwTV7bj+hyAuX
	ddvfkI2cEp375TfO/wc+zLMKtM5y8uNR0EVgbkan09Bb3wbxAo4joTL8dT01DeYgOLw==
X-Gm-Gg: ATEYQzycfY/VPtFVrUFErr+yk2S4p0UuyMfpWSqlKun+dEWEV+DIlhL8pLid79LDQ0c
	1tgcGmj2SkBn/htAcv93VeKyIXM6njjlnZpnxTHvMMOAvQkhtYOA7ZTPjY45Aojucp/D+t2X/z5
	Pj5Jbcdbsw1HwhYQ9zTnsgvUvqFGx8PklPTFVV8TJ9wARBRKQQ1S7fET4ec1xafxwi8RgltUJ3A
	qnpiNMaK/d8tbwKl+YIyR/83Tv7hQhmHbbbrudfIPuQ8IlOYR1ul8K+m7dFJL6J36xnNi1sm0L5
	RiayEiH45Wry4orLYBqqeaiDGu0uzHZso7zl/FxKXgT2b+clBepx8+FfxL+NghTJHICrUpp2DlF
	BJdJimNGX0ImTG5w0vIdCsm69Y39fsfxvmx8ocMIa/Ly4Bh92MAxDqi9qloJczrDpYH7bMDpKhB
	yVwaDyjEGxmzDaG625n37ALKE7Pzy2bYI7f94=
X-Received: by 2002:a05:620a:440a:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8cb8c9cbf76mr2070541285a.5.1772046736852;
        Wed, 25 Feb 2026 11:12:16 -0800 (PST)
X-Received: by 2002:a05:620a:440a:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8cb8c9cbf76mr2070536685a.5.1772046736335;
        Wed, 25 Feb 2026 11:12:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7a1feb7sm30070291fa.29.2026.02.25.11.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:12:15 -0800 (PST)
Date: Wed, 25 Feb 2026 21:12:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
Message-ID: <vgcb4n6ciybslspdoa5fkvb5zwz7xon6tnxjmxxzkqutabgoq2@sgbxxtgdyeig>
References: <vU2QyEVqOu-D3eGp7BZFICUeauxL32bwWzeidOAijoeVaJTk8KcRVsaQQD4MdFQEcaQTZ5RkzRsz9-Lhl1qsqg==@protonmail.internalid>
 <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <172a9083-8cd6-428f-bd3d-d831e610b37b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172a9083-8cd6-428f-bd3d-d831e610b37b@linaro.org>
X-Proofpoint-ORIG-GUID: id-yYkme4yvNkGx0vQWPlBRnfZZAtBP2
X-Proofpoint-GUID: id-yYkme4yvNkGx0vQWPlBRnfZZAtBP2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4MCBTYWx0ZWRfXwFG3VONtTKuM
 jYfQbGrSXbZblvmorbVTVaSIVS4CvRg0SM2bW3U/9sP5rdppD4RQterAPn9kPpFeMzrv83aXqsR
 e08J2UX7ZAi3IHbhOAJChRsOqHi6Bnwdsr7PzIeYdgx+0NCPJzjem4AAHwIna88Y6Qj86i5cosD
 scJdC8uB0SXWWVagFXo0rNRtEhVu0FzdYRk+H7eQkW23Sh4ObKLl1P0ZJ8EFf7YZd9C8JDwsXjE
 PbQWuOOu/HAosuqMv19gYHG9xUs5h8HV1r0EMxMEMpUHtY2b1M+Cqqro+3GcNJ3LO4d31Gdz6mF
 6tAeMmdlT3XaNE2ZQLIVUcFrDCesXSVloEmagTPJEv9Ci4EJFxAy2/G7GK44xCzLFcDoFL2E0e4
 yFLrH7/F4x9dWc358XACRFGSCKjaMjU0e4UKArRYxuFEiKwzFZNM0iSUuHKIKvBzFe9LP5qzKSm
 TeKDgBNUxhIiBpCWHog==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=699f4992 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=DISFzqtZAAAA:8 a=jajewSGiAXp_dDDQNc8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250180
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53408-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tomeuvizoso.net:url,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A257919CA6D
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 01:42:19PM +0000, Bryan O'Donoghue wrote:
> On 23/02/2026 19:08, Ekansh Gupta wrote:
> > User-space staging branch
> > ============
> > https://github.com/qualcomm/fastrpc/tree/accel/staging
> 
> What would be really nice to see would be mesa integration allowing
> convergence of the xDSP/xPU accelerator space around something like a
> standard.

I'd say, writing Mesa compiler to build Hexagon code for Teflon frontend
would be a nice item. It would probably also allow us to use DSPs for
OpenCL acceleration. But, I'd say, it's a separate topic.

> 
> See: https://blog.tomeuvizoso.net/2025/07/rockchip-npu-update-6-we-are-in-mainline.html
> 
> ---
> bod

-- 
With best wishes
Dmitry

