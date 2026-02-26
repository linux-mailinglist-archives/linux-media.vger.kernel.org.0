Return-Path: <linux-media+bounces-53478-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJhrNpEjoGkDfwQAu9opvQ
	(envelope-from <linux-media+bounces-53478-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:42:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4237E1A4715
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3020C304DCAD
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234FF3A963A;
	Thu, 26 Feb 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WypjpM3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CdwqE9af"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8034F3A7F4C
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102463; cv=none; b=nWGldo9w/S6HuEXfM01oJ8VFNPLO8YCm1KDNlRVT7kct/Sz+zEmzsoIYIsIT5fM2IrUSqFbRQoRyeWmPBoDnmd0pO4WuUro0oYvTyuFOKsQcKttTmPLwgYdTcgKLUnEdtv4DhWzksruyJYmhszQyCm9V8GpY7oSTW3W0SwwJhiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102463; c=relaxed/simple;
	bh=k7gwFyjHyDt0v2nV5FWKyU+Y1BWj3xUmYVNgPHR+3ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4WEsmSSXGiUFa3hAUiBd1keto1WrxNGNRvOHR7TP44WQVX0Av5GhPk1N/JVw7z5neU1n2705u06qtkGGeB2f3HyBDx1WHlsDHtOrgMagBKmBrnf6VdS2XckMkl0GwtCXiTBu9oT4ifFncD6du4Ayq7Hl9fDVCL4TvQhIPvBzHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WypjpM3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CdwqE9af; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAL6Rv3754978
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1E9RufUX3shLLcaPDd5LsIzNYiU7fm81dIU5jRV50k=; b=WypjpM3VcjZ97BZu
	qXwe1eFwquO/Kehn/2U8CmFY/71TbMBD9I+9+7zgSffzCDuEUUpbC2ZzVOWUjzaI
	ayiA307o3J73wRIdfFpNGQWnFmWBgTbZqgWUrai50hjc84Hh0UC+pYZGhMoD2aMD
	2af1d8bCQ+0G9dPFxP2vyK7+fmcYK82ZNnK35z6z7FSB9UZExkf2v+oDHXJNEIrV
	1bIdh56/txnd+RKDoc0fMWHw8GL32GjpQhSmkLkP7pVthaScy1GilpEZ4TduYb78
	ByMDp8fWm9d+LczUN4OrJUUDJgvvPuXnpZoqHxrMyrSyIj9acoPXkzzU+VnZqRFU
	qGQueQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyv9kxps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:41:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c711251ac5so482391885a.1
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 02:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772102461; x=1772707261; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c1E9RufUX3shLLcaPDd5LsIzNYiU7fm81dIU5jRV50k=;
        b=CdwqE9afbK93hd6YeV5eoE3tWRswvUk65MNLG5T3SBIQTZI4VDAX60lH8ScboFOmse
         NuU+Q5Cr/QSk25I4uJIWfG49uBn9s4LT92qL0ovjOVsPl33w2+OiQlDvCqo+FruMeYkN
         WwcC19jPGDxIJEnUjLwa2YrJMobrPCL2P9kLvBxpY4UJb9IpnFIeyo7xMfFKgmHTPqjJ
         Kvk9x607Fh2OdzuUMO9pt0DWEbP35DhxTkwdJL/PijV/b2RNCg7g/h/f8TQ7qYRpBNpm
         XKpRZyLht6FMqc+QH0faVrcrrtueUEV5upApF4WiSurXC4gcWeuNN7RN5DCYaXpkbtGW
         V+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772102461; x=1772707261;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1E9RufUX3shLLcaPDd5LsIzNYiU7fm81dIU5jRV50k=;
        b=UUji0ijb0qdXEyzKGhgupR6wJQYzIb1YGxqOvbARlc/THNSZdnJHOaZGr+hK7j0l1l
         1+S6B678SUVTPH6prIBTAtP9tGFodvuKYW7vnaFwpRw1rsZTPYNCZpc7dU6AA0Th24nm
         xBVn9M4UGj73mnYR91KYszq6aLIEhge6aVq/GeP/VYdk50M2RprIJerepWyb3N9R+37O
         zQCHqLCKZZBDVBhOre7D/d9Ixf2woE96OtrM3J97zYu3B9ODx7+zY7PNkKIJF48BTIug
         JbReqdzkUrsxnc5DL+A80n3lZ07JlTy7eu+nrT8zeyMiLiZdy1X/tdMFYCn2pycpPkIU
         S08g==
X-Forwarded-Encrypted: i=1; AJvYcCWnsFrNBzbGZh2ktP9gW2xTkKqi4Glvc2HpmS6e5ut8jSbtW1wPNnWphYe/UT3gAQm0EFk7MOR/y+Q6lA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8iyp3dBk+Pikolk2nOtQ933Azf2VkNls0g26NOIxkqcFFOyiD
	2+A1eOgTV6fjABCYlkH2slFlit4Hey49hojY/xdSW7HMz6Jl20wkXHkqgC0wog9q+MkoXwmU54B
	IFSDUPk4H/VYduWy4uNhQYxxOnO+dW42gerLyCtN1Xmhw5KqwMgZzKp8Z9l0zngbTZg==
X-Gm-Gg: ATEYQzzxVJbS8oivIHvQXT1JuXHg/lFM9okJ185xNJ5Yer97KMbqcr3swKXRhbWJ5o8
	3nyHUzCv4K39AvvliU/NxZ0C45E27SFlcelNJuWxlGeomweVI6FX68yrdv9YHDVU2Ck5RE71XLm
	BT1ztx3D3mh2ki/m43Tw/qgj82y7lAEbaV9bLDwbcXMZFPJQcjqdRZGoA4XDjJGjYdCpUvqVPdU
	3nZLoWjMBMxA4+CTxdkaax4J/luzcPLcZ6Ijw4rvswXNKLQd6555zdHXaTdg1eJnSGsljqtjPhn
	GtLo9VIAnkMkBG95KCKIxB1y4UYeiCg2XIAInX/2namf38ydJF8dFfQ4f0TBMGLJ3EFNHBDLOHw
	uKSnCBeQg6WTpE7GaG4NAfVD1qPHVy7efWhzxn5BiYIzP2FvXpBlYNm/Eb/wNOoa9T9vuVWh7RL
	owZcKu6yAJnVdhf+p5BiWDNd7JnwOkjOU4608=
X-Received: by 2002:a05:620a:44d2:b0:8cb:4f63:dac9 with SMTP id af79cd13be357-8cb8c9cdc4bmr2602621885a.17.1772102460850;
        Thu, 26 Feb 2026 02:41:00 -0800 (PST)
X-Received: by 2002:a05:620a:44d2:b0:8cb:4f63:dac9 with SMTP id af79cd13be357-8cb8c9cdc4bmr2602619385a.17.1772102460331;
        Thu, 26 Feb 2026 02:41:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109e050c9sm688317e87.57.2026.02.26.02.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:40:59 -0800 (PST)
Date: Thu, 26 Feb 2026 12:40:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v2 2/5] media: camss: csid-340: Add VC-to-interface
 mapping
Message-ID: <trtkruw4g3bn4sltdj3foq6xqxjxvgejnzyn7cbcour7a4zls4@kwexergrb4r2>
References: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
 <20260225150122.766220-3-loic.poulain@oss.qualcomm.com>
 <6js2jmzcbo2dmt3g2griookjt7kkrbukukzkv6ft6i6357g2x4@trpobakpysw5>
 <CAFEp6-3KA5tztKscsaHn3=MVKfwC=gbCMNgZhi7SasxHXxttYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-3KA5tztKscsaHn3=MVKfwC=gbCMNgZhi7SasxHXxttYg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: vybdIqZUMO9vDI82oPvXrmzzLgy54fSK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA5NiBTYWx0ZWRfXwD0pVG2QDdoK
 eVe+zCEn0CqkJqkeTQ3aLxgCuvrXz16bqj8NlYrnH8yNVwMjjQaCkD0zGEQiXtMqB17WuCGrr6P
 mpRf7M20Xw8rNArYBdQeEeYQ34fVDKYbP25lEiTLMaL15c0+pk0ytbKFVFFMOYy5/oRYzatFTQ2
 ZoiPLP1de0k5qMBySO6bMavp9WFbqUxMuUW+1dHHVVr5pmmFM90oeCK67TdFNKG+u+jONVEZyls
 VKw335mV+eTOgXQEQPUmwAouLPVUgytQYAWgTsu84GjQEqSmk0W9TkcZ+gtM3Z5uQGoVnqXtE/M
 0l0/hi44ds2IrBxoTmsrl/V0t+UZhwuFni0JwZieqKWeVGlasoYZBXvlonzETIRFcF3xAeYImXb
 Rg5GcY4YK25KZJ0ito/LAzptgeWi9PyS0p5+8VDe5Z8KF6SoaI9LRx2+1PuKq9l0e7EzgaPkYaW
 AKRPn4rkCPMIzHk0m2g==
X-Authority-Analysis: v=2.4 cv=GZwaXAXL c=1 sm=1 tr=0 ts=69a0233d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kRf1_TII1K2sScEP2dYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: vybdIqZUMO9vDI82oPvXrmzzLgy54fSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-53478-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4237E1A4715
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:15:16AM +0100, Loic Poulain wrote:
> Hi Dmitry,
> 
> On Thu, Feb 26, 2026 at 1:16 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Wed, Feb 25, 2026 at 04:01:19PM +0100, Loic Poulain wrote:
> > > The CSID‑340 block uses different register offsets for the PIX and RDI
> >
> > So, what is PIX? I asked that question at v1.
> 
> I might be misunderstanding your point here, but yes you did ask this
> in the v1 review, and I updated both the cover letter and the
> subsequent commit messages in the series (mainly in 5/5) to clarify
> what the PIX interface is. If this is still unclear, I’m happy to
> expand the explanation further or add more context in this specific
> commit message.

I was really looking for something like (pure examples) 'like RDI, PIX
captures raw data in Bayer format, also providing image statisics: max,
min and average brightness' or 'unlike RDI, PIX captures debayered
images, also providing image statistics: average brightness, max and min
R, G and B values'.

Also note, this is patch 2. It lands before patch 5. So I'd suggest
having that definition in this patch rather than the final patch for the
series.

-- 
With best wishes
Dmitry

