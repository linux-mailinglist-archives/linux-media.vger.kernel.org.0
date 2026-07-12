Return-Path: <linux-media+bounces-67402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d/BFIFKGU2pjbgMAu9opvQ
	(envelope-from <linux-media+bounces-67402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 14:19:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E70207449DF
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 14:19:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cisodzbT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IJPq5er8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67402-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67402-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4052F300E61A
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 12:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04393A963B;
	Sun, 12 Jul 2026 12:19:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9DE36EA80
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 12:19:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858767; cv=none; b=DtrRHmlphEutJ7brLouna9gZnQSYsIhHo1tYGjo1rN/GpUPtqu2x6vQs3ORQ7Gzzd3Kza6GsYrIMGkzF7GeRxBXOaKSwqplcqo5YnOkJx14R1nxsuDhQcRHrmKHCzNRjPETa1qpDjR1V0TVOXqDQzqTvTfOd8ebJzhoqJYssIf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858767; c=relaxed/simple;
	bh=6IPk9HcggP18K+zdirzdUvoMGtt5SM+UOEmQBp+gdp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cB8c7FtdsIUthDKIUoij4ekvDfil9SpaFeWNE23oEBrTKHPpo6Ofhx2ZkalfIlBKT8x/h/BrzQ2xeUutPWmcr32ekUQyl+oPZmF9OjF49bJhgWP5lzDWHaKTjh24cU2NWNBxWr3caemLn3ISr8T0XhLuBHXDgdGd9WJ9p+dlLpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cisodzbT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJPq5er8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAcKCu2386750
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 12:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3P6NWxiezbjvCb/uAW4I0e+M
	ddZtoeR/tFnBxYO27XQ=; b=cisodzbTXyib9ov9XPV1PKyXlLMn4ror7HGrkXLz
	Gp4HczjK5LgAZlSRx3HN/tQYY8kjdngGkSPbCYHGJBBBzvJ9zrfGoSRQUMXqqgy4
	13zV7Wl+p6AIC2OnRjvW9ndK9FazOqIN1nbpJfDxd3XBg05GEMuuJeRxpcCf1JO2
	dn/Ozqy0ZmmTC27VDNhBZI5P+g9vaNUbGjSxEd/yIf6lNs5BAh/iXe0MIvr0OHI1
	VVkTuT0dtTADcK6LqtkAjyCoKyGkdtN1RlX0DlbI7aJyXUUpaylRa55HSdKw7jva
	b+uklOpbzmlFQtSX2LHhv3lumWJvPID67VwmIRlmqmfR7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8vapyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 12:19:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e820609d9so197858485a.2
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783858763; x=1784463563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3P6NWxiezbjvCb/uAW4I0e+MddZtoeR/tFnBxYO27XQ=;
        b=IJPq5er8m9IvFDJFlElotJ8RIlX2hqxScpDUc84CBq3QwGbPOcLPkYVhw08h+1NDOE
         WnCNZ2gpP7F1gQsCWnnusJNBDmBa8Jm+Qt8cjOyhRPewk3kQx2/HvJ/1+Nx0BDbJXKxU
         9OGG6CUoGG6fAhxxel7owBZM8leE/wQr2Eu6xR5SaPxiniy29sJiOZkgShGaqjx2f4hQ
         Y9VECQlcA0q4E0uahvvTcxVRWGJ+0hIFvI0iyVao89gMDy6NpoBQ5gC9yfkVG0S4J1Rf
         pgjpFxOmyzTuv2gk/uvneffuiJ//vHkLWIuJ4MIxWdaodE73/UDvckPyyUgBZtlN7jAH
         U10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783858763; x=1784463563;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3P6NWxiezbjvCb/uAW4I0e+MddZtoeR/tFnBxYO27XQ=;
        b=E3ISufW0iI+LiNnyoBrYiUbEQXmHrk9kOMkoA3mnU3gwNuluuhm1RdtSB9vk6HOScQ
         InVjB/COYUmfJMF21tUL2DvRsGVl2jWqJn/7+lXpbc7o+G4MWKzo0aZP76DZ9msD92KU
         eo5IXcEtguAayGmrhfCHfLv6K9JvsV3y7azTsaB0vPAmz7FNo74wfzHIBIXwmqzzJJF5
         QOejDNWLQDefbE1a08H+tWgI9FSSHm5C8CsJcAzdQhPldzege2FXBaXalvj72ElPS3Km
         k7mlVbK72sCailaUmcUrJCrotgE2EZ4pwrGbauyVw//LMZv5NEzaR8YsuXIwD9WkFz8o
         etyg==
X-Forwarded-Encrypted: i=1; AHgh+RqqoNb9C68gMJi/ucGsg2t+ykazPrw7c0vNpYdjN9wvqtgt0i70cz7gfS9xLUwWbE6Bf7mJpvZL6yEexg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuxVc5C6hoA5rjXBGVdc3h+dkjmklgQG87k4ozUw1g9wCq6xxw
	rSeP5oKrrJhSH8FdFx57C9whnAXyrKgFHl9tq8y7E47mFgzfjh50jpxUm7CX398H4rxXhh5lYxw
	niK3Xg0dhC6iHH/PNHx9keBdPronEPekKOm++h2ke5WWK9/0W7cMlEDpwtaqbAxQyVQ==
X-Gm-Gg: AfdE7clxtXlLzufHU8Htx9t5BmNIYSzZ1UXF2+vHinDAOzyRM+s1NW0D8HY3gXKSiox
	r4XlDTzZVKWTIGx+fU7ZY54eDckemhpZZbpQIvo5T8zE+hDATEg+NfqdY5KdvfJivxEHSQ5spF+
	etSFNLuoLDtiGKihdOi7EHuUDDtIGwq6Z1KFFmWEekjBQdfqNPFkmQbgvYPULvNfoavSptVeOzM
	EQRoPtXcMIGhiLZ/WWfk68bAL4n4kzsgCLNMUxjNrdcLGkYAjHdfLRVUh0T7i28rmunCcQyZGAL
	215y6dHNP/ygmFbQlU8OZHzoMjJKiqQOgHSraMCsLQLmNbql+80KhxsDgnLIONUC+EaF07XjS/N
	1Cfiv0/+ZUUwAacMzxdCDvP8n1/bK4frUZKs4g8mu35/DAVZckOuU3uMbMNVY/k7fnm8N1yh9sL
	HiRztJfpvNvoUK1L2PIK4Mbdos
X-Received: by 2002:a05:622a:429b:b0:51b:ec5a:ec0f with SMTP id d75a77b69052e-51cbf0d04d8mr51443411cf.27.1783858763403;
        Sun, 12 Jul 2026 05:19:23 -0700 (PDT)
X-Received: by 2002:a05:622a:429b:b0:51b:ec5a:ec0f with SMTP id d75a77b69052e-51cbf0d04d8mr51443151cf.27.1783858762897;
        Sun, 12 Jul 2026 05:19:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caaf40esm2023077e87.71.2026.07.12.05.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:19:20 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:19:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
Message-ID: <xrfd2dbhmpiy7ftpztcswba6iyzt3dsajqtr4fpq2iyn6tbeny@4wijspe7n2ig>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <63t_fLehIKEom4-JPN9kAGFEjUG4_yFoHMhB2aEAppwPHb2oPbK666eGkGgXxEAHRJnfTRRUwuf2EqNRYe_gjA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <5c8af0d5-2477-48ca-bd7c-0f2475a9dd62@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c8af0d5-2477-48ca-bd7c-0f2475a9dd62@kernel.org>
X-Proofpoint-ORIG-GUID: 0XfSb-9d1AikAvqPGtvyfElaBkFh4MuS
X-Proofpoint-GUID: 0XfSb-9d1AikAvqPGtvyfElaBkFh4MuS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEyOSBTYWx0ZWRfX7OwBAhAD/Bwl
 xViHVTRO8KzsMFF88kyeSSp8e6jpLi1IrTtZtoCW4w1Hl5CkvkicRFx3fO9WJTXeXMwr0Kp9zCS
 y4EeY+Ufq0KP33VhXjWzfzaas9k9GMc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEyOSBTYWx0ZWRfX4opmsSC+Otxk
 jHewB9qA/9Z8T8Vo3EHGojiGDid0kBQmtxca6+VkGN0BuKZ3kj2ecEPGQ9L+YyjrN53UFipRk4Q
 C0S8ZVA+Csb5tgPoPeGWTnSKoU/XflbiEtzgJIpc4Zg50b4VvyyOVIcOKgRrMUREH4Mz/FO00R1
 gy05DdhqwjiqzU9hHtmb4Y3nUFzzdhD3K6YxquB1joab3yEiRSnR5zOzUKg5G1bEE1cSBMSTNMD
 hsmdrekW1VqCQ944TLlqTvJV1ebAvxwlys1SZfFe6YOL3iXVnonUjJb1JmGneE+4t+avv+0D47i
 zWB99r7jg/0W9x8btlRq3JQpeKF39SamsyqFf9haH6pVml4pJnJ4LcWVl9HSFCtvRifEeqt2Gvf
 sTskgVEIPRMMMwMSQB6leHby6xly0Afczv97VmL0jPfGpuhvOxumHzbtVnxONGsQpCsprUNB4iL
 amBhPlaW6B8RGORmTmA==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a53864c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=XO5u-L0pxnv9NeBEmIYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-67402-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E70207449DF

On Fri, Jul 10, 2026 at 11:46:58PM +0100, Bryan O'Donoghue wrote:
> On 09/07/2026 13:35, Vikash Garodia wrote:
> > The Iris VPU has separate streams with different IOVA constraints. The
> > non-pixel stream must be limited to the 0-600 MB IOVA range, while the
> > pixel stream can use the full IOVA space.
> 
> 
> > Using a single set of IOMMU entries for the Iris node does not describe
> > these per-stream limits and can allow accesses outside the supported
> > range, which may lead to device crashes. One such issue was reported at:
> > https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> > 
> > Add non-pixel and pixel child nodes, move each stream ID to its
> > corresponding child node, and add a reserved IOVA range for the
> > non-pixel stream.
> > 
> > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> The thing of it is, this _is_ a bugfix - perhaps its not one that can be
> backported, actually scratch that, this isn't possible to land in -stable
> realistically.
> 
> So what is needed here is a strategy for fixing -stable.

I think, we need to start with defining, which platforms are affected.
sm8150+? SM8250+? SDM845+? MSM8996+?

> 
> That could be apply Daniel's patch and backport it with Fixes: - with
> mainline then say applying this change and reverting Daniel's patch
> 
> or
> 
> That could mean some other solution for -stable - up for debate - what's not
> up for debate is this series needs to _address_ what happens to stable for
> all of the target platforms - and then transition mainline to the new and
> shiny way.
> 
> That could mean
> 
> - Applying Daniel's fix with Fixes: and cc-stable
> - That patch needs to be extended to _each_ Iris platform containing
>   this bug... all of them I think.
> - Updating bindings
> - Updating DT with new method simultaneously reverting Daniel's fix
> 
> And I do mean doing that in one progressive series - a fixup for mainline
> alone isn't enough.

-- 
With best wishes
Dmitry

