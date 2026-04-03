Return-Path: <linux-media+bounces-58045-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKK0HGU40GmP4wYAu9opvQ
	(envelope-from <linux-media+bounces-58045-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 00:00:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D6A3989B1
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 00:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 766743043BFE
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 21:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0DA39023A;
	Fri,  3 Apr 2026 21:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pp3wrIjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3i0mY3Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEB7361640
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 21:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775253553; cv=none; b=IAS+eO+lzrFdhynwZuiz7RVn70Z7y9sB6E1zA2lfMsglsSVqQtzDa9Eghu124N3pH7BH8vbloY7iun4lsA5Ul9gGTalGCfPusYIOC3OU094vKaur8Bb9MRFOPs9gojiujpJAZdP4evUT9NM8qfxda0IuqJOu8K9Q7eBZ051XkIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775253553; c=relaxed/simple;
	bh=rqB937ggnhxRSdJcUTbnBDypko99HI/LIAG4qBwWDzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGXlkEVzvPaYhOYp78HYaCHHcLSiPalYBihei66AcqkNsA6fh5CHoT2+giIrFJ/XJq9U/91fJSVvDx2uPnFFpDFG9iVU4pFndXCWnVB2yZ9rzN8xcA3WoZwdWfX7UpndIA/OBGq6m53zcsnD4r55p8T6chlrG8FeSlRE9C1AvaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pp3wrIjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3i0mY3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633KXbEB1453172
	for <linux-media@vger.kernel.org>; Fri, 3 Apr 2026 21:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GgilH/CYlNPEdmGfxfOBQVIc
	9G2hmzaeFbna/a1eu+4=; b=pp3wrIjFo8OXhOX4fzWTgm2KCd8peDxDdfBUA2ff
	26lt9OV4smDsm8OpqItBds3aCS8VTSJEqRs7oW+baLWKyyZ844fWb4htxjt6SWq/
	XmZUdjy/tRg/HPSwGEG0BAzU66W5SKisMWB789KVNWxFVNuJ5Q3L68jyrCz1Gghq
	VZKdYbHXAhaKJVEavycJS3H4wdUZw4u5VXyKp7XDViAE1Yr6ssE57V15Om6Posym
	HBojY7gzgTG9NnszqWs6tIPhf03S/X5whKqRhv7J783xvh/SOOXhbvtEC0AufINi
	1HMYRcp2Ey/RQ4D4e2PMghAnWiVsAjYzVz6eqd1den3Xxw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dacam9pbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 21:59:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so72218831cf.1
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 14:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775253550; x=1775858350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GgilH/CYlNPEdmGfxfOBQVIc9G2hmzaeFbna/a1eu+4=;
        b=B3i0mY3QaIjARKiHOME9VA2iaBQY92mGNBB1nqmtLYOU0YL7Aj4GWP8j1wwjdn48D2
         pYKrwV8FvKB4H/jDV+WhQJGWdQvPQXzj3YTECGqQ1xWrpd2I0jZ8OQLky7kaDNEKO0LK
         no9eITAZU2oYmQ8jhjcBK0WDwxLkZj6P9Utn0LBebQdzqIP1Vc70H64mfNBBTd335tOa
         tM4e/T09Q8n/QypBI2fHcTZXWCtvEySis4rswi5/BdnKHZYIhRaIxQHTrFz0zNvRLIKZ
         puKWOFdWrKlVH9VE1eNePaq6IGVdcze7B4KtMWVcPDYaPVlAr1qsQAF5/Nf+NSSxeBMC
         nuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775253550; x=1775858350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgilH/CYlNPEdmGfxfOBQVIc9G2hmzaeFbna/a1eu+4=;
        b=YxY5CffGvdpA7EqQ4nIMKCQEOqTcsY5vzIGqV0vFITr5OyWj7SBJ0CEng/7LlBC/Ns
         giFLvg3m4qFBqCRcLKrcSj/sJF27LU6NiwCp19WXrCmlUWyk/HqGl/017nw0ayqs3Of7
         lGdzDuNcpacPryfGEaGW+/K9+GFpSGUjzHizjiEqrwBorTOQXtxBWTsPYFmLzX6vq1C3
         jTAfoQodOfpLwdrAwNfi9Bncxr4pEug5ZzgVuSRpQqQvx2ud5KdjRaK2wyuOSJSL0P6E
         e7EEZbDJ7T7cSliHwIO38XwwmWMR4++Nkr/09xHXejRtOEHyQKqo5/AB6R3cSes8COZr
         D4Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWOumaoK1OBfjQ0bOapwkZF+B+O1mtIbFnfRUEY6Q6lVk0isqyGSd22QidOufqaMk3q8btBzMFaaC7uiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuzHbHQ8H1pr8xAGARehQhQTdbF3UGcEfDZmWUcrnHiiNKN/U9
	MAudMYqohOP7NZ2Y4irW94yrGhNYDRwWjYIFkT5Jzg8hdMOa8/rpaxdPtWRTDS1nylauR+8jygW
	37Egj5C6NKK64hs15bVpMup88ksqSMOKitVQkIetPP09wnhOemrQjTuTtwwCJFUYhGQ==
X-Gm-Gg: ATEYQzztlTSbbxXla5nmqb6nPYXwSb27X2KJ0Nt3j0D0h/MlbdgrOcipguceYCN6Pbi
	FtSW5iRC8JSViV7CzlntXkO02p6L95ZRoBG65Y8MC4grTbNi+2KQKTuv+ufHokrtpog+vmFPl2Q
	H1PCmWbwvfiHtlTZLHg0hWn/fsi1RD9DIzYLajIFqA9a0u1dpG8Vroq2LkQZEi67okt09T3yQ1Z
	zFR6Betfl3FYN9qjGK7XYfH1VYYS3VJDOHaC+Ab0/SGHTFDZ54kkzHi5cuJ/FBln8X/zCrNsg4W
	5YIMy+MXEqvr3gjMKLlN8VYSkg4qCEDLQxt85nbNzSVoaWTFDJ8aqsBwvWIFg8IVYlRDF37vGKf
	epZlbDd7yA1/a6dH4t9KAn+hBySmc3xACvpb25PNC+1/0ysDtazXDy1+lBrvVbIrQMbulHGmpg3
	2qJkVPX0kpJvlcX7Dy2eHWFYJ2ozoPSiL5O9s=
X-Received: by 2002:ac8:5703:0:b0:50b:4984:148b with SMTP id d75a77b69052e-50d62e6a503mr60498261cf.64.1775253550470;
        Fri, 03 Apr 2026 14:59:10 -0700 (PDT)
X-Received: by 2002:ac8:5703:0:b0:50b:4984:148b with SMTP id d75a77b69052e-50d62e6a503mr60498001cf.64.1775253550027;
        Fri, 03 Apr 2026 14:59:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd6799sm1695259e87.81.2026.04.03.14.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:59:08 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:59:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Steev Klimaszewski <threeway@gmail.com>
Cc: vikash.garodia@oss.qualcomm.com, abhinav.kumar@linux.dev,
        andersson@kernel.org, bod@kernel.org, bryan.odonoghue@linaro.org,
        conor+dt@kernel.org, david@ixit.cz, devicetree@vger.kernel.org,
        dikshita.agarwal@oss.qualcomm.com, johan+linaro@kernel.org,
        konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, robh@kernel.org, stanimir.varbanov@linaro.org
Subject: Re: media: iris: enable SM8350 and SC8280XP support
Message-ID: <uiv4w3eptbniohzanp753f3wtwt4efjxupdro7kom2kgycco7f@nks5b4ctxty7>
References: <a1dcd0e3-db1c-4752-9473-7934e69198a3@oss.qualcomm.com>
 <20260403214140.7307-1-threeway@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403214140.7307-1-threeway@gmail.com>
X-Proofpoint-GUID: 0g9H1C6xRLrXHslc1HWKditJKf_h3Vs_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NiBTYWx0ZWRfX+mIvyc2JxSdc
 7xBElx0Dq5d5wo5fHf4rOrxsXxgL4vLsEpXiBwci4/g2vOIr3+3r+diva9gNbODx2eeGPczdWVr
 GnHcjd7wH7Es9cQ+Nk/CBhA4Jszv6kr/2aiEpUMjLQ5ac/U+ORpOlLfNPqOqruHZaC7tyQhq1YL
 NQqHw9PVuXI8gfVsS5lSmqyGsdMyM0Uf2ZFkbMaTvPsf7WZL1ah6aYKSlu9RRFTlZC1yu5pucC9
 cQmfgItKjWgQXf5LHlnMwqrD6BbvtTZzYIMa3tRLBhAXRQkua8Aa9T4SYn3sNrcW+eBgfjcdcu8
 f253bT7+8ndZxmPH3txH5LeLuvXYq7qC3Bv1nZKBLVLu0IwBYgXkihO1RUw6XPDuTbmrP3R3g+y
 6Wcm0O9nCydNKdAwpVyKf+lKlyrkSnYD1ett3Yzoad5i0OpCT3qdK2uQBkA7N3HRajwg8sfSNsG
 t8uBsdLXg3x9s00fSLg==
X-Proofpoint-ORIG-GUID: 0g9H1C6xRLrXHslc1HWKditJKf_h3Vs_
X-Authority-Analysis: v=2.4 cv=ULXQ3Sfy c=1 sm=1 tr=0 ts=69d0382e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=mZ2gADCCxg8TzUEfTn8A:9
 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030196
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58045-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6D6A3989B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 04:41:39PM -0500, Steev Klimaszewski wrote:
> Hi Vikash,
> 
> >> This is not just with totem, showtime shows the same issue.  If I let the video
> >> play, it plays just fine, however, if I attempt to skip forward, back, or even
> >> play *after* the video has played, then I see the smmu fault
> >>
> >>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd51e3e00, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
> 
> > please log the info about which "iova=0xd51e3e00" buffer is faulting in
> > this case
> 
> I will include the diff that I applied against my kernel, in case this isn't the
> correct information, but I get the following output in EL2:


But these logs don't capture, which buffers are causing the IOMMU error.


-- 
With best wishes
Dmitry

