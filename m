Return-Path: <linux-media+bounces-61508-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EBXO7XMBGrMPAIAu9opvQ
	(envelope-from <linux-media+bounces-61508-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:10:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE80539A3D
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D655B302772E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4283B103B;
	Wed, 13 May 2026 19:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPl6PecK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zoxd/40L"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CAA3AEF3E
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699278; cv=none; b=b9pR+Nyg31J3eD3HgQe3AgBRF8qkN2h0X3intHH6QZqZx05JNCnEe/fNRKEomd4CJg5aexMhvpXLKamIqVRjVLYsNf+7riy/6FbFkj+F8/2YlQVJDtOyAu1eLLBvvxpgp0+G0lRGW8olKEIQPNbBdGNVNiVKjXgnDk3kZ0qkGaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699278; c=relaxed/simple;
	bh=rP5DMFJrroN5qwFkuBbgahMxhxpOb/p8Gem6JT5QYAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVtrAa1TsxzqmeVkztdt2X3qGsSQ2pCGDmZzuWYgtlUH41XpVbSLDX3bYEJN//t3UEUUeE+a2hS/abBBM8w/zSYqMnieg4s0lwva5f3IgND02dHPPxhgVm4NyZ+MfEGO0ScqPj6qc+S3Vd+A4bcWMi8I66mLSERNLsBCG67DcB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPl6PecK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zoxd/40L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFdwwu1243051
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/9qkEUAUseFc28c2cInwM3q7BXTfGwgQErHvPZw8/HM=; b=dPl6PecKBMqiBLpG
	MP6QcHNgD04r4Ws0rbnogeVB5TDymGe1ND+pLxzdwT3UZm35xL+mo/sCWpMyGTqb
	BY0zsY7epr7dmw98LCF5I0W/6Ij7jEFN/3LepYISW/TbIt/IbMUUfm0NmIIUXSEl
	z9EEqr6aV7jXNn18QYlxnt+kos6OSIHNGYCW635E4KcfJwbbGfyYMrFsmwmoyGrx
	87UzHzEwQgZB4zeb6+GLEdfGs+3TYsrsuwyhjALSh09so0SJplQfZrZY78p9LL8M
	qUKwCKpNW4zVJHAWk1tjqoL7E/tsQyIqh0fyMYZNhzEJi0SZCt0eu6hWkXLlVehB
	AunEDQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4trvh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:07:56 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95d393057f4so10208428241.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778699276; x=1779304076; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/9qkEUAUseFc28c2cInwM3q7BXTfGwgQErHvPZw8/HM=;
        b=Zoxd/40Le0+XII0kOFmRPlZxSg3rQg4+nWe8qq/2wj6ulkX5LG7yRf9rqjp9bpO6BM
         3jFKM1pBKvBeL7djUIDWdXN7s4Qx6e0PEtS5q5zkuj2R3I3o99uHTtLOAci2hZpQ5OzT
         Ibpdm2u3Vd30KETOoWHsb75l7D2XXULuMSKxB2RdJjp4bmafvkZZvxPPERyaxKD43LOc
         tSy6F0vPx7HdNsA7yGQd9u0yZkJmutM5Y1v4dFQYeqyJaB0VEIWbhT29trkRNsws/cWy
         nVEbdtcZBfh5Wv8MpUygJ2sx3xyUHLp6c23Y9qbI65BGAGAz6Ue7qt18d/BM2t7VjV+3
         aCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778699276; x=1779304076;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9qkEUAUseFc28c2cInwM3q7BXTfGwgQErHvPZw8/HM=;
        b=JHMZ5JqWwzxWPfVyQxIPDxOeKg57ZeDYOsB9uAuEzkAzuAAdtyfS+/+kCfqeKeS9xz
         C/zq5PL95Ha1A7QWHUGUlT0lYLzkJ4HgGIdnp/MXEJcJLzLpNE0p+VCUHa59YTB8Fsrj
         Kl+jV9VTjdu6YcUNT0gzIDkLOXwTs9KxmsDQKa70qSlrhPKevUZmay2w1LyecEReASJo
         x+eB/MicI2lmeBOme0spqHyryemn3Qz4lzNYjx7+M/+Kigr49rUIk1QevV/cpj4YyzPz
         A3FLQRL3fIWK4oY5s9P54Fmc3pmE1JxEfBOQP8JLuBIIK2Dav/cw6mpMm3BE1OLTlVM0
         ZBJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wLK9zmX3j7uJgHBjrOYhk1arO3yPsspV+0gRAMFedume2A5Ijic7irZklohIO39NsE/KdnAQhwlzIaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOMLhdRXba+av6MOdPGAoOAKy+UxdxCTsQZPLUHMeHxGrEubB0
	xM8qvCGQVDpc7X2Km0FUe4UsOCot4IiaUYc45SWfhaflYq3kL1dssHBt1swfToZwKktFa/i3nbU
	0EUSviYpSGmNQSTNZZ3Z1roWOZhDDoeITPcQFgsTwZpp1dM3egzUcwuJzJTMSt7obbg==
X-Gm-Gg: Acq92OGRzSFs/dncm9eDLDt2wgdbxjN+LlTQs7sF6wG2BoVpXXs0p8qoNH5XXDeogGL
	Sp7JJt7ygnbnArsVAnA859WMCvWASS+bzl9KT+o2fw2GI4RIw0Qq4gtFFmzIYezl0M0ShTHbppZ
	AcT0iSuHSCzHwK8+uER4O3uYFy9BZWVjAUff0v2MZvnSOw0zifdCSVq4LPNo6isMN96iWZUmiIn
	2la1xyzsNk3UliA6cV378/4J5+ntkk6XSRIbv2nI4KVnjo98tJKVnqSocNrPvrLSS8tiz5FRSSm
	/jN39ibcXMDbyW18L/HTkDLWRyT/EuAJ8YqyEucJ/MzcKrLyrd0LfQSX++qEprZLcCrZIm94kR4
	ZphNTzXj6yDqhNB6n2Nh4wgBWhlr+5x4gQlRDHQI3WqUfdKRl6dYhHHlAm++XOz4WKlIbkBvwYZ
	cumvkm/d+L4sll2z2bLuigCI/PFDs/0nRlkfs=
X-Received: by 2002:a05:6102:549f:b0:635:420c:9b00 with SMTP id ada2fe7eead31-63773f151bamr2884978137.10.1778699275525;
        Wed, 13 May 2026 12:07:55 -0700 (PDT)
X-Received: by 2002:a05:6102:549f:b0:635:420c:9b00 with SMTP id ada2fe7eead31-63773f151bamr2884937137.10.1778699275067;
        Wed, 13 May 2026 12:07:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8b6b2e8d9sm3394683e87.51.2026.05.13.12.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 12:07:53 -0700 (PDT)
Date: Wed, 13 May 2026 22:07:52 +0300
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
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 04/14] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
Message-ID: <6xq6fchqaiaexdqygrbnjyyayavj5qbllufevkaodgayfq4qdt@tuc6qgci2et5>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-4-7fbb340c5dbd@oss.qualcomm.com>
 <35zfskmyogpazxy7wsw2jg36fvpnnc7hng23j4heq2jy5ookai@q7d2vl7nn7ck>
 <fc188af5-ec7e-bebb-2654-62312d79e60f@oss.qualcomm.com>
 <kdbo5d2wibjfnchfw7xn3wcgcp5r6ff7pw3ibkpbqzjgfhkovp@v4er4hdiytks>
 <f1fe6e8c-9a16-3103-fbe8-de772bc4728a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1fe6e8c-9a16-3103-fbe8-de772bc4728a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a04cc0c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YeIv4oy5NbOGZ5o2UJYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4OSBTYWx0ZWRfX+YM/nVKGqGxq
 0O10EWQk4jHy8H3EUdJGW5D/WcAtTMFoGkyph/ngTTc+ENrSwv36UzdjtgTNC+NjvYK7egEseOB
 woBMnPY6YuimReId3Y9tyzR73HeKZE+imo3GFFbUIe4ojJg/B3ra77BtiG2ildIdXleeNAlswSt
 dmHyG7wS4sLwtAAeHWUWsBT+i6faJfFzj3hYQhWfG3WD5vJzECX8d39yd1qk5JNAlIq0lmByBLG
 kHK1o/iUAxkSH/pVpxczHNagGXzWyuyQi32rA4QKkAUOU12FCw3KB/lYqTSGNxv07S8KVErG54T
 8MMuijvXYxO5DCp74FhgATw+H1+NJraI4aLLODCXdv99bCQne6xYu3q1dDfRCkpxEVYJs0Or56S
 kR0C8CQZw3vKUHbsZYJDHZ8nLjfUidNKa2LlJQ8nI8nmNC3OnqDy/SVBSWcRsSmb6CYCJ+a3rge
 Ad/yFLXzxKQLFxJG7aA==
X-Proofpoint-ORIG-GUID: Op7HE3wdwaRL9rVrcIbfHRjgzafw3h8E
X-Proofpoint-GUID: Op7HE3wdwaRL9rVrcIbfHRjgzafw3h8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130189
X-Rspamd-Queue-Id: 6EE80539A3D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61508-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 12:24:16AM +0530, Vishnu Reddy wrote:
> 
> On 5/13/2026 6:59 PM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 10:34:15PM +0530, Vishnu Reddy wrote:
> >> On 5/9/2026 12:52 AM, Dmitry Baryshkov wrote:
> >>> On Sat, May 09, 2026 at 12:29:53AM +0530, Vishnu Reddy wrote:
> >>>> The common schema defines minItems and maxItems for clocks, power-domains,
> >>>> and iommus. This suggests that the number of these resources can vary,
> >>>> while in reality they are fixed constraints per platform.
> >>> It really doesn't. It provides common definitions, while individual
> >>> platform schemas tighten those.
> >> If a new platform requires more resources than the current maxItems listed in
> >> the common-schema (e.g.,Glymur due to its dual vcodec core design), we need
> >> to keep bumping maxItems in the common schema every time a new platform exceeds
> >> the previous limit. That makes the common schema a moving target driven by
> >> platform specific.
> >>
> >> I am fine with increasing maxItems in the common schema instead of removing.
> >> I can set it to a reasonable value (for example, up to 20) so that it
> >> accommodates future platforms without frequent changes. Anyway, each platform
> >> schema must define fixed constraints, since clocks and power-domains are
> >> mandatory per platform.
> >>
> >> Could you please let me know which one you would prefer going forward?
> > Just touch venus-common when new platform requires bigger lists.
> 
> In the v3 series, I followed same approach — bumping maxItems in venus-common
> schema to accommodate the Glymur platform while keeping fixed constraints in
> the Glymur-specific schema:
> https://lore.kernel.org/all/20260428-glymur-v3-2-8f28930f47d3@oss.qualcomm.com/
> 
> I'm fine with bumping it only when a new platform requires it.
> However, I'd like to understand your preference a bit more:
> 
> Would you prefer setting it to a slightly larger value (e.g., ~20) upfront, so
> that it accommodates a few future platforms without needing frequent changes to
> the common schema?
> Or
> would you rather we bump it conservatively each time a new platform exceeds the
> current limit?
> 
> I'm fine with either way — just wanted to align on the preferred approach before
> the next revision.

The latter one is the most typical approach.

> 
> >>>> Remove these constraints from the common schema. Each platform specific
> >>>> schema already defines its own exact fixed constraints for these
> >>>> properties. Additionally, remove these from the required list and update
> >>>> all schemas that reference this common schema.
> >>>>
> >>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >>>> @@ -64,10 +44,7 @@ properties:
> >>>>  
> >>>>  required:
> >>>>    - reg
> >>>> -  - clocks
> >>>> -  - clock-names
> >>>>    - interrupts
> >>>>    - memory-region
> >>>> -  - power-domains
> >>> Do we expect the platforms with Venus / Iris not having either clocks or
> >>> power domains.
> >> All Venus / Iris platforms have clocks and power-domains. These removed from here
> >> and added in each platform schema.
> > This is a sign that this is wrong.
> >
> >>>>  
> >>>>  additionalProperties: true
> >>>>
> >>>> -- 
> >>>> 2.34.1
> >>>>

-- 
With best wishes
Dmitry

