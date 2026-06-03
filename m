Return-Path: <linux-media+bounces-63585-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lh94MCIcIGoTwAAAu9opvQ
	(envelope-from <linux-media+bounces-63585-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 14:20:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4815F6376FC
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 14:20:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Rr+24RCI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Gr37nqCb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63585-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63585-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0539334EE29E
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 12:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3084478E5E;
	Wed,  3 Jun 2026 12:10:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF415477E4C
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 12:10:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488630; cv=none; b=QoGLYPkraP3K0/hG5UVC37ucL2hdq7oZIFsNwfvLnR8s+F+B71MjDyb0kL5cBbIZFXOeVIWudidc31p8S/Z+MPLArlGnKBMQ23/nOq2r77jxsmStfhW7V1gZVM3RbGlc8lRf9bIXhw/4XqGpJc83VlYLLnirwQFaxFH9R2pxRxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488630; c=relaxed/simple;
	bh=i6M7Je3OtasBEUq9EoD9yneuR3KuxwI1TtYTZZtwof4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqutoGS7tnRkJ5l8pAW2UjHkTFKBnAAkVQjvMOYQXzSelmOzRBDL2vL3GYWdjuUUUsrayed+ZpO9+WgDw9ZiWS0tRCvn1JEzFJdW0GnKo/Z/RaFm2T5XbHzqKSo8Mk6F+DmrmWztymaQNiJa9eMrLP/DQtQwP0BtWj6LRCqJsxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rr+24RCI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gr37nqCb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536vGUx1755560
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 12:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ATJtFTYaLad3DCcw6EHaR6UDZL2D5tB2SW9NzD1xdM=; b=Rr+24RCInsAvsXQX
	3+KhmLczGOqk6E0Onhh0aAeyNo6M1cBzQlYFI/MP+d3lgTJ/XwUdNqkpFcRCk7M5
	D//ro5U4qxJ2nfNjzPIk8lBRl/0ZO4tV4hl5cuFxPCEUhL2ZjF0ISSJqRtdaRT3h
	rFFrB6Gp6FNN8xQn0UYYzikBH7r/2pJipxrm3ELlmufBMRwmaM2StXntP/u5wzqy
	2+wohFpm59HvzZacrSEGQBZwyo0naCYVUwgwjrBmcAal7az0fkd+z/wjmsQGl1iu
	zGQ1ok30yEBiDmHojrCaxFHQc/WFeG3CG6Y25lIVA41QTNb0mvE5OEzEYUVDQoL/
	Titn9A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejff019c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 12:10:27 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso2256467137.3
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 05:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780488627; x=1781093427; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ATJtFTYaLad3DCcw6EHaR6UDZL2D5tB2SW9NzD1xdM=;
        b=Gr37nqCbnouKUYovwURfvyK0L8+vzBz8YOVsh1bWYQ0LEhZXeu04dBMMw7byQdGQo/
         nkHhtDynvLvuZAuH1nqSiq2t3Q+UKdwOlXWvMK3so2XuoO50ybAXRyWgu7JXSt9wHRio
         gS4bzbVKmCTkCCUAkwGOm+Tbn5umQwflycybNRLVmN7YpjL1J/9WK+6hAVXvAAuhU+3g
         sOhIu5tCoVIu3OHgkFB+c+aKAUDtDxBL6IVPK8q2uTBK8Ocv/NOM5VkdY/SK5NfJEBg6
         qAt+VEM/H9UlnVpVCQ7nsclIfy1sXbv4oQBdYJQ2crLEAfyO7jb68wp7czQPAU+gvurl
         LGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488627; x=1781093427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ATJtFTYaLad3DCcw6EHaR6UDZL2D5tB2SW9NzD1xdM=;
        b=JV2W4N9hbjdHhWNiJJH3/oUDvUKmetRxUrK8lx1MOwpaTLEMZzwE1fXMXkAaOyM5kd
         6bK51fQw1kLx+DrGHuYKXY4K1LL7ZE7KN+Jgp6ayl3NaneMPTMT3gH6AZMO45GhBOAyg
         XcXSbxNx/Gkna3cM4eyfhdGrinuAplz+lc4Kiu3HxZxeGOymuHavAGu+XvhMp84rYoGj
         HsjyHwf85mFrqkIpWsRUGZ8r2jckoeFOewjVKXKGjMmkbTJgPVx7Q0BRUFsVkDg1fqgK
         8XqKSYKOLxlsdhO2wI1pJu/Wr75KtXO7MrjKa+iNpXaeSSiLhw6zRmU+1vzwT7a88a1e
         mFng==
X-Forwarded-Encrypted: i=1; AFNElJ/omuClRVm4XS6tJD3vs6tEXOoemFG2Wv+OeHNM8DJjZiGK8voI/NN0xiKO3vXF+3eC65wtpOh/G6PhxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXEEKU0BnZqJpNjjZ8wfK5ZNg8V0OrtZPfhULQjeT0LpRqKMw
	5aZghTvl/bR9txx05zm2fPZjXkJd8khQieWNgfHfXuIzJL2eB4tBnNsOPcnK6onhypmcCIbAQLM
	MHooCcrtESh2hIWmeASrSJcCbma7YbMQeI7/yDlerYCVzkjW2+xNRIcySjyEuTNdlPQ==
X-Gm-Gg: Acq92OEo4RoN6wcwNMjE8QSbhODj2AwqDVrj3dj4voyUad2v8AoZG/HMENc5EHXy/OR
	Zj6K6g2dPfLfeFHvwuUdXzEU2Ej8fD9nfKMlQ2k4D5B4jw0llDjVUHbD6Z2wOAKsqwqskmA+CFO
	J5xlHo2zIkcuSNgK1Cd/iVnLlLozA0zVt6dyQvArUf5vAilRBoBI0zTnHXXyrUs4f7PmWuR1WRi
	NEpPN6blCOywFx7llWsyI2WBzDalCC9h9DHsKv3samcRVcweI3/7Mezk/+LxGOAstyqHN7i+p5m
	mW26oAFiukE1z/Xrs2i5u+5XEVcgrzhr/RTlLWzJerGWV77+mbWE32MHV98jyMIfFFwNkOOxVWM
	V8FybAxLowow+9w/U0P+18TX+vzvDic7d5QP/Q2pyNBmaA5UHi3gU9e1tUJLqD2Ub4vP8D0lxzF
	cNMYNK/2urxn+99m0G9EYzSYldUoTN+W/VSMMeQPWdsSMF2Q==
X-Received: by 2002:a05:6102:32c4:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6ec4881b223mr1353318137.25.1780488627179;
        Wed, 03 Jun 2026 05:10:27 -0700 (PDT)
X-Received: by 2002:a05:6102:32c4:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6ec4881b223mr1353307137.25.1780488626732;
        Wed, 03 Jun 2026 05:10:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d503fsm8633201fa.34.2026.06.03.05.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:10:24 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:10:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
X-Proofpoint-GUID: C4qbs9AUWtMUWAbMWiE62tsBmGBYckRU
X-Proofpoint-ORIG-GUID: C4qbs9AUWtMUWAbMWiE62tsBmGBYckRU
X-Authority-Analysis: v=2.4 cv=LYwMLDfi c=1 sm=1 tr=0 ts=6a2019b3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=tcGPitenHjrlTjGvCv0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExNiBTYWx0ZWRfX/9W0kzX9O9hq
 8bYFNPlKn9migWxyIx1mUSeG9LOdbdOEFUiYPTZsqFUVkQ4UdmgbedaneimxI4dEXztJO5JdHNI
 cCeqIXdhSW/GH/5hzuvzxeQp1/oA+z1Se8KuZMOkOlKy2iw7c6bTM6O4cztRKDZaw4PhPbY/nxP
 xJvUoBTfm4IyN2heRSH/+Y5PqfuEo6VAmeTlPQe55j3rKeoG62L1rZtPiUMjUZ6/0i+iwGIm7M9
 C9mNauIGf5kFSQfRc3zNZQLy/EAhxRmDB3ESn/FGEqTLrWOfsZ/kZFBMcD/1mVIHin+adjEqm3D
 nrqFyQ7ALSJHmkBkh8H8KW+mFGWwo8reu24P8FQbAOv8ViBqNS2KRGFezvWGOeIg/LC4A4DDC0X
 P8pMvdsLd7SG65R2Gf0a8nbR98aSnkV+qkKqAq9mYCxII1mCh5LW3QlBFR3TA+5IvG1Lq25F7Ix
 nP1hAA6AXwfmhnfDTfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63585-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4815F6376FC

On Tue, Jun 02, 2026 at 11:22:41PM +0100, Bryan O'Donoghue wrote:
> On 02/06/2026 23:07, Vladimir Zapolskiy wrote:
> > > +    ret = fwnode_property_read_u32(ep, "clock-lanes", &clock_lane);
> > > +    if (ret) {
> > > +        clock_lane = CSI2_DEFAULT_CLK_LN;
> > > +        dev_info(dev, "Using default clock-lane %d\n",
> > > +             CSI2_DEFAULT_CLK_LN);
> > 
> > Why CSI2_DEFAULT_CLK_LN is set to 7, what does it mean and how is it used?
> > 
> > Since "7" is a meaningless number in the context, I believe it's
> > practically
> > not used at all, and if so, 'clock-lanes' property should be just removed.
> 
> Documentation shows clock lane at lane 7.
> 
> Truthfully it makes no sense that the clock lane would genuinely be locked
> to lane 7 but the documentation does seem to suggest it.
> 
> Yes in fact I agree. clock-lanes can be reintroduced if someone can show
> hardware that supports/depends on it.

Konrad and I checked, Hamoa supports using other lanes as a clock lane.

-- 
With best wishes
Dmitry

